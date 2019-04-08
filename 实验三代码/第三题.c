#include<unistd.h> 
 #include<stdio.h> 
 #include<stdlib.h> 
 #include<pthread.h> 
 #include <fcntl.h> 
 #include <sys/stat.h> 
 #include <semaphore.h> 
#include<assert.h>
char buffer[10]={0};
sem_t empty;//空闲buffer
sem_t full;//已写入buffer

void *producer(void *arg)
{
    for(int i=0;i<10;)
    {
        sem_wait(&empty);
        scanf("%c",&buffer[i]);
        i++;
        i%=10;
        sem_post(&full);
    }
}

void *consumer(void *arg)
{
    for(int j=0;j<10;)
    {
        sem_wait(&full);
        printf("%c ",buffer[j]);
        j++;
        j%=10;
        sleep(1);
        sem_post(&empty);
    }
}
int main(int argc,char *argv[])
{
    sem_init(&empty,0,10);//初始化信号量
    sem_init(&full,0,0);
    pthread_t p1,p2;
    pthread_create(&p1,NULL,producer,NULL);
    pthread_create(&p2,NULL,consumer,NULL);
    pthread_join(p1,NULL);
    pthread_join(p2,NULL);
    sem_destroy(&empty);
    sem_destroy(&full);
    return 0;
}

