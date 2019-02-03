#include <stdio.h>

#define n 1024


long long unsigned int time(int);

int R(int A[n][n])
{
	int tmp, i = 0, j = 0;

	for(; i< n; i++)
	{
		for(; j<n; j++)
		{
			tmp = A[i][j];
		}
	}
	return tmp;
}


int RT(int A[n][n])
{
        int tmp, i = 0, j = 0;

        for(; i< n; i++)
        {
                for(; j<n; j++)
                {
                        tmp = A[j][i];
                }
        }
	return tmp;
}



int main()
{

	int A[n][n];

	int B[n];

	long long unsigned int start;
	long long unsigned int end;

	int a = 0, b = 0;

	a = 0;
	b = 0;
	for(; a< n; a++)
        {
		B[a]=  a;

                for(b = 0; b<n; b++)
                {
                        A[a][b] = a+b;
                }
        }


	start = time(0);
	R(A);
	end = time(0);
	float wynik1 = end - start;
	printf("R(A) \t %llu \n", wynik1);

	start = time(0);
        RT(A);
        end = time(0);
	float wynik2 = end - start;


        printf("RT(A) \t %llu \n", wynik2);
	printf("ile razy szybszy: %f \n",wynik2/wynik1); 

/*

	start = time(0);
        RT(A);
        end = time(0);
        wynik1 = end - start;
        printf("RT(A) \t %llu \n", wynik1);

        start = time(0);
        R(A);
        end = time(0);
        wynik2 = end - start;


        printf("R(A) \t %llu \n", wynik2);
        printf("ile razy szybszy: %f \n",wynik1/wynik2);
*/
/*
	i = 0;
	for(; i<n; i++)
	{
		start = time(0);
		tmp = B[i];
		end = time(0);

		if(i % 17 == 0)
		{
			printf(" \n");
		}
		else
		{
			printf("%llu ", end-start);

		}
	}

*/

	int tmp = 0;
	a = 0;
	for(; a < n; a++)
	{
		start = time(0);
		tmp = B[a];
		end = time(0);

		if(a % 17 == 0)
		{
			printf("\n");
		}
		else
		{
			printf("%llu ", end-start);
		}
	}

	return tmp;
}
