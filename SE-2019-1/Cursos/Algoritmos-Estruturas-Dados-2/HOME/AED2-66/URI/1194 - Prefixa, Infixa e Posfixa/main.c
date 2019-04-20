#include <stdio.h>
#include <stdlib.h>

int current;

char *newString(int size){
    
    char *temp = malloc(sizeof(char)*size);
    return temp;

}

int find(char *str, char value){

    int position = 0;

    while( str[position] != '\n')
    {

        if( str[position] == value){

            return position;

        }

        position++;

    }

    return position;

}



void  toPosfix(char *prefixa, char *infixa, int begin, int end) {
    
    int pos;

    if (begin <= end) {
        
        current++;

        pos = find( infixa, prefixa[current]);

      
        toPosfix(prefixa, infixa, begin, pos-1);
      
        toPosfix(prefixa, infixa, pos+1, end);

        printf("%c", infixa[pos]);

    }


}



int main(void) {
    
    int testCases;
    int n;
    int i;
    char *pre, *inf;

    scanf("%d", &testCases);

    for (i = 1; i <= testCases; i++) {
        current = -1;

        n = 0;

        scanf("%d",  &n);
        
        pre = newString(n);
        inf = newString(n);
        
        scanf(" %s %s", pre, inf);
        
        toPosfix(pre, inf, 0, n-1);
        printf("\n");
    }



}