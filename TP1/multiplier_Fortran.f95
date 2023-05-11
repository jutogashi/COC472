program matrix_vector_multiply
    implicit none

    integer, parameter :: max_n = 16384 ! maximum size of vector and matrix
    integer, parameter :: num_ns = 15 ! number of possible values for N
    ! possible values for N
    integer, parameter :: ns(num_ns) = [1000, 2000, 3000, 4000, 5000, &
                                        6000, 7000, 8000, 9000, 10000, &
                                        11000, 12000, 13000, 14000, 15000] 
                                        
    real, dimension(max_n) :: vector, result
    real, dimension(max_n,max_n) :: matrix

    integer :: n, i, j, k ! loop variables
    integer :: start_time, end_time ! variables for timing
    real :: rate ! variables for timing
    
    do k = 1, num_ns
        n = ns(k)
        ! initialize the vector with random values between 0 and 1
        call random_seed()
        call random_number(vector(1:n))

        ! initialize the matrix with random values between -1 and 1
        call random_number(matrix(1:n,1:n))
        matrix(1:n,1:n) = 2.0 * matrix(1:n,1:n) - 1.0

        ! measure the time taken for matrix-vector multiplication
        call system_clock(start_time, rate)

        ! multiply the vector and matrix
        do i = 1, n
            result(i) = 0.0
            do j = 1, n
                result(i) = result(i) + matrix(i,j) * vector(j)
            end do
        end do

        call system_clock(end_time)
        write(*,*) n, " - Elapsed time line-col: ", real(end_time - start_time) / real(rate), "seconds."

        ! measure the time taken for matrix-vector multiplication
        call system_clock(start_time, rate)

        ! multiply the vector and matrix
        do j = 1, n
            result(j) = 0.0
            do i = 1, n
                result(j) = result(j) + matrix(i,j) * vector(i)
            end do
        end do

        call system_clock(end_time)
        write(*,*) n, " - Elapsed time col-line: ", real(end_time - start_time) / real(rate), "seconds."
        
    end do

end program matrix_vector_multiply