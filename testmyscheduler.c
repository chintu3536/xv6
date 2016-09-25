#include "types.h"
#include "user.h"
#include "param.h"
#include "stat.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main(){

	printf(1, "Starting TestScheduler\n\n");

	printf(1, "Running Test Case 1\n\n");
	printf(1, "3 processes with equal workload(cpu + i/o) and 20, 30, 40 priorities will be created\n");
	printf(1, "The processes write into a file name 'testcase1output'\n\n");

	int i, j, ret, fd;

	fd = open("testcase1output", O_CREATE | O_WRONLY);
	
	setprio(1000000);
	
	for(i = 1; i < 4; i++)
	{
		ret = fork();
		if(ret == 0)
		{
			setprio((i+1)*10);
			printf(1, "Created child process(pid = %d, priority = %d)\n", getpid(), getprio());
			break;
		}
	}
	if(ret == 0)
	{
		for(j = 0; j < 10000; j++)
		{
			printf(fd, "%d", getpid());
		}
		printf(1, "Finished process(pid = %d, priority = %d)\n", getpid(), getprio());
		exit();
	}

	exit();
}

