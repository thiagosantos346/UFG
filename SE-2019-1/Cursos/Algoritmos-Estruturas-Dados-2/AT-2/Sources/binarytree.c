#include <stdio.h>
#include <stdlib.h>

struct child
{
	
	int value;
	struct *child leftChild;
	struct *child rigthChild;
		

};

typedef struct child Child;


struct root{

	Child *child;

};

typedef struct root Root;


Root createRoot(){

	Root vRtree;

	vRtree.child = null;

};

void printPreOrdem(Root head_root)
{

	if(head_root =! null){

		printf("%d, ", head_root->value );
		printLDR(head_root-> leftchild);
		printLDR(head_root-> rightchild); 

	}

}

void printInOrdem(Root head_root)
{

	if(head_root =! null){

		printLRD(head_root-> leftchild);
		printLRD(head_root-> rightchild); 
		printf("%d, ", head_root->value );

	}

}


void printPosOrdem(Root head_root)
{

	if(head_root =! null){

		printPosOrdem(head_root-> rightchild);
		printPosOrdem(head_root-> leftchild); 
		printf("%d, ", head_root->value );

	}

}

int main(void)
{
	

	return 0;
}

/*
ADT btree
1. Declare create() -> btree
2. makebtree(btree, element, btree) -> btree
3. isEmpty(btree) -> boolean
4. leftchild(btree) -> btree
5. rightchild(btree)-> btree
6. data(btree) -> element
7. for all l, r in btree, e in element, Let
8. isEmpty(create) = true
9. isEmpty(makebtree(l, e, r)) = false
10. leftchild(create()) = error
11. rightchild(create()) = error
12. leftchild(makebtree(l, e, r)) = l
13. rightchild(makebtree(l, e, r)) = r
14. data(makebtree(l, e, r)) = e
15. end
end btre
Creation – Creating an empty binary tree to which the ”root” points
Traversal – Visiting all the nodes in a binary tree
Deletion – Deleting a node from a non-empty binary tree
Insertion – Inserting a node into an existing (may be empty) binary
tree
Merge – Merging two binary trees
Copy – Copying a binary tree
Compare – Comparing two binary trees
Finding a replica or mirror of a binary tree


2h+1 − 1 nós
array unidimensional tree[] de comprimento 2h+1 − 1
nó raiz: na posição tree[0]
Pai(i) = b(i − 1)/2c, se i 6= 0; do contrário i é a raiz (não tem pai)
FilhoEsq(i) = 2i + 1, se 2i + 1 ≤ n − 1; se 2i ≥ n, não tem filho esq.
FilhoDir(i) = 2i + 2, se 2i + 2 ≤ n − 1; se 2i + 1 ≥ n, sem filho dir.



Pai(i) = b(i − 1)/2c, se i 6= 0; do contrário i é a raiz (não tem pai)
FilhoEsq(i) = 2i + 1, se 2i + 1 ≤ n − 1; se 2i ≥ n, não tem filho esq.
FilhoDir(i) = 2i + 2, se 2i + 2 ≤ n − 1; se 2i + 1 ≥ n, sem filho dir.


*/



