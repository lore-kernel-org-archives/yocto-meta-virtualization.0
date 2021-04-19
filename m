Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.1737.1618791335027640446
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 18 Apr 2021 17:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AlCaxz05;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id m16so24298226qtx.9
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 18 Apr 2021 17:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mrUYSOPv7NiBPvgQ14a1iy0e9ISYsY5vULPSgCzq7Q8=;
        b=AlCaxz05NLmIxZVesmvNBLrSnXH/s0SY+zl8epOXgLer80oWFC6e9hTms+cNnWvral
         GhLqImYaBZapAczerKAIgmoBBQXnItj8iNcBAtkXzstA5hvHKmRp99HgKZOdP0FIBBsy
         su478r4DJvAPeMAsXaycEgC6KXKEe9VB6532cf70wI2oUHABsfavSWHTn1CJRlkBFht7
         jAxa5aCp60gv3rOmTrnpK+DcQ7gwUg/W6qURAAgu9uGTwkJ7ZVYBwt18wjItEOcXLu5K
         9Q6hZUM3W21tCE9BYeGBr6qeb3zJfkuXvpa734pR//r3li105pf9N+edNAStdUbgUASj
         lcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mrUYSOPv7NiBPvgQ14a1iy0e9ISYsY5vULPSgCzq7Q8=;
        b=axfCthKw8220wXOtWoMX5sUhxRyhUzOJprOZfgDJ8+dE7IBfGa7dZjj9hkrsoxch+3
         OrkZR3lMCGpbcwk3/YFZDqUkN/yWtSShvuknCdjTKsAQB3Bl5KNtC98unNzP81CR3neC
         G1+B3W5uem8ijahGl6+reftkz93bpIcDgmWDiJDyQqY60sIGgOI1hSWyU/xciif4K4YM
         EL6sqbIxKbZW7bkvhljIjlquu2Mr4hkwXKWxEQ+H10hf4zznjsUO7TB8KRGx1pqr7d1k
         8OQYg3pfZNdzdUfqtFHGs6vUQueWj4KCGkjZRj7qr8YZ8TQLflArdfKQF5quK3eXz3cn
         21DQ==
X-Gm-Message-State: AOAM533OZ6j7wcFMKiTZWv6BNJvwAVHvobMM5YT8uZTrL9umY4reB3va
	I97VtMHWHhD6P01rS/l/gdpQi+5REP3JIQ==
X-Google-Smtp-Source: ABdhPJznxVk1aBfdwKUrsv9qiiFn2n/p+C82SZeCDqZINCB069Gx/Y+HMfRUhOuNy3HdSLG8vVMvGA==
X-Received: by 2002:ac8:5349:: with SMTP id d9mr9180025qto.103.1618791334159;
        Sun, 18 Apr 2021 17:15:34 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id m29sm700680qkm.101.2021.04.18.17.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 17:15:33 -0700 (PDT)
