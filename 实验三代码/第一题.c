 #include<sys/types.h> 
 #include<unistd.h> 
 #include<stdio.h> 
 #include<stdlib.h> 
 #include<pthread.h> 
 #include <fcntl.h> 
 #include <sys/stat.h> 
 #include <semaphore.h> 
 sem_t* mySem_2 = NULL; 
 sem_t* mySem_3 = NULL; 
 sem_t* mySem_23 = NULL; 
int main(){ 
     pid_t pid_1,pid_root; 
     mySem_2 = sem_open("P2", O_CREAT, 0666, 0); 
     mySem_3 = sem_open("P3", O_CREAT, 0666, 0); 
     mySem_23 = sem_open("P23", O_CREAT, 0666, 0); 
     pid_root = getpid(); 
     for(int i = 0; i<= 1; i++){ 
           pid_1 = fork(); 
           if (i==0) { 
                 if (pid_1 > 0){ 
                    
                 } else if (pid_1 == 0) 
                 { 

                 } else 
                 { 
                           perror("fork!\n"); 
                 } 
           } else 
           { 
                 if (pid_1 > 0) 
                 { 
                           if(getpid() == pid_root) 
                           { 
                           } else 
                           { 
                                   pid_1 = fork(); 
                                   if(pid_1 == 0){ 

                                              sem_wait(mySem_2); 
                                              sem_wait(mySem_3); 
                                              printf("I am the process P4\n"); 
                                   } else 
                                   { 
                                              printf("I am the process P1\n"); 
                                              sem_post(mySem_23); 
                                   }  
                           } 
                } else if (pid_1 == 0) 
                { 
                           if(getppid()!=pid_root){ 
                                              sem_wait(mySem_23); 
                                              printf("I am the process P3\n"); 
                                              sem_post(mySem_23); 
                                              sem_post(mySem_3); 
                           } else 
                           { 
                                              sem_wait(mySem_23); 
                                              printf("I am the process P2\n"); 
                                              sem_post(mySem_23); 
                                              sem_post(mySem_2); 
                           } 
               } else 
               { 
                           perror("fork!"); 
                           } 
               } 
       } 
       int i = 3; 
       while(i--){ 
               sleep(1); 
       } 
       sem_close(mySem_2); 
       sem_close(mySem_3); 
       sem_close(mySem_23); 
       sem_unlink("P2"); 
       sem_unlink("P3"); 
       sem_unlink("P23"); 
       return 0; 
 } 
