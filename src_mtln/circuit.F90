module circuit_mod

    use ngspice_interface_mod
    use mtln_types_mod, only: node_source_t, SOURCE_TYPE_CURRENT, SOURCE_TYPE_VOLTAGE
    implicit none

    type string_t
        character(len=256) :: name
        integer :: length
    end type string_t

    type source_t
        logical :: has_source = .false.
        real, dimension(:), allocatable :: time
        real, dimension(:), allocatable :: value
        integer :: source_type
    contains 
        procedure :: interpolate
    end type

    type VI_t
        real :: voltage
        real :: current
        real :: time
    end type

    type nodes_t
        type(VI_T), allocatable :: values(:)
        type(source_t), allocatable :: sources(:)
        type(string_t), allocatable :: names(:)
    end type nodes_t

    type, public :: circuit_t
        character (len=:), allocatable :: name
        real :: time = 0.0, dt = 0.0
        logical :: errorFlag = .false.
        type(nodes_t) :: nodes, saved_nodes   

    contains
        procedure :: init
        procedure :: run
        procedure :: step
        procedure, private :: resume
        procedure :: quit
        procedure, private :: loadNetlist
        procedure :: readInput
        procedure :: setStopTimes
        procedure :: setModStopTimes
        procedure :: getNodeVoltage
        procedure :: getNodeCurrent
        procedure :: updateNodes
        procedure :: getTime
        procedure :: updateNodeCurrent
        procedure :: updateCircuitSources
        procedure :: modifyLineCapacitorValue

        procedure :: loadCodeModels
        procedure :: printCWD

    end type circuit_t

