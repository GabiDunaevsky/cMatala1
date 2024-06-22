#include "NumClass.h"

int isPrime(int num){
    for(int i = 2; i * i <= num; ++i){
        if(num % i == 0){
            return 0;
        }
    }
    return 1;
}
int fuct(int num){
    if(num == 1 || num == 0){
        return 1;
    }
    return fuct(num - 1) * num;  
}
int isStrong(int num){
    int originalNum = num;
    int sum = 0;
    while(num > 0){
        int digit = num%10;
        sum += fuct(digit);
        num/= 10;
    }
    return sum == originalNum;
}