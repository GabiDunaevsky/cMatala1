#include "NumClass.h"


int isArmstrong(int num){
    int originalNum = num;
    int lenNum = numLen(num);
    int sum = 0;
    while (num > 0)
    {
        sum += myPow(num%10,lenNum);
        num /= 10;
    }
    return sum == originalNum;
}
int isPalindrome(int num){
    int newNum = 0;
    int lenNum = numLen(num);
    for(int i = lenNum/2 - 1; i >= 0; i--){
        newNum += num%10 * myPow(10,i);
        num /= 10;
    }
    num = lenNum%2 == 1 ? num/10 : num;
    return newNum == num;
}