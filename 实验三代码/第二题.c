
 #include<unistd.h> 
 #include<stdio.h> 
 #include<stdlib.h> 
 #include<pthread.h> 
 #include <fcntl.h> 
 #include <sys/stat.h> 
 #include <semaphore.h> 
 #include <sched.h> 
int count=1000;//票数
int temp=0;
sem_t empty;//票余量
sem_t full;//售票量
void *sale(void *arg){
    while(1){
         sem_wait(&empty);
         temp=count;
         pthread_yield();//诱发并发错误
         temp-=1;
         pthread_yield();
         count=temp;
         printf("sale:%d ticket left\n",count);
         usleep(500);//执行完一次操作，睡眠500微秒
         sem_post(&full);
    }
}
void *back(void *arg){
    while(1){
         sem_wait(&full);
         temp=count;
         pthread_yield();
         temp=temp+1;
         pthread_yield();
         count=temp;
         printf("back:%d ticket left\n",count);
         usleep(500);
         sem_post(&empty);
    }
}
int main(int argc,char *argv[])
{
     sem_init(&empty,0,1000);
     sem_init(&full,0,0);
     pthread_t p1,p2;
     pthread_create(&p1,NULL,sale,NULL);
     pthread_create(&p2,NULL,back,NULL);
     pthread_join(p1,NULL);
     pthread_join(p2,NULL);
    
     sem_destroy(&empty);
     sem_destroy(&full);
     return 0;
}
