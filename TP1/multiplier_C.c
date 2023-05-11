#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    // matrix and vector size
    int Num[] = {1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000, 12000, 13000, 14000, 15000};

    for(int N = 0; N < 15; N++){
        // Initialize random seed
        srand(time(NULL));

        // Generate random vector x with random values between 0 and 1
        double* x = (double*)malloc(Num[N] * sizeof(double));
        for (int i = 0; i < Num[N] ; i++) {
            x[i] = ((double)rand() / RAND_MAX)* 2 - 1;
        }

        // Generate random matrix A with random values between 0 and 1
        double** A = (double**)malloc(Num[N]  * sizeof(double*));
        for (int i = 0; i < Num[N] ; i++) {
            A[i] = (double*)malloc(Num[N]  * sizeof(double));
            for (int j = 0; j < Num[N] ; j++) {
                A[i][j] = ((double)rand() / RAND_MAX)* 2 - 1;   
            }
        }

        // Multiply A and x using matrix-vector multiplication and measure time
        clock_t start1 = clock();
        double* b_l_c = (double*)malloc(Num[N]  * sizeof(double));
        for (int i = 0; i < Num[N] ; i++) {
            b_l_c[i] = 0;
            for (int j = 0; j < Num[N] ; j++) {
                b_l_c[i] += A[i][j] * x[j];
            }
        }
        clock_t end1 = clock();

        // Print the time taken to perform the multiplication
        double time_taken1 = ((double)(end1 - start1)) / CLOCKS_PER_SEC;
        printf("%i - Elapsed time line-col: %f seconds\n",Num[N], time_taken1);

        // Multiply A and x using matrix-vector multiplication and measure time
        clock_t start2 = clock();
        double* b_c_l = (double*)malloc(Num[N]  * sizeof(double));
        for (int j = 0; j < Num[N] ; j++) {
            b_c_l[j] = 0;
            for (int i = 0; i < Num[N] ; i++) {
                b_c_l[j] += A[i][j] * x[i];
            }
        }
        clock_t end2 = clock();

        // Print the time taken to perform the multiplication
        double time_taken2 = ((double)(end2 - start2)) / CLOCKS_PER_SEC;
        printf( "%i - Elapsed time col-line: %f seconds\n",Num[N], time_taken2);

        // Free memory
        free(x);
        for (int i = 0; i < Num[N] ; i++) {
            free(A[i]);
        }
        free(A);
        free(b_l_c);
        free(b_c_l);
    }
    return 0;
}