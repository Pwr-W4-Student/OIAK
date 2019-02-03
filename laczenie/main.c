#include <stdio.h>

extern swap(double * d);

double tab[] = {4.5, 6.6};

int main(void)
{

	printf("%f, %f \n", tab[0], tab[1]);
	swap(tab);
	printf("%f, %f \n", tab[0], tab[1]);

	return 0;

}
