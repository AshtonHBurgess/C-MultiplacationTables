#include <stdio.h>

int main(void)
{
    // YOUR CODE GOES HERE
    //START OF MAIN


    //Assignment 1
    //student: Ashton Burgess
    //w#: w0465511

    /*     PROJECT REQUIRMENTS
     •	Generate a printed table of the form N*N for values of N=1 to 10 for both the rows and the columns. That is, 1 is at the top, left in both directions. Use some variant of for loop(s) for this component
•	The table should be a square layout, NxN
•	The table should have a header line showing each value of N for a column
•	Generate and print the table values using nested loops
•	Print a reversed variant of the table with 10 at the top, left. Again with a header line. Use some variant of while loops for this component
•	Include clear comments
•	Maintain a standard layout/format for the code. Be consistent with spacing or tabbing, use the layout o make nested operation visually clear.*/


printf("Multiplication Tables\n");

    //Multiplication Table
    printf("\n");
    printf("\nUp Right Version\n");


    int n = 10;
    for (int x = 0; x <=n; x++){
        for (int y =0; y <=n; y++){
            if(x == 0 && y == 0){
                printf("\tN");      //Replaces the top left with an N
            }
            else if(x == 0 && y != 0){
                printf("\t%i", ((x+1) * y));    // adds 1 to each from each of the headers
            }
            else if(x != 0 && y == 0){
                printf("\t%i", ((x) * (y+1)));  // adds 1 to each from each of the headers
            }

            else{
                printf("\t%i", x * y);        // main print out for multiplication table
            }

        }
        printf("\n");
    }

    //REVERSE Times Tables
    printf("\n");
    printf("\nReversed Version\n");

    int r = 11;
    for(int w = r; w >= 1; w--){
        for(int l = r; l >= 1; l--){
            if(w == 11 && l == 11){
                printf("\tN");          //Replaces the top left with an N
            }
            else if(w == 11 && l != 11){
                printf("\t%i", ((w-10) * l));   // removes 10 from each of the headers
            }
            else if(w != 11 && l == 11){
                printf("\t%i", ((w) * (l-10))); // removes 10 from each of the headers
            }

            else{
                printf("\t%i", w * l);      // main print out for multiplication table
            }

        }
        printf("\n");

    }



    return 0;
}