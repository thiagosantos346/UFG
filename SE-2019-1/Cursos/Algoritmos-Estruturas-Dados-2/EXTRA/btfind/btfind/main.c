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
        //Corrente � uma variavel global que indica a posi��o atual da variavel.
        current++;

        //pos indica a correspondencia entre
        //posi��o da variavel corrente da string prefixa
        //no conjunto da string infixa
        pos = find( infixa, prefixa[current]);

        //e feita uma chamda recursiva para o lado esquerdo
        //o novo lado lado esquerdo come�a no inicio
        //e acaba na posi��o menos 1[posi��o de correspondencia]
        toPosfix(prefixa, infixa, begin, pos-1);
        //e outra para o lado direito
        //o mesmo ocorre para o lado direito
        //s� que come�a na posi��o + 1
        // e vai at� o fim
        toPosfix(prefixa, infixa, pos+1, end);

        //sendo assim a pos � a raiz, tendo em
        //vista que a raiz � sempre o meio da prefixa.

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
