program random_walk_simulation

    use random_walk, only: simple_random_walk_2D, position, update_position

    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64

    implicit none

    integer :: step, trial
    integer, parameter :: STEPS = 10, TRIALS = 1

    type(position) :: current, updated

    real :: walks(1:TRIALS, 1:STEPS, 1:3)
    real :: randoms(1:TRIALS, 1:STEPS)

    ! Compute the random walk simulation.
    call random_number(randoms)

    walks = simple_random_walk_2D(TRIALS, STEPS, randoms)
    !Write the result to the standard output.
    do trial = 1, TRIALS
        do step = 1, STEPS
            write(*,'(f0.1,a,f0.1,a,f0.4)')  &
                 walks(trial, step, 1), '|', &
                 walks(trial, step, 2), '|', &
                 walks(trial, step, 3)
        end do
        write(*, *) ''
    end do

end program