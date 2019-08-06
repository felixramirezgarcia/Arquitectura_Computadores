struct{
	int a;
	int b;
} s[5000];

void auxiliar(int ii, int X1, int X2 , int i, int R[]){
		for(ii=0;ii<40000;ii++){
		X1=0; X2=0;
		for(i=0;i<5000;i+=10) {
			X1+=2*s[i].a+ii; X2+=3*s[i].b-ii;
			X1+=2*s[i+1].a+ii; X2+=3*s[i+1].b-ii;
			X1+=2*s[i+2].a+ii; X2+=3*s[i+2].b-ii;
			X1+=2*s[i+3].a+ii; X2+=3*s[i+3].b-ii;
			X1+=2*s[i+4].a+ii; X2+=3*s[i+4].b-ii;
			X1+=2*s[i+5].a+ii; X2+=3*s[i+5].b-ii;
			X1+=2*s[i+6].a+ii; X2+=3*s[i+6].b-ii;
			X1+=2*s[i+7].a+ii; X2+=3*s[i+7].b-ii;
			X1+=2*s[i+8].a+ii; X2+=3*s[i+8].b-ii;
			X1+=2*s[i+9].a+ii; X2+=3*s[i+9].b-ii;
		} 	
		
		if(X1<X2) R[ii]=X1;
		else R[ii]=X2;
	}
}