#include "NumClass.h"
#include <stdio.h>

int myPow(int base,int exp){
    int ans = 1;
    for(int i = 0 ; i < exp; ++i){
        ans *= base;
    }
    return ans;
}
int numLen(int num){
    int len = 0;
    while(num > 0){
        len++;
        num /= 10;
    }
    return len;

}

int main(){
    int num1,num2;
    if(scanf("%d%d",&num1,&num2) != 2 || num1 <= 0 || num2 <= 0){
        printf("Somthing went wrong try again");
        return -1;
    }
    int start = num1 > num2 ? num2 : num1;
    int end = num1 > num2 ? num1 : num2;
    printf("The Armstrong numbers are: ");
    for(int i = start; i <= end;++i){
        if(isArmstrong(i)){
            printf("%d ", i);
        }
    }
    printf("\n");
    printf("The Palindromes are: ");
    for(int i = start; i <= end;++i){
        if(isPalindrome(i)){
            printf("%d ", i);
        }
    }
    printf("\n");
    printf("The Prime numbers are: ");
    for(int i = start; i <= end;++i){
        if(isPrime(i)){
            printf("%d ", i);
        }
    }
    printf("\n");
    printf("The Strong numbers are: ");
    for(int i = start; i <= end;++i){
        if(isStrong(i)){
            printf("%d ", i);
        }
    }
    printf("\n");
    return 0;
}