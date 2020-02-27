Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.1143.1582840145761784170
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 13:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iaZsfiM5;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id m2so1028999qka.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 13:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+Ca/u2Kznf1mZn73dX9uFnZHasZb6wQPerdxbC0w4/8=;
        b=iaZsfiM5lxsAJNI9JBpBDh/HUvVwkoYR+d1YT6mMm1gh010Xp/tB2JdCq1fUIjHoRg
         Bl5UzZePInZ0gaI1ugc6WogOducu+JnNdsVBOqxLXxtEPAjJQ4CM1ogJRgN1MDsF9qVB
         nuR9/TlIMof8CbnQ0OabeQcB7R3I8VXet20Sntwrct3qq4JXadBA4Pa5gS5En3rK+rGZ
         UZgpOKhxyui1G0MrNa9V/n4M5J0+NClm5masKHRPGfDy2vzKdzE9zxq3xjkvflw/vbSN
         cK5jXlWh4JWNEB5wXIlShK5uIlAWWaUc0R33K0HTGcPMS3OCR1G7egJ14ovaU1ZtGcdF
         1+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+Ca/u2Kznf1mZn73dX9uFnZHasZb6wQPerdxbC0w4/8=;
        b=McJgB/6kB/aw4izmEEXDi5dkrEmWkTpkvlmh3MtRWWsbZygW8cwuF4diICBXS6pR33
         nKMXp/YChlhqZmbVj3MWCnXYRGzqBBNecUvF4l7sWy3wDiRhGXRQHhdQ45dwx4rTRL1R
         Qm8ne7bkx3ofMoLTpBxMwc7V/3pxcmZG7RuhCUB28E8tKxg4jDmkukm6v1LdSh2j5KQU
         aGpjBoxdAjTCQ5tGCo0Kr+daQpHhbtfJ72ZeujKncsg5bFqK5StnMwD5k/SNQvBu3qWE
         dgKsbF+EUuPymXYb2SrIzXL4qiKeh6e1sjl7XtOULc3kDJgJ5ffnPG/8nlGVlyUzfzXm
         VFRQ==
X-Gm-Message-State: APjAAAWVs4LU4nu3KpltRBaFp+PGydE63voumEbpks8gDO9ycT2pndK8
	v/yNicN1dkKSQXqyrK2HRzI=
X-Google-Smtp-Source: APXvYqyj0D2D+HYCK72ahLZKRltf3Lo4Gl1IUknE+qSQ9VAq49niXmPl2O9PfEuupiRAaBK1EfruHA==
X-Received: by 2002:a37:2748:: with SMTP id n69mr76405qkn.268.1582840144805;
        Thu, 27 Feb 2020 13:49:04 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id 138sm1063980qkg.5.2020.02.27.13.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 13:49:04 -0800 (PST)
Date: Thu, 27 Feb 2020 16:49:02 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: olkuroch@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] lxc: Backport patch that renames memfd_create() function
Message-ID: <20200227214901.GA36079@gmail.com>
References: <15F6EE92C1F851C1.19684@lists.yoctoproject.org>
 <20200226145813.9914-1-olkuroch@cisco.com>
MIME-Version: 1.0
In-Reply-To: <20200226145813.9914-1-olkuroch@cisco.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH v2] lxc: Backport patch that renames memfd_create() function
on 26/02/2020 Oleksii Kurochko via Lists.Yoctoproject.Org wrote:

> When Autotools makes configuration of LXC, the check of
> the memfd_create() function fails because __stub_memfd_create and
> __stub___memfd_create (The GNU C library defines this for functions
> which it implements to always fail with ENOSYS) are defined in Glibc,
> which leads to the fact that the macro HAVE_MEMFD_CREATE is not
> defined and LXC provides defintion of the memfd_create() function as
> static inline which in turn conflicts with a definition from
> the <bits/mman-shared.h> file and causes an error:
> | In file included from ../../../lxc-3.2.1/src/lxc/conf.c:79:
> | <src_path>//lxc/syscall_wrappers.h:77:19: error: static declaration
> | of 'memfd_create' follows non-static declaration
> | | static inline int memfd_create(const char *name, unsigned int flags) {
> | |                   ^~~~~~~~~~~~
> | In file included from /usr/include/bits/mman-linux.h:111,
> |                  from /usr/include/bits/mman.h:34,
> |                  from /usr/include/sys/mman.h:41,
> |                  from <src_path>/lxc-3.2.1/src/lxc/conf.c:42:
> | /usr/include/bits/mman-shared.h:50:5: note: previous declaration
> |  of 'memfd_create' was here
> | | int memfd_create (const char *__name, unsigned int __flags) __THROW;
> | |     ^~~~~~~~~~~~
> 
> Upstream PR: https://github.com/lxc/lxc/pull/3168 (merged)
> 
> Signed-off-by: Oleksii Kurochko <olkuroch@cisco.com>
> ---
>  ...-rename-internal-memfd_create-to-mem.patch | 46 +++++++++++++++++++
>  recipes-containers/lxc/lxc_3.2.1.bb           |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
> 
> diff --git a/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch b/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
> new file mode 100644
> index 000000000000..9d5b5b8aefc1
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
> @@ -0,0 +1,46 @@
> +From b1694cccddadc8b084cd9eb502d9e86e0728709b Mon Sep 17 00:00:00 2001
> +From: Patrick Havelange <patrick.havelange@essensium.com>
> +Date: Tue, 22 Oct 2019 12:29:54 +0200
> +Subject: [PATCH v2] syscall_wrappers: rename internal memfd_create to
> + memfd_create_lxc
> +
> +In case the internal memfd_create has to be used, make sure we don't
> +clash with the already existing memfd_create function from glibc.
> +
> +This can happen if this glibc function is a stub. In this case, at
> +./configure time, the test for this function will return false, however
> +the declaration of that function is still available. This leads to
> +compilation errors.
> +
> +Upstream-Status: Backport [lxc-3.2.1 https://github.com/lxc/lxc/pull/3168]
> +
> +Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> +(cherry picked from commit 40b06c78773dfd5e12e568a576b1abb133f61b71)
> +Signed-off-by: Oleksii Kurochko <olkuroch@cisco.com>
> +---
> + v2: added Upstream-Status
> +
> + src/lxc/syscall_wrappers.h | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/lxc/syscall_wrappers.h b/src/lxc/syscall_wrappers.h
> +index ce67da5b5308..b7edba63f5d7 100644
> +--- a/src/lxc/syscall_wrappers.h
> ++++ b/src/lxc/syscall_wrappers.h
> +@@ -74,7 +74,7 @@ static inline long __keyctl(int cmd, unsigned long arg2, unsigned long arg3,
> + #endif
> + 
> + #ifndef HAVE_MEMFD_CREATE
> +-static inline int memfd_create(const char *name, unsigned int flags) {
> ++static inline int memfd_create_lxc(const char *name, unsigned int flags) {
> + 	#ifndef __NR_memfd_create
> + 		#if defined __i386__
> + 			#define __NR_memfd_create 356
> +@@ -113,6 +113,7 @@ static inline int memfd_create(const char *name, unsigned int flags) {
> + 	return -1;
> + 	#endif
> + }
> ++#define memfd_create memfd_create_lxc
> + #else
> + extern int memfd_create(const char *name, unsigned int flags);
> + #endif
> diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
> index bedcf13723d2..9592dd9b4e68 100644
> --- a/recipes-containers/lxc/lxc_3.2.1.bb
> +++ b/recipes-containers/lxc/lxc_3.2.1.bb
> @@ -49,6 +49,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>          file://0002-container.conf-Add-option-to-disable-session-keyring.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
> +	file://0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch \
>  	"
>  
>  SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
> -- 
> 2.19.1
> 

> 

