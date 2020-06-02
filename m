Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.2229.1591065033643387140
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 19:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qi9Tmxz1;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id cv17so1050305qvb.13
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Jun 2020 19:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=89zIhr7bNGArn3u+7HNz5t6MFwgvgpObWPDXbzTceMo=;
        b=Qi9Tmxz1gkK8jRoZ+/B4aQdsRSFuKgByMwaVLSkit2LjJR6a8L8VloYsx5Qe+N3JOK
         58jwQB7LBGBNsK3PgZ1atbrDx5DOqjtpz0UULqWOsb2HauIt/MxSCz7VqC0LTrIMb5aH
         i1srhkrzXPdzXA9VAwoDPn9vIb7rV2SOF7x1LoUsD/xC1ULIs60pBXB0010Ge/CKVhTs
         FMMt1JB98JTkZsTBo0ag/6Yrj8mgO6Bsjj6/Pyh16phZ5Hs7uOGfsW7jCbGoBGzLEDzs
         LsRVpwpgjFLFyviz3rqvDRa6y6zU0fe6rIiJ3HnLs2AWKjsYI51SUGLMZqCIjfeRXHxw
         B8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=89zIhr7bNGArn3u+7HNz5t6MFwgvgpObWPDXbzTceMo=;
        b=NG/Wl9sVcUS1XmlFDrPCbeuRUFZSlFGiasyzeHGAo9ssDgFQU2Bd1Gf5mG8lq5+dBt
         ZszJf1qNR++Ct/QK9zK5QFarggqwnG71gC3QyXZRZsM1ti8g33Ufn0+khvQpN1Bq2ciG
         r8IVXMkW9MJzIHlm22agsVt5pQxYvWY/TR/xcs6JRfBsoTs+KK9kYCZZMdCPEu3Zlk+s
         JasP16gcAX0SJ8oU60eDEUfPTnK4Xmwc3cHfpH2lA2POtRC6C+IE90t2zI3Kr9H50A3d
         1jK9LzgUL+4nNrXhNQoV6dZ/5kzHmoTEpXfUZdCzs7Hh+vwVpCrHgeAKMcqOhZAtRf1O
         iGVg==
X-Gm-Message-State: AOAM533LDkGUZAY+P+aVVaI8bHFcsYWoT3QhubrdDgNstkCUPOw4kcPQ
	HT+0tyHqiCtn7RuKHg3F4SSC8GEkRDA=
X-Google-Smtp-Source: ABdhPJydsVc0Qz681xIK2CMd6wAInCLrwhjFshCNSNFmAOPYG7FzIlbqPGadYyJCtEGvdsPoPklE+g==
X-Received: by 2002:ad4:598f:: with SMTP id ek15mr11366545qvb.196.1591065032598;
        Mon, 01 Jun 2020 19:30:32 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id h125sm1078349qkd.93.2020.06.01.19.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 19:30:31 -0700 (PDT)
Date: Mon, 1 Jun 2020 22:30:30 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: fix patch fuzz warning
Message-ID: <20200602023027.GA36732@gmail.com>
References: <20200601195641.18069-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200601195641.18069-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH] libvirt: fix patch fuzz warning
on 01/06/2020 sakib.sajal@windriver.com wrote:

> Refreshed patches to fix:
> "WARNING: libvirt-6.3.0-r0 do_patch: Fuzz detected"

merged

Bruce

> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...-build-drop-unnecessary-libgnu.la-reference.patch |  6 ++----
>  ...Remove-Windows-1252-check-from-esxutilstest.patch |  2 +-
>  .../libvirt/libvirt/0001-to-fix-build-error.patch    | 12 ++++++------
>  ...gure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch |  2 +-
>  .../libvirt/libvirt/install-missing-file.patch       | 10 +++++-----
>  .../libvirt-use-pkg-config-to-locate-libcap.patch    |  2 +-
>  recipes-extended/libvirt/libvirt/runptest.patch      |  8 ++++----
>  ...-libvirt-net-rpc-to-virt-host-validate-when.patch |  2 +-
>  8 files changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-libgnu.la-reference.patch b/recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-libgnu.la-reference.patch
> index 952e8eb..f02a5d6 100644
> --- a/recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-libgnu.la-reference.patch
> +++ b/recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-libgnu.la-reference.patch
> @@ -1,9 +1,10 @@
> -From 4945576d6c5c7cc9a21a58aaa312829567af13db Mon Sep 17 00:00:00 2001
> +From 30a056069cb35804434fb036e51ae97f33c02025 Mon Sep 17 00:00:00 2001
>  From: Bruce Ashfield <bruce.ashfield@gmail.com>
>  Date: Sat, 7 Mar 2020 21:36:27 -0500
>  Subject: [PATCH] build: drop unnecessary libgnu.la reference
>  
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +
>  ---
>   tools/Makefile.am | 2 --
>   1 file changed, 2 deletions(-)
> @@ -28,6 +29,3 @@ index 2a0a989..93fe283 100644
>                  $(NULL)
>   endif
>   
> --- 
> -2.19.1
> -
> diff --git a/recipes-extended/libvirt/libvirt/0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch b/recipes-extended/libvirt/libvirt/0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
> index 02e99ec..abb0b1a 100644
> --- a/recipes-extended/libvirt/libvirt/0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
> +++ b/recipes-extended/libvirt/libvirt/0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
> @@ -1,4 +1,4 @@
> -From 1601c21b653bf2bea2547e5efcf1f3cbb8b73f65 Mon Sep 17 00:00:00 2001
> +From 7b265b06ca432c8d90df1af8e89f4b919b748ac2 Mon Sep 17 00:00:00 2001
>  From: He Zhe <zhe.he@windriver.com>
>  Date: Tue, 23 Aug 2016 02:28:47 -0400
>  Subject: [PATCH] ptest: Remove Windows-1252 check from esxutilstest
> diff --git a/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch b/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
> index 3323196..b0148e5 100644
> --- a/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
> +++ b/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
> @@ -1,4 +1,4 @@
> -From 7cf1d66c4b01c40b45b8a38370c7ffee46dfb10a Mon Sep 17 00:00:00 2001
> +From 3566bcacaa6408fb8f655d1749a20b2f30e0c765 Mon Sep 17 00:00:00 2001
>  From: Lei Maohui <leimaohui@cn.fujitsu.com>
>  Date: Fri, 31 Jul 2015 03:17:07 +0900
>  Subject: [PATCH] to fix build error
> @@ -23,10 +23,10 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>   1 file changed, 2 insertions(+), 3 deletions(-)
>  
>  diff --git a/docs/Makefile.am b/docs/Makefile.am
> -index 61862c4..c259535 100644
> +index ce3d296..2c8180f 100644
>  --- a/docs/Makefile.am
>  +++ b/docs/Makefile.am
> -@@ -360,7 +360,7 @@ EXTRA_DIST= \
> +@@ -366,7 +366,7 @@ EXTRA_DIST= \
>     aclperms.htmlinc \
>     $(schema_DATA)
>   
> @@ -35,7 +35,7 @@ index 61862c4..c259535 100644
>   
>   aclperms.htmlinc: $(top_srcdir)/src/access/viraccessperm.h \
>           $(top_srcdir)/scripts/genaclperms.py Makefile.am
> -@@ -426,8 +426,7 @@ manpages/%.html.in: manpages/%.rst
> +@@ -432,8 +432,7 @@ manpages/%.html.in: manpages/%.rst
>   	$(AM_V_GEN)$(MKDIR_P) `dirname $@` && \
>   	  $(RST2HTML) --strict $< > $@ || { rm $@ && exit 1; }
>   
> @@ -43,5 +43,5 @@ index 61862c4..c259535 100644
>  -		$(acl_generated)
>  +%.html.tmp: %.html.in site.xsl subsite.xsl page.xsl
>   	$(AM_V_GEN)name=`echo $@ | sed -e 's/.tmp//'`; \
> - 	  dir=`dirname $@` ; \
> - 	  if test "$$dir" = "."; \
> + 	  genhtmlin=`echo $@ | sed -e 's/.tmp/.in/'`; \
> + 	  rst=`echo $@ | sed -e 's/.html.tmp/.rst/'`; \
> diff --git a/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch b/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
> index eb75b5a..395d561 100644
> --- a/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
> +++ b/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
> @@ -1,4 +1,4 @@
> -From d074f34dd0fc671ab05367eda9cc7a965708fbed Mon Sep 17 00:00:00 2001
> +From 79f5975db01af0599860ccca7ef44b0e27105a04 Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Thu, 10 May 2018 12:05:04 -0400
>  Subject: [PATCH] configure.ac: search for rpc/rpc.h in the sysroot
> diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch b/recipes-extended/libvirt/libvirt/install-missing-file.patch
> index f934149..6aa36df 100644
> --- a/recipes-extended/libvirt/libvirt/install-missing-file.patch
> +++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch
> @@ -1,4 +1,4 @@
> -From 75c974d28133ff85d299b7a53427653c47513a45 Mon Sep 17 00:00:00 2001
> +From aa75f5136066d239d48a21373b3d96ee12378e8d Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Wed, 8 May 2019 17:24:17 +0800
>  Subject: [PATCH] Install missing conf file
> @@ -20,10 +20,10 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
>   1 file changed, 3 insertions(+), 1 deletion(-)
>  
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 7a0aee3..380637d 100644
> +index 4a808dd..0c3e799 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -172,6 +172,7 @@ EXTRA_DIST = \
> +@@ -173,6 +173,7 @@ EXTRA_DIST = \
>   	$(NULL)
>   
>   test_helpers = commandhelper ssh
> @@ -31,7 +31,7 @@ index 7a0aee3..380637d 100644
>   test_programs = virshtest sockettest \
>   	virhostcputest virbuftest \
>   	commandtest seclabeltest \
> -@@ -310,6 +311,7 @@ endif WITH_LXC
> +@@ -311,6 +312,7 @@ endif WITH_LXC
>   
>   if WITH_OPENVZ
>   test_programs += openvzutilstest
> @@ -39,7 +39,7 @@ index 7a0aee3..380637d 100644
>   endif WITH_OPENVZ
>   
>   if WITH_ESX
> -@@ -1553,7 +1555,7 @@ endif  ! WITH_LINUX
> +@@ -1551,7 +1553,7 @@ endif  ! WITH_LINUX
>   
>   buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
>   
> diff --git a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch b/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
> index e6c7cae..87b5591 100644
> --- a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
> +++ b/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
> @@ -1,4 +1,4 @@
> -From 57b645c6db405bf2e22f4589ea5560a14975058f Mon Sep 17 00:00:00 2001
> +From 94bd514e1b6e602a48285db94e65050f8f0c2585 Mon Sep 17 00:00:00 2001
>  From: Bruce Ashfield <bruce.ashfield@windriver.com>
>  Date: Wed, 8 Apr 2015 13:03:03 -0400
>  Subject: [PATCH] libvirt: use pkg-config to locate libcap
> diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
> index 9f3ad67..f6bc773 100644
> --- a/recipes-extended/libvirt/libvirt/runptest.patch
> +++ b/recipes-extended/libvirt/libvirt/runptest.patch
> @@ -1,4 +1,4 @@
> -From 9d6bfb4a5e9b44c080ddf3bad4c364ffb0e9d84a Mon Sep 17 00:00:00 2001
> +From d210838a4433dd254c1a11b08b804ebe9ff5f378 Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Wed, 8 May 2019 10:20:47 +0800
>  Subject: [PATCH] Add 'install-ptest' rule
> @@ -23,7 +23,7 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
>   1 file changed, 60 insertions(+), 8 deletions(-)
>  
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 83326db..7a0aee3 100644
> +index ada5b8f..4a808dd 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
>  @@ -28,11 +28,13 @@ AM_CPPFLAGS = \
> @@ -44,7 +44,7 @@ index 83326db..7a0aee3 100644
>   	$(LIBXML_CFLAGS) \
>   	$(GLIB_CFLAGS) \
>   	$(LIBNL_CFLAGS) \
> -@@ -472,10 +474,10 @@ TESTS = $(test_programs) \
> +@@ -474,10 +476,10 @@ TESTS = $(test_programs) \
>   
>   VIR_TEST_EXPENSIVE ?= $(VIR_TEST_EXPENSIVE_DEFAULT)
>   TESTS_ENVIRONMENT = \
> @@ -59,7 +59,7 @@ index 83326db..7a0aee3 100644
>     LIBVIRT_AUTOSTART=0 \
>     LC_ALL=C \
>     VIR_TEST_EXPENSIVE=$(VIR_TEST_EXPENSIVE) \
> -@@ -1549,4 +1551,54 @@ else ! WITH_LINUX
> +@@ -1547,4 +1549,54 @@ else ! WITH_LINUX
>   EXTRA_DIST += virscsitest.c
>   endif  ! WITH_LINUX
>   
> diff --git a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> index f03cc89..bb500fd 100644
> --- a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> +++ b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> @@ -1,4 +1,4 @@
> -From a1696741375c6faca0d09ae6b271a2c56fc2b6fe Mon Sep 17 00:00:00 2001
> +From 7dc21edd851b260485b432c096f8e90f6fa07778 Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Tue, 7 May 2019 15:26:32 +0800
>  Subject: [PATCH] tools: add libvirt-net-rpc to virt-host-validate when TLS is
> -- 
> 2.24.0
> 

> 

