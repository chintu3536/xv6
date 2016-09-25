
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "iput test\n");
       6:	a1 d8 62 00 00       	mov    0x62d8,%eax
       b:	83 ec 08             	sub    $0x8,%esp
       e:	68 32 44 00 00       	push   $0x4432
      13:	50                   	push   %eax
      14:	e8 4a 40 00 00       	call   4063 <printf>
      19:	83 c4 10             	add    $0x10,%esp

  if(mkdir("iputdir") < 0){
      1c:	83 ec 0c             	sub    $0xc,%esp
      1f:	68 3d 44 00 00       	push   $0x443d
      24:	e8 1b 3f 00 00       	call   3f44 <mkdir>
      29:	83 c4 10             	add    $0x10,%esp
      2c:	85 c0                	test   %eax,%eax
      2e:	79 1b                	jns    4b <iputtest+0x4b>
    printf(stdout, "mkdir failed\n");
      30:	a1 d8 62 00 00       	mov    0x62d8,%eax
      35:	83 ec 08             	sub    $0x8,%esp
      38:	68 45 44 00 00       	push   $0x4445
      3d:	50                   	push   %eax
      3e:	e8 20 40 00 00       	call   4063 <printf>
      43:	83 c4 10             	add    $0x10,%esp
    exit();
      46:	e8 91 3e 00 00       	call   3edc <exit>
  }
  if(chdir("iputdir") < 0){
      4b:	83 ec 0c             	sub    $0xc,%esp
      4e:	68 3d 44 00 00       	push   $0x443d
      53:	e8 f4 3e 00 00       	call   3f4c <chdir>
      58:	83 c4 10             	add    $0x10,%esp
      5b:	85 c0                	test   %eax,%eax
      5d:	79 1b                	jns    7a <iputtest+0x7a>
    printf(stdout, "chdir iputdir failed\n");
      5f:	a1 d8 62 00 00       	mov    0x62d8,%eax
      64:	83 ec 08             	sub    $0x8,%esp
      67:	68 53 44 00 00       	push   $0x4453
      6c:	50                   	push   %eax
      6d:	e8 f1 3f 00 00       	call   4063 <printf>
      72:	83 c4 10             	add    $0x10,%esp
    exit();
      75:	e8 62 3e 00 00       	call   3edc <exit>
  }
  if(unlink("../iputdir") < 0){
      7a:	83 ec 0c             	sub    $0xc,%esp
      7d:	68 69 44 00 00       	push   $0x4469
      82:	e8 a5 3e 00 00       	call   3f2c <unlink>
      87:	83 c4 10             	add    $0x10,%esp
      8a:	85 c0                	test   %eax,%eax
      8c:	79 1b                	jns    a9 <iputtest+0xa9>
    printf(stdout, "unlink ../iputdir failed\n");
      8e:	a1 d8 62 00 00       	mov    0x62d8,%eax
      93:	83 ec 08             	sub    $0x8,%esp
      96:	68 74 44 00 00       	push   $0x4474
      9b:	50                   	push   %eax
      9c:	e8 c2 3f 00 00       	call   4063 <printf>
      a1:	83 c4 10             	add    $0x10,%esp
    exit();
      a4:	e8 33 3e 00 00       	call   3edc <exit>
  }
  if(chdir("/") < 0){
      a9:	83 ec 0c             	sub    $0xc,%esp
      ac:	68 8e 44 00 00       	push   $0x448e
      b1:	e8 96 3e 00 00       	call   3f4c <chdir>
      b6:	83 c4 10             	add    $0x10,%esp
      b9:	85 c0                	test   %eax,%eax
      bb:	79 1b                	jns    d8 <iputtest+0xd8>
    printf(stdout, "chdir / failed\n");
      bd:	a1 d8 62 00 00       	mov    0x62d8,%eax
      c2:	83 ec 08             	sub    $0x8,%esp
      c5:	68 90 44 00 00       	push   $0x4490
      ca:	50                   	push   %eax
      cb:	e8 93 3f 00 00       	call   4063 <printf>
      d0:	83 c4 10             	add    $0x10,%esp
    exit();
      d3:	e8 04 3e 00 00       	call   3edc <exit>
  }
  printf(stdout, "iput test ok\n");
      d8:	a1 d8 62 00 00       	mov    0x62d8,%eax
      dd:	83 ec 08             	sub    $0x8,%esp
      e0:	68 a0 44 00 00       	push   $0x44a0
      e5:	50                   	push   %eax
      e6:	e8 78 3f 00 00       	call   4063 <printf>
      eb:	83 c4 10             	add    $0x10,%esp
}
      ee:	90                   	nop
      ef:	c9                   	leave  
      f0:	c3                   	ret    

000000f1 <exitiputtest>:

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
      f1:	55                   	push   %ebp
      f2:	89 e5                	mov    %esp,%ebp
      f4:	83 ec 18             	sub    $0x18,%esp
  int pid;

  printf(stdout, "exitiput test\n");
      f7:	a1 d8 62 00 00       	mov    0x62d8,%eax
      fc:	83 ec 08             	sub    $0x8,%esp
      ff:	68 ae 44 00 00       	push   $0x44ae
     104:	50                   	push   %eax
     105:	e8 59 3f 00 00       	call   4063 <printf>
     10a:	83 c4 10             	add    $0x10,%esp

  pid = fork();
     10d:	e8 c2 3d 00 00       	call   3ed4 <fork>
     112:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid < 0){
     115:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     119:	79 1b                	jns    136 <exitiputtest+0x45>
    printf(stdout, "fork failed\n");
     11b:	a1 d8 62 00 00       	mov    0x62d8,%eax
     120:	83 ec 08             	sub    $0x8,%esp
     123:	68 bd 44 00 00       	push   $0x44bd
     128:	50                   	push   %eax
     129:	e8 35 3f 00 00       	call   4063 <printf>
     12e:	83 c4 10             	add    $0x10,%esp
    exit();
     131:	e8 a6 3d 00 00       	call   3edc <exit>
  }
  if(pid == 0){
     136:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     13a:	0f 85 92 00 00 00    	jne    1d2 <exitiputtest+0xe1>
    if(mkdir("iputdir") < 0){
     140:	83 ec 0c             	sub    $0xc,%esp
     143:	68 3d 44 00 00       	push   $0x443d
     148:	e8 f7 3d 00 00       	call   3f44 <mkdir>
     14d:	83 c4 10             	add    $0x10,%esp
     150:	85 c0                	test   %eax,%eax
     152:	79 1b                	jns    16f <exitiputtest+0x7e>
      printf(stdout, "mkdir failed\n");
     154:	a1 d8 62 00 00       	mov    0x62d8,%eax
     159:	83 ec 08             	sub    $0x8,%esp
     15c:	68 45 44 00 00       	push   $0x4445
     161:	50                   	push   %eax
     162:	e8 fc 3e 00 00       	call   4063 <printf>
     167:	83 c4 10             	add    $0x10,%esp
      exit();
     16a:	e8 6d 3d 00 00       	call   3edc <exit>
    }
    if(chdir("iputdir") < 0){
     16f:	83 ec 0c             	sub    $0xc,%esp
     172:	68 3d 44 00 00       	push   $0x443d
     177:	e8 d0 3d 00 00       	call   3f4c <chdir>
     17c:	83 c4 10             	add    $0x10,%esp
     17f:	85 c0                	test   %eax,%eax
     181:	79 1b                	jns    19e <exitiputtest+0xad>
      printf(stdout, "child chdir failed\n");
     183:	a1 d8 62 00 00       	mov    0x62d8,%eax
     188:	83 ec 08             	sub    $0x8,%esp
     18b:	68 ca 44 00 00       	push   $0x44ca
     190:	50                   	push   %eax
     191:	e8 cd 3e 00 00       	call   4063 <printf>
     196:	83 c4 10             	add    $0x10,%esp
      exit();
     199:	e8 3e 3d 00 00       	call   3edc <exit>
    }
    if(unlink("../iputdir") < 0){
     19e:	83 ec 0c             	sub    $0xc,%esp
     1a1:	68 69 44 00 00       	push   $0x4469
     1a6:	e8 81 3d 00 00       	call   3f2c <unlink>
     1ab:	83 c4 10             	add    $0x10,%esp
     1ae:	85 c0                	test   %eax,%eax
     1b0:	79 1b                	jns    1cd <exitiputtest+0xdc>
      printf(stdout, "unlink ../iputdir failed\n");
     1b2:	a1 d8 62 00 00       	mov    0x62d8,%eax
     1b7:	83 ec 08             	sub    $0x8,%esp
     1ba:	68 74 44 00 00       	push   $0x4474
     1bf:	50                   	push   %eax
     1c0:	e8 9e 3e 00 00       	call   4063 <printf>
     1c5:	83 c4 10             	add    $0x10,%esp
      exit();
     1c8:	e8 0f 3d 00 00       	call   3edc <exit>
    }
    exit();
     1cd:	e8 0a 3d 00 00       	call   3edc <exit>
  }
  wait();
     1d2:	e8 0d 3d 00 00       	call   3ee4 <wait>
  printf(stdout, "exitiput test ok\n");
     1d7:	a1 d8 62 00 00       	mov    0x62d8,%eax
     1dc:	83 ec 08             	sub    $0x8,%esp
     1df:	68 de 44 00 00       	push   $0x44de
     1e4:	50                   	push   %eax
     1e5:	e8 79 3e 00 00       	call   4063 <printf>
     1ea:	83 c4 10             	add    $0x10,%esp
}
     1ed:	90                   	nop
     1ee:	c9                   	leave  
     1ef:	c3                   	ret    

000001f0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	83 ec 18             	sub    $0x18,%esp
  int pid;

  printf(stdout, "openiput test\n");
     1f6:	a1 d8 62 00 00       	mov    0x62d8,%eax
     1fb:	83 ec 08             	sub    $0x8,%esp
     1fe:	68 f0 44 00 00       	push   $0x44f0
     203:	50                   	push   %eax
     204:	e8 5a 3e 00 00       	call   4063 <printf>
     209:	83 c4 10             	add    $0x10,%esp
  if(mkdir("oidir") < 0){
     20c:	83 ec 0c             	sub    $0xc,%esp
     20f:	68 ff 44 00 00       	push   $0x44ff
     214:	e8 2b 3d 00 00       	call   3f44 <mkdir>
     219:	83 c4 10             	add    $0x10,%esp
     21c:	85 c0                	test   %eax,%eax
     21e:	79 1b                	jns    23b <openiputtest+0x4b>
    printf(stdout, "mkdir oidir failed\n");
     220:	a1 d8 62 00 00       	mov    0x62d8,%eax
     225:	83 ec 08             	sub    $0x8,%esp
     228:	68 05 45 00 00       	push   $0x4505
     22d:	50                   	push   %eax
     22e:	e8 30 3e 00 00       	call   4063 <printf>
     233:	83 c4 10             	add    $0x10,%esp
    exit();
     236:	e8 a1 3c 00 00       	call   3edc <exit>
  }
  pid = fork();
     23b:	e8 94 3c 00 00       	call   3ed4 <fork>
     240:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid < 0){
     243:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     247:	79 1b                	jns    264 <openiputtest+0x74>
    printf(stdout, "fork failed\n");
     249:	a1 d8 62 00 00       	mov    0x62d8,%eax
     24e:	83 ec 08             	sub    $0x8,%esp
     251:	68 bd 44 00 00       	push   $0x44bd
     256:	50                   	push   %eax
     257:	e8 07 3e 00 00       	call   4063 <printf>
     25c:	83 c4 10             	add    $0x10,%esp
    exit();
     25f:	e8 78 3c 00 00       	call   3edc <exit>
  }
  if(pid == 0){
     264:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     268:	75 3b                	jne    2a5 <openiputtest+0xb5>
    int fd = open("oidir", O_RDWR);
     26a:	83 ec 08             	sub    $0x8,%esp
     26d:	6a 02                	push   $0x2
     26f:	68 ff 44 00 00       	push   $0x44ff
     274:	e8 a3 3c 00 00       	call   3f1c <open>
     279:	83 c4 10             	add    $0x10,%esp
     27c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0){
     27f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     283:	78 1b                	js     2a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     285:	a1 d8 62 00 00       	mov    0x62d8,%eax
     28a:	83 ec 08             	sub    $0x8,%esp
     28d:	68 1c 45 00 00       	push   $0x451c
     292:	50                   	push   %eax
     293:	e8 cb 3d 00 00       	call   4063 <printf>
     298:	83 c4 10             	add    $0x10,%esp
      exit();
     29b:	e8 3c 3c 00 00       	call   3edc <exit>
    }
    exit();
     2a0:	e8 37 3c 00 00       	call   3edc <exit>
  }
  sleep(1);
     2a5:	83 ec 0c             	sub    $0xc,%esp
     2a8:	6a 01                	push   $0x1
     2aa:	e8 bd 3c 00 00       	call   3f6c <sleep>
     2af:	83 c4 10             	add    $0x10,%esp
  if(unlink("oidir") != 0){
     2b2:	83 ec 0c             	sub    $0xc,%esp
     2b5:	68 ff 44 00 00       	push   $0x44ff
     2ba:	e8 6d 3c 00 00       	call   3f2c <unlink>
     2bf:	83 c4 10             	add    $0x10,%esp
     2c2:	85 c0                	test   %eax,%eax
     2c4:	74 1b                	je     2e1 <openiputtest+0xf1>
    printf(stdout, "unlink failed\n");
     2c6:	a1 d8 62 00 00       	mov    0x62d8,%eax
     2cb:	83 ec 08             	sub    $0x8,%esp
     2ce:	68 40 45 00 00       	push   $0x4540
     2d3:	50                   	push   %eax
     2d4:	e8 8a 3d 00 00       	call   4063 <printf>
     2d9:	83 c4 10             	add    $0x10,%esp
    exit();
     2dc:	e8 fb 3b 00 00       	call   3edc <exit>
  }
  wait();
     2e1:	e8 fe 3b 00 00       	call   3ee4 <wait>
  printf(stdout, "openiput test ok\n");
     2e6:	a1 d8 62 00 00       	mov    0x62d8,%eax
     2eb:	83 ec 08             	sub    $0x8,%esp
     2ee:	68 4f 45 00 00       	push   $0x454f
     2f3:	50                   	push   %eax
     2f4:	e8 6a 3d 00 00       	call   4063 <printf>
     2f9:	83 c4 10             	add    $0x10,%esp
}
     2fc:	90                   	nop
     2fd:	c9                   	leave  
     2fe:	c3                   	ret    

000002ff <opentest>:

// simple file system tests

void
opentest(void)
{
     2ff:	55                   	push   %ebp
     300:	89 e5                	mov    %esp,%ebp
     302:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(stdout, "open test\n");
     305:	a1 d8 62 00 00       	mov    0x62d8,%eax
     30a:	83 ec 08             	sub    $0x8,%esp
     30d:	68 61 45 00 00       	push   $0x4561
     312:	50                   	push   %eax
     313:	e8 4b 3d 00 00       	call   4063 <printf>
     318:	83 c4 10             	add    $0x10,%esp
  fd = open("echo", 0);
     31b:	83 ec 08             	sub    $0x8,%esp
     31e:	6a 00                	push   $0x0
     320:	68 1c 44 00 00       	push   $0x441c
     325:	e8 f2 3b 00 00       	call   3f1c <open>
     32a:	83 c4 10             	add    $0x10,%esp
     32d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
     330:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     334:	79 1b                	jns    351 <opentest+0x52>
    printf(stdout, "open echo failed!\n");
     336:	a1 d8 62 00 00       	mov    0x62d8,%eax
     33b:	83 ec 08             	sub    $0x8,%esp
     33e:	68 6c 45 00 00       	push   $0x456c
     343:	50                   	push   %eax
     344:	e8 1a 3d 00 00       	call   4063 <printf>
     349:	83 c4 10             	add    $0x10,%esp
    exit();
     34c:	e8 8b 3b 00 00       	call   3edc <exit>
  }
  close(fd);
     351:	83 ec 0c             	sub    $0xc,%esp
     354:	ff 75 f4             	pushl  -0xc(%ebp)
     357:	e8 a8 3b 00 00       	call   3f04 <close>
     35c:	83 c4 10             	add    $0x10,%esp
  fd = open("doesnotexist", 0);
     35f:	83 ec 08             	sub    $0x8,%esp
     362:	6a 00                	push   $0x0
     364:	68 7f 45 00 00       	push   $0x457f
     369:	e8 ae 3b 00 00       	call   3f1c <open>
     36e:	83 c4 10             	add    $0x10,%esp
     371:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
     374:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     378:	78 1b                	js     395 <opentest+0x96>
    printf(stdout, "open doesnotexist succeeded!\n");
     37a:	a1 d8 62 00 00       	mov    0x62d8,%eax
     37f:	83 ec 08             	sub    $0x8,%esp
     382:	68 8c 45 00 00       	push   $0x458c
     387:	50                   	push   %eax
     388:	e8 d6 3c 00 00       	call   4063 <printf>
     38d:	83 c4 10             	add    $0x10,%esp
    exit();
     390:	e8 47 3b 00 00       	call   3edc <exit>
  }
  printf(stdout, "open test ok\n");
     395:	a1 d8 62 00 00       	mov    0x62d8,%eax
     39a:	83 ec 08             	sub    $0x8,%esp
     39d:	68 aa 45 00 00       	push   $0x45aa
     3a2:	50                   	push   %eax
     3a3:	e8 bb 3c 00 00       	call   4063 <printf>
     3a8:	83 c4 10             	add    $0x10,%esp
}
     3ab:	90                   	nop
     3ac:	c9                   	leave  
     3ad:	c3                   	ret    

000003ae <writetest>:

void
writetest(void)
{
     3ae:	55                   	push   %ebp
     3af:	89 e5                	mov    %esp,%ebp
     3b1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
     3b4:	a1 d8 62 00 00       	mov    0x62d8,%eax
     3b9:	83 ec 08             	sub    $0x8,%esp
     3bc:	68 b8 45 00 00       	push   $0x45b8
     3c1:	50                   	push   %eax
     3c2:	e8 9c 3c 00 00       	call   4063 <printf>
     3c7:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_CREATE|O_RDWR);
     3ca:	83 ec 08             	sub    $0x8,%esp
     3cd:	68 02 02 00 00       	push   $0x202
     3d2:	68 c9 45 00 00       	push   $0x45c9
     3d7:	e8 40 3b 00 00       	call   3f1c <open>
     3dc:	83 c4 10             	add    $0x10,%esp
     3df:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     3e2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     3e6:	78 22                	js     40a <writetest+0x5c>
    printf(stdout, "creat small succeeded; ok\n");
     3e8:	a1 d8 62 00 00       	mov    0x62d8,%eax
     3ed:	83 ec 08             	sub    $0x8,%esp
     3f0:	68 cf 45 00 00       	push   $0x45cf
     3f5:	50                   	push   %eax
     3f6:	e8 68 3c 00 00       	call   4063 <printf>
     3fb:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     3fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     405:	e9 8f 00 00 00       	jmp    499 <writetest+0xeb>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     40a:	a1 d8 62 00 00       	mov    0x62d8,%eax
     40f:	83 ec 08             	sub    $0x8,%esp
     412:	68 ea 45 00 00       	push   $0x45ea
     417:	50                   	push   %eax
     418:	e8 46 3c 00 00       	call   4063 <printf>
     41d:	83 c4 10             	add    $0x10,%esp
    exit();
     420:	e8 b7 3a 00 00       	call   3edc <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     425:	83 ec 04             	sub    $0x4,%esp
     428:	6a 0a                	push   $0xa
     42a:	68 06 46 00 00       	push   $0x4606
     42f:	ff 75 f0             	pushl  -0x10(%ebp)
     432:	e8 c5 3a 00 00       	call   3efc <write>
     437:	83 c4 10             	add    $0x10,%esp
     43a:	83 f8 0a             	cmp    $0xa,%eax
     43d:	74 1e                	je     45d <writetest+0xaf>
      printf(stdout, "error: write aa %d new file failed\n", i);
     43f:	a1 d8 62 00 00       	mov    0x62d8,%eax
     444:	83 ec 04             	sub    $0x4,%esp
     447:	ff 75 f4             	pushl  -0xc(%ebp)
     44a:	68 14 46 00 00       	push   $0x4614
     44f:	50                   	push   %eax
     450:	e8 0e 3c 00 00       	call   4063 <printf>
     455:	83 c4 10             	add    $0x10,%esp
      exit();
     458:	e8 7f 3a 00 00       	call   3edc <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     45d:	83 ec 04             	sub    $0x4,%esp
     460:	6a 0a                	push   $0xa
     462:	68 38 46 00 00       	push   $0x4638
     467:	ff 75 f0             	pushl  -0x10(%ebp)
     46a:	e8 8d 3a 00 00       	call   3efc <write>
     46f:	83 c4 10             	add    $0x10,%esp
     472:	83 f8 0a             	cmp    $0xa,%eax
     475:	74 1e                	je     495 <writetest+0xe7>
      printf(stdout, "error: write bb %d new file failed\n", i);
     477:	a1 d8 62 00 00       	mov    0x62d8,%eax
     47c:	83 ec 04             	sub    $0x4,%esp
     47f:	ff 75 f4             	pushl  -0xc(%ebp)
     482:	68 44 46 00 00       	push   $0x4644
     487:	50                   	push   %eax
     488:	e8 d6 3b 00 00       	call   4063 <printf>
     48d:	83 c4 10             	add    $0x10,%esp
      exit();
     490:	e8 47 3a 00 00       	call   3edc <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     495:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     499:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     49d:	7e 86                	jle    425 <writetest+0x77>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     49f:	a1 d8 62 00 00       	mov    0x62d8,%eax
     4a4:	83 ec 08             	sub    $0x8,%esp
     4a7:	68 68 46 00 00       	push   $0x4668
     4ac:	50                   	push   %eax
     4ad:	e8 b1 3b 00 00       	call   4063 <printf>
     4b2:	83 c4 10             	add    $0x10,%esp
  close(fd);
     4b5:	83 ec 0c             	sub    $0xc,%esp
     4b8:	ff 75 f0             	pushl  -0x10(%ebp)
     4bb:	e8 44 3a 00 00       	call   3f04 <close>
     4c0:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     4c3:	83 ec 08             	sub    $0x8,%esp
     4c6:	6a 00                	push   $0x0
     4c8:	68 c9 45 00 00       	push   $0x45c9
     4cd:	e8 4a 3a 00 00       	call   3f1c <open>
     4d2:	83 c4 10             	add    $0x10,%esp
     4d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     4d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     4dc:	78 3c                	js     51a <writetest+0x16c>
    printf(stdout, "open small succeeded ok\n");
     4de:	a1 d8 62 00 00       	mov    0x62d8,%eax
     4e3:	83 ec 08             	sub    $0x8,%esp
     4e6:	68 73 46 00 00       	push   $0x4673
     4eb:	50                   	push   %eax
     4ec:	e8 72 3b 00 00       	call   4063 <printf>
     4f1:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     4f4:	83 ec 04             	sub    $0x4,%esp
     4f7:	68 d0 07 00 00       	push   $0x7d0
     4fc:	68 c0 8a 00 00       	push   $0x8ac0
     501:	ff 75 f0             	pushl  -0x10(%ebp)
     504:	e8 eb 39 00 00       	call   3ef4 <read>
     509:	83 c4 10             	add    $0x10,%esp
     50c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     50f:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     516:	75 57                	jne    56f <writetest+0x1c1>
     518:	eb 1b                	jmp    535 <writetest+0x187>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     51a:	a1 d8 62 00 00       	mov    0x62d8,%eax
     51f:	83 ec 08             	sub    $0x8,%esp
     522:	68 8c 46 00 00       	push   $0x468c
     527:	50                   	push   %eax
     528:	e8 36 3b 00 00       	call   4063 <printf>
     52d:	83 c4 10             	add    $0x10,%esp
    exit();
     530:	e8 a7 39 00 00       	call   3edc <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
     535:	a1 d8 62 00 00       	mov    0x62d8,%eax
     53a:	83 ec 08             	sub    $0x8,%esp
     53d:	68 a7 46 00 00       	push   $0x46a7
     542:	50                   	push   %eax
     543:	e8 1b 3b 00 00       	call   4063 <printf>
     548:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     54b:	83 ec 0c             	sub    $0xc,%esp
     54e:	ff 75 f0             	pushl  -0x10(%ebp)
     551:	e8 ae 39 00 00       	call   3f04 <close>
     556:	83 c4 10             	add    $0x10,%esp

  if(unlink("small") < 0){
     559:	83 ec 0c             	sub    $0xc,%esp
     55c:	68 c9 45 00 00       	push   $0x45c9
     561:	e8 c6 39 00 00       	call   3f2c <unlink>
     566:	83 c4 10             	add    $0x10,%esp
     569:	85 c0                	test   %eax,%eax
     56b:	79 38                	jns    5a5 <writetest+0x1f7>
     56d:	eb 1b                	jmp    58a <writetest+0x1dc>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     56f:	a1 d8 62 00 00       	mov    0x62d8,%eax
     574:	83 ec 08             	sub    $0x8,%esp
     577:	68 ba 46 00 00       	push   $0x46ba
     57c:	50                   	push   %eax
     57d:	e8 e1 3a 00 00       	call   4063 <printf>
     582:	83 c4 10             	add    $0x10,%esp
    exit();
     585:	e8 52 39 00 00       	call   3edc <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     58a:	a1 d8 62 00 00       	mov    0x62d8,%eax
     58f:	83 ec 08             	sub    $0x8,%esp
     592:	68 c7 46 00 00       	push   $0x46c7
     597:	50                   	push   %eax
     598:	e8 c6 3a 00 00       	call   4063 <printf>
     59d:	83 c4 10             	add    $0x10,%esp
    exit();
     5a0:	e8 37 39 00 00       	call   3edc <exit>
  }
  printf(stdout, "small file test ok\n");
     5a5:	a1 d8 62 00 00       	mov    0x62d8,%eax
     5aa:	83 ec 08             	sub    $0x8,%esp
     5ad:	68 dc 46 00 00       	push   $0x46dc
     5b2:	50                   	push   %eax
     5b3:	e8 ab 3a 00 00       	call   4063 <printf>
     5b8:	83 c4 10             	add    $0x10,%esp
}
     5bb:	90                   	nop
     5bc:	c9                   	leave  
     5bd:	c3                   	ret    

000005be <writetest1>:

void
writetest1(void)
{
     5be:	55                   	push   %ebp
     5bf:	89 e5                	mov    %esp,%ebp
     5c1:	83 ec 18             	sub    $0x18,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     5c4:	a1 d8 62 00 00       	mov    0x62d8,%eax
     5c9:	83 ec 08             	sub    $0x8,%esp
     5cc:	68 f0 46 00 00       	push   $0x46f0
     5d1:	50                   	push   %eax
     5d2:	e8 8c 3a 00 00       	call   4063 <printf>
     5d7:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_CREATE|O_RDWR);
     5da:	83 ec 08             	sub    $0x8,%esp
     5dd:	68 02 02 00 00       	push   $0x202
     5e2:	68 00 47 00 00       	push   $0x4700
     5e7:	e8 30 39 00 00       	call   3f1c <open>
     5ec:	83 c4 10             	add    $0x10,%esp
     5ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     5f2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     5f6:	79 1b                	jns    613 <writetest1+0x55>
    printf(stdout, "error: creat big failed!\n");
     5f8:	a1 d8 62 00 00       	mov    0x62d8,%eax
     5fd:	83 ec 08             	sub    $0x8,%esp
     600:	68 04 47 00 00       	push   $0x4704
     605:	50                   	push   %eax
     606:	e8 58 3a 00 00       	call   4063 <printf>
     60b:	83 c4 10             	add    $0x10,%esp
    exit();
     60e:	e8 c9 38 00 00       	call   3edc <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     613:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     61a:	eb 4b                	jmp    667 <writetest1+0xa9>
    ((int*)buf)[0] = i;
     61c:	ba c0 8a 00 00       	mov    $0x8ac0,%edx
     621:	8b 45 f4             	mov    -0xc(%ebp),%eax
     624:	89 02                	mov    %eax,(%edx)
    if(write(fd, buf, 512) != 512){
     626:	83 ec 04             	sub    $0x4,%esp
     629:	68 00 02 00 00       	push   $0x200
     62e:	68 c0 8a 00 00       	push   $0x8ac0
     633:	ff 75 ec             	pushl  -0x14(%ebp)
     636:	e8 c1 38 00 00       	call   3efc <write>
     63b:	83 c4 10             	add    $0x10,%esp
     63e:	3d 00 02 00 00       	cmp    $0x200,%eax
     643:	74 1e                	je     663 <writetest1+0xa5>
      printf(stdout, "error: write big file failed\n", i);
     645:	a1 d8 62 00 00       	mov    0x62d8,%eax
     64a:	83 ec 04             	sub    $0x4,%esp
     64d:	ff 75 f4             	pushl  -0xc(%ebp)
     650:	68 1e 47 00 00       	push   $0x471e
     655:	50                   	push   %eax
     656:	e8 08 3a 00 00       	call   4063 <printf>
     65b:	83 c4 10             	add    $0x10,%esp
      exit();
     65e:	e8 79 38 00 00       	call   3edc <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     663:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     667:	8b 45 f4             	mov    -0xc(%ebp),%eax
     66a:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     66f:	76 ab                	jbe    61c <writetest1+0x5e>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     671:	83 ec 0c             	sub    $0xc,%esp
     674:	ff 75 ec             	pushl  -0x14(%ebp)
     677:	e8 88 38 00 00       	call   3f04 <close>
     67c:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_RDONLY);
     67f:	83 ec 08             	sub    $0x8,%esp
     682:	6a 00                	push   $0x0
     684:	68 00 47 00 00       	push   $0x4700
     689:	e8 8e 38 00 00       	call   3f1c <open>
     68e:	83 c4 10             	add    $0x10,%esp
     691:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     694:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     698:	79 1b                	jns    6b5 <writetest1+0xf7>
    printf(stdout, "error: open big failed!\n");
     69a:	a1 d8 62 00 00       	mov    0x62d8,%eax
     69f:	83 ec 08             	sub    $0x8,%esp
     6a2:	68 3c 47 00 00       	push   $0x473c
     6a7:	50                   	push   %eax
     6a8:	e8 b6 39 00 00       	call   4063 <printf>
     6ad:	83 c4 10             	add    $0x10,%esp
    exit();
     6b0:	e8 27 38 00 00       	call   3edc <exit>
  }

  n = 0;
     6b5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     6bc:	83 ec 04             	sub    $0x4,%esp
     6bf:	68 00 02 00 00       	push   $0x200
     6c4:	68 c0 8a 00 00       	push   $0x8ac0
     6c9:	ff 75 ec             	pushl  -0x14(%ebp)
     6cc:	e8 23 38 00 00       	call   3ef4 <read>
     6d1:	83 c4 10             	add    $0x10,%esp
     6d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(i == 0){
     6d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     6db:	75 27                	jne    704 <writetest1+0x146>
      if(n == MAXFILE - 1){
     6dd:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
     6e4:	75 7d                	jne    763 <writetest1+0x1a5>
        printf(stdout, "read only %d blocks from big", n);
     6e6:	a1 d8 62 00 00       	mov    0x62d8,%eax
     6eb:	83 ec 04             	sub    $0x4,%esp
     6ee:	ff 75 f0             	pushl  -0x10(%ebp)
     6f1:	68 55 47 00 00       	push   $0x4755
     6f6:	50                   	push   %eax
     6f7:	e8 67 39 00 00       	call   4063 <printf>
     6fc:	83 c4 10             	add    $0x10,%esp
        exit();
     6ff:	e8 d8 37 00 00       	call   3edc <exit>
      }
      break;
    } else if(i != 512){
     704:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
     70b:	74 1e                	je     72b <writetest1+0x16d>
      printf(stdout, "read failed %d\n", i);
     70d:	a1 d8 62 00 00       	mov    0x62d8,%eax
     712:	83 ec 04             	sub    $0x4,%esp
     715:	ff 75 f4             	pushl  -0xc(%ebp)
     718:	68 72 47 00 00       	push   $0x4772
     71d:	50                   	push   %eax
     71e:	e8 40 39 00 00       	call   4063 <printf>
     723:	83 c4 10             	add    $0x10,%esp
      exit();
     726:	e8 b1 37 00 00       	call   3edc <exit>
    }
    if(((int*)buf)[0] != n){
     72b:	b8 c0 8a 00 00       	mov    $0x8ac0,%eax
     730:	8b 00                	mov    (%eax),%eax
     732:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     735:	74 23                	je     75a <writetest1+0x19c>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     737:	b8 c0 8a 00 00       	mov    $0x8ac0,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     73c:	8b 10                	mov    (%eax),%edx
     73e:	a1 d8 62 00 00       	mov    0x62d8,%eax
     743:	52                   	push   %edx
     744:	ff 75 f0             	pushl  -0x10(%ebp)
     747:	68 84 47 00 00       	push   $0x4784
     74c:	50                   	push   %eax
     74d:	e8 11 39 00 00       	call   4063 <printf>
     752:	83 c4 10             	add    $0x10,%esp
             n, ((int*)buf)[0]);
      exit();
     755:	e8 82 37 00 00       	call   3edc <exit>
    }
    n++;
     75a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }
     75e:	e9 59 ff ff ff       	jmp    6bc <writetest1+0xfe>
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
     763:	90                   	nop
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     764:	83 ec 0c             	sub    $0xc,%esp
     767:	ff 75 ec             	pushl  -0x14(%ebp)
     76a:	e8 95 37 00 00       	call   3f04 <close>
     76f:	83 c4 10             	add    $0x10,%esp
  if(unlink("big") < 0){
     772:	83 ec 0c             	sub    $0xc,%esp
     775:	68 00 47 00 00       	push   $0x4700
     77a:	e8 ad 37 00 00       	call   3f2c <unlink>
     77f:	83 c4 10             	add    $0x10,%esp
     782:	85 c0                	test   %eax,%eax
     784:	79 1b                	jns    7a1 <writetest1+0x1e3>
    printf(stdout, "unlink big failed\n");
     786:	a1 d8 62 00 00       	mov    0x62d8,%eax
     78b:	83 ec 08             	sub    $0x8,%esp
     78e:	68 a4 47 00 00       	push   $0x47a4
     793:	50                   	push   %eax
     794:	e8 ca 38 00 00       	call   4063 <printf>
     799:	83 c4 10             	add    $0x10,%esp
    exit();
     79c:	e8 3b 37 00 00       	call   3edc <exit>
  }
  printf(stdout, "big files ok\n");
     7a1:	a1 d8 62 00 00       	mov    0x62d8,%eax
     7a6:	83 ec 08             	sub    $0x8,%esp
     7a9:	68 b7 47 00 00       	push   $0x47b7
     7ae:	50                   	push   %eax
     7af:	e8 af 38 00 00       	call   4063 <printf>
     7b4:	83 c4 10             	add    $0x10,%esp
}
     7b7:	90                   	nop
     7b8:	c9                   	leave  
     7b9:	c3                   	ret    

000007ba <createtest>:

void
createtest(void)
{
     7ba:	55                   	push   %ebp
     7bb:	89 e5                	mov    %esp,%ebp
     7bd:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     7c0:	a1 d8 62 00 00       	mov    0x62d8,%eax
     7c5:	83 ec 08             	sub    $0x8,%esp
     7c8:	68 c8 47 00 00       	push   $0x47c8
     7cd:	50                   	push   %eax
     7ce:	e8 90 38 00 00       	call   4063 <printf>
     7d3:	83 c4 10             	add    $0x10,%esp

  name[0] = 'a';
     7d6:	c6 05 c0 aa 00 00 61 	movb   $0x61,0xaac0
  name[2] = '\0';
     7dd:	c6 05 c2 aa 00 00 00 	movb   $0x0,0xaac2
  for(i = 0; i < 52; i++){
     7e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     7eb:	eb 35                	jmp    822 <createtest+0x68>
    name[1] = '0' + i;
     7ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7f0:	83 c0 30             	add    $0x30,%eax
     7f3:	a2 c1 aa 00 00       	mov    %al,0xaac1
    fd = open(name, O_CREATE|O_RDWR);
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 02 02 00 00       	push   $0x202
     800:	68 c0 aa 00 00       	push   $0xaac0
     805:	e8 12 37 00 00       	call   3f1c <open>
     80a:	83 c4 10             	add    $0x10,%esp
     80d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
     810:	83 ec 0c             	sub    $0xc,%esp
     813:	ff 75 f0             	pushl  -0x10(%ebp)
     816:	e8 e9 36 00 00       	call   3f04 <close>
     81b:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     81e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     822:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     826:	7e c5                	jle    7ed <createtest+0x33>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     828:	c6 05 c0 aa 00 00 61 	movb   $0x61,0xaac0
  name[2] = '\0';
     82f:	c6 05 c2 aa 00 00 00 	movb   $0x0,0xaac2
  for(i = 0; i < 52; i++){
     836:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     83d:	eb 1f                	jmp    85e <createtest+0xa4>
    name[1] = '0' + i;
     83f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     842:	83 c0 30             	add    $0x30,%eax
     845:	a2 c1 aa 00 00       	mov    %al,0xaac1
    unlink(name);
     84a:	83 ec 0c             	sub    $0xc,%esp
     84d:	68 c0 aa 00 00       	push   $0xaac0
     852:	e8 d5 36 00 00       	call   3f2c <unlink>
     857:	83 c4 10             	add    $0x10,%esp
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     85a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     85e:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     862:	7e db                	jle    83f <createtest+0x85>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     864:	a1 d8 62 00 00       	mov    0x62d8,%eax
     869:	83 ec 08             	sub    $0x8,%esp
     86c:	68 f0 47 00 00       	push   $0x47f0
     871:	50                   	push   %eax
     872:	e8 ec 37 00 00       	call   4063 <printf>
     877:	83 c4 10             	add    $0x10,%esp
}
     87a:	90                   	nop
     87b:	c9                   	leave  
     87c:	c3                   	ret    

0000087d <dirtest>:

void dirtest(void)
{
     87d:	55                   	push   %ebp
     87e:	89 e5                	mov    %esp,%ebp
     880:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "mkdir test\n");
     883:	a1 d8 62 00 00       	mov    0x62d8,%eax
     888:	83 ec 08             	sub    $0x8,%esp
     88b:	68 16 48 00 00       	push   $0x4816
     890:	50                   	push   %eax
     891:	e8 cd 37 00 00       	call   4063 <printf>
     896:	83 c4 10             	add    $0x10,%esp

  if(mkdir("dir0") < 0){
     899:	83 ec 0c             	sub    $0xc,%esp
     89c:	68 22 48 00 00       	push   $0x4822
     8a1:	e8 9e 36 00 00       	call   3f44 <mkdir>
     8a6:	83 c4 10             	add    $0x10,%esp
     8a9:	85 c0                	test   %eax,%eax
     8ab:	79 1b                	jns    8c8 <dirtest+0x4b>
    printf(stdout, "mkdir failed\n");
     8ad:	a1 d8 62 00 00       	mov    0x62d8,%eax
     8b2:	83 ec 08             	sub    $0x8,%esp
     8b5:	68 45 44 00 00       	push   $0x4445
     8ba:	50                   	push   %eax
     8bb:	e8 a3 37 00 00       	call   4063 <printf>
     8c0:	83 c4 10             	add    $0x10,%esp
    exit();
     8c3:	e8 14 36 00 00       	call   3edc <exit>
  }

  if(chdir("dir0") < 0){
     8c8:	83 ec 0c             	sub    $0xc,%esp
     8cb:	68 22 48 00 00       	push   $0x4822
     8d0:	e8 77 36 00 00       	call   3f4c <chdir>
     8d5:	83 c4 10             	add    $0x10,%esp
     8d8:	85 c0                	test   %eax,%eax
     8da:	79 1b                	jns    8f7 <dirtest+0x7a>
    printf(stdout, "chdir dir0 failed\n");
     8dc:	a1 d8 62 00 00       	mov    0x62d8,%eax
     8e1:	83 ec 08             	sub    $0x8,%esp
     8e4:	68 27 48 00 00       	push   $0x4827
     8e9:	50                   	push   %eax
     8ea:	e8 74 37 00 00       	call   4063 <printf>
     8ef:	83 c4 10             	add    $0x10,%esp
    exit();
     8f2:	e8 e5 35 00 00       	call   3edc <exit>
  }

  if(chdir("..") < 0){
     8f7:	83 ec 0c             	sub    $0xc,%esp
     8fa:	68 3a 48 00 00       	push   $0x483a
     8ff:	e8 48 36 00 00       	call   3f4c <chdir>
     904:	83 c4 10             	add    $0x10,%esp
     907:	85 c0                	test   %eax,%eax
     909:	79 1b                	jns    926 <dirtest+0xa9>
    printf(stdout, "chdir .. failed\n");
     90b:	a1 d8 62 00 00       	mov    0x62d8,%eax
     910:	83 ec 08             	sub    $0x8,%esp
     913:	68 3d 48 00 00       	push   $0x483d
     918:	50                   	push   %eax
     919:	e8 45 37 00 00       	call   4063 <printf>
     91e:	83 c4 10             	add    $0x10,%esp
    exit();
     921:	e8 b6 35 00 00       	call   3edc <exit>
  }

  if(unlink("dir0") < 0){
     926:	83 ec 0c             	sub    $0xc,%esp
     929:	68 22 48 00 00       	push   $0x4822
     92e:	e8 f9 35 00 00       	call   3f2c <unlink>
     933:	83 c4 10             	add    $0x10,%esp
     936:	85 c0                	test   %eax,%eax
     938:	79 1b                	jns    955 <dirtest+0xd8>
    printf(stdout, "unlink dir0 failed\n");
     93a:	a1 d8 62 00 00       	mov    0x62d8,%eax
     93f:	83 ec 08             	sub    $0x8,%esp
     942:	68 4e 48 00 00       	push   $0x484e
     947:	50                   	push   %eax
     948:	e8 16 37 00 00       	call   4063 <printf>
     94d:	83 c4 10             	add    $0x10,%esp
    exit();
     950:	e8 87 35 00 00       	call   3edc <exit>
  }
  printf(stdout, "mkdir test ok\n");
     955:	a1 d8 62 00 00       	mov    0x62d8,%eax
     95a:	83 ec 08             	sub    $0x8,%esp
     95d:	68 62 48 00 00       	push   $0x4862
     962:	50                   	push   %eax
     963:	e8 fb 36 00 00       	call   4063 <printf>
     968:	83 c4 10             	add    $0x10,%esp
}
     96b:	90                   	nop
     96c:	c9                   	leave  
     96d:	c3                   	ret    

0000096e <exectest>:

void
exectest(void)
{
     96e:	55                   	push   %ebp
     96f:	89 e5                	mov    %esp,%ebp
     971:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "exec test\n");
     974:	a1 d8 62 00 00       	mov    0x62d8,%eax
     979:	83 ec 08             	sub    $0x8,%esp
     97c:	68 71 48 00 00       	push   $0x4871
     981:	50                   	push   %eax
     982:	e8 dc 36 00 00       	call   4063 <printf>
     987:	83 c4 10             	add    $0x10,%esp
  if(exec("echo", echoargv) < 0){
     98a:	83 ec 08             	sub    $0x8,%esp
     98d:	68 c4 62 00 00       	push   $0x62c4
     992:	68 1c 44 00 00       	push   $0x441c
     997:	e8 78 35 00 00       	call   3f14 <exec>
     99c:	83 c4 10             	add    $0x10,%esp
     99f:	85 c0                	test   %eax,%eax
     9a1:	79 1b                	jns    9be <exectest+0x50>
    printf(stdout, "exec echo failed\n");
     9a3:	a1 d8 62 00 00       	mov    0x62d8,%eax
     9a8:	83 ec 08             	sub    $0x8,%esp
     9ab:	68 7c 48 00 00       	push   $0x487c
     9b0:	50                   	push   %eax
     9b1:	e8 ad 36 00 00       	call   4063 <printf>
     9b6:	83 c4 10             	add    $0x10,%esp
    exit();
     9b9:	e8 1e 35 00 00       	call   3edc <exit>
  }
}
     9be:	90                   	nop
     9bf:	c9                   	leave  
     9c0:	c3                   	ret    

000009c1 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     9c1:	55                   	push   %ebp
     9c2:	89 e5                	mov    %esp,%ebp
     9c4:	83 ec 28             	sub    $0x28,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     9c7:	83 ec 0c             	sub    $0xc,%esp
     9ca:	8d 45 d8             	lea    -0x28(%ebp),%eax
     9cd:	50                   	push   %eax
     9ce:	e8 19 35 00 00       	call   3eec <pipe>
     9d3:	83 c4 10             	add    $0x10,%esp
     9d6:	85 c0                	test   %eax,%eax
     9d8:	74 17                	je     9f1 <pipe1+0x30>
    printf(1, "pipe() failed\n");
     9da:	83 ec 08             	sub    $0x8,%esp
     9dd:	68 8e 48 00 00       	push   $0x488e
     9e2:	6a 01                	push   $0x1
     9e4:	e8 7a 36 00 00       	call   4063 <printf>
     9e9:	83 c4 10             	add    $0x10,%esp
    exit();
     9ec:	e8 eb 34 00 00       	call   3edc <exit>
  }
  pid = fork();
     9f1:	e8 de 34 00 00       	call   3ed4 <fork>
     9f6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     9f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(pid == 0){
     a00:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     a04:	0f 85 89 00 00 00    	jne    a93 <pipe1+0xd2>
    close(fds[0]);
     a0a:	8b 45 d8             	mov    -0x28(%ebp),%eax
     a0d:	83 ec 0c             	sub    $0xc,%esp
     a10:	50                   	push   %eax
     a11:	e8 ee 34 00 00       	call   3f04 <close>
     a16:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
     a19:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     a20:	eb 66                	jmp    a88 <pipe1+0xc7>
      for(i = 0; i < 1033; i++)
     a22:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     a29:	eb 19                	jmp    a44 <pipe1+0x83>
        buf[i] = seq++;
     a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a2e:	8d 50 01             	lea    0x1(%eax),%edx
     a31:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a34:	89 c2                	mov    %eax,%edx
     a36:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a39:	05 c0 8a 00 00       	add    $0x8ac0,%eax
     a3e:	88 10                	mov    %dl,(%eax)
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     a40:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     a44:	81 7d f0 08 04 00 00 	cmpl   $0x408,-0x10(%ebp)
     a4b:	7e de                	jle    a2b <pipe1+0x6a>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     a4d:	8b 45 dc             	mov    -0x24(%ebp),%eax
     a50:	83 ec 04             	sub    $0x4,%esp
     a53:	68 09 04 00 00       	push   $0x409
     a58:	68 c0 8a 00 00       	push   $0x8ac0
     a5d:	50                   	push   %eax
     a5e:	e8 99 34 00 00       	call   3efc <write>
     a63:	83 c4 10             	add    $0x10,%esp
     a66:	3d 09 04 00 00       	cmp    $0x409,%eax
     a6b:	74 17                	je     a84 <pipe1+0xc3>
        printf(1, "pipe1 oops 1\n");
     a6d:	83 ec 08             	sub    $0x8,%esp
     a70:	68 9d 48 00 00       	push   $0x489d
     a75:	6a 01                	push   $0x1
     a77:	e8 e7 35 00 00       	call   4063 <printf>
     a7c:	83 c4 10             	add    $0x10,%esp
        exit();
     a7f:	e8 58 34 00 00       	call   3edc <exit>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     a84:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     a88:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     a8c:	7e 94                	jle    a22 <pipe1+0x61>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     a8e:	e8 49 34 00 00       	call   3edc <exit>
  } else if(pid > 0){
     a93:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     a97:	0f 8e f4 00 00 00    	jle    b91 <pipe1+0x1d0>
    close(fds[1]);
     a9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
     aa0:	83 ec 0c             	sub    $0xc,%esp
     aa3:	50                   	push   %eax
     aa4:	e8 5b 34 00 00       	call   3f04 <close>
     aa9:	83 c4 10             	add    $0x10,%esp
    total = 0;
     aac:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    cc = 1;
     ab3:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     aba:	eb 66                	jmp    b22 <pipe1+0x161>
      for(i = 0; i < n; i++){
     abc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ac3:	eb 3b                	jmp    b00 <pipe1+0x13f>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     ac5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ac8:	05 c0 8a 00 00       	add    $0x8ac0,%eax
     acd:	0f b6 00             	movzbl (%eax),%eax
     ad0:	0f be c8             	movsbl %al,%ecx
     ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ad6:	8d 50 01             	lea    0x1(%eax),%edx
     ad9:	89 55 f4             	mov    %edx,-0xc(%ebp)
     adc:	31 c8                	xor    %ecx,%eax
     ade:	0f b6 c0             	movzbl %al,%eax
     ae1:	85 c0                	test   %eax,%eax
     ae3:	74 17                	je     afc <pipe1+0x13b>
          printf(1, "pipe1 oops 2\n");
     ae5:	83 ec 08             	sub    $0x8,%esp
     ae8:	68 ab 48 00 00       	push   $0x48ab
     aed:	6a 01                	push   $0x1
     aef:	e8 6f 35 00 00       	call   4063 <printf>
     af4:	83 c4 10             	add    $0x10,%esp
     af7:	e9 ac 00 00 00       	jmp    ba8 <pipe1+0x1e7>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     afc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     b00:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b03:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     b06:	7c bd                	jl     ac5 <pipe1+0x104>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     b08:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b0b:	01 45 e4             	add    %eax,-0x1c(%ebp)
      cc = cc * 2;
     b0e:	d1 65 e8             	shll   -0x18(%ebp)
      if(cc > sizeof(buf))
     b11:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b14:	3d 00 20 00 00       	cmp    $0x2000,%eax
     b19:	76 07                	jbe    b22 <pipe1+0x161>
        cc = sizeof(buf);
     b1b:	c7 45 e8 00 20 00 00 	movl   $0x2000,-0x18(%ebp)
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     b22:	8b 45 d8             	mov    -0x28(%ebp),%eax
     b25:	83 ec 04             	sub    $0x4,%esp
     b28:	ff 75 e8             	pushl  -0x18(%ebp)
     b2b:	68 c0 8a 00 00       	push   $0x8ac0
     b30:	50                   	push   %eax
     b31:	e8 be 33 00 00       	call   3ef4 <read>
     b36:	83 c4 10             	add    $0x10,%esp
     b39:	89 45 ec             	mov    %eax,-0x14(%ebp)
     b3c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     b40:	0f 8f 76 ff ff ff    	jg     abc <pipe1+0xfb>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b46:	81 7d e4 2d 14 00 00 	cmpl   $0x142d,-0x1c(%ebp)
     b4d:	74 1a                	je     b69 <pipe1+0x1a8>
      printf(1, "pipe1 oops 3 total %d\n", total);
     b4f:	83 ec 04             	sub    $0x4,%esp
     b52:	ff 75 e4             	pushl  -0x1c(%ebp)
     b55:	68 b9 48 00 00       	push   $0x48b9
     b5a:	6a 01                	push   $0x1
     b5c:	e8 02 35 00 00       	call   4063 <printf>
     b61:	83 c4 10             	add    $0x10,%esp
      exit();
     b64:	e8 73 33 00 00       	call   3edc <exit>
    }
    close(fds[0]);
     b69:	8b 45 d8             	mov    -0x28(%ebp),%eax
     b6c:	83 ec 0c             	sub    $0xc,%esp
     b6f:	50                   	push   %eax
     b70:	e8 8f 33 00 00       	call   3f04 <close>
     b75:	83 c4 10             	add    $0x10,%esp
    wait();
     b78:	e8 67 33 00 00       	call   3ee4 <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b7d:	83 ec 08             	sub    $0x8,%esp
     b80:	68 df 48 00 00       	push   $0x48df
     b85:	6a 01                	push   $0x1
     b87:	e8 d7 34 00 00       	call   4063 <printf>
     b8c:	83 c4 10             	add    $0x10,%esp
     b8f:	eb 17                	jmp    ba8 <pipe1+0x1e7>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     b91:	83 ec 08             	sub    $0x8,%esp
     b94:	68 d0 48 00 00       	push   $0x48d0
     b99:	6a 01                	push   $0x1
     b9b:	e8 c3 34 00 00       	call   4063 <printf>
     ba0:	83 c4 10             	add    $0x10,%esp
    exit();
     ba3:	e8 34 33 00 00       	call   3edc <exit>
  }
  printf(1, "pipe1 ok\n");
}
     ba8:	c9                   	leave  
     ba9:	c3                   	ret    

00000baa <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     baa:	55                   	push   %ebp
     bab:	89 e5                	mov    %esp,%ebp
     bad:	83 ec 28             	sub    $0x28,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     bb0:	83 ec 08             	sub    $0x8,%esp
     bb3:	68 e9 48 00 00       	push   $0x48e9
     bb8:	6a 01                	push   $0x1
     bba:	e8 a4 34 00 00       	call   4063 <printf>
     bbf:	83 c4 10             	add    $0x10,%esp
  pid1 = fork();
     bc2:	e8 0d 33 00 00       	call   3ed4 <fork>
     bc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid1 == 0)
     bca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bce:	75 02                	jne    bd2 <preempt+0x28>
    for(;;)
      ;
     bd0:	eb fe                	jmp    bd0 <preempt+0x26>

  pid2 = fork();
     bd2:	e8 fd 32 00 00       	call   3ed4 <fork>
     bd7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     bda:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     bde:	75 02                	jne    be2 <preempt+0x38>
    for(;;)
      ;
     be0:	eb fe                	jmp    be0 <preempt+0x36>

  pipe(pfds);
     be2:	83 ec 0c             	sub    $0xc,%esp
     be5:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     be8:	50                   	push   %eax
     be9:	e8 fe 32 00 00       	call   3eec <pipe>
     bee:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
     bf1:	e8 de 32 00 00       	call   3ed4 <fork>
     bf6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid3 == 0){
     bf9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     bfd:	75 4d                	jne    c4c <preempt+0xa2>
    close(pfds[0]);
     bff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c02:	83 ec 0c             	sub    $0xc,%esp
     c05:	50                   	push   %eax
     c06:	e8 f9 32 00 00       	call   3f04 <close>
     c0b:	83 c4 10             	add    $0x10,%esp
    if(write(pfds[1], "x", 1) != 1)
     c0e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c11:	83 ec 04             	sub    $0x4,%esp
     c14:	6a 01                	push   $0x1
     c16:	68 f3 48 00 00       	push   $0x48f3
     c1b:	50                   	push   %eax
     c1c:	e8 db 32 00 00       	call   3efc <write>
     c21:	83 c4 10             	add    $0x10,%esp
     c24:	83 f8 01             	cmp    $0x1,%eax
     c27:	74 12                	je     c3b <preempt+0x91>
      printf(1, "preempt write error");
     c29:	83 ec 08             	sub    $0x8,%esp
     c2c:	68 f5 48 00 00       	push   $0x48f5
     c31:	6a 01                	push   $0x1
     c33:	e8 2b 34 00 00       	call   4063 <printf>
     c38:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c3e:	83 ec 0c             	sub    $0xc,%esp
     c41:	50                   	push   %eax
     c42:	e8 bd 32 00 00       	call   3f04 <close>
     c47:	83 c4 10             	add    $0x10,%esp
    for(;;)
      ;
     c4a:	eb fe                	jmp    c4a <preempt+0xa0>
  }

  close(pfds[1]);
     c4c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c4f:	83 ec 0c             	sub    $0xc,%esp
     c52:	50                   	push   %eax
     c53:	e8 ac 32 00 00       	call   3f04 <close>
     c58:	83 c4 10             	add    $0x10,%esp
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c5e:	83 ec 04             	sub    $0x4,%esp
     c61:	68 00 20 00 00       	push   $0x2000
     c66:	68 c0 8a 00 00       	push   $0x8ac0
     c6b:	50                   	push   %eax
     c6c:	e8 83 32 00 00       	call   3ef4 <read>
     c71:	83 c4 10             	add    $0x10,%esp
     c74:	83 f8 01             	cmp    $0x1,%eax
     c77:	74 14                	je     c8d <preempt+0xe3>
    printf(1, "preempt read error");
     c79:	83 ec 08             	sub    $0x8,%esp
     c7c:	68 09 49 00 00       	push   $0x4909
     c81:	6a 01                	push   $0x1
     c83:	e8 db 33 00 00       	call   4063 <printf>
     c88:	83 c4 10             	add    $0x10,%esp
     c8b:	eb 7e                	jmp    d0b <preempt+0x161>
    return;
  }
  close(pfds[0]);
     c8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c90:	83 ec 0c             	sub    $0xc,%esp
     c93:	50                   	push   %eax
     c94:	e8 6b 32 00 00       	call   3f04 <close>
     c99:	83 c4 10             	add    $0x10,%esp
  printf(1, "kill... ");
     c9c:	83 ec 08             	sub    $0x8,%esp
     c9f:	68 1c 49 00 00       	push   $0x491c
     ca4:	6a 01                	push   $0x1
     ca6:	e8 b8 33 00 00       	call   4063 <printf>
     cab:	83 c4 10             	add    $0x10,%esp
  kill(pid1);
     cae:	83 ec 0c             	sub    $0xc,%esp
     cb1:	ff 75 f4             	pushl  -0xc(%ebp)
     cb4:	e8 53 32 00 00       	call   3f0c <kill>
     cb9:	83 c4 10             	add    $0x10,%esp
  kill(pid2);
     cbc:	83 ec 0c             	sub    $0xc,%esp
     cbf:	ff 75 f0             	pushl  -0x10(%ebp)
     cc2:	e8 45 32 00 00       	call   3f0c <kill>
     cc7:	83 c4 10             	add    $0x10,%esp
  kill(pid3);
     cca:	83 ec 0c             	sub    $0xc,%esp
     ccd:	ff 75 ec             	pushl  -0x14(%ebp)
     cd0:	e8 37 32 00 00       	call   3f0c <kill>
     cd5:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
     cd8:	83 ec 08             	sub    $0x8,%esp
     cdb:	68 25 49 00 00       	push   $0x4925
     ce0:	6a 01                	push   $0x1
     ce2:	e8 7c 33 00 00       	call   4063 <printf>
     ce7:	83 c4 10             	add    $0x10,%esp
  wait();
     cea:	e8 f5 31 00 00       	call   3ee4 <wait>
  wait();
     cef:	e8 f0 31 00 00       	call   3ee4 <wait>
  wait();
     cf4:	e8 eb 31 00 00       	call   3ee4 <wait>
  printf(1, "preempt ok\n");
     cf9:	83 ec 08             	sub    $0x8,%esp
     cfc:	68 2e 49 00 00       	push   $0x492e
     d01:	6a 01                	push   $0x1
     d03:	e8 5b 33 00 00       	call   4063 <printf>
     d08:	83 c4 10             	add    $0x10,%esp
}
     d0b:	c9                   	leave  
     d0c:	c3                   	ret    

00000d0d <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     d0d:	55                   	push   %ebp
     d0e:	89 e5                	mov    %esp,%ebp
     d10:	83 ec 18             	sub    $0x18,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
     d13:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d1a:	eb 4f                	jmp    d6b <exitwait+0x5e>
    pid = fork();
     d1c:	e8 b3 31 00 00       	call   3ed4 <fork>
     d21:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0){
     d24:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d28:	79 14                	jns    d3e <exitwait+0x31>
      printf(1, "fork failed\n");
     d2a:	83 ec 08             	sub    $0x8,%esp
     d2d:	68 bd 44 00 00       	push   $0x44bd
     d32:	6a 01                	push   $0x1
     d34:	e8 2a 33 00 00       	call   4063 <printf>
     d39:	83 c4 10             	add    $0x10,%esp
      return;
     d3c:	eb 45                	jmp    d83 <exitwait+0x76>
    }
    if(pid){
     d3e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d42:	74 1e                	je     d62 <exitwait+0x55>
      if(wait() != pid){
     d44:	e8 9b 31 00 00       	call   3ee4 <wait>
     d49:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     d4c:	74 19                	je     d67 <exitwait+0x5a>
        printf(1, "wait wrong pid\n");
     d4e:	83 ec 08             	sub    $0x8,%esp
     d51:	68 3a 49 00 00       	push   $0x493a
     d56:	6a 01                	push   $0x1
     d58:	e8 06 33 00 00       	call   4063 <printf>
     d5d:	83 c4 10             	add    $0x10,%esp
        return;
     d60:	eb 21                	jmp    d83 <exitwait+0x76>
      }
    } else {
      exit();
     d62:	e8 75 31 00 00       	call   3edc <exit>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     d67:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     d6b:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     d6f:	7e ab                	jle    d1c <exitwait+0xf>
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     d71:	83 ec 08             	sub    $0x8,%esp
     d74:	68 4a 49 00 00       	push   $0x494a
     d79:	6a 01                	push   $0x1
     d7b:	e8 e3 32 00 00       	call   4063 <printf>
     d80:	83 c4 10             	add    $0x10,%esp
}
     d83:	c9                   	leave  
     d84:	c3                   	ret    

00000d85 <mem>:

void
mem(void)
{
     d85:	55                   	push   %ebp
     d86:	89 e5                	mov    %esp,%ebp
     d88:	83 ec 18             	sub    $0x18,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     d8b:	83 ec 08             	sub    $0x8,%esp
     d8e:	68 57 49 00 00       	push   $0x4957
     d93:	6a 01                	push   $0x1
     d95:	e8 c9 32 00 00       	call   4063 <printf>
     d9a:	83 c4 10             	add    $0x10,%esp
  ppid = getpid();
     d9d:	e8 ba 31 00 00       	call   3f5c <getpid>
     da2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((pid = fork()) == 0){
     da5:	e8 2a 31 00 00       	call   3ed4 <fork>
     daa:	89 45 ec             	mov    %eax,-0x14(%ebp)
     dad:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     db1:	0f 85 b7 00 00 00    	jne    e6e <mem+0xe9>
    m1 = 0;
     db7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     dbe:	eb 0e                	jmp    dce <mem+0x49>
      *(char**)m2 = m1;
     dc0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     dc3:	8b 55 f4             	mov    -0xc(%ebp),%edx
     dc6:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     dc8:	8b 45 e8             	mov    -0x18(%ebp),%eax
     dcb:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     dce:	83 ec 0c             	sub    $0xc,%esp
     dd1:	68 11 27 00 00       	push   $0x2711
     dd6:	e8 5b 35 00 00       	call   4336 <malloc>
     ddb:	83 c4 10             	add    $0x10,%esp
     dde:	89 45 e8             	mov    %eax,-0x18(%ebp)
     de1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     de5:	75 d9                	jne    dc0 <mem+0x3b>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     de7:	eb 1c                	jmp    e05 <mem+0x80>
      m2 = *(char**)m1;
     de9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dec:	8b 00                	mov    (%eax),%eax
     dee:	89 45 e8             	mov    %eax,-0x18(%ebp)
      free(m1);
     df1:	83 ec 0c             	sub    $0xc,%esp
     df4:	ff 75 f4             	pushl  -0xc(%ebp)
     df7:	e8 f8 33 00 00       	call   41f4 <free>
     dfc:	83 c4 10             	add    $0x10,%esp
      m1 = m2;
     dff:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e02:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     e05:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e09:	75 de                	jne    de9 <mem+0x64>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     e0b:	83 ec 0c             	sub    $0xc,%esp
     e0e:	68 00 50 00 00       	push   $0x5000
     e13:	e8 1e 35 00 00       	call   4336 <malloc>
     e18:	83 c4 10             	add    $0x10,%esp
     e1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(m1 == 0){
     e1e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e22:	75 25                	jne    e49 <mem+0xc4>
      printf(1, "couldn't allocate mem?!!\n");
     e24:	83 ec 08             	sub    $0x8,%esp
     e27:	68 61 49 00 00       	push   $0x4961
     e2c:	6a 01                	push   $0x1
     e2e:	e8 30 32 00 00       	call   4063 <printf>
     e33:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
     e36:	83 ec 0c             	sub    $0xc,%esp
     e39:	ff 75 f0             	pushl  -0x10(%ebp)
     e3c:	e8 cb 30 00 00       	call   3f0c <kill>
     e41:	83 c4 10             	add    $0x10,%esp
      exit();
     e44:	e8 93 30 00 00       	call   3edc <exit>
    }
    free(m1);
     e49:	83 ec 0c             	sub    $0xc,%esp
     e4c:	ff 75 f4             	pushl  -0xc(%ebp)
     e4f:	e8 a0 33 00 00       	call   41f4 <free>
     e54:	83 c4 10             	add    $0x10,%esp
    printf(1, "mem ok\n");
     e57:	83 ec 08             	sub    $0x8,%esp
     e5a:	68 7b 49 00 00       	push   $0x497b
     e5f:	6a 01                	push   $0x1
     e61:	e8 fd 31 00 00       	call   4063 <printf>
     e66:	83 c4 10             	add    $0x10,%esp
    exit();
     e69:	e8 6e 30 00 00       	call   3edc <exit>
  } else {
    wait();
     e6e:	e8 71 30 00 00       	call   3ee4 <wait>
  }
}
     e73:	90                   	nop
     e74:	c9                   	leave  
     e75:	c3                   	ret    

00000e76 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e76:	55                   	push   %ebp
     e77:	89 e5                	mov    %esp,%ebp
     e79:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e7c:	83 ec 08             	sub    $0x8,%esp
     e7f:	68 83 49 00 00       	push   $0x4983
     e84:	6a 01                	push   $0x1
     e86:	e8 d8 31 00 00       	call   4063 <printf>
     e8b:	83 c4 10             	add    $0x10,%esp

  unlink("sharedfd");
     e8e:	83 ec 0c             	sub    $0xc,%esp
     e91:	68 92 49 00 00       	push   $0x4992
     e96:	e8 91 30 00 00       	call   3f2c <unlink>
     e9b:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e9e:	83 ec 08             	sub    $0x8,%esp
     ea1:	68 02 02 00 00       	push   $0x202
     ea6:	68 92 49 00 00       	push   $0x4992
     eab:	e8 6c 30 00 00       	call   3f1c <open>
     eb0:	83 c4 10             	add    $0x10,%esp
     eb3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     eb6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     eba:	79 17                	jns    ed3 <sharedfd+0x5d>
    printf(1, "fstests: cannot open sharedfd for writing");
     ebc:	83 ec 08             	sub    $0x8,%esp
     ebf:	68 9c 49 00 00       	push   $0x499c
     ec4:	6a 01                	push   $0x1
     ec6:	e8 98 31 00 00       	call   4063 <printf>
     ecb:	83 c4 10             	add    $0x10,%esp
    return;
     ece:	e9 84 01 00 00       	jmp    1057 <sharedfd+0x1e1>
  }
  pid = fork();
     ed3:	e8 fc 2f 00 00       	call   3ed4 <fork>
     ed8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     edb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     edf:	75 07                	jne    ee8 <sharedfd+0x72>
     ee1:	b8 63 00 00 00       	mov    $0x63,%eax
     ee6:	eb 05                	jmp    eed <sharedfd+0x77>
     ee8:	b8 70 00 00 00       	mov    $0x70,%eax
     eed:	83 ec 04             	sub    $0x4,%esp
     ef0:	6a 0a                	push   $0xa
     ef2:	50                   	push   %eax
     ef3:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     ef6:	50                   	push   %eax
     ef7:	e8 45 2e 00 00       	call   3d41 <memset>
     efc:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 1000; i++){
     eff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f06:	eb 31                	jmp    f39 <sharedfd+0xc3>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     f08:	83 ec 04             	sub    $0x4,%esp
     f0b:	6a 0a                	push   $0xa
     f0d:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     f10:	50                   	push   %eax
     f11:	ff 75 e8             	pushl  -0x18(%ebp)
     f14:	e8 e3 2f 00 00       	call   3efc <write>
     f19:	83 c4 10             	add    $0x10,%esp
     f1c:	83 f8 0a             	cmp    $0xa,%eax
     f1f:	74 14                	je     f35 <sharedfd+0xbf>
      printf(1, "fstests: write sharedfd failed\n");
     f21:	83 ec 08             	sub    $0x8,%esp
     f24:	68 c8 49 00 00       	push   $0x49c8
     f29:	6a 01                	push   $0x1
     f2b:	e8 33 31 00 00       	call   4063 <printf>
     f30:	83 c4 10             	add    $0x10,%esp
      break;
     f33:	eb 0d                	jmp    f42 <sharedfd+0xcc>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
     f35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f39:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
     f40:	7e c6                	jle    f08 <sharedfd+0x92>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
     f42:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     f46:	75 05                	jne    f4d <sharedfd+0xd7>
    exit();
     f48:	e8 8f 2f 00 00       	call   3edc <exit>
  else
    wait();
     f4d:	e8 92 2f 00 00       	call   3ee4 <wait>
  close(fd);
     f52:	83 ec 0c             	sub    $0xc,%esp
     f55:	ff 75 e8             	pushl  -0x18(%ebp)
     f58:	e8 a7 2f 00 00       	call   3f04 <close>
     f5d:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", 0);
     f60:	83 ec 08             	sub    $0x8,%esp
     f63:	6a 00                	push   $0x0
     f65:	68 92 49 00 00       	push   $0x4992
     f6a:	e8 ad 2f 00 00       	call   3f1c <open>
     f6f:	83 c4 10             	add    $0x10,%esp
     f72:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     f75:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     f79:	79 17                	jns    f92 <sharedfd+0x11c>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     f7b:	83 ec 08             	sub    $0x8,%esp
     f7e:	68 e8 49 00 00       	push   $0x49e8
     f83:	6a 01                	push   $0x1
     f85:	e8 d9 30 00 00       	call   4063 <printf>
     f8a:	83 c4 10             	add    $0x10,%esp
    return;
     f8d:	e9 c5 00 00 00       	jmp    1057 <sharedfd+0x1e1>
  }
  nc = np = 0;
     f92:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     f99:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f9f:	eb 3b                	jmp    fdc <sharedfd+0x166>
    for(i = 0; i < sizeof(buf); i++){
     fa1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fa8:	eb 2a                	jmp    fd4 <sharedfd+0x15e>
      if(buf[i] == 'c')
     faa:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb0:	01 d0                	add    %edx,%eax
     fb2:	0f b6 00             	movzbl (%eax),%eax
     fb5:	3c 63                	cmp    $0x63,%al
     fb7:	75 04                	jne    fbd <sharedfd+0x147>
        nc++;
     fb9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
     fbd:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     fc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fc3:	01 d0                	add    %edx,%eax
     fc5:	0f b6 00             	movzbl (%eax),%eax
     fc8:	3c 70                	cmp    $0x70,%al
     fca:	75 04                	jne    fd0 <sharedfd+0x15a>
        np++;
     fcc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     fd0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     fd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fd7:	83 f8 09             	cmp    $0x9,%eax
     fda:	76 ce                	jbe    faa <sharedfd+0x134>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     fdc:	83 ec 04             	sub    $0x4,%esp
     fdf:	6a 0a                	push   $0xa
     fe1:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     fe4:	50                   	push   %eax
     fe5:	ff 75 e8             	pushl  -0x18(%ebp)
     fe8:	e8 07 2f 00 00       	call   3ef4 <read>
     fed:	83 c4 10             	add    $0x10,%esp
     ff0:	89 45 e0             	mov    %eax,-0x20(%ebp)
     ff3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     ff7:	7f a8                	jg     fa1 <sharedfd+0x12b>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     ff9:	83 ec 0c             	sub    $0xc,%esp
     ffc:	ff 75 e8             	pushl  -0x18(%ebp)
     fff:	e8 00 2f 00 00       	call   3f04 <close>
    1004:	83 c4 10             	add    $0x10,%esp
  unlink("sharedfd");
    1007:	83 ec 0c             	sub    $0xc,%esp
    100a:	68 92 49 00 00       	push   $0x4992
    100f:	e8 18 2f 00 00       	call   3f2c <unlink>
    1014:	83 c4 10             	add    $0x10,%esp
  if(nc == 10000 && np == 10000){
    1017:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
    101e:	75 1d                	jne    103d <sharedfd+0x1c7>
    1020:	81 7d ec 10 27 00 00 	cmpl   $0x2710,-0x14(%ebp)
    1027:	75 14                	jne    103d <sharedfd+0x1c7>
    printf(1, "sharedfd ok\n");
    1029:	83 ec 08             	sub    $0x8,%esp
    102c:	68 13 4a 00 00       	push   $0x4a13
    1031:	6a 01                	push   $0x1
    1033:	e8 2b 30 00 00       	call   4063 <printf>
    1038:	83 c4 10             	add    $0x10,%esp
    103b:	eb 1a                	jmp    1057 <sharedfd+0x1e1>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    103d:	ff 75 ec             	pushl  -0x14(%ebp)
    1040:	ff 75 f0             	pushl  -0x10(%ebp)
    1043:	68 20 4a 00 00       	push   $0x4a20
    1048:	6a 01                	push   $0x1
    104a:	e8 14 30 00 00       	call   4063 <printf>
    104f:	83 c4 10             	add    $0x10,%esp
    exit();
    1052:	e8 85 2e 00 00       	call   3edc <exit>
  }
}
    1057:	c9                   	leave  
    1058:	c3                   	ret    

