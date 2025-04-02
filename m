Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A7EC36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 02:23:41 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.4417.1743560612562512827
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 19:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K6nfOQ/l;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476af5479feso53715091cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Apr 2025 19:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743560611; x=1744165411; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRgO0gDwgxdoNyQp0lJTbXFHoTKU8y6Pb8VXVGdaWic=;
        b=K6nfOQ/l5fvQW2KFGffF9xMg8Tx0/Hiv1gJUT1pGnpnacsSzUuV4XuzsiYkeRZJLCg
         Kk2zHr92/uVsbmx8lDEp369TPIr16vuE/c5z8+FF9p8sAvGxaTcnFLPcKr03kwkffBNd
         gdEUYjyLBO3kkp+/+YEdtTNcVundBFHXG76zUNKbhzijUWg6Kyj+N8JtkPx+CJHW0ZQg
         nuOYK1yCDW43hoqJB62kDzer9kGQp/j1Fc4DvC+y47MrwUwNBAO9KlQ42tONcbuIg7fF
         EJjWRzdOSobBHFt6xOQi5uOYjOVfue4G3f+0U0y9SBk9VWMxhIXKiVe6/xE7bks1hp5q
         jDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743560611; x=1744165411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRgO0gDwgxdoNyQp0lJTbXFHoTKU8y6Pb8VXVGdaWic=;
        b=TGAptdWm+THQClQuiHSV+dIOGaUNwBZFbR11NMLgBSDKYgLtJXviDIyaEPNOWFtk+f
         4B+dRvwtf/e+BE+To93BnRYvOA5vX0s/u176ys/GAkk7WAPhWwaKLv9OzzXA1qEtAXD/
         wxZarkdN/RJag3DvprY4Qo0V8B6nLFzjlW7p5MMF4ls2dxI0b7ilhVl4Sahyg9RVvmV1
         42wsw8seivu+UPdLb5ZmTglbCbdE8qVXeBh5eVG7kTml8oJvMuPqNYANmq8oGrl+k4Ia
         6nbCVQWuv61D7JTWfQ2YML7JYHtBPOL/b12SfqBhj8IVwhvIYcEPe3IIy0JDjKZj5bkz
         5Bfw==
X-Gm-Message-State: AOJu0YwZxecjrg7TTwM3eMvCfechWmJ+MShA1NSDCWUyEkHQ3Rm3xhmd
	DlDcrpr22yDAUb35abrZYZrH3zKAd+j8d692lwkTcBMhKsaaPF3z
X-Gm-Gg: ASbGncvM7L8KKb42w5MP9TU19ZHYBiJeGwOZ/v9to2bgO2RTqFsbjCCEfojla7g5ZoK
	m4lbse7Uf51xlA9zxZ21yB26FYPF3o1AeOVq7+Fc/aQLh/6khr+iiJTbL8Bw7LkxN48yEEX950/
	VKkNIIu0omcguBO/ROHqt9aHOcRvC5ez+y2Z6o0UWbAKdZS8o71tBvhCBkbdYDpurvQ3Fo/J6bF
	tmxviqUegCvAIt5RGcjCN9l5uxg+DamSefKdAD7wmN9sd12pqo65J+AVXEd6e5hn58xcyyBOmUQ
	8ZBjDOFTGF6sHXy9tCJfmyJ0PF6Beo797mklaQcGl2zwuW1FfTGNGeW5Dds1vCUWGFGU5HivTC1
	k5q7ODlcDi69Kp6CmdGTMLC8ulzsVN3hGXQ==
X-Google-Smtp-Source: AGHT+IFEk8dCHT4CLOUZV7vbhFG0m0692+cfINNioWLxWb/S4iTFM1CbWtHl1dzZQXMVgGUTgGKfIQ==
X-Received: by 2002:a05:622a:189d:b0:477:1f29:e80f with SMTP id d75a77b69052e-477e4ad949cmr234579291cf.4.1743560611582;
        Tue, 01 Apr 2025 19:23:31 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a49f2csm73742821cf.32.2025.04.01.19.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:23:31 -0700 (PDT)
Date: Wed, 2 Apr 2025 02:23:29 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Bin Lan <bin.lan.cn@windriver.com>
Subject: Re: [scarthgap][PATCH] openvswitch: fix ptest contains reference to
 TMPDIR [buildpaths]
Message-ID: <Z-yfodIla9zAaJ-5@gmail.com>
References: <20250331203636.2882127-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331203636.2882127-1-martin.jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 02:23:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9187


merged.

Bruce

In message: [scarthgap][PATCH] openvswitch: fix ptest contains reference to TMPDIR [buildpaths]
on 31/03/2025 martin.jansa@gmail.com wrote:

> From: Bin Lan <bin.lan.cn@windriver.com>
> 
> The EGREP in ptest/tests/atlocal contains the build paths.
> The CFLAGS in ptest/tests/atlocal contains the build paths.
> This change set fixs:
>  - set EGREP to "grep -E" in ptest/tests/atlocal
>  - set CFLAGS to " " in ptest/tests/atlocal
> by updating the patch
> openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch.
> 
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...est-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> index 571753a5..abad1458 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> @@ -16,6 +16,13 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
>  refresh patch to fix patch-fuzz warning
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  
> +Refresh patch to fix file ptest/tests/atlocal 
> +contains reference to TMPDIR [buildpaths]. The fix is:
> + - set EGREP to "grep -E" in ptest/tests/atlocal
> + - set CFLAGS to " " in ptest/tests/atlocal
> +
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> +
>  Upstream-Status: Inappropriate [embedded specific]
>  ---
>   Makefile.am |  1 +
> @@ -37,7 +44,7 @@ new file mode 100644
>  index 0000000..0b4587c
>  --- /dev/null
>  +++ b/test.mk
> -@@ -0,0 +1,74 @@
> +@@ -0,0 +1,76 @@
>  +TEST_DEST ?= ${prefix}/lib/openvswitch
>  +TEST_ROOT ?= ${prefix}/lib/openvswitch
>  +TEST_DEPEND =
> @@ -112,3 +119,5 @@ index 0000000..0b4587c
>  +	sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
>  +	sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
>  +	sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
> ++	sed -i 's|EGREP=.*|EGREP='"'"'grep -E'"'"'|g' $(TEST_DEST)/tests/atlocal
> ++	sed -i 's|CFLAGS=.*|CFLAGS='"'"' '"'"'|g' $(TEST_DEST)/tests/atlocal

