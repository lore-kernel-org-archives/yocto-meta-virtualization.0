Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.2559.1635449468209195847
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Oct 2021 12:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RHtbwSPz;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id bm16so6929274qkb.11
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Oct 2021 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w076HekA0nPK9brZ7bJ3km8Su1FZrmsTJBSJPdQF714=;
        b=RHtbwSPzM8fO/v9Om+cxEhcVhYg/AXP4fB2Pn0vT9St5V1lGIke8veyu/pFdFO2CJc
         BNoHUd6EyZ9Miv3DEwOyw1TM85YQOJLfiZGpLxXFv5mVcHbYWcSD0cDDltxDZihsKzb0
         ZhNFOVLnvieQcNnxjMbrJzFQ16RrAZ3m4WWUDjOTH0ECzaJvZuZF05K7484EoyG8tNcv
         arA78HLP9wMn70AJraVrxzgVVnRCNybFREE8jJ9stHYfVBELjlNkVuE2a5h8U6sDLaS0
         w8b/e+Tsc1/DgWb9R3PNDB3tRHl4WljdVeWFPM2unGAH0FSRgCn5lBsJH8dzam/EJiRG
         WBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w076HekA0nPK9brZ7bJ3km8Su1FZrmsTJBSJPdQF714=;
        b=uy8JwfUzks1b1lYbnQAvZ4CwCag5bf5mDNKLj90Tmt4Q5Vjavugbt/TGyctA4/kC3F
         AwBJKYuiMfrViDdlnXVHy5aYvXqwZMiRhu4q0JaKra8rnI8v9g5CRSs6FSSppi2wlo8O
         NS9MtcilBPwHbP16K4d/RB1+meE+4uhxwZESoMXSQX31sEYkCxb3XPMDMz34b0W1OMLM
         z09iWLwETCBMGTTB7PLGo+RaKotPTRnzeIvOXyPct1FwU47pBLX/JfLj+Uf8nY1m2odz
         blUKFoW9H3zp+oaXom5vial9k5QCuypDauOnMgHnUT6qhfCPiSAYacMmMHsV9X+5XSho
         9dDA==
X-Gm-Message-State: AOAM533/d7kE1AdqIrYYqgoyANN1pNnUH22BjWDMZTJ9nHTiUDlkytEA
	lTiivCvv428Po29iCi24XQw=
X-Google-Smtp-Source: ABdhPJzuj2nInJZgWytz9/7Df9UJGWMc3ihHa9siyJfaDyj40c+yuzGvha6vKvXNi3TT5KIr1Jk5pQ==
X-Received: by 2002:a05:620a:2a0b:: with SMTP id o11mr5180442qkp.493.1635449467194;
        Thu, 28 Oct 2021 12:31:07 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id c20sm2862931qtx.14.2021.10.28.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 12:31:06 -0700 (PDT)
Date: Thu, 28 Oct 2021 15:31:05 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] ceph: 15.2.12 -> 15.2.15
Message-ID: <20211028193102.GA18574@gmail.com>
References: <20211022104628.30906-1-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20211022104628.30906-1-kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged to master.

Bruce

In message: [meta-virtualization] [PATCH] ceph: 15.2.12 -> 15.2.15
on 22/10/2021 kai wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> Update ceph to latest 15.x version:
> 
> * remove 0001-add-missing-include-for-atomic-bool.patch which has been
>   fixed in upstream
> * update patch to support python 3.10
> * add gawk to RDEPENDS that script 'rgw-gap-list-comparator' requires it
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...-add-missing-include-for-atomic-bool.patch | 25 -------------------
>  ...01-cmake-add-support-for-python3.10.patch} | 12 ++++++---
>  .../ceph/{ceph_15.2.12.bb => ceph_15.2.15.bb} |  9 +++----
>  3 files changed, 11 insertions(+), 35 deletions(-)
>  delete mode 100644 recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
>  rename recipes-extended/ceph/ceph/{0001-cmake-add-support-for-python3.9.patch => 0001-cmake-add-support-for-python3.10.patch} (76%)
>  rename recipes-extended/ceph/{ceph_15.2.12.bb => ceph_15.2.15.bb} (89%)
> 
> diff --git a/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch b/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
> deleted file mode 100644
> index ffcbc583..00000000
> --- a/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 502be73be3c3645094525aa552f5e53d8782a004 Mon Sep 17 00:00:00 2001
> -From: Sakib Sajal <sakib.sajal@windriver.com>
> -Date: Fri, 28 Aug 2020 19:36:19 -0400
> -Subject: [PATCH] add missing include for atomic<bool>
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - src/tools/rbd/action/Bench.cc | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/tools/rbd/action/Bench.cc b/src/tools/rbd/action/Bench.cc
> -index aa6edbc1..90c551c1 100644
> ---- a/src/tools/rbd/action/Bench.cc
> -+++ b/src/tools/rbd/action/Bench.cc
> -@@ -9,6 +9,7 @@
> - #include "common/ceph_mutex.h"
> - #include "include/types.h"
> - #include "global/signal_handler.h"
> -+#include <atomic>
> - #include <iostream>
> - #include <boost/accumulators/accumulators.hpp>
> - #include <boost/accumulators/statistics/stats.hpp>
> --- 
> -2.27.0
> -
> diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
> similarity index 76%
> rename from recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
> rename to recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
> index d9116c4f..94c4b8a6 100644
> --- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
> +++ b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
> @@ -1,13 +1,17 @@
>  From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
>  From: Yanfei Xu <yanfei.xu@windriver.com>
>  Date: Tue, 10 Nov 2020 17:17:30 +0800
> -Subject: [PATCH] cmake: add support for python3.9
> +Subject: [PATCH] cmake: add support for python 3.9 and 3.10
>  
>  add support for python3.9.
>  
> -Upstream-Status: Pending
> -
>  Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> +
> +Add support for python 3.10.
> +
> +Upstream-Status: Submitted [https://github.com/ceph/ceph/pull/43630]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  ---
>   cmake/modules/FindPython/Support.cmake | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -21,7 +25,7 @@ index 6584699b79..c05bbe3306 100644
>   endif()
>   if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
>  -  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
> -+  set(_${_PYTHON_PREFIX}_VERSIONS 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
> ++  set(_${_PYTHON_PREFIX}_VERSIONS 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
>   elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
>     set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
>   else()
> diff --git a/recipes-extended/ceph/ceph_15.2.12.bb b/recipes-extended/ceph/ceph_15.2.15.bb
> similarity index 89%
> rename from recipes-extended/ceph/ceph_15.2.12.bb
> rename to recipes-extended/ceph/ceph_15.2.15.bb
> index 693b5259..0d9bae02 100644
> --- a/recipes-extended/ceph/ceph_15.2.12.bb
> +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> @@ -12,15 +12,11 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-ceph-fix-build-errors-for-cross-compile.patch \
>             file://0001-fix-host-library-paths-were-used.patch \
>             file://ceph.conf \
> -           file://0001-add-missing-include-for-atomic-bool.patch \
> -           file://0001-cmake-add-support-for-python3.9.patch \
> +           file://0001-cmake-add-support-for-python3.10.patch \
>             file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
>  "
>  
> -SRC_URI[sha1sum] = "9c76b298e1e659b9c5501003ac77fb28aab7823d"
> -SRC_URI[sha256sum] = "8710f6700de83765138df8eb4fc7a5e7c66104dd838033e0827a1850f250ac85"
> -SRC_URI[sha384sum] = "2a2f177e5b68f6f5d13b253a8d4daba9e956b4a79a40a4775aee288b60c612fe13b417d6baf77944c32b1181b2136f68"
> -SRC_URI[sha512sum] = "08266a2e9a7ca5a37e03f340873571fd012c630dd898a87241cd97c29760b2bf41fe64c8883e7b08e0f83c26245072cd26e69ecb1db02378d1ec38335ba1cd0f"
> +SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
>  
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
> @@ -133,6 +129,7 @@ RDEPENDS:${PN} += "\
>  		python3-modules \
>  		python3-prettytable \
>  		${PN}-python \
> +		gawk \
>  "
>  COMPATIBLE_HOST = "(x86_64).*"
>  PACKAGES += " \
> -- 
> 2.17.1
> 

> 
> 
> 

