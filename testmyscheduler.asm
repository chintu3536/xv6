
_testmyscheduler:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main(){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp

	printf(1, "Starting TestScheduler\n\n");
  12:	83 ec 08             	sub    $0x8,%esp
  15:	68 d0 08 00 00       	push   $0x8d0
  1a:	6a 01                	push   $0x1
  1c:	e8 f6 04 00 00       	call   517 <printf>
  21:	83 c4 10             	add    $0x10,%esp

	printf(1, "Running Test Case 1\n\n");
  24:	83 ec 08             	sub    $0x8,%esp
  27:	68 e9 08 00 00       	push   $0x8e9
  2c:	6a 01                	push   $0x1
  2e:	e8 e4 04 00 00       	call   517 <printf>
  33:	83 c4 10             	add    $0x10,%esp
	printf(1, "3 processes with equal workload(cpu + i/o) and 20, 30, 40 priorities will be created\n");
  36:	83 ec 08             	sub    $0x8,%esp
  39:	68 00 09 00 00       	push   $0x900
  3e:	6a 01                	push   $0x1
  40:	e8 d2 04 00 00       	call   517 <printf>
  45:	83 c4 10             	add    $0x10,%esp
	printf(1, "The processes write into a file name 'testcase1output'\n\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 58 09 00 00       	push   $0x958
  50:	6a 01                	push   $0x1
  52:	e8 c0 04 00 00       	call   517 <printf>
  57:	83 c4 10             	add    $0x10,%esp

	int i, j, ret, fd;

	fd = open("testcase1output", O_CREATE | O_WRONLY);
  5a:	83 ec 08             	sub    $0x8,%esp
  5d:	68 01 02 00 00       	push   $0x201
  62:	68 91 09 00 00       	push   $0x991
  67:	e8 64 03 00 00       	call   3d0 <open>
  6c:	83 c4 10             	add    $0x10,%esp
  6f:	89 45 e8             	mov    %eax,-0x18(%ebp)
	
	setprio(1000000);
  72:	83 ec 0c             	sub    $0xc,%esp
  75:	68 40 42 0f 00       	push   $0xf4240
  7a:	e8 b1 03 00 00       	call   430 <setprio>
  7f:	83 c4 10             	add    $0x10,%esp
	
	for(i = 1; i < 4; i++)
  82:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  89:	eb 4c                	jmp    d7 <main+0xd7>
	{
		ret = fork();
  8b:	e8 f8 02 00 00       	call   388 <fork>
  90:	89 45 ec             	mov    %eax,-0x14(%ebp)
		if(ret == 0)
  93:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  97:	75 3a                	jne    d3 <main+0xd3>
		{
			setprio((i+1)*10);
  99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  9c:	8d 50 01             	lea    0x1(%eax),%edx
  9f:	89 d0                	mov    %edx,%eax
  a1:	c1 e0 02             	shl    $0x2,%eax
  a4:	01 d0                	add    %edx,%eax
  a6:	01 c0                	add    %eax,%eax
  a8:	83 ec 0c             	sub    $0xc,%esp
  ab:	50                   	push   %eax
  ac:	e8 7f 03 00 00       	call   430 <setprio>
  b1:	83 c4 10             	add    $0x10,%esp
			printf(1, "Created child process(pid = %d, priority = %d)\n", getpid(), getprio());
  b4:	e8 7f 03 00 00       	call   438 <getprio>
  b9:	89 c3                	mov    %eax,%ebx
  bb:	e8 50 03 00 00       	call   410 <getpid>
  c0:	53                   	push   %ebx
  c1:	50                   	push   %eax
  c2:	68 a4 09 00 00       	push   $0x9a4
  c7:	6a 01                	push   $0x1
  c9:	e8 49 04 00 00       	call   517 <printf>
  ce:	83 c4 10             	add    $0x10,%esp
			break;
  d1:	eb 0a                	jmp    dd <main+0xdd>

	fd = open("testcase1output", O_CREATE | O_WRONLY);
	
	setprio(1000000);
	
	for(i = 1; i < 4; i++)
  d3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  d7:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  db:	7e ae                	jle    8b <main+0x8b>
			setprio((i+1)*10);
			printf(1, "Created child process(pid = %d, priority = %d)\n", getpid(), getprio());
			break;
		}
	}
	if(ret == 0)
  dd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  e1:	75 51                	jne    134 <main+0x134>
	{
		for(j = 0; j < 10000; j++)
  e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ea:	eb 1d                	jmp    109 <main+0x109>
		{
			printf(fd, "%d", getpid());
  ec:	e8 1f 03 00 00       	call   410 <getpid>
  f1:	83 ec 04             	sub    $0x4,%esp
  f4:	50                   	push   %eax
  f5:	68 d4 09 00 00       	push   $0x9d4
  fa:	ff 75 e8             	pushl  -0x18(%ebp)
  fd:	e8 15 04 00 00       	call   517 <printf>
 102:	83 c4 10             	add    $0x10,%esp
			break;
		}
	}
	if(ret == 0)
	{
		for(j = 0; j < 10000; j++)
 105:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 109:	81 7d f0 0f 27 00 00 	cmpl   $0x270f,-0x10(%ebp)
 110:	7e da                	jle    ec <main+0xec>
		{
			printf(fd, "%d", getpid());
		}
		printf(1, "Finished process(pid = %d, priority = %d)\n", getpid(), getprio());
 112:	e8 21 03 00 00       	call   438 <getprio>
 117:	89 c3                	mov    %eax,%ebx
 119:	e8 f2 02 00 00       	call   410 <getpid>
 11e:	53                   	push   %ebx
 11f:	50                   	push   %eax
 120:	68 d8 09 00 00       	push   $0x9d8
 125:	6a 01                	push   $0x1
 127:	e8 eb 03 00 00       	call   517 <printf>
 12c:	83 c4 10             	add    $0x10,%esp
		exit();
 12f:	e8 5c 02 00 00       	call   390 <exit>
	}

	exit();
 134:	e8 57 02 00 00       	call   390 <exit>

00000139 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	57                   	push   %edi
 13d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 13e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 141:	8b 55 10             	mov    0x10(%ebp),%edx
 144:	8b 45 0c             	mov    0xc(%ebp),%eax
 147:	89 cb                	mov    %ecx,%ebx
 149:	89 df                	mov    %ebx,%edi
 14b:	89 d1                	mov    %edx,%ecx
 14d:	fc                   	cld    
 14e:	f3 aa                	rep stos %al,%es:(%edi)
 150:	89 ca                	mov    %ecx,%edx
 152:	89 fb                	mov    %edi,%ebx
 154:	89 5d 08             	mov    %ebx,0x8(%ebp)
 157:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 15a:	90                   	nop
 15b:	5b                   	pop    %ebx
 15c:	5f                   	pop    %edi
 15d:	5d                   	pop    %ebp
 15e:	c3                   	ret    

0000015f <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 15f:	55                   	push   %ebp
 160:	89 e5                	mov    %esp,%ebp
 162:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 165:	8b 45 08             	mov    0x8(%ebp),%eax
 168:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 16b:	90                   	nop
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	8d 50 01             	lea    0x1(%eax),%edx
 172:	89 55 08             	mov    %edx,0x8(%ebp)
 175:	8b 55 0c             	mov    0xc(%ebp),%edx
 178:	8d 4a 01             	lea    0x1(%edx),%ecx
 17b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17e:	0f b6 12             	movzbl (%edx),%edx
 181:	88 10                	mov    %dl,(%eax)
 183:	0f b6 00             	movzbl (%eax),%eax
 186:	84 c0                	test   %al,%al
 188:	75 e2                	jne    16c <strcpy+0xd>
    ;
  return os;
 18a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18d:	c9                   	leave  
 18e:	c3                   	ret    

0000018f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 18f:	55                   	push   %ebp
 190:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 192:	eb 08                	jmp    19c <strcmp+0xd>
    p++, q++;
 194:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 198:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	0f b6 00             	movzbl (%eax),%eax
 1a2:	84 c0                	test   %al,%al
 1a4:	74 10                	je     1b6 <strcmp+0x27>
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	0f b6 10             	movzbl (%eax),%edx
 1ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 1af:	0f b6 00             	movzbl (%eax),%eax
 1b2:	38 c2                	cmp    %al,%dl
 1b4:	74 de                	je     194 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1b6:	8b 45 08             	mov    0x8(%ebp),%eax
 1b9:	0f b6 00             	movzbl (%eax),%eax
 1bc:	0f b6 d0             	movzbl %al,%edx
 1bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c2:	0f b6 00             	movzbl (%eax),%eax
 1c5:	0f b6 c0             	movzbl %al,%eax
 1c8:	29 c2                	sub    %eax,%edx
 1ca:	89 d0                	mov    %edx,%eax
}
 1cc:	5d                   	pop    %ebp
 1cd:	c3                   	ret    

000001ce <strlen>:

uint
strlen(char *s)
{
 1ce:	55                   	push   %ebp
 1cf:	89 e5                	mov    %esp,%ebp
 1d1:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1db:	eb 04                	jmp    1e1 <strlen+0x13>
 1dd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	01 d0                	add    %edx,%eax
 1e9:	0f b6 00             	movzbl (%eax),%eax
 1ec:	84 c0                	test   %al,%al
 1ee:	75 ed                	jne    1dd <strlen+0xf>
    ;
  return n;
 1f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f3:	c9                   	leave  
 1f4:	c3                   	ret    

000001f5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f5:	55                   	push   %ebp
 1f6:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1f8:	8b 45 10             	mov    0x10(%ebp),%eax
 1fb:	50                   	push   %eax
 1fc:	ff 75 0c             	pushl  0xc(%ebp)
 1ff:	ff 75 08             	pushl  0x8(%ebp)
 202:	e8 32 ff ff ff       	call   139 <stosb>
 207:	83 c4 0c             	add    $0xc,%esp
  return dst;
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 20d:	c9                   	leave  
 20e:	c3                   	ret    

0000020f <strchr>:

char*
strchr(const char *s, char c)
{
 20f:	55                   	push   %ebp
 210:	89 e5                	mov    %esp,%ebp
 212:	83 ec 04             	sub    $0x4,%esp
 215:	8b 45 0c             	mov    0xc(%ebp),%eax
 218:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 21b:	eb 14                	jmp    231 <strchr+0x22>
    if(*s == c)
 21d:	8b 45 08             	mov    0x8(%ebp),%eax
 220:	0f b6 00             	movzbl (%eax),%eax
 223:	3a 45 fc             	cmp    -0x4(%ebp),%al
 226:	75 05                	jne    22d <strchr+0x1e>
      return (char*)s;
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	eb 13                	jmp    240 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 22d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 231:	8b 45 08             	mov    0x8(%ebp),%eax
 234:	0f b6 00             	movzbl (%eax),%eax
 237:	84 c0                	test   %al,%al
 239:	75 e2                	jne    21d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 23b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 240:	c9                   	leave  
 241:	c3                   	ret    

00000242 <gets>:

char*
gets(char *buf, int max)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 248:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 24f:	eb 42                	jmp    293 <gets+0x51>
    cc = read(0, &c, 1);
 251:	83 ec 04             	sub    $0x4,%esp
 254:	6a 01                	push   $0x1
 256:	8d 45 ef             	lea    -0x11(%ebp),%eax
 259:	50                   	push   %eax
 25a:	6a 00                	push   $0x0
 25c:	e8 47 01 00 00       	call   3a8 <read>
 261:	83 c4 10             	add    $0x10,%esp
 264:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 267:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 26b:	7e 33                	jle    2a0 <gets+0x5e>
      break;
    buf[i++] = c;
 26d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 270:	8d 50 01             	lea    0x1(%eax),%edx
 273:	89 55 f4             	mov    %edx,-0xc(%ebp)
 276:	89 c2                	mov    %eax,%edx
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	01 c2                	add    %eax,%edx
 27d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 281:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 283:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 287:	3c 0a                	cmp    $0xa,%al
 289:	74 16                	je     2a1 <gets+0x5f>
 28b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 28f:	3c 0d                	cmp    $0xd,%al
 291:	74 0e                	je     2a1 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 293:	8b 45 f4             	mov    -0xc(%ebp),%eax
 296:	83 c0 01             	add    $0x1,%eax
 299:	3b 45 0c             	cmp    0xc(%ebp),%eax
 29c:	7c b3                	jl     251 <gets+0xf>
 29e:	eb 01                	jmp    2a1 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2a0:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	01 d0                	add    %edx,%eax
 2a9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2af:	c9                   	leave  
 2b0:	c3                   	ret    

000002b1 <stat>:

int
stat(char *n, struct stat *st)
{
 2b1:	55                   	push   %ebp
 2b2:	89 e5                	mov    %esp,%ebp
 2b4:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b7:	83 ec 08             	sub    $0x8,%esp
 2ba:	6a 00                	push   $0x0
 2bc:	ff 75 08             	pushl  0x8(%ebp)
 2bf:	e8 0c 01 00 00       	call   3d0 <open>
 2c4:	83 c4 10             	add    $0x10,%esp
 2c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2ce:	79 07                	jns    2d7 <stat+0x26>
    return -1;
 2d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2d5:	eb 25                	jmp    2fc <stat+0x4b>
  r = fstat(fd, st);
 2d7:	83 ec 08             	sub    $0x8,%esp
 2da:	ff 75 0c             	pushl  0xc(%ebp)
 2dd:	ff 75 f4             	pushl  -0xc(%ebp)
 2e0:	e8 03 01 00 00       	call   3e8 <fstat>
 2e5:	83 c4 10             	add    $0x10,%esp
 2e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2eb:	83 ec 0c             	sub    $0xc,%esp
 2ee:	ff 75 f4             	pushl  -0xc(%ebp)
 2f1:	e8 c2 00 00 00       	call   3b8 <close>
 2f6:	83 c4 10             	add    $0x10,%esp
  return r;
 2f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2fc:	c9                   	leave  
 2fd:	c3                   	ret    

000002fe <atoi>:

int
atoi(const char *s)
{
 2fe:	55                   	push   %ebp
 2ff:	89 e5                	mov    %esp,%ebp
 301:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 304:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 30b:	eb 25                	jmp    332 <atoi+0x34>
    n = n*10 + *s++ - '0';
 30d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 310:	89 d0                	mov    %edx,%eax
 312:	c1 e0 02             	shl    $0x2,%eax
 315:	01 d0                	add    %edx,%eax
 317:	01 c0                	add    %eax,%eax
 319:	89 c1                	mov    %eax,%ecx
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	8d 50 01             	lea    0x1(%eax),%edx
 321:	89 55 08             	mov    %edx,0x8(%ebp)
 324:	0f b6 00             	movzbl (%eax),%eax
 327:	0f be c0             	movsbl %al,%eax
 32a:	01 c8                	add    %ecx,%eax
 32c:	83 e8 30             	sub    $0x30,%eax
 32f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 332:	8b 45 08             	mov    0x8(%ebp),%eax
 335:	0f b6 00             	movzbl (%eax),%eax
 338:	3c 2f                	cmp    $0x2f,%al
 33a:	7e 0a                	jle    346 <atoi+0x48>
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	0f b6 00             	movzbl (%eax),%eax
 342:	3c 39                	cmp    $0x39,%al
 344:	7e c7                	jle    30d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 346:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 349:	c9                   	leave  
 34a:	c3                   	ret    

0000034b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 351:	8b 45 08             	mov    0x8(%ebp),%eax
 354:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 357:	8b 45 0c             	mov    0xc(%ebp),%eax
 35a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 35d:	eb 17                	jmp    376 <memmove+0x2b>
    *dst++ = *src++;
 35f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 362:	8d 50 01             	lea    0x1(%eax),%edx
 365:	89 55 fc             	mov    %edx,-0x4(%ebp)
 368:	8b 55 f8             	mov    -0x8(%ebp),%edx
 36b:	8d 4a 01             	lea    0x1(%edx),%ecx
 36e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 371:	0f b6 12             	movzbl (%edx),%edx
 374:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 376:	8b 45 10             	mov    0x10(%ebp),%eax
 379:	8d 50 ff             	lea    -0x1(%eax),%edx
 37c:	89 55 10             	mov    %edx,0x10(%ebp)
 37f:	85 c0                	test   %eax,%eax
 381:	7f dc                	jg     35f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 383:	8b 45 08             	mov    0x8(%ebp),%eax
}
 386:	c9                   	leave  
 387:	c3                   	ret    

00000388 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 388:	b8 01 00 00 00       	mov    $0x1,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <exit>:
SYSCALL(exit)
 390:	b8 02 00 00 00       	mov    $0x2,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <wait>:
SYSCALL(wait)
 398:	b8 03 00 00 00       	mov    $0x3,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <pipe>:
SYSCALL(pipe)
 3a0:	b8 04 00 00 00       	mov    $0x4,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <read>:
SYSCALL(read)
 3a8:	b8 05 00 00 00       	mov    $0x5,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <write>:
SYSCALL(write)
 3b0:	b8 10 00 00 00       	mov    $0x10,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <close>:
SYSCALL(close)
 3b8:	b8 15 00 00 00       	mov    $0x15,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <kill>:
SYSCALL(kill)
 3c0:	b8 06 00 00 00       	mov    $0x6,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <exec>:
SYSCALL(exec)
 3c8:	b8 07 00 00 00       	mov    $0x7,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <open>:
SYSCALL(open)
 3d0:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <mknod>:
SYSCALL(mknod)
 3d8:	b8 11 00 00 00       	mov    $0x11,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <unlink>:
SYSCALL(unlink)
 3e0:	b8 12 00 00 00       	mov    $0x12,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <fstat>:
SYSCALL(fstat)
 3e8:	b8 08 00 00 00       	mov    $0x8,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <link>:
SYSCALL(link)
 3f0:	b8 13 00 00 00       	mov    $0x13,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <mkdir>:
SYSCALL(mkdir)
 3f8:	b8 14 00 00 00       	mov    $0x14,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <chdir>:
SYSCALL(chdir)
 400:	b8 09 00 00 00       	mov    $0x9,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <dup>:
SYSCALL(dup)
 408:	b8 0a 00 00 00       	mov    $0xa,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <getpid>:
SYSCALL(getpid)
 410:	b8 0b 00 00 00       	mov    $0xb,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <sbrk>:
SYSCALL(sbrk)
 418:	b8 0c 00 00 00       	mov    $0xc,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <sleep>:
SYSCALL(sleep)
 420:	b8 0d 00 00 00       	mov    $0xd,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <uptime>:
SYSCALL(uptime)
 428:	b8 0e 00 00 00       	mov    $0xe,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <setprio>:
SYSCALL(setprio)
 430:	b8 16 00 00 00       	mov    $0x16,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <getprio>:
SYSCALL(getprio)
 438:	b8 17 00 00 00       	mov    $0x17,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	83 ec 18             	sub    $0x18,%esp
 446:	8b 45 0c             	mov    0xc(%ebp),%eax
 449:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 44c:	83 ec 04             	sub    $0x4,%esp
 44f:	6a 01                	push   $0x1
 451:	8d 45 f4             	lea    -0xc(%ebp),%eax
 454:	50                   	push   %eax
 455:	ff 75 08             	pushl  0x8(%ebp)
 458:	e8 53 ff ff ff       	call   3b0 <write>
 45d:	83 c4 10             	add    $0x10,%esp
}
 460:	90                   	nop
 461:	c9                   	leave  
 462:	c3                   	ret    

00000463 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 463:	55                   	push   %ebp
 464:	89 e5                	mov    %esp,%ebp
 466:	53                   	push   %ebx
 467:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 46a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 471:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 475:	74 17                	je     48e <printint+0x2b>
 477:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 47b:	79 11                	jns    48e <printint+0x2b>
    neg = 1;
 47d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 484:	8b 45 0c             	mov    0xc(%ebp),%eax
 487:	f7 d8                	neg    %eax
 489:	89 45 ec             	mov    %eax,-0x14(%ebp)
 48c:	eb 06                	jmp    494 <printint+0x31>
  } else {
    x = xx;
 48e:	8b 45 0c             	mov    0xc(%ebp),%eax
 491:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 494:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 49b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 49e:	8d 41 01             	lea    0x1(%ecx),%eax
 4a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4a4:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4aa:	ba 00 00 00 00       	mov    $0x0,%edx
 4af:	f7 f3                	div    %ebx
 4b1:	89 d0                	mov    %edx,%eax
 4b3:	0f b6 80 58 0c 00 00 	movzbl 0xc58(%eax),%eax
 4ba:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4be:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c4:	ba 00 00 00 00       	mov    $0x0,%edx
 4c9:	f7 f3                	div    %ebx
 4cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d2:	75 c7                	jne    49b <printint+0x38>
  if(neg)
 4d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4d8:	74 2d                	je     507 <printint+0xa4>
    buf[i++] = '-';
 4da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4dd:	8d 50 01             	lea    0x1(%eax),%edx
 4e0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4e3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4e8:	eb 1d                	jmp    507 <printint+0xa4>
    putc(fd, buf[i]);
 4ea:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f0:	01 d0                	add    %edx,%eax
 4f2:	0f b6 00             	movzbl (%eax),%eax
 4f5:	0f be c0             	movsbl %al,%eax
 4f8:	83 ec 08             	sub    $0x8,%esp
 4fb:	50                   	push   %eax
 4fc:	ff 75 08             	pushl  0x8(%ebp)
 4ff:	e8 3c ff ff ff       	call   440 <putc>
 504:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 507:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 50b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 50f:	79 d9                	jns    4ea <printint+0x87>
    putc(fd, buf[i]);
}
 511:	90                   	nop
 512:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 515:	c9                   	leave  
 516:	c3                   	ret    

00000517 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 51d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 524:	8d 45 0c             	lea    0xc(%ebp),%eax
 527:	83 c0 04             	add    $0x4,%eax
 52a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 52d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 534:	e9 59 01 00 00       	jmp    692 <printf+0x17b>
    c = fmt[i] & 0xff;
 539:	8b 55 0c             	mov    0xc(%ebp),%edx
 53c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 53f:	01 d0                	add    %edx,%eax
 541:	0f b6 00             	movzbl (%eax),%eax
 544:	0f be c0             	movsbl %al,%eax
 547:	25 ff 00 00 00       	and    $0xff,%eax
 54c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 54f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 553:	75 2c                	jne    581 <printf+0x6a>
      if(c == '%'){
 555:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 559:	75 0c                	jne    567 <printf+0x50>
        state = '%';
 55b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 562:	e9 27 01 00 00       	jmp    68e <printf+0x177>
      } else {
        putc(fd, c);
 567:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 56a:	0f be c0             	movsbl %al,%eax
 56d:	83 ec 08             	sub    $0x8,%esp
 570:	50                   	push   %eax
 571:	ff 75 08             	pushl  0x8(%ebp)
 574:	e8 c7 fe ff ff       	call   440 <putc>
 579:	83 c4 10             	add    $0x10,%esp
 57c:	e9 0d 01 00 00       	jmp    68e <printf+0x177>
      }
    } else if(state == '%'){
 581:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 585:	0f 85 03 01 00 00    	jne    68e <printf+0x177>
      if(c == 'd'){
 58b:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 58f:	75 1e                	jne    5af <printf+0x98>
        printint(fd, *ap, 10, 1);
 591:	8b 45 e8             	mov    -0x18(%ebp),%eax
 594:	8b 00                	mov    (%eax),%eax
 596:	6a 01                	push   $0x1
 598:	6a 0a                	push   $0xa
 59a:	50                   	push   %eax
 59b:	ff 75 08             	pushl  0x8(%ebp)
 59e:	e8 c0 fe ff ff       	call   463 <printint>
 5a3:	83 c4 10             	add    $0x10,%esp
        ap++;
 5a6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5aa:	e9 d8 00 00 00       	jmp    687 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 5af:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5b3:	74 06                	je     5bb <printf+0xa4>
 5b5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5b9:	75 1e                	jne    5d9 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 5bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5be:	8b 00                	mov    (%eax),%eax
 5c0:	6a 00                	push   $0x0
 5c2:	6a 10                	push   $0x10
 5c4:	50                   	push   %eax
 5c5:	ff 75 08             	pushl  0x8(%ebp)
 5c8:	e8 96 fe ff ff       	call   463 <printint>
 5cd:	83 c4 10             	add    $0x10,%esp
        ap++;
 5d0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d4:	e9 ae 00 00 00       	jmp    687 <printf+0x170>
      } else if(c == 's'){
 5d9:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5dd:	75 43                	jne    622 <printf+0x10b>
        s = (char*)*ap;
 5df:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e2:	8b 00                	mov    (%eax),%eax
 5e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5e7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5eb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5ef:	75 25                	jne    616 <printf+0xff>
          s = "(null)";
 5f1:	c7 45 f4 03 0a 00 00 	movl   $0xa03,-0xc(%ebp)
        while(*s != 0){
 5f8:	eb 1c                	jmp    616 <printf+0xff>
          putc(fd, *s);
 5fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5fd:	0f b6 00             	movzbl (%eax),%eax
 600:	0f be c0             	movsbl %al,%eax
 603:	83 ec 08             	sub    $0x8,%esp
 606:	50                   	push   %eax
 607:	ff 75 08             	pushl  0x8(%ebp)
 60a:	e8 31 fe ff ff       	call   440 <putc>
 60f:	83 c4 10             	add    $0x10,%esp
          s++;
 612:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 616:	8b 45 f4             	mov    -0xc(%ebp),%eax
 619:	0f b6 00             	movzbl (%eax),%eax
 61c:	84 c0                	test   %al,%al
 61e:	75 da                	jne    5fa <printf+0xe3>
 620:	eb 65                	jmp    687 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 622:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 626:	75 1d                	jne    645 <printf+0x12e>
        putc(fd, *ap);
 628:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62b:	8b 00                	mov    (%eax),%eax
 62d:	0f be c0             	movsbl %al,%eax
 630:	83 ec 08             	sub    $0x8,%esp
 633:	50                   	push   %eax
 634:	ff 75 08             	pushl  0x8(%ebp)
 637:	e8 04 fe ff ff       	call   440 <putc>
 63c:	83 c4 10             	add    $0x10,%esp
        ap++;
 63f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 643:	eb 42                	jmp    687 <printf+0x170>
      } else if(c == '%'){
 645:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 649:	75 17                	jne    662 <printf+0x14b>
        putc(fd, c);
 64b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64e:	0f be c0             	movsbl %al,%eax
 651:	83 ec 08             	sub    $0x8,%esp
 654:	50                   	push   %eax
 655:	ff 75 08             	pushl  0x8(%ebp)
 658:	e8 e3 fd ff ff       	call   440 <putc>
 65d:	83 c4 10             	add    $0x10,%esp
 660:	eb 25                	jmp    687 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 662:	83 ec 08             	sub    $0x8,%esp
 665:	6a 25                	push   $0x25
 667:	ff 75 08             	pushl  0x8(%ebp)
 66a:	e8 d1 fd ff ff       	call   440 <putc>
 66f:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 672:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 675:	0f be c0             	movsbl %al,%eax
 678:	83 ec 08             	sub    $0x8,%esp
 67b:	50                   	push   %eax
 67c:	ff 75 08             	pushl  0x8(%ebp)
 67f:	e8 bc fd ff ff       	call   440 <putc>
 684:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 687:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 68e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 692:	8b 55 0c             	mov    0xc(%ebp),%edx
 695:	8b 45 f0             	mov    -0x10(%ebp),%eax
 698:	01 d0                	add    %edx,%eax
 69a:	0f b6 00             	movzbl (%eax),%eax
 69d:	84 c0                	test   %al,%al
 69f:	0f 85 94 fe ff ff    	jne    539 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6a5:	90                   	nop
 6a6:	c9                   	leave  
 6a7:	c3                   	ret    

000006a8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a8:	55                   	push   %ebp
 6a9:	89 e5                	mov    %esp,%ebp
 6ab:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	83 e8 08             	sub    $0x8,%eax
 6b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b7:	a1 74 0c 00 00       	mov    0xc74,%eax
 6bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6bf:	eb 24                	jmp    6e5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c4:	8b 00                	mov    (%eax),%eax
 6c6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c9:	77 12                	ja     6dd <free+0x35>
 6cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6d1:	77 24                	ja     6f7 <free+0x4f>
 6d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d6:	8b 00                	mov    (%eax),%eax
 6d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6db:	77 1a                	ja     6f7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e0:	8b 00                	mov    (%eax),%eax
 6e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6eb:	76 d4                	jbe    6c1 <free+0x19>
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	8b 00                	mov    (%eax),%eax
 6f2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f5:	76 ca                	jbe    6c1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fa:	8b 40 04             	mov    0x4(%eax),%eax
 6fd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 704:	8b 45 f8             	mov    -0x8(%ebp),%eax
 707:	01 c2                	add    %eax,%edx
 709:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70c:	8b 00                	mov    (%eax),%eax
 70e:	39 c2                	cmp    %eax,%edx
 710:	75 24                	jne    736 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 712:	8b 45 f8             	mov    -0x8(%ebp),%eax
 715:	8b 50 04             	mov    0x4(%eax),%edx
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	8b 40 04             	mov    0x4(%eax),%eax
 720:	01 c2                	add    %eax,%edx
 722:	8b 45 f8             	mov    -0x8(%ebp),%eax
 725:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 728:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72b:	8b 00                	mov    (%eax),%eax
 72d:	8b 10                	mov    (%eax),%edx
 72f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 732:	89 10                	mov    %edx,(%eax)
 734:	eb 0a                	jmp    740 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 736:	8b 45 fc             	mov    -0x4(%ebp),%eax
 739:	8b 10                	mov    (%eax),%edx
 73b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 740:	8b 45 fc             	mov    -0x4(%ebp),%eax
 743:	8b 40 04             	mov    0x4(%eax),%eax
 746:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 74d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 750:	01 d0                	add    %edx,%eax
 752:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 755:	75 20                	jne    777 <free+0xcf>
    p->s.size += bp->s.size;
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 50 04             	mov    0x4(%eax),%edx
 75d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 760:	8b 40 04             	mov    0x4(%eax),%eax
 763:	01 c2                	add    %eax,%edx
 765:	8b 45 fc             	mov    -0x4(%ebp),%eax
 768:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 76b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76e:	8b 10                	mov    (%eax),%edx
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	89 10                	mov    %edx,(%eax)
 775:	eb 08                	jmp    77f <free+0xd7>
  } else
    p->s.ptr = bp;
 777:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 77d:	89 10                	mov    %edx,(%eax)
  freep = p;
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	a3 74 0c 00 00       	mov    %eax,0xc74
}
 787:	90                   	nop
 788:	c9                   	leave  
 789:	c3                   	ret    

0000078a <morecore>:

static Header*
morecore(uint nu)
{
 78a:	55                   	push   %ebp
 78b:	89 e5                	mov    %esp,%ebp
 78d:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 790:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 797:	77 07                	ja     7a0 <morecore+0x16>
    nu = 4096;
 799:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
 7a3:	c1 e0 03             	shl    $0x3,%eax
 7a6:	83 ec 0c             	sub    $0xc,%esp
 7a9:	50                   	push   %eax
 7aa:	e8 69 fc ff ff       	call   418 <sbrk>
 7af:	83 c4 10             	add    $0x10,%esp
 7b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7b5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7b9:	75 07                	jne    7c2 <morecore+0x38>
    return 0;
 7bb:	b8 00 00 00 00       	mov    $0x0,%eax
 7c0:	eb 26                	jmp    7e8 <morecore+0x5e>
  hp = (Header*)p;
 7c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cb:	8b 55 08             	mov    0x8(%ebp),%edx
 7ce:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d4:	83 c0 08             	add    $0x8,%eax
 7d7:	83 ec 0c             	sub    $0xc,%esp
 7da:	50                   	push   %eax
 7db:	e8 c8 fe ff ff       	call   6a8 <free>
 7e0:	83 c4 10             	add    $0x10,%esp
  return freep;
 7e3:	a1 74 0c 00 00       	mov    0xc74,%eax
}
 7e8:	c9                   	leave  
 7e9:	c3                   	ret    

000007ea <malloc>:

void*
malloc(uint nbytes)
{
 7ea:	55                   	push   %ebp
 7eb:	89 e5                	mov    %esp,%ebp
 7ed:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f0:	8b 45 08             	mov    0x8(%ebp),%eax
 7f3:	83 c0 07             	add    $0x7,%eax
 7f6:	c1 e8 03             	shr    $0x3,%eax
 7f9:	83 c0 01             	add    $0x1,%eax
 7fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7ff:	a1 74 0c 00 00       	mov    0xc74,%eax
 804:	89 45 f0             	mov    %eax,-0x10(%ebp)
 807:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80b:	75 23                	jne    830 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 80d:	c7 45 f0 6c 0c 00 00 	movl   $0xc6c,-0x10(%ebp)
 814:	8b 45 f0             	mov    -0x10(%ebp),%eax
 817:	a3 74 0c 00 00       	mov    %eax,0xc74
 81c:	a1 74 0c 00 00       	mov    0xc74,%eax
 821:	a3 6c 0c 00 00       	mov    %eax,0xc6c
    base.s.size = 0;
 826:	c7 05 70 0c 00 00 00 	movl   $0x0,0xc70
 82d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 830:	8b 45 f0             	mov    -0x10(%ebp),%eax
 833:	8b 00                	mov    (%eax),%eax
 835:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 838:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83b:	8b 40 04             	mov    0x4(%eax),%eax
 83e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 841:	72 4d                	jb     890 <malloc+0xa6>
      if(p->s.size == nunits)
 843:	8b 45 f4             	mov    -0xc(%ebp),%eax
 846:	8b 40 04             	mov    0x4(%eax),%eax
 849:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 84c:	75 0c                	jne    85a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 84e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 851:	8b 10                	mov    (%eax),%edx
 853:	8b 45 f0             	mov    -0x10(%ebp),%eax
 856:	89 10                	mov    %edx,(%eax)
 858:	eb 26                	jmp    880 <malloc+0x96>
      else {
        p->s.size -= nunits;
 85a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85d:	8b 40 04             	mov    0x4(%eax),%eax
 860:	2b 45 ec             	sub    -0x14(%ebp),%eax
 863:	89 c2                	mov    %eax,%edx
 865:	8b 45 f4             	mov    -0xc(%ebp),%eax
 868:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 86b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86e:	8b 40 04             	mov    0x4(%eax),%eax
 871:	c1 e0 03             	shl    $0x3,%eax
 874:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 877:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 87d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 880:	8b 45 f0             	mov    -0x10(%ebp),%eax
 883:	a3 74 0c 00 00       	mov    %eax,0xc74
      return (void*)(p + 1);
 888:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88b:	83 c0 08             	add    $0x8,%eax
 88e:	eb 3b                	jmp    8cb <malloc+0xe1>
    }
    if(p == freep)
 890:	a1 74 0c 00 00       	mov    0xc74,%eax
 895:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 898:	75 1e                	jne    8b8 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 89a:	83 ec 0c             	sub    $0xc,%esp
 89d:	ff 75 ec             	pushl  -0x14(%ebp)
 8a0:	e8 e5 fe ff ff       	call   78a <morecore>
 8a5:	83 c4 10             	add    $0x10,%esp
 8a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8af:	75 07                	jne    8b8 <malloc+0xce>
        return 0;
 8b1:	b8 00 00 00 00       	mov    $0x0,%eax
 8b6:	eb 13                	jmp    8cb <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c1:	8b 00                	mov    (%eax),%eax
 8c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8c6:	e9 6d ff ff ff       	jmp    838 <malloc+0x4e>
}
 8cb:	c9                   	leave  
 8cc:	c3                   	ret    
