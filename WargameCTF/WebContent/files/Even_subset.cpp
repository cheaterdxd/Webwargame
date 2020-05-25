#include<stdio.h>
#include<stdlib.h>
int main(){
	int numCase;
	scanf("%d",&numCase);
	int *caseElement[numCase];
	for(int i = 0;i<numCase;i++){
		int size = 0;
		scanf("%d",&size);
		caseElement[i] = (int*) malloc((size)*sizeof(int));
		for(int j=0;j<size;j++){
			scanf("%d",&caseElement[i][j]);
		}
	}
//	for(int i= 0;i<numCase;i++){
//		for(int j = 0;j<=sizeof(caseElement[i])/sizeof(int);j++){
//			printf("%d ",caseElement[i][j]);
//		}
//		printf("\n");	
//	}
	for(int i=0;i<numCase;i++){
		for(int m=0,n=0;)
	}
	return 0;
}
