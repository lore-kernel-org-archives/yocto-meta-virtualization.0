Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.15815.1605413521457123255
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Nov 2020 20:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=exakapJb;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 85C2B38C086C
	for <meta-virtualization@yoctoproject.org>; Sun, 15 Nov 2020 04:12:00 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id r7so13631059qkf.3
        for <meta-virtualization@yoctoproject.org>; Sat, 14 Nov 2020 20:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xj8M+7UXVRcnMzwJkanjPjV+C2kCDnDUiNppkysTdDQ=;
        b=exakapJbtX41TjK+OfxSGiZac0omvU34NWGcx8GJmjrZFptsW5mVTSVORFQ6VI8ZF/
         67+KDWVcVjC0aF7uEEvQHADx5M3zVQmGedXgVz36UzqsZIXScesM2bRPXP7P9JK1bzgH
         KaoLRVXEcMTGx/UqERM5ffgBzME0Y2cRxRgnuDaacpfP7YRsHWsD+9zNbmVoQHUuVRpX
         am+5FrMZB+H8iwHlEVGD79rbE1ZQy3w4iOJg4H4hCo8gzgZIBlIUtBLCQJyycnkxMfWQ
         vu8/TmfpFxMHYIQ6tFc/NA8JL3xn+gIgzRLUXd2kXYlSJnaRgxfLPpf5VTlsP6J9tLuE
         6Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xj8M+7UXVRcnMzwJkanjPjV+C2kCDnDUiNppkysTdDQ=;
        b=YecjA+9zSs9hWFOE2roZtbbrLKykALSCHXu7qQ9qrUx4M00NJJBJRekfmeVB1UkQ6I
         05h9r0NU8q/pyWzwW+qKgcCzPfwcku0sUJVlcrU5vqHw1sIQ7y0TQgDOJrn2sTSK0AmO
         +gKkl+QhBxwubRmsvI0P3SHMy0xKnpFzg5Fax2nqw+tGh6hGIwQV764L/+zpt4Fqf42R
         M6TJDjafHcUhw7VGygipd8MKnGJm4AlFf+0qwvrXyEH0824SPT68bz6AF8lzQpE1shC0
         wWIJEnlwR9P1JhPyw8k/D6sSFMSpXBxHMnFdW2UF6u/0TiPzulHIm82fYr19y1HS/4bS
         0djw==
X-Gm-Message-State: AOAM531GtGLTGVGd940zcLtZq5fXhgE4SB6qZkzC6L3unzWffOJD3SFh
	Gc2j6Lz9RuykeKmlvBGaVC0=
X-Google-Smtp-Source: ABdhPJzYrHxDod+W1tbKAuEupcfGtNSpqxXFr7Tmx8yfx1oF4Ms4q1IiDu7JrS2k2xg9PiAd8yBInw==
X-Received: by 2002:a37:d16:: with SMTP id 22mr8970100qkn.335.1605413519509;
        Sat, 14 Nov 2020 20:11:59 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id o62sm10478487qkb.94.2020.11.14.20.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 20:11:58 -0800 (PST)
Date: Sat, 14 Nov 2020 23:11:57 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: pbarker@konsulko.com, meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2] ceph: add support for python3.9
Message-ID: <20201115041154.GA20540@gmail.com>
References: <20201111031951.33998-1-yanfei.xu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20201111031951.33998-1-yanfei.xu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

You have a patch in your SRC_URI, that I don't have in master ..

So I checked the mailing list and found a submission from August.

I applied that patch first, and then yours.

As a general rule though, you should be sure that you are on
upstream master, not a local branch when sending a patch. You
would have noticed that I missed the patch and could have pinged /
asked about it.

Cheers,

Bruce

In message: [meta-virtualization] [PATCH v2] ceph: add support for python3.9
on 11/11/2020 Xu, Yanfei wrote:

> From: Yanfei Xu <yanfei.xu@windriver.com>
> 
> Add support for python3.9, or it will do_configure failed.
> 
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
> v1->v2: Change the patch's Upstream-Status to 'Pending'.
> 
>  ...0001-cmake-add-support-for-python3.9.patch | 30 +++++++++++++++++++
>  recipes-extended/ceph/ceph_15.2.0.bb          |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
> 
> diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
> new file mode 100644
> index 0000000..d9116c4
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
> @@ -0,0 +1,30 @@
> +From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
> +From: Yanfei Xu <yanfei.xu@windriver.com>
> +Date: Tue, 10 Nov 2020 17:17:30 +0800
> +Subject: [PATCH] cmake: add support for python3.9
> +
> +add support for python3.9.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> +---
> + cmake/modules/FindPython/Support.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cmake/modules/FindPython/Support.cmake b/cmake/modules/FindPython/Support.cmake
> +index 6584699b79..c05bbe3306 100644
> +--- a/cmake/modules/FindPython/Support.cmake
> ++++ b/cmake/modules/FindPython/Support.cmake
> +@@ -17,7 +17,7 @@ if (NOT DEFINED _${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR)
> +   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
> + endif()
> + if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
> +-  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
> ++  set(_${_PYTHON_PREFIX}_VERSIONS 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
> + elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
> +   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
> + else()
> +-- 
> +2.18.2
> +
> diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
> index bdc794f..8454a20 100644
> --- a/recipes-extended/ceph/ceph_15.2.0.bb
> +++ b/recipes-extended/ceph/ceph_15.2.0.bb
> @@ -21,6 +21,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0002-mon-enforce-caps-for-pre-octopus-client-tell-command.patch \
>             file://0003-PendingReleaseNotes-note-about-security-fix.patch \
>             file://0001-add-missing-include-for-atomic-bool.patch \
> +           file://0001-cmake-add-support-for-python3.9.patch \
>  "
>  
>  SRC_URI[md5sum] = "1f9af648b4c6d19975aab2583ab99710"
> -- 
> 2.18.2
> 

> 
> 
> 

