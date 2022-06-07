Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D998C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 14:02:31 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.12731.1654610542995274648
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 07:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MbMIWaYj;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id hh4so12638525qtb.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cJgk2OzxQMg2Lb1ZoDRY4lc8ffbG2Cd5LTEIc+8xFdg=;
        b=MbMIWaYjwEGJDznjap/enpx4Bv9lxC5PGS3osC2X6Ljj9LZfh4oEsGWb6l3cZzER3O
         AGOVwrHS5nHG1gBmw1Aa1CxBu7QQ2t15QrfTqR8oCYQFti2wpAACW20Z6RcyIyfXWqnT
         rRGjwxteR6bT6uDTmGljT/J2KxVOOj5OFOcQCU+8uAzR2kCnhH5XDoHpplp9BKI0f7Sv
         blgCKz2UwdidzkDjgkq3c0dpcLBYG/sXPbamrohJWs8vwFqi5lQ/Ah6KJX9mQIS2AZNT
         DVTiLOb+5/kdJPPsyiT8ghtQyylpxUCgs1vog1YvuGq73HenQ46ndmgmSro3vJr1QSGr
         pbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cJgk2OzxQMg2Lb1ZoDRY4lc8ffbG2Cd5LTEIc+8xFdg=;
        b=KbKaSY0W4HjBQtLatfJk2IQpkBhkzsXO5tXTyOfjDxNIyWEDeVwLHcJr3Pv1tLntL7
         npHb0zW6OtQftMlf4ARHYd8mjJjLekioyZcOT0jNUoEBgiFFpJvP1YZn1TPvf1zgxRHG
         DLJONmHPS8pRVLYkQ5lanP+PPjp9gxzfoEo7ZYA8syLrX/2zbOkVUJwjfVQ6hMe8oJAj
         foZoBc9i1n6L2n7keEJUvdWhOav+Rz5eaoj7ZjFSxgpb39Xc66j42WjWbArXZm41fW6a
         GsiAbqn3n1DmKfk858WyRyPrKh8GkPOrwuAMgEZYUYUoP4oTBSvUboZhT0jjetqBUaod
         HMNg==
X-Gm-Message-State: AOAM531ZyGBwugHgoUAw17YeydJYTS312kheBIgsD1mJRtAmgp9tnH/1
	pox25cxxICOWtZfdb8N3/zA=
X-Google-Smtp-Source: 
 ABdhPJy54dOu1YxSKAxShdlMeUJeiqFfBqZaI5/mPQ3DXrOQ8W9c8FW+cJ9jOoMWfXMd7GhHRMywbQ==
X-Received: by 2002:ac8:7c48:0:b0:2fc:59cc:aa0f with SMTP id
 o8-20020ac87c48000000b002fc59ccaa0fmr22557914qtv.409.1654610535259;
        Tue, 07 Jun 2022 07:02:15 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 cb24-20020a05622a1f9800b00304fd1f6b4csm687557qtb.77.2022.06.07.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 07:02:14 -0700 (PDT)
Date: Tue, 7 Jun 2022 10:02:13 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] crir: fix patch fuzz and remove
 unused patch
Message-ID: <20220607140212.GB54262@gmail.com>
References: <20220530064947.2645585-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530064947.2645585-1-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jun 2022 14:02:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7339

typo in the shortlog, but I've fixed it here.

Merged to master.

Bruce

In message: [meta-virtualization] [PATCH] crir: fix patch fuzz and remove unused patch
on 30/05/2022 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb           |  6 +--
>  ...001-criu-Skip-documentation-install.patch} | 14 +++---
>  ...-Change-libraries-install-directory.patch} | 16 ++++---
>  ...write-install-lib-to-allow-multiarc.patch} | 12 ++---
>  ...-building-on-newest-glibc-and-kernel.patch | 45 -------------------
>  5 files changed, 27 insertions(+), 66 deletions(-)
>  rename recipes-containers/criu/files/{0002-criu-Skip-documentation-install.patch => 0001-criu-Skip-documentation-install.patch} (66%)
>  rename recipes-containers/criu/files/{0001-criu-Change-libraries-install-directory.patch => 0002-criu-Change-libraries-install-directory.patch} (83%)
>  rename recipes-containers/criu/files/{lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch => 0003-lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch} (79%)
>  delete mode 100644 recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 4b616cc..353f3e0 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -17,9 +17,9 @@ SRCREV = "4f8f295e57e68740699479d12c1ad251e6dd859f"
>  PV = "3.17+git${SRCPV}"
>  
>  SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=master;protocol=https \
> -           file://0002-criu-Skip-documentation-install.patch \
> -           file://0001-criu-Change-libraries-install-directory.patch \
> -           file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
> +           file://0001-criu-Skip-documentation-install.patch \
> +	   file://0002-criu-Change-libraries-install-directory.patch \
> +	   file://0003-lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
>            "
>  
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> diff --git a/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch b/recipes-containers/criu/files/0001-criu-Skip-documentation-install.patch
> similarity index 66%
> rename from recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
> rename to recipes-containers/criu/files/0001-criu-Skip-documentation-install.patch
> index af45db7..43e2704 100644
> --- a/recipes-containers/criu/files/0002-criu-Skip-documentation-install.patch
> +++ b/recipes-containers/criu/files/0001-criu-Skip-documentation-install.patch
> @@ -1,22 +1,21 @@
> -From 45d74ae8a314c481398ba91a3697ffbd074cd98b Mon Sep 17 00:00:00 2001
> +From 485e957a4c3289d105dd6203af31c0e4e1438ac6 Mon Sep 17 00:00:00 2001
>  From: Jianchuan Wang <jianchuan.wang@windriver.com>
>  Date: Tue, 16 Aug 2016 09:42:24 +0800
> -Subject: [PATCH] criu: Skip documentation install
> +Subject: [PATCH 1/3] criu: Skip documentation install
>  
>  asciidoc is needed to generate CRIU documentation, so skip it in install.
>  
>  Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> -
>  ---
>   Makefile.install | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/Makefile.install b/Makefile.install
> -index 3987bcc..1def3cf 100644
> +index aafb95469..1b02b70af 100644
>  --- a/Makefile.install
>  +++ b/Makefile.install
> -@@ -29,7 +29,7 @@ export PREFIX BINDIR SBINDIR MANDIR RUNDIR
> - export LIBDIR INCLUDEDIR LIBEXECDIR
> +@@ -30,7 +30,7 @@ export PREFIX BINDIR SBINDIR MANDIR RUNDIR
> + export LIBDIR INCLUDEDIR LIBEXECDIR PLUGINDIR
>   
>   install-man:
>  -	$(Q) $(MAKE) -C Documentation install
> @@ -24,3 +23,6 @@ index 3987bcc..1def3cf 100644
>   .PHONY: install-man
>   
>   install-lib: lib
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch b/recipes-containers/criu/files/0002-criu-Change-libraries-install-directory.patch
> similarity index 83%
> rename from recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
> rename to recipes-containers/criu/files/0002-criu-Change-libraries-install-directory.patch
> index afb1332..453be13 100644
> --- a/recipes-containers/criu/files/0001-criu-Change-libraries-install-directory.patch
> +++ b/recipes-containers/criu/files/0002-criu-Change-libraries-install-directory.patch
> @@ -1,25 +1,25 @@
> -From f64fbca70e6049dad3c404d871f2383d97725d2d Mon Sep 17 00:00:00 2001
> +From dcbf7f8ad1b07ff718eac2ce79ed522ac1cee189 Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Fri, 8 Sep 2017 15:11:31 -0400
> -Subject: [PATCH] criu: Change libraries install directory
> +Subject: [PATCH 2/3] criu: Change libraries install directory
>  
>  Install the libraries into /usr/lib(or /usr/lib64)
>  
>  Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> -
>  ---
>   Makefile.install | 13 -------------
>   1 file changed, 13 deletions(-)
>  
>  diff --git a/Makefile.install b/Makefile.install
> -index 1def3cf..d020eef 100644
> +index 1b02b70af..2839ef5fe 100644
>  --- a/Makefile.install
>  +++ b/Makefile.install
>  @@ -9,19 +9,6 @@ LIBEXECDIR	?= $(PREFIX)/libexec
>   RUNDIR		?= /run
> + PLUGINDIR	?= /var/lib/criu
>   
> - #
> +-#
>  -# For recent Debian/Ubuntu with multiarch support.
>  -DEB_HOST_MULTIARCH := $(shell dpkg-architecture -qDEB_HOST_MULTIARCH 2>/dev/null)
>  -ifneq "$(DEB_HOST_MULTIARCH)" ""
> @@ -32,7 +32,9 @@ index 1def3cf..d020eef 100644
>  -        endif
>  -endif
>  -
> --#
> + #
>   # LIBDIR falls back to the standard path.
>   LIBDIR ?= $(PREFIX)/lib
> - 
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch b/recipes-containers/criu/files/0003-lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
> similarity index 79%
> rename from recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
> rename to recipes-containers/criu/files/0003-lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
> index 70ccb28..210fbe7 100644
> --- a/recipes-containers/criu/files/lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
> +++ b/recipes-containers/criu/files/0003-lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch
> @@ -1,23 +1,22 @@
> -From 6caf90592d61c8c45b32cb7ff76709f9326030e2 Mon Sep 17 00:00:00 2001
> +From 0a04c5bc80319485e17e9a86e799fe2c5bfa3d38 Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Fri, 8 Sep 2017 15:40:49 -0400
> -Subject: [PATCH] lib/Makefile: overwrite install-lib, to allow multiarch
> +Subject: [PATCH 3/3] lib/Makefile: overwrite install-lib, to allow multiarch
>  
>  I am not sure why Yocto installs python modules in arch specific
>  /usr/libXX directories but it does. Allow the recipe to pass this via
>  INSTALL_LIB.
>  
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> -
>  ---
>   lib/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/lib/Makefile b/lib/Makefile
> -index b1bb057..06f5c5d 100644
> +index 575a7bad3..f503d430b 100644
>  --- a/lib/Makefile
>  +++ b/lib/Makefile
> -@@ -53,7 +53,7 @@ install: lib-c lib-py crit/crit lib/c/criu.pc.in
> +@@ -59,7 +59,7 @@ install: lib-c lib-a lib-py crit/crit lib/c/criu.pc.in
>   	$(Q) sed -e 's,@version@,$(CRIU_VERSION),' -e 's,@libdir@,$(LIBDIR),' -e 's,@includedir@,$(dir $(INCLUDEDIR)/criu/),' lib/c/criu.pc.in > lib/c/criu.pc
>   	$(Q) install -m 644 lib/c/criu.pc $(DESTDIR)$(LIBDIR)/pkgconfig
>   	$(E) "  INSTALL " crit
> @@ -26,3 +25,6 @@ index b1bb057..06f5c5d 100644
>   .PHONY: install
>   
>   uninstall:
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch b/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
> deleted file mode 100644
> index 9361adc..0000000
> --- a/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From b59947007362b53e9f41f1e5a33071dedf1c59ac Mon Sep 17 00:00:00 2001
> -From: Adrian Reber <areber@redhat.com>
> -Date: Thu, 28 Sep 2017 09:13:33 +0000
> -Subject: [PATCH] fix building on newest glibc and kernel
> -
> -On Fedora rawhide with kernel-headers-4.14.0-0.rc2.git0.1.fc28.x86_64
> -glibc-devel-2.26.90-15.fc28.x86_64 criu does not build any more:
> -
> -In file included from /usr/include/linux/aio_abi.h:31:0,
> -                 from criu/cr-check.c:24:
> -/usr/include/sys/mount.h:35:3: error: expected identifier before numeric constant
> -   MS_RDONLY = 1,  /* Mount read-only.  */
> -   ^
> -make[2]: *** [/builddir/build/BUILD/criu-3.5/scripts/nmk/scripts/build.mk:111: criu/cr-check.o] Error 1
> -make[1]: *** [criu/Makefile:73: criu/built-in.o] Error 2
> -make: *** [Makefile:233: criu] Error 2
> -
> -This simple re-ordering of includes fixes it for me.
> -
> -Signed-off-by: Adrian Reber <areber@redhat.com>
> -Signed-off-by: Andrei Vagin <avagin@virtuozzo.com>
> -
> -Upstream-Status: Backport
> -[https://github.com/checkpoint-restore/criu/commit/f41e386d4d40e3e26b0cfdc85a812b7edb337f1d#diff-cc847b1cc975358c6582595be92d48db]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> -
> ----
> - criu/cr-check.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/criu/cr-check.c b/criu/cr-check.c
> -index 1dd887a..93df2ab 100644
> ---- a/criu/cr-check.c
> -+++ b/criu/cr-check.c
> -@@ -21,8 +21,8 @@
> - #include <netinet/in.h>
> - #include <sys/prctl.h>
> - #include <sched.h>
> --#include <linux/aio_abi.h>
> - #include <sys/mount.h>
> -+#include <linux/aio_abi.h>
> - 
> - #include "../soccr/soccr.h"
> - 
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7327): https://lists.yoctoproject.org/g/meta-virtualization/message/7327
> Mute This Topic: https://lists.yoctoproject.org/mt/91426054/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


