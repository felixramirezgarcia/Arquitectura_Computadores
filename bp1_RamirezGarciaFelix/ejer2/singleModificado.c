#include <stdio.h>
#include <omp.h>

main(){
	int n=9, i, a, b[n];
	
	for(i=0;i<n;i++) b[i]=-1;

	#pragma omp parallel
	{
		#pragma omp single
		{
			printf("Introduce valor de inicializacion a: ");
			scanf("%d", &a);
			printf("Single ejecutada por el thread %d\n", omp_get_thread_num());
		}

		#pragma omp for
		for(i=0;i<n;i++){
			b[i]=a;
		}
		#pragma omp single
		{
			printf("Despues de la region parallel:\n");
			for(i=0;i<n;i++) printf("b[%d] = %d\n", i, b[i]);
			printf("Thread: %d\n", omp_get_thread_num());

		}
	}
}
