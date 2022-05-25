Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36CDC4332F
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 15:46:16 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.8481.1653493569652264390
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 08:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BIkSCCOs;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id em1so715617qvb.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T/NH2T4qjrL+B5p7l8s2hujlz8q1Do5vHRuML3tpd1Y=;
        b=BIkSCCOsFQ+uTRoOYU1W86w3jn8uDETAGkq4QP5REfEy/WHtF4scys9ntirOkKM5Eo
         In5ARiFts8vhIdKPyeLqNVgnHPu/dL4wr4tAEEd4z36O+91kLKf/zoCFRD5ntxFjA6et
         Bmd8jtTdNu92FdhmYsOPA4IUAvLJ09qt1tHU7kZJmTOW2Y+9TD1Wz82GBlNrDWJuXyt5
         wHW91RxdNroAhAQTkhE2V5Kmv8CDoBi6Y9Y8NKZmUWguc2oPvkri/168INQK1aJ7vFuo
         VlJ7+zttuC8HkUFSQ94dYacOgm3b1BFH8Lnj83dK2/dfkW4sT8fnIBAamV691UlVqhcp
         SFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T/NH2T4qjrL+B5p7l8s2hujlz8q1Do5vHRuML3tpd1Y=;
        b=SjQrqyh1PCpUCJA/nrnRVYXrWK12i/qUl1GWeh3CJgZo+ZapoJJSfJfW7gMDWZTVX4
         uUGmXXPt6TQwy8h/X6GBPi2Ac/dU809vU/AnnDeXykz3+yutelZmPkVME6EN5Hx49DT+
         8/LPnildm2/p+dPrFmA2cxoJ3nytJY1GzyF3vE16QiWuC9igIC46xfNtSb9JCuylVvF/
         vtu8ZKFwIaZ0A9xK22dinIYO2awMrPClkwn+OJkx1MRp5NeHhKyjr59Xj47kuRFUuEai
         TdcpCoqcJtaXKHKNV9g1OgJn8A45/Zd0sag2QJsvLc6PsO+DokakvjGpu3V3bJWt6Lgs
         hriw==
X-Gm-Message-State: AOAM532yA254VuSQnYk2gBZkXx6rnxLF3PLu1ntvui7LOoUdE7X3aIIT
	JDM4lp8wINWLOermL7CtuN6kXt7IFElvIg==
X-Google-Smtp-Source: 
 ABdhPJzH0c8pCaD0PVwf515p6eVOk1yOXVX9Wkiq+a6Kr42pt8G3sRtWm+pTkcU3RGSR4HFe75sxEA==
X-Received: by 2002:a05:6214:c83:b0:462:4404:5d38 with SMTP id
 r3-20020a0562140c8300b0046244045d38mr11963314qvr.111.1653493568602;
        Wed, 25 May 2022 08:46:08 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a376615000000b0069fc13ce1d5sm1520983qkc.6.2022.05.25.08.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 08:46:08 -0700 (PDT)
Date: Wed, 25 May 2022 11:46:06 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] ceph: fix gcc-12 compile failure
Message-ID: <20220525154606.GC42310@gmail.com>
References: <20220523044655.59281-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523044655.59281-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 25 May 2022 15:46:16 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7322

merged.

Bruce

In message: [meta-virtualization][PATCH] ceph: fix gcc-12 compile failure
on 22/05/2022 Chen Qi wrote:

> Add two patches to fix gcc-12 compile failure.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...ssing-header-file-due-to-gcc-upgrade.patch | 30 +++++++++++++
>  ...S-due-to-dout-need_dynamic-on-GCC-12.patch | 42 +++++++++++++++++++
>  recipes-extended/ceph/ceph_15.2.15.bb         |  2 +
>  3 files changed, 74 insertions(+)
>  create mode 100644 recipes-extended/ceph/ceph/0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch
>  create mode 100644 recipes-extended/ceph/ceph/0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch
> 
> diff --git a/recipes-extended/ceph/ceph/0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch b/recipes-extended/ceph/ceph/0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch
> new file mode 100644
> index 0000000..70d3eb9
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch
> @@ -0,0 +1,30 @@
> +From 496465d9238109a93612e28682273e5bf576823b Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Sun, 22 May 2022 19:40:59 -0700
> +Subject: [PATCH 1/2] buffer.h: add missing header file due to gcc upgrade
> +
> +The header file <memory> have been changed to be no longer included by other
> +heades, thus requiring explicit include. See https://gcc.gnu.org/gcc-12/porting_to.html
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/include/buffer.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/include/buffer.h b/src/include/buffer.h
> +index 5c8b427d..88845ee6 100644
> +--- a/src/include/buffer.h
> ++++ b/src/include/buffer.h
> +@@ -43,6 +43,7 @@
> + #include <list>
> + #include <vector>
> + #include <string>
> ++#include <memory>
> + #if __cplusplus >= 201703L
> + #include <string_view>
> + #endif // __cplusplus >= 201703L
> +-- 
> +2.36.0
> +
> diff --git a/recipes-extended/ceph/ceph/0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch b/recipes-extended/ceph/ceph/0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch
> new file mode 100644
> index 0000000..d119bf1
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch
> @@ -0,0 +1,42 @@
> +From 841806de212226921eeaeb3eea054bda8ccce616 Mon Sep 17 00:00:00 2001
> +From: Radoslaw Zarzynski <rzarzyns@redhat.com>
> +Date: Wed, 19 Jan 2022 15:24:11 +0000
> +Subject: [PATCH 2/2] common: fix FTBFS due to dout & need_dynamic on GCC-12
> +
> +For details see:
> +https://gist.github.com/rzarzynski/d6d2df6888923bef6a3e764f4856853f.
> +
> +Special thanks to Kaleb Keithley who reported the issue
> +and tested the fix!
> +
> +Fixes: https://tracker.ceph.com/issues/53896
> +Signed-off-by: Radoslaw Zarzynski <rzarzyns@redhat.com>
> +
> +Upstream-Status: Backport [963d756ded40f5adf2efef53893c917bec1845c1]
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/common/dout.h | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/common/dout.h b/src/common/dout.h
> +index c7c08182..42f49915 100644
> +--- a/src/common/dout.h
> ++++ b/src/common/dout.h
> +@@ -99,11 +99,12 @@ namespace ceph::dout {
> + template<typename T>
> + struct dynamic_marker_t {
> +   T value;
> +-  operator T() const { return value; }
> ++  // constexpr ctor isn't needed as it's an aggregate type
> ++  constexpr operator T() const { return value; }
> + };
> + 
> + template<typename T>
> +-dynamic_marker_t<T> need_dynamic(T&& t) {
> ++constexpr dynamic_marker_t<T> need_dynamic(T&& t) {
> +   return dynamic_marker_t<T>{ std::forward<T>(t) };
> + }
> + 
> +-- 
> +2.36.0
> +
> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
> index 17dbcf3..0fb32b2 100644
> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> @@ -14,6 +14,8 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://ceph.conf \
>             file://0001-cmake-add-support-for-python3.10.patch \
>             file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
> +           file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
> +           file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
>  "
>  
>  SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
> -- 
> 2.36.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7310): https://lists.yoctoproject.org/g/meta-virtualization/message/7310
> Mute This Topic: https://lists.yoctoproject.org/mt/91282108/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


