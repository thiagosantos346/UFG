#include <stdio.h>
#include <stdlib.h>
#include <String.h>

typedef struct node Node;

struct node{

    char data;
    Node *L;
    Node *R;

};

Node *newNode(char data){

    Node *newNode = (Node *)malloc(sizeof(Node));
    if( newNode != NULL){

        newNode->data = data;
        newNode->L = NULL;
        newNode->R = NULL;

        return newNode;

    }else{

        printf("Erro, ao criar um novo nó.\n");


    }

    return newNode;

}



void *insertOnChildNode(Node *heaf_node, char dataToInsert){

  if(heaf_node == NULL ){

    return newNode(dataToInsert);

  }

  if((heaf_node->data < dataToInsert)){

    heaf_node->L = insertOnChildNode(heaf_node->L, dataToInsert);
  }

   if((heaf_node->data < dataToInsert)){

    heaf_node->R = insertOnChildNode(heaf_node->R, dataToInsert);

  }

  return heaf_node;

}

char *getStrInfix(Node *heaf_node, char *strOut, int iterator){



        if(heaf_node != NULL){


            getStrInfix(heaf_node->L, strOut, iterator);

            strOut[iterator] = heaf_node->data;

            getStrInfix(heaf_node->R, strOut, iterator);

        }

        strOut[iterator] = '\0';

        return strOut;
}

void getStrposfix(Node *heaf_node, char *strOut){


}

void getStrprefix(Node *heaf_node, char *strOut){


}

void entrada(Node *heaf_head){

    char value;


    while( (value = getchar()) != '\n' ){

        heaf_head = insertOnChildNode(heaf_head, value);
    }

    if( value == '\n' )
        return;

}


void saida(Node *head_heaf){

    char *strOut = malloc(sizeof(char));
    int  i = 0;

    strOut = getStrInfix(head_heaf, strOut, i);


    printf("%s", strOut);


}

void processar();




int main()
{

    Node *head = NULL;

    entrada(head);
    saida(head);

    return 0;
}