Date: Sun, 18 Apr 2021 20:15:32 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: rameshkrishnanx.geddy.sekar@intel.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH] lxc-recipe: Fix compilation without seccomp when libseccomp is installed
Message-ID: <20210419001531.GB61503@gmail.com>
References: <20210416193425.22909-1-rameshkrishnanx.geddy.sekar@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210416193425.22909-1-rameshkrishnanx.geddy.sekar@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes need to go to master first, than back ot hardknott (now that
I've branched).

So I've applied it to master for testing and will cherry pick to
hardknott.

I've also edited the patches to have an Upstream-Status field
that points to your provided pull request, since we need it in the
patches themselves, not just the commit message.

Bruce

In message: [meta-virtualization][hardknott][PATCH] lxc-recipe: Fix compilation without seccomp when libseccomp is installed
on 17/04/2021 rameshkrishnanx.geddy.sekar@intel.com wrote:

> From: RameshkrishnanX Geddy Sekar <rameshkrishnanx.geddy.sekar@intel.com>
> 
> Original URL:  https://github.com/lxc/lxc/pull/3623
> 
> Signed-off-by: RameshkrishnanX Geddy Sekar <rameshkrishnanx.geddy.sekar@intel.com>
> ---
>  ...fix-check-for-seccomp-notify-support.patch | 42 +++++++++++++++
>  ...p-libseccomp-tests-if-it-is-disabled.patch | 51 +++++++++++++++++++
>  recipes-containers/lxc/lxc_4.0.6.bb           |  2 +
>  3 files changed, 95 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
>  create mode 100644 recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch
> 
> diff --git a/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch b/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
> new file mode 100644
> index 0000000..ed6cf7f
> --- /dev/null
> +++ b/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
> @@ -0,0 +1,42 @@
> +From a342b11fedb3010630de4909ca707ebdc0862060 Mon Sep 17 00:00:00 2001
> +From: Eneas U de Queiroz <cotequeiroz@gmail.com>
> +Date: Fri, 25 Dec 2020 13:54:14 -0300
> +Subject: [PATCH] commands: fix check for seccomp notify support
> +
> +Use HAVE_SECCOMP_NOTIFY instead of HAVE_DECL_SECCOMP_NOTIFY_FD.
> +Currently the latter will be true if the declaration is found by
> +configure, even if 'configure --disable-seccomp' is used.
> +
> +HAVE_SECCOMP_NOTIFY is defined in lxcseccomp.h if both HAVE_SECCOMP and
> +HAVE_DECL_SECCOMP_NOTIFY_FD are true, which is the correct behavior.
> +
> +Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
> +---
> + src/lxc/commands.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/lxc/commands.c b/src/lxc/commands.c
> +index a9a03ca2c..37d1abcef 100644
> +--- a/src/lxc/commands.c
> ++++ b/src/lxc/commands.c
> +@@ -501,7 +501,7 @@ static int lxc_cmd_get_devpts_fd_callback(int fd, struct lxc_cmd_req *req,
> + 
> + int lxc_cmd_get_seccomp_notify_fd(const char *name, const char *lxcpath)
> + {
> +-#if HAVE_DECL_SECCOMP_NOTIFY_FD
> ++#ifdef HAVE_SECCOMP_NOTIFY
> + 	int ret, stopped;
> + 	struct lxc_cmd_rr cmd = {
> + 		.req = {
> +@@ -526,7 +526,7 @@ static int lxc_cmd_get_seccomp_notify_fd_callback(int fd, struct lxc_cmd_req *re
> + 						  struct lxc_handler *handler,
> + 						  struct lxc_epoll_descr *descr)
> + {
> +-#if HAVE_DECL_SECCOMP_NOTIFY_FD
> ++#ifdef HAVE_SECCOMP_NOTIFY
> + 	struct lxc_cmd_rsp rsp = {
> + 		.ret = 0,
> + 	};
> +-- 
> +2.17.1
> +
> diff --git a/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch b/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch
> new file mode 100644
> index 0000000..7ba992f
> --- /dev/null
> +++ b/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch
> @@ -0,0 +1,51 @@
> +From 67cd8bde2d46983df8fa9f647e9fc0b96370ec29 Mon Sep 17 00:00:00 2001
> +From: Eneas U de Queiroz <cotequeiroz@gmail.com>
> +Date: Sat, 16 Jan 2021 13:54:07 -0300
> +Subject: [PATCH] configure: skip libseccomp tests if it is disabled
> +
> +Move the block checking for libseccomp api compatibility inside
> +AM_COND_IF([ENABLE_SECCOMP] ... ).
> +
> +Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
> +---
> + configure.ac | 17 ++++++++---------
> + 1 file changed, 8 insertions(+), 9 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index f58487f5d..ce6363136 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -312,6 +312,14 @@ AM_COND_IF([ENABLE_SECCOMP],
> + 		AC_CHECK_LIB([seccomp], [seccomp_init],[],[AC_MSG_ERROR([You must install the seccomp development package in order to compile lxc])])
> + 		AC_SUBST([SECCOMP_LIBS], [-lseccomp])
> + 		])
> ++	# HAVE_SCMP_FILTER_CTX=1 will tell us we have libseccomp api >= 1.0.0
> ++	OLD_CFLAGS="$CFLAGS"
> ++	CFLAGS="$CFLAGS $SECCOMP_CFLAGS"
> ++	AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include <seccomp.h>]])
> ++	AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#include <seccomp.h>]])
> ++	AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [], [[#include <seccomp.h>]])
> ++	AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], [], [], [[#include <seccomp.h>]])
> ++	CFLAGS="$OLD_CFLAGS"
> + 	])
> + 
> + AC_MSG_CHECKING(for static libcap)
> +@@ -359,15 +367,6 @@ AM_COND_IF([ENABLE_CAP],
> +         AC_CHECK_LIB(cap,cap_get_file, AC_DEFINE(LIBCAP_SUPPORTS_FILE_CAPABILITIES,1,[Have cap_get_file]),[],[])
> +         AC_SUBST([CAP_LIBS], [-lcap])])
> + 
> +-# HAVE_SCMP_FILTER_CTX=1 will tell us we have libseccomp api >= 1.0.0
> +-OLD_CFLAGS="$CFLAGS"
> +-CFLAGS="$CFLAGS $SECCOMP_CFLAGS"
> +-AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include <seccomp.h>]])
> +-AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#include <seccomp.h>]])
> +-AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [], [[#include <seccomp.h>]])
> +-AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], [], [], [[#include <seccomp.h>]])
> +-CFLAGS="$OLD_CFLAGS"
> +-
> + AC_CHECK_HEADERS([linux/bpf.h], [
> + 	AC_CHECK_TYPES([struct bpf_cgroup_dev_ctx], [], [], [[#include <linux/bpf.h>]])
> + ], [], [])
> +-- 
> +2.17.1
> +
> diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/lxc_4.0.6.bb
> index b422909..c9bf3d0 100644
> --- a/recipes-containers/lxc/lxc_4.0.6.bb
> +++ b/recipes-containers/lxc/lxc_4.0.6.bb
> @@ -49,6 +49,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
>  	file://tests-add-no-validate-when-using-download-template.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
> +	file://configure-skip-libseccomp-tests-if-it-is-disabled.patch \
> +	file://commands-fix-check-for-seccomp-notify-support.patch \
>  	"
>  
>  SRC_URI[md5sum] = "732571c7cb4ab845068afb227bf35256"
> -- 
> 2.17.1
> 

> 
> 
> 

