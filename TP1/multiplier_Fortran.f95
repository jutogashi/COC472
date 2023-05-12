program matrix_vector_multiply
    implicit none

    integer, parameter :: num_ns = 25 ! number of possible values for N
    ! possible values for N
    integer, parameter :: ns(num_ns) = [1000, 2000, 3000, 4000, 5000, &
                                        6000, 7000, 8000, 9000, 10000, &
                                        11000, 12000, 13000, 14000, 15000, &
                                        16000, 17000, 18000, 19000, 20000, &
                                        21000, 22000, 23000, 24000, 25000] 
                                        
    real, dimension(:), allocatable :: x, b
    real, dimension(:,:), allocatable  :: A

    integer :: n, i, j, k ! loop variables
    integer :: start_time, end_time ! variables for timing
    real :: rate ! variables for timing
    
    do k = 1, num_ns
        n = ns(k)
        allocate(A(n,n), x(n), b(n))
        ! initialize the vector with random values between 0 and 1
        call random_seed()
        call random_number(x(1:n))

        ! initialize the matrix with random values between -1 and 1
        call random_number(A(1:n,1:n))
        A(1:n,1:n) = 2.0 * A(1:n,1:n) - 1.0

        ! measure the time taken for matrix-vector multiplication
        call system_clock(start_time, rate)

        ! multiply the vector and matrix
        do i = 1, n
            b(i) = 0.0
            do j = 1, n
                b(i) = b(i) + A(i,j) * x(j)
            end do
        end do

        call system_clock(end_time)
        write(*,*) n, " - Elapsed time line-col: ", real(end_time - start_time) / real(rate), "seconds."

        ! measure the time taken for matrix-vector multiplication
        call system_clock(start_time, rate)

        ! multiply the vector and matrix
        do j = 1, n
            b(j) = 0.0
            do i = 1, n
                b(j) = b(j) + A(i,j) * x(i)
            end do
        end do

        call system_clock(end_time)
        write(*,*) n, " - Elapsed time col-line: ", real(end_time - start_time) / real(rate), "seconds."

        deallocate(A, x, b)
        
    end do

end program matrix_vector_multiply