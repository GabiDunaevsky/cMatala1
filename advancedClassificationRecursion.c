#include "NumClass.h"
#include <stdio.h>


int isArmstrongRec(int num, int len){
    if(numLen(num) == 1){
        return myPow(num,len);
    }
    return isArmstrongRec(num/10,len) + myPow(num%10,len);

}

int isArmstrong(int num){
    int len = numLen(num);
    int sum = isArmstrongRec(num,len);
    return sum == num;

}

int isPalindromeRec(int num, int len){
    if(num >= 0 && num < 10){
        return num;
    }
    return isPalindromeRec(num/10,len - 1) + myPow(10,len - 1) * (num%10);
}

int isPalindrome(int num){
    int len = numLen(num);
    int newNumm = isPalindromeRec(num,len);
    return num == newNumm;

}
