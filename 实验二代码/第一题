#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>

int main()
{
      pid_t p,p2,p3,p4,p5;
 
      while((p=fork())==-1);
      if(!p)
      {
            while((p2=fork())==-1);
            if(!p2)
            {
                  printf("进程P4的pid为%d，父进程为p2,id为%d\n",getpid(),getppid());
            }
            else if(p2>0)
            {
                  printf("进程p2的pid为%d，父进程为p，id为%d\n",getpid(),getppid());
            }
            while((p2=fork())==-1);
            if(!p2)
            {
                  printf("进程p5的pid为%d，父进程为p2，id为%d\n",getpid(),getppid());
            }
             else
            {
                   ;
            }
       }
      else if(p>0)
      {
            printf("进程p为父进程,id为%d,它的父进程id为%d\n",getpid(),getppid());
      }
      while((p=fork())==-1);
      if(!p)
      {
            printf("进程p3的id为%d,父进程为p，id为%d\n",getpid(),getppid());
      }
      else
      {
            ;
      }
      return 0;
}
