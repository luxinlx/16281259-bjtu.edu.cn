#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>
int main()
{
      pid_t pid;
      pid=fork();
      int i=0;
      if(pid>0)
      {
            while(i<200000)
            {
                   i++;
            }
       }
      else if(pid==0)
      {
            execl("/usr/bin/vi","vi","/tmp/t2.c",NULL);
      }
      else if(pid==-1)
            exit(0);
      }
      return 0;
}
