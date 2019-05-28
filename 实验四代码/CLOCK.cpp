#include<iostream>
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define N 20      //虚拟内存尺寸
using namespace std;

int P;
int const blockCount=3 ;//内存中的物理块数
int count = 0;
int block[blockCount];
int const PageCount=15;//总的页面数
int Page[PageCount];
int state[blockCount];//clock置换算法中，内存中的每个页面号对应的状态
int state2[blockCount][2];// 二维数组，第一行第一列为访问位，第一行的第二列为修改位
double lost= 0.0;

void generate_list(int *list,int e,int m,int t)
{
	int i,j=0,q=P,r;
	srand((unsigned)time(NULL));
	while(j<e)
	{
		for(i=j;i<j+m;i++)
		{
			if(i==e)
				break;
			list[i]=(q+rand()%e)%N;   //保证在虚拟内存的页号内
		}
		j=i;
		r=rand()%100;
		if(r<t)
			q=rand()%N;
		else
			q=(q+1)%N;
	}
}

//随机生产是否被修改的情况，prop(0……100),prop/100的概率为被修改
void generate_modify(int *mo,int e,int prop)
{
	int i,t;
	for(i=0;i<e;i++)
	{
		t=rand()%100;
		if(t>prop)
			mo[i]=0;
		else
			mo[i]=1;
	}
}


//检测页号是否在内存中
bool inblock(int num)
{
	for(int i=0; i<blockCount;i++)
	{
		if(block[i] == Page[num])
		{
			state[i] = 1;
			return true;
		}
	}
	return false;
}

//判断页面是否已经被修改
bool change()
{
	if((rand()%2+1) == 1 )
	{
		printf("该页面被修改!\n");
		return true;
	}
	else
		return false;
}

//用于改进型clock置换算法，检测页号是否在内存中并把访问位和修改位置1
bool inblock2(int num)
{
	for(int i=0;i<blockCount;i++){
		if(block[i] == Page[num]){
			if(change()){
				state2[i][0] = 1;
				state2[i][1] = 1;
			}
			else{
				state2[i][0] = 1;
			}
			return true;
		}
	}
	return false;
}

//用于改进型clock置换算法，判断内存中第几个需要被置换
int whichpage(){

	int j;

	for(j=0;j<blockCount;j++)
	{
        if(state2[j][0] == 0&&state2[j][1] == 0)
		{
			return j;
		}
	}
	for(j=0;j<blockCount;j++ )
	{
        if(state2[j][0] == 0&&state2[j][1] == 1)
		{
			return j;
		}
		state2[j][0] = 0 ;
	}
	for(j=0;j<blockCount;j++ )
	{
		state2[j][0] =0 ;
	}
	return whichpage();
}


//简单Clock置换算法
void CLOCK(int num)
{
	int j;

	if(inblock(num))
	{
		printf("命中!\n");
		lost++;
		for(int i=0;i<blockCount;i++)
        printf("物理块%d#中内容:%d\n",i,block [i]);
	}
	else
		if(count == blockCount)
		{
			//lost++;
			for(j=0;j<blockCount; )
			{
				if(state[j] == 0)
				{
					break;
				}
				else{
					state[j] = 0;
				}
				j++;
				j = j%3;
			}
			block[j] = Page[num];
			state[j] = 1;
			for(int i=0;i<blockCount;i++)
            printf("物理块%d#中内容:%d\n",i,block[i]);
		}
		else{
			block[count] = Page[num];
			count++;
			for(int i=0;i<blockCount;i++)
            printf("物理块%d#中内容:%d\n",i,block[i]);
		}
}

//改进型clock置换算法
void LCLOCK(int num)
{
	int j;

	if(inblock2(num))
	{
		printf("命中!\n");
        lost++;
		for(int i=0;i<blockCount;i++)
        printf("物理块%d#中内容:%d\n",i,block[i]);
	}
	else
		if(count == blockCount)
		{
	     	//lost++;
			j =  whichpage();
			block[j] = Page[num];
			state2[j][0] = 1;
			for(int i=0;i<blockCount;i++)
            printf("物理块%d#中内容:%d\n",i,block[i]);
		}
		else{
			block[count] = Page[num];
			count++;
			for(int i=0;i<blockCount;i++)
            printf("物理块%d#中内容:%d\n",i,block[i]);
		}
}

int main()
{
    int a[N];
	int mo[N];
    int A=10;
    int e,m,prop,t,j;
	printf("页面走向为：");
	generate_list(a, e,m,t);
	generate_modify(mo,e,prop);

    for(int i = 0;i<PageCount;i++)
	{

	    Page[i] =rand()%9 + 1;
		printf("%d ",Page[i]);
	}
	char ch ;
	printf("\n");
	printf("\t\t1 Clock置换算法\n");
	printf("\t\t2 改进型Clock置换算法\n");
	printf("\t\t3 退出!\n\n");
	printf("请输入算法序号:\t\n");
    while(1){
    scanf("%c",&ch);
	 switch(ch){
     case '1':{
			lost=0;
			count=0;
			for(int m=0;m<blockCount;m++)
			{
				state[m] = 0;
				}
				for(int j=0;j<blockCount;j++)
				{
					block[j]=0;
				}
				for(int i=0;i<PageCount;i++)
				{
                    printf("读入Page[%d]\n",i);
                    CLOCK(i);
	            }
			 printf("页面访问次数: %d\n缺页次数: %0.lf\n",PageCount,PageCount-lost);
			 printf("缺页率为:%0.001f\n",(PageCount-lost)/PageCount);
             printf("\n请输入算法序号:\t");
    }break;
    case '2':{
            lost = 0;
			count = 0;
			for(int m = 0; m < blockCount; m++)
			{
                for(int n = 0; n < 2;n++)
				state2[m][n] = 0;
			}
			for(int j = 0; j < blockCount; j++)
			{
                block[j] = 0;
			}
			for(int i = 0; i < PageCount; i++)
			{
                printf("读入Page[%d]\n",i);
                LCLOCK(i);
            }
			printf("页面访问次数: %d\n缺页次数: %0.lf\n",PageCount,PageCount-lost);
			printf("缺页率为:%0.001f\n",(PageCount-lost)/PageCount);
            printf("\n请输入算法序号:\t");
    }break;
	case '3':{
		exit(0);
			 }
	}
}
  return 0;
}

