/////////////Program for Array Operations ///////////////
#include<stdio.h>
#include<stdlib.h>
int a[1000], pos, elem ;
int n = 0;
void create();
void display();
void insert();
void del();
void sort();
void search();

int main()
{

            int choice;

            while(1)

            {

             printf("\n\n\n >>>MENU<<<\n\n\n");

             printf("\n Press 1 to create an array. \n");

             printf("\n Press 2 to traverse/print the array. \n");

             printf("\n Press 3 to insert an element at a desired position. \n");

             printf("\n Press 4 to delete an element at a given position. \n");
             
			 printf("\n Press 5 to search an element inside the array. \n");
             
			 printf("\n Press 6 to sort the array in ascending order. \n");

             printf("\n Press 0 to exit \n");

             printf("\n\n\n Please enter your choice: ");

             scanf("%d", &choice);
           
///////////////////////////////////////////////////////////////
          
		   switch(choice)

           {

            case 1: create();

                  break;

            case 2: display();

                  break;

            case 3: insert();

                  break;

            case 4: del();

                  break;
                  
            case 5: search();
           
					break;
					
			case 6: sort();
			
					break;
							
            case 0: exit(0);

                  break;
                  
        default:printf("\n Please enter a valid choice:");

                        }

            }

}
/////////////////////////////////////////////////////////////

 void create()

{

            int i;

            printf("\n Enter the length of the array: ");

            scanf("%d", &n);

            printf("\n Enter %d elements in the array sepeprated by 'space' or 'enter':\n ",n);

            for(i=0; i<n; i++)

            {

                        scanf("%d", &a[i]);

            }

}

void display()

{

            int i;

            if(n == 0)

            {

                        printf("\n No elements to display");

                        return;

            }

            printf("\n Array elements are: ");

            for(i=0; i<n;i++)

                        printf("%d\t ", a[i]);

}
///////////////////////////////////////////////

void insert()

{

            int i;

            if(n == 1000)

            {

        printf("\n Array is full. Insertion is not possible");

                        return;

            }

            do

            {

             printf("\n Please enter a valid position where element to be inserted:    ");

             scanf("%d", &pos);

            }
			
			while(pos > n);

            printf("\n Enter the value to be inserted:   ");

            scanf("%d", &elem);

            for(i=n-1; i>=pos ; i--)

            {

                        a[i+1] = a[i];

            }

            a[pos] = elem;

            n = n+1;

            display();

}

///////////////////////////////////////////

void del()

{

            int i;

           

            if(n == 0)

            {

                        printf("\nArray is empty and no elements to delete");

                        return;

            }

            do

            {

                        printf("\n Please enter a valid position from where element to be deleted:    ");

                        scanf("%d", &pos);

            }while(pos>=n);

            elem = a[pos];

            printf("\n The deleted element is : %d \n", elem);

            for( i = pos; i< n-1; i++)

            {

                        a[i] = a[i+1];

            }

            n = n-1;

            display();

}
//////////////////////////////////////////////////////////////
 
void search()

{
	int i,srch;
	
	printf("Please enter a number you want to search in the array \n");
    
	scanf("%d", &srch);

     for (i = 0; i < n; i++)
      {
        if (a[i] == srch)    
          {
            printf("%d is present at location %d\n", srch, i+1);
            
            break;
          }
      }
      
    if (i == n)
  
      printf(" \n Sorry %d isn't present in the array!\n", srch);

}
////////////////////////////////////////////////////////

void sort()
{
	int i,j,temp;
	

	
	  for (i = 0; i < n; ++i) 
        {
 
            for (j = i + 1; j < n; ++j)
            {
 
                if (a[i] > a[j]) 
                {
 
                    temp =  a[i];
                    
                    a[i] = a[j];
                    
                    a[j] = temp;
 
                }
 
            }
 
        }
 
        printf("The elements of the array afterbeing sorted in ascending order are : \n");
        
		for (i = 0; i < n; ++i)
           
		    printf("%d\t", a[i]);
 
    }
