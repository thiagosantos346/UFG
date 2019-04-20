#include <iostream>
#include <stdlib.h>

using std::string;
using std::getline;

using std::cin;
using std::cout;
using std::endl;



typedef struct node *link;
struct node{ char constChar; link l, r; };

void traverse(link h, void(* visit)(link)){


}

void vist(link l){

    cout << l->constChar << endl;

}


int count( link h){

    if(h == NULL) return 0;

    return count(h->l) + count(h->r);

}

int heigth(link h){

    int v, u;

    if(h == NULL) return -1 ;

    v = heigth(h->l); u = heigth(h->r);

    if(u > v) return u+1; else return  v+1;

}

void printNode( char c){


    cout << c << " ";

}


void showInfixa(link x, int h){

    if(x == NULL){ return; }

    showInfixa(x->l, h+1);
    printNode(x->constChar);
    showInfixa(x->r, h+1);
}

void showPosfixa(link x, int h){

    if(x == NULL){  return; }

    showPosfixa(x->l, h+1);
    showPosfixa(x->r, h+1);
    printNode(x->constChar);
}


void showPrefixa(link x){

    if(x == NULL){  return; }

    printNode(x->constChar);
    showPrefixa(x->l);
    showPrefixa(x->r);
}


link NEW(char constChar, link l, link r){

    link x =(link)malloc(sizeof(struct node));
    x->constChar =  constChar;
    x->l = l;
    x->r = r;

    return x;

}

link  insert( link h, char pitem){

    char keyItem = pitem;
    char keyH;
    if( h != NULL)
        keyH = h->constChar;

    if( h == NULL ){
        return NEW(pitem, NULL, NULL);
    }

    if(keyItem < keyH ){

        h->l = insert(h->l, pitem);

    }else{

        h->r = insert(h->r, pitem);
    }

    return h;


}

char search(link h, char pKey){

    char vKeyH;
    if(h != NULL){

        vKeyH = h->constChar;

    }

    if( h == NULL) return  (char)NULL;

    if( pKey == vKeyH ){


        return vKeyH;

    }

    if( pKey < vKeyH ){

        search(h->l, pKey);

    }else{

        search(h->r, pKey);

    }


}


int main() {

    string line = " ";
    link h = (link)NULL;

    while( getline(cin, line) ){


        if((line[0] == 'I') && (line[1] == ' ') ){

            h = insert(h, line[2]);

        }else if( line[1] == 'N' ){
            //infixa
            if(h != NULL)
                showInfixa(h, 0);
            cout << endl;

        }else if( line[1] ==  'R' ){
            //PREFIXA
            if(h != NULL)
                showPrefixa(h);
            cout << endl;

        }else if( line[1] == 'O' ) {
            //POSFIXA
            if(h != NULL)
                showPosfixa(h, 0);
            cout << endl;

        }else if( line[0] == 'P' && line[1] == ' '){

            //z nao existe
            //h existe
            if( h != NULL )
                if( line[2] == search(h, line[2]) ){

                    cout<< line[2] << " existe" <<endl;

                }
                else{

                    cout<< line[2] << " nao existe" <<endl;

                }

        }

    }

    return 0;

}