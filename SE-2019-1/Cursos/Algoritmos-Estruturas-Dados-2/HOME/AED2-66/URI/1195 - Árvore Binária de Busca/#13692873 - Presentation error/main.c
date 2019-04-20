#include <stdio.h>
#include <stdlib.h>
#define  max 10001

struct node{

    int data;
    struct node *L;
    struct node *R;

};
typedef struct node Node;

Node *newNode(int data){

    Node *temp = (Node *)malloc(sizeof(struct node));
    if(temp != NULL){


        temp->data = data;
        temp->L = NULL;
        temp->R = NULL;

    }

    return temp;

}

Node *insert(Node *root,  int data){

    if(root == NULL){
        return newNode( data);
    }

    if(root->data > data){
        root->L = insert(root->L, data);
    }

    if(root->data < data ){
        root->R = insert(root->R, data);
    }

    return root;

}

void infix(Node *root){

    if(root != NULL){

        infix(root->L);
        printf("%d ",  root->data);
        infix(root->R);
    }

}

void prefix(Node *root){

    if(root != NULL){

        printf("%d ",  root->data);
        prefix(root->L);
        prefix(root->R);

    }

}

void posfix(Node *root){


    if(root != NULL){

        posfix(root->L);
        posfix(root->R);
        printf(" %d",  root->data);

    }


}

void newLine(){
    printf("\n");
}

int main() {
    int data;

    int caseTest;
    int limteToReady;

    int iterator;
    int sub_interator;

    int coutKey = 0;

    Node *root[max];


    scanf("%d", &caseTest);

    for(iterator = 0; iterator < caseTest; iterator++ ){

        scanf("%d", &limteToReady);

        root[iterator] = NULL;

        for(sub_interator = 0; sub_interator < limteToReady; sub_interator++){

            scanf("%d^[ ]", &data);

            root[iterator] = insert(root[iterator],  data);

        }



    }

    for(iterator = 0; iterator < caseTest; iterator++){

        if(iterator != 0) {
          newLine();
        }
        printf("Case %d:", 1+iterator);
        newLine();
        

        printf("Pre.: ");
        prefix(root[iterator]);
        newLine();
        

        printf("In..: ");
        infix(root[iterator]);
        newLine();

        printf("Post: ");
        posfix(root[iterator]);

        newLine();
        newLine();
        


    }



}