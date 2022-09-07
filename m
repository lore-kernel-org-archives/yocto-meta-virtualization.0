Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC367ECAAD5
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 02:41:21 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.3365.1662518473848885121
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 19:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kpxuRr7V;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id t3so8063408ply.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 19:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sXqpVsyfGl232riST4X46GvzY8rQCKL4dERIkzaGdrk=;
        b=kpxuRr7V6xT54uKs6aoACCBkW1lDtBYB8MsKEOt4E56v3BYAHsq1V7KhW/VDJXgfvq
         tpFBYjudqiEp/vktomSnhbV014dewVzJrPOJ1VEax6yaNHmzp2rkx/eEC5bXnXY1YP3E
         rPTCZNIVHb8TUMLPMaAu/i4y2Kj6CypW4k3VcPd565S1dx6YqkQgy4tzpqCPQldtb7iw
         6oVAUhECSe8FDGXle7KXCNnImSWZ5umvTVC1gTvKjuemmsJ6K4PLQGsQ1dCU9vE8JFNr
         hvEgETZlu36KvBb/y37uHWkpf/oV3tiS7L6BFuJFh3vNYxOahggMjWQDyyQeoUlQk8tq
         w4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sXqpVsyfGl232riST4X46GvzY8rQCKL4dERIkzaGdrk=;
        b=vGbRq++S4Q5KPxdvanGPudS3Sxqapv1zwV3dykamVKy9orabyN2meox6p5L1C4o7/+
         ZHiqWw6psjeRgLUzT84498ClkaVeGQ1zLO24M3ZzrEHbNTK+eTo4gy+HG3aC0LOqrUtb
         Qye9UzP6pd4FCX1lkYZzC1URXdpO+lBv7ztVQ7O3c7h6KBEKE3iFVlUjTKlogFsjZC49
         G1lcavX8nMZYNoWfWD5hj4KgDYAAIFpcGzMq7jGi3A2FAjhgyLbPI3pJkKUkMxiu2P6f
         /ljMPT6/nQVxDNr4dYQN/sUXD9GiD5G8CoqNZBrbtO9rbRrtGgfGMwU1wvHQZHRwqh/h
         BJWQ==
X-Gm-Message-State: ACgBeo1Jz+MO8XIKHQHSvr0g0m4VKFrVk9ncXYMcZjY9RBaEQATnQB/t
	2BDI3fN2ev9rOx75EeepKA1B1T8ClnVaV4Uy5e+PvA7I
X-Google-Smtp-Source: 
 AA6agR64bxqLXL42eqbyD4u1A3mvmOrq6rZ/UPU6Uv5o1NJZ7REPbGAr7TkZ3fN3cH7ex3it7rrR41qOo1yegJ4yvHY=
X-Received: by 2002:a17:902:7c94:b0:170:aed6:7e6c with SMTP id
 y20-20020a1709027c9400b00170aed67e6cmr1685108pll.10.1662518472957; Tue, 06
 Sep 2022 19:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220902033119.1463-1-kai.kang@windriver.com>
In-Reply-To: <20220902033119.1463-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Sep 2022 22:41:01 -0400
Message-ID: 
 <CADkTA4N8sau9QLn2g6nGtCd0jGAVrrjWoX=WGD6yrQ87p6-OSQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] criu: fix build errors with glibc
 2.36
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Sep 2022 02:41:21 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7604

criu is a _git recipe, so we don't have to do backports, but can
instead just bump the SRCREV

We also have time to bump it to the latest before the upcoming release.

Is there a reason why a version or SRCREV bump won't work here ?

Bruce

On Thu, Sep 1, 2022 at 11:31 PM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Backport patches to fix build errors with glibc 2.36.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb           |   4 +-
>  .../0004-criu-fix-conflicting-headers.patch   | 288 ++++++++++++++++++
>  ...nt-add-definition-for-FSOPEN_CLOEXEC.patch | 110 +++++++
>  3 files changed, 401 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
>  create mode 100644 recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
>
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 46401f9..a218310 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -20,7 +20,9 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=master;protocol=h
>             file://0001-criu-Skip-documentation-install.patch \
>             file://0002-criu-Change-libraries-install-directory.patch \
>             file://0003-lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
> -          "
> +           file://0004-criu-fix-conflicting-headers.patch \
> +           file://0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch \
> +           "
>
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
>
> diff --git a/recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch b/recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
> new file mode 100644
> index 0000000..fa4cecd
> --- /dev/null
> +++ b/recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
> @@ -0,0 +1,288 @@
> +Backport patch to fix criu compile error with glibc 2.36. Update context
> +for Makefile.config.
> +
> +Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/4c86d6a7]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From 4c86d6a7d54abb64fc5a15131f3351224e8c071b Mon Sep 17 00:00:00 2001
> +From: Radostin Stoyanov <rstoyanov@fedoraproject.org>
> +Date: Sun, 31 Jul 2022 16:07:30 +0000
> +Subject: [PATCH] criu: fix conflicting headers
> +
> +There are several changes in glibc 2.36 that make sys/mount.h header
> +incompatible with kernel headers:
> +
> +https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
> +
> +This patch removes conflicting includes for `<linux/mount.h>` and
> +updates the content of `criu/include/linux/mount.h` to match
> +`/usr/include/sys/mount.h`. In addition, inline definitions sys_*()
> +functions have been moved from "linux/mount.h" to "syscall.h" to
> +avoid conflicts with `uapi/compel/plugins/std/syscall.h` and
> +`<unistd.h>`. The include for `<linux/aio_abi.h>` has been replaced
> +with local include to avoid conflicts with `<sys/mount.h>`.
> +
> +Fixes: #1949
> +
> +Signed-off-by: Radostin Stoyanov <rstoyanov@fedoraproject.org>
> +---
> + Makefile.config              |  2 +-
> + criu/cgroup.c                |  1 +
> + criu/cr-check.c              |  2 +-
> + criu/cr-restore.c            |  3 ++-
> + criu/include/aio.h           |  2 +-
> + criu/include/linux/aio_abi.h | 14 +++++++++++
> + criu/include/linux/mount.h   | 48 +++++++++++++++++++-----------------
> + criu/include/syscall.h       | 17 +++++++++++++
> + criu/pie/parasite.c          |  2 +-
> + criu/util.c                  |  1 +
> + scripts/feature-tests.mak    | 13 ----------
> + 11 files changed, 64 insertions(+), 41 deletions(-)
> + create mode 100644 criu/include/linux/aio_abi.h
> + create mode 100644 criu/include/syscall.h
> +
> +diff --git a/Makefile.config b/Makefile.config
> +index d113e2246..270ec61c0 100644
> +--- a/Makefile.config
> ++++ b/Makefile.config
> +@@ -78,7 +78,7 @@ export DEFINES += $(FEATURE_DEFINES)
> + export CFLAGS += $(FEATURE_DEFINES)
> +
> + FEATURES_LIST := TCP_REPAIR STRLCPY STRLCAT PTRACE_PEEKSIGINFO \
> +-      SETPROCTITLE_INIT MEMFD TCP_REPAIR_WINDOW FSCONFIG MEMFD_CREATE OPENAT2
> ++      SETPROCTITLE_INIT MEMFD TCP_REPAIR_WINDOW MEMFD_CREATE OPENAT2
> +
> + # $1 - config name
> + define gen-feature-test
> +diff --git a/criu/cgroup.c b/criu/cgroup.c
> +index e05b0832e..325df6a1d 100644
> +--- a/criu/cgroup.c
> ++++ b/criu/cgroup.c
> +@@ -27,6 +27,7 @@
> + #include "images/cgroup.pb-c.h"
> + #include "kerndat.h"
> + #include "linux/mount.h"
> ++#include "syscall.h"
> +
> + /*
> +  * This structure describes set of controller groups
> +diff --git a/criu/cr-check.c b/criu/cr-check.c
> +index f589a91da..0ca80192c 100644
> +--- a/criu/cr-check.c
> ++++ b/criu/cr-check.c
> +@@ -21,7 +21,6 @@
> + #include <sys/prctl.h>
> + #include <sched.h>
> + #include <sys/mount.h>
> +-#include <linux/aio_abi.h>
> +
> + #include "../soccr/soccr.h"
> +
> +@@ -52,6 +51,7 @@
> + #include "net.h"
> + #include "restorer.h"
> + #include "uffd.h"
> ++#include "linux/aio_abi.h"
> +
> + #include "images/inventory.pb-c.h"
> +
> +diff --git a/criu/cr-restore.c b/criu/cr-restore.c
> +index 279246c19..d11d28173 100644
> +--- a/criu/cr-restore.c
> ++++ b/criu/cr-restore.c
> +@@ -22,7 +22,6 @@
> + #include <compel/ptrace.h>
> + #include "common/compiler.h"
> +
> +-#include "linux/mount.h"
> + #include "linux/rseq.h"
> +
> + #include "clone-noasan.h"
> +@@ -86,6 +85,8 @@
> + #include <compel/plugins/std/syscall-codes.h>
> + #include "compel/include/asm/syscall.h"
> +
> ++#include "linux/mount.h"
> ++
> + #include "protobuf.h"
> + #include "images/sa.pb-c.h"
> + #include "images/timer.pb-c.h"
> +diff --git a/criu/include/aio.h b/criu/include/aio.h
> +index d1655739d..38e704020 100644
> +--- a/criu/include/aio.h
> ++++ b/criu/include/aio.h
> +@@ -1,7 +1,7 @@
> + #ifndef __CR_AIO_H__
> + #define __CR_AIO_H__
> +
> +-#include <linux/aio_abi.h>
> ++#include "linux/aio_abi.h"
> + #include "images/mm.pb-c.h"
> + unsigned int aio_estimate_nr_reqs(unsigned int size);
> + int dump_aio_ring(MmEntry *mme, struct vma_area *vma);
> +diff --git a/criu/include/linux/aio_abi.h b/criu/include/linux/aio_abi.h
> +new file mode 100644
> +index 000000000..d9ce78720
> +--- /dev/null
> ++++ b/criu/include/linux/aio_abi.h
> +@@ -0,0 +1,14 @@
> ++#ifndef __LINUX__AIO_ABI_H
> ++#define __LINUX__AIO_ABI_H
> ++
> ++typedef __kernel_ulong_t aio_context_t;
> ++
> ++/* read() from /dev/aio returns these structures. */
> ++struct io_event {
> ++      __u64 data; /* the data field from the iocb */
> ++      __u64 obj;  /* what iocb this event came from */
> ++      __s64 res;  /* result code for this event */
> ++      __s64 res2; /* secondary result */
> ++};
> ++
> ++#endif /* __LINUX__AIO_ABI_H */
> +diff --git a/criu/include/linux/mount.h b/criu/include/linux/mount.h
> +index 9a3a28b10..0d55a588c 100644
> +--- a/criu/include/linux/mount.h
> ++++ b/criu/include/linux/mount.h
> +@@ -4,32 +4,34 @@
> + #include "common/config.h"
> + #include "compel/plugins/std/syscall-codes.h"
> +
> +-#ifdef CONFIG_HAS_FSCONFIG
> +-#include <linux/mount.h>
> +-#else
> ++/* Copied from /usr/include/sys/mount.h */
> ++
> ++#ifndef FSCONFIG_CMD_CREATE
> ++/* The type of fsconfig call made.   */
> + enum fsconfig_command {
> +-      FSCONFIG_SET_FLAG = 0,        /* Set parameter, supplying no value */
> +-      FSCONFIG_SET_STRING = 1,      /* Set parameter, supplying a string value */
> +-      FSCONFIG_SET_BINARY = 2,      /* Set parameter, supplying a binary blob value */
> +-      FSCONFIG_SET_PATH = 3,        /* Set parameter, supplying an object by path */
> +-      FSCONFIG_SET_PATH_EMPTY = 4,  /* Set parameter, supplying an object by (empty) path */
> +-      FSCONFIG_SET_FD = 5,          /* Set parameter, supplying an object by fd */
> +-      FSCONFIG_CMD_CREATE = 6,      /* Invoke superblock creation */
> ++      FSCONFIG_SET_FLAG = 0, /* Set parameter, supplying no value */
> ++#define FSCONFIG_SET_FLAG FSCONFIG_SET_FLAG
> ++      FSCONFIG_SET_STRING = 1, /* Set parameter, supplying a string value */
> ++#define FSCONFIG_SET_STRING FSCONFIG_SET_STRING
> ++      FSCONFIG_SET_BINARY = 2, /* Set parameter, supplying a binary blob value */
> ++#define FSCONFIG_SET_BINARY FSCONFIG_SET_BINARY
> ++      FSCONFIG_SET_PATH = 3, /* Set parameter, supplying an object by path */
> ++#define FSCONFIG_SET_PATH FSCONFIG_SET_PATH
> ++      FSCONFIG_SET_PATH_EMPTY = 4, /* Set parameter, supplying an object by (empty) path */
> ++#define FSCONFIG_SET_PATH_EMPTY FSCONFIG_SET_PATH_EMPTY
> ++      FSCONFIG_SET_FD = 5, /* Set parameter, supplying an object by fd */
> ++#define FSCONFIG_SET_FD FSCONFIG_SET_FD
> ++      FSCONFIG_CMD_CREATE = 6, /* Invoke superblock creation */
> ++#define FSCONFIG_CMD_CREATE FSCONFIG_CMD_CREATE
> +       FSCONFIG_CMD_RECONFIGURE = 7, /* Invoke superblock reconfiguration */
> ++#define FSCONFIG_CMD_RECONFIGURE FSCONFIG_CMD_RECONFIGURE
> + };
> +-#endif
> ++#endif // FSCONFIG_CMD_CREATE
> +
> +-static inline int sys_fsopen(const char *fsname, unsigned int flags)
> +-{
> +-      return syscall(__NR_fsopen, fsname, flags);
> +-}
> +-static inline int sys_fsconfig(int fd, unsigned int cmd, const char *key, const char *value, int aux)
> +-{
> +-      return syscall(__NR_fsconfig, fd, cmd, key, value, aux);
> +-}
> +-static inline int sys_fsmount(int fd, unsigned int flags, unsigned int attr_flags)
> +-{
> +-      return syscall(__NR_fsmount, fd, flags, attr_flags);
> +-}
> ++#ifndef MS_MGC_VAL
> ++/* Magic mount flag number. Has to be or-ed to the flag values.  */
> ++#define MS_MGC_VAL 0xc0ed0000 /* Magic flag number to indicate "new" flags */
> ++#define MS_MGC_MSK 0xffff0000 /* Magic flag number mask */
> ++#endif
> +
> + #endif
> +diff --git a/criu/include/syscall.h b/criu/include/syscall.h
> +new file mode 100644
> +index 000000000..c38d6d971
> +--- /dev/null
> ++++ b/criu/include/syscall.h
> +@@ -0,0 +1,17 @@
> ++#ifndef __CR_SYSCALL_H__
> ++#define __CR_SYSCALL_H__
> ++
> ++static inline int sys_fsopen(const char *fsname, unsigned int flags)
> ++{
> ++      return syscall(__NR_fsopen, fsname, flags);
> ++}
> ++static inline int sys_fsconfig(int fd, unsigned int cmd, const char *key, const char *value, int aux)
> ++{
> ++      return syscall(__NR_fsconfig, fd, cmd, key, value, aux);
> ++}
> ++static inline int sys_fsmount(int fd, unsigned int flags, unsigned int attr_flags)
> ++{
> ++      return syscall(__NR_fsmount, fd, flags, attr_flags);
> ++}
> ++
> ++#endif /* __CR_SYSCALL_H__ */
> +\ No newline at end of file
> +diff --git a/criu/pie/parasite.c b/criu/pie/parasite.c
> +index e7eb1fcb6..f75fe13bb 100644
> +--- a/criu/pie/parasite.c
> ++++ b/criu/pie/parasite.c
> +@@ -3,7 +3,6 @@
> + #include <signal.h>
> + #include <linux/limits.h>
> + #include <linux/capability.h>
> +-#include <sys/mount.h>
> + #include <stdarg.h>
> + #include <sys/ioctl.h>
> + #include <sys/uio.h>
> +@@ -14,6 +13,7 @@
> + #include "int.h"
> + #include "types.h"
> + #include <compel/plugins/std/syscall.h>
> ++#include "linux/mount.h"
> + #include "parasite.h"
> + #include "fcntl.h"
> + #include "prctl.h"
> +diff --git a/criu/util.c b/criu/util.c
> +index 5f69465b4..060ca3bd4 100644
> +--- a/criu/util.c
> ++++ b/criu/util.c
> +@@ -40,6 +40,7 @@
> + #include "mem.h"
> + #include "namespaces.h"
> + #include "criu-log.h"
> ++#include "syscall.h"
> +
> + #include "clone-noasan.h"
> + #include "cr_options.h"
> +diff --git a/scripts/feature-tests.mak b/scripts/feature-tests.mak
> +index 014e893a8..fb5d2ef7a 100644
> +--- a/scripts/feature-tests.mak
> ++++ b/scripts/feature-tests.mak
> +@@ -137,19 +137,6 @@ ENTRY(main)
> + END(main)
> + endef
> +
> +-define FEATURE_TEST_FSCONFIG
> +-
> +-#include <linux/mount.h>
> +-
> +-int main(void)
> +-{
> +-      if (FSCONFIG_CMD_CREATE > 0)
> +-              return 0;
> +-      return 0;
> +-}
> +-
> +-endef
> +-
> + define FEATURE_TEST_NFTABLES_LIB_API_0
> +
> + #include <string.h>
> +--
> +2.34.1
> +
> diff --git a/recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch b/recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
> new file mode 100644
> index 0000000..dc41d36
> --- /dev/null
> +++ b/recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
> @@ -0,0 +1,110 @@
> +Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/517c0947]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From 517c0947050e63aac72f63a3bf373d76264723b9 Mon Sep 17 00:00:00 2001
> +From: Radostin Stoyanov <rstoyanov@fedoraproject.org>
> +Date: Wed, 24 Aug 2022 21:20:30 +0200
> +Subject: [PATCH 2/2] mount: add definition for FSOPEN_CLOEXEC
> +
> +A recent change in glibc introduced `enum fsconfig_command` [1] and as a
> +result the compilation of criu fails with the following errors
> +
> +In file included from criu/pie/util.c:3:
> +/usr/include/sys/mount.h:240:6: error: redeclaration of 'enum fsconfig_command'
> +  240 | enum fsconfig_command
> +      |      ^~~~~~~~~~~~~~~~
> +In file included from /usr/include/sys/mount.h:32:
> +criu/include/linux/mount.h:11:6: note: originally defined here
> +   11 | enum fsconfig_command {
> +      |      ^~~~~~~~~~~~~~~~
> +/usr/include/sys/mount.h:242:3: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
> +  242 |   FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
> +      |   ^~~~~~~~~~~~~~~~~
> +criu/include/linux/mount.h:12:9: note: previous definition of 'FSCONFIG_SET_FLAG' with type 'enum fsconfig_command'
> +   12 |         FSCONFIG_SET_FLAG = 0, /* Set parameter, supplying no value */
> +      |         ^~~~~~~~~~~~~~~~~
> +/usr/include/sys/mount.h:244:3: error: redeclaration of enumerator 'FSCONFIG_SET_STRING'
> +  244 |   FSCONFIG_SET_STRING     = 1,    /* Set parameter, supplying a string value */
> +      |   ^~~~~~~~~~~~~~~~~~~
> +criu/include/linux/mount.h:14:9: note: previous definition of 'FSCONFIG_SET_STRING' with type 'enum fsconfig_command'
> +   14 |         FSCONFIG_SET_STRING = 1, /* Set parameter, supplying a string value */
> +      |         ^~~~~~~~~~~~~~~~~~~
> +/usr/include/sys/mount.h:246:3: error: redeclaration of enumerator 'FSCONFIG_SET_BINARY'
> +  246 |   FSCONFIG_SET_BINARY     = 2,    /* Set parameter, supplying a binary blob value */
> +      |   ^~~~~~~~~~~~~~~~~~~
> +criu/include/linux/mount.h:16:9: note: previous definition of 'FSCONFIG_SET_BINARY' with type 'enum fsconfig_command'
> +   16 |         FSCONFIG_SET_BINARY = 2, /* Set parameter, supplying a binary blob value */
> +      |         ^~~~~~~~~~~~~~~~~~~
> +/usr/include/sys/mount.h:248:3: error: redeclaration of enumerator 'FSCONFIG_SET_PATH'
> +  248 |   FSCONFIG_SET_PATH       = 3,    /* Set parameter, supplying an object by path */
> +      |   ^~~~~~~~~~~~~~~~~
> +criu/include/linux/mount.h:18:9: note: previous definition of 'FSCONFIG_SET_PATH' with type 'enum fsconfig_command'
> +   18 |         FSCONFIG_SET_PATH = 3, /* Set parameter, supplying an object by path */
> +      |         ^~~~~~~~~~~~~~~~~
> +/usr/include/sys/mount.h:250:3: error: redeclaration of enumerator 'FSCONFIG_SET_PATH_EMPTY'
> +  250 |   FSCONFIG_SET_PATH_EMPTY = 4,    /* Set parameter, supplying an object by (empty) path */
> +      |   ^~~~~~~~~~~~~~~~~~~~~~~
> +criu/include/linux/mount.h:20:9: note: previous definition of 'FSCONFIG_SET_PATH_EMPTY' with type 'enum fsconfig_command'
> +   20 |         FSCONFIG_SET_PATH_EMPTY = 4, /* Set parameter, supplying an object by (empty) path */
> +      |         ^~~~~~~~~~~~~~~~~~~~~~~
> +/usr/include/sys/mount.h:252:3: error: redeclaration of enumerator 'FSCONFIG_SET_FD'
> +  252 |   FSCONFIG_SET_FD         = 5,    /* Set parameter, supplying an object by fd */
> +      |   ^~~~~~~~~~~~~~~
> +criu/include/linux/mount.h:22:9: note: previous definition of 'FSCONFIG_SET_FD' with type 'enum fsconfig_command'
> +   22 |         FSCONFIG_SET_FD = 5, /* Set parameter, supplying an object by fd */
> +      |         ^~~~~~~~~~~~~~~
> +/usr/include/sys/mount.h:254:3: error: redeclaration of enumerator 'FSCONFIG_CMD_CREATE'
> +  254 |   FSCONFIG_CMD_CREATE     = 6,    /* Invoke superblock creation */
> +      |   ^~~~~~~~~~~~~~~~~~~
> +criu/include/linux/mount.h:24:9: note: previous definition of 'FSCONFIG_CMD_CREATE' with type 'enum fsconfig_command'
> +   24 |         FSCONFIG_CMD_CREATE = 6, /* Invoke superblock creation */
> +      |         ^~~~~~~~~~~~~~~~~~~
> +/usr/include/sys/mount.h:256:3: error: redeclaration of enumerator 'FSCONFIG_CMD_RECONFIGURE'
> +  256 |   FSCONFIG_CMD_RECONFIGURE = 7,   /* Invoke superblock reconfiguration */
> +      |   ^~~~~~~~~~~~~~~~~~~~~~~~
> +criu/include/linux/mount.h:26:9: note: previous definition of 'FSCONFIG_CMD_RECONFIGURE' with type 'enum fsconfig_command'
> +   26 |         FSCONFIG_CMD_RECONFIGURE = 7, /* Invoke superblock reconfiguration */
> +
> +This patch adds definition for FSOPEN_CLOEXEC to solve this problem. In particular,
> +sys/mount.h includes ifndef check for FSOPEN_CLOEXEC surrounding `enum fsconfig_command`.
> +
> +[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=7eae6a91e9b1670330c9f15730082c91c0b1d570
> +
> +Reported-by: Younes Manton (@ymanton)
> +Signed-off-by: Radostin Stoyanov <rstoyanov@fedoraproject.org>
> +---
> + criu/include/linux/mount.h | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/criu/include/linux/mount.h b/criu/include/linux/mount.h
> +index 0d55a588c..fefafa89e 100644
> +--- a/criu/include/linux/mount.h
> ++++ b/criu/include/linux/mount.h
> +@@ -6,7 +6,7 @@
> +
> + /* Copied from /usr/include/sys/mount.h */
> +
> +-#ifndef FSCONFIG_CMD_CREATE
> ++#ifndef FSOPEN_CLOEXEC
> + /* The type of fsconfig call made.   */
> + enum fsconfig_command {
> +       FSCONFIG_SET_FLAG = 0, /* Set parameter, supplying no value */
> +@@ -26,7 +26,13 @@ enum fsconfig_command {
> +       FSCONFIG_CMD_RECONFIGURE = 7, /* Invoke superblock reconfiguration */
> + #define FSCONFIG_CMD_RECONFIGURE FSCONFIG_CMD_RECONFIGURE
> + };
> +-#endif // FSCONFIG_CMD_CREATE
> ++
> ++#endif // FSOPEN_CLOEXEC
> ++
> ++/* fsopen flags. With the redundant definition, we check if the kernel,
> ++ * glibc value and our value still match.
> ++ */
> ++#define FSOPEN_CLOEXEC 0x00000001
> +
> + #ifndef MS_MGC_VAL
> + /* Magic mount flag number. Has to be or-ed to the flag values.  */
> +--
> +2.34.1
> +
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7593): https://lists.yoctoproject.org/g/meta-virtualization/message/7593
> Mute This Topic: https://lists.yoctoproject.org/mt/93412155/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

