Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF06C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 00:46:21 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.9213.1678668380707776012
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Mar 2023 17:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T2+jDMqU;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id k17so4415695iob.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Mar 2023 17:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678668380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+rbK0EbravXyAk5zwgG8c0NpD4BHparLny+aCAJzLE=;
        b=T2+jDMqUZyGC7JV3yjTatPwTvAUOmltmmw/OcS+Qb+WF5FZwA2nzijkhAHeXzpE3D7
         fE5/GGE+eiE5AzQ9xMdj9ZbJOXeklcgBiwlWB51mpaoxQ+CfK1++ScJzwPXg+uQp/4Hl
         L7bYqKCPaRwHnaORSZQ97LxKBcQFSMVwSSBcDerlhFC38wUPFZUDpWYmTflnx4js1Vkt
         NflyqGJ4A71AeStl1BCk6GRKwGjTK3jO1GkPurWANENJv6idoEuqQ+XsB1ngCNqBvMkB
         SY0OR+uvRtKorJ69KUNPrPLxX4kFuEVyOIm3uPBQqZH+fJB6rEwyC0sNCR0pLbmNsIi+
         tAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678668380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+rbK0EbravXyAk5zwgG8c0NpD4BHparLny+aCAJzLE=;
        b=Vr4Y8wzei2T0nAdzklSTj7gnUTahtvYPeq1arIXKmVMnrV2afbVTaV++bYlq2iGfTi
         Se38i667V/8Ivjru772sHR5m2Kqpl1Sq7aC9FYTXc3P+b+sQo8KlNThnsEE2L584L+hF
         pN5wTQ5usj+qUKxzqBLHcvBih35eqcnKLQhERb39L31RjIXeboHuhI7B9CtFmLH0sXmo
         /LDAybsKc0KuoncEC6Vxq9RBQOdBIf+WWwbB/YxuNZk/LOUgO/5cMJ8CicYLGS07rDsx
         D2RWejtO4kS6gOjAwwFWblqyjWWt7TMYL2p46rNppqJ1jZ9LLOXDEA17mK/jkGfimAvs
         4HqA==
X-Gm-Message-State: AO0yUKVrVOWxMTGvpx53TnvLfZwCyf+x+5mJVDjpRcaRN/rxcOKUb46D
	ivzbgmtLY/MvLQsCKOGs1Y9o4pJ/OjmMHMU9k1qddBcd
X-Google-Smtp-Source: AK7set+CXKXTioJeh/wg3urfCaM27bF7q7Dcj3p0i31Z1ti+QsFl8NxXJ31isis3TSR5WI0o43OEjF36iW0VgkgJSO8=
X-Received: by 2002:a5e:8e49:0:b0:745:a851:1619 with SMTP id
 r9-20020a5e8e49000000b00745a8511619mr14710411ioo.3.1678668379788; Sun, 12 Mar
 2023 17:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
 <ZAEUIxX+2N+Xt6Ez@gmail.com> <83fefae9-c822-bdd9-488e-b237c033fa38@windriver.com>
 <CADkTA4OjL+XfzVK5nKb3JfXfa++ifhgfwp2SOxNweRXrX99FNQ@mail.gmail.com> <fdac15fe-933b-c765-33a1-5973df90f920@windriver.com>
In-Reply-To: <fdac15fe-933b-c765-33a1-5973df90f920@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 12 Mar 2023 20:46:08 -0400
Message-ID: <CADkTA4M485ucEDAf754n+S6ObwNqjHwmk1H0VdL1nPDhfMc4aw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in:
 if busybox contains init then use it
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Mar 2023 00:46:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7940

On Wed, Mar 8, 2023 at 10:49=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Hi Bruce,
>
>
> Sorry for being late,
>
> On 3/8/23 12:00, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Thu, Mar 2, 2023 at 8:17=E2=80=AFPM Xiangyu Chen
> > <xiangyu.chen@eng.windriver.com> wrote:
> >> Hi Bruce,
> >>
> >>
> >> On 3/3/23 05:24, Bruce Ashfield wrote:
> >>> CAUTION: This email comes from a non Wind River email account!
> >>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
> >>>
> >>> In message: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busyb=
ox.in: if busybox contains init then use it
> >>> on 01/03/2023 Xiangyu Chen wrote:
> >>>
> >>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>>>
> >>>> Hi Bruce,
> >>>>
> >>>> Recently we found that the lxc ptest has lots of failure cases as be=
low log-1, after checking the
> >>>> code, some cases failed due to related the init progess. For example=
, lxc-test-exit-code need to
> >>>> start container as daemon, but if using bash as init, the container =
cannot start correctly.
> >>> Is there an indication of what busybox is providing that bash isn't ?
> >> In my local setup, when using bash as container init, the container
> >> doesn't support "reboot" and cannot start correctly in a daemon mode,
> >> test step as below:
> >>
> >> lxc-create -t busybox -n t
> >>
> >> lxc-start -n t -d
> >>
> >> lxc-ls -f
> >>
> >> the container "t" status still in "STOPPED", but when we use a busybox
> >> init instead of bash, the container status is correct in daemon mode.
> >>
> > I'm setting up to test this myself, but generally speaking we should
> > include this detail in the commit log.
>
> Thanks, if we find the final root cause, I'll add our discussion
> information into the commit and send a v2 patch :p
>
>
> >
> >>> I don't like to force this in the ptest, while for actual lxc contain=
ers
> >>> we still allow bash, which means it may not be functional.
> >> This is a common template for lxc, but I am not sure whether others
> >> still need bash as lxc container init, so I based the patch
> >>
> >> "template-make-busybox-template-compatible-with-core-.patch" to add th=
e
> >> busybox back.
> >>
> > That's the part that concerns me. Why does our bash behave differently
> > than in other lxc integrations and other distros ?
> Currently, the behavior is when using lxc with busybox template in
> daemon mode, the status still stay in "STOPPED", but it's working well
> in foreground mode.
>
> > Do you have the ability to run the same simple tests you have above on
> > a desktop distro ?
>
> I have setup a virtualbox today and did some test with trace, here is
> something I was found:
>
> As above mentioned,  lxc working well in foreground mode but something
> wrong with daemon mode, according to manual of lxc-start, the foreground
> mode attach the tty to /dev/console, but daemon mode doesn't.
>

And to confirm, this is running on something like ubuntu, using the
ubuntu bash ?


> I was enable the lxc debug trace as below when start a container with
> daemon mode (part of init related log and remove timestamp and full
> source code path)
>
> ##### lxc-start -n t -o /tmp/log.txt -l TRACE  -d #####
>
> start - /src/lxc/start.c:post_start:2205 - Started "/sbin/init" with pid
> "871"
> start - /src/lxc/start.c:lxc_serve_state_clients:483 - Set container
> state to RUNNING
>
> <<<<<<<<< we can see the bash as init was starting, and lxc update mode
>
> start - /src/lxc/start.c:lxc_serve_state_clients:486 - No state clients
> registered
> mainloop - /src/lxc/mainloop.c:__epoll_open:493 - Created epoll instance
> mainloop - /mainloop.c:__epoll_open:493 - Created epoll instance
> start - /src/lxc/start.c:lxc_poll:626 - Mainloop is ready
> start - /src/lxc/start.c:signal_handler:396 - Received signal
> ssi_signo(17) for ssi_pid(871), si_signo(17), si_pid(871)
> start - /src/lxc/start.c:signal_handler:464 - Container init process 871
> exited
>
> <<<<<<<<<< seems something wrong with the init, it exited and lxc got
> the exit signal.
>
> start - /src/lxc/start.c:lxc_poll:643 - Closed console mainloop
> start - /src/lxc/start.c:lxc_poll:648 - Closed mainloop
> start - /src/lxc/start.c:lxc_poll:651 - Closed signal file descriptor 7
> ..... removed some networking teminating related trace .....
> start - /src/lxc/start.c:lxc_serve_state_clients:483 - Set container
> state to STOPPING
>
> <<<<<<<<<<< now the lxc set container mode back to stop mode.
>
> start - /src/lxc/start.c:lxc_serve_state_clients:486 - No state clients
> registered
> ##### end of lxc-start -n t -o /tmp/log.txt -l TRACE  -d #####
>
>
> Let's use strace to see what happens in container(part of init related lo=
g):
>
> #####strace -s 1024 -f lxc-start -n t -d #####
>
> [pid  1211] execve("/sbin/init", ["/sbin/init"], 0x55a07c90eb30 /* 1 var
> */ <unfinished ...>
> ......
>
> [pid  1211] ioctl(2, TIOCGPGRP, 0x7fffe212610c) =3D -1 ENOTTY
> (Inappropriate ioctl for device)
> [pid  1211] rt_sigaction(SIGCHLD, {sa_handler=3D0x5632e07dcec0,
> sa_mask=3D[], sa_flags=3DSA_RESTORER|SA_RESTART,
> sa_restorer=3D0x7f1237db3190}, {sa_handler=3DSIG_DFL, sa_mask=3D[],
> sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7f1237db3190}, 8) =3D =
0
> [pid  1211] ioctl(2, TIOCGPGRP, 0x7fffe21260ec) =3D -1 ENOTTY
> (Inappropriate ioctl for device)
> [pid  1211] prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=3D3818,
> rlim_max=3D3818}) =3D 0
> [pid  1211] rt_sigprocmask(SIG_BLOCK, NULL, [], 8) =3D 0
> [pid  1211] fcntl(0, F_GETFL)           =3D 0x8002 (flags O_RDWR|O_LARGEF=
ILE)
> [pid  1211] newfstatat(0, "", {st_mode=3DS_IFCHR|0666,
> st_rdev=3Dmakedev(0x1, 0x3), ...}, AT_EMPTY_PATH) =3D 0
> [pid  1211] lseek(0, 0, SEEK_CUR)       =3D 0
> [pid  1211] read(0, "", 1)              =3D 0
> [pid  1211] rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
> [pid  1211] rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
> [pid  1211] exit_group(0)               =3D ?
> [pid  1211] +++ exited with 0 +++
> #####end of strace -s 1024 -f lxc-start -n t -d #####
>
> it looks that seems bash stdi/o/err cannot attach the available caused
> this issue, right?

It does look like that. When busybox is used as init, do you have a
similar strace ? I'd like to do that comparison.

Bruce

>
>
> > I don't want to force this switch to busybox, without understanding if
> > we are the only ones seeing this issue .. since that means we are
> > simply hiding an issue, versus fixing it.
>
> Yes indeed, if someone is using systemd as init, they need to add extra
> configurations to setup busybox and keep default systemd init cannot be
> replaced by busybox in local.conf .
>
>
> Thanks,
>
> Xiangyu
>
> > Bruce
> >>> There are other init options in meta-virt, like the docker tini, if w=
e
> >>> had to enforce something, I'd rather that than busybox.
> >> Good to hear the tini :)
> >>
> >> Indeed, enable the busybox-init might need lots of additional effort t=
o
> >> take care of system which using systemd, otherwise, /sbin/init always =
to
> >> be covered by busybox.
> >>
> >>> Bruce
> >>
> >> Br,
> >>
> >> Xiangyu
> >>
> >>
> >>>> So added a busybox init utils checking in lxc-busybox template, if c=
urrent system busybox contains
> >>>> init then use it, after applying this patch, the ptest result as log=
-2.
> >>>>
> >>>>
> >>>> ######## 1og-1: ptest without patch #######
> >>>>
> >>>> Starting LXC ptest ###
> >>>> FAIL: lxc-test-api-reboot
> >>>> SKIPPED: lxc-test-apparmor
> >>>> PASS: lxc-test-apparmor-generated
> >>>> FAIL: lxc-test-apparmor-mount
> >>>> PASS: lxc-test-arch-parse
> >>>> FAIL: lxc-test-attach
> >>>> PASS: lxc-test-automount
> >>>> FAIL: lxc-test-autostart
> >>>> PASS: lxc-test-basic
> >>>> FAIL: lxc-test-capabilities
> >>>> FAIL: lxc-test-cgpath
> >>>> PASS: lxc-test-checkpoint-restore
> >>>> FAIL: lxc-test-cloneconfig
> >>>> FAIL: lxc-test-clonetest
> >>>> FAIL: lxc-test-concurrent
> >>>> PASS: lxc-test-config-jump-table
> >>>> FAIL: lxc-test-console
> >>>> FAIL: lxc-test-console-log
> >>>> FAIL: lxc-test-containertests
> >>>> FAIL: lxc-test-createconfig
> >>>> FAIL: lxc-test-createtest
> >>>> PASS: lxc-test-criu-check-feature
> >>>> FAIL: lxc-test-cve-2019-5736
> >>>> FAIL: lxc-test-destroytest
> >>>> FAIL: lxc-test-device-add-remove
> >>>> FAIL: lxc-test-exit-code
> >>>> FAIL: lxc-test-get_item
> >>>> PASS: lxc-test-getkeys
> >>>> PASS: lxc-test-list
> >>>> PASS: lxc-test-locktests
> >>>> FAIL: lxc-test-lxc-attach
> >>>> PASS: lxc-test-lxcpath
> >>>> PASS: lxc-test-may-control
> >>>> FAIL: lxc-test-mount-injection
> >>>> FAIL: lxc-test-no-new-privs
> >>>> PASS: lxc-test-parse-config-file
> >>>> FAIL: lxc-test-proc-pid
> >>>> FAIL: lxc-test-procsys
> >>>> PASS: lxc-test-raw-clone
> >>>> PASS: lxc-test-reboot
> >>>> FAIL: lxc-test-rootfs
> >>>> FAIL: lxc-test-rootfs-options
> >>>> FAIL: lxc-test-saveconfig
> >>>> FAIL: lxc-test-share-ns
> >>>> FAIL: lxc-test-shortlived
> >>>> SKIPPED: lxc-test-shutdowntest
> >>>> FAIL: lxc-test-snapdeps
> >>>> FAIL: lxc-test-snapshot
> >>>> FAIL: lxc-test-startone
> >>>> SKIPPED: lxc-test-state-server
> >>>> FAIL: lxc-test-symlink
> >>>> FAIL: lxc-test-sys-mixed
> >>>> FAIL: lxc-test-sysctls
> >>>> FAIL: lxc-test-unpriv
> >>>> FAIL: lxc-test-usernic
> >>>> PASS: lxc-test-usernsexec
> >>>> PASS: lxc-test-utils
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> Results:
> >>>>       PASSED =3D 17
> >>>>       FAILED =3D 37
> >>>>       SKIPPED =3D 3
> >>>> (for details check individual test log in ./logs directory)
> >>>>
> >>>>
> >>>> ###########log-2: ptest with patch ###################
> >>>> root@intel-x86-64:/usr/lib64/lxc/ptest# ./run-ptest
> >>>> ### Starting LXC ptest ###
> >>>> PASS: lxc-test-api-reboot
> >>>> SKIPPED: lxc-test-apparmor
> >>>> PASS: lxc-test-apparmor-generated
> >>>> FAIL: lxc-test-apparmor-mount
> >>>> PASS: lxc-test-arch-parse
> >>>> PASS: lxc-test-attach
> >>>> PASS: lxc-test-automount
> >>>> PASS: lxc-test-autostart
> >>>> PASS: lxc-test-basic
> >>>> PASS: lxc-test-capabilities
> >>>> PASS: lxc-test-cgpath
> >>>> PASS: lxc-test-checkpoint-restore
> >>>> FAIL: lxc-test-cloneconfig
> >>>> PASS: lxc-test-clonetest
> >>>> PASS: lxc-test-concurrent
> >>>> PASS: lxc-test-config-jump-table
> >>>> PASS: lxc-test-console
> >>>> PASS: lxc-test-console-log
> >>>> PASS: lxc-test-containertests
> >>>> PASS: lxc-test-createconfig
> >>>> PASS: lxc-test-createtest
> >>>> PASS: lxc-test-criu-check-feature
> >>>> PASS: lxc-test-cve-2019-5736
> >>>> PASS: lxc-test-destroytest
> >>>> PASS: lxc-test-device-add-remove
> >>>> PASS: lxc-test-exit-code
> >>>> FAIL: lxc-test-get_item
> >>>> PASS: lxc-test-getkeys
> >>>> PASS: lxc-test-list
> >>>> PASS: lxc-test-locktests
> >>>> PASS: lxc-test-lxc-attach
> >>>> PASS: lxc-test-lxcpath
> >>>> PASS: lxc-test-may-control
> >>>> PASS: lxc-test-mount-injection
> >>>> FAIL: lxc-test-no-new-privs
> >>>> PASS: lxc-test-parse-config-file
> >>>> PASS: lxc-test-proc-pid
> >>>> PASS: lxc-test-procsys
> >>>> PASS: lxc-test-raw-clone
> >>>> PASS: lxc-test-reboot
> >>>> PASS: lxc-test-rootfs
> >>>> PASS: lxc-test-rootfs-options
> >>>> PASS: lxc-test-saveconfig
> >>>> PASS: lxc-test-share-ns
> >>>> PASS: lxc-test-shortlived
> >>>> SKIPPED: lxc-test-shutdowntest
> >>>> FAIL: lxc-test-snapdeps
> >>>> PASS: lxc-test-snapshot
> >>>> PASS: lxc-test-startone
> >>>> SKIPPED: lxc-test-state-server
> >>>> PASS: lxc-test-symlink
> >>>> PASS: lxc-test-sys-mixed
> >>>> PASS: lxc-test-sysctls
> >>>> FAIL: lxc-test-unpriv
> >>>> FAIL: lxc-test-usernic
> >>>> PASS: lxc-test-usernsexec
> >>>> PASS: lxc-test-utils
> >>>>
> >>>> Results:
> >>>>       PASSED =3D 47
> >>>>       FAILED =3D 7
> >>>>       SKIPPED =3D 3
> >>>> (for details check individual test log in ./logs directory)
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> Xiangyu Chen (1):
> >>>>     lxc: templates/lxc-busybox.in: if busybox contains init then use=
 it
> >>>>
> >>>>    ...box-contains-init-use-it-in-containe.patch | 45 ++++++++++++++=
+++++
> >>>>    recipes-containers/lxc/lxc_git.bb             |  1 +
> >>>>    2 files changed, 46 insertions(+)
> >>>>    create mode 100644 recipes-containers/lxc/files/0001-template-if-=
busybox-contains-init-use-it-in-containe.patch
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#7908): https://lists.yoctoproject.org/g/meta-vir=
tualization/message/7908
> >>>> Mute This Topic: https://lists.yoctoproject.org/mt/97306618/1050810
> >>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/un=
sub [bruce.ashfield@gmail.com]
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>
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

