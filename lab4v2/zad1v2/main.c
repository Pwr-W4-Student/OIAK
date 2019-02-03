#include <stdio.h>

extern float calka(int a, int b, int k, int l);
extern float calka_simd(int a, int b, int k, int l);
extern long long unsigned int time(int p);

int main()
{
	long long unsigned int calka_s =  time(0);
	printf("wynik: %f \n", calka(2,2,1,2));
	long long unsigned int calka_e = time(0);

	long long unsigned int calka_simd_s = time(0);
	printf("wynik: %f \n", calka_simd(2,2,1,2));
	long long unsigned int calka_simd_e = time(0);

	long long unsigned int calka = calka_e - calka_s;
	long long unsigned int calka_simd = calka_simd_e - calka_simd_s;

	printf("czas: %llu \n", calka);
	printf("czas: %llu \n", calka_simd);

	printf("ile razy szybsza: %llu \n", calka/ calka_simd);

	return 0;
}

