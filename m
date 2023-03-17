Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53635C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 19:37:30 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.29284.1679081845650952398
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 12:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dig5kXbl;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id h11so3278452ild.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 12:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679081845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4s0LkNa+B4CKaHnyOAuabyZZD6GHZ6A4GKShtNvoNjg=;
        b=dig5kXblayeAfQx4P4Gme33Y9TfvgH7zt8EtVMTNZw/PCzkwFGzBWdv9T1HowCYbJK
         /GwPS7eg3gRFrQdHYTo6LmDewrkHCTtnXBXZlwCS1c7zxI9AZhPYsnCo3oiSMQngJhHU
         0tzbA3ZUKbhwUqE5QqH6RJJ+sgG/hqyQbWsG9Grf9EtTevGXbpbtPFgPC97q4CEyf5vv
         6uB9iKn7U76PcM/Ur+9Mdz5Jc9uNYJ+W3Hze0Y7LWaHEfqK3i5gFNmfmgSnAsR+QpX6T
         g18lfIw9w7fHSzCPhZHAn2CKxHaBDbVd1VfNScjtuwXwUGsW61/arxUDP2vLZ/h35ovS
         0CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679081845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4s0LkNa+B4CKaHnyOAuabyZZD6GHZ6A4GKShtNvoNjg=;
        b=DSKpalgYycjI19mOUfKRwaKif6ex7TCZUvaMIDiHVfEi6inuMUAjeI/eaxa46Owoji
         IVjUgzblduZPftUsLtpb2qwwmUSeZk/GhY4+tKb9YCB5dtByLcRsG65z9GJ5b8dJRgTQ
         Hv1WYjVv97uZocV2eJfSh/h8PfKK3AZWRCCjD4lLOaJv+9ye+jBhrE1UbSR0o2/qGRTW
         oktvIAU0A9L9r3Lzdr4mjpGT0RLIx7U+FeMxMulDR9eVjtqq8U8qu1ZJwq1drOjUxldL
         AuQzwJXDZx0BG9utrqCO/W/yf+0n6CtKrmVRdDJNWWD/b+6TU4OxO6oOO6yyi6SD5gkI
         ALPg==
X-Gm-Message-State: AO0yUKWsB8iubVa6YF4t5tdHkVSgiBRU2O3FBhAFCgo+BXNw8gsqsmFl
	//DqKR8llYzG6DU7SBWv5wKxrlHMFvF7U9rqRDA9/QrjJC0=
X-Google-Smtp-Source: AK7set/CLOgvGjkmKGoaN9yxsRxXgYfFSpycNQpVKRpTtaQrlU/lrFXXTzgEXN3AaXiHifBwCjLEaDhekFTgB0UGGC8=
X-Received: by 2002:a05:6e02:890:b0:310:9d77:6063 with SMTP id
 z16-20020a056e02089000b003109d776063mr247765ils.5.1679081844525; Fri, 17 Mar
 2023 12:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
 <ZAEUIxX+2N+Xt6Ez@gmail.com> <83fefae9-c822-bdd9-488e-b237c033fa38@windriver.com>
 <CADkTA4OjL+XfzVK5nKb3JfXfa++ifhgfwp2SOxNweRXrX99FNQ@mail.gmail.com>
 <fdac15fe-933b-c765-33a1-5973df90f920@windriver.com> <CADkTA4M485ucEDAf754n+S6ObwNqjHwmk1H0VdL1nPDhfMc4aw@mail.gmail.com>
 <5172dc9e-c30d-6887-e1b8-fe10b4b22d8b@windriver.com>
In-Reply-To: <5172dc9e-c30d-6887-e1b8-fe10b4b22d8b@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Mar 2023 15:37:13 -0400
Message-ID: <CADkTA4N3ZuehDP_4-fM1kk1PYvnvdctBUbK+5L7V4=LuDpKoKw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in:
 if busybox contains init then use it
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 19:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7947

On Mon, Mar 13, 2023 at 3:18=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Hi Bruce,
>
> On 3/13/23 08:46, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Wed, Mar 8, 2023 at 10:49=E2=80=AFPM Xiangyu Chen
> > <xiangyu.chen@eng.windriver.com> wrote:
> >> Hi Bruce,
> >>
> >>
> >> Sorry for being late,
> >>
> >> On 3/8/23 12:00, Bruce Ashfield wrote:
> >>> CAUTION: This email comes from a non Wind River email account!
> >>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
> >>>
> >>> On Thu, Mar 2, 2023 at 8:17=E2=80=AFPM Xiangyu Chen
> >>> <xiangyu.chen@eng.windriver.com> wrote:
> >>>> Hi Bruce,
> >>>>
> >>>>
> >>>> On 3/3/23 05:24, Bruce Ashfield wrote:
> >>>>> CAUTION: This email comes from a non Wind River email account!
> >>>>> Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
> >>>>>
> >>>>> In message: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-bus=
ybox.in: if busybox contains init then use it
> >>>>> on 01/03/2023 Xiangyu Chen wrote:
> >>>>>
> >>>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>>>>>
> >>>>>> Hi Bruce,
> >>>>>>
> >>>>>> Recently we found that the lxc ptest has lots of failure cases as =
below log-1, after checking the
> >>>>>> code, some cases failed due to related the init progess. For examp=
le, lxc-test-exit-code need to
> >>>>>> start container as daemon, but if using bash as init, the containe=
r cannot start correctly.
> >>>>> Is there an indication of what busybox is providing that bash isn't=
 ?
> >>>> In my local setup, when using bash as container init, the container
> >>>> doesn't support "reboot" and cannot start correctly in a daemon mode=
,
> >>>> test step as below:
> >>>>
> >>>> lxc-create -t busybox -n t
> >>>>
> >>>> lxc-start -n t -d
> >>>>
> >>>> lxc-ls -f
> >>>>
> >>>> the container "t" status still in "STOPPED", but when we use a busyb=
ox
> >>>> init instead of bash, the container status is correct in daemon mode=
.
> >>>>
> >>> I'm setting up to test this myself, but generally speaking we should
> >>> include this detail in the commit log.
> >> Thanks, if we find the final root cause, I'll add our discussion
> >> information into the commit and send a v2 patch :p
> >>
> >>
> >>>>> I don't like to force this in the ptest, while for actual lxc conta=
iners
> >>>>> we still allow bash, which means it may not be functional.
> >>>> This is a common template for lxc, but I am not sure whether others
> >>>> still need bash as lxc container init, so I based the patch
> >>>>
> >>>> "template-make-busybox-template-compatible-with-core-.patch" to add =
the
> >>>> busybox back.
> >>>>
> >>> That's the part that concerns me. Why does our bash behave differentl=
y
> >>> than in other lxc integrations and other distros ?
> >> Currently, the behavior is when using lxc with busybox template in
> >> daemon mode, the status still stay in "STOPPED", but it's working well
> >> in foreground mode.
> >>
> >>> Do you have the ability to run the same simple tests you have above o=
n
> >>> a desktop distro ?
> >> I have setup a virtualbox today and did some test with trace, here is
> >> something I was found:
> >>
> >> As above mentioned,  lxc working well in foreground mode but something
> >> wrong with daemon mode, according to manual of lxc-start, the foregrou=
nd
> >> mode attach the tty to /dev/console, but daemon mode doesn't.
> >>
> > And to confirm, this is running on something like ubuntu, using the
> > ubuntu bash ?
>
> It was a virtualbox VM with openSUSE Leap 15.5, lxc version is 4.0.12,
> bash version is 4.4.23, busybox using master branch and was built by myse=
lf.
>
>
> When using busybox as init, the container run as daemon is normal:
>
> localhost:~ # lxc-create --version
> 4.0.12
> localhost:~ # lxc-create -t busybox -n t-bb
> localhost:~ # lxc-start -n t-bb -d
> localhost:~ # lxc-ls -f
> NAME STATE   AUTOSTART GROUPS IPV4 IPV6 UNPRIVILEGED
> t-bb RUNNING 0         -      -    -    false
> localhost:~ # lxc-stop -n t-bb
> localhost:~ # lxc-ls -f
> NAME STATE   AUTOSTART GROUPS IPV4 IPV6 UNPRIVILEGED
> t-bb STOPPED 0         -      -    -    false
> localhost:~ #
> localhost:~ #
>
>
> The strace log:
>
> #####log of "strace -f  lxc-start -n t-bb -d" #######
>
> execve("/usr/bin/lxc-start", ["lxc-start", "-n", "t-bb", "-d"],
> 0x7ffe0ef0e300 /* 57 vars */) =3D 0
> ... loading and mapping libraries for lxc ...
>
> [pid 23053] execve("/sbin/init", ["/sbin/init"], 0x563be8d3fae0 /* 2
> vars */ <unfinished ...>
>
> ... loading and mapping libraries for /sbin/init in container...
>
> [pid 23053] reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
> LINUX_REBOOT_CMD_CAD_OFF) =3D -1 EINVAL (Invalid argument)
> [pid 23053] openat(AT_FDCWD, "/dev/null", O_RDWR) =3D 3
> [pid 23053] close(3)                    =3D 0
> [pid 23053] ioctl(0, VT_OPENQRY, 0x7ffd8e2e5b28) =3D -1 ENOTTY
> (Inappropriate ioctl for device)
> [pid 23053] brk(NULL)                   =3D 0x19ea000
> [pid 23053] brk(0x1a0b000)              =3D 0x1a0b000
> [pid 23053] ioctl(0, TCGETS, 0x7ffd8e2e5a90) =3D -1 ENOTTY (Inappropriate
> ioctl for device)
> [pid 23053] chdir("/")                  =3D 0
> [pid 23053] setsid()                    =3D -1 EPERM (Operation not permi=
tted)
> [pid 23053] openat(AT_FDCWD, "/etc/inittab", O_RDONLY) =3D 3
> [pid 23053] fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D97, ...}) =3D 0
> [pid 23053] read(3, "::sysinit:/etc/init.d/rcS\ntty1::"..., 4096) =3D 97
> [pid 23053] read(3, "", 4096)           =3D 0
> [pid 23053] close(3)                    =3D 0
>
> .... add signal process callback ....
>
> [pid 23054] execve("/etc/init.d/rcS", ["/etc/init.d/rcS"], 0x19ea2a0 /*
> 6 vars */ <unfinished ...>
>
> .... loading and mapping libraries for running /etc/init.d/rcS .....
>
> [pid 23055] execve("/bin/syslogd", ["/bin/syslogd"], 0x1308670 /* 8 vars
> */) =3D 0
>
> .....
>
> [pid 23056] execve("/bin/mount", ["/bin/mount", "-a"], 0x13086b8 /* 8
> vars */ <unfinished ...>
>
> ...
>
> [pid 23057] execve("/bin/udhcpc", ["/bin/udhcpc"], 0x1308670 /* 8 vars
> */) =3D 0
>
> ...
>
> [pid 23058] execve("/bin/getty", ["/bin/getty", "-L", "tty1", "115200",
> "vt100"], 0x19ea2a0 /* 6 vars */ <unfinished ...>
>
> ...
>
> [pid 23061] execve("/bin/sh", ["/bin/sh"], 0x13d02a0 /* 6 vars */
> <unfinished ...>
>
> [pid 23061] ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
> ...
> [pid 23061] ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
>
> [pid 23061] openat(AT_FDCWD, "/dev/tty", O_RDWR) =3D 3
> [pid 23061] fcntl(3, F_DUPFD_CLOEXEC, 10) =3D 10
> [pid 23061] close(3 <unfinished ...>
> [pid 23061] <... close resumed>)        =3D 0
> [pid 23061] ioctl(10, TIOCGPGRP <unfinished ...>
> [pid 23061] <... ioctl resumed>, [8])   =3D 0
> [pid 23061] getpgrp()                   =3D 8
> ...
> [pid 23061] setpgid(0, 8 <unfinished ...>
> [pid 23061] <... setpgid resumed>)      =3D -1 EPERM (Operation not permi=
tted)
> [pid 23061] ioctl(10, TIOCSPGRP, [8] <unfinished ...>
> [pid 23061] <... ioctl resumed>)        =3D 0
> [pid 23061] ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
> [pid 23061] ioctl(0, SNDCTL_TMR_START or TCSETS, {B38400 opost -isig
> -icanon -echo ...} <unfinished ...>
> [pid 23061] <... ioctl resumed>)        =3D 0
> [pid 23061] ioctl(0, TIOCGWINSZ, {ws_row=3D0, ws_col=3D0, ws_xpixel=3D0,
> ws_ypixel=3D0}) =3D 0
> [pid 23061] geteuid()                   =3D 0
> [pid 23061] openat(AT_FDCWD, "/etc/passwd", O_RDONLY) =3D 3
> [pid 23061] fstat(3,  <unfinished ...>
> [pid 23061] <... fstat resumed>{st_mode=3DS_IFREG|0644, st_size=3D30, ...=
}) =3D 0
> [pid 23061] read(3,  <unfinished ...>
> [pid 23061] <... read resumed>"root:x:0:0:root:/root:/bin/sh\n", 4096) =
=3D 30
> [pid 23061] close(3 <unfinished ...>
> [pid 23061] <... close resumed>)        =3D 0
> [pid 23061] geteuid( <unfinished ...>
> [pid 23061] <... geteuid resumed>)      =3D 0
> [pid 23061] fstat(1,  <unfinished ...>
> [pid 23061] <... fstat resumed>{st_mode=3DS_IFCHR|0620,
> st_rdev=3Dmakedev(0x88, 0x2), ...}) =3D 0
> [pid 23061] rt_sigaction(SIGWINCH, {sa_handler=3D0x4b9ce8, sa_mask=3D[],
> sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7fc7eecdcd50},
> <unfinished ...>
> [pid 23061] <... rt_sigaction resumed>{sa_handler=3DSIG_DFL, sa_mask=3D[]=
,
> sa_flags=3D0}, 8) =3D 0
> [pid 23061] write(1, "/ # ", 4 <unfinished ...>
> [pid 23061] <... write resumed>)        =3D 4
> [pid 23061] poll([{fd=3D0, events=3DPOLLIN}], 1, -1 <unfinished ...>
> ############end of "strace -f  lxc-start -n t-bb -d" ###############
>
>
>
> When using bash as init, the container can run in foreground mode:
>
> localhost:~ # lxc-create -t busybox -n t-bash
> localhost:~ # lxc-start -n t-bash -d
> localhost:~ # lxc-ls -f
> NAME   STATE   AUTOSTART GROUPS IPV4 IPV6 UNPRIVILEGED
> t-bash STOPPED 0         -      -    -    false
> t-bb   STOPPED 0         -      -    -    false
> localhost:~ # lxc-start -n t-bash -F
> init-4.4#
> init-4.4#
> init-4.4# /sbin/init --version
> GNU bash, version 4.4.23(1)-release (x86_64-suse-linux-gnu)
> Copyright (C) 2016 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
>
> This is free software; you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> init-4.4# exit
> exit
> localhost:~ #
>
> The strace log:
>
> #####log of "strace -f  lxc-start -n bash -d" #######
>
> [pid 22977] execve("/sbin/init", ["/sbin/init"], 0x562a9b3d80f0 /* 2
> vars */ <unfinished ...>
> .... loading and mapping libraries .......
> [pid 22977] openat(AT_FDCWD, "/dev/tty", O_RDWR|O_NONBLOCK) =3D -1 ENXIO
> (No such device or address)
> [pid 22977] ioctl(0, TCGETS, 0x7ffc1d039fa0) =3D -1 ENOTTY (Inappropriate
> ioctl for device)
> [pid 22977] stat("/usr/lib/locale/locale-archive", 0x7ffc1d03a110) =3D -1
> ENOENT (No such file or directory)
> [pid 22977] brk(NULL)                   =3D 0x562bad4cf000
> [pid 22977] brk(0x562bad4f0000)         =3D 0x562bad4f0000
> [pid 22977] getuid()                    =3D 0
> [pid 22977] getgid()                    =3D 0
> [pid 22977] geteuid()                   =3D 0
> [pid 22977] getegid()                   =3D 0
> [pid 22977] rt_sigprocmask(SIG_BLOCK, NULL, [], 8) =3D 0
> [pid 22977] ioctl(0, TCGETS, 0x7ffc1d03a120) =3D -1 ENOTTY (Inappropriate
> ioctl for device)
> [pid 22977] ioctl(-1, TIOCGPGRP, 0x7ffc1d03a194) =3D -1 EBADF (Bad file
> descriptor)
> [pid 22977] sysinfo({uptime=3D5034, loads=3D[13568, 5344, 992],
> totalram=3D4115214336, freeram=3D1067577344, sharedram=3D30674944,
> bufferram=3D1994752, totalswap=3D2148507648, freeswap=3D2148507648, procs=
=3D381,
> totalhigh=3D0, freehigh=3D0, mem_unit=3D1}) =3D 0
> .... add signal process callback and start process network
> configurations in /etc ....
>
> [pid 22977] openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) =3D 3
> [pid 22977] lseek(3, 0, SEEK_CUR)       =3D 0
> [pid 22977] fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D30, ...}) =3D 0
> [pid 22977] read(3, "root:x:0:0:root:/root:/bin/sh\n", 4096) =3D 30
> [pid 22977] close(3)                    =3D 0
> [pid 22977] getppid()                   =3D 0
> [pid 22977] getpid()                    =3D 1
> [pid 22977] getpgrp()                   =3D 1
> [pid 22977] ioctl(2, TIOCGPGRP, 0x7ffc1d03a064) =3D -1 ENOTTY
> (Inappropriate ioctl for device)
> [pid 22977] rt_sigaction(SIGCHLD, {sa_handler=3D0x562bacebdb50,
> sa_mask=3D[], sa_flags=3DSA_RESTORER|SA_RESTART,
> sa_restorer=3D0x7fdb74971d50}, {sa_handler=3DSIG_DFL, sa_mask=3D[],
> sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7fdb74971d50}, 8) =3D =
0
> [pid 22977] ioctl(2, TIOCGPGRP, 0x7ffc1d03a044) =3D -1 ENOTTY
> (Inappropriate ioctl for device)
> [pid 22977] prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=3D15574,
> rlim_max=3D15574}) =3D 0
> [pid 22977] rt_sigprocmask(SIG_BLOCK, NULL, [], 8) =3D 0
> [pid 22977] fcntl(0, F_GETFL)           =3D 0x8002 (flags O_RDWR|O_LARGEF=
ILE)
> [pid 22977] fstat(0, {st_mode=3DS_IFCHR|0666, st_rdev=3Dmakedev(0x1, 0x3)=
,
> ...}) =3D 0
> [pid 22977] lseek(0, 0, SEEK_CUR)       =3D 0
> [pid 22977] read(0, "", 1)              =3D 0
> [pid 22977] rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
> [pid 22977] rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
> [pid 22977] exit_group(0)               =3D ?
> [pid 22977] +++ exited with 0 +++
> #####end of "strace -f  lxc-start -n bash -d" #######
>
>

I'm not seeing anything obvious in the traces. I do wish we had a root
cause as to why bash cannot go into daemon mode, while busybox can.

I'm going to soak these on master next for a bit and watch for issues.

Bruce

>
> Br,
>
> Xiangyu
>
> >
> >> I was enable the lxc debug trace as below when start a container with
> >> daemon mode (part of init related log and remove timestamp and full
> >> source code path)
> >>
> >> ##### lxc-start -n t -o /tmp/log.txt -l TRACE  -d #####
> >>
> >> start - /src/lxc/start.c:post_start:2205 - Started "/sbin/init" with p=
id
> >> "871"
> >> start - /src/lxc/start.c:lxc_serve_state_clients:483 - Set container
> >> state to RUNNING
> >>
> >> <<<<<<<<< we can see the bash as init was starting, and lxc update mod=
e
> >>
> >> start - /src/lxc/start.c:lxc_serve_state_clients:486 - No state client=
s
> >> registered
> >> mainloop - /src/lxc/mainloop.c:__epoll_open:493 - Created epoll instan=
ce
> >> mainloop - /mainloop.c:__epoll_open:493 - Created epoll instance
> >> start - /src/lxc/start.c:lxc_poll:626 - Mainloop is ready
> >> start - /src/lxc/start.c:signal_handler:396 - Received signal
> >> ssi_signo(17) for ssi_pid(871), si_signo(17), si_pid(871)
> >> start - /src/lxc/start.c:signal_handler:464 - Container init process 8=
71
> >> exited
> >>
> >> <<<<<<<<<< seems something wrong with the init, it exited and lxc got
> >> the exit signal.
> >>
> >> start - /src/lxc/start.c:lxc_poll:643 - Closed console mainloop
> >> start - /src/lxc/start.c:lxc_poll:648 - Closed mainloop
> >> start - /src/lxc/start.c:lxc_poll:651 - Closed signal file descriptor =
7
> >> ..... removed some networking teminating related trace .....
> >> start - /src/lxc/start.c:lxc_serve_state_clients:483 - Set container
> >> state to STOPPING
> >>
> >> <<<<<<<<<<< now the lxc set container mode back to stop mode.
> >>
> >> start - /src/lxc/start.c:lxc_serve_state_clients:486 - No state client=
s
> >> registered
> >> ##### end of lxc-start -n t -o /tmp/log.txt -l TRACE  -d #####
> >>
> >>
> >> Let's use strace to see what happens in container(part of init related=
 log):
> >>
> >> #####strace -s 1024 -f lxc-start -n t -d #####
> >>
> >> [pid  1211] execve("/sbin/init", ["/sbin/init"], 0x55a07c90eb30 /* 1 v=
ar
> >> */ <unfinished ...>
> >> ......
> >>
> >> [pid  1211] ioctl(2, TIOCGPGRP, 0x7fffe212610c) =3D -1 ENOTTY
> >> (Inappropriate ioctl for device)
> >> [pid  1211] rt_sigaction(SIGCHLD, {sa_handler=3D0x5632e07dcec0,
> >> sa_mask=3D[], sa_flags=3DSA_RESTORER|SA_RESTART,
> >> sa_restorer=3D0x7f1237db3190}, {sa_handler=3DSIG_DFL, sa_mask=3D[],
> >> sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7f1237db3190}, 8) =
=3D 0
> >> [pid  1211] ioctl(2, TIOCGPGRP, 0x7fffe21260ec) =3D -1 ENOTTY
> >> (Inappropriate ioctl for device)
> >> [pid  1211] prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=3D3818,
> >> rlim_max=3D3818}) =3D 0
> >> [pid  1211] rt_sigprocmask(SIG_BLOCK, NULL, [], 8) =3D 0
> >> [pid  1211] fcntl(0, F_GETFL)           =3D 0x8002 (flags O_RDWR|O_LAR=
GEFILE)
> >> [pid  1211] newfstatat(0, "", {st_mode=3DS_IFCHR|0666,
> >> st_rdev=3Dmakedev(0x1, 0x3), ...}, AT_EMPTY_PATH) =3D 0
> >> [pid  1211] lseek(0, 0, SEEK_CUR)       =3D 0
> >> [pid  1211] read(0, "", 1)              =3D 0
> >> [pid  1211] rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
> >> [pid  1211] rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
> >> [pid  1211] exit_group(0)               =3D ?
> >> [pid  1211] +++ exited with 0 +++
> >> #####end of strace -s 1024 -f lxc-start -n t -d #####
> >>
> >> it looks that seems bash stdi/o/err cannot attach the available caused
> >> this issue, right?
> > It does look like that. When busybox is used as init, do you have a
> > similar strace ? I'd like to do that comparison.
> >
> > Bruce
> >
> >>
> >>> I don't want to force this switch to busybox, without understanding i=
f
> >>> we are the only ones seeing this issue .. since that means we are
> >>> simply hiding an issue, versus fixing it.
> >> Yes indeed, if someone is using systemd as init, they need to add extr=
a
> >> configurations to setup busybox and keep default systemd init cannot b=
e
> >> replaced by busybox in local.conf .
> >>
> >>
> >> Thanks,
> >>
> >> Xiangyu
> >>
> >>> Bruce
> >>>>> There are other init options in meta-virt, like the docker tini, if=
 we
> >>>>> had to enforce something, I'd rather that than busybox.
> >>>> Good to hear the tini :)
> >>>>
> >>>> Indeed, enable the busybox-init might need lots of additional effort=
 to
> >>>> take care of system which using systemd, otherwise, /sbin/init alway=
s to
> >>>> be covered by busybox.
> >>>>
> >>>>> Bruce
> >>>> Br,
> >>>>
> >>>> Xiangyu
> >>>>
> >>>>
> >>>>>> So added a busybox init utils checking in lxc-busybox template, if=
 current system busybox contains
> >>>>>> init then use it, after applying this patch, the ptest result as l=
og-2.
> >>>>>>
> >>>>>>
> >>>>>> ######## 1og-1: ptest without patch #######
> >>>>>>
> >>>>>> Starting LXC ptest ###
> >>>>>> FAIL: lxc-test-api-reboot
> >>>>>> SKIPPED: lxc-test-apparmor
> >>>>>> PASS: lxc-test-apparmor-generated
> >>>>>> FAIL: lxc-test-apparmor-mount
> >>>>>> PASS: lxc-test-arch-parse
> >>>>>> FAIL: lxc-test-attach
> >>>>>> PASS: lxc-test-automount
> >>>>>> FAIL: lxc-test-autostart
> >>>>>> PASS: lxc-test-basic
> >>>>>> FAIL: lxc-test-capabilities
> >>>>>> FAIL: lxc-test-cgpath
> >>>>>> PASS: lxc-test-checkpoint-restore
> >>>>>> FAIL: lxc-test-cloneconfig
> >>>>>> FAIL: lxc-test-clonetest
> >>>>>> FAIL: lxc-test-concurrent
> >>>>>> PASS: lxc-test-config-jump-table
> >>>>>> FAIL: lxc-test-console
> >>>>>> FAIL: lxc-test-console-log
> >>>>>> FAIL: lxc-test-containertests
> >>>>>> FAIL: lxc-test-createconfig
> >>>>>> FAIL: lxc-test-createtest
> >>>>>> PASS: lxc-test-criu-check-feature
> >>>>>> FAIL: lxc-test-cve-2019-5736
> >>>>>> FAIL: lxc-test-destroytest
> >>>>>> FAIL: lxc-test-device-add-remove
> >>>>>> FAIL: lxc-test-exit-code
> >>>>>> FAIL: lxc-test-get_item
> >>>>>> PASS: lxc-test-getkeys
> >>>>>> PASS: lxc-test-list
> >>>>>> PASS: lxc-test-locktests
> >>>>>> FAIL: lxc-test-lxc-attach
> >>>>>> PASS: lxc-test-lxcpath
> >>>>>> PASS: lxc-test-may-control
> >>>>>> FAIL: lxc-test-mount-injection
> >>>>>> FAIL: lxc-test-no-new-privs
> >>>>>> PASS: lxc-test-parse-config-file
> >>>>>> FAIL: lxc-test-proc-pid
> >>>>>> FAIL: lxc-test-procsys
> >>>>>> PASS: lxc-test-raw-clone
> >>>>>> PASS: lxc-test-reboot
> >>>>>> FAIL: lxc-test-rootfs
> >>>>>> FAIL: lxc-test-rootfs-options
> >>>>>> FAIL: lxc-test-saveconfig
> >>>>>> FAIL: lxc-test-share-ns
> >>>>>> FAIL: lxc-test-shortlived
> >>>>>> SKIPPED: lxc-test-shutdowntest
> >>>>>> FAIL: lxc-test-snapdeps
> >>>>>> FAIL: lxc-test-snapshot
> >>>>>> FAIL: lxc-test-startone
> >>>>>> SKIPPED: lxc-test-state-server
> >>>>>> FAIL: lxc-test-symlink
> >>>>>> FAIL: lxc-test-sys-mixed
> >>>>>> FAIL: lxc-test-sysctls
> >>>>>> FAIL: lxc-test-unpriv
> >>>>>> FAIL: lxc-test-usernic
> >>>>>> PASS: lxc-test-usernsexec
> >>>>>> PASS: lxc-test-utils
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Results:
> >>>>>>        PASSED =3D 17
> >>>>>>        FAILED =3D 37
> >>>>>>        SKIPPED =3D 3
> >>>>>> (for details check individual test log in ./logs directory)
> >>>>>>
> >>>>>>
> >>>>>> ###########log-2: ptest with patch ###################
> >>>>>> root@intel-x86-64:/usr/lib64/lxc/ptest# ./run-ptest
> >>>>>> ### Starting LXC ptest ###
> >>>>>> PASS: lxc-test-api-reboot
> >>>>>> SKIPPED: lxc-test-apparmor
> >>>>>> PASS: lxc-test-apparmor-generated
> >>>>>> FAIL: lxc-test-apparmor-mount
> >>>>>> PASS: lxc-test-arch-parse
> >>>>>> PASS: lxc-test-attach
> >>>>>> PASS: lxc-test-automount
> >>>>>> PASS: lxc-test-autostart
> >>>>>> PASS: lxc-test-basic
> >>>>>> PASS: lxc-test-capabilities
> >>>>>> PASS: lxc-test-cgpath
> >>>>>> PASS: lxc-test-checkpoint-restore
> >>>>>> FAIL: lxc-test-cloneconfig
> >>>>>> PASS: lxc-test-clonetest
> >>>>>> PASS: lxc-test-concurrent
> >>>>>> PASS: lxc-test-config-jump-table
> >>>>>> PASS: lxc-test-console
> >>>>>> PASS: lxc-test-console-log
> >>>>>> PASS: lxc-test-containertests
> >>>>>> PASS: lxc-test-createconfig
> >>>>>> PASS: lxc-test-createtest
> >>>>>> PASS: lxc-test-criu-check-feature
> >>>>>> PASS: lxc-test-cve-2019-5736
> >>>>>> PASS: lxc-test-destroytest
> >>>>>> PASS: lxc-test-device-add-remove
> >>>>>> PASS: lxc-test-exit-code
> >>>>>> FAIL: lxc-test-get_item
> >>>>>> PASS: lxc-test-getkeys
> >>>>>> PASS: lxc-test-list
> >>>>>> PASS: lxc-test-locktests
> >>>>>> PASS: lxc-test-lxc-attach
> >>>>>> PASS: lxc-test-lxcpath
> >>>>>> PASS: lxc-test-may-control
> >>>>>> PASS: lxc-test-mount-injection
> >>>>>> FAIL: lxc-test-no-new-privs
> >>>>>> PASS: lxc-test-parse-config-file
> >>>>>> PASS: lxc-test-proc-pid
> >>>>>> PASS: lxc-test-procsys
> >>>>>> PASS: lxc-test-raw-clone
> >>>>>> PASS: lxc-test-reboot
> >>>>>> PASS: lxc-test-rootfs
> >>>>>> PASS: lxc-test-rootfs-options
> >>>>>> PASS: lxc-test-saveconfig
> >>>>>> PASS: lxc-test-share-ns
> >>>>>> PASS: lxc-test-shortlived
> >>>>>> SKIPPED: lxc-test-shutdowntest
> >>>>>> FAIL: lxc-test-snapdeps
> >>>>>> PASS: lxc-test-snapshot
> >>>>>> PASS: lxc-test-startone
> >>>>>> SKIPPED: lxc-test-state-server
> >>>>>> PASS: lxc-test-symlink
> >>>>>> PASS: lxc-test-sys-mixed
> >>>>>> PASS: lxc-test-sysctls
> >>>>>> FAIL: lxc-test-unpriv
> >>>>>> FAIL: lxc-test-usernic
> >>>>>> PASS: lxc-test-usernsexec
> >>>>>> PASS: lxc-test-utils
> >>>>>>
> >>>>>> Results:
> >>>>>>        PASSED =3D 47
> >>>>>>        FAILED =3D 7
> >>>>>>        SKIPPED =3D 3
> >>>>>> (for details check individual test log in ./logs directory)
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Xiangyu Chen (1):
> >>>>>>      lxc: templates/lxc-busybox.in: if busybox contains init then =
use it
> >>>>>>
> >>>>>>     ...box-contains-init-use-it-in-containe.patch | 45 +++++++++++=
++++++++
> >>>>>>     recipes-containers/lxc/lxc_git.bb             |  1 +
> >>>>>>     2 files changed, 46 insertions(+)
> >>>>>>     create mode 100644 recipes-containers/lxc/files/0001-template-=
if-busybox-contains-init-use-it-in-containe.patch
> >>>>>>
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>
> >>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>> Links: You receive all messages sent to this group.
> >>>>>> View/Reply Online (#7908): https://lists.yoctoproject.org/g/meta-v=
irtualization/message/7908
> >>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/97306618/105081=
0
> >>>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/=
unsub [bruce.ashfield@gmail.com]
> >>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