contains

    real function interpolate(this, time, dt) result(res)
        class(source_t) :: this
        real :: time, dt, x1,x2, y1, y2
        integer :: index
        real, dimension(:), allocatable :: timediff
        timediff = this%time - time + dt
        index = maxloc(timediff, 1, (timediff) <= 0)
        if (index == 0) index = 1
        x1 = this%time(index)
        y1 = this%value(index)
        if (index+1 > size(this%time)) then
            x2 = x1
            y2 = y1
        else 
            x2 = this%time(index+1)
            y2 = this%value(index+1)
        end if
                
        res = (time*(y2-y1) + x2*y1 - x1*y2)/(x2-x1)
    end function

    subroutine printCWD(this)
        class(circuit_t) :: this
        call command('getcwd' // c_null_char)
    end subroutine

    subroutine loadCodeModels(this)
        class(circuit_t) :: this
        call command('codemodel /mnt/c/users/alberto/Work/ugr-fdtd/fdtd/testData/spinit/linux/analog.cm' // c_null_char)
        call command('codemodel /mnt/c/users/alberto/Work/ugr-fdtd/fdtd/testData/spinit/linux/digital.cm' // c_null_char)
        call command('codemodel /mnt/c/users/alberto/Work/ugr-fdtd/fdtd/testData/spinit/linux/spice2poly.cm' // c_null_char)
        call command('codemodel /mnt/c/users/alberto/Work/ugr-fdtd/fdtd/testData/spinit/linux/table.cm' // c_null_char)
        call command('codemodel /mnt/c/users/alberto/Work/ugr-fdtd/fdtd/testData/spinit/linux/xtradev.cm' // c_null_char)
        call command('codemodel /mnt/c/users/alberto/Work/ugr-fdtd/fdtd/testData/spinit/linux/xtraevt.cm' // c_null_char)
    end subroutine

    subroutine init(this, names, sources, netlist)
        class(circuit_t) :: this
        type(string_t), intent(in), dimension(:), optional :: names
        type(node_source_t), intent(in), dimension(:), optional :: sources
        character(len=*), intent(in), optional :: netlist
        integer :: i

        call start()
        ! call this%loadCodeModels()
        if (present(netlist)) then
            write(*,*) 'load netlist'
            call this%loadNetlist(netlist)
        end if

        if (.not.present(names)) then 
            error stop 'Missing node names'
        end if

        allocate(this%nodes%names(size(names)))
        allocate(this%nodes%values(size(names)))

        allocate(this%nodes%sources(size(names)))
        do i = 1, size(names)
            this%nodes%names(i) = names(i)
        end do
        if (present(sources)) then 
            do i = 1, size(sources)
                this%nodes%sources(i) = setSource(sources(i)%path_to_excitation)
                this%nodes%sources(i)%source_type = sources(i)%source_type
            end do
        end if

    end subroutine

    type(source_t) function setSource(source_path) result(res)
        character(*), intent(in) :: source_path
        real :: time, value
        integer :: io
        allocate(res%time(0), res%value(0))
        if (source_path /= "" ) then 
            res%has_source = .true.
            open(unit = 1, file = source_path)
            do
                read(1, *, iostat = io) time, value
                if (io /= 0) exit
                res%time = [res%time, time]
                res%value = [res%value, value]
            end do
        end if
    end function    

    subroutine loadNetlist(this, netlist)
        class(circuit_t) :: this
        character(len=*, kind=c_char), intent(in) :: netlist
        call command(c_char_'source ' // trim(netlist) // c_null_char)
    end subroutine

    subroutine step(this)
        class(circuit_t) :: this
        call this%updateCircuitSources(this%time)
        if (this%time == 0) then
            call this%run()
        else
            call this%resume()
        end if
        call this%updateNodes()

    end subroutine

    subroutine run(this)
        class(circuit_t) :: this
        call command('run ' // c_null_char)
    end subroutine



    subroutine setStopTimes(this, finalTime, dt)
        class(circuit_t) :: this
        real, intent(in) :: finalTime, dt
        character(20) :: charTime
        real :: time

        time = 0.0
        do while (time < finalTime)
            time = time + dt
            write(charTime, *) time
            call command('stop when time = '//charTime // c_null_char)
        end do
    end subroutine

    subroutine setModStopTimes(this, dt)
        class(circuit_t) :: this
        real, intent(in) :: dt
        character(20) :: charTime
        real :: time
        write(charTime, *) dt
        call command('stop when time mod '//charTime // c_null_char)
    end subroutine

    subroutine resume(this)
        class(circuit_t) :: this
        call command('resume ' // c_null_char)
    end subroutine

    subroutine quit(this)
        class(circuit_t) :: this
        call command('quit 0' // c_null_char)
    end subroutine

    subroutine readInput(this, input, printInput) 
        class(circuit_t) :: this
        character(*), intent(in) :: input(:)
        logical, optional :: printInput
        type(c_ptr) :: argv_c(size(input))
        integer :: i   

        type string
            character(len=:,kind=c_char), allocatable :: item
        end type string
        type(string), target :: tmp(size(input))

        if (present(printInput)) then
            if (printInput .eqv. .true.) then 
                do i = 1 , size(input)
                    write(*,*) input(i)
                end do
            end if
        end if

        do i = 1, size(input)
            tmp(i)%item = trim(input(i)) // c_null_char
            argv_c(i) = c_loc(tmp(i)%item)
        end do
        call circ(argv_c)
    end subroutine

    function getName(cName) result(res)
        type(c_ptr) :: cName
        type(string_t) :: res
        character, pointer :: f_output(:) => null()
        integer :: i
        res%name = ""
        res%length = 0
        call c_f_pointer(cName, f_output,[100])
        do i = 1,100
            if (f_output(i) == c_null_char) exit
            res%name(i:i) = f_output(i)
        enddo
        res%length = i-1

    end function

    subroutine updateCircuitSources(this, time)
        class(circuit_t) :: this
        real, intent(in) :: time
        real :: interp
        character(20) :: source_value
        integer :: i, index
        do i = 1, size(this%nodes%sources)
            if (this%nodes%sources(i)%has_source) then
                if (this%nodes%sources(i)%source_type == SOURCE_TYPE_VOLTAGE) then 
                    interp = this%nodes%sources(i)%interpolate(time, 0.0) 
                    write(source_value, *) interp
                    call command("alter @V"//trim(this%nodes%names(i)%name)//"_s[dc] = "//trim(source_value) // c_null_char)
                else if (this%nodes%sources(i)%source_type == SOURCE_TYPE_CURRENT) then 
                    interp = this%nodes%sources(i)%interpolate(time, 0.0) 
                    write(source_value, *) interp
                    call command("alter @I"//trim(this%nodes%names(i)%name)//"_s[dc] = "//trim(source_value) // c_null_char)
                end if
            end if
        end do
    end subroutine

    subroutine modifyLineCapacitorValue(this, name, c)
        class(circuit_t) :: this
        character(*), intent(in) :: name
        real, intent(in) :: c
        character(20) :: sC

        write(sC, *) c
        call command("alter @CL"//trim(name)//" = "//trim(sC) // c_null_char)

    end subroutine

    subroutine updateNodeCurrent(this, node_name, current)
        class(circuit_t) :: this
        real :: current
        character(20) :: sCurrent
        character(*) :: node_name
        if (index(node_name, "initial") /= 0) then
            write(sCurrent, *) current
        else if (index(node_name, "end") /= 0) then
            write(sCurrent, *) -current
        end if
        call command("alter @I"//trim(node_name)//"[dc] = "//trim(sCurrent) // c_null_char)
    end subroutine

    subroutine updateNodes(this) 
        class(circuit_t) :: this
        integer :: i
        type(vectorInfo), pointer :: info
        real(kind=c_double), pointer :: values(:)
        do i = 1, size(this%nodes%names)
            call c_f_pointer(get_vector_info(trim(this%nodes%names(i)%name)//c_null_char), info)
            call c_f_pointer(info%vRealData, values,shape=[info%vLength])
            if (this%nodes%names(i)%name /= "time") then 
                this%nodes%values(i)%voltage = values(ubound(values,1))
            else 
                this%nodes%values(i)%time = values(ubound(values,1))
            end if
        end do
    end subroutine

    function getNodeVoltage(this, name) result(res)
        class(circuit_t) :: this
        character(len=*), intent(in) :: name
        real :: res
        res = this%nodes%values(findVoltageIndexByName(this%nodes%names, name))%voltage
    end function

    function getNodeCurrent(this, name) result(res)
        class(circuit_t) :: this
        character(len=*), intent(in) :: name
        real :: res
        res = this%nodes%values(findVoltageIndexByName(this%nodes%names, name))%current
    end function

    function getTime(this) result(res)
        class(circuit_t) :: this
        real :: res
        res = this%nodes%values(findIndexByName(this%nodes%names, "time"))%time
    end function

    function findIndexByName(names, name) result(res)
        type(string_t) :: names(:)
        character(len=*), intent(in) :: name
        integer :: res, i
        res = 0
        do i = 1, size(names)
            if ( names(i)%name(1:names(i)%length) == trim(name)) then 
                res = i
                exit
            end if
        end do
    end function    

    function findVoltageIndexByName(names, name) result(res)
        type(string_t) :: names(:)
        character(len=*), intent(in) :: name
        integer :: res, i
        res = 0
        do i = 1, size(names)
            if ( names(i)%name(1:names(i)%length) == 'V('//trim(name)//')') then 
                res = i
                exit
            else if ( names(i)%name(1:names(i)%length) == trim(name)) then 
                res = i
                exit
            end if
        end do
    end function    

end module 