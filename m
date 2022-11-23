Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E8BC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 04:33:22 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.12633.1669177994595598217
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Nov 2022 20:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aH2wrjG2;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id h16so2185992qtu.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Nov 2022 20:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkRhmgx1UJcvK299XeXGu4y0X/1X17uPCsHriA4THSs=;
        b=aH2wrjG2KF8Uls8pz5Yw0QEhUDEFh65YJDBVJ0gqK9ZwoUt2ZVCs8rLvseHASsLG5S
         udhDYmeo5u/bPNbxquJVqUs1UnOGUnlvH8ZVDAQT9A/U3zHmeJeHMBthoOajrpsxS9hr
         GdpFFts/zaXVCc7/4NWE+q2iw7g+nciTy//xN7jBWVRGlElfITCQbZ6Lqpgrka1FoOgs
         IOgWea37CjoS5RVa5BNKoX5o4GJ6jk1TawJJiUASi/9I9zOS120MWwe0Hm69zddzxPhn
         ycvJU6GAD0RNkhq5FBx2yPwBJodBM+BSDdo1hcJ4QkPWTZCYRmsiyOkvw69wqwPXw2SC
         RC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkRhmgx1UJcvK299XeXGu4y0X/1X17uPCsHriA4THSs=;
        b=z6U/AJGTrEuY50bYGxOzAz/VpteSzv3zHlM2B6eTZX1DnStZ7S9Y0sRKP8IcuR93Wg
         bhSSpdTjBQMMv/wHYZXRBPNVW6h3RaxVVxr9/I51FQ5Qzc4JRPvn2tSZ92jY7fZ60Ye3
         FiXbHQRslCuV63Khsb9X3fSsFFjT4DniYgZBgWluxEbDXtlVZ4PDWUtbanDXFxAFWUPy
         D3uUqBy4TZvBSbHc+mfYSmqB3QQeIJ8KUIvEtlE6uy2y/PVto/jcEQ/72zdb+ml7HJkF
         QN2CG4TTBpjPae285OH4k/VU9wwnQCmn1GQDx/S8wlW7A8gk40AwO3CIu59Gyzk3uLSB
         GAEA==
X-Gm-Message-State: ANoB5pnVE/sVVC8kbfeY4t9pgc+2PrYiwfmsC2Qkpvjlbh9DFdCfFbgo
	AbslBCpX9AcyzgtCekV+i5xwmqcWaN8oaQ==
X-Google-Smtp-Source: AA0mqf5sR6QsU5q7AjaAxNeIxtmbQguvcRDNkyegRdLEnUF/1oKDYBvrlbvoICF+BkG3cWBax9Tfqg==
X-Received: by 2002:a05:622a:130c:b0:3a5:95d0:a51d with SMTP id v12-20020a05622a130c00b003a595d0a51dmr25588566qtk.348.1669177993491;
        Tue, 22 Nov 2022 20:33:13 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id d5-20020ac85445000000b0039492d503cdsm9269766qtq.51.2022.11.22.20.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 20:33:13 -0800 (PST)
Date: Tue, 22 Nov 2022 23:33:11 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] ceph: support python 3.11
Message-ID: <20221123043309.GA59995@gmail.com>
References: <20221118194020.387979-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118194020.387979-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 04:33:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7691

merged.

Bruce

In message: [meta-virtualization][PATCH] ceph: support python 3.11
on 18/11/2022 sakib.sajal@windriver.com wrote:

> python3 has been upgraded to 3.11 in oe-core causing
> ceph do_configure to fail with the error:
> |   Could NOT find Python3 (missing: Python3_LIBRARY Python3_INCLUDE_DIR
> |   Development) (found suitable version "3.6.9", minimum required is "3")
> 
> Support python 3.11 to fix the issue
> 
> Upstream-Status: sent to upstream (https://github.com/ceph/ceph/pull/48947)
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...on3.10.patch => 0001-cmake-add-support-for-python3.11.patch} | 2 +-
>  recipes-extended/ceph/ceph_15.2.15.bb                           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-extended/ceph/ceph/{0001-cmake-add-support-for-python3.10.patch => 0001-cmake-add-support-for-python3.11.patch} (93%)
> 
> diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
> similarity index 93%
> rename from recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
> rename to recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
> index 94c4b8a..c0b718a 100644
> --- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
> +++ b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
> @@ -25,7 +25,7 @@ index 6584699b79..c05bbe3306 100644
>   endif()
>   if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
>  -  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
> -+  set(_${_PYTHON_PREFIX}_VERSIONS 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
> ++  set(_${_PYTHON_PREFIX}_VERSIONS 3.11 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
>   elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
>     set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
>   else()
> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
> index 14b4c97..6312fd3 100644
> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> @@ -12,7 +12,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-ceph-fix-build-errors-for-cross-compile.patch \
>             file://0001-fix-host-library-paths-were-used.patch \
>             file://ceph.conf \
> -           file://0001-cmake-add-support-for-python3.10.patch \
> +           file://0001-cmake-add-support-for-python3.11.patch \
>             file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
>             file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
>             file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
> -- 
> 2.33.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7689): https://lists.yoctoproject.org/g/meta-virtualization/message/7689
> Mute This Topic: https://lists.yoctoproject.org/mt/95119889/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


