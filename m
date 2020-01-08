Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.2963.1578518482325188888
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jan 2020 13:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B+qYvNX8;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32C07E01406; Wed,  8 Jan 2020 13:21:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5ED2DE01155
	for <meta-virtualization@yoctoproject.org>; Wed,  8 Jan 2020 13:21:21 -0800 (PST)
Received: by mail-qk1-f195.google.com with SMTP id w127so4022107qkb.11
        for <meta-virtualization@yoctoproject.org>; Wed, 08 Jan 2020 13:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ij7kNeW6FQWTcBXDQsRp1YhgLhI3V5pBrAtNqdLkFgQ=;
        b=B+qYvNX8+BrEy6hGe2QkAKA/bbFP4wNIR44lLRAWFOkd1nm83RXludSnl3ITVqzpz8
         rs4d3+wEeqJFaqb4kpVxGksdKeqE8UOtNKu5EL7rW6BCVeI/zMP1KopOxOv7ace5tM1x
         G0i/l827pdZYQv7ocSB+/h6YdNLoDn2QxLLo1JioRwd65vuIix8eVb33H6bGTe3vGsdf
         zuE0ugeAI4H0r5Pi54LVM3o5tVX6ctPGf+PBlEMAWaiDzEtJIN0lPF3dde4pyHe5XYaN
         hHtCRT0qpesWlqHc4WzvuxCE/9JkxJeN/SVqx21JsXGkrozFxTU/ZL9Fj5mggNSjPk77
         fr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ij7kNeW6FQWTcBXDQsRp1YhgLhI3V5pBrAtNqdLkFgQ=;
        b=CNbN5pif2gAPkCb51NlPfLCLtzYZJWJ6X+ioRXfzpoY9TWyDlTLmo5NQyaraRsGnvR
         AiGOZpTTmMwsFpKQcfUVXcm6+AsXprfCK8y9Agqlz1DOYEKNUc/edT3n94geTOrheEW3
         GRL3iSm0u10pxwXFEkPsO7uIaJIBCrcP0zCs1HSWKUISJJtYD5mO9FbNCwwd2SzJabb2
         oGWosQ4E9wfnozH/nHFkatiwFVIQmXObG9RVSKN2BRBXYmsJhYkvigynV4Baf+jf719y
         poGcSvrEMbzYMc1LdFZ5QjFXcIvKdSd4GIyV7H9EeiNW0X9FuJeH7yNi7A1nGXB70wSA
         R2aQ==
X-Gm-Message-State: APjAAAWlUo9Jzfz20O05CTs3vQWr72SYhMCynar64xmeYFaFttuBemI/
	dD8cvSdELdQFYHJ9xp8wySs=
X-Google-Smtp-Source: APXvYqyVsqAbeuEo/32WSZdQfZVlMS4SIXjazt48/upZFzYR3y3TpXPO5O6qSSUVFpKRJIkDjQcHuw==
X-Received: by 2002:a37:6287:: with SMTP id w129mr6242973qkb.381.1578518480733;
        Wed, 08 Jan 2020 13:21:20 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id o6sm1979837qkk.53.2020.01.08.13.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 13:21:20 -0800 (PST)
Date: Wed, 8 Jan 2020 16:21:18 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] ceph: backport patch to fix compilation failure of boost 1.72
Message-ID: <20200108212117.GB12328@gmail.com>
References: <20200103031005.847-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200103031005.847-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged (we should update the version in this release cycle, but there's no
sense leaving this broken while I wait for that).

Bruce

In message: [meta-virtualization][PATCH] ceph: backport patch to fix compilation failure of boost 1.72
on 03/01/2020 Chen Qi wrote:

> Backport a patch to fix compliation failure caused by boost upgrading
> to 1.72.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...common-rgw-workaround-for-boost-1.72.patch | 62 +++++++++++++++++++
>  recipes-extended/ceph/ceph_14.2.3.bb          |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch
> 
> diff --git a/recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch b/recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch
> new file mode 100644
> index 0000000..44bda1a
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-common-rgw-workaround-for-boost-1.72.patch
> @@ -0,0 +1,62 @@
> +From ea64c4909ffeae10e5d8e0a23604030e8849f803 Mon Sep 17 00:00:00 2001
> +From: Kefu Chai <kchai@redhat.com>
> +Date: Mon, 23 Dec 2019 16:26:13 +0800
> +Subject: [PATCH] common,rgw: workaround for boost 1.72
> +
> +see also https://github.com/boostorg/coroutine/issues/46
> +
> +will need to remove this change once we require boost >= 1.73
> +
> +Signed-off-by: Kefu Chai <kchai@redhat.com>
> +
> +Upstream-Status: Backport [https://github.com/ceph/ceph/commit/ea64c4909ffeae10e5d8e0a23604030e8849f803]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/common/async/yield_context.h | 2 ++
> + src/rgw/rgw_asio_frontend.cc     | 2 ++
> + src/test/librados/asio.cc        | 2 ++
> + 3 files changed, 6 insertions(+)
> +
> +diff --git a/src/common/async/yield_context.h b/src/common/async/yield_context.h
> +index fda9541eb4..436192c02f 100644
> +--- a/src/common/async/yield_context.h
> ++++ b/src/common/async/yield_context.h
> +@@ -14,6 +14,8 @@
> + 
> + #pragma once
> + 
> ++#include <boost/range/begin.hpp>
> ++#include <boost/range/end.hpp>
> + #include <boost/asio/io_context.hpp>
> + 
> + #include "acconfig.h"
> +diff --git a/src/rgw/rgw_asio_frontend.cc b/src/rgw/rgw_asio_frontend.cc
> +index 7df74225f6..deab1b0c66 100644
> +--- a/src/rgw/rgw_asio_frontend.cc
> ++++ b/src/rgw/rgw_asio_frontend.cc
> +@@ -7,6 +7,8 @@
> + 
> + #include <boost/asio.hpp>
> + #define BOOST_COROUTINES_NO_DEPRECATION_WARNING
> ++#include <boost/range/begin.hpp>
> ++#include <boost/range/end.hpp>
> + #include <boost/asio/spawn.hpp>
> + #include <boost/intrusive/list.hpp>
> + 
> +diff --git a/src/test/librados/asio.cc b/src/test/librados/asio.cc
> +index 9c86ad420c..8fa4bab197 100644
> +--- a/src/test/librados/asio.cc
> ++++ b/src/test/librados/asio.cc
> +@@ -21,6 +21,8 @@
> + 
> + #ifdef HAVE_BOOST_CONTEXT
> + #define BOOST_COROUTINES_NO_DEPRECATION_WARNING
> ++#include <boost/range/begin.hpp>
> ++#include <boost/range/end.hpp>
> + #include <boost/asio/spawn.hpp>
> + #endif
> + #include <boost/asio/use_future.hpp>
> +-- 
> +2.17.1
> +
> diff --git a/recipes-extended/ceph/ceph_14.2.3.bb b/recipes-extended/ceph/ceph_14.2.3.bb
> index 25a8ea2..b2bf220 100644
> --- a/recipes-extended/ceph/ceph_14.2.3.bb
> +++ b/recipes-extended/ceph/ceph_14.2.3.bb
> @@ -13,6 +13,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://ceph.conf \
>             file://0001-rgw-add-executor-type-for-basic_waitable_timers.patch \
>             file://0001-rgw-beast-handle_connection-takes-io_context.patch \
> +           file://0001-common-rgw-workaround-for-boost-1.72.patch \
>  "
>  SRC_URI[md5sum] = "e4a53270fba14bf34d0b4c2a2340042e"
>  SRC_URI[sha256sum] = "63d0eddab80f7bcdd4e9ac86d2b36c6cc8c9e2d34f20e8e426ff1620d66748dd"
> -- 
> 2.17.1
> 

> 

