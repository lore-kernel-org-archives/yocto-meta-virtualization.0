Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.1371.1583179704187584106
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Mar 2020 12:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TgC9J7Ii;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id g19so1273150eds.11
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Mar 2020 12:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K34kzsgQz1UVX7rXRbXGzVyys65Ker1e4QAFrer/XPE=;
        b=TgC9J7Iik0z14mdEnTzwNV5k0qnR0ahhYetDx0vl80NDwcYYv85zQ6P3HTRUZ8ixFT
         Zn/Gm8QH1ZttXqodswFK77tY60vwny1kypLhmJgw61HC7rtmHZ/kvIC/Nuz/1FlGohQh
         b4mr9zR4fB2uczr63ASGC0WIkZARBRdgbFSA6kMPzFQ0w42HM9j2de5YIzi8eFDhC8uE
         ZiU8uFkLPev4Iv/lOOEll1/N0DCl6mrdpmhuLvna6NXHxKRczfFUamkgm7iXah1gCIaU
         qmnfqVcd6D4/MQELCLb/5XdovcUKIQMbsHIfrpTvIhsk64et9z8RtVeymqfKP+3rriyd
         dM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K34kzsgQz1UVX7rXRbXGzVyys65Ker1e4QAFrer/XPE=;
        b=HhmfsKLMQP41idfbmmabNxLdmcmeSE4WdeSCButVROUaSisLaGU2FAB46cmeX+B+rM
         cDwmUI701CUq69vh3nZ33PrSXaQL022NIrUd4NHPk+7S/hxqk4PhOQxLEjp0XN5jy0QZ
         8dz1b/wr/yaMonqEOQ54KsQ3dIyYeQO6XeCD8Zc8GavrUy1fCDC2YXam5juv/367WVNi
         sCwfVAGfK0XbCxjE7MtjI87NlD+X2y10x5TZu8hdU97pZIPyBckxXwRAmKwPOQgklg18
         sprzc55OAp65mGh4kYi0yFU3SyeIo0XBP5H52Nkep66RYh9bWoGPUl38VXqjTV7dowbM
         VRLg==
X-Gm-Message-State: ANhLgQ1lDvhLqF0PaSubC+T2WNnsV1Hwat1jmX3yIo2sBBiELe8/iVyj
	hDCS6S1NycbvjsDSx83kKfwkz/Yb+4r3cgvaSSHh2td5
X-Google-Smtp-Source: ADFU+vsy7cypFaDErD/diEQ9w2gpd0mCa/t1nrFpXTbtf2nxF53Vdd45GOFnwhb9z0Vlsb59AjiuC/6X6HBTwLPz4Ck=
X-Received: by 2002:a17:906:4bd1:: with SMTP id x17mr969493ejv.181.1583179702684;
 Mon, 02 Mar 2020 12:08:22 -0800 (PST)
MIME-Version: 1.0
References: <20200302131130.2965-1-olkuroch@cisco.com>
In-Reply-To: <20200302131130.2965-1-olkuroch@cisco.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 2 Mar 2020 15:08:11 -0500
Message-ID: <CADkTA4NxwLa=gGz_PeHR19HiXL9QJcdPmAoFcR3E=R-45JgJyA@mail.gmail.com>
Subject: Re: [meta-virtualization,zeus][PATCH] lxc: Backport patch that renames memfd_create() function
To: Oleksii Kurochko <olkuroch@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged to Zeus.

Bruce

On Mon, Mar 2, 2020 at 8:11 AM Oleksii Kurochko <olkuroch@cisco.com> wrote:
>
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
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> (cherry picked from commit 15e9fc23ecaf0607880211c96818ffea8e4044fc)
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
> +       #ifndef __NR_memfd_create
> +               #if defined __i386__
> +                       #define __NR_memfd_create 356
> +@@ -113,6 +113,7 @@ static inline int memfd_create(const char *name, unsigned int flags) {
> +       return -1;
> +       #endif
> + }
> ++#define memfd_create memfd_create_lxc
> + #else
> + extern int memfd_create(const char *name, unsigned int flags);
> + #endif
> diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
> index b85251562b58..957811743dc6 100644
> --- a/recipes-containers/lxc/lxc_3.2.1.bb
> +++ b/recipes-containers/lxc/lxc_3.2.1.bb
> @@ -47,6 +47,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://network-restore-ability-to-move-nl80211-devices.patch \
>         file://dnsmasq.conf \
>         file://lxc-net \
> +       file://0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch \
>         "
>
>  SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
