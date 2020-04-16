#include <stdio.h>
#include <malloc.h>
#include <string.h>

char parity(char num[]){
    int size = strlen(num);
    int count = 0;
    for (int i = 0; i < size; i++){
        if(num[i] == '1')
            count++;
    }

    if(count%2 == 0)
        return '0';
    else
        return '1';
}

char* sender(char data[]){
    char *d = data;
    int size = strlen(d);
    d[size] = parity(d);
    d[size+1] = '\0';

    return d;
}

char* reciever(char data[]){
    char *d = data;
    int size = strlen(d);

    if(parity(d) == '0')
        printf("\nTransmission was ERROR-FREE\n");
    else
        printf("\nThere was an ERROR in the transmission\n");

    d[size-1] = '\0';
    return d;
}

int main(int argc, char const *argv[])
{
    char num[128];
    printf("Enter data: ");
    scanf("%[^\n]s", &num);

    char* sent = sender(num);
    printf("Data sent, after appending the parity bit: %s", sent);

    char* received = reciever(sent);
    printf("Data recieved: %s\n\n", sent);
    
    return 0;
}