00001059 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1059:	55                   	push   %ebp
    105a:	89 e5                	mov    %esp,%ebp
    105c:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    105f:	c7 45 c8 35 4a 00 00 	movl   $0x4a35,-0x38(%ebp)
    1066:	c7 45 cc 38 4a 00 00 	movl   $0x4a38,-0x34(%ebp)
    106d:	c7 45 d0 3b 4a 00 00 	movl   $0x4a3b,-0x30(%ebp)
    1074:	c7 45 d4 3e 4a 00 00 	movl   $0x4a3e,-0x2c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    107b:	83 ec 08             	sub    $0x8,%esp
    107e:	68 41 4a 00 00       	push   $0x4a41
    1083:	6a 01                	push   $0x1
    1085:	e8 d9 2f 00 00       	call   4063 <printf>
    108a:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    108d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1094:	e9 f0 00 00 00       	jmp    1189 <fourfiles+0x130>
    fname = names[pi];
    1099:	8b 45 e8             	mov    -0x18(%ebp),%eax
    109c:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
    10a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    unlink(fname);
    10a3:	83 ec 0c             	sub    $0xc,%esp
    10a6:	ff 75 e4             	pushl  -0x1c(%ebp)
    10a9:	e8 7e 2e 00 00       	call   3f2c <unlink>
    10ae:	83 c4 10             	add    $0x10,%esp

    pid = fork();
    10b1:	e8 1e 2e 00 00       	call   3ed4 <fork>
    10b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    if(pid < 0){
    10b9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    10bd:	79 17                	jns    10d6 <fourfiles+0x7d>
      printf(1, "fork failed\n");
    10bf:	83 ec 08             	sub    $0x8,%esp
    10c2:	68 bd 44 00 00       	push   $0x44bd
    10c7:	6a 01                	push   $0x1
    10c9:	e8 95 2f 00 00       	call   4063 <printf>
    10ce:	83 c4 10             	add    $0x10,%esp
      exit();
    10d1:	e8 06 2e 00 00       	call   3edc <exit>
    }

    if(pid == 0){
    10d6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    10da:	0f 85 a5 00 00 00    	jne    1185 <fourfiles+0x12c>
      fd = open(fname, O_CREATE | O_RDWR);
    10e0:	83 ec 08             	sub    $0x8,%esp
    10e3:	68 02 02 00 00       	push   $0x202
    10e8:	ff 75 e4             	pushl  -0x1c(%ebp)
    10eb:	e8 2c 2e 00 00       	call   3f1c <open>
    10f0:	83 c4 10             	add    $0x10,%esp
    10f3:	89 45 dc             	mov    %eax,-0x24(%ebp)
      if(fd < 0){
    10f6:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    10fa:	79 17                	jns    1113 <fourfiles+0xba>
        printf(1, "create failed\n");
    10fc:	83 ec 08             	sub    $0x8,%esp
    10ff:	68 51 4a 00 00       	push   $0x4a51
    1104:	6a 01                	push   $0x1
    1106:	e8 58 2f 00 00       	call   4063 <printf>
    110b:	83 c4 10             	add    $0x10,%esp
        exit();
    110e:	e8 c9 2d 00 00       	call   3edc <exit>
      }
      
      memset(buf, '0'+pi, 512);
    1113:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1116:	83 c0 30             	add    $0x30,%eax
    1119:	83 ec 04             	sub    $0x4,%esp
    111c:	68 00 02 00 00       	push   $0x200
    1121:	50                   	push   %eax
    1122:	68 c0 8a 00 00       	push   $0x8ac0
    1127:	e8 15 2c 00 00       	call   3d41 <memset>
    112c:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
    112f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1136:	eb 42                	jmp    117a <fourfiles+0x121>
        if((n = write(fd, buf, 500)) != 500){
    1138:	83 ec 04             	sub    $0x4,%esp
    113b:	68 f4 01 00 00       	push   $0x1f4
    1140:	68 c0 8a 00 00       	push   $0x8ac0
    1145:	ff 75 dc             	pushl  -0x24(%ebp)
    1148:	e8 af 2d 00 00       	call   3efc <write>
    114d:	83 c4 10             	add    $0x10,%esp
    1150:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1153:	81 7d d8 f4 01 00 00 	cmpl   $0x1f4,-0x28(%ebp)
    115a:	74 1a                	je     1176 <fourfiles+0x11d>
          printf(1, "write failed %d\n", n);
    115c:	83 ec 04             	sub    $0x4,%esp
    115f:	ff 75 d8             	pushl  -0x28(%ebp)
    1162:	68 60 4a 00 00       	push   $0x4a60
    1167:	6a 01                	push   $0x1
    1169:	e8 f5 2e 00 00       	call   4063 <printf>
    116e:	83 c4 10             	add    $0x10,%esp
          exit();
    1171:	e8 66 2d 00 00       	call   3edc <exit>
        printf(1, "create failed\n");
        exit();
      }
      
      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    1176:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    117a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    117e:	7e b8                	jle    1138 <fourfiles+0xdf>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    1180:	e8 57 2d 00 00       	call   3edc <exit>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    1185:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1189:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
    118d:	0f 8e 06 ff ff ff    	jle    1099 <fourfiles+0x40>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    1193:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    119a:	eb 09                	jmp    11a5 <fourfiles+0x14c>
    wait();
    119c:	e8 43 2d 00 00       	call   3ee4 <wait>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    11a1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    11a5:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
    11a9:	7e f1                	jle    119c <fourfiles+0x143>
    wait();
  }

  for(i = 0; i < 2; i++){
    11ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    11b2:	e9 d4 00 00 00       	jmp    128b <fourfiles+0x232>
    fname = names[i];
    11b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11ba:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
    11be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    fd = open(fname, 0);
    11c1:	83 ec 08             	sub    $0x8,%esp
    11c4:	6a 00                	push   $0x0
    11c6:	ff 75 e4             	pushl  -0x1c(%ebp)
    11c9:	e8 4e 2d 00 00       	call   3f1c <open>
    11ce:	83 c4 10             	add    $0x10,%esp
    11d1:	89 45 dc             	mov    %eax,-0x24(%ebp)
    total = 0;
    11d4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    11db:	eb 4a                	jmp    1227 <fourfiles+0x1ce>
      for(j = 0; j < n; j++){
    11dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    11e4:	eb 33                	jmp    1219 <fourfiles+0x1c0>
        if(buf[j] != '0'+i){
    11e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11e9:	05 c0 8a 00 00       	add    $0x8ac0,%eax
    11ee:	0f b6 00             	movzbl (%eax),%eax
    11f1:	0f be c0             	movsbl %al,%eax
    11f4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    11f7:	83 c2 30             	add    $0x30,%edx
    11fa:	39 d0                	cmp    %edx,%eax
    11fc:	74 17                	je     1215 <fourfiles+0x1bc>
          printf(1, "wrong char\n");
    11fe:	83 ec 08             	sub    $0x8,%esp
    1201:	68 71 4a 00 00       	push   $0x4a71
    1206:	6a 01                	push   $0x1
    1208:	e8 56 2e 00 00       	call   4063 <printf>
    120d:	83 c4 10             	add    $0x10,%esp
          exit();
    1210:	e8 c7 2c 00 00       	call   3edc <exit>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    1215:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1219:	8b 45 f0             	mov    -0x10(%ebp),%eax
    121c:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    121f:	7c c5                	jl     11e6 <fourfiles+0x18d>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    1221:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1224:	01 45 ec             	add    %eax,-0x14(%ebp)

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1227:	83 ec 04             	sub    $0x4,%esp
    122a:	68 00 20 00 00       	push   $0x2000
    122f:	68 c0 8a 00 00       	push   $0x8ac0
    1234:	ff 75 dc             	pushl  -0x24(%ebp)
    1237:	e8 b8 2c 00 00       	call   3ef4 <read>
    123c:	83 c4 10             	add    $0x10,%esp
    123f:	89 45 d8             	mov    %eax,-0x28(%ebp)
    1242:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    1246:	7f 95                	jg     11dd <fourfiles+0x184>
          exit();
        }
      }
      total += n;
    }
    close(fd);
    1248:	83 ec 0c             	sub    $0xc,%esp
    124b:	ff 75 dc             	pushl  -0x24(%ebp)
    124e:	e8 b1 2c 00 00       	call   3f04 <close>
    1253:	83 c4 10             	add    $0x10,%esp
    if(total != 12*500){
    1256:	81 7d ec 70 17 00 00 	cmpl   $0x1770,-0x14(%ebp)
    125d:	74 1a                	je     1279 <fourfiles+0x220>
      printf(1, "wrong length %d\n", total);
    125f:	83 ec 04             	sub    $0x4,%esp
    1262:	ff 75 ec             	pushl  -0x14(%ebp)
    1265:	68 7d 4a 00 00       	push   $0x4a7d
    126a:	6a 01                	push   $0x1
    126c:	e8 f2 2d 00 00       	call   4063 <printf>
    1271:	83 c4 10             	add    $0x10,%esp
      exit();
    1274:	e8 63 2c 00 00       	call   3edc <exit>
    }
    unlink(fname);
    1279:	83 ec 0c             	sub    $0xc,%esp
    127c:	ff 75 e4             	pushl  -0x1c(%ebp)
    127f:	e8 a8 2c 00 00       	call   3f2c <unlink>
    1284:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    1287:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    128b:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    128f:	0f 8e 22 ff ff ff    	jle    11b7 <fourfiles+0x15e>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    1295:	83 ec 08             	sub    $0x8,%esp
    1298:	68 8e 4a 00 00       	push   $0x4a8e
    129d:	6a 01                	push   $0x1
    129f:	e8 bf 2d 00 00       	call   4063 <printf>
    12a4:	83 c4 10             	add    $0x10,%esp
}
    12a7:	90                   	nop
    12a8:	c9                   	leave  
    12a9:	c3                   	ret    

000012aa <createdelete>:

// four processes create and delete different files in same directory
void
createdelete(void)
{
    12aa:	55                   	push   %ebp
    12ab:	89 e5                	mov    %esp,%ebp
    12ad:	83 ec 38             	sub    $0x38,%esp
	setprio(10);
    12b0:	83 ec 0c             	sub    $0xc,%esp
    12b3:	6a 0a                	push   $0xa
    12b5:	e8 c2 2c 00 00       	call   3f7c <setprio>
    12ba:	83 c4 10             	add    $0x10,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    12bd:	83 ec 08             	sub    $0x8,%esp
    12c0:	68 9c 4a 00 00       	push   $0x4a9c
    12c5:	6a 01                	push   $0x1
    12c7:	e8 97 2d 00 00       	call   4063 <printf>
    12cc:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    12cf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    12d6:	e9 f6 00 00 00       	jmp    13d1 <createdelete+0x127>
    pid = fork();
    12db:	e8 f4 2b 00 00       	call   3ed4 <fork>
    12e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    12e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    12e7:	79 17                	jns    1300 <createdelete+0x56>
      printf(1, "fork failed\n");
    12e9:	83 ec 08             	sub    $0x8,%esp
    12ec:	68 bd 44 00 00       	push   $0x44bd
    12f1:	6a 01                	push   $0x1
    12f3:	e8 6b 2d 00 00       	call   4063 <printf>
    12f8:	83 c4 10             	add    $0x10,%esp
      exit();
    12fb:	e8 dc 2b 00 00       	call   3edc <exit>
    }

    if(pid == 0){
    1300:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1304:	0f 85 c3 00 00 00    	jne    13cd <createdelete+0x123>
      name[0] = 'p' + pi;
    130a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    130d:	83 c0 70             	add    $0x70,%eax
    1310:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[2] = '\0';
    1313:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
      for(i = 0; i < N; i++){
    1317:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    131e:	e9 9b 00 00 00       	jmp    13be <createdelete+0x114>
        name[1] = '0' + i;
    1323:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1326:	83 c0 30             	add    $0x30,%eax
    1329:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    132c:	83 ec 08             	sub    $0x8,%esp
    132f:	68 02 02 00 00       	push   $0x202
    1334:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1337:	50                   	push   %eax
    1338:	e8 df 2b 00 00       	call   3f1c <open>
    133d:	83 c4 10             	add    $0x10,%esp
    1340:	89 45 e8             	mov    %eax,-0x18(%ebp)
        if(fd < 0){
    1343:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1347:	79 17                	jns    1360 <createdelete+0xb6>
          printf(1, "create failed\n");
    1349:	83 ec 08             	sub    $0x8,%esp
    134c:	68 51 4a 00 00       	push   $0x4a51
    1351:	6a 01                	push   $0x1
    1353:	e8 0b 2d 00 00       	call   4063 <printf>
    1358:	83 c4 10             	add    $0x10,%esp
          exit();
    135b:	e8 7c 2b 00 00       	call   3edc <exit>
        }
        close(fd);
    1360:	83 ec 0c             	sub    $0xc,%esp
    1363:	ff 75 e8             	pushl  -0x18(%ebp)
    1366:	e8 99 2b 00 00       	call   3f04 <close>
    136b:	83 c4 10             	add    $0x10,%esp
        if(i > 0 && (i % 2 ) == 0){
    136e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1372:	7e 46                	jle    13ba <createdelete+0x110>
    1374:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1377:	83 e0 01             	and    $0x1,%eax
    137a:	85 c0                	test   %eax,%eax
    137c:	75 3c                	jne    13ba <createdelete+0x110>
          name[1] = '0' + (i / 2);
    137e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1381:	89 c2                	mov    %eax,%edx
    1383:	c1 ea 1f             	shr    $0x1f,%edx
    1386:	01 d0                	add    %edx,%eax
    1388:	d1 f8                	sar    %eax
    138a:	83 c0 30             	add    $0x30,%eax
    138d:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1390:	83 ec 0c             	sub    $0xc,%esp
    1393:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1396:	50                   	push   %eax
    1397:	e8 90 2b 00 00       	call   3f2c <unlink>
    139c:	83 c4 10             	add    $0x10,%esp
    139f:	85 c0                	test   %eax,%eax
    13a1:	79 17                	jns    13ba <createdelete+0x110>
            printf(1, "unlink failed\n");
    13a3:	83 ec 08             	sub    $0x8,%esp
    13a6:	68 40 45 00 00       	push   $0x4540
    13ab:	6a 01                	push   $0x1
    13ad:	e8 b1 2c 00 00       	call   4063 <printf>
    13b2:	83 c4 10             	add    $0x10,%esp
            exit();
    13b5:	e8 22 2b 00 00       	call   3edc <exit>
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
    13ba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    13be:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    13c2:	0f 8e 5b ff ff ff    	jle    1323 <createdelete+0x79>
            printf(1, "unlink failed\n");
            exit();
          }
        }
      }
      exit();
    13c8:	e8 0f 2b 00 00       	call   3edc <exit>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    13cd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    13d1:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    13d5:	0f 8e 00 ff ff ff    	jle    12db <createdelete+0x31>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    13db:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    13e2:	eb 09                	jmp    13ed <createdelete+0x143>
    wait();
    13e4:	e8 fb 2a 00 00       	call   3ee4 <wait>
      }
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    13e9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    13ed:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    13f1:	7e f1                	jle    13e4 <createdelete+0x13a>
    wait();
  }

  name[0] = name[1] = name[2] = 0;
    13f3:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    13f7:	0f b6 45 ca          	movzbl -0x36(%ebp),%eax
    13fb:	88 45 c9             	mov    %al,-0x37(%ebp)
    13fe:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
    1402:	88 45 c8             	mov    %al,-0x38(%ebp)
  for(i = 0; i < N; i++){
    1405:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    140c:	e9 b2 00 00 00       	jmp    14c3 <createdelete+0x219>
    for(pi = 0; pi < 4; pi++){
    1411:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1418:	e9 98 00 00 00       	jmp    14b5 <createdelete+0x20b>
      name[0] = 'p' + pi;
    141d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1420:	83 c0 70             	add    $0x70,%eax
    1423:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1426:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1429:	83 c0 30             	add    $0x30,%eax
    142c:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    142f:	83 ec 08             	sub    $0x8,%esp
    1432:	6a 00                	push   $0x0
    1434:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1437:	50                   	push   %eax
    1438:	e8 df 2a 00 00       	call   3f1c <open>
    143d:	83 c4 10             	add    $0x10,%esp
    1440:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if((i == 0 || i >= N/2) && fd < 0){
    1443:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1447:	74 06                	je     144f <createdelete+0x1a5>
    1449:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    144d:	7e 21                	jle    1470 <createdelete+0x1c6>
    144f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1453:	79 1b                	jns    1470 <createdelete+0x1c6>
        printf(1, "oops createdelete %s didn't exist\n", name);
    1455:	83 ec 04             	sub    $0x4,%esp
    1458:	8d 45 c8             	lea    -0x38(%ebp),%eax
    145b:	50                   	push   %eax
    145c:	68 b0 4a 00 00       	push   $0x4ab0
    1461:	6a 01                	push   $0x1
    1463:	e8 fb 2b 00 00       	call   4063 <printf>
    1468:	83 c4 10             	add    $0x10,%esp
        exit();
    146b:	e8 6c 2a 00 00       	call   3edc <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1470:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1474:	7e 27                	jle    149d <createdelete+0x1f3>
    1476:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    147a:	7f 21                	jg     149d <createdelete+0x1f3>
    147c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1480:	78 1b                	js     149d <createdelete+0x1f3>
        printf(1, "oops createdelete %s did exist\n", name);
    1482:	83 ec 04             	sub    $0x4,%esp
    1485:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1488:	50                   	push   %eax
    1489:	68 d4 4a 00 00       	push   $0x4ad4
    148e:	6a 01                	push   $0x1
    1490:	e8 ce 2b 00 00       	call   4063 <printf>
    1495:	83 c4 10             	add    $0x10,%esp
        exit();
    1498:	e8 3f 2a 00 00       	call   3edc <exit>
      }
      if(fd >= 0)
    149d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    14a1:	78 0e                	js     14b1 <createdelete+0x207>
        close(fd);
    14a3:	83 ec 0c             	sub    $0xc,%esp
    14a6:	ff 75 e8             	pushl  -0x18(%ebp)
    14a9:	e8 56 2a 00 00       	call   3f04 <close>
    14ae:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    14b1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    14b5:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    14b9:	0f 8e 5e ff ff ff    	jle    141d <createdelete+0x173>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    14bf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    14c3:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    14c7:	0f 8e 44 ff ff ff    	jle    1411 <createdelete+0x167>
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    14cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    14d4:	eb 38                	jmp    150e <createdelete+0x264>
    for(pi = 0; pi < 4; pi++){
    14d6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14dd:	eb 25                	jmp    1504 <createdelete+0x25a>
      name[0] = 'p' + i;
    14df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14e2:	83 c0 70             	add    $0x70,%eax
    14e5:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    14e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14eb:	83 c0 30             	add    $0x30,%eax
    14ee:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    14f1:	83 ec 0c             	sub    $0xc,%esp
    14f4:	8d 45 c8             	lea    -0x38(%ebp),%eax
    14f7:	50                   	push   %eax
    14f8:	e8 2f 2a 00 00       	call   3f2c <unlink>
    14fd:	83 c4 10             	add    $0x10,%esp
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    1500:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1504:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    1508:	7e d5                	jle    14df <createdelete+0x235>
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    150a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    150e:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1512:	7e c2                	jle    14d6 <createdelete+0x22c>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    1514:	83 ec 08             	sub    $0x8,%esp
    1517:	68 f4 4a 00 00       	push   $0x4af4
    151c:	6a 01                	push   $0x1
    151e:	e8 40 2b 00 00       	call   4063 <printf>
    1523:	83 c4 10             	add    $0x10,%esp
}
    1526:	90                   	nop
    1527:	c9                   	leave  
    1528:	c3                   	ret    

00001529 <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1529:	55                   	push   %ebp
    152a:	89 e5                	mov    %esp,%ebp
    152c:	83 ec 18             	sub    $0x18,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    152f:	83 ec 08             	sub    $0x8,%esp
    1532:	68 05 4b 00 00       	push   $0x4b05
    1537:	6a 01                	push   $0x1
    1539:	e8 25 2b 00 00       	call   4063 <printf>
    153e:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1541:	83 ec 08             	sub    $0x8,%esp
    1544:	68 02 02 00 00       	push   $0x202
    1549:	68 16 4b 00 00       	push   $0x4b16
    154e:	e8 c9 29 00 00       	call   3f1c <open>
    1553:	83 c4 10             	add    $0x10,%esp
    1556:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1559:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    155d:	79 17                	jns    1576 <unlinkread+0x4d>
    printf(1, "create unlinkread failed\n");
    155f:	83 ec 08             	sub    $0x8,%esp
    1562:	68 21 4b 00 00       	push   $0x4b21
    1567:	6a 01                	push   $0x1
    1569:	e8 f5 2a 00 00       	call   4063 <printf>
    156e:	83 c4 10             	add    $0x10,%esp
    exit();
    1571:	e8 66 29 00 00       	call   3edc <exit>
  }
  write(fd, "hello", 5);
    1576:	83 ec 04             	sub    $0x4,%esp
    1579:	6a 05                	push   $0x5
    157b:	68 3b 4b 00 00       	push   $0x4b3b
    1580:	ff 75 f4             	pushl  -0xc(%ebp)
    1583:	e8 74 29 00 00       	call   3efc <write>
    1588:	83 c4 10             	add    $0x10,%esp
  close(fd);
    158b:	83 ec 0c             	sub    $0xc,%esp
    158e:	ff 75 f4             	pushl  -0xc(%ebp)
    1591:	e8 6e 29 00 00       	call   3f04 <close>
    1596:	83 c4 10             	add    $0x10,%esp

  fd = open("unlinkread", O_RDWR);
    1599:	83 ec 08             	sub    $0x8,%esp
    159c:	6a 02                	push   $0x2
    159e:	68 16 4b 00 00       	push   $0x4b16
    15a3:	e8 74 29 00 00       	call   3f1c <open>
    15a8:	83 c4 10             	add    $0x10,%esp
    15ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    15ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15b2:	79 17                	jns    15cb <unlinkread+0xa2>
    printf(1, "open unlinkread failed\n");
    15b4:	83 ec 08             	sub    $0x8,%esp
    15b7:	68 41 4b 00 00       	push   $0x4b41
    15bc:	6a 01                	push   $0x1
    15be:	e8 a0 2a 00 00       	call   4063 <printf>
    15c3:	83 c4 10             	add    $0x10,%esp
    exit();
    15c6:	e8 11 29 00 00       	call   3edc <exit>
  }
  if(unlink("unlinkread") != 0){
    15cb:	83 ec 0c             	sub    $0xc,%esp
    15ce:	68 16 4b 00 00       	push   $0x4b16
    15d3:	e8 54 29 00 00       	call   3f2c <unlink>
    15d8:	83 c4 10             	add    $0x10,%esp
    15db:	85 c0                	test   %eax,%eax
    15dd:	74 17                	je     15f6 <unlinkread+0xcd>
    printf(1, "unlink unlinkread failed\n");
    15df:	83 ec 08             	sub    $0x8,%esp
    15e2:	68 59 4b 00 00       	push   $0x4b59
    15e7:	6a 01                	push   $0x1
    15e9:	e8 75 2a 00 00       	call   4063 <printf>
    15ee:	83 c4 10             	add    $0x10,%esp
    exit();
    15f1:	e8 e6 28 00 00       	call   3edc <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    15f6:	83 ec 08             	sub    $0x8,%esp
    15f9:	68 02 02 00 00       	push   $0x202
    15fe:	68 16 4b 00 00       	push   $0x4b16
    1603:	e8 14 29 00 00       	call   3f1c <open>
    1608:	83 c4 10             	add    $0x10,%esp
    160b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  write(fd1, "yyy", 3);
    160e:	83 ec 04             	sub    $0x4,%esp
    1611:	6a 03                	push   $0x3
    1613:	68 73 4b 00 00       	push   $0x4b73
    1618:	ff 75 f0             	pushl  -0x10(%ebp)
    161b:	e8 dc 28 00 00       	call   3efc <write>
    1620:	83 c4 10             	add    $0x10,%esp
  close(fd1);
    1623:	83 ec 0c             	sub    $0xc,%esp
    1626:	ff 75 f0             	pushl  -0x10(%ebp)
    1629:	e8 d6 28 00 00       	call   3f04 <close>
    162e:	83 c4 10             	add    $0x10,%esp

  if(read(fd, buf, sizeof(buf)) != 5){
    1631:	83 ec 04             	sub    $0x4,%esp
    1634:	68 00 20 00 00       	push   $0x2000
    1639:	68 c0 8a 00 00       	push   $0x8ac0
    163e:	ff 75 f4             	pushl  -0xc(%ebp)
    1641:	e8 ae 28 00 00       	call   3ef4 <read>
    1646:	83 c4 10             	add    $0x10,%esp
    1649:	83 f8 05             	cmp    $0x5,%eax
    164c:	74 17                	je     1665 <unlinkread+0x13c>
    printf(1, "unlinkread read failed");
    164e:	83 ec 08             	sub    $0x8,%esp
    1651:	68 77 4b 00 00       	push   $0x4b77
    1656:	6a 01                	push   $0x1
    1658:	e8 06 2a 00 00       	call   4063 <printf>
    165d:	83 c4 10             	add    $0x10,%esp
    exit();
    1660:	e8 77 28 00 00       	call   3edc <exit>
  }
  if(buf[0] != 'h'){
    1665:	0f b6 05 c0 8a 00 00 	movzbl 0x8ac0,%eax
    166c:	3c 68                	cmp    $0x68,%al
    166e:	74 17                	je     1687 <unlinkread+0x15e>
    printf(1, "unlinkread wrong data\n");
    1670:	83 ec 08             	sub    $0x8,%esp
    1673:	68 8e 4b 00 00       	push   $0x4b8e
    1678:	6a 01                	push   $0x1
    167a:	e8 e4 29 00 00       	call   4063 <printf>
    167f:	83 c4 10             	add    $0x10,%esp
    exit();
    1682:	e8 55 28 00 00       	call   3edc <exit>
  }
  if(write(fd, buf, 10) != 10){
    1687:	83 ec 04             	sub    $0x4,%esp
    168a:	6a 0a                	push   $0xa
    168c:	68 c0 8a 00 00       	push   $0x8ac0
    1691:	ff 75 f4             	pushl  -0xc(%ebp)
    1694:	e8 63 28 00 00       	call   3efc <write>
    1699:	83 c4 10             	add    $0x10,%esp
    169c:	83 f8 0a             	cmp    $0xa,%eax
    169f:	74 17                	je     16b8 <unlinkread+0x18f>
    printf(1, "unlinkread write failed\n");
    16a1:	83 ec 08             	sub    $0x8,%esp
    16a4:	68 a5 4b 00 00       	push   $0x4ba5
    16a9:	6a 01                	push   $0x1
    16ab:	e8 b3 29 00 00       	call   4063 <printf>
    16b0:	83 c4 10             	add    $0x10,%esp
    exit();
    16b3:	e8 24 28 00 00       	call   3edc <exit>
  }
  close(fd);
    16b8:	83 ec 0c             	sub    $0xc,%esp
    16bb:	ff 75 f4             	pushl  -0xc(%ebp)
    16be:	e8 41 28 00 00       	call   3f04 <close>
    16c3:	83 c4 10             	add    $0x10,%esp
  unlink("unlinkread");
    16c6:	83 ec 0c             	sub    $0xc,%esp
    16c9:	68 16 4b 00 00       	push   $0x4b16
    16ce:	e8 59 28 00 00       	call   3f2c <unlink>
    16d3:	83 c4 10             	add    $0x10,%esp
  printf(1, "unlinkread ok\n");
    16d6:	83 ec 08             	sub    $0x8,%esp
    16d9:	68 be 4b 00 00       	push   $0x4bbe
    16de:	6a 01                	push   $0x1
    16e0:	e8 7e 29 00 00       	call   4063 <printf>
    16e5:	83 c4 10             	add    $0x10,%esp
}
    16e8:	90                   	nop
    16e9:	c9                   	leave  
    16ea:	c3                   	ret    

000016eb <linktest>:

void
linktest(void)
{
    16eb:	55                   	push   %ebp
    16ec:	89 e5                	mov    %esp,%ebp
    16ee:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "linktest\n");
    16f1:	83 ec 08             	sub    $0x8,%esp
    16f4:	68 cd 4b 00 00       	push   $0x4bcd
    16f9:	6a 01                	push   $0x1
    16fb:	e8 63 29 00 00       	call   4063 <printf>
    1700:	83 c4 10             	add    $0x10,%esp

  unlink("lf1");
    1703:	83 ec 0c             	sub    $0xc,%esp
    1706:	68 d7 4b 00 00       	push   $0x4bd7
    170b:	e8 1c 28 00 00       	call   3f2c <unlink>
    1710:	83 c4 10             	add    $0x10,%esp
  unlink("lf2");
    1713:	83 ec 0c             	sub    $0xc,%esp
    1716:	68 db 4b 00 00       	push   $0x4bdb
    171b:	e8 0c 28 00 00       	call   3f2c <unlink>
    1720:	83 c4 10             	add    $0x10,%esp

  fd = open("lf1", O_CREATE|O_RDWR);
    1723:	83 ec 08             	sub    $0x8,%esp
    1726:	68 02 02 00 00       	push   $0x202
    172b:	68 d7 4b 00 00       	push   $0x4bd7
    1730:	e8 e7 27 00 00       	call   3f1c <open>
    1735:	83 c4 10             	add    $0x10,%esp
    1738:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    173b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    173f:	79 17                	jns    1758 <linktest+0x6d>
    printf(1, "create lf1 failed\n");
    1741:	83 ec 08             	sub    $0x8,%esp
    1744:	68 df 4b 00 00       	push   $0x4bdf
    1749:	6a 01                	push   $0x1
    174b:	e8 13 29 00 00       	call   4063 <printf>
    1750:	83 c4 10             	add    $0x10,%esp
    exit();
    1753:	e8 84 27 00 00       	call   3edc <exit>
  }
  if(write(fd, "hello", 5) != 5){
    1758:	83 ec 04             	sub    $0x4,%esp
    175b:	6a 05                	push   $0x5
    175d:	68 3b 4b 00 00       	push   $0x4b3b
    1762:	ff 75 f4             	pushl  -0xc(%ebp)
    1765:	e8 92 27 00 00       	call   3efc <write>
    176a:	83 c4 10             	add    $0x10,%esp
    176d:	83 f8 05             	cmp    $0x5,%eax
    1770:	74 17                	je     1789 <linktest+0x9e>
    printf(1, "write lf1 failed\n");
    1772:	83 ec 08             	sub    $0x8,%esp
    1775:	68 f2 4b 00 00       	push   $0x4bf2
    177a:	6a 01                	push   $0x1
    177c:	e8 e2 28 00 00       	call   4063 <printf>
    1781:	83 c4 10             	add    $0x10,%esp
    exit();
    1784:	e8 53 27 00 00       	call   3edc <exit>
  }
  close(fd);
    1789:	83 ec 0c             	sub    $0xc,%esp
    178c:	ff 75 f4             	pushl  -0xc(%ebp)
    178f:	e8 70 27 00 00       	call   3f04 <close>
    1794:	83 c4 10             	add    $0x10,%esp

  if(link("lf1", "lf2") < 0){
    1797:	83 ec 08             	sub    $0x8,%esp
    179a:	68 db 4b 00 00       	push   $0x4bdb
    179f:	68 d7 4b 00 00       	push   $0x4bd7
    17a4:	e8 93 27 00 00       	call   3f3c <link>
    17a9:	83 c4 10             	add    $0x10,%esp
    17ac:	85 c0                	test   %eax,%eax
    17ae:	79 17                	jns    17c7 <linktest+0xdc>
    printf(1, "link lf1 lf2 failed\n");
    17b0:	83 ec 08             	sub    $0x8,%esp
    17b3:	68 04 4c 00 00       	push   $0x4c04
    17b8:	6a 01                	push   $0x1
    17ba:	e8 a4 28 00 00       	call   4063 <printf>
    17bf:	83 c4 10             	add    $0x10,%esp
    exit();
    17c2:	e8 15 27 00 00       	call   3edc <exit>
  }
  unlink("lf1");
    17c7:	83 ec 0c             	sub    $0xc,%esp
    17ca:	68 d7 4b 00 00       	push   $0x4bd7
    17cf:	e8 58 27 00 00       	call   3f2c <unlink>
    17d4:	83 c4 10             	add    $0x10,%esp

  if(open("lf1", 0) >= 0){
    17d7:	83 ec 08             	sub    $0x8,%esp
    17da:	6a 00                	push   $0x0
    17dc:	68 d7 4b 00 00       	push   $0x4bd7
    17e1:	e8 36 27 00 00       	call   3f1c <open>
    17e6:	83 c4 10             	add    $0x10,%esp
    17e9:	85 c0                	test   %eax,%eax
    17eb:	78 17                	js     1804 <linktest+0x119>
    printf(1, "unlinked lf1 but it is still there!\n");
    17ed:	83 ec 08             	sub    $0x8,%esp
    17f0:	68 1c 4c 00 00       	push   $0x4c1c
    17f5:	6a 01                	push   $0x1
    17f7:	e8 67 28 00 00       	call   4063 <printf>
    17fc:	83 c4 10             	add    $0x10,%esp
    exit();
    17ff:	e8 d8 26 00 00       	call   3edc <exit>
  }

  fd = open("lf2", 0);
    1804:	83 ec 08             	sub    $0x8,%esp
    1807:	6a 00                	push   $0x0
    1809:	68 db 4b 00 00       	push   $0x4bdb
    180e:	e8 09 27 00 00       	call   3f1c <open>
    1813:	83 c4 10             	add    $0x10,%esp
    1816:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1819:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    181d:	79 17                	jns    1836 <linktest+0x14b>
    printf(1, "open lf2 failed\n");
    181f:	83 ec 08             	sub    $0x8,%esp
    1822:	68 41 4c 00 00       	push   $0x4c41
    1827:	6a 01                	push   $0x1
    1829:	e8 35 28 00 00       	call   4063 <printf>
    182e:	83 c4 10             	add    $0x10,%esp
    exit();
    1831:	e8 a6 26 00 00       	call   3edc <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    1836:	83 ec 04             	sub    $0x4,%esp
    1839:	68 00 20 00 00       	push   $0x2000
    183e:	68 c0 8a 00 00       	push   $0x8ac0
    1843:	ff 75 f4             	pushl  -0xc(%ebp)
    1846:	e8 a9 26 00 00       	call   3ef4 <read>
    184b:	83 c4 10             	add    $0x10,%esp
    184e:	83 f8 05             	cmp    $0x5,%eax
    1851:	74 17                	je     186a <linktest+0x17f>
    printf(1, "read lf2 failed\n");
    1853:	83 ec 08             	sub    $0x8,%esp
    1856:	68 52 4c 00 00       	push   $0x4c52
    185b:	6a 01                	push   $0x1
    185d:	e8 01 28 00 00       	call   4063 <printf>
    1862:	83 c4 10             	add    $0x10,%esp
    exit();
    1865:	e8 72 26 00 00       	call   3edc <exit>
  }
  close(fd);
    186a:	83 ec 0c             	sub    $0xc,%esp
    186d:	ff 75 f4             	pushl  -0xc(%ebp)
    1870:	e8 8f 26 00 00       	call   3f04 <close>
    1875:	83 c4 10             	add    $0x10,%esp

  if(link("lf2", "lf2") >= 0){
    1878:	83 ec 08             	sub    $0x8,%esp
    187b:	68 db 4b 00 00       	push   $0x4bdb
    1880:	68 db 4b 00 00       	push   $0x4bdb
    1885:	e8 b2 26 00 00       	call   3f3c <link>
    188a:	83 c4 10             	add    $0x10,%esp
    188d:	85 c0                	test   %eax,%eax
    188f:	78 17                	js     18a8 <linktest+0x1bd>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1891:	83 ec 08             	sub    $0x8,%esp
    1894:	68 63 4c 00 00       	push   $0x4c63
    1899:	6a 01                	push   $0x1
    189b:	e8 c3 27 00 00       	call   4063 <printf>
    18a0:	83 c4 10             	add    $0x10,%esp
    exit();
    18a3:	e8 34 26 00 00       	call   3edc <exit>
  }

  unlink("lf2");
    18a8:	83 ec 0c             	sub    $0xc,%esp
    18ab:	68 db 4b 00 00       	push   $0x4bdb
    18b0:	e8 77 26 00 00       	call   3f2c <unlink>
    18b5:	83 c4 10             	add    $0x10,%esp
  if(link("lf2", "lf1") >= 0){
    18b8:	83 ec 08             	sub    $0x8,%esp
    18bb:	68 d7 4b 00 00       	push   $0x4bd7
    18c0:	68 db 4b 00 00       	push   $0x4bdb
    18c5:	e8 72 26 00 00       	call   3f3c <link>
    18ca:	83 c4 10             	add    $0x10,%esp
    18cd:	85 c0                	test   %eax,%eax
    18cf:	78 17                	js     18e8 <linktest+0x1fd>
    printf(1, "link non-existant succeeded! oops\n");
    18d1:	83 ec 08             	sub    $0x8,%esp
    18d4:	68 84 4c 00 00       	push   $0x4c84
    18d9:	6a 01                	push   $0x1
    18db:	e8 83 27 00 00       	call   4063 <printf>
    18e0:	83 c4 10             	add    $0x10,%esp
    exit();
    18e3:	e8 f4 25 00 00       	call   3edc <exit>
  }

  if(link(".", "lf1") >= 0){
    18e8:	83 ec 08             	sub    $0x8,%esp
    18eb:	68 d7 4b 00 00       	push   $0x4bd7
    18f0:	68 a7 4c 00 00       	push   $0x4ca7
    18f5:	e8 42 26 00 00       	call   3f3c <link>
    18fa:	83 c4 10             	add    $0x10,%esp
    18fd:	85 c0                	test   %eax,%eax
    18ff:	78 17                	js     1918 <linktest+0x22d>
    printf(1, "link . lf1 succeeded! oops\n");
    1901:	83 ec 08             	sub    $0x8,%esp
    1904:	68 a9 4c 00 00       	push   $0x4ca9
    1909:	6a 01                	push   $0x1
    190b:	e8 53 27 00 00       	call   4063 <printf>
    1910:	83 c4 10             	add    $0x10,%esp
    exit();
    1913:	e8 c4 25 00 00       	call   3edc <exit>
  }

  printf(1, "linktest ok\n");
    1918:	83 ec 08             	sub    $0x8,%esp
    191b:	68 c5 4c 00 00       	push   $0x4cc5
    1920:	6a 01                	push   $0x1
    1922:	e8 3c 27 00 00       	call   4063 <printf>
    1927:	83 c4 10             	add    $0x10,%esp
}
    192a:	90                   	nop
    192b:	c9                   	leave  
    192c:	c3                   	ret    

0000192d <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    192d:	55                   	push   %ebp
    192e:	89 e5                	mov    %esp,%ebp
    1930:	83 ec 58             	sub    $0x58,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    1933:	83 ec 08             	sub    $0x8,%esp
    1936:	68 d2 4c 00 00       	push   $0x4cd2
    193b:	6a 01                	push   $0x1
    193d:	e8 21 27 00 00       	call   4063 <printf>
    1942:	83 c4 10             	add    $0x10,%esp
  file[0] = 'C';
    1945:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    1949:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    194d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1954:	e9 fc 00 00 00       	jmp    1a55 <concreate+0x128>
    file[1] = '0' + i;
    1959:	8b 45 f4             	mov    -0xc(%ebp),%eax
    195c:	83 c0 30             	add    $0x30,%eax
    195f:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    1962:	83 ec 0c             	sub    $0xc,%esp
    1965:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1968:	50                   	push   %eax
    1969:	e8 be 25 00 00       	call   3f2c <unlink>
    196e:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    1971:	e8 5e 25 00 00       	call   3ed4 <fork>
    1976:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    1979:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    197d:	74 3b                	je     19ba <concreate+0x8d>
    197f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1982:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1987:	89 c8                	mov    %ecx,%eax
    1989:	f7 ea                	imul   %edx
    198b:	89 c8                	mov    %ecx,%eax
    198d:	c1 f8 1f             	sar    $0x1f,%eax
    1990:	29 c2                	sub    %eax,%edx
    1992:	89 d0                	mov    %edx,%eax
    1994:	01 c0                	add    %eax,%eax
    1996:	01 d0                	add    %edx,%eax
    1998:	29 c1                	sub    %eax,%ecx
    199a:	89 ca                	mov    %ecx,%edx
    199c:	83 fa 01             	cmp    $0x1,%edx
    199f:	75 19                	jne    19ba <concreate+0x8d>
      link("C0", file);
    19a1:	83 ec 08             	sub    $0x8,%esp
    19a4:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19a7:	50                   	push   %eax
    19a8:	68 e2 4c 00 00       	push   $0x4ce2
    19ad:	e8 8a 25 00 00       	call   3f3c <link>
    19b2:	83 c4 10             	add    $0x10,%esp
    19b5:	e9 87 00 00 00       	jmp    1a41 <concreate+0x114>
    } else if(pid == 0 && (i % 5) == 1){
    19ba:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19be:	75 3b                	jne    19fb <concreate+0xce>
    19c0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    19c3:	ba 67 66 66 66       	mov    $0x66666667,%edx
    19c8:	89 c8                	mov    %ecx,%eax
    19ca:	f7 ea                	imul   %edx
    19cc:	d1 fa                	sar    %edx
    19ce:	89 c8                	mov    %ecx,%eax
    19d0:	c1 f8 1f             	sar    $0x1f,%eax
    19d3:	29 c2                	sub    %eax,%edx
    19d5:	89 d0                	mov    %edx,%eax
    19d7:	c1 e0 02             	shl    $0x2,%eax
    19da:	01 d0                	add    %edx,%eax
    19dc:	29 c1                	sub    %eax,%ecx
    19de:	89 ca                	mov    %ecx,%edx
    19e0:	83 fa 01             	cmp    $0x1,%edx
    19e3:	75 16                	jne    19fb <concreate+0xce>
      link("C0", file);
    19e5:	83 ec 08             	sub    $0x8,%esp
    19e8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19eb:	50                   	push   %eax
    19ec:	68 e2 4c 00 00       	push   $0x4ce2
    19f1:	e8 46 25 00 00       	call   3f3c <link>
    19f6:	83 c4 10             	add    $0x10,%esp
    19f9:	eb 46                	jmp    1a41 <concreate+0x114>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    19fb:	83 ec 08             	sub    $0x8,%esp
    19fe:	68 02 02 00 00       	push   $0x202
    1a03:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1a06:	50                   	push   %eax
    1a07:	e8 10 25 00 00       	call   3f1c <open>
    1a0c:	83 c4 10             	add    $0x10,%esp
    1a0f:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(fd < 0){
    1a12:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1a16:	79 1b                	jns    1a33 <concreate+0x106>
        printf(1, "concreate create %s failed\n", file);
    1a18:	83 ec 04             	sub    $0x4,%esp
    1a1b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1a1e:	50                   	push   %eax
    1a1f:	68 e5 4c 00 00       	push   $0x4ce5
    1a24:	6a 01                	push   $0x1
    1a26:	e8 38 26 00 00       	call   4063 <printf>
    1a2b:	83 c4 10             	add    $0x10,%esp
        exit();
    1a2e:	e8 a9 24 00 00       	call   3edc <exit>
      }
      close(fd);
    1a33:	83 ec 0c             	sub    $0xc,%esp
    1a36:	ff 75 e8             	pushl  -0x18(%ebp)
    1a39:	e8 c6 24 00 00       	call   3f04 <close>
    1a3e:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    1a41:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a45:	75 05                	jne    1a4c <concreate+0x11f>
      exit();
    1a47:	e8 90 24 00 00       	call   3edc <exit>
    else
      wait();
    1a4c:	e8 93 24 00 00       	call   3ee4 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1a51:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1a55:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1a59:	0f 8e fa fe ff ff    	jle    1959 <concreate+0x2c>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1a5f:	83 ec 04             	sub    $0x4,%esp
    1a62:	6a 28                	push   $0x28
    1a64:	6a 00                	push   $0x0
    1a66:	8d 45 bd             	lea    -0x43(%ebp),%eax
    1a69:	50                   	push   %eax
    1a6a:	e8 d2 22 00 00       	call   3d41 <memset>
    1a6f:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    1a72:	83 ec 08             	sub    $0x8,%esp
    1a75:	6a 00                	push   $0x0
    1a77:	68 a7 4c 00 00       	push   $0x4ca7
    1a7c:	e8 9b 24 00 00       	call   3f1c <open>
    1a81:	83 c4 10             	add    $0x10,%esp
    1a84:	89 45 e8             	mov    %eax,-0x18(%ebp)
  n = 0;
    1a87:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    1a8e:	e9 93 00 00 00       	jmp    1b26 <concreate+0x1f9>
    if(de.inum == 0)
    1a93:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    1a97:	66 85 c0             	test   %ax,%ax
    1a9a:	75 05                	jne    1aa1 <concreate+0x174>
      continue;
    1a9c:	e9 85 00 00 00       	jmp    1b26 <concreate+0x1f9>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1aa1:	0f b6 45 ae          	movzbl -0x52(%ebp),%eax
    1aa5:	3c 43                	cmp    $0x43,%al
    1aa7:	75 7d                	jne    1b26 <concreate+0x1f9>
    1aa9:	0f b6 45 b0          	movzbl -0x50(%ebp),%eax
    1aad:	84 c0                	test   %al,%al
    1aaf:	75 75                	jne    1b26 <concreate+0x1f9>
      i = de.name[1] - '0';
    1ab1:	0f b6 45 af          	movzbl -0x51(%ebp),%eax
    1ab5:	0f be c0             	movsbl %al,%eax
    1ab8:	83 e8 30             	sub    $0x30,%eax
    1abb:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    1abe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ac2:	78 08                	js     1acc <concreate+0x19f>
    1ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ac7:	83 f8 27             	cmp    $0x27,%eax
    1aca:	76 1e                	jbe    1aea <concreate+0x1bd>
        printf(1, "concreate weird file %s\n", de.name);
    1acc:	83 ec 04             	sub    $0x4,%esp
    1acf:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1ad2:	83 c0 02             	add    $0x2,%eax
    1ad5:	50                   	push   %eax
    1ad6:	68 01 4d 00 00       	push   $0x4d01
    1adb:	6a 01                	push   $0x1
    1add:	e8 81 25 00 00       	call   4063 <printf>
    1ae2:	83 c4 10             	add    $0x10,%esp
        exit();
    1ae5:	e8 f2 23 00 00       	call   3edc <exit>
      }
      if(fa[i]){
    1aea:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1aed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af0:	01 d0                	add    %edx,%eax
    1af2:	0f b6 00             	movzbl (%eax),%eax
    1af5:	84 c0                	test   %al,%al
    1af7:	74 1e                	je     1b17 <concreate+0x1ea>
        printf(1, "concreate duplicate file %s\n", de.name);
    1af9:	83 ec 04             	sub    $0x4,%esp
    1afc:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1aff:	83 c0 02             	add    $0x2,%eax
    1b02:	50                   	push   %eax
    1b03:	68 1a 4d 00 00       	push   $0x4d1a
    1b08:	6a 01                	push   $0x1
    1b0a:	e8 54 25 00 00       	call   4063 <printf>
    1b0f:	83 c4 10             	add    $0x10,%esp
        exit();
    1b12:	e8 c5 23 00 00       	call   3edc <exit>
      }
      fa[i] = 1;
    1b17:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1b1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b1d:	01 d0                	add    %edx,%eax
    1b1f:	c6 00 01             	movb   $0x1,(%eax)
      n++;
    1b22:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1b26:	83 ec 04             	sub    $0x4,%esp
    1b29:	6a 10                	push   $0x10
    1b2b:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1b2e:	50                   	push   %eax
    1b2f:	ff 75 e8             	pushl  -0x18(%ebp)
    1b32:	e8 bd 23 00 00       	call   3ef4 <read>
    1b37:	83 c4 10             	add    $0x10,%esp
    1b3a:	85 c0                	test   %eax,%eax
    1b3c:	0f 8f 51 ff ff ff    	jg     1a93 <concreate+0x166>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    1b42:	83 ec 0c             	sub    $0xc,%esp
    1b45:	ff 75 e8             	pushl  -0x18(%ebp)
    1b48:	e8 b7 23 00 00       	call   3f04 <close>
    1b4d:	83 c4 10             	add    $0x10,%esp

  if(n != 40){
    1b50:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    1b54:	74 17                	je     1b6d <concreate+0x240>
    printf(1, "concreate not enough files in directory listing\n");
    1b56:	83 ec 08             	sub    $0x8,%esp
    1b59:	68 38 4d 00 00       	push   $0x4d38
    1b5e:	6a 01                	push   $0x1
    1b60:	e8 fe 24 00 00       	call   4063 <printf>
    1b65:	83 c4 10             	add    $0x10,%esp
    exit();
    1b68:	e8 6f 23 00 00       	call   3edc <exit>
  }

  for(i = 0; i < 40; i++){
    1b6d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1b74:	e9 45 01 00 00       	jmp    1cbe <concreate+0x391>
    file[1] = '0' + i;
    1b79:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b7c:	83 c0 30             	add    $0x30,%eax
    1b7f:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    1b82:	e8 4d 23 00 00       	call   3ed4 <fork>
    1b87:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    1b8a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b8e:	79 17                	jns    1ba7 <concreate+0x27a>
      printf(1, "fork failed\n");
    1b90:	83 ec 08             	sub    $0x8,%esp
    1b93:	68 bd 44 00 00       	push   $0x44bd
    1b98:	6a 01                	push   $0x1
    1b9a:	e8 c4 24 00 00       	call   4063 <printf>
    1b9f:	83 c4 10             	add    $0x10,%esp
      exit();
    1ba2:	e8 35 23 00 00       	call   3edc <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    1ba7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1baa:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1baf:	89 c8                	mov    %ecx,%eax
    1bb1:	f7 ea                	imul   %edx
    1bb3:	89 c8                	mov    %ecx,%eax
    1bb5:	c1 f8 1f             	sar    $0x1f,%eax
    1bb8:	29 c2                	sub    %eax,%edx
    1bba:	89 d0                	mov    %edx,%eax
    1bbc:	89 c2                	mov    %eax,%edx
    1bbe:	01 d2                	add    %edx,%edx
    1bc0:	01 c2                	add    %eax,%edx
    1bc2:	89 c8                	mov    %ecx,%eax
    1bc4:	29 d0                	sub    %edx,%eax
    1bc6:	85 c0                	test   %eax,%eax
    1bc8:	75 06                	jne    1bd0 <concreate+0x2a3>
    1bca:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1bce:	74 28                	je     1bf8 <concreate+0x2cb>
       ((i % 3) == 1 && pid != 0)){
    1bd0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1bd3:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1bd8:	89 c8                	mov    %ecx,%eax
    1bda:	f7 ea                	imul   %edx
    1bdc:	89 c8                	mov    %ecx,%eax
    1bde:	c1 f8 1f             	sar    $0x1f,%eax
    1be1:	29 c2                	sub    %eax,%edx
    1be3:	89 d0                	mov    %edx,%eax
    1be5:	01 c0                	add    %eax,%eax
    1be7:	01 d0                	add    %edx,%eax
    1be9:	29 c1                	sub    %eax,%ecx
    1beb:	89 ca                	mov    %ecx,%edx
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1bed:	83 fa 01             	cmp    $0x1,%edx
    1bf0:	75 7c                	jne    1c6e <concreate+0x341>
       ((i % 3) == 1 && pid != 0)){
    1bf2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1bf6:	74 76                	je     1c6e <concreate+0x341>
      close(open(file, 0));
    1bf8:	83 ec 08             	sub    $0x8,%esp
    1bfb:	6a 00                	push   $0x0
    1bfd:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c00:	50                   	push   %eax
    1c01:	e8 16 23 00 00       	call   3f1c <open>
    1c06:	83 c4 10             	add    $0x10,%esp
    1c09:	83 ec 0c             	sub    $0xc,%esp
    1c0c:	50                   	push   %eax
    1c0d:	e8 f2 22 00 00       	call   3f04 <close>
    1c12:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1c15:	83 ec 08             	sub    $0x8,%esp
    1c18:	6a 00                	push   $0x0
    1c1a:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c1d:	50                   	push   %eax
    1c1e:	e8 f9 22 00 00       	call   3f1c <open>
    1c23:	83 c4 10             	add    $0x10,%esp
    1c26:	83 ec 0c             	sub    $0xc,%esp
    1c29:	50                   	push   %eax
    1c2a:	e8 d5 22 00 00       	call   3f04 <close>
    1c2f:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1c32:	83 ec 08             	sub    $0x8,%esp
    1c35:	6a 00                	push   $0x0
    1c37:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c3a:	50                   	push   %eax
    1c3b:	e8 dc 22 00 00       	call   3f1c <open>
    1c40:	83 c4 10             	add    $0x10,%esp
    1c43:	83 ec 0c             	sub    $0xc,%esp
    1c46:	50                   	push   %eax
    1c47:	e8 b8 22 00 00       	call   3f04 <close>
    1c4c:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1c4f:	83 ec 08             	sub    $0x8,%esp
    1c52:	6a 00                	push   $0x0
    1c54:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c57:	50                   	push   %eax
    1c58:	e8 bf 22 00 00       	call   3f1c <open>
    1c5d:	83 c4 10             	add    $0x10,%esp
    1c60:	83 ec 0c             	sub    $0xc,%esp
    1c63:	50                   	push   %eax
    1c64:	e8 9b 22 00 00       	call   3f04 <close>
    1c69:	83 c4 10             	add    $0x10,%esp
    1c6c:	eb 3c                	jmp    1caa <concreate+0x37d>
    } else {
      unlink(file);
    1c6e:	83 ec 0c             	sub    $0xc,%esp
    1c71:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c74:	50                   	push   %eax
    1c75:	e8 b2 22 00 00       	call   3f2c <unlink>
    1c7a:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1c7d:	83 ec 0c             	sub    $0xc,%esp
    1c80:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c83:	50                   	push   %eax
    1c84:	e8 a3 22 00 00       	call   3f2c <unlink>
    1c89:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1c8c:	83 ec 0c             	sub    $0xc,%esp
    1c8f:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c92:	50                   	push   %eax
    1c93:	e8 94 22 00 00       	call   3f2c <unlink>
    1c98:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1c9b:	83 ec 0c             	sub    $0xc,%esp
    1c9e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1ca1:	50                   	push   %eax
    1ca2:	e8 85 22 00 00       	call   3f2c <unlink>
    1ca7:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    1caa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1cae:	75 05                	jne    1cb5 <concreate+0x388>
      exit();
    1cb0:	e8 27 22 00 00       	call   3edc <exit>
    else
      wait();
    1cb5:	e8 2a 22 00 00       	call   3ee4 <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1cba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1cbe:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1cc2:	0f 8e b1 fe ff ff    	jle    1b79 <concreate+0x24c>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1cc8:	83 ec 08             	sub    $0x8,%esp
    1ccb:	68 69 4d 00 00       	push   $0x4d69
    1cd0:	6a 01                	push   $0x1
    1cd2:	e8 8c 23 00 00       	call   4063 <printf>
    1cd7:	83 c4 10             	add    $0x10,%esp
}
    1cda:	90                   	nop
    1cdb:	c9                   	leave  
    1cdc:	c3                   	ret    

00001cdd <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1cdd:	55                   	push   %ebp
    1cde:	89 e5                	mov    %esp,%ebp
    1ce0:	83 ec 18             	sub    $0x18,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1ce3:	83 ec 08             	sub    $0x8,%esp
    1ce6:	68 77 4d 00 00       	push   $0x4d77
    1ceb:	6a 01                	push   $0x1
    1ced:	e8 71 23 00 00       	call   4063 <printf>
    1cf2:	83 c4 10             	add    $0x10,%esp

  unlink("x");
    1cf5:	83 ec 0c             	sub    $0xc,%esp
    1cf8:	68 f3 48 00 00       	push   $0x48f3
    1cfd:	e8 2a 22 00 00       	call   3f2c <unlink>
    1d02:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    1d05:	e8 ca 21 00 00       	call   3ed4 <fork>
    1d0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1d0d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d11:	79 17                	jns    1d2a <linkunlink+0x4d>
    printf(1, "fork failed\n");
    1d13:	83 ec 08             	sub    $0x8,%esp
    1d16:	68 bd 44 00 00       	push   $0x44bd
    1d1b:	6a 01                	push   $0x1
    1d1d:	e8 41 23 00 00       	call   4063 <printf>
    1d22:	83 c4 10             	add    $0x10,%esp
    exit();
    1d25:	e8 b2 21 00 00       	call   3edc <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1d2a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d2e:	74 07                	je     1d37 <linkunlink+0x5a>
    1d30:	b8 01 00 00 00       	mov    $0x1,%eax
    1d35:	eb 05                	jmp    1d3c <linkunlink+0x5f>
    1d37:	b8 61 00 00 00       	mov    $0x61,%eax
    1d3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 100; i++){
    1d3f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d46:	e9 9a 00 00 00       	jmp    1de5 <linkunlink+0x108>
    x = x * 1103515245 + 12345;
    1d4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d4e:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    1d54:	05 39 30 00 00       	add    $0x3039,%eax
    1d59:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((x % 3) == 0){
    1d5c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1d5f:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1d64:	89 c8                	mov    %ecx,%eax
    1d66:	f7 e2                	mul    %edx
    1d68:	89 d0                	mov    %edx,%eax
    1d6a:	d1 e8                	shr    %eax
    1d6c:	89 c2                	mov    %eax,%edx
    1d6e:	01 d2                	add    %edx,%edx
    1d70:	01 c2                	add    %eax,%edx
    1d72:	89 c8                	mov    %ecx,%eax
    1d74:	29 d0                	sub    %edx,%eax
    1d76:	85 c0                	test   %eax,%eax
    1d78:	75 23                	jne    1d9d <linkunlink+0xc0>
      close(open("x", O_RDWR | O_CREATE));
    1d7a:	83 ec 08             	sub    $0x8,%esp
    1d7d:	68 02 02 00 00       	push   $0x202
    1d82:	68 f3 48 00 00       	push   $0x48f3
    1d87:	e8 90 21 00 00       	call   3f1c <open>
    1d8c:	83 c4 10             	add    $0x10,%esp
    1d8f:	83 ec 0c             	sub    $0xc,%esp
    1d92:	50                   	push   %eax
    1d93:	e8 6c 21 00 00       	call   3f04 <close>
    1d98:	83 c4 10             	add    $0x10,%esp
    1d9b:	eb 44                	jmp    1de1 <linkunlink+0x104>
    } else if((x % 3) == 1){
    1d9d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1da0:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1da5:	89 c8                	mov    %ecx,%eax
    1da7:	f7 e2                	mul    %edx
    1da9:	d1 ea                	shr    %edx
    1dab:	89 d0                	mov    %edx,%eax
    1dad:	01 c0                	add    %eax,%eax
    1daf:	01 d0                	add    %edx,%eax
    1db1:	29 c1                	sub    %eax,%ecx
    1db3:	89 ca                	mov    %ecx,%edx
    1db5:	83 fa 01             	cmp    $0x1,%edx
    1db8:	75 17                	jne    1dd1 <linkunlink+0xf4>
      link("cat", "x");
    1dba:	83 ec 08             	sub    $0x8,%esp
    1dbd:	68 f3 48 00 00       	push   $0x48f3
    1dc2:	68 88 4d 00 00       	push   $0x4d88
    1dc7:	e8 70 21 00 00       	call   3f3c <link>
    1dcc:	83 c4 10             	add    $0x10,%esp
    1dcf:	eb 10                	jmp    1de1 <linkunlink+0x104>
    } else {
      unlink("x");
    1dd1:	83 ec 0c             	sub    $0xc,%esp
    1dd4:	68 f3 48 00 00       	push   $0x48f3
    1dd9:	e8 4e 21 00 00       	call   3f2c <unlink>
    1dde:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1de1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1de5:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    1de9:	0f 8e 5c ff ff ff    	jle    1d4b <linkunlink+0x6e>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1def:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1df3:	74 07                	je     1dfc <linkunlink+0x11f>
    wait();
    1df5:	e8 ea 20 00 00       	call   3ee4 <wait>
    1dfa:	eb 05                	jmp    1e01 <linkunlink+0x124>
  else 
    exit();
    1dfc:	e8 db 20 00 00       	call   3edc <exit>

  printf(1, "linkunlink ok\n");
    1e01:	83 ec 08             	sub    $0x8,%esp
    1e04:	68 8c 4d 00 00       	push   $0x4d8c
    1e09:	6a 01                	push   $0x1
    1e0b:	e8 53 22 00 00       	call   4063 <printf>
    1e10:	83 c4 10             	add    $0x10,%esp
}
    1e13:	90                   	nop
    1e14:	c9                   	leave  
    1e15:	c3                   	ret    

00001e16 <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    1e16:	55                   	push   %ebp
    1e17:	89 e5                	mov    %esp,%ebp
    1e19:	83 ec 28             	sub    $0x28,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1e1c:	83 ec 08             	sub    $0x8,%esp
    1e1f:	68 9b 4d 00 00       	push   $0x4d9b
    1e24:	6a 01                	push   $0x1
    1e26:	e8 38 22 00 00       	call   4063 <printf>
    1e2b:	83 c4 10             	add    $0x10,%esp
  unlink("bd");
    1e2e:	83 ec 0c             	sub    $0xc,%esp
    1e31:	68 a8 4d 00 00       	push   $0x4da8
    1e36:	e8 f1 20 00 00       	call   3f2c <unlink>
    1e3b:	83 c4 10             	add    $0x10,%esp

  fd = open("bd", O_CREATE);
    1e3e:	83 ec 08             	sub    $0x8,%esp
    1e41:	68 00 02 00 00       	push   $0x200
    1e46:	68 a8 4d 00 00       	push   $0x4da8
    1e4b:	e8 cc 20 00 00       	call   3f1c <open>
    1e50:	83 c4 10             	add    $0x10,%esp
    1e53:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1e56:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e5a:	79 17                	jns    1e73 <bigdir+0x5d>
    printf(1, "bigdir create failed\n");
    1e5c:	83 ec 08             	sub    $0x8,%esp
    1e5f:	68 ab 4d 00 00       	push   $0x4dab
    1e64:	6a 01                	push   $0x1
    1e66:	e8 f8 21 00 00       	call   4063 <printf>
    1e6b:	83 c4 10             	add    $0x10,%esp
    exit();
    1e6e:	e8 69 20 00 00       	call   3edc <exit>
  }
  close(fd);
    1e73:	83 ec 0c             	sub    $0xc,%esp
    1e76:	ff 75 f0             	pushl  -0x10(%ebp)
    1e79:	e8 86 20 00 00       	call   3f04 <close>
    1e7e:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 500; i++){
    1e81:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1e88:	eb 63                	jmp    1eed <bigdir+0xd7>
    name[0] = 'x';
    1e8a:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1e8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e91:	8d 50 3f             	lea    0x3f(%eax),%edx
    1e94:	85 c0                	test   %eax,%eax
    1e96:	0f 48 c2             	cmovs  %edx,%eax
    1e99:	c1 f8 06             	sar    $0x6,%eax
    1e9c:	83 c0 30             	add    $0x30,%eax
    1e9f:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ea5:	99                   	cltd   
    1ea6:	c1 ea 1a             	shr    $0x1a,%edx
    1ea9:	01 d0                	add    %edx,%eax
    1eab:	83 e0 3f             	and    $0x3f,%eax
    1eae:	29 d0                	sub    %edx,%eax
    1eb0:	83 c0 30             	add    $0x30,%eax
    1eb3:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1eb6:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1eba:	83 ec 08             	sub    $0x8,%esp
    1ebd:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1ec0:	50                   	push   %eax
    1ec1:	68 a8 4d 00 00       	push   $0x4da8
    1ec6:	e8 71 20 00 00       	call   3f3c <link>
    1ecb:	83 c4 10             	add    $0x10,%esp
    1ece:	85 c0                	test   %eax,%eax
    1ed0:	74 17                	je     1ee9 <bigdir+0xd3>
      printf(1, "bigdir link failed\n");
    1ed2:	83 ec 08             	sub    $0x8,%esp
    1ed5:	68 c1 4d 00 00       	push   $0x4dc1
    1eda:	6a 01                	push   $0x1
    1edc:	e8 82 21 00 00       	call   4063 <printf>
    1ee1:	83 c4 10             	add    $0x10,%esp
      exit();
    1ee4:	e8 f3 1f 00 00       	call   3edc <exit>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1ee9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1eed:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1ef4:	7e 94                	jle    1e8a <bigdir+0x74>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1ef6:	83 ec 0c             	sub    $0xc,%esp
    1ef9:	68 a8 4d 00 00       	push   $0x4da8
    1efe:	e8 29 20 00 00       	call   3f2c <unlink>
    1f03:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    1f06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f0d:	eb 5e                	jmp    1f6d <bigdir+0x157>
    name[0] = 'x';
    1f0f:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1f13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f16:	8d 50 3f             	lea    0x3f(%eax),%edx
    1f19:	85 c0                	test   %eax,%eax
    1f1b:	0f 48 c2             	cmovs  %edx,%eax
    1f1e:	c1 f8 06             	sar    $0x6,%eax
    1f21:	83 c0 30             	add    $0x30,%eax
    1f24:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1f27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f2a:	99                   	cltd   
    1f2b:	c1 ea 1a             	shr    $0x1a,%edx
    1f2e:	01 d0                	add    %edx,%eax
    1f30:	83 e0 3f             	and    $0x3f,%eax
    1f33:	29 d0                	sub    %edx,%eax
    1f35:	83 c0 30             	add    $0x30,%eax
    1f38:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1f3b:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1f3f:	83 ec 0c             	sub    $0xc,%esp
    1f42:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1f45:	50                   	push   %eax
    1f46:	e8 e1 1f 00 00       	call   3f2c <unlink>
    1f4b:	83 c4 10             	add    $0x10,%esp
    1f4e:	85 c0                	test   %eax,%eax
    1f50:	74 17                	je     1f69 <bigdir+0x153>
      printf(1, "bigdir unlink failed");
    1f52:	83 ec 08             	sub    $0x8,%esp
    1f55:	68 d5 4d 00 00       	push   $0x4dd5
    1f5a:	6a 01                	push   $0x1
    1f5c:	e8 02 21 00 00       	call   4063 <printf>
    1f61:	83 c4 10             	add    $0x10,%esp
      exit();
    1f64:	e8 73 1f 00 00       	call   3edc <exit>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1f69:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1f6d:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1f74:	7e 99                	jle    1f0f <bigdir+0xf9>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1f76:	83 ec 08             	sub    $0x8,%esp
    1f79:	68 ea 4d 00 00       	push   $0x4dea
    1f7e:	6a 01                	push   $0x1
    1f80:	e8 de 20 00 00       	call   4063 <printf>
    1f85:	83 c4 10             	add    $0x10,%esp
}
    1f88:	90                   	nop
    1f89:	c9                   	leave  
    1f8a:	c3                   	ret    

00001f8b <subdir>:

void
subdir(void)
{
    1f8b:	55                   	push   %ebp
    1f8c:	89 e5                	mov    %esp,%ebp
    1f8e:	83 ec 18             	sub    $0x18,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1f91:	83 ec 08             	sub    $0x8,%esp
    1f94:	68 f5 4d 00 00       	push   $0x4df5
    1f99:	6a 01                	push   $0x1
    1f9b:	e8 c3 20 00 00       	call   4063 <printf>
    1fa0:	83 c4 10             	add    $0x10,%esp

  unlink("ff");
    1fa3:	83 ec 0c             	sub    $0xc,%esp
    1fa6:	68 02 4e 00 00       	push   $0x4e02
    1fab:	e8 7c 1f 00 00       	call   3f2c <unlink>
    1fb0:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dd") != 0){
    1fb3:	83 ec 0c             	sub    $0xc,%esp
    1fb6:	68 05 4e 00 00       	push   $0x4e05
    1fbb:	e8 84 1f 00 00       	call   3f44 <mkdir>
    1fc0:	83 c4 10             	add    $0x10,%esp
    1fc3:	85 c0                	test   %eax,%eax
    1fc5:	74 17                	je     1fde <subdir+0x53>
    printf(1, "subdir mkdir dd failed\n");
    1fc7:	83 ec 08             	sub    $0x8,%esp
    1fca:	68 08 4e 00 00       	push   $0x4e08
    1fcf:	6a 01                	push   $0x1
    1fd1:	e8 8d 20 00 00       	call   4063 <printf>
    1fd6:	83 c4 10             	add    $0x10,%esp
    exit();
    1fd9:	e8 fe 1e 00 00       	call   3edc <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1fde:	83 ec 08             	sub    $0x8,%esp
    1fe1:	68 02 02 00 00       	push   $0x202
    1fe6:	68 20 4e 00 00       	push   $0x4e20
    1feb:	e8 2c 1f 00 00       	call   3f1c <open>
    1ff0:	83 c4 10             	add    $0x10,%esp
    1ff3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1ff6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ffa:	79 17                	jns    2013 <subdir+0x88>
    printf(1, "create dd/ff failed\n");
    1ffc:	83 ec 08             	sub    $0x8,%esp
    1fff:	68 26 4e 00 00       	push   $0x4e26
    2004:	6a 01                	push   $0x1
    2006:	e8 58 20 00 00       	call   4063 <printf>
    200b:	83 c4 10             	add    $0x10,%esp
    exit();
    200e:	e8 c9 1e 00 00       	call   3edc <exit>
  }
  write(fd, "ff", 2);
    2013:	83 ec 04             	sub    $0x4,%esp
    2016:	6a 02                	push   $0x2
    2018:	68 02 4e 00 00       	push   $0x4e02
    201d:	ff 75 f4             	pushl  -0xc(%ebp)
    2020:	e8 d7 1e 00 00       	call   3efc <write>
    2025:	83 c4 10             	add    $0x10,%esp
  close(fd);
    2028:	83 ec 0c             	sub    $0xc,%esp
    202b:	ff 75 f4             	pushl  -0xc(%ebp)
    202e:	e8 d1 1e 00 00       	call   3f04 <close>
    2033:	83 c4 10             	add    $0x10,%esp
  
  if(unlink("dd") >= 0){
    2036:	83 ec 0c             	sub    $0xc,%esp
    2039:	68 05 4e 00 00       	push   $0x4e05
    203e:	e8 e9 1e 00 00       	call   3f2c <unlink>
    2043:	83 c4 10             	add    $0x10,%esp
    2046:	85 c0                	test   %eax,%eax
    2048:	78 17                	js     2061 <subdir+0xd6>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    204a:	83 ec 08             	sub    $0x8,%esp
    204d:	68 3c 4e 00 00       	push   $0x4e3c
    2052:	6a 01                	push   $0x1
    2054:	e8 0a 20 00 00       	call   4063 <printf>
    2059:	83 c4 10             	add    $0x10,%esp
    exit();
    205c:	e8 7b 1e 00 00       	call   3edc <exit>
  }

  if(mkdir("/dd/dd") != 0){
    2061:	83 ec 0c             	sub    $0xc,%esp
    2064:	68 62 4e 00 00       	push   $0x4e62
    2069:	e8 d6 1e 00 00       	call   3f44 <mkdir>
    206e:	83 c4 10             	add    $0x10,%esp
    2071:	85 c0                	test   %eax,%eax
    2073:	74 17                	je     208c <subdir+0x101>
    printf(1, "subdir mkdir dd/dd failed\n");
    2075:	83 ec 08             	sub    $0x8,%esp
    2078:	68 69 4e 00 00       	push   $0x4e69
    207d:	6a 01                	push   $0x1
    207f:	e8 df 1f 00 00       	call   4063 <printf>
    2084:	83 c4 10             	add    $0x10,%esp
    exit();
    2087:	e8 50 1e 00 00       	call   3edc <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    208c:	83 ec 08             	sub    $0x8,%esp
    208f:	68 02 02 00 00       	push   $0x202
    2094:	68 84 4e 00 00       	push   $0x4e84
    2099:	e8 7e 1e 00 00       	call   3f1c <open>
    209e:	83 c4 10             	add    $0x10,%esp
    20a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    20a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    20a8:	79 17                	jns    20c1 <subdir+0x136>
    printf(1, "create dd/dd/ff failed\n");
    20aa:	83 ec 08             	sub    $0x8,%esp
    20ad:	68 8d 4e 00 00       	push   $0x4e8d
    20b2:	6a 01                	push   $0x1
    20b4:	e8 aa 1f 00 00       	call   4063 <printf>
    20b9:	83 c4 10             	add    $0x10,%esp
    exit();
    20bc:	e8 1b 1e 00 00       	call   3edc <exit>
  }
  write(fd, "FF", 2);
    20c1:	83 ec 04             	sub    $0x4,%esp
    20c4:	6a 02                	push   $0x2
    20c6:	68 a5 4e 00 00       	push   $0x4ea5
    20cb:	ff 75 f4             	pushl  -0xc(%ebp)
    20ce:	e8 29 1e 00 00       	call   3efc <write>
    20d3:	83 c4 10             	add    $0x10,%esp
  close(fd);
    20d6:	83 ec 0c             	sub    $0xc,%esp
    20d9:	ff 75 f4             	pushl  -0xc(%ebp)
    20dc:	e8 23 1e 00 00       	call   3f04 <close>
    20e1:	83 c4 10             	add    $0x10,%esp

  fd = open("dd/dd/../ff", 0);
    20e4:	83 ec 08             	sub    $0x8,%esp
    20e7:	6a 00                	push   $0x0
    20e9:	68 a8 4e 00 00       	push   $0x4ea8
    20ee:	e8 29 1e 00 00       	call   3f1c <open>
    20f3:	83 c4 10             	add    $0x10,%esp
    20f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    20f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    20fd:	79 17                	jns    2116 <subdir+0x18b>
    printf(1, "open dd/dd/../ff failed\n");
    20ff:	83 ec 08             	sub    $0x8,%esp
    2102:	68 b4 4e 00 00       	push   $0x4eb4
    2107:	6a 01                	push   $0x1
    2109:	e8 55 1f 00 00       	call   4063 <printf>
    210e:	83 c4 10             	add    $0x10,%esp
    exit();
    2111:	e8 c6 1d 00 00       	call   3edc <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    2116:	83 ec 04             	sub    $0x4,%esp
    2119:	68 00 20 00 00       	push   $0x2000
    211e:	68 c0 8a 00 00       	push   $0x8ac0
    2123:	ff 75 f4             	pushl  -0xc(%ebp)
    2126:	e8 c9 1d 00 00       	call   3ef4 <read>
    212b:	83 c4 10             	add    $0x10,%esp
    212e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    2131:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    2135:	75 0b                	jne    2142 <subdir+0x1b7>
    2137:	0f b6 05 c0 8a 00 00 	movzbl 0x8ac0,%eax
    213e:	3c 66                	cmp    $0x66,%al
    2140:	74 17                	je     2159 <subdir+0x1ce>
    printf(1, "dd/dd/../ff wrong content\n");
    2142:	83 ec 08             	sub    $0x8,%esp
    2145:	68 cd 4e 00 00       	push   $0x4ecd
    214a:	6a 01                	push   $0x1
    214c:	e8 12 1f 00 00       	call   4063 <printf>
    2151:	83 c4 10             	add    $0x10,%esp
    exit();
    2154:	e8 83 1d 00 00       	call   3edc <exit>
  }
  close(fd);
    2159:	83 ec 0c             	sub    $0xc,%esp
    215c:	ff 75 f4             	pushl  -0xc(%ebp)
    215f:	e8 a0 1d 00 00       	call   3f04 <close>
    2164:	83 c4 10             	add    $0x10,%esp

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2167:	83 ec 08             	sub    $0x8,%esp
    216a:	68 e8 4e 00 00       	push   $0x4ee8
    216f:	68 84 4e 00 00       	push   $0x4e84
    2174:	e8 c3 1d 00 00       	call   3f3c <link>
    2179:	83 c4 10             	add    $0x10,%esp
    217c:	85 c0                	test   %eax,%eax
    217e:	74 17                	je     2197 <subdir+0x20c>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2180:	83 ec 08             	sub    $0x8,%esp
    2183:	68 f4 4e 00 00       	push   $0x4ef4
    2188:	6a 01                	push   $0x1
    218a:	e8 d4 1e 00 00       	call   4063 <printf>
    218f:	83 c4 10             	add    $0x10,%esp
    exit();
    2192:	e8 45 1d 00 00       	call   3edc <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    2197:	83 ec 0c             	sub    $0xc,%esp
    219a:	68 84 4e 00 00       	push   $0x4e84
    219f:	e8 88 1d 00 00       	call   3f2c <unlink>
    21a4:	83 c4 10             	add    $0x10,%esp
    21a7:	85 c0                	test   %eax,%eax
    21a9:	74 17                	je     21c2 <subdir+0x237>
    printf(1, "unlink dd/dd/ff failed\n");
    21ab:	83 ec 08             	sub    $0x8,%esp
    21ae:	68 15 4f 00 00       	push   $0x4f15
    21b3:	6a 01                	push   $0x1
    21b5:	e8 a9 1e 00 00       	call   4063 <printf>
    21ba:	83 c4 10             	add    $0x10,%esp
    exit();
    21bd:	e8 1a 1d 00 00       	call   3edc <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    21c2:	83 ec 08             	sub    $0x8,%esp
    21c5:	6a 00                	push   $0x0
    21c7:	68 84 4e 00 00       	push   $0x4e84
    21cc:	e8 4b 1d 00 00       	call   3f1c <open>
    21d1:	83 c4 10             	add    $0x10,%esp
    21d4:	85 c0                	test   %eax,%eax
    21d6:	78 17                	js     21ef <subdir+0x264>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    21d8:	83 ec 08             	sub    $0x8,%esp
    21db:	68 30 4f 00 00       	push   $0x4f30
    21e0:	6a 01                	push   $0x1
    21e2:	e8 7c 1e 00 00       	call   4063 <printf>
    21e7:	83 c4 10             	add    $0x10,%esp
    exit();
    21ea:	e8 ed 1c 00 00       	call   3edc <exit>
  }

  if(chdir("dd") != 0){
    21ef:	83 ec 0c             	sub    $0xc,%esp
    21f2:	68 05 4e 00 00       	push   $0x4e05
    21f7:	e8 50 1d 00 00       	call   3f4c <chdir>
    21fc:	83 c4 10             	add    $0x10,%esp
    21ff:	85 c0                	test   %eax,%eax
    2201:	74 17                	je     221a <subdir+0x28f>
    printf(1, "chdir dd failed\n");
    2203:	83 ec 08             	sub    $0x8,%esp
    2206:	68 54 4f 00 00       	push   $0x4f54
    220b:	6a 01                	push   $0x1
    220d:	e8 51 1e 00 00       	call   4063 <printf>
    2212:	83 c4 10             	add    $0x10,%esp
    exit();
    2215:	e8 c2 1c 00 00       	call   3edc <exit>
  }
  if(chdir("dd/../../dd") != 0){
    221a:	83 ec 0c             	sub    $0xc,%esp
    221d:	68 65 4f 00 00       	push   $0x4f65
    2222:	e8 25 1d 00 00       	call   3f4c <chdir>
    2227:	83 c4 10             	add    $0x10,%esp
    222a:	85 c0                	test   %eax,%eax
    222c:	74 17                	je     2245 <subdir+0x2ba>
    printf(1, "chdir dd/../../dd failed\n");
    222e:	83 ec 08             	sub    $0x8,%esp
    2231:	68 71 4f 00 00       	push   $0x4f71
    2236:	6a 01                	push   $0x1
    2238:	e8 26 1e 00 00       	call   4063 <printf>
    223d:	83 c4 10             	add    $0x10,%esp
    exit();
    2240:	e8 97 1c 00 00       	call   3edc <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    2245:	83 ec 0c             	sub    $0xc,%esp
    2248:	68 8b 4f 00 00       	push   $0x4f8b
    224d:	e8 fa 1c 00 00       	call   3f4c <chdir>
    2252:	83 c4 10             	add    $0x10,%esp
    2255:	85 c0                	test   %eax,%eax
    2257:	74 17                	je     2270 <subdir+0x2e5>
    printf(1, "chdir dd/../../dd failed\n");
    2259:	83 ec 08             	sub    $0x8,%esp
    225c:	68 71 4f 00 00       	push   $0x4f71
    2261:	6a 01                	push   $0x1
    2263:	e8 fb 1d 00 00       	call   4063 <printf>
    2268:	83 c4 10             	add    $0x10,%esp
    exit();
    226b:	e8 6c 1c 00 00       	call   3edc <exit>
  }
  if(chdir("./..") != 0){
    2270:	83 ec 0c             	sub    $0xc,%esp
    2273:	68 9a 4f 00 00       	push   $0x4f9a
    2278:	e8 cf 1c 00 00       	call   3f4c <chdir>
    227d:	83 c4 10             	add    $0x10,%esp
    2280:	85 c0                	test   %eax,%eax
    2282:	74 17                	je     229b <subdir+0x310>
    printf(1, "chdir ./.. failed\n");
    2284:	83 ec 08             	sub    $0x8,%esp
    2287:	68 9f 4f 00 00       	push   $0x4f9f
    228c:	6a 01                	push   $0x1
    228e:	e8 d0 1d 00 00       	call   4063 <printf>
    2293:	83 c4 10             	add    $0x10,%esp
    exit();
    2296:	e8 41 1c 00 00       	call   3edc <exit>
  }

  fd = open("dd/dd/ffff", 0);
    229b:	83 ec 08             	sub    $0x8,%esp
    229e:	6a 00                	push   $0x0
    22a0:	68 e8 4e 00 00       	push   $0x4ee8
    22a5:	e8 72 1c 00 00       	call   3f1c <open>
    22aa:	83 c4 10             	add    $0x10,%esp
    22ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    22b0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    22b4:	79 17                	jns    22cd <subdir+0x342>
    printf(1, "open dd/dd/ffff failed\n");
    22b6:	83 ec 08             	sub    $0x8,%esp
    22b9:	68 b2 4f 00 00       	push   $0x4fb2
    22be:	6a 01                	push   $0x1
    22c0:	e8 9e 1d 00 00       	call   4063 <printf>
    22c5:	83 c4 10             	add    $0x10,%esp
    exit();
    22c8:	e8 0f 1c 00 00       	call   3edc <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    22cd:	83 ec 04             	sub    $0x4,%esp
    22d0:	68 00 20 00 00       	push   $0x2000
    22d5:	68 c0 8a 00 00       	push   $0x8ac0
    22da:	ff 75 f4             	pushl  -0xc(%ebp)
    22dd:	e8 12 1c 00 00       	call   3ef4 <read>
    22e2:	83 c4 10             	add    $0x10,%esp
    22e5:	83 f8 02             	cmp    $0x2,%eax
    22e8:	74 17                	je     2301 <subdir+0x376>
    printf(1, "read dd/dd/ffff wrong len\n");
    22ea:	83 ec 08             	sub    $0x8,%esp
    22ed:	68 ca 4f 00 00       	push   $0x4fca
    22f2:	6a 01                	push   $0x1
    22f4:	e8 6a 1d 00 00       	call   4063 <printf>
    22f9:	83 c4 10             	add    $0x10,%esp
    exit();
    22fc:	e8 db 1b 00 00       	call   3edc <exit>
  }
  close(fd);
    2301:	83 ec 0c             	sub    $0xc,%esp
    2304:	ff 75 f4             	pushl  -0xc(%ebp)
    2307:	e8 f8 1b 00 00       	call   3f04 <close>
    230c:	83 c4 10             	add    $0x10,%esp

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    230f:	83 ec 08             	sub    $0x8,%esp
    2312:	6a 00                	push   $0x0
    2314:	68 84 4e 00 00       	push   $0x4e84
    2319:	e8 fe 1b 00 00       	call   3f1c <open>
    231e:	83 c4 10             	add    $0x10,%esp
    2321:	85 c0                	test   %eax,%eax
    2323:	78 17                	js     233c <subdir+0x3b1>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2325:	83 ec 08             	sub    $0x8,%esp
    2328:	68 e8 4f 00 00       	push   $0x4fe8
    232d:	6a 01                	push   $0x1
    232f:	e8 2f 1d 00 00       	call   4063 <printf>
    2334:	83 c4 10             	add    $0x10,%esp
    exit();
    2337:	e8 a0 1b 00 00       	call   3edc <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    233c:	83 ec 08             	sub    $0x8,%esp
    233f:	68 02 02 00 00       	push   $0x202
    2344:	68 0d 50 00 00       	push   $0x500d
    2349:	e8 ce 1b 00 00       	call   3f1c <open>
    234e:	83 c4 10             	add    $0x10,%esp
    2351:	85 c0                	test   %eax,%eax
    2353:	78 17                	js     236c <subdir+0x3e1>
    printf(1, "create dd/ff/ff succeeded!\n");
    2355:	83 ec 08             	sub    $0x8,%esp
    2358:	68 16 50 00 00       	push   $0x5016
    235d:	6a 01                	push   $0x1
    235f:	e8 ff 1c 00 00       	call   4063 <printf>
    2364:	83 c4 10             	add    $0x10,%esp
    exit();
    2367:	e8 70 1b 00 00       	call   3edc <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    236c:	83 ec 08             	sub    $0x8,%esp
    236f:	68 02 02 00 00       	push   $0x202
    2374:	68 32 50 00 00       	push   $0x5032
    2379:	e8 9e 1b 00 00       	call   3f1c <open>
    237e:	83 c4 10             	add    $0x10,%esp
    2381:	85 c0                	test   %eax,%eax
    2383:	78 17                	js     239c <subdir+0x411>
    printf(1, "create dd/xx/ff succeeded!\n");
    2385:	83 ec 08             	sub    $0x8,%esp
    2388:	68 3b 50 00 00       	push   $0x503b
    238d:	6a 01                	push   $0x1
    238f:	e8 cf 1c 00 00       	call   4063 <printf>
    2394:	83 c4 10             	add    $0x10,%esp
    exit();
    2397:	e8 40 1b 00 00       	call   3edc <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    239c:	83 ec 08             	sub    $0x8,%esp
    239f:	68 00 02 00 00       	push   $0x200
    23a4:	68 05 4e 00 00       	push   $0x4e05
    23a9:	e8 6e 1b 00 00       	call   3f1c <open>
    23ae:	83 c4 10             	add    $0x10,%esp
    23b1:	85 c0                	test   %eax,%eax
    23b3:	78 17                	js     23cc <subdir+0x441>
    printf(1, "create dd succeeded!\n");
    23b5:	83 ec 08             	sub    $0x8,%esp
    23b8:	68 57 50 00 00       	push   $0x5057
    23bd:	6a 01                	push   $0x1
    23bf:	e8 9f 1c 00 00       	call   4063 <printf>
    23c4:	83 c4 10             	add    $0x10,%esp
    exit();
    23c7:	e8 10 1b 00 00       	call   3edc <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    23cc:	83 ec 08             	sub    $0x8,%esp
    23cf:	6a 02                	push   $0x2
    23d1:	68 05 4e 00 00       	push   $0x4e05
    23d6:	e8 41 1b 00 00       	call   3f1c <open>
    23db:	83 c4 10             	add    $0x10,%esp
    23de:	85 c0                	test   %eax,%eax
    23e0:	78 17                	js     23f9 <subdir+0x46e>
    printf(1, "open dd rdwr succeeded!\n");
    23e2:	83 ec 08             	sub    $0x8,%esp
    23e5:	68 6d 50 00 00       	push   $0x506d
    23ea:	6a 01                	push   $0x1
    23ec:	e8 72 1c 00 00       	call   4063 <printf>
    23f1:	83 c4 10             	add    $0x10,%esp
    exit();
    23f4:	e8 e3 1a 00 00       	call   3edc <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    23f9:	83 ec 08             	sub    $0x8,%esp
    23fc:	6a 01                	push   $0x1
    23fe:	68 05 4e 00 00       	push   $0x4e05
    2403:	e8 14 1b 00 00       	call   3f1c <open>
    2408:	83 c4 10             	add    $0x10,%esp
    240b:	85 c0                	test   %eax,%eax
    240d:	78 17                	js     2426 <subdir+0x49b>
    printf(1, "open dd wronly succeeded!\n");
    240f:	83 ec 08             	sub    $0x8,%esp
    2412:	68 86 50 00 00       	push   $0x5086
    2417:	6a 01                	push   $0x1
    2419:	e8 45 1c 00 00       	call   4063 <printf>
    241e:	83 c4 10             	add    $0x10,%esp
    exit();
    2421:	e8 b6 1a 00 00       	call   3edc <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2426:	83 ec 08             	sub    $0x8,%esp
    2429:	68 a1 50 00 00       	push   $0x50a1
    242e:	68 0d 50 00 00       	push   $0x500d
    2433:	e8 04 1b 00 00       	call   3f3c <link>
    2438:	83 c4 10             	add    $0x10,%esp
    243b:	85 c0                	test   %eax,%eax
    243d:	75 17                	jne    2456 <subdir+0x4cb>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    243f:	83 ec 08             	sub    $0x8,%esp
    2442:	68 ac 50 00 00       	push   $0x50ac
    2447:	6a 01                	push   $0x1
    2449:	e8 15 1c 00 00       	call   4063 <printf>
    244e:	83 c4 10             	add    $0x10,%esp
    exit();
    2451:	e8 86 1a 00 00       	call   3edc <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2456:	83 ec 08             	sub    $0x8,%esp
    2459:	68 a1 50 00 00       	push   $0x50a1
    245e:	68 32 50 00 00       	push   $0x5032
    2463:	e8 d4 1a 00 00       	call   3f3c <link>
    2468:	83 c4 10             	add    $0x10,%esp
    246b:	85 c0                	test   %eax,%eax
    246d:	75 17                	jne    2486 <subdir+0x4fb>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    246f:	83 ec 08             	sub    $0x8,%esp
    2472:	68 d0 50 00 00       	push   $0x50d0
    2477:	6a 01                	push   $0x1
    2479:	e8 e5 1b 00 00       	call   4063 <printf>
    247e:	83 c4 10             	add    $0x10,%esp
    exit();
    2481:	e8 56 1a 00 00       	call   3edc <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2486:	83 ec 08             	sub    $0x8,%esp
    2489:	68 e8 4e 00 00       	push   $0x4ee8
    248e:	68 20 4e 00 00       	push   $0x4e20
    2493:	e8 a4 1a 00 00       	call   3f3c <link>
    2498:	83 c4 10             	add    $0x10,%esp
    249b:	85 c0                	test   %eax,%eax
    249d:	75 17                	jne    24b6 <subdir+0x52b>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    249f:	83 ec 08             	sub    $0x8,%esp
    24a2:	68 f4 50 00 00       	push   $0x50f4
    24a7:	6a 01                	push   $0x1
    24a9:	e8 b5 1b 00 00       	call   4063 <printf>
    24ae:	83 c4 10             	add    $0x10,%esp
    exit();
    24b1:	e8 26 1a 00 00       	call   3edc <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    24b6:	83 ec 0c             	sub    $0xc,%esp
    24b9:	68 0d 50 00 00       	push   $0x500d
    24be:	e8 81 1a 00 00       	call   3f44 <mkdir>
    24c3:	83 c4 10             	add    $0x10,%esp
    24c6:	85 c0                	test   %eax,%eax
    24c8:	75 17                	jne    24e1 <subdir+0x556>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    24ca:	83 ec 08             	sub    $0x8,%esp
    24cd:	68 16 51 00 00       	push   $0x5116
    24d2:	6a 01                	push   $0x1
    24d4:	e8 8a 1b 00 00       	call   4063 <printf>
    24d9:	83 c4 10             	add    $0x10,%esp
    exit();
    24dc:	e8 fb 19 00 00       	call   3edc <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    24e1:	83 ec 0c             	sub    $0xc,%esp
    24e4:	68 32 50 00 00       	push   $0x5032
    24e9:	e8 56 1a 00 00       	call   3f44 <mkdir>
    24ee:	83 c4 10             	add    $0x10,%esp
    24f1:	85 c0                	test   %eax,%eax
    24f3:	75 17                	jne    250c <subdir+0x581>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    24f5:	83 ec 08             	sub    $0x8,%esp
    24f8:	68 31 51 00 00       	push   $0x5131
    24fd:	6a 01                	push   $0x1
    24ff:	e8 5f 1b 00 00       	call   4063 <printf>
    2504:	83 c4 10             	add    $0x10,%esp
    exit();
    2507:	e8 d0 19 00 00       	call   3edc <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    250c:	83 ec 0c             	sub    $0xc,%esp
    250f:	68 e8 4e 00 00       	push   $0x4ee8
    2514:	e8 2b 1a 00 00       	call   3f44 <mkdir>
    2519:	83 c4 10             	add    $0x10,%esp
    251c:	85 c0                	test   %eax,%eax
    251e:	75 17                	jne    2537 <subdir+0x5ac>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2520:	83 ec 08             	sub    $0x8,%esp
    2523:	68 4c 51 00 00       	push   $0x514c
    2528:	6a 01                	push   $0x1
    252a:	e8 34 1b 00 00       	call   4063 <printf>
    252f:	83 c4 10             	add    $0x10,%esp
    exit();
    2532:	e8 a5 19 00 00       	call   3edc <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    2537:	83 ec 0c             	sub    $0xc,%esp
    253a:	68 32 50 00 00       	push   $0x5032
    253f:	e8 e8 19 00 00       	call   3f2c <unlink>
    2544:	83 c4 10             	add    $0x10,%esp
    2547:	85 c0                	test   %eax,%eax
    2549:	75 17                	jne    2562 <subdir+0x5d7>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    254b:	83 ec 08             	sub    $0x8,%esp
    254e:	68 69 51 00 00       	push   $0x5169
    2553:	6a 01                	push   $0x1
    2555:	e8 09 1b 00 00       	call   4063 <printf>
    255a:	83 c4 10             	add    $0x10,%esp
    exit();
    255d:	e8 7a 19 00 00       	call   3edc <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    2562:	83 ec 0c             	sub    $0xc,%esp
    2565:	68 0d 50 00 00       	push   $0x500d
    256a:	e8 bd 19 00 00       	call   3f2c <unlink>
    256f:	83 c4 10             	add    $0x10,%esp
    2572:	85 c0                	test   %eax,%eax
    2574:	75 17                	jne    258d <subdir+0x602>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    2576:	83 ec 08             	sub    $0x8,%esp
    2579:	68 85 51 00 00       	push   $0x5185
    257e:	6a 01                	push   $0x1
    2580:	e8 de 1a 00 00       	call   4063 <printf>
    2585:	83 c4 10             	add    $0x10,%esp
    exit();
    2588:	e8 4f 19 00 00       	call   3edc <exit>
  }
  if(chdir("dd/ff") == 0){
    258d:	83 ec 0c             	sub    $0xc,%esp
    2590:	68 20 4e 00 00       	push   $0x4e20
    2595:	e8 b2 19 00 00       	call   3f4c <chdir>
    259a:	83 c4 10             	add    $0x10,%esp
    259d:	85 c0                	test   %eax,%eax
    259f:	75 17                	jne    25b8 <subdir+0x62d>
    printf(1, "chdir dd/ff succeeded!\n");
    25a1:	83 ec 08             	sub    $0x8,%esp
    25a4:	68 a1 51 00 00       	push   $0x51a1
    25a9:	6a 01                	push   $0x1
    25ab:	e8 b3 1a 00 00       	call   4063 <printf>
    25b0:	83 c4 10             	add    $0x10,%esp
    exit();
    25b3:	e8 24 19 00 00       	call   3edc <exit>
  }
  if(chdir("dd/xx") == 0){
    25b8:	83 ec 0c             	sub    $0xc,%esp
    25bb:	68 b9 51 00 00       	push   $0x51b9
    25c0:	e8 87 19 00 00       	call   3f4c <chdir>
    25c5:	83 c4 10             	add    $0x10,%esp
    25c8:	85 c0                	test   %eax,%eax
    25ca:	75 17                	jne    25e3 <subdir+0x658>
    printf(1, "chdir dd/xx succeeded!\n");
    25cc:	83 ec 08             	sub    $0x8,%esp
    25cf:	68 bf 51 00 00       	push   $0x51bf
    25d4:	6a 01                	push   $0x1
    25d6:	e8 88 1a 00 00       	call   4063 <printf>
    25db:	83 c4 10             	add    $0x10,%esp
    exit();
    25de:	e8 f9 18 00 00       	call   3edc <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    25e3:	83 ec 0c             	sub    $0xc,%esp
    25e6:	68 e8 4e 00 00       	push   $0x4ee8
    25eb:	e8 3c 19 00 00       	call   3f2c <unlink>
    25f0:	83 c4 10             	add    $0x10,%esp
    25f3:	85 c0                	test   %eax,%eax
    25f5:	74 17                	je     260e <subdir+0x683>
    printf(1, "unlink dd/dd/ff failed\n");
    25f7:	83 ec 08             	sub    $0x8,%esp
    25fa:	68 15 4f 00 00       	push   $0x4f15
    25ff:	6a 01                	push   $0x1
    2601:	e8 5d 1a 00 00       	call   4063 <printf>
    2606:	83 c4 10             	add    $0x10,%esp
    exit();
    2609:	e8 ce 18 00 00       	call   3edc <exit>
  }
  if(unlink("dd/ff") != 0){
    260e:	83 ec 0c             	sub    $0xc,%esp
    2611:	68 20 4e 00 00       	push   $0x4e20
    2616:	e8 11 19 00 00       	call   3f2c <unlink>
    261b:	83 c4 10             	add    $0x10,%esp
    261e:	85 c0                	test   %eax,%eax
    2620:	74 17                	je     2639 <subdir+0x6ae>
    printf(1, "unlink dd/ff failed\n");
    2622:	83 ec 08             	sub    $0x8,%esp
    2625:	68 d7 51 00 00       	push   $0x51d7
    262a:	6a 01                	push   $0x1
    262c:	e8 32 1a 00 00       	call   4063 <printf>
    2631:	83 c4 10             	add    $0x10,%esp
    exit();
    2634:	e8 a3 18 00 00       	call   3edc <exit>
  }
  if(unlink("dd") == 0){
    2639:	83 ec 0c             	sub    $0xc,%esp
    263c:	68 05 4e 00 00       	push   $0x4e05
    2641:	e8 e6 18 00 00       	call   3f2c <unlink>
    2646:	83 c4 10             	add    $0x10,%esp
    2649:	85 c0                	test   %eax,%eax
    264b:	75 17                	jne    2664 <subdir+0x6d9>
    printf(1, "unlink non-empty dd succeeded!\n");
    264d:	83 ec 08             	sub    $0x8,%esp
    2650:	68 ec 51 00 00       	push   $0x51ec
    2655:	6a 01                	push   $0x1
    2657:	e8 07 1a 00 00       	call   4063 <printf>
    265c:	83 c4 10             	add    $0x10,%esp
    exit();
    265f:	e8 78 18 00 00       	call   3edc <exit>
  }
  if(unlink("dd/dd") < 0){
    2664:	83 ec 0c             	sub    $0xc,%esp
    2667:	68 0c 52 00 00       	push   $0x520c
    266c:	e8 bb 18 00 00       	call   3f2c <unlink>
    2671:	83 c4 10             	add    $0x10,%esp
    2674:	85 c0                	test   %eax,%eax
    2676:	79 17                	jns    268f <subdir+0x704>
    printf(1, "unlink dd/dd failed\n");
    2678:	83 ec 08             	sub    $0x8,%esp
    267b:	68 12 52 00 00       	push   $0x5212
    2680:	6a 01                	push   $0x1
    2682:	e8 dc 19 00 00       	call   4063 <printf>
    2687:	83 c4 10             	add    $0x10,%esp
    exit();
    268a:	e8 4d 18 00 00       	call   3edc <exit>
  }
  if(unlink("dd") < 0){
    268f:	83 ec 0c             	sub    $0xc,%esp
    2692:	68 05 4e 00 00       	push   $0x4e05
    2697:	e8 90 18 00 00       	call   3f2c <unlink>
    269c:	83 c4 10             	add    $0x10,%esp
    269f:	85 c0                	test   %eax,%eax
    26a1:	79 17                	jns    26ba <subdir+0x72f>
    printf(1, "unlink dd failed\n");
    26a3:	83 ec 08             	sub    $0x8,%esp
    26a6:	68 27 52 00 00       	push   $0x5227
    26ab:	6a 01                	push   $0x1
    26ad:	e8 b1 19 00 00       	call   4063 <printf>
    26b2:	83 c4 10             	add    $0x10,%esp
    exit();
    26b5:	e8 22 18 00 00       	call   3edc <exit>
  }

  printf(1, "subdir ok\n");
    26ba:	83 ec 08             	sub    $0x8,%esp
    26bd:	68 39 52 00 00       	push   $0x5239
    26c2:	6a 01                	push   $0x1
    26c4:	e8 9a 19 00 00       	call   4063 <printf>
    26c9:	83 c4 10             	add    $0x10,%esp
}
    26cc:	90                   	nop
    26cd:	c9                   	leave  
    26ce:	c3                   	ret    

000026cf <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    26cf:	55                   	push   %ebp
    26d0:	89 e5                	mov    %esp,%ebp
    26d2:	83 ec 18             	sub    $0x18,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    26d5:	83 ec 08             	sub    $0x8,%esp
    26d8:	68 44 52 00 00       	push   $0x5244
    26dd:	6a 01                	push   $0x1
    26df:	e8 7f 19 00 00       	call   4063 <printf>
    26e4:	83 c4 10             	add    $0x10,%esp

  unlink("bigwrite");
    26e7:	83 ec 0c             	sub    $0xc,%esp
    26ea:	68 53 52 00 00       	push   $0x5253
    26ef:	e8 38 18 00 00       	call   3f2c <unlink>
    26f4:	83 c4 10             	add    $0x10,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    26f7:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%ebp)
    26fe:	e9 a8 00 00 00       	jmp    27ab <bigwrite+0xdc>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2703:	83 ec 08             	sub    $0x8,%esp
    2706:	68 02 02 00 00       	push   $0x202
    270b:	68 53 52 00 00       	push   $0x5253
    2710:	e8 07 18 00 00       	call   3f1c <open>
    2715:	83 c4 10             	add    $0x10,%esp
    2718:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    271b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    271f:	79 17                	jns    2738 <bigwrite+0x69>
      printf(1, "cannot create bigwrite\n");
    2721:	83 ec 08             	sub    $0x8,%esp
    2724:	68 5c 52 00 00       	push   $0x525c
    2729:	6a 01                	push   $0x1
    272b:	e8 33 19 00 00       	call   4063 <printf>
    2730:	83 c4 10             	add    $0x10,%esp
      exit();
    2733:	e8 a4 17 00 00       	call   3edc <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    2738:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    273f:	eb 3f                	jmp    2780 <bigwrite+0xb1>
      int cc = write(fd, buf, sz);
    2741:	83 ec 04             	sub    $0x4,%esp
    2744:	ff 75 f4             	pushl  -0xc(%ebp)
    2747:	68 c0 8a 00 00       	push   $0x8ac0
    274c:	ff 75 ec             	pushl  -0x14(%ebp)
    274f:	e8 a8 17 00 00       	call   3efc <write>
    2754:	83 c4 10             	add    $0x10,%esp
    2757:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc != sz){
    275a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    275d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2760:	74 1a                	je     277c <bigwrite+0xad>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2762:	ff 75 e8             	pushl  -0x18(%ebp)
    2765:	ff 75 f4             	pushl  -0xc(%ebp)
    2768:	68 74 52 00 00       	push   $0x5274
    276d:	6a 01                	push   $0x1
    276f:	e8 ef 18 00 00       	call   4063 <printf>
    2774:	83 c4 10             	add    $0x10,%esp
        exit();
    2777:	e8 60 17 00 00       	call   3edc <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
    277c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2780:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    2784:	7e bb                	jle    2741 <bigwrite+0x72>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2786:	83 ec 0c             	sub    $0xc,%esp
    2789:	ff 75 ec             	pushl  -0x14(%ebp)
    278c:	e8 73 17 00 00       	call   3f04 <close>
    2791:	83 c4 10             	add    $0x10,%esp
    unlink("bigwrite");
    2794:	83 ec 0c             	sub    $0xc,%esp
    2797:	68 53 52 00 00       	push   $0x5253
    279c:	e8 8b 17 00 00       	call   3f2c <unlink>
    27a1:	83 c4 10             	add    $0x10,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    27a4:	81 45 f4 d7 01 00 00 	addl   $0x1d7,-0xc(%ebp)
    27ab:	81 7d f4 ff 17 00 00 	cmpl   $0x17ff,-0xc(%ebp)
    27b2:	0f 8e 4b ff ff ff    	jle    2703 <bigwrite+0x34>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    27b8:	83 ec 08             	sub    $0x8,%esp
    27bb:	68 86 52 00 00       	push   $0x5286
    27c0:	6a 01                	push   $0x1
    27c2:	e8 9c 18 00 00       	call   4063 <printf>
    27c7:	83 c4 10             	add    $0x10,%esp
}
    27ca:	90                   	nop
    27cb:	c9                   	leave  
    27cc:	c3                   	ret    

000027cd <bigfile>:

void
bigfile(void)
{
    27cd:	55                   	push   %ebp
    27ce:	89 e5                	mov    %esp,%ebp
    27d0:	83 ec 18             	sub    $0x18,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    27d3:	83 ec 08             	sub    $0x8,%esp
    27d6:	68 93 52 00 00       	push   $0x5293
    27db:	6a 01                	push   $0x1
    27dd:	e8 81 18 00 00       	call   4063 <printf>
    27e2:	83 c4 10             	add    $0x10,%esp

  unlink("bigfile");
    27e5:	83 ec 0c             	sub    $0xc,%esp
    27e8:	68 a1 52 00 00       	push   $0x52a1
    27ed:	e8 3a 17 00 00       	call   3f2c <unlink>
    27f2:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", O_CREATE | O_RDWR);
    27f5:	83 ec 08             	sub    $0x8,%esp
    27f8:	68 02 02 00 00       	push   $0x202
    27fd:	68 a1 52 00 00       	push   $0x52a1
    2802:	e8 15 17 00 00       	call   3f1c <open>
    2807:	83 c4 10             	add    $0x10,%esp
    280a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    280d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2811:	79 17                	jns    282a <bigfile+0x5d>
    printf(1, "cannot create bigfile");
    2813:	83 ec 08             	sub    $0x8,%esp
    2816:	68 a9 52 00 00       	push   $0x52a9
    281b:	6a 01                	push   $0x1
    281d:	e8 41 18 00 00       	call   4063 <printf>
    2822:	83 c4 10             	add    $0x10,%esp
    exit();
    2825:	e8 b2 16 00 00       	call   3edc <exit>
  }
  for(i = 0; i < 20; i++){
    282a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2831:	eb 52                	jmp    2885 <bigfile+0xb8>
    memset(buf, i, 600);
    2833:	83 ec 04             	sub    $0x4,%esp
    2836:	68 58 02 00 00       	push   $0x258
    283b:	ff 75 f4             	pushl  -0xc(%ebp)
    283e:	68 c0 8a 00 00       	push   $0x8ac0
    2843:	e8 f9 14 00 00       	call   3d41 <memset>
    2848:	83 c4 10             	add    $0x10,%esp
    if(write(fd, buf, 600) != 600){
    284b:	83 ec 04             	sub    $0x4,%esp
    284e:	68 58 02 00 00       	push   $0x258
    2853:	68 c0 8a 00 00       	push   $0x8ac0
    2858:	ff 75 ec             	pushl  -0x14(%ebp)
    285b:	e8 9c 16 00 00       	call   3efc <write>
    2860:	83 c4 10             	add    $0x10,%esp
    2863:	3d 58 02 00 00       	cmp    $0x258,%eax
    2868:	74 17                	je     2881 <bigfile+0xb4>
      printf(1, "write bigfile failed\n");
    286a:	83 ec 08             	sub    $0x8,%esp
    286d:	68 bf 52 00 00       	push   $0x52bf
    2872:	6a 01                	push   $0x1
    2874:	e8 ea 17 00 00       	call   4063 <printf>
    2879:	83 c4 10             	add    $0x10,%esp
      exit();
    287c:	e8 5b 16 00 00       	call   3edc <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    2881:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2885:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    2889:	7e a8                	jle    2833 <bigfile+0x66>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    288b:	83 ec 0c             	sub    $0xc,%esp
    288e:	ff 75 ec             	pushl  -0x14(%ebp)
    2891:	e8 6e 16 00 00       	call   3f04 <close>
    2896:	83 c4 10             	add    $0x10,%esp

  fd = open("bigfile", 0);
    2899:	83 ec 08             	sub    $0x8,%esp
    289c:	6a 00                	push   $0x0
    289e:	68 a1 52 00 00       	push   $0x52a1
    28a3:	e8 74 16 00 00       	call   3f1c <open>
    28a8:	83 c4 10             	add    $0x10,%esp
    28ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    28ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    28b2:	79 17                	jns    28cb <bigfile+0xfe>
    printf(1, "cannot open bigfile\n");
    28b4:	83 ec 08             	sub    $0x8,%esp
    28b7:	68 d5 52 00 00       	push   $0x52d5
    28bc:	6a 01                	push   $0x1
    28be:	e8 a0 17 00 00       	call   4063 <printf>
    28c3:	83 c4 10             	add    $0x10,%esp
    exit();
    28c6:	e8 11 16 00 00       	call   3edc <exit>
  }
  total = 0;
    28cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    28d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = read(fd, buf, 300);
    28d9:	83 ec 04             	sub    $0x4,%esp
    28dc:	68 2c 01 00 00       	push   $0x12c
    28e1:	68 c0 8a 00 00       	push   $0x8ac0
    28e6:	ff 75 ec             	pushl  -0x14(%ebp)
    28e9:	e8 06 16 00 00       	call   3ef4 <read>
    28ee:	83 c4 10             	add    $0x10,%esp
    28f1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(cc < 0){
    28f4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    28f8:	79 17                	jns    2911 <bigfile+0x144>
      printf(1, "read bigfile failed\n");
    28fa:	83 ec 08             	sub    $0x8,%esp
    28fd:	68 ea 52 00 00       	push   $0x52ea
    2902:	6a 01                	push   $0x1
    2904:	e8 5a 17 00 00       	call   4063 <printf>
    2909:	83 c4 10             	add    $0x10,%esp
      exit();
    290c:	e8 cb 15 00 00       	call   3edc <exit>
    }
    if(cc == 0)
    2911:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2915:	74 7a                	je     2991 <bigfile+0x1c4>
      break;
    if(cc != 300){
    2917:	81 7d e8 2c 01 00 00 	cmpl   $0x12c,-0x18(%ebp)
    291e:	74 17                	je     2937 <bigfile+0x16a>
      printf(1, "short read bigfile\n");
    2920:	83 ec 08             	sub    $0x8,%esp
    2923:	68 ff 52 00 00       	push   $0x52ff
    2928:	6a 01                	push   $0x1
    292a:	e8 34 17 00 00       	call   4063 <printf>
    292f:	83 c4 10             	add    $0x10,%esp
      exit();
    2932:	e8 a5 15 00 00       	call   3edc <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    2937:	0f b6 05 c0 8a 00 00 	movzbl 0x8ac0,%eax
    293e:	0f be d0             	movsbl %al,%edx
    2941:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2944:	89 c1                	mov    %eax,%ecx
    2946:	c1 e9 1f             	shr    $0x1f,%ecx
    2949:	01 c8                	add    %ecx,%eax
    294b:	d1 f8                	sar    %eax
    294d:	39 c2                	cmp    %eax,%edx
    294f:	75 1a                	jne    296b <bigfile+0x19e>
    2951:	0f b6 05 eb 8b 00 00 	movzbl 0x8beb,%eax
    2958:	0f be d0             	movsbl %al,%edx
    295b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    295e:	89 c1                	mov    %eax,%ecx
    2960:	c1 e9 1f             	shr    $0x1f,%ecx
    2963:	01 c8                	add    %ecx,%eax
    2965:	d1 f8                	sar    %eax
    2967:	39 c2                	cmp    %eax,%edx
    2969:	74 17                	je     2982 <bigfile+0x1b5>
      printf(1, "read bigfile wrong data\n");
    296b:	83 ec 08             	sub    $0x8,%esp
    296e:	68 13 53 00 00       	push   $0x5313
    2973:	6a 01                	push   $0x1
    2975:	e8 e9 16 00 00       	call   4063 <printf>
    297a:	83 c4 10             	add    $0x10,%esp
      exit();
    297d:	e8 5a 15 00 00       	call   3edc <exit>
    }
    total += cc;
    2982:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2985:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    2988:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
    298c:	e9 48 ff ff ff       	jmp    28d9 <bigfile+0x10c>
    if(cc < 0){
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    2991:	90                   	nop
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    2992:	83 ec 0c             	sub    $0xc,%esp
    2995:	ff 75 ec             	pushl  -0x14(%ebp)
    2998:	e8 67 15 00 00       	call   3f04 <close>
    299d:	83 c4 10             	add    $0x10,%esp
  if(total != 20*600){
    29a0:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    29a7:	74 17                	je     29c0 <bigfile+0x1f3>
    printf(1, "read bigfile wrong total\n");
    29a9:	83 ec 08             	sub    $0x8,%esp
    29ac:	68 2c 53 00 00       	push   $0x532c
    29b1:	6a 01                	push   $0x1
    29b3:	e8 ab 16 00 00       	call   4063 <printf>
    29b8:	83 c4 10             	add    $0x10,%esp
    exit();
    29bb:	e8 1c 15 00 00       	call   3edc <exit>
  }
  unlink("bigfile");
    29c0:	83 ec 0c             	sub    $0xc,%esp
    29c3:	68 a1 52 00 00       	push   $0x52a1
    29c8:	e8 5f 15 00 00       	call   3f2c <unlink>
    29cd:	83 c4 10             	add    $0x10,%esp

  printf(1, "bigfile test ok\n");
    29d0:	83 ec 08             	sub    $0x8,%esp
    29d3:	68 46 53 00 00       	push   $0x5346
    29d8:	6a 01                	push   $0x1
    29da:	e8 84 16 00 00       	call   4063 <printf>
    29df:	83 c4 10             	add    $0x10,%esp
}
    29e2:	90                   	nop
    29e3:	c9                   	leave  
    29e4:	c3                   	ret    

000029e5 <fourteen>:

void
fourteen(void)
{
    29e5:	55                   	push   %ebp
    29e6:	89 e5                	mov    %esp,%ebp
    29e8:	83 ec 18             	sub    $0x18,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    29eb:	83 ec 08             	sub    $0x8,%esp
    29ee:	68 57 53 00 00       	push   $0x5357
    29f3:	6a 01                	push   $0x1
    29f5:	e8 69 16 00 00       	call   4063 <printf>
    29fa:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234") != 0){
    29fd:	83 ec 0c             	sub    $0xc,%esp
    2a00:	68 66 53 00 00       	push   $0x5366
    2a05:	e8 3a 15 00 00       	call   3f44 <mkdir>
    2a0a:	83 c4 10             	add    $0x10,%esp
    2a0d:	85 c0                	test   %eax,%eax
    2a0f:	74 17                	je     2a28 <fourteen+0x43>
    printf(1, "mkdir 12345678901234 failed\n");
    2a11:	83 ec 08             	sub    $0x8,%esp
    2a14:	68 75 53 00 00       	push   $0x5375
    2a19:	6a 01                	push   $0x1
    2a1b:	e8 43 16 00 00       	call   4063 <printf>
    2a20:	83 c4 10             	add    $0x10,%esp
    exit();
    2a23:	e8 b4 14 00 00       	call   3edc <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2a28:	83 ec 0c             	sub    $0xc,%esp
    2a2b:	68 94 53 00 00       	push   $0x5394
    2a30:	e8 0f 15 00 00       	call   3f44 <mkdir>
    2a35:	83 c4 10             	add    $0x10,%esp
    2a38:	85 c0                	test   %eax,%eax
    2a3a:	74 17                	je     2a53 <fourteen+0x6e>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2a3c:	83 ec 08             	sub    $0x8,%esp
    2a3f:	68 b4 53 00 00       	push   $0x53b4
    2a44:	6a 01                	push   $0x1
    2a46:	e8 18 16 00 00       	call   4063 <printf>
    2a4b:	83 c4 10             	add    $0x10,%esp
    exit();
    2a4e:	e8 89 14 00 00       	call   3edc <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2a53:	83 ec 08             	sub    $0x8,%esp
    2a56:	68 00 02 00 00       	push   $0x200
    2a5b:	68 e4 53 00 00       	push   $0x53e4
    2a60:	e8 b7 14 00 00       	call   3f1c <open>
    2a65:	83 c4 10             	add    $0x10,%esp
    2a68:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2a6b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a6f:	79 17                	jns    2a88 <fourteen+0xa3>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2a71:	83 ec 08             	sub    $0x8,%esp
    2a74:	68 14 54 00 00       	push   $0x5414
    2a79:	6a 01                	push   $0x1
    2a7b:	e8 e3 15 00 00       	call   4063 <printf>
    2a80:	83 c4 10             	add    $0x10,%esp
    exit();
    2a83:	e8 54 14 00 00       	call   3edc <exit>
  }
  close(fd);
    2a88:	83 ec 0c             	sub    $0xc,%esp
    2a8b:	ff 75 f4             	pushl  -0xc(%ebp)
    2a8e:	e8 71 14 00 00       	call   3f04 <close>
    2a93:	83 c4 10             	add    $0x10,%esp
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2a96:	83 ec 08             	sub    $0x8,%esp
    2a99:	6a 00                	push   $0x0
    2a9b:	68 54 54 00 00       	push   $0x5454
    2aa0:	e8 77 14 00 00       	call   3f1c <open>
    2aa5:	83 c4 10             	add    $0x10,%esp
    2aa8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2aab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2aaf:	79 17                	jns    2ac8 <fourteen+0xe3>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2ab1:	83 ec 08             	sub    $0x8,%esp
    2ab4:	68 84 54 00 00       	push   $0x5484
    2ab9:	6a 01                	push   $0x1
    2abb:	e8 a3 15 00 00       	call   4063 <printf>
    2ac0:	83 c4 10             	add    $0x10,%esp
    exit();
    2ac3:	e8 14 14 00 00       	call   3edc <exit>
  }
  close(fd);
    2ac8:	83 ec 0c             	sub    $0xc,%esp
    2acb:	ff 75 f4             	pushl  -0xc(%ebp)
    2ace:	e8 31 14 00 00       	call   3f04 <close>
    2ad3:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234/12345678901234") == 0){
    2ad6:	83 ec 0c             	sub    $0xc,%esp
    2ad9:	68 be 54 00 00       	push   $0x54be
    2ade:	e8 61 14 00 00       	call   3f44 <mkdir>
    2ae3:	83 c4 10             	add    $0x10,%esp
    2ae6:	85 c0                	test   %eax,%eax
    2ae8:	75 17                	jne    2b01 <fourteen+0x11c>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2aea:	83 ec 08             	sub    $0x8,%esp
    2aed:	68 dc 54 00 00       	push   $0x54dc
    2af2:	6a 01                	push   $0x1
    2af4:	e8 6a 15 00 00       	call   4063 <printf>
    2af9:	83 c4 10             	add    $0x10,%esp
    exit();
    2afc:	e8 db 13 00 00       	call   3edc <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2b01:	83 ec 0c             	sub    $0xc,%esp
    2b04:	68 0c 55 00 00       	push   $0x550c
    2b09:	e8 36 14 00 00       	call   3f44 <mkdir>
    2b0e:	83 c4 10             	add    $0x10,%esp
    2b11:	85 c0                	test   %eax,%eax
    2b13:	75 17                	jne    2b2c <fourteen+0x147>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2b15:	83 ec 08             	sub    $0x8,%esp
    2b18:	68 2c 55 00 00       	push   $0x552c
    2b1d:	6a 01                	push   $0x1
    2b1f:	e8 3f 15 00 00       	call   4063 <printf>
    2b24:	83 c4 10             	add    $0x10,%esp
    exit();
    2b27:	e8 b0 13 00 00       	call   3edc <exit>
  }

  printf(1, "fourteen ok\n");
    2b2c:	83 ec 08             	sub    $0x8,%esp
    2b2f:	68 5d 55 00 00       	push   $0x555d
    2b34:	6a 01                	push   $0x1
    2b36:	e8 28 15 00 00       	call   4063 <printf>
    2b3b:	83 c4 10             	add    $0x10,%esp
}
    2b3e:	90                   	nop
    2b3f:	c9                   	leave  
    2b40:	c3                   	ret    

00002b41 <rmdot>:

void
rmdot(void)
{
    2b41:	55                   	push   %ebp
    2b42:	89 e5                	mov    %esp,%ebp
    2b44:	83 ec 08             	sub    $0x8,%esp
  printf(1, "rmdot test\n");
    2b47:	83 ec 08             	sub    $0x8,%esp
    2b4a:	68 6a 55 00 00       	push   $0x556a
    2b4f:	6a 01                	push   $0x1
    2b51:	e8 0d 15 00 00       	call   4063 <printf>
    2b56:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dots") != 0){
    2b59:	83 ec 0c             	sub    $0xc,%esp
    2b5c:	68 76 55 00 00       	push   $0x5576
    2b61:	e8 de 13 00 00       	call   3f44 <mkdir>
    2b66:	83 c4 10             	add    $0x10,%esp
    2b69:	85 c0                	test   %eax,%eax
    2b6b:	74 17                	je     2b84 <rmdot+0x43>
    printf(1, "mkdir dots failed\n");
    2b6d:	83 ec 08             	sub    $0x8,%esp
    2b70:	68 7b 55 00 00       	push   $0x557b
    2b75:	6a 01                	push   $0x1
    2b77:	e8 e7 14 00 00       	call   4063 <printf>
    2b7c:	83 c4 10             	add    $0x10,%esp
    exit();
    2b7f:	e8 58 13 00 00       	call   3edc <exit>
  }
  if(chdir("dots") != 0){
    2b84:	83 ec 0c             	sub    $0xc,%esp
    2b87:	68 76 55 00 00       	push   $0x5576
    2b8c:	e8 bb 13 00 00       	call   3f4c <chdir>
    2b91:	83 c4 10             	add    $0x10,%esp
    2b94:	85 c0                	test   %eax,%eax
    2b96:	74 17                	je     2baf <rmdot+0x6e>
    printf(1, "chdir dots failed\n");
    2b98:	83 ec 08             	sub    $0x8,%esp
    2b9b:	68 8e 55 00 00       	push   $0x558e
    2ba0:	6a 01                	push   $0x1
    2ba2:	e8 bc 14 00 00       	call   4063 <printf>
    2ba7:	83 c4 10             	add    $0x10,%esp
    exit();
    2baa:	e8 2d 13 00 00       	call   3edc <exit>
  }
  if(unlink(".") == 0){
    2baf:	83 ec 0c             	sub    $0xc,%esp
    2bb2:	68 a7 4c 00 00       	push   $0x4ca7
    2bb7:	e8 70 13 00 00       	call   3f2c <unlink>
    2bbc:	83 c4 10             	add    $0x10,%esp
    2bbf:	85 c0                	test   %eax,%eax
    2bc1:	75 17                	jne    2bda <rmdot+0x99>
    printf(1, "rm . worked!\n");
    2bc3:	83 ec 08             	sub    $0x8,%esp
    2bc6:	68 a1 55 00 00       	push   $0x55a1
    2bcb:	6a 01                	push   $0x1
    2bcd:	e8 91 14 00 00       	call   4063 <printf>
    2bd2:	83 c4 10             	add    $0x10,%esp
    exit();
    2bd5:	e8 02 13 00 00       	call   3edc <exit>
  }
  if(unlink("..") == 0){
    2bda:	83 ec 0c             	sub    $0xc,%esp
    2bdd:	68 3a 48 00 00       	push   $0x483a
    2be2:	e8 45 13 00 00       	call   3f2c <unlink>
    2be7:	83 c4 10             	add    $0x10,%esp
    2bea:	85 c0                	test   %eax,%eax
    2bec:	75 17                	jne    2c05 <rmdot+0xc4>
    printf(1, "rm .. worked!\n");
    2bee:	83 ec 08             	sub    $0x8,%esp
    2bf1:	68 af 55 00 00       	push   $0x55af
    2bf6:	6a 01                	push   $0x1
    2bf8:	e8 66 14 00 00       	call   4063 <printf>
    2bfd:	83 c4 10             	add    $0x10,%esp
    exit();
    2c00:	e8 d7 12 00 00       	call   3edc <exit>
  }
  if(chdir("/") != 0){
    2c05:	83 ec 0c             	sub    $0xc,%esp
    2c08:	68 8e 44 00 00       	push   $0x448e
    2c0d:	e8 3a 13 00 00       	call   3f4c <chdir>
    2c12:	83 c4 10             	add    $0x10,%esp
    2c15:	85 c0                	test   %eax,%eax
    2c17:	74 17                	je     2c30 <rmdot+0xef>
    printf(1, "chdir / failed\n");
    2c19:	83 ec 08             	sub    $0x8,%esp
    2c1c:	68 90 44 00 00       	push   $0x4490
    2c21:	6a 01                	push   $0x1
    2c23:	e8 3b 14 00 00       	call   4063 <printf>
    2c28:	83 c4 10             	add    $0x10,%esp
    exit();
    2c2b:	e8 ac 12 00 00       	call   3edc <exit>
  }
  if(unlink("dots/.") == 0){
    2c30:	83 ec 0c             	sub    $0xc,%esp
    2c33:	68 be 55 00 00       	push   $0x55be
    2c38:	e8 ef 12 00 00       	call   3f2c <unlink>
    2c3d:	83 c4 10             	add    $0x10,%esp
    2c40:	85 c0                	test   %eax,%eax
    2c42:	75 17                	jne    2c5b <rmdot+0x11a>
    printf(1, "unlink dots/. worked!\n");
    2c44:	83 ec 08             	sub    $0x8,%esp
    2c47:	68 c5 55 00 00       	push   $0x55c5
    2c4c:	6a 01                	push   $0x1
    2c4e:	e8 10 14 00 00       	call   4063 <printf>
    2c53:	83 c4 10             	add    $0x10,%esp
    exit();
    2c56:	e8 81 12 00 00       	call   3edc <exit>
  }
  if(unlink("dots/..") == 0){
    2c5b:	83 ec 0c             	sub    $0xc,%esp
    2c5e:	68 dc 55 00 00       	push   $0x55dc
    2c63:	e8 c4 12 00 00       	call   3f2c <unlink>
    2c68:	83 c4 10             	add    $0x10,%esp
    2c6b:	85 c0                	test   %eax,%eax
    2c6d:	75 17                	jne    2c86 <rmdot+0x145>
    printf(1, "unlink dots/.. worked!\n");
    2c6f:	83 ec 08             	sub    $0x8,%esp
    2c72:	68 e4 55 00 00       	push   $0x55e4
    2c77:	6a 01                	push   $0x1
    2c79:	e8 e5 13 00 00       	call   4063 <printf>
    2c7e:	83 c4 10             	add    $0x10,%esp
    exit();
    2c81:	e8 56 12 00 00       	call   3edc <exit>
  }
  if(unlink("dots") != 0){
    2c86:	83 ec 0c             	sub    $0xc,%esp
    2c89:	68 76 55 00 00       	push   $0x5576
    2c8e:	e8 99 12 00 00       	call   3f2c <unlink>
    2c93:	83 c4 10             	add    $0x10,%esp
    2c96:	85 c0                	test   %eax,%eax
    2c98:	74 17                	je     2cb1 <rmdot+0x170>
    printf(1, "unlink dots failed!\n");
    2c9a:	83 ec 08             	sub    $0x8,%esp
    2c9d:	68 fc 55 00 00       	push   $0x55fc
    2ca2:	6a 01                	push   $0x1
    2ca4:	e8 ba 13 00 00       	call   4063 <printf>
    2ca9:	83 c4 10             	add    $0x10,%esp
    exit();
    2cac:	e8 2b 12 00 00       	call   3edc <exit>
  }
  printf(1, "rmdot ok\n");
    2cb1:	83 ec 08             	sub    $0x8,%esp
    2cb4:	68 11 56 00 00       	push   $0x5611
    2cb9:	6a 01                	push   $0x1
    2cbb:	e8 a3 13 00 00       	call   4063 <printf>
    2cc0:	83 c4 10             	add    $0x10,%esp
}
    2cc3:	90                   	nop
    2cc4:	c9                   	leave  
    2cc5:	c3                   	ret    

00002cc6 <dirfile>:

void
dirfile(void)
{
    2cc6:	55                   	push   %ebp
    2cc7:	89 e5                	mov    %esp,%ebp
    2cc9:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "dir vs file\n");
    2ccc:	83 ec 08             	sub    $0x8,%esp
    2ccf:	68 1b 56 00 00       	push   $0x561b
    2cd4:	6a 01                	push   $0x1
    2cd6:	e8 88 13 00 00       	call   4063 <printf>
    2cdb:	83 c4 10             	add    $0x10,%esp

  fd = open("dirfile", O_CREATE);
    2cde:	83 ec 08             	sub    $0x8,%esp
    2ce1:	68 00 02 00 00       	push   $0x200
    2ce6:	68 28 56 00 00       	push   $0x5628
    2ceb:	e8 2c 12 00 00       	call   3f1c <open>
    2cf0:	83 c4 10             	add    $0x10,%esp
    2cf3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2cf6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2cfa:	79 17                	jns    2d13 <dirfile+0x4d>
    printf(1, "create dirfile failed\n");
    2cfc:	83 ec 08             	sub    $0x8,%esp
    2cff:	68 30 56 00 00       	push   $0x5630
    2d04:	6a 01                	push   $0x1
    2d06:	e8 58 13 00 00       	call   4063 <printf>
    2d0b:	83 c4 10             	add    $0x10,%esp
    exit();
    2d0e:	e8 c9 11 00 00       	call   3edc <exit>
  }
  close(fd);
    2d13:	83 ec 0c             	sub    $0xc,%esp
    2d16:	ff 75 f4             	pushl  -0xc(%ebp)
    2d19:	e8 e6 11 00 00       	call   3f04 <close>
    2d1e:	83 c4 10             	add    $0x10,%esp
  if(chdir("dirfile") == 0){
    2d21:	83 ec 0c             	sub    $0xc,%esp
    2d24:	68 28 56 00 00       	push   $0x5628
    2d29:	e8 1e 12 00 00       	call   3f4c <chdir>
    2d2e:	83 c4 10             	add    $0x10,%esp
    2d31:	85 c0                	test   %eax,%eax
    2d33:	75 17                	jne    2d4c <dirfile+0x86>
    printf(1, "chdir dirfile succeeded!\n");
    2d35:	83 ec 08             	sub    $0x8,%esp
    2d38:	68 47 56 00 00       	push   $0x5647
    2d3d:	6a 01                	push   $0x1
    2d3f:	e8 1f 13 00 00       	call   4063 <printf>
    2d44:	83 c4 10             	add    $0x10,%esp
    exit();
    2d47:	e8 90 11 00 00       	call   3edc <exit>
  }
  fd = open("dirfile/xx", 0);
    2d4c:	83 ec 08             	sub    $0x8,%esp
    2d4f:	6a 00                	push   $0x0
    2d51:	68 61 56 00 00       	push   $0x5661
    2d56:	e8 c1 11 00 00       	call   3f1c <open>
    2d5b:	83 c4 10             	add    $0x10,%esp
    2d5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2d61:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d65:	78 17                	js     2d7e <dirfile+0xb8>
    printf(1, "create dirfile/xx succeeded!\n");
    2d67:	83 ec 08             	sub    $0x8,%esp
    2d6a:	68 6c 56 00 00       	push   $0x566c
    2d6f:	6a 01                	push   $0x1
    2d71:	e8 ed 12 00 00       	call   4063 <printf>
    2d76:	83 c4 10             	add    $0x10,%esp
    exit();
    2d79:	e8 5e 11 00 00       	call   3edc <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2d7e:	83 ec 08             	sub    $0x8,%esp
    2d81:	68 00 02 00 00       	push   $0x200
    2d86:	68 61 56 00 00       	push   $0x5661
    2d8b:	e8 8c 11 00 00       	call   3f1c <open>
    2d90:	83 c4 10             	add    $0x10,%esp
    2d93:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2d96:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d9a:	78 17                	js     2db3 <dirfile+0xed>
    printf(1, "create dirfile/xx succeeded!\n");
    2d9c:	83 ec 08             	sub    $0x8,%esp
    2d9f:	68 6c 56 00 00       	push   $0x566c
    2da4:	6a 01                	push   $0x1
    2da6:	e8 b8 12 00 00       	call   4063 <printf>
    2dab:	83 c4 10             	add    $0x10,%esp
    exit();
    2dae:	e8 29 11 00 00       	call   3edc <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2db3:	83 ec 0c             	sub    $0xc,%esp
    2db6:	68 61 56 00 00       	push   $0x5661
    2dbb:	e8 84 11 00 00       	call   3f44 <mkdir>
    2dc0:	83 c4 10             	add    $0x10,%esp
    2dc3:	85 c0                	test   %eax,%eax
    2dc5:	75 17                	jne    2dde <dirfile+0x118>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2dc7:	83 ec 08             	sub    $0x8,%esp
    2dca:	68 8a 56 00 00       	push   $0x568a
    2dcf:	6a 01                	push   $0x1
    2dd1:	e8 8d 12 00 00       	call   4063 <printf>
    2dd6:	83 c4 10             	add    $0x10,%esp
    exit();
    2dd9:	e8 fe 10 00 00       	call   3edc <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2dde:	83 ec 0c             	sub    $0xc,%esp
    2de1:	68 61 56 00 00       	push   $0x5661
    2de6:	e8 41 11 00 00       	call   3f2c <unlink>
    2deb:	83 c4 10             	add    $0x10,%esp
    2dee:	85 c0                	test   %eax,%eax
    2df0:	75 17                	jne    2e09 <dirfile+0x143>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2df2:	83 ec 08             	sub    $0x8,%esp
    2df5:	68 a7 56 00 00       	push   $0x56a7
    2dfa:	6a 01                	push   $0x1
    2dfc:	e8 62 12 00 00       	call   4063 <printf>
    2e01:	83 c4 10             	add    $0x10,%esp
    exit();
    2e04:	e8 d3 10 00 00       	call   3edc <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2e09:	83 ec 08             	sub    $0x8,%esp
    2e0c:	68 61 56 00 00       	push   $0x5661
    2e11:	68 c5 56 00 00       	push   $0x56c5
    2e16:	e8 21 11 00 00       	call   3f3c <link>
    2e1b:	83 c4 10             	add    $0x10,%esp
    2e1e:	85 c0                	test   %eax,%eax
    2e20:	75 17                	jne    2e39 <dirfile+0x173>
    printf(1, "link to dirfile/xx succeeded!\n");
    2e22:	83 ec 08             	sub    $0x8,%esp
    2e25:	68 cc 56 00 00       	push   $0x56cc
    2e2a:	6a 01                	push   $0x1
    2e2c:	e8 32 12 00 00       	call   4063 <printf>
    2e31:	83 c4 10             	add    $0x10,%esp
    exit();
    2e34:	e8 a3 10 00 00       	call   3edc <exit>
  }
  if(unlink("dirfile") != 0){
    2e39:	83 ec 0c             	sub    $0xc,%esp
    2e3c:	68 28 56 00 00       	push   $0x5628
    2e41:	e8 e6 10 00 00       	call   3f2c <unlink>
    2e46:	83 c4 10             	add    $0x10,%esp
    2e49:	85 c0                	test   %eax,%eax
    2e4b:	74 17                	je     2e64 <dirfile+0x19e>
    printf(1, "unlink dirfile failed!\n");
    2e4d:	83 ec 08             	sub    $0x8,%esp
    2e50:	68 eb 56 00 00       	push   $0x56eb
    2e55:	6a 01                	push   $0x1
    2e57:	e8 07 12 00 00       	call   4063 <printf>
    2e5c:	83 c4 10             	add    $0x10,%esp
    exit();
    2e5f:	e8 78 10 00 00       	call   3edc <exit>
  }

  fd = open(".", O_RDWR);
    2e64:	83 ec 08             	sub    $0x8,%esp
    2e67:	6a 02                	push   $0x2
    2e69:	68 a7 4c 00 00       	push   $0x4ca7
    2e6e:	e8 a9 10 00 00       	call   3f1c <open>
    2e73:	83 c4 10             	add    $0x10,%esp
    2e76:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2e79:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e7d:	78 17                	js     2e96 <dirfile+0x1d0>
    printf(1, "open . for writing succeeded!\n");
    2e7f:	83 ec 08             	sub    $0x8,%esp
    2e82:	68 04 57 00 00       	push   $0x5704
    2e87:	6a 01                	push   $0x1
    2e89:	e8 d5 11 00 00       	call   4063 <printf>
    2e8e:	83 c4 10             	add    $0x10,%esp
    exit();
    2e91:	e8 46 10 00 00       	call   3edc <exit>
  }
  fd = open(".", 0);
    2e96:	83 ec 08             	sub    $0x8,%esp
    2e99:	6a 00                	push   $0x0
    2e9b:	68 a7 4c 00 00       	push   $0x4ca7
    2ea0:	e8 77 10 00 00       	call   3f1c <open>
    2ea5:	83 c4 10             	add    $0x10,%esp
    2ea8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    2eab:	83 ec 04             	sub    $0x4,%esp
    2eae:	6a 01                	push   $0x1
    2eb0:	68 f3 48 00 00       	push   $0x48f3
    2eb5:	ff 75 f4             	pushl  -0xc(%ebp)
    2eb8:	e8 3f 10 00 00       	call   3efc <write>
    2ebd:	83 c4 10             	add    $0x10,%esp
    2ec0:	85 c0                	test   %eax,%eax
    2ec2:	7e 17                	jle    2edb <dirfile+0x215>
    printf(1, "write . succeeded!\n");
    2ec4:	83 ec 08             	sub    $0x8,%esp
    2ec7:	68 23 57 00 00       	push   $0x5723
    2ecc:	6a 01                	push   $0x1
    2ece:	e8 90 11 00 00       	call   4063 <printf>
    2ed3:	83 c4 10             	add    $0x10,%esp
    exit();
    2ed6:	e8 01 10 00 00       	call   3edc <exit>
  }
  close(fd);
    2edb:	83 ec 0c             	sub    $0xc,%esp
    2ede:	ff 75 f4             	pushl  -0xc(%ebp)
    2ee1:	e8 1e 10 00 00       	call   3f04 <close>
    2ee6:	83 c4 10             	add    $0x10,%esp

  printf(1, "dir vs file OK\n");
    2ee9:	83 ec 08             	sub    $0x8,%esp
    2eec:	68 37 57 00 00       	push   $0x5737
    2ef1:	6a 01                	push   $0x1
    2ef3:	e8 6b 11 00 00       	call   4063 <printf>
    2ef8:	83 c4 10             	add    $0x10,%esp
}
    2efb:	90                   	nop
    2efc:	c9                   	leave  
    2efd:	c3                   	ret    

00002efe <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2efe:	55                   	push   %ebp
    2eff:	89 e5                	mov    %esp,%ebp
    2f01:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2f04:	83 ec 08             	sub    $0x8,%esp
    2f07:	68 47 57 00 00       	push   $0x5747
    2f0c:	6a 01                	push   $0x1
    2f0e:	e8 50 11 00 00       	call   4063 <printf>
    2f13:	83 c4 10             	add    $0x10,%esp

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2f16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f1d:	e9 e7 00 00 00       	jmp    3009 <iref+0x10b>
    if(mkdir("irefd") != 0){
    2f22:	83 ec 0c             	sub    $0xc,%esp
    2f25:	68 58 57 00 00       	push   $0x5758
    2f2a:	e8 15 10 00 00       	call   3f44 <mkdir>
    2f2f:	83 c4 10             	add    $0x10,%esp
    2f32:	85 c0                	test   %eax,%eax
    2f34:	74 17                	je     2f4d <iref+0x4f>
      printf(1, "mkdir irefd failed\n");
    2f36:	83 ec 08             	sub    $0x8,%esp
    2f39:	68 5e 57 00 00       	push   $0x575e
    2f3e:	6a 01                	push   $0x1
    2f40:	e8 1e 11 00 00       	call   4063 <printf>
    2f45:	83 c4 10             	add    $0x10,%esp
      exit();
    2f48:	e8 8f 0f 00 00       	call   3edc <exit>
    }
    if(chdir("irefd") != 0){
    2f4d:	83 ec 0c             	sub    $0xc,%esp
    2f50:	68 58 57 00 00       	push   $0x5758
    2f55:	e8 f2 0f 00 00       	call   3f4c <chdir>
    2f5a:	83 c4 10             	add    $0x10,%esp
    2f5d:	85 c0                	test   %eax,%eax
    2f5f:	74 17                	je     2f78 <iref+0x7a>
      printf(1, "chdir irefd failed\n");
    2f61:	83 ec 08             	sub    $0x8,%esp
    2f64:	68 72 57 00 00       	push   $0x5772
    2f69:	6a 01                	push   $0x1
    2f6b:	e8 f3 10 00 00       	call   4063 <printf>
    2f70:	83 c4 10             	add    $0x10,%esp
      exit();
    2f73:	e8 64 0f 00 00       	call   3edc <exit>
    }

    mkdir("");
    2f78:	83 ec 0c             	sub    $0xc,%esp
    2f7b:	68 86 57 00 00       	push   $0x5786
    2f80:	e8 bf 0f 00 00       	call   3f44 <mkdir>
    2f85:	83 c4 10             	add    $0x10,%esp
    link("README", "");
    2f88:	83 ec 08             	sub    $0x8,%esp
    2f8b:	68 86 57 00 00       	push   $0x5786
    2f90:	68 c5 56 00 00       	push   $0x56c5
    2f95:	e8 a2 0f 00 00       	call   3f3c <link>
    2f9a:	83 c4 10             	add    $0x10,%esp
    fd = open("", O_CREATE);
    2f9d:	83 ec 08             	sub    $0x8,%esp
    2fa0:	68 00 02 00 00       	push   $0x200
    2fa5:	68 86 57 00 00       	push   $0x5786
    2faa:	e8 6d 0f 00 00       	call   3f1c <open>
    2faf:	83 c4 10             	add    $0x10,%esp
    2fb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2fb5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2fb9:	78 0e                	js     2fc9 <iref+0xcb>
      close(fd);
    2fbb:	83 ec 0c             	sub    $0xc,%esp
    2fbe:	ff 75 f0             	pushl  -0x10(%ebp)
    2fc1:	e8 3e 0f 00 00       	call   3f04 <close>
    2fc6:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2fc9:	83 ec 08             	sub    $0x8,%esp
    2fcc:	68 00 02 00 00       	push   $0x200
    2fd1:	68 87 57 00 00       	push   $0x5787
    2fd6:	e8 41 0f 00 00       	call   3f1c <open>
    2fdb:	83 c4 10             	add    $0x10,%esp
    2fde:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2fe1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2fe5:	78 0e                	js     2ff5 <iref+0xf7>
      close(fd);
    2fe7:	83 ec 0c             	sub    $0xc,%esp
    2fea:	ff 75 f0             	pushl  -0x10(%ebp)
    2fed:	e8 12 0f 00 00       	call   3f04 <close>
    2ff2:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2ff5:	83 ec 0c             	sub    $0xc,%esp
    2ff8:	68 87 57 00 00       	push   $0x5787
    2ffd:	e8 2a 0f 00 00       	call   3f2c <unlink>
    3002:	83 c4 10             	add    $0x10,%esp
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    3005:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3009:	83 7d f4 32          	cmpl   $0x32,-0xc(%ebp)
    300d:	0f 8e 0f ff ff ff    	jle    2f22 <iref+0x24>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    3013:	83 ec 0c             	sub    $0xc,%esp
    3016:	68 8e 44 00 00       	push   $0x448e
    301b:	e8 2c 0f 00 00       	call   3f4c <chdir>
    3020:	83 c4 10             	add    $0x10,%esp
  printf(1, "empty file name OK\n");
    3023:	83 ec 08             	sub    $0x8,%esp
    3026:	68 8a 57 00 00       	push   $0x578a
    302b:	6a 01                	push   $0x1
    302d:	e8 31 10 00 00       	call   4063 <printf>
    3032:	83 c4 10             	add    $0x10,%esp
}
    3035:	90                   	nop
    3036:	c9                   	leave  
    3037:	c3                   	ret    

00003038 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    3038:	55                   	push   %ebp
    3039:	89 e5                	mov    %esp,%ebp
    303b:	83 ec 18             	sub    $0x18,%esp
  int n, pid;

  printf(1, "fork test\n");
    303e:	83 ec 08             	sub    $0x8,%esp
    3041:	68 9e 57 00 00       	push   $0x579e
    3046:	6a 01                	push   $0x1
    3048:	e8 16 10 00 00       	call   4063 <printf>
    304d:	83 c4 10             	add    $0x10,%esp

  for(n=0; n<1000; n++){
    3050:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3057:	eb 1d                	jmp    3076 <forktest+0x3e>
    pid = fork();
    3059:	e8 76 0e 00 00       	call   3ed4 <fork>
    305e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    3061:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3065:	78 1a                	js     3081 <forktest+0x49>
      break;
    if(pid == 0)
    3067:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    306b:	75 05                	jne    3072 <forktest+0x3a>
      exit();
    306d:	e8 6a 0e 00 00       	call   3edc <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3072:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3076:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    307d:	7e da                	jle    3059 <forktest+0x21>
    307f:	eb 01                	jmp    3082 <forktest+0x4a>
    pid = fork();
    if(pid < 0)
      break;
    3081:	90                   	nop
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    3082:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    3089:	75 3b                	jne    30c6 <forktest+0x8e>
    printf(1, "fork claimed to work 1000 times!\n");
    308b:	83 ec 08             	sub    $0x8,%esp
    308e:	68 ac 57 00 00       	push   $0x57ac
    3093:	6a 01                	push   $0x1
    3095:	e8 c9 0f 00 00       	call   4063 <printf>
    309a:	83 c4 10             	add    $0x10,%esp
    exit();
    309d:	e8 3a 0e 00 00       	call   3edc <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
    30a2:	e8 3d 0e 00 00       	call   3ee4 <wait>
    30a7:	85 c0                	test   %eax,%eax
    30a9:	79 17                	jns    30c2 <forktest+0x8a>
      printf(1, "wait stopped early\n");
    30ab:	83 ec 08             	sub    $0x8,%esp
    30ae:	68 ce 57 00 00       	push   $0x57ce
    30b3:	6a 01                	push   $0x1
    30b5:	e8 a9 0f 00 00       	call   4063 <printf>
    30ba:	83 c4 10             	add    $0x10,%esp
      exit();
    30bd:	e8 1a 0e 00 00       	call   3edc <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    30c2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    30c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    30ca:	7f d6                	jg     30a2 <forktest+0x6a>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    30cc:	e8 13 0e 00 00       	call   3ee4 <wait>
    30d1:	83 f8 ff             	cmp    $0xffffffff,%eax
    30d4:	74 17                	je     30ed <forktest+0xb5>
    printf(1, "wait got too many\n");
    30d6:	83 ec 08             	sub    $0x8,%esp
    30d9:	68 e2 57 00 00       	push   $0x57e2
    30de:	6a 01                	push   $0x1
    30e0:	e8 7e 0f 00 00       	call   4063 <printf>
    30e5:	83 c4 10             	add    $0x10,%esp
    exit();
    30e8:	e8 ef 0d 00 00       	call   3edc <exit>
  }
  
  printf(1, "fork test OK\n");
    30ed:	83 ec 08             	sub    $0x8,%esp
    30f0:	68 f5 57 00 00       	push   $0x57f5
    30f5:	6a 01                	push   $0x1
    30f7:	e8 67 0f 00 00       	call   4063 <printf>
    30fc:	83 c4 10             	add    $0x10,%esp
}
    30ff:	90                   	nop
    3100:	c9                   	leave  
    3101:	c3                   	ret    

00003102 <sbrktest>:

void
sbrktest(void)
{
    3102:	55                   	push   %ebp
    3103:	89 e5                	mov    %esp,%ebp
    3105:	53                   	push   %ebx
    3106:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    3109:	a1 d8 62 00 00       	mov    0x62d8,%eax
    310e:	83 ec 08             	sub    $0x8,%esp
    3111:	68 03 58 00 00       	push   $0x5803
    3116:	50                   	push   %eax
    3117:	e8 47 0f 00 00       	call   4063 <printf>
    311c:	83 c4 10             	add    $0x10,%esp
  oldbrk = sbrk(0);
    311f:	83 ec 0c             	sub    $0xc,%esp
    3122:	6a 00                	push   $0x0
    3124:	e8 3b 0e 00 00       	call   3f64 <sbrk>
    3129:	83 c4 10             	add    $0x10,%esp
    312c:	89 45 ec             	mov    %eax,-0x14(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    312f:	83 ec 0c             	sub    $0xc,%esp
    3132:	6a 00                	push   $0x0
    3134:	e8 2b 0e 00 00       	call   3f64 <sbrk>
    3139:	83 c4 10             	add    $0x10,%esp
    313c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    313f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3146:	eb 4f                	jmp    3197 <sbrktest+0x95>
    b = sbrk(1);
    3148:	83 ec 0c             	sub    $0xc,%esp
    314b:	6a 01                	push   $0x1
    314d:	e8 12 0e 00 00       	call   3f64 <sbrk>
    3152:	83 c4 10             	add    $0x10,%esp
    3155:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(b != a){
    3158:	8b 45 e8             	mov    -0x18(%ebp),%eax
    315b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    315e:	74 24                	je     3184 <sbrktest+0x82>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3160:	a1 d8 62 00 00       	mov    0x62d8,%eax
    3165:	83 ec 0c             	sub    $0xc,%esp
    3168:	ff 75 e8             	pushl  -0x18(%ebp)
    316b:	ff 75 f4             	pushl  -0xc(%ebp)
    316e:	ff 75 f0             	pushl  -0x10(%ebp)
    3171:	68 0e 58 00 00       	push   $0x580e
    3176:	50                   	push   %eax
    3177:	e8 e7 0e 00 00       	call   4063 <printf>
    317c:	83 c4 20             	add    $0x20,%esp
      exit();
    317f:	e8 58 0d 00 00       	call   3edc <exit>
    }
    *b = 1;
    3184:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3187:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    318a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    318d:	83 c0 01             	add    $0x1,%eax
    3190:	89 45 f4             	mov    %eax,-0xc(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    3193:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3197:	81 7d f0 87 13 00 00 	cmpl   $0x1387,-0x10(%ebp)
    319e:	7e a8                	jle    3148 <sbrktest+0x46>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    31a0:	e8 2f 0d 00 00       	call   3ed4 <fork>
    31a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    31a8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    31ac:	79 1b                	jns    31c9 <sbrktest+0xc7>
    printf(stdout, "sbrk test fork failed\n");
    31ae:	a1 d8 62 00 00       	mov    0x62d8,%eax
    31b3:	83 ec 08             	sub    $0x8,%esp
    31b6:	68 29 58 00 00       	push   $0x5829
    31bb:	50                   	push   %eax
    31bc:	e8 a2 0e 00 00       	call   4063 <printf>
    31c1:	83 c4 10             	add    $0x10,%esp
    exit();
    31c4:	e8 13 0d 00 00       	call   3edc <exit>
  }
  c = sbrk(1);
    31c9:	83 ec 0c             	sub    $0xc,%esp
    31cc:	6a 01                	push   $0x1
    31ce:	e8 91 0d 00 00       	call   3f64 <sbrk>
    31d3:	83 c4 10             	add    $0x10,%esp
    31d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    31d9:	83 ec 0c             	sub    $0xc,%esp
    31dc:	6a 01                	push   $0x1
    31de:	e8 81 0d 00 00       	call   3f64 <sbrk>
    31e3:	83 c4 10             	add    $0x10,%esp
    31e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    31e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31ec:	83 c0 01             	add    $0x1,%eax
    31ef:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    31f2:	74 1b                	je     320f <sbrktest+0x10d>
    printf(stdout, "sbrk test failed post-fork\n");
    31f4:	a1 d8 62 00 00       	mov    0x62d8,%eax
    31f9:	83 ec 08             	sub    $0x8,%esp
    31fc:	68 40 58 00 00       	push   $0x5840
    3201:	50                   	push   %eax
    3202:	e8 5c 0e 00 00       	call   4063 <printf>
    3207:	83 c4 10             	add    $0x10,%esp
    exit();
    320a:	e8 cd 0c 00 00       	call   3edc <exit>
  }
  if(pid == 0)
    320f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3213:	75 05                	jne    321a <sbrktest+0x118>
    exit();
    3215:	e8 c2 0c 00 00       	call   3edc <exit>
  wait();
    321a:	e8 c5 0c 00 00       	call   3ee4 <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    321f:	83 ec 0c             	sub    $0xc,%esp
    3222:	6a 00                	push   $0x0
    3224:	e8 3b 0d 00 00       	call   3f64 <sbrk>
    3229:	83 c4 10             	add    $0x10,%esp
    322c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  amt = (BIG) - (uint)a;
    322f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3232:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3237:	29 c2                	sub    %eax,%edx
    3239:	89 d0                	mov    %edx,%eax
    323b:	89 45 dc             	mov    %eax,-0x24(%ebp)
  p = sbrk(amt);
    323e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3241:	83 ec 0c             	sub    $0xc,%esp
    3244:	50                   	push   %eax
    3245:	e8 1a 0d 00 00       	call   3f64 <sbrk>
    324a:	83 c4 10             	add    $0x10,%esp
    324d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  if (p != a) { 
    3250:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3253:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3256:	74 1b                	je     3273 <sbrktest+0x171>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3258:	a1 d8 62 00 00       	mov    0x62d8,%eax
    325d:	83 ec 08             	sub    $0x8,%esp
    3260:	68 5c 58 00 00       	push   $0x585c
    3265:	50                   	push   %eax
    3266:	e8 f8 0d 00 00       	call   4063 <printf>
    326b:	83 c4 10             	add    $0x10,%esp
    exit();
    326e:	e8 69 0c 00 00       	call   3edc <exit>
  }
  lastaddr = (char*) (BIG-1);
    3273:	c7 45 d4 ff ff 3f 06 	movl   $0x63fffff,-0x2c(%ebp)
  *lastaddr = 99;
    327a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    327d:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    3280:	83 ec 0c             	sub    $0xc,%esp
    3283:	6a 00                	push   $0x0
    3285:	e8 da 0c 00 00       	call   3f64 <sbrk>
    328a:	83 c4 10             	add    $0x10,%esp
    328d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-4096);
    3290:	83 ec 0c             	sub    $0xc,%esp
    3293:	68 00 f0 ff ff       	push   $0xfffff000
    3298:	e8 c7 0c 00 00       	call   3f64 <sbrk>
    329d:	83 c4 10             	add    $0x10,%esp
    32a0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    32a3:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    32a7:	75 1b                	jne    32c4 <sbrktest+0x1c2>
    printf(stdout, "sbrk could not deallocate\n");
    32a9:	a1 d8 62 00 00       	mov    0x62d8,%eax
    32ae:	83 ec 08             	sub    $0x8,%esp
    32b1:	68 9a 58 00 00       	push   $0x589a
    32b6:	50                   	push   %eax
    32b7:	e8 a7 0d 00 00       	call   4063 <printf>
    32bc:	83 c4 10             	add    $0x10,%esp
    exit();
    32bf:	e8 18 0c 00 00       	call   3edc <exit>
  }
  c = sbrk(0);
    32c4:	83 ec 0c             	sub    $0xc,%esp
    32c7:	6a 00                	push   $0x0
    32c9:	e8 96 0c 00 00       	call   3f64 <sbrk>
    32ce:	83 c4 10             	add    $0x10,%esp
    32d1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    32d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32d7:	2d 00 10 00 00       	sub    $0x1000,%eax
    32dc:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    32df:	74 1e                	je     32ff <sbrktest+0x1fd>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    32e1:	a1 d8 62 00 00       	mov    0x62d8,%eax
    32e6:	ff 75 e0             	pushl  -0x20(%ebp)
    32e9:	ff 75 f4             	pushl  -0xc(%ebp)
    32ec:	68 b8 58 00 00       	push   $0x58b8
    32f1:	50                   	push   %eax
    32f2:	e8 6c 0d 00 00       	call   4063 <printf>
    32f7:	83 c4 10             	add    $0x10,%esp
    exit();
    32fa:	e8 dd 0b 00 00       	call   3edc <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    32ff:	83 ec 0c             	sub    $0xc,%esp
    3302:	6a 00                	push   $0x0
    3304:	e8 5b 0c 00 00       	call   3f64 <sbrk>
    3309:	83 c4 10             	add    $0x10,%esp
    330c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(4096);
    330f:	83 ec 0c             	sub    $0xc,%esp
    3312:	68 00 10 00 00       	push   $0x1000
    3317:	e8 48 0c 00 00       	call   3f64 <sbrk>
    331c:	83 c4 10             	add    $0x10,%esp
    331f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    3322:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3325:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3328:	75 1b                	jne    3345 <sbrktest+0x243>
    332a:	83 ec 0c             	sub    $0xc,%esp
    332d:	6a 00                	push   $0x0
    332f:	e8 30 0c 00 00       	call   3f64 <sbrk>
    3334:	83 c4 10             	add    $0x10,%esp
    3337:	89 c2                	mov    %eax,%edx
    3339:	8b 45 f4             	mov    -0xc(%ebp),%eax
    333c:	05 00 10 00 00       	add    $0x1000,%eax
    3341:	39 c2                	cmp    %eax,%edx
    3343:	74 1e                	je     3363 <sbrktest+0x261>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3345:	a1 d8 62 00 00       	mov    0x62d8,%eax
    334a:	ff 75 e0             	pushl  -0x20(%ebp)
    334d:	ff 75 f4             	pushl  -0xc(%ebp)
    3350:	68 f0 58 00 00       	push   $0x58f0
    3355:	50                   	push   %eax
    3356:	e8 08 0d 00 00       	call   4063 <printf>
    335b:	83 c4 10             	add    $0x10,%esp
    exit();
    335e:	e8 79 0b 00 00       	call   3edc <exit>
  }
  if(*lastaddr == 99){
    3363:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3366:	0f b6 00             	movzbl (%eax),%eax
    3369:	3c 63                	cmp    $0x63,%al
    336b:	75 1b                	jne    3388 <sbrktest+0x286>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    336d:	a1 d8 62 00 00       	mov    0x62d8,%eax
    3372:	83 ec 08             	sub    $0x8,%esp
    3375:	68 18 59 00 00       	push   $0x5918
    337a:	50                   	push   %eax
    337b:	e8 e3 0c 00 00       	call   4063 <printf>
    3380:	83 c4 10             	add    $0x10,%esp
    exit();
    3383:	e8 54 0b 00 00       	call   3edc <exit>
  }

  a = sbrk(0);
    3388:	83 ec 0c             	sub    $0xc,%esp
    338b:	6a 00                	push   $0x0
    338d:	e8 d2 0b 00 00       	call   3f64 <sbrk>
    3392:	83 c4 10             	add    $0x10,%esp
    3395:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    3398:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    339b:	83 ec 0c             	sub    $0xc,%esp
    339e:	6a 00                	push   $0x0
    33a0:	e8 bf 0b 00 00       	call   3f64 <sbrk>
    33a5:	83 c4 10             	add    $0x10,%esp
    33a8:	29 c3                	sub    %eax,%ebx
    33aa:	89 d8                	mov    %ebx,%eax
    33ac:	83 ec 0c             	sub    $0xc,%esp
    33af:	50                   	push   %eax
    33b0:	e8 af 0b 00 00       	call   3f64 <sbrk>
    33b5:	83 c4 10             	add    $0x10,%esp
    33b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    33bb:	8b 45 e0             	mov    -0x20(%ebp),%eax
    33be:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    33c1:	74 1e                	je     33e1 <sbrktest+0x2df>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    33c3:	a1 d8 62 00 00       	mov    0x62d8,%eax
    33c8:	ff 75 e0             	pushl  -0x20(%ebp)
    33cb:	ff 75 f4             	pushl  -0xc(%ebp)
    33ce:	68 48 59 00 00       	push   $0x5948
    33d3:	50                   	push   %eax
    33d4:	e8 8a 0c 00 00       	call   4063 <printf>
    33d9:	83 c4 10             	add    $0x10,%esp
    exit();
    33dc:	e8 fb 0a 00 00       	call   3edc <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    33e1:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%ebp)
    33e8:	eb 76                	jmp    3460 <sbrktest+0x35e>
    ppid = getpid();
    33ea:	e8 6d 0b 00 00       	call   3f5c <getpid>
    33ef:	89 45 d0             	mov    %eax,-0x30(%ebp)
    pid = fork();
    33f2:	e8 dd 0a 00 00       	call   3ed4 <fork>
    33f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pid < 0){
    33fa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33fe:	79 1b                	jns    341b <sbrktest+0x319>
      printf(stdout, "fork failed\n");
    3400:	a1 d8 62 00 00       	mov    0x62d8,%eax
    3405:	83 ec 08             	sub    $0x8,%esp
    3408:	68 bd 44 00 00       	push   $0x44bd
    340d:	50                   	push   %eax
    340e:	e8 50 0c 00 00       	call   4063 <printf>
    3413:	83 c4 10             	add    $0x10,%esp
      exit();
    3416:	e8 c1 0a 00 00       	call   3edc <exit>
    }
    if(pid == 0){
    341b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    341f:	75 33                	jne    3454 <sbrktest+0x352>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3421:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3424:	0f b6 00             	movzbl (%eax),%eax
    3427:	0f be d0             	movsbl %al,%edx
    342a:	a1 d8 62 00 00       	mov    0x62d8,%eax
    342f:	52                   	push   %edx
    3430:	ff 75 f4             	pushl  -0xc(%ebp)
    3433:	68 69 59 00 00       	push   $0x5969
    3438:	50                   	push   %eax
    3439:	e8 25 0c 00 00       	call   4063 <printf>
    343e:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
    3441:	83 ec 0c             	sub    $0xc,%esp
    3444:	ff 75 d0             	pushl  -0x30(%ebp)
    3447:	e8 c0 0a 00 00       	call   3f0c <kill>
    344c:	83 c4 10             	add    $0x10,%esp
      exit();
    344f:	e8 88 0a 00 00       	call   3edc <exit>
    }
    wait();
    3454:	e8 8b 0a 00 00       	call   3ee4 <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3459:	81 45 f4 50 c3 00 00 	addl   $0xc350,-0xc(%ebp)
    3460:	81 7d f4 7f 84 1e 80 	cmpl   $0x801e847f,-0xc(%ebp)
    3467:	76 81                	jbe    33ea <sbrktest+0x2e8>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    3469:	83 ec 0c             	sub    $0xc,%esp
    346c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    346f:	50                   	push   %eax
    3470:	e8 77 0a 00 00       	call   3eec <pipe>
    3475:	83 c4 10             	add    $0x10,%esp
    3478:	85 c0                	test   %eax,%eax
    347a:	74 17                	je     3493 <sbrktest+0x391>
    printf(1, "pipe() failed\n");
    347c:	83 ec 08             	sub    $0x8,%esp
    347f:	68 8e 48 00 00       	push   $0x488e
    3484:	6a 01                	push   $0x1
    3486:	e8 d8 0b 00 00       	call   4063 <printf>
    348b:	83 c4 10             	add    $0x10,%esp
    exit();
    348e:	e8 49 0a 00 00       	call   3edc <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3493:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    349a:	e9 88 00 00 00       	jmp    3527 <sbrktest+0x425>
    if((pids[i] = fork()) == 0){
    349f:	e8 30 0a 00 00       	call   3ed4 <fork>
    34a4:	89 c2                	mov    %eax,%edx
    34a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34a9:	89 54 85 a0          	mov    %edx,-0x60(%ebp,%eax,4)
    34ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34b0:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    34b4:	85 c0                	test   %eax,%eax
    34b6:	75 4a                	jne    3502 <sbrktest+0x400>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    34b8:	83 ec 0c             	sub    $0xc,%esp
    34bb:	6a 00                	push   $0x0
    34bd:	e8 a2 0a 00 00       	call   3f64 <sbrk>
    34c2:	83 c4 10             	add    $0x10,%esp
    34c5:	ba 00 00 40 06       	mov    $0x6400000,%edx
    34ca:	29 c2                	sub    %eax,%edx
    34cc:	89 d0                	mov    %edx,%eax
    34ce:	83 ec 0c             	sub    $0xc,%esp
    34d1:	50                   	push   %eax
    34d2:	e8 8d 0a 00 00       	call   3f64 <sbrk>
    34d7:	83 c4 10             	add    $0x10,%esp
      write(fds[1], "x", 1);
    34da:	8b 45 cc             	mov    -0x34(%ebp),%eax
    34dd:	83 ec 04             	sub    $0x4,%esp
    34e0:	6a 01                	push   $0x1
    34e2:	68 f3 48 00 00       	push   $0x48f3
    34e7:	50                   	push   %eax
    34e8:	e8 0f 0a 00 00       	call   3efc <write>
    34ed:	83 c4 10             	add    $0x10,%esp
      // sit around until killed
      for(;;) sleep(1000);
    34f0:	83 ec 0c             	sub    $0xc,%esp
    34f3:	68 e8 03 00 00       	push   $0x3e8
    34f8:	e8 6f 0a 00 00       	call   3f6c <sleep>
    34fd:	83 c4 10             	add    $0x10,%esp
    3500:	eb ee                	jmp    34f0 <sbrktest+0x3ee>
    }
    if(pids[i] != -1)
    3502:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3505:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3509:	83 f8 ff             	cmp    $0xffffffff,%eax
    350c:	74 15                	je     3523 <sbrktest+0x421>
      read(fds[0], &scratch, 1);
    350e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3511:	83 ec 04             	sub    $0x4,%esp
    3514:	6a 01                	push   $0x1
    3516:	8d 55 9f             	lea    -0x61(%ebp),%edx
    3519:	52                   	push   %edx
    351a:	50                   	push   %eax
    351b:	e8 d4 09 00 00       	call   3ef4 <read>
    3520:	83 c4 10             	add    $0x10,%esp
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3523:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3527:	8b 45 f0             	mov    -0x10(%ebp),%eax
    352a:	83 f8 09             	cmp    $0x9,%eax
    352d:	0f 86 6c ff ff ff    	jbe    349f <sbrktest+0x39d>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3533:	83 ec 0c             	sub    $0xc,%esp
    3536:	68 00 10 00 00       	push   $0x1000
    353b:	e8 24 0a 00 00       	call   3f64 <sbrk>
    3540:	83 c4 10             	add    $0x10,%esp
    3543:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3546:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    354d:	eb 2b                	jmp    357a <sbrktest+0x478>
    if(pids[i] == -1)
    354f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3552:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3556:	83 f8 ff             	cmp    $0xffffffff,%eax
    3559:	74 1a                	je     3575 <sbrktest+0x473>
      continue;
    kill(pids[i]);
    355b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    355e:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3562:	83 ec 0c             	sub    $0xc,%esp
    3565:	50                   	push   %eax
    3566:	e8 a1 09 00 00       	call   3f0c <kill>
    356b:	83 c4 10             	add    $0x10,%esp
    wait();
    356e:	e8 71 09 00 00       	call   3ee4 <wait>
    3573:	eb 01                	jmp    3576 <sbrktest+0x474>
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
      continue;
    3575:	90                   	nop
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3576:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    357a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    357d:	83 f8 09             	cmp    $0x9,%eax
    3580:	76 cd                	jbe    354f <sbrktest+0x44d>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    3582:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    3586:	75 1b                	jne    35a3 <sbrktest+0x4a1>
    printf(stdout, "failed sbrk leaked memory\n");
    3588:	a1 d8 62 00 00       	mov    0x62d8,%eax
    358d:	83 ec 08             	sub    $0x8,%esp
    3590:	68 82 59 00 00       	push   $0x5982
    3595:	50                   	push   %eax
    3596:	e8 c8 0a 00 00       	call   4063 <printf>
    359b:	83 c4 10             	add    $0x10,%esp
    exit();
    359e:	e8 39 09 00 00       	call   3edc <exit>
  }

  if(sbrk(0) > oldbrk)
    35a3:	83 ec 0c             	sub    $0xc,%esp
    35a6:	6a 00                	push   $0x0
    35a8:	e8 b7 09 00 00       	call   3f64 <sbrk>
    35ad:	83 c4 10             	add    $0x10,%esp
    35b0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    35b3:	76 20                	jbe    35d5 <sbrktest+0x4d3>
    sbrk(-(sbrk(0) - oldbrk));
    35b5:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    35b8:	83 ec 0c             	sub    $0xc,%esp
    35bb:	6a 00                	push   $0x0
    35bd:	e8 a2 09 00 00       	call   3f64 <sbrk>
    35c2:	83 c4 10             	add    $0x10,%esp
    35c5:	29 c3                	sub    %eax,%ebx
    35c7:	89 d8                	mov    %ebx,%eax
    35c9:	83 ec 0c             	sub    $0xc,%esp
    35cc:	50                   	push   %eax
    35cd:	e8 92 09 00 00       	call   3f64 <sbrk>
    35d2:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    35d5:	a1 d8 62 00 00       	mov    0x62d8,%eax
    35da:	83 ec 08             	sub    $0x8,%esp
    35dd:	68 9d 59 00 00       	push   $0x599d
    35e2:	50                   	push   %eax
    35e3:	e8 7b 0a 00 00       	call   4063 <printf>
    35e8:	83 c4 10             	add    $0x10,%esp
}
    35eb:	90                   	nop
    35ec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    35ef:	c9                   	leave  
    35f0:	c3                   	ret    

000035f1 <validateint>:

void
validateint(int *p)
{
    35f1:	55                   	push   %ebp
    35f2:	89 e5                	mov    %esp,%ebp
    35f4:	53                   	push   %ebx
    35f5:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    35f8:	b8 0d 00 00 00       	mov    $0xd,%eax
    35fd:	8b 55 08             	mov    0x8(%ebp),%edx
    3600:	89 d1                	mov    %edx,%ecx
    3602:	89 e3                	mov    %esp,%ebx
    3604:	89 cc                	mov    %ecx,%esp
    3606:	cd 40                	int    $0x40
    3608:	89 dc                	mov    %ebx,%esp
    360a:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    360d:	90                   	nop
    360e:	83 c4 10             	add    $0x10,%esp
    3611:	5b                   	pop    %ebx
    3612:	5d                   	pop    %ebp
    3613:	c3                   	ret    

00003614 <validatetest>:

void
validatetest(void)
{
    3614:	55                   	push   %ebp
    3615:	89 e5                	mov    %esp,%ebp
    3617:	83 ec 18             	sub    $0x18,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    361a:	a1 d8 62 00 00       	mov    0x62d8,%eax
    361f:	83 ec 08             	sub    $0x8,%esp
    3622:	68 ab 59 00 00       	push   $0x59ab
    3627:	50                   	push   %eax
    3628:	e8 36 0a 00 00       	call   4063 <printf>
    362d:	83 c4 10             	add    $0x10,%esp
  hi = 1100*1024;
    3630:	c7 45 f0 00 30 11 00 	movl   $0x113000,-0x10(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    3637:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    363e:	e9 8a 00 00 00       	jmp    36cd <validatetest+0xb9>
    if((pid = fork()) == 0){
    3643:	e8 8c 08 00 00       	call   3ed4 <fork>
    3648:	89 45 ec             	mov    %eax,-0x14(%ebp)
    364b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    364f:	75 14                	jne    3665 <validatetest+0x51>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    3651:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3654:	83 ec 0c             	sub    $0xc,%esp
    3657:	50                   	push   %eax
    3658:	e8 94 ff ff ff       	call   35f1 <validateint>
    365d:	83 c4 10             	add    $0x10,%esp
      exit();
    3660:	e8 77 08 00 00       	call   3edc <exit>
    }
    sleep(0);
    3665:	83 ec 0c             	sub    $0xc,%esp
    3668:	6a 00                	push   $0x0
    366a:	e8 fd 08 00 00       	call   3f6c <sleep>
    366f:	83 c4 10             	add    $0x10,%esp
    sleep(0);
    3672:	83 ec 0c             	sub    $0xc,%esp
    3675:	6a 00                	push   $0x0
    3677:	e8 f0 08 00 00       	call   3f6c <sleep>
    367c:	83 c4 10             	add    $0x10,%esp
    kill(pid);
    367f:	83 ec 0c             	sub    $0xc,%esp
    3682:	ff 75 ec             	pushl  -0x14(%ebp)
    3685:	e8 82 08 00 00       	call   3f0c <kill>
    368a:	83 c4 10             	add    $0x10,%esp
    wait();
    368d:	e8 52 08 00 00       	call   3ee4 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    3692:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3695:	83 ec 08             	sub    $0x8,%esp
    3698:	50                   	push   %eax
    3699:	68 ba 59 00 00       	push   $0x59ba
    369e:	e8 99 08 00 00       	call   3f3c <link>
    36a3:	83 c4 10             	add    $0x10,%esp
    36a6:	83 f8 ff             	cmp    $0xffffffff,%eax
    36a9:	74 1b                	je     36c6 <validatetest+0xb2>
      printf(stdout, "link should not succeed\n");
    36ab:	a1 d8 62 00 00       	mov    0x62d8,%eax
    36b0:	83 ec 08             	sub    $0x8,%esp
    36b3:	68 c5 59 00 00       	push   $0x59c5
    36b8:	50                   	push   %eax
    36b9:	e8 a5 09 00 00       	call   4063 <printf>
    36be:	83 c4 10             	add    $0x10,%esp
      exit();
    36c1:	e8 16 08 00 00       	call   3edc <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    36c6:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    36cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36d0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    36d3:	0f 86 6a ff ff ff    	jbe    3643 <validatetest+0x2f>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    36d9:	a1 d8 62 00 00       	mov    0x62d8,%eax
    36de:	83 ec 08             	sub    $0x8,%esp
    36e1:	68 de 59 00 00       	push   $0x59de
    36e6:	50                   	push   %eax
    36e7:	e8 77 09 00 00       	call   4063 <printf>
    36ec:	83 c4 10             	add    $0x10,%esp
}
    36ef:	90                   	nop
    36f0:	c9                   	leave  
    36f1:	c3                   	ret    

000036f2 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    36f2:	55                   	push   %ebp
    36f3:	89 e5                	mov    %esp,%ebp
    36f5:	83 ec 18             	sub    $0x18,%esp
  int i;

  printf(stdout, "bss test\n");
    36f8:	a1 d8 62 00 00       	mov    0x62d8,%eax
    36fd:	83 ec 08             	sub    $0x8,%esp
    3700:	68 eb 59 00 00       	push   $0x59eb
    3705:	50                   	push   %eax
    3706:	e8 58 09 00 00       	call   4063 <printf>
    370b:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    370e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3715:	eb 2e                	jmp    3745 <bsstest+0x53>
    if(uninit[i] != '\0'){
    3717:	8b 45 f4             	mov    -0xc(%ebp),%eax
    371a:	05 a0 63 00 00       	add    $0x63a0,%eax
    371f:	0f b6 00             	movzbl (%eax),%eax
    3722:	84 c0                	test   %al,%al
    3724:	74 1b                	je     3741 <bsstest+0x4f>
      printf(stdout, "bss test failed\n");
    3726:	a1 d8 62 00 00       	mov    0x62d8,%eax
    372b:	83 ec 08             	sub    $0x8,%esp
    372e:	68 f5 59 00 00       	push   $0x59f5
    3733:	50                   	push   %eax
    3734:	e8 2a 09 00 00       	call   4063 <printf>
    3739:	83 c4 10             	add    $0x10,%esp
      exit();
    373c:	e8 9b 07 00 00       	call   3edc <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3741:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3745:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3748:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    374d:	76 c8                	jbe    3717 <bsstest+0x25>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    374f:	a1 d8 62 00 00       	mov    0x62d8,%eax
    3754:	83 ec 08             	sub    $0x8,%esp
    3757:	68 06 5a 00 00       	push   $0x5a06
    375c:	50                   	push   %eax
    375d:	e8 01 09 00 00       	call   4063 <printf>
    3762:	83 c4 10             	add    $0x10,%esp
}
    3765:	90                   	nop
    3766:	c9                   	leave  
    3767:	c3                   	ret    

00003768 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3768:	55                   	push   %ebp
    3769:	89 e5                	mov    %esp,%ebp
    376b:	83 ec 18             	sub    $0x18,%esp
  int pid, fd;

  unlink("bigarg-ok");
    376e:	83 ec 0c             	sub    $0xc,%esp
    3771:	68 13 5a 00 00       	push   $0x5a13
    3776:	e8 b1 07 00 00       	call   3f2c <unlink>
    377b:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    377e:	e8 51 07 00 00       	call   3ed4 <fork>
    3783:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid == 0){
    3786:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    378a:	0f 85 97 00 00 00    	jne    3827 <bigargtest+0xbf>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    3790:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3797:	eb 12                	jmp    37ab <bigargtest+0x43>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3799:	8b 45 f4             	mov    -0xc(%ebp),%eax
    379c:	c7 04 85 00 63 00 00 	movl   $0x5a20,0x6300(,%eax,4)
    37a3:	20 5a 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    37a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    37ab:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    37af:	7e e8                	jle    3799 <bigargtest+0x31>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    37b1:	c7 05 7c 63 00 00 00 	movl   $0x0,0x637c
    37b8:	00 00 00 
    printf(stdout, "bigarg test\n");
    37bb:	a1 d8 62 00 00       	mov    0x62d8,%eax
    37c0:	83 ec 08             	sub    $0x8,%esp
    37c3:	68 fd 5a 00 00       	push   $0x5afd
    37c8:	50                   	push   %eax
    37c9:	e8 95 08 00 00       	call   4063 <printf>
    37ce:	83 c4 10             	add    $0x10,%esp
    exec("echo", args);
    37d1:	83 ec 08             	sub    $0x8,%esp
    37d4:	68 00 63 00 00       	push   $0x6300
    37d9:	68 1c 44 00 00       	push   $0x441c
    37de:	e8 31 07 00 00       	call   3f14 <exec>
    37e3:	83 c4 10             	add    $0x10,%esp
    printf(stdout, "bigarg test ok\n");
    37e6:	a1 d8 62 00 00       	mov    0x62d8,%eax
    37eb:	83 ec 08             	sub    $0x8,%esp
    37ee:	68 0a 5b 00 00       	push   $0x5b0a
    37f3:	50                   	push   %eax
    37f4:	e8 6a 08 00 00       	call   4063 <printf>
    37f9:	83 c4 10             	add    $0x10,%esp
    fd = open("bigarg-ok", O_CREATE);
    37fc:	83 ec 08             	sub    $0x8,%esp
    37ff:	68 00 02 00 00       	push   $0x200
    3804:	68 13 5a 00 00       	push   $0x5a13
    3809:	e8 0e 07 00 00       	call   3f1c <open>
    380e:	83 c4 10             	add    $0x10,%esp
    3811:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(fd);
    3814:	83 ec 0c             	sub    $0xc,%esp
    3817:	ff 75 ec             	pushl  -0x14(%ebp)
    381a:	e8 e5 06 00 00       	call   3f04 <close>
    381f:	83 c4 10             	add    $0x10,%esp
    exit();
    3822:	e8 b5 06 00 00       	call   3edc <exit>
  } else if(pid < 0){
    3827:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    382b:	79 1b                	jns    3848 <bigargtest+0xe0>
    printf(stdout, "bigargtest: fork failed\n");
    382d:	a1 d8 62 00 00       	mov    0x62d8,%eax
    3832:	83 ec 08             	sub    $0x8,%esp
    3835:	68 1a 5b 00 00       	push   $0x5b1a
    383a:	50                   	push   %eax
    383b:	e8 23 08 00 00       	call   4063 <printf>
    3840:	83 c4 10             	add    $0x10,%esp
    exit();
    3843:	e8 94 06 00 00       	call   3edc <exit>
  }
  wait();
    3848:	e8 97 06 00 00       	call   3ee4 <wait>
  fd = open("bigarg-ok", 0);
    384d:	83 ec 08             	sub    $0x8,%esp
    3850:	6a 00                	push   $0x0
    3852:	68 13 5a 00 00       	push   $0x5a13
    3857:	e8 c0 06 00 00       	call   3f1c <open>
    385c:	83 c4 10             	add    $0x10,%esp
    385f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    3862:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3866:	79 1b                	jns    3883 <bigargtest+0x11b>
    printf(stdout, "bigarg test failed!\n");
    3868:	a1 d8 62 00 00       	mov    0x62d8,%eax
    386d:	83 ec 08             	sub    $0x8,%esp
    3870:	68 33 5b 00 00       	push   $0x5b33
    3875:	50                   	push   %eax
    3876:	e8 e8 07 00 00       	call   4063 <printf>
    387b:	83 c4 10             	add    $0x10,%esp
    exit();
    387e:	e8 59 06 00 00       	call   3edc <exit>
  }
  close(fd);
    3883:	83 ec 0c             	sub    $0xc,%esp
    3886:	ff 75 ec             	pushl  -0x14(%ebp)
    3889:	e8 76 06 00 00       	call   3f04 <close>
    388e:	83 c4 10             	add    $0x10,%esp
  unlink("bigarg-ok");
    3891:	83 ec 0c             	sub    $0xc,%esp
    3894:	68 13 5a 00 00       	push   $0x5a13
    3899:	e8 8e 06 00 00       	call   3f2c <unlink>
    389e:	83 c4 10             	add    $0x10,%esp
}
    38a1:	90                   	nop
    38a2:	c9                   	leave  
    38a3:	c3                   	ret    

000038a4 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    38a4:	55                   	push   %ebp
    38a5:	89 e5                	mov    %esp,%ebp
    38a7:	53                   	push   %ebx
    38a8:	83 ec 64             	sub    $0x64,%esp
  int nfiles;
  int fsblocks = 0;
    38ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  printf(1, "fsfull test\n");
    38b2:	83 ec 08             	sub    $0x8,%esp
    38b5:	68 48 5b 00 00       	push   $0x5b48
    38ba:	6a 01                	push   $0x1
    38bc:	e8 a2 07 00 00       	call   4063 <printf>
    38c1:	83 c4 10             	add    $0x10,%esp

  for(nfiles = 0; ; nfiles++){
    38c4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char name[64];
    name[0] = 'f';
    38cb:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    38cf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    38d2:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    38d7:	89 c8                	mov    %ecx,%eax
    38d9:	f7 ea                	imul   %edx
    38db:	c1 fa 06             	sar    $0x6,%edx
    38de:	89 c8                	mov    %ecx,%eax
    38e0:	c1 f8 1f             	sar    $0x1f,%eax
    38e3:	29 c2                	sub    %eax,%edx
    38e5:	89 d0                	mov    %edx,%eax
    38e7:	83 c0 30             	add    $0x30,%eax
    38ea:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    38ed:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    38f0:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    38f5:	89 d8                	mov    %ebx,%eax
    38f7:	f7 ea                	imul   %edx
    38f9:	c1 fa 06             	sar    $0x6,%edx
    38fc:	89 d8                	mov    %ebx,%eax
    38fe:	c1 f8 1f             	sar    $0x1f,%eax
    3901:	89 d1                	mov    %edx,%ecx
    3903:	29 c1                	sub    %eax,%ecx
    3905:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    390b:	29 c3                	sub    %eax,%ebx
    390d:	89 d9                	mov    %ebx,%ecx
    390f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3914:	89 c8                	mov    %ecx,%eax
    3916:	f7 ea                	imul   %edx
    3918:	c1 fa 05             	sar    $0x5,%edx
    391b:	89 c8                	mov    %ecx,%eax
    391d:	c1 f8 1f             	sar    $0x1f,%eax
    3920:	29 c2                	sub    %eax,%edx
    3922:	89 d0                	mov    %edx,%eax
    3924:	83 c0 30             	add    $0x30,%eax
    3927:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    392a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    392d:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3932:	89 d8                	mov    %ebx,%eax
    3934:	f7 ea                	imul   %edx
    3936:	c1 fa 05             	sar    $0x5,%edx
    3939:	89 d8                	mov    %ebx,%eax
    393b:	c1 f8 1f             	sar    $0x1f,%eax
    393e:	89 d1                	mov    %edx,%ecx
    3940:	29 c1                	sub    %eax,%ecx
    3942:	6b c1 64             	imul   $0x64,%ecx,%eax
    3945:	29 c3                	sub    %eax,%ebx
    3947:	89 d9                	mov    %ebx,%ecx
    3949:	ba 67 66 66 66       	mov    $0x66666667,%edx
    394e:	89 c8                	mov    %ecx,%eax
    3950:	f7 ea                	imul   %edx
    3952:	c1 fa 02             	sar    $0x2,%edx
    3955:	89 c8                	mov    %ecx,%eax
    3957:	c1 f8 1f             	sar    $0x1f,%eax
    395a:	29 c2                	sub    %eax,%edx
    395c:	89 d0                	mov    %edx,%eax
    395e:	83 c0 30             	add    $0x30,%eax
    3961:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3964:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3967:	ba 67 66 66 66       	mov    $0x66666667,%edx
    396c:	89 c8                	mov    %ecx,%eax
    396e:	f7 ea                	imul   %edx
    3970:	c1 fa 02             	sar    $0x2,%edx
    3973:	89 c8                	mov    %ecx,%eax
    3975:	c1 f8 1f             	sar    $0x1f,%eax
    3978:	29 c2                	sub    %eax,%edx
    397a:	89 d0                	mov    %edx,%eax
    397c:	c1 e0 02             	shl    $0x2,%eax
    397f:	01 d0                	add    %edx,%eax
    3981:	01 c0                	add    %eax,%eax
    3983:	29 c1                	sub    %eax,%ecx
    3985:	89 ca                	mov    %ecx,%edx
    3987:	89 d0                	mov    %edx,%eax
    3989:	83 c0 30             	add    $0x30,%eax
    398c:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    398f:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    3993:	83 ec 04             	sub    $0x4,%esp
    3996:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3999:	50                   	push   %eax
    399a:	68 55 5b 00 00       	push   $0x5b55
    399f:	6a 01                	push   $0x1
    39a1:	e8 bd 06 00 00       	call   4063 <printf>
    39a6:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    39a9:	83 ec 08             	sub    $0x8,%esp
    39ac:	68 02 02 00 00       	push   $0x202
    39b1:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    39b4:	50                   	push   %eax
    39b5:	e8 62 05 00 00       	call   3f1c <open>
    39ba:	83 c4 10             	add    $0x10,%esp
    39bd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    39c0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    39c4:	79 18                	jns    39de <fsfull+0x13a>
      printf(1, "open %s failed\n", name);
    39c6:	83 ec 04             	sub    $0x4,%esp
    39c9:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    39cc:	50                   	push   %eax
    39cd:	68 61 5b 00 00       	push   $0x5b61
    39d2:	6a 01                	push   $0x1
    39d4:	e8 8a 06 00 00       	call   4063 <printf>
    39d9:	83 c4 10             	add    $0x10,%esp
      break;
    39dc:	eb 6b                	jmp    3a49 <fsfull+0x1a5>
    }
    int total = 0;
    39de:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    39e5:	83 ec 04             	sub    $0x4,%esp
    39e8:	68 00 02 00 00       	push   $0x200
    39ed:	68 c0 8a 00 00       	push   $0x8ac0
    39f2:	ff 75 e8             	pushl  -0x18(%ebp)
    39f5:	e8 02 05 00 00       	call   3efc <write>
    39fa:	83 c4 10             	add    $0x10,%esp
    39fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(cc < 512)
    3a00:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
    3a07:	7e 0c                	jle    3a15 <fsfull+0x171>
        break;
      total += cc;
    3a09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a0c:	01 45 ec             	add    %eax,-0x14(%ebp)
      fsblocks++;
    3a0f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    3a13:	eb d0                	jmp    39e5 <fsfull+0x141>
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
    3a15:	90                   	nop
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3a16:	83 ec 04             	sub    $0x4,%esp
    3a19:	ff 75 ec             	pushl  -0x14(%ebp)
    3a1c:	68 71 5b 00 00       	push   $0x5b71
    3a21:	6a 01                	push   $0x1
    3a23:	e8 3b 06 00 00       	call   4063 <printf>
    3a28:	83 c4 10             	add    $0x10,%esp
    close(fd);
    3a2b:	83 ec 0c             	sub    $0xc,%esp
    3a2e:	ff 75 e8             	pushl  -0x18(%ebp)
    3a31:	e8 ce 04 00 00       	call   3f04 <close>
    3a36:	83 c4 10             	add    $0x10,%esp
    if(total == 0)
    3a39:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3a3d:	74 09                	je     3a48 <fsfull+0x1a4>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3a3f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3a43:	e9 83 fe ff ff       	jmp    38cb <fsfull+0x27>
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
    3a48:	90                   	nop
  }

  while(nfiles >= 0){
    3a49:	e9 db 00 00 00       	jmp    3b29 <fsfull+0x285>
    char name[64];
    name[0] = 'f';
    3a4e:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3a52:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3a55:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3a5a:	89 c8                	mov    %ecx,%eax
    3a5c:	f7 ea                	imul   %edx
    3a5e:	c1 fa 06             	sar    $0x6,%edx
    3a61:	89 c8                	mov    %ecx,%eax
    3a63:	c1 f8 1f             	sar    $0x1f,%eax
    3a66:	29 c2                	sub    %eax,%edx
    3a68:	89 d0                	mov    %edx,%eax
    3a6a:	83 c0 30             	add    $0x30,%eax
    3a6d:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3a70:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3a73:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3a78:	89 d8                	mov    %ebx,%eax
    3a7a:	f7 ea                	imul   %edx
    3a7c:	c1 fa 06             	sar    $0x6,%edx
    3a7f:	89 d8                	mov    %ebx,%eax
    3a81:	c1 f8 1f             	sar    $0x1f,%eax
    3a84:	89 d1                	mov    %edx,%ecx
    3a86:	29 c1                	sub    %eax,%ecx
    3a88:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3a8e:	29 c3                	sub    %eax,%ebx
    3a90:	89 d9                	mov    %ebx,%ecx
    3a92:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3a97:	89 c8                	mov    %ecx,%eax
    3a99:	f7 ea                	imul   %edx
    3a9b:	c1 fa 05             	sar    $0x5,%edx
    3a9e:	89 c8                	mov    %ecx,%eax
    3aa0:	c1 f8 1f             	sar    $0x1f,%eax
    3aa3:	29 c2                	sub    %eax,%edx
    3aa5:	89 d0                	mov    %edx,%eax
    3aa7:	83 c0 30             	add    $0x30,%eax
    3aaa:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3aad:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3ab0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3ab5:	89 d8                	mov    %ebx,%eax
    3ab7:	f7 ea                	imul   %edx
    3ab9:	c1 fa 05             	sar    $0x5,%edx
    3abc:	89 d8                	mov    %ebx,%eax
    3abe:	c1 f8 1f             	sar    $0x1f,%eax
    3ac1:	89 d1                	mov    %edx,%ecx
    3ac3:	29 c1                	sub    %eax,%ecx
    3ac5:	6b c1 64             	imul   $0x64,%ecx,%eax
    3ac8:	29 c3                	sub    %eax,%ebx
    3aca:	89 d9                	mov    %ebx,%ecx
    3acc:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3ad1:	89 c8                	mov    %ecx,%eax
    3ad3:	f7 ea                	imul   %edx
    3ad5:	c1 fa 02             	sar    $0x2,%edx
    3ad8:	89 c8                	mov    %ecx,%eax
    3ada:	c1 f8 1f             	sar    $0x1f,%eax
    3add:	29 c2                	sub    %eax,%edx
    3adf:	89 d0                	mov    %edx,%eax
    3ae1:	83 c0 30             	add    $0x30,%eax
    3ae4:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3ae7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3aea:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3aef:	89 c8                	mov    %ecx,%eax
    3af1:	f7 ea                	imul   %edx
    3af3:	c1 fa 02             	sar    $0x2,%edx
    3af6:	89 c8                	mov    %ecx,%eax
    3af8:	c1 f8 1f             	sar    $0x1f,%eax
    3afb:	29 c2                	sub    %eax,%edx
    3afd:	89 d0                	mov    %edx,%eax
    3aff:	c1 e0 02             	shl    $0x2,%eax
    3b02:	01 d0                	add    %edx,%eax
    3b04:	01 c0                	add    %eax,%eax
    3b06:	29 c1                	sub    %eax,%ecx
    3b08:	89 ca                	mov    %ecx,%edx
    3b0a:	89 d0                	mov    %edx,%eax
    3b0c:	83 c0 30             	add    $0x30,%eax
    3b0f:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3b12:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    3b16:	83 ec 0c             	sub    $0xc,%esp
    3b19:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3b1c:	50                   	push   %eax
    3b1d:	e8 0a 04 00 00       	call   3f2c <unlink>
    3b22:	83 c4 10             	add    $0x10,%esp
    nfiles--;
    3b25:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3b29:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b2d:	0f 89 1b ff ff ff    	jns    3a4e <fsfull+0x1aa>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3b33:	83 ec 08             	sub    $0x8,%esp
    3b36:	68 81 5b 00 00       	push   $0x5b81
    3b3b:	6a 01                	push   $0x1
    3b3d:	e8 21 05 00 00       	call   4063 <printf>
    3b42:	83 c4 10             	add    $0x10,%esp
}
    3b45:	90                   	nop
    3b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b49:	c9                   	leave  
    3b4a:	c3                   	ret    

00003b4b <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    3b4b:	55                   	push   %ebp
    3b4c:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    3b4e:	a1 dc 62 00 00       	mov    0x62dc,%eax
    3b53:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    3b59:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3b5e:	a3 dc 62 00 00       	mov    %eax,0x62dc
  return randstate;
    3b63:	a1 dc 62 00 00       	mov    0x62dc,%eax
}
    3b68:	5d                   	pop    %ebp
    3b69:	c3                   	ret    

00003b6a <main>:

int
main(int argc, char *argv[])
{
    3b6a:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3b6e:	83 e4 f0             	and    $0xfffffff0,%esp
    3b71:	ff 71 fc             	pushl  -0x4(%ecx)
    3b74:	55                   	push   %ebp
    3b75:	89 e5                	mov    %esp,%ebp
    3b77:	51                   	push   %ecx
    3b78:	83 ec 04             	sub    $0x4,%esp
  printf(1, "usertests starting\n");
    3b7b:	83 ec 08             	sub    $0x8,%esp
    3b7e:	68 97 5b 00 00       	push   $0x5b97
    3b83:	6a 01                	push   $0x1
    3b85:	e8 d9 04 00 00       	call   4063 <printf>
    3b8a:	83 c4 10             	add    $0x10,%esp

  if(open("usertests.ran", 0) >= 0){
    3b8d:	83 ec 08             	sub    $0x8,%esp
    3b90:	6a 00                	push   $0x0
    3b92:	68 ab 5b 00 00       	push   $0x5bab
    3b97:	e8 80 03 00 00       	call   3f1c <open>
    3b9c:	83 c4 10             	add    $0x10,%esp
    3b9f:	85 c0                	test   %eax,%eax
    3ba1:	78 17                	js     3bba <main+0x50>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3ba3:	83 ec 08             	sub    $0x8,%esp
    3ba6:	68 bc 5b 00 00       	push   $0x5bbc
    3bab:	6a 01                	push   $0x1
    3bad:	e8 b1 04 00 00       	call   4063 <printf>
    3bb2:	83 c4 10             	add    $0x10,%esp
    exit();
    3bb5:	e8 22 03 00 00       	call   3edc <exit>
  }
  close(open("usertests.ran", O_CREATE));
    3bba:	83 ec 08             	sub    $0x8,%esp
    3bbd:	68 00 02 00 00       	push   $0x200
    3bc2:	68 ab 5b 00 00       	push   $0x5bab
    3bc7:	e8 50 03 00 00       	call   3f1c <open>
    3bcc:	83 c4 10             	add    $0x10,%esp
    3bcf:	83 ec 0c             	sub    $0xc,%esp
    3bd2:	50                   	push   %eax
    3bd3:	e8 2c 03 00 00       	call   3f04 <close>
    3bd8:	83 c4 10             	add    $0x10,%esp

  createdelete();
    3bdb:	e8 ca d6 ff ff       	call   12aa <createdelete>
  linkunlink();
    3be0:	e8 f8 e0 ff ff       	call   1cdd <linkunlink>
  concreate();
    3be5:	e8 43 dd ff ff       	call   192d <concreate>
  fourfiles();
    3bea:	e8 6a d4 ff ff       	call   1059 <fourfiles>
  sharedfd();
    3bef:	e8 82 d2 ff ff       	call   e76 <sharedfd>

  bigargtest();
    3bf4:	e8 6f fb ff ff       	call   3768 <bigargtest>
  bigwrite();
    3bf9:	e8 d1 ea ff ff       	call   26cf <bigwrite>
  bigargtest();
    3bfe:	e8 65 fb ff ff       	call   3768 <bigargtest>
  bsstest();
    3c03:	e8 ea fa ff ff       	call   36f2 <bsstest>
  sbrktest();
    3c08:	e8 f5 f4 ff ff       	call   3102 <sbrktest>
  validatetest();
    3c0d:	e8 02 fa ff ff       	call   3614 <validatetest>

  opentest();
    3c12:	e8 e8 c6 ff ff       	call   2ff <opentest>
  writetest();
    3c17:	e8 92 c7 ff ff       	call   3ae <writetest>
  writetest1();
    3c1c:	e8 9d c9 ff ff       	call   5be <writetest1>
  createtest();
    3c21:	e8 94 cb ff ff       	call   7ba <createtest>

  openiputtest();
    3c26:	e8 c5 c5 ff ff       	call   1f0 <openiputtest>
  exitiputtest();
    3c2b:	e8 c1 c4 ff ff       	call   f1 <exitiputtest>
  iputtest();
    3c30:	e8 cb c3 ff ff       	call   0 <iputtest>

  mem();
    3c35:	e8 4b d1 ff ff       	call   d85 <mem>
  pipe1();
    3c3a:	e8 82 cd ff ff       	call   9c1 <pipe1>
  preempt();
    3c3f:	e8 66 cf ff ff       	call   baa <preempt>
  exitwait();
    3c44:	e8 c4 d0 ff ff       	call   d0d <exitwait>

  rmdot();
    3c49:	e8 f3 ee ff ff       	call   2b41 <rmdot>
  fourteen();
    3c4e:	e8 92 ed ff ff       	call   29e5 <fourteen>
  bigfile();
    3c53:	e8 75 eb ff ff       	call   27cd <bigfile>
  subdir();
    3c58:	e8 2e e3 ff ff       	call   1f8b <subdir>
  linktest();
    3c5d:	e8 89 da ff ff       	call   16eb <linktest>
  unlinkread();
    3c62:	e8 c2 d8 ff ff       	call   1529 <unlinkread>
  dirfile();
    3c67:	e8 5a f0 ff ff       	call   2cc6 <dirfile>
  iref();
    3c6c:	e8 8d f2 ff ff       	call   2efe <iref>
  forktest();
    3c71:	e8 c2 f3 ff ff       	call   3038 <forktest>
  bigdir(); // slow
    3c76:	e8 9b e1 ff ff       	call   1e16 <bigdir>
  exectest();
    3c7b:	e8 ee cc ff ff       	call   96e <exectest>

  exit();
    3c80:	e8 57 02 00 00       	call   3edc <exit>

00003c85 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3c85:	55                   	push   %ebp
    3c86:	89 e5                	mov    %esp,%ebp
    3c88:	57                   	push   %edi
    3c89:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3c8a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3c8d:	8b 55 10             	mov    0x10(%ebp),%edx
    3c90:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c93:	89 cb                	mov    %ecx,%ebx
    3c95:	89 df                	mov    %ebx,%edi
    3c97:	89 d1                	mov    %edx,%ecx
    3c99:	fc                   	cld    
    3c9a:	f3 aa                	rep stos %al,%es:(%edi)
    3c9c:	89 ca                	mov    %ecx,%edx
    3c9e:	89 fb                	mov    %edi,%ebx
    3ca0:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3ca3:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3ca6:	90                   	nop
    3ca7:	5b                   	pop    %ebx
    3ca8:	5f                   	pop    %edi
    3ca9:	5d                   	pop    %ebp
    3caa:	c3                   	ret    

00003cab <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3cab:	55                   	push   %ebp
    3cac:	89 e5                	mov    %esp,%ebp
    3cae:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3cb1:	8b 45 08             	mov    0x8(%ebp),%eax
    3cb4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3cb7:	90                   	nop
    3cb8:	8b 45 08             	mov    0x8(%ebp),%eax
    3cbb:	8d 50 01             	lea    0x1(%eax),%edx
    3cbe:	89 55 08             	mov    %edx,0x8(%ebp)
    3cc1:	8b 55 0c             	mov    0xc(%ebp),%edx
    3cc4:	8d 4a 01             	lea    0x1(%edx),%ecx
    3cc7:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3cca:	0f b6 12             	movzbl (%edx),%edx
    3ccd:	88 10                	mov    %dl,(%eax)
    3ccf:	0f b6 00             	movzbl (%eax),%eax
    3cd2:	84 c0                	test   %al,%al
    3cd4:	75 e2                	jne    3cb8 <strcpy+0xd>
    ;
  return os;
    3cd6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3cd9:	c9                   	leave  
    3cda:	c3                   	ret    

00003cdb <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3cdb:	55                   	push   %ebp
    3cdc:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3cde:	eb 08                	jmp    3ce8 <strcmp+0xd>
    p++, q++;
    3ce0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3ce4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3ce8:	8b 45 08             	mov    0x8(%ebp),%eax
    3ceb:	0f b6 00             	movzbl (%eax),%eax
    3cee:	84 c0                	test   %al,%al
    3cf0:	74 10                	je     3d02 <strcmp+0x27>
    3cf2:	8b 45 08             	mov    0x8(%ebp),%eax
    3cf5:	0f b6 10             	movzbl (%eax),%edx
    3cf8:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cfb:	0f b6 00             	movzbl (%eax),%eax
    3cfe:	38 c2                	cmp    %al,%dl
    3d00:	74 de                	je     3ce0 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3d02:	8b 45 08             	mov    0x8(%ebp),%eax
    3d05:	0f b6 00             	movzbl (%eax),%eax
    3d08:	0f b6 d0             	movzbl %al,%edx
    3d0b:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d0e:	0f b6 00             	movzbl (%eax),%eax
    3d11:	0f b6 c0             	movzbl %al,%eax
    3d14:	29 c2                	sub    %eax,%edx
    3d16:	89 d0                	mov    %edx,%eax
}
    3d18:	5d                   	pop    %ebp
    3d19:	c3                   	ret    

00003d1a <strlen>:

uint
strlen(char *s)
{
    3d1a:	55                   	push   %ebp
    3d1b:	89 e5                	mov    %esp,%ebp
    3d1d:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3d20:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3d27:	eb 04                	jmp    3d2d <strlen+0x13>
    3d29:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3d2d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3d30:	8b 45 08             	mov    0x8(%ebp),%eax
    3d33:	01 d0                	add    %edx,%eax
    3d35:	0f b6 00             	movzbl (%eax),%eax
    3d38:	84 c0                	test   %al,%al
    3d3a:	75 ed                	jne    3d29 <strlen+0xf>
    ;
  return n;
    3d3c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3d3f:	c9                   	leave  
    3d40:	c3                   	ret    

00003d41 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3d41:	55                   	push   %ebp
    3d42:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    3d44:	8b 45 10             	mov    0x10(%ebp),%eax
    3d47:	50                   	push   %eax
    3d48:	ff 75 0c             	pushl  0xc(%ebp)
    3d4b:	ff 75 08             	pushl  0x8(%ebp)
    3d4e:	e8 32 ff ff ff       	call   3c85 <stosb>
    3d53:	83 c4 0c             	add    $0xc,%esp
  return dst;
    3d56:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3d59:	c9                   	leave  
    3d5a:	c3                   	ret    

00003d5b <strchr>:

char*
strchr(const char *s, char c)
{
    3d5b:	55                   	push   %ebp
    3d5c:	89 e5                	mov    %esp,%ebp
    3d5e:	83 ec 04             	sub    $0x4,%esp
    3d61:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d64:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3d67:	eb 14                	jmp    3d7d <strchr+0x22>
    if(*s == c)
    3d69:	8b 45 08             	mov    0x8(%ebp),%eax
    3d6c:	0f b6 00             	movzbl (%eax),%eax
    3d6f:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3d72:	75 05                	jne    3d79 <strchr+0x1e>
      return (char*)s;
    3d74:	8b 45 08             	mov    0x8(%ebp),%eax
    3d77:	eb 13                	jmp    3d8c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3d79:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3d7d:	8b 45 08             	mov    0x8(%ebp),%eax
    3d80:	0f b6 00             	movzbl (%eax),%eax
    3d83:	84 c0                	test   %al,%al
    3d85:	75 e2                	jne    3d69 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3d87:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3d8c:	c9                   	leave  
    3d8d:	c3                   	ret    

00003d8e <gets>:

char*
gets(char *buf, int max)
{
    3d8e:	55                   	push   %ebp
    3d8f:	89 e5                	mov    %esp,%ebp
    3d91:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3d94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3d9b:	eb 42                	jmp    3ddf <gets+0x51>
    cc = read(0, &c, 1);
    3d9d:	83 ec 04             	sub    $0x4,%esp
    3da0:	6a 01                	push   $0x1
    3da2:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3da5:	50                   	push   %eax
    3da6:	6a 00                	push   $0x0
    3da8:	e8 47 01 00 00       	call   3ef4 <read>
    3dad:	83 c4 10             	add    $0x10,%esp
    3db0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3db3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3db7:	7e 33                	jle    3dec <gets+0x5e>
      break;
    buf[i++] = c;
    3db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3dbc:	8d 50 01             	lea    0x1(%eax),%edx
    3dbf:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3dc2:	89 c2                	mov    %eax,%edx
    3dc4:	8b 45 08             	mov    0x8(%ebp),%eax
    3dc7:	01 c2                	add    %eax,%edx
    3dc9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3dcd:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3dcf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3dd3:	3c 0a                	cmp    $0xa,%al
    3dd5:	74 16                	je     3ded <gets+0x5f>
    3dd7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3ddb:	3c 0d                	cmp    $0xd,%al
    3ddd:	74 0e                	je     3ded <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3ddf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3de2:	83 c0 01             	add    $0x1,%eax
    3de5:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3de8:	7c b3                	jl     3d9d <gets+0xf>
    3dea:	eb 01                	jmp    3ded <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    3dec:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3ded:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3df0:	8b 45 08             	mov    0x8(%ebp),%eax
    3df3:	01 d0                	add    %edx,%eax
    3df5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3df8:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3dfb:	c9                   	leave  
    3dfc:	c3                   	ret    

00003dfd <stat>:

int
stat(char *n, struct stat *st)
{
    3dfd:	55                   	push   %ebp
    3dfe:	89 e5                	mov    %esp,%ebp
    3e00:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3e03:	83 ec 08             	sub    $0x8,%esp
    3e06:	6a 00                	push   $0x0
    3e08:	ff 75 08             	pushl  0x8(%ebp)
    3e0b:	e8 0c 01 00 00       	call   3f1c <open>
    3e10:	83 c4 10             	add    $0x10,%esp
    3e13:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3e16:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3e1a:	79 07                	jns    3e23 <stat+0x26>
    return -1;
    3e1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3e21:	eb 25                	jmp    3e48 <stat+0x4b>
  r = fstat(fd, st);
    3e23:	83 ec 08             	sub    $0x8,%esp
    3e26:	ff 75 0c             	pushl  0xc(%ebp)
    3e29:	ff 75 f4             	pushl  -0xc(%ebp)
    3e2c:	e8 03 01 00 00       	call   3f34 <fstat>
    3e31:	83 c4 10             	add    $0x10,%esp
    3e34:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3e37:	83 ec 0c             	sub    $0xc,%esp
    3e3a:	ff 75 f4             	pushl  -0xc(%ebp)
    3e3d:	e8 c2 00 00 00       	call   3f04 <close>
    3e42:	83 c4 10             	add    $0x10,%esp
  return r;
    3e45:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3e48:	c9                   	leave  
    3e49:	c3                   	ret    

00003e4a <atoi>:

int
atoi(const char *s)
{
    3e4a:	55                   	push   %ebp
    3e4b:	89 e5                	mov    %esp,%ebp
    3e4d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3e50:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3e57:	eb 25                	jmp    3e7e <atoi+0x34>
    n = n*10 + *s++ - '0';
    3e59:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3e5c:	89 d0                	mov    %edx,%eax
    3e5e:	c1 e0 02             	shl    $0x2,%eax
    3e61:	01 d0                	add    %edx,%eax
    3e63:	01 c0                	add    %eax,%eax
    3e65:	89 c1                	mov    %eax,%ecx
    3e67:	8b 45 08             	mov    0x8(%ebp),%eax
    3e6a:	8d 50 01             	lea    0x1(%eax),%edx
    3e6d:	89 55 08             	mov    %edx,0x8(%ebp)
    3e70:	0f b6 00             	movzbl (%eax),%eax
    3e73:	0f be c0             	movsbl %al,%eax
    3e76:	01 c8                	add    %ecx,%eax
    3e78:	83 e8 30             	sub    $0x30,%eax
    3e7b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3e7e:	8b 45 08             	mov    0x8(%ebp),%eax
    3e81:	0f b6 00             	movzbl (%eax),%eax
    3e84:	3c 2f                	cmp    $0x2f,%al
    3e86:	7e 0a                	jle    3e92 <atoi+0x48>
    3e88:	8b 45 08             	mov    0x8(%ebp),%eax
    3e8b:	0f b6 00             	movzbl (%eax),%eax
    3e8e:	3c 39                	cmp    $0x39,%al
    3e90:	7e c7                	jle    3e59 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3e92:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3e95:	c9                   	leave  
    3e96:	c3                   	ret    

00003e97 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3e97:	55                   	push   %ebp
    3e98:	89 e5                	mov    %esp,%ebp
    3e9a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3e9d:	8b 45 08             	mov    0x8(%ebp),%eax
    3ea0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3ea3:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ea6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3ea9:	eb 17                	jmp    3ec2 <memmove+0x2b>
    *dst++ = *src++;
    3eab:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3eae:	8d 50 01             	lea    0x1(%eax),%edx
    3eb1:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3eb4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3eb7:	8d 4a 01             	lea    0x1(%edx),%ecx
    3eba:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3ebd:	0f b6 12             	movzbl (%edx),%edx
    3ec0:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3ec2:	8b 45 10             	mov    0x10(%ebp),%eax
    3ec5:	8d 50 ff             	lea    -0x1(%eax),%edx
    3ec8:	89 55 10             	mov    %edx,0x10(%ebp)
    3ecb:	85 c0                	test   %eax,%eax
    3ecd:	7f dc                	jg     3eab <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3ecf:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3ed2:	c9                   	leave  
    3ed3:	c3                   	ret    

00003ed4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3ed4:	b8 01 00 00 00       	mov    $0x1,%eax
    3ed9:	cd 40                	int    $0x40
    3edb:	c3                   	ret    

00003edc <exit>:
SYSCALL(exit)
    3edc:	b8 02 00 00 00       	mov    $0x2,%eax
    3ee1:	cd 40                	int    $0x40
    3ee3:	c3                   	ret    

00003ee4 <wait>:
SYSCALL(wait)
    3ee4:	b8 03 00 00 00       	mov    $0x3,%eax
    3ee9:	cd 40                	int    $0x40
    3eeb:	c3                   	ret    

00003eec <pipe>:
SYSCALL(pipe)
    3eec:	b8 04 00 00 00       	mov    $0x4,%eax
    3ef1:	cd 40                	int    $0x40
    3ef3:	c3                   	ret    

00003ef4 <read>:
SYSCALL(read)
    3ef4:	b8 05 00 00 00       	mov    $0x5,%eax
    3ef9:	cd 40                	int    $0x40
    3efb:	c3                   	ret    

00003efc <write>:
SYSCALL(write)
    3efc:	b8 10 00 00 00       	mov    $0x10,%eax
    3f01:	cd 40                	int    $0x40
    3f03:	c3                   	ret    

00003f04 <close>:
SYSCALL(close)
    3f04:	b8 15 00 00 00       	mov    $0x15,%eax
    3f09:	cd 40                	int    $0x40
    3f0b:	c3                   	ret    

00003f0c <kill>:
SYSCALL(kill)
    3f0c:	b8 06 00 00 00       	mov    $0x6,%eax
    3f11:	cd 40                	int    $0x40
    3f13:	c3                   	ret    

00003f14 <exec>:
SYSCALL(exec)
    3f14:	b8 07 00 00 00       	mov    $0x7,%eax
    3f19:	cd 40                	int    $0x40
    3f1b:	c3                   	ret    

00003f1c <open>:
SYSCALL(open)
    3f1c:	b8 0f 00 00 00       	mov    $0xf,%eax
    3f21:	cd 40                	int    $0x40
    3f23:	c3                   	ret    

00003f24 <mknod>:
SYSCALL(mknod)
    3f24:	b8 11 00 00 00       	mov    $0x11,%eax
    3f29:	cd 40                	int    $0x40
    3f2b:	c3                   	ret    

00003f2c <unlink>:
SYSCALL(unlink)
    3f2c:	b8 12 00 00 00       	mov    $0x12,%eax
    3f31:	cd 40                	int    $0x40
    3f33:	c3                   	ret    

00003f34 <fstat>:
SYSCALL(fstat)
    3f34:	b8 08 00 00 00       	mov    $0x8,%eax
    3f39:	cd 40                	int    $0x40
    3f3b:	c3                   	ret    

00003f3c <link>:
SYSCALL(link)
    3f3c:	b8 13 00 00 00       	mov    $0x13,%eax
    3f41:	cd 40                	int    $0x40
    3f43:	c3                   	ret    

00003f44 <mkdir>:
SYSCALL(mkdir)
    3f44:	b8 14 00 00 00       	mov    $0x14,%eax
    3f49:	cd 40                	int    $0x40
    3f4b:	c3                   	ret    

00003f4c <chdir>:
SYSCALL(chdir)
    3f4c:	b8 09 00 00 00       	mov    $0x9,%eax
    3f51:	cd 40                	int    $0x40
    3f53:	c3                   	ret    

00003f54 <dup>:
SYSCALL(dup)
    3f54:	b8 0a 00 00 00       	mov    $0xa,%eax
    3f59:	cd 40                	int    $0x40
    3f5b:	c3                   	ret    

00003f5c <getpid>:
SYSCALL(getpid)
    3f5c:	b8 0b 00 00 00       	mov    $0xb,%eax
    3f61:	cd 40                	int    $0x40
    3f63:	c3                   	ret    

00003f64 <sbrk>:
SYSCALL(sbrk)
    3f64:	b8 0c 00 00 00       	mov    $0xc,%eax
    3f69:	cd 40                	int    $0x40
    3f6b:	c3                   	ret    

00003f6c <sleep>:
SYSCALL(sleep)
    3f6c:	b8 0d 00 00 00       	mov    $0xd,%eax
    3f71:	cd 40                	int    $0x40
    3f73:	c3                   	ret    

00003f74 <uptime>:
SYSCALL(uptime)
    3f74:	b8 0e 00 00 00       	mov    $0xe,%eax
    3f79:	cd 40                	int    $0x40
    3f7b:	c3                   	ret    

00003f7c <setprio>:
SYSCALL(setprio)
    3f7c:	b8 16 00 00 00       	mov    $0x16,%eax
    3f81:	cd 40                	int    $0x40
    3f83:	c3                   	ret    

00003f84 <getprio>:
SYSCALL(getprio)
    3f84:	b8 17 00 00 00       	mov    $0x17,%eax
    3f89:	cd 40                	int    $0x40
    3f8b:	c3                   	ret    

00003f8c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3f8c:	55                   	push   %ebp
    3f8d:	89 e5                	mov    %esp,%ebp
    3f8f:	83 ec 18             	sub    $0x18,%esp
    3f92:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f95:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3f98:	83 ec 04             	sub    $0x4,%esp
    3f9b:	6a 01                	push   $0x1
    3f9d:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3fa0:	50                   	push   %eax
    3fa1:	ff 75 08             	pushl  0x8(%ebp)
    3fa4:	e8 53 ff ff ff       	call   3efc <write>
    3fa9:	83 c4 10             	add    $0x10,%esp
}
    3fac:	90                   	nop
    3fad:	c9                   	leave  
    3fae:	c3                   	ret    

00003faf <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3faf:	55                   	push   %ebp
    3fb0:	89 e5                	mov    %esp,%ebp
    3fb2:	53                   	push   %ebx
    3fb3:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3fb6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3fbd:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3fc1:	74 17                	je     3fda <printint+0x2b>
    3fc3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3fc7:	79 11                	jns    3fda <printint+0x2b>
    neg = 1;
    3fc9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3fd0:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fd3:	f7 d8                	neg    %eax
    3fd5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3fd8:	eb 06                	jmp    3fe0 <printint+0x31>
  } else {
    x = xx;
    3fda:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fdd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3fe0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3fe7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3fea:	8d 41 01             	lea    0x1(%ecx),%eax
    3fed:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3ff0:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3ff3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ff6:	ba 00 00 00 00       	mov    $0x0,%edx
    3ffb:	f7 f3                	div    %ebx
    3ffd:	89 d0                	mov    %edx,%eax
    3fff:	0f b6 80 e0 62 00 00 	movzbl 0x62e0(%eax),%eax
    4006:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    400a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    400d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4010:	ba 00 00 00 00       	mov    $0x0,%edx
    4015:	f7 f3                	div    %ebx
    4017:	89 45 ec             	mov    %eax,-0x14(%ebp)
    401a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    401e:	75 c7                	jne    3fe7 <printint+0x38>
  if(neg)
    4020:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4024:	74 2d                	je     4053 <printint+0xa4>
    buf[i++] = '-';
    4026:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4029:	8d 50 01             	lea    0x1(%eax),%edx
    402c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    402f:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    4034:	eb 1d                	jmp    4053 <printint+0xa4>
    putc(fd, buf[i]);
    4036:	8d 55 dc             	lea    -0x24(%ebp),%edx
    4039:	8b 45 f4             	mov    -0xc(%ebp),%eax
    403c:	01 d0                	add    %edx,%eax
    403e:	0f b6 00             	movzbl (%eax),%eax
    4041:	0f be c0             	movsbl %al,%eax
    4044:	83 ec 08             	sub    $0x8,%esp
    4047:	50                   	push   %eax
    4048:	ff 75 08             	pushl  0x8(%ebp)
    404b:	e8 3c ff ff ff       	call   3f8c <putc>
    4050:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    4053:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    4057:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    405b:	79 d9                	jns    4036 <printint+0x87>
    putc(fd, buf[i]);
}
    405d:	90                   	nop
    405e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4061:	c9                   	leave  
    4062:	c3                   	ret    

00004063 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4063:	55                   	push   %ebp
    4064:	89 e5                	mov    %esp,%ebp
    4066:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    4069:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    4070:	8d 45 0c             	lea    0xc(%ebp),%eax
    4073:	83 c0 04             	add    $0x4,%eax
    4076:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    4079:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4080:	e9 59 01 00 00       	jmp    41de <printf+0x17b>
    c = fmt[i] & 0xff;
    4085:	8b 55 0c             	mov    0xc(%ebp),%edx
    4088:	8b 45 f0             	mov    -0x10(%ebp),%eax
    408b:	01 d0                	add    %edx,%eax
    408d:	0f b6 00             	movzbl (%eax),%eax
    4090:	0f be c0             	movsbl %al,%eax
    4093:	25 ff 00 00 00       	and    $0xff,%eax
    4098:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    409b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    409f:	75 2c                	jne    40cd <printf+0x6a>
      if(c == '%'){
    40a1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    40a5:	75 0c                	jne    40b3 <printf+0x50>
        state = '%';
    40a7:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    40ae:	e9 27 01 00 00       	jmp    41da <printf+0x177>
      } else {
        putc(fd, c);
    40b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    40b6:	0f be c0             	movsbl %al,%eax
    40b9:	83 ec 08             	sub    $0x8,%esp
    40bc:	50                   	push   %eax
    40bd:	ff 75 08             	pushl  0x8(%ebp)
    40c0:	e8 c7 fe ff ff       	call   3f8c <putc>
    40c5:	83 c4 10             	add    $0x10,%esp
    40c8:	e9 0d 01 00 00       	jmp    41da <printf+0x177>
      }
    } else if(state == '%'){
    40cd:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    40d1:	0f 85 03 01 00 00    	jne    41da <printf+0x177>
      if(c == 'd'){
    40d7:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    40db:	75 1e                	jne    40fb <printf+0x98>
        printint(fd, *ap, 10, 1);
    40dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    40e0:	8b 00                	mov    (%eax),%eax
    40e2:	6a 01                	push   $0x1
    40e4:	6a 0a                	push   $0xa
    40e6:	50                   	push   %eax
    40e7:	ff 75 08             	pushl  0x8(%ebp)
    40ea:	e8 c0 fe ff ff       	call   3faf <printint>
    40ef:	83 c4 10             	add    $0x10,%esp
        ap++;
    40f2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    40f6:	e9 d8 00 00 00       	jmp    41d3 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    40fb:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    40ff:	74 06                	je     4107 <printf+0xa4>
    4101:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    4105:	75 1e                	jne    4125 <printf+0xc2>
        printint(fd, *ap, 16, 0);
    4107:	8b 45 e8             	mov    -0x18(%ebp),%eax
    410a:	8b 00                	mov    (%eax),%eax
    410c:	6a 00                	push   $0x0
    410e:	6a 10                	push   $0x10
    4110:	50                   	push   %eax
    4111:	ff 75 08             	pushl  0x8(%ebp)
    4114:	e8 96 fe ff ff       	call   3faf <printint>
    4119:	83 c4 10             	add    $0x10,%esp
        ap++;
    411c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4120:	e9 ae 00 00 00       	jmp    41d3 <printf+0x170>
      } else if(c == 's'){
    4125:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    4129:	75 43                	jne    416e <printf+0x10b>
        s = (char*)*ap;
    412b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    412e:	8b 00                	mov    (%eax),%eax
    4130:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    4133:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    4137:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    413b:	75 25                	jne    4162 <printf+0xff>
          s = "(null)";
    413d:	c7 45 f4 e6 5b 00 00 	movl   $0x5be6,-0xc(%ebp)
        while(*s != 0){
    4144:	eb 1c                	jmp    4162 <printf+0xff>
          putc(fd, *s);
    4146:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4149:	0f b6 00             	movzbl (%eax),%eax
    414c:	0f be c0             	movsbl %al,%eax
    414f:	83 ec 08             	sub    $0x8,%esp
    4152:	50                   	push   %eax
    4153:	ff 75 08             	pushl  0x8(%ebp)
    4156:	e8 31 fe ff ff       	call   3f8c <putc>
    415b:	83 c4 10             	add    $0x10,%esp
          s++;
    415e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4162:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4165:	0f b6 00             	movzbl (%eax),%eax
    4168:	84 c0                	test   %al,%al
    416a:	75 da                	jne    4146 <printf+0xe3>
    416c:	eb 65                	jmp    41d3 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    416e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    4172:	75 1d                	jne    4191 <printf+0x12e>
        putc(fd, *ap);
    4174:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4177:	8b 00                	mov    (%eax),%eax
    4179:	0f be c0             	movsbl %al,%eax
    417c:	83 ec 08             	sub    $0x8,%esp
    417f:	50                   	push   %eax
    4180:	ff 75 08             	pushl  0x8(%ebp)
    4183:	e8 04 fe ff ff       	call   3f8c <putc>
    4188:	83 c4 10             	add    $0x10,%esp
        ap++;
    418b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    418f:	eb 42                	jmp    41d3 <printf+0x170>
      } else if(c == '%'){
    4191:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4195:	75 17                	jne    41ae <printf+0x14b>
        putc(fd, c);
    4197:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    419a:	0f be c0             	movsbl %al,%eax
    419d:	83 ec 08             	sub    $0x8,%esp
    41a0:	50                   	push   %eax
    41a1:	ff 75 08             	pushl  0x8(%ebp)
    41a4:	e8 e3 fd ff ff       	call   3f8c <putc>
    41a9:	83 c4 10             	add    $0x10,%esp
    41ac:	eb 25                	jmp    41d3 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    41ae:	83 ec 08             	sub    $0x8,%esp
    41b1:	6a 25                	push   $0x25
    41b3:	ff 75 08             	pushl  0x8(%ebp)
    41b6:	e8 d1 fd ff ff       	call   3f8c <putc>
    41bb:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    41be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41c1:	0f be c0             	movsbl %al,%eax
    41c4:	83 ec 08             	sub    $0x8,%esp
    41c7:	50                   	push   %eax
    41c8:	ff 75 08             	pushl  0x8(%ebp)
    41cb:	e8 bc fd ff ff       	call   3f8c <putc>
    41d0:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    41d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    41da:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    41de:	8b 55 0c             	mov    0xc(%ebp),%edx
    41e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41e4:	01 d0                	add    %edx,%eax
    41e6:	0f b6 00             	movzbl (%eax),%eax
    41e9:	84 c0                	test   %al,%al
    41eb:	0f 85 94 fe ff ff    	jne    4085 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    41f1:	90                   	nop
    41f2:	c9                   	leave  
    41f3:	c3                   	ret    

000041f4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    41f4:	55                   	push   %ebp
    41f5:	89 e5                	mov    %esp,%ebp
    41f7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    41fa:	8b 45 08             	mov    0x8(%ebp),%eax
    41fd:	83 e8 08             	sub    $0x8,%eax
    4200:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4203:	a1 88 63 00 00       	mov    0x6388,%eax
    4208:	89 45 fc             	mov    %eax,-0x4(%ebp)
    420b:	eb 24                	jmp    4231 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    420d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4210:	8b 00                	mov    (%eax),%eax
    4212:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4215:	77 12                	ja     4229 <free+0x35>
    4217:	8b 45 f8             	mov    -0x8(%ebp),%eax
    421a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    421d:	77 24                	ja     4243 <free+0x4f>
    421f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4222:	8b 00                	mov    (%eax),%eax
    4224:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4227:	77 1a                	ja     4243 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4229:	8b 45 fc             	mov    -0x4(%ebp),%eax
    422c:	8b 00                	mov    (%eax),%eax
    422e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4231:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4234:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4237:	76 d4                	jbe    420d <free+0x19>
    4239:	8b 45 fc             	mov    -0x4(%ebp),%eax
    423c:	8b 00                	mov    (%eax),%eax
    423e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4241:	76 ca                	jbe    420d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    4243:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4246:	8b 40 04             	mov    0x4(%eax),%eax
    4249:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4250:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4253:	01 c2                	add    %eax,%edx
    4255:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4258:	8b 00                	mov    (%eax),%eax
    425a:	39 c2                	cmp    %eax,%edx
    425c:	75 24                	jne    4282 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    425e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4261:	8b 50 04             	mov    0x4(%eax),%edx
    4264:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4267:	8b 00                	mov    (%eax),%eax
    4269:	8b 40 04             	mov    0x4(%eax),%eax
    426c:	01 c2                	add    %eax,%edx
    426e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4271:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4274:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4277:	8b 00                	mov    (%eax),%eax
    4279:	8b 10                	mov    (%eax),%edx
    427b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    427e:	89 10                	mov    %edx,(%eax)
    4280:	eb 0a                	jmp    428c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    4282:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4285:	8b 10                	mov    (%eax),%edx
    4287:	8b 45 f8             	mov    -0x8(%ebp),%eax
    428a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    428c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    428f:	8b 40 04             	mov    0x4(%eax),%eax
    4292:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4299:	8b 45 fc             	mov    -0x4(%ebp),%eax
    429c:	01 d0                	add    %edx,%eax
    429e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    42a1:	75 20                	jne    42c3 <free+0xcf>
    p->s.size += bp->s.size;
    42a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42a6:	8b 50 04             	mov    0x4(%eax),%edx
    42a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42ac:	8b 40 04             	mov    0x4(%eax),%eax
    42af:	01 c2                	add    %eax,%edx
    42b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42b4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    42b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42ba:	8b 10                	mov    (%eax),%edx
    42bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42bf:	89 10                	mov    %edx,(%eax)
    42c1:	eb 08                	jmp    42cb <free+0xd7>
  } else
    p->s.ptr = bp;
    42c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42c6:	8b 55 f8             	mov    -0x8(%ebp),%edx
    42c9:	89 10                	mov    %edx,(%eax)
  freep = p;
    42cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42ce:	a3 88 63 00 00       	mov    %eax,0x6388
}
    42d3:	90                   	nop
    42d4:	c9                   	leave  
    42d5:	c3                   	ret    

000042d6 <morecore>:

static Header*
morecore(uint nu)
{
    42d6:	55                   	push   %ebp
    42d7:	89 e5                	mov    %esp,%ebp
    42d9:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    42dc:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    42e3:	77 07                	ja     42ec <morecore+0x16>
    nu = 4096;
    42e5:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    42ec:	8b 45 08             	mov    0x8(%ebp),%eax
    42ef:	c1 e0 03             	shl    $0x3,%eax
    42f2:	83 ec 0c             	sub    $0xc,%esp
    42f5:	50                   	push   %eax
    42f6:	e8 69 fc ff ff       	call   3f64 <sbrk>
    42fb:	83 c4 10             	add    $0x10,%esp
    42fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4301:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4305:	75 07                	jne    430e <morecore+0x38>
    return 0;
    4307:	b8 00 00 00 00       	mov    $0x0,%eax
    430c:	eb 26                	jmp    4334 <morecore+0x5e>
  hp = (Header*)p;
    430e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4311:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    4314:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4317:	8b 55 08             	mov    0x8(%ebp),%edx
    431a:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    431d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4320:	83 c0 08             	add    $0x8,%eax
    4323:	83 ec 0c             	sub    $0xc,%esp
    4326:	50                   	push   %eax
    4327:	e8 c8 fe ff ff       	call   41f4 <free>
    432c:	83 c4 10             	add    $0x10,%esp
  return freep;
    432f:	a1 88 63 00 00       	mov    0x6388,%eax
}
    4334:	c9                   	leave  
    4335:	c3                   	ret    

00004336 <malloc>:

void*
malloc(uint nbytes)
{
    4336:	55                   	push   %ebp
    4337:	89 e5                	mov    %esp,%ebp
    4339:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    433c:	8b 45 08             	mov    0x8(%ebp),%eax
    433f:	83 c0 07             	add    $0x7,%eax
    4342:	c1 e8 03             	shr    $0x3,%eax
    4345:	83 c0 01             	add    $0x1,%eax
    4348:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    434b:	a1 88 63 00 00       	mov    0x6388,%eax
    4350:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4353:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4357:	75 23                	jne    437c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    4359:	c7 45 f0 80 63 00 00 	movl   $0x6380,-0x10(%ebp)
    4360:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4363:	a3 88 63 00 00       	mov    %eax,0x6388
    4368:	a1 88 63 00 00       	mov    0x6388,%eax
    436d:	a3 80 63 00 00       	mov    %eax,0x6380
    base.s.size = 0;
    4372:	c7 05 84 63 00 00 00 	movl   $0x0,0x6384
    4379:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    437c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    437f:	8b 00                	mov    (%eax),%eax
    4381:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    4384:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4387:	8b 40 04             	mov    0x4(%eax),%eax
    438a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    438d:	72 4d                	jb     43dc <malloc+0xa6>
      if(p->s.size == nunits)
    438f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4392:	8b 40 04             	mov    0x4(%eax),%eax
    4395:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4398:	75 0c                	jne    43a6 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    439a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    439d:	8b 10                	mov    (%eax),%edx
    439f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43a2:	89 10                	mov    %edx,(%eax)
    43a4:	eb 26                	jmp    43cc <malloc+0x96>
      else {
        p->s.size -= nunits;
    43a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43a9:	8b 40 04             	mov    0x4(%eax),%eax
    43ac:	2b 45 ec             	sub    -0x14(%ebp),%eax
    43af:	89 c2                	mov    %eax,%edx
    43b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43b4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    43b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43ba:	8b 40 04             	mov    0x4(%eax),%eax
    43bd:	c1 e0 03             	shl    $0x3,%eax
    43c0:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    43c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43c6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    43c9:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    43cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43cf:	a3 88 63 00 00       	mov    %eax,0x6388
      return (void*)(p + 1);
    43d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43d7:	83 c0 08             	add    $0x8,%eax
    43da:	eb 3b                	jmp    4417 <malloc+0xe1>
    }
    if(p == freep)
    43dc:	a1 88 63 00 00       	mov    0x6388,%eax
    43e1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    43e4:	75 1e                	jne    4404 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    43e6:	83 ec 0c             	sub    $0xc,%esp
    43e9:	ff 75 ec             	pushl  -0x14(%ebp)
    43ec:	e8 e5 fe ff ff       	call   42d6 <morecore>
    43f1:	83 c4 10             	add    $0x10,%esp
    43f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    43f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    43fb:	75 07                	jne    4404 <malloc+0xce>
        return 0;
    43fd:	b8 00 00 00 00       	mov    $0x0,%eax
    4402:	eb 13                	jmp    4417 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4404:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4407:	89 45 f0             	mov    %eax,-0x10(%ebp)
    440a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    440d:	8b 00                	mov    (%eax),%eax
    440f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4412:	e9 6d ff ff ff       	jmp    4384 <malloc+0x4e>
}
    4417:	c9                   	leave  
    4418:	c3                   	ret    
