#include <stdio.h>

extern long long unsigned my_rdtsc(unsigned); 

unsigned int fib(unsigned int n)
{
	if(n<3)
		return 1;
	
	return fib(n-2)+fib(n-1);
}

unsigned int fibIt(unsigned int n)
{
	int i, a, b;
	for(i = 0;i<n;i++)
	{
            b += a; 
            a = b-a;
	}
	return b;
}

int main(void)
{
/*
int i;
for( i =0; i < 100; i++)
{
	printf("%llu \n", my_rdtsc(0));
}
*/


	long long unsigned l1, l2, l3, l4;
	l1 = my_rdtsc(0);
	fib(40);
	l2 = my_rdtsc(0);
	printf("%llu \n", l2-l1);

	l1 = my_rdtsc(0);
	fibIt(40);
	l2 = my_rdtsc(0);
	printf("%llu \n", l2-l1);
	

	return 0;
}


