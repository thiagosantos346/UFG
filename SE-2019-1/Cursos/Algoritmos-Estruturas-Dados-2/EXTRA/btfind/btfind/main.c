#include <stdio.h>
#include <stdlib.h>

int current;

int find(char str[], char value){

    int position = 0;

    while( str[position] != '\n')
    {

        if( str[position] == value){

            return position;

        }

        position++;

    }

    return -1;

}



void  toPosfix(char prefixa[], char infixa[], int begin, int end) {
    int pos;

    if (begin <= end) {
        //Corrente é uma variavel global que indica a posição atual da variavel.
        current++;

        //pos indica a correspondencia entre
        //posição da variavel corrente da string prefixa
        //no conjunto da string infixa
        pos = find( infixa, prefixa[current]);

        //e feita uma chamda recursiva para o lado esquerdo
        //o novo lado lado esquerdo começa no inicio
        //e acaba na posição menos 1[posição de correspondencia]
        toPosfix(prefixa, infixa, begin, pos-1);
        //e outra para o lado direito
        //o mesmo ocorre para o lado direito
        //só que começa na posição + 1
        // e vai até o fim
        toPosfix(prefixa, infixa, pos+1, end);

        //sendo assim a pos é a raiz, tendo em
        //vista que a raiz é sempre o meio da prefixa.

        printf("%c", infixa[pos]);

    }


}

char *newString(int size){

    return malloc(sizeof(char)*size);

}

int main() {
    int testCases;
    int n;
    char *pre, *in;

    scanf("%d", &testCases);

    for (int i = 1; i <= testCases; i++) {
        current = -1;

        n = 0;

        scanf("%d",  &n);
        pre = newString(n);
        in = newString(n);
        scanf(" %s %s", pre, in);

        toPosfix(pre, in, 0, n-1);
        printf("\n");
    }



}
