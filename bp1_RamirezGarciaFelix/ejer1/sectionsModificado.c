#include <stdio.h>
#include <omp.h>

void funcA(){
	printf("En funcA: esta seccion la ejecuta el thread%d\n", omp_get_thread_num());
}

void funcB(){
	printf("En funcB: esta seccion la ejecuta el thread%d\n", omp_get_thread_num());
}

main(){
	#pragma omp parallel
	{
		#pragma omp parallel sections
		{
			#pragma omp section
				(void)funcA();
			#pragma omp section
				(void)funcB();
		}
	}
}
