#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif

int main(int argc, char **argv){
	int i, n=200, chunk, a[n], suma=0, chunkValue;
	omp_sched_t scheduleType;

	if(argc<3){
		fprintf(stderr, "\nFalta iteraciones o chunk\n");
		exit(-1);
	}

	n=atoi(argv[1]); 
	chunk=atoi(argv[2]);

	if(n>200) n=200; 


	for(i=0;i<n;i++) a[i]=i;

	printf("Antes de hacer el cambio\n");
	omp_get_schedule(&scheduleType, &chunkValue);
	printf("dyn-var: %d, nthreads-var: %d, thread-limit-var: %d, run-sched-var: %d, chunk: %d\n ", omp_get_dynamic(), omp_get_max_threads(), omp_get_thread_limit(), scheduleType, chunkValue);
	

	printf("Cambiando valores a:\n\tdyn-var: 1\n\tnthreads-var: 3\n\trun-sched-var: 2\n\tchunk: 2\n");
	omp_set_dynamic(1);
	omp_set_num_threads(3);
	omp_set_schedule(2, 2);	

	#pragma omp parallel for firstprivate(suma) lastprivate(suma) schedule(dynamic, chunk)
	for(i=0;i<n;i++){
		suma=suma+a[i];
		printf("thread %d suma a[%d]=%d suma=%d\n", omp_get_thread_num(), i, a[i], suma);
	}

	printf("Fuera de parallel for suma=%d\n", suma);
	
	printf("Despues de hacer el cambio\n");
	omp_get_schedule(&scheduleType, &chunkValue);
	printf("dyn-var: %d, nthreads-var: %d, thread-limit-var: %d, run-sched-var: %d, chunk: %d\n ", omp_get_dynamic(), omp_get_max_threads(), omp_get_thread_limit(), scheduleType, chunkValue);

	return 0;
}
