Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.5029.1617137083502295276
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 13:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ltgj8Dss;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id y12so5822936qtx.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Mar 2021 13:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QDn3BLkYgofgXKqGFVHRPB3k4YMOZs3ijF9zPc1Ywcs=;
        b=ltgj8DssfhtAHx1ULSYRE6YVeJCo7qRsFj+hvhLQCT/PPLh4UBXe49X1/Npwgc40my
         YKvnJalCXVhmVrFgx6dbF9aHgpUTvMhgCCmpVUYLKI79st9zJZUppBO2Wq134AIcNT7S
         HkukSdghfpEaQ+dtvbNVyaBKY/nuEx8LaYh+Zgf1N6fKGOV8zWFM6AwaqMpqrl0Wvh1U
         8/4srGS8X2bp8edgB7j5yH3OH4UmvmGZttDRJnx5sg7rOuLVMac0FM2b9l5fgYbxl/wS
         SwTXp73N+aaBxGrJIeMZx5KwGq/CuqZcP8NOjkircEaT51dML6j6Ijt9SZy5BGWAqwo6
         gNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QDn3BLkYgofgXKqGFVHRPB3k4YMOZs3ijF9zPc1Ywcs=;
        b=MaDW/u45AJ1PgXlhQJgMVgcmAAWsyquLfI8ffrPy2p1tjuYk68wlzkUERqttjGHbzS
         V/hiXnljQ94WYwj6akXjvSzIuiaJMa4IKCkV67/UGh+VLBBWUmr1cSKWUNY2m+79hIYO
         Yv/yvcGP2OVj2J+SV1v9eRZ9ynnLzLzejVCa730bFIGrsrIpbdx5p4bppHsn5TsAg5Mm
         QJvBCdyxWtiWSyk7KceyCCW/IGQcK85l4Zs3NGYXYS7pQbcmx4npSO6YP51X4AYKOieG
         apBnZJ8IM3v3O63AhyPg7wJkOVWBNTHWTS7p9t4AMlsTEwYRnui8Zif3necT00J5I4+o
         y+jA==
X-Gm-Message-State: AOAM530jOLyHBsNJQn3tpPerL+UDekHeSWE/oGyqfj0M1fG9t1iu8INH
	a6a9JXkFZiC4u7Dw+NA9R0meKOt1ekA0aQ==
X-Google-Smtp-Source: ABdhPJwS5vpok7yPovgX5YXMxRYWEyPJ6CjmOG9EnEKUWE8w3meogml9KuxKnuSDqDG5UODJYuXkjQ==
X-Received: by 2002:a05:622a:446:: with SMTP id o6mr28975620qtx.257.1617137082633;
        Tue, 30 Mar 2021 13:44:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id i6sm16428996qkf.96.2021.03.30.13.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 13:44:42 -0700 (PDT)
Date: Tue, 30 Mar 2021 16:44:40 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] boto3: satisfy runtime dependencies
Message-ID: <20210330204440.GC12428@gmail.com>
References: <20210329185955.11706-1-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20210329185955.11706-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the change.

This is now merged (and I appreciate the submission here, since it is nice
to keep the dependency close to what is using it .. until it becomes more
common and then we can move it if required).

Bruce


In message: [meta-virtualization][PATCH] boto3: satisfy runtime dependencies
on 29/03/2021 Bartosz Golaszewski wrote:

> Currently boto3 can be built into an image but it won't work without
> additional dependencies. First: botocore is needed at run-time, second:
> there are other packages available in meta-python that need adding.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  recipes-devtools/python/python3-boto3_1.14.7.bb     |  2 ++
>  recipes-devtools/python/python3-botocore_1.20.36.bb | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 recipes-devtools/python/python3-botocore_1.20.36.bb
> 
> diff --git a/recipes-devtools/python/python3-boto3_1.14.7.bb b/recipes-devtools/python/python3-boto3_1.14.7.bb
> index f9e979e..0e9611c 100644
> --- a/recipes-devtools/python/python3-boto3_1.14.7.bb
> +++ b/recipes-devtools/python/python3-boto3_1.14.7.bb
> @@ -13,3 +13,5 @@ SRC_URI[md5sum] = "fb8b77d4ac10a971570419dd3613196e"
>  SRC_URI[sha256sum] = "4856c8cb4150b900cc7dccbdf16f542fb8c12e97b17639979e58760847f7cf35"
>  
>  inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += "python3-botocore python3-urllib3 python3-unixadmin"
> diff --git a/recipes-devtools/python/python3-botocore_1.20.36.bb b/recipes-devtools/python/python3-botocore_1.20.36.bb
> new file mode 100644
> index 0000000..4c4a825
> --- /dev/null
> +++ b/recipes-devtools/python/python3-botocore_1.20.36.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "The low-level, core functionality of boto 3."
> +HOMEPAGE = "https://github.com/boto/botocore"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
> +
> +SRC_URI = "git://github.com/boto/botocore.git;protocol=https"
> +SRCREV = "8c7123bd4683049dcac62bf3e11662e6a72c5eec"
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} += "python3-jmespath python3-dateutil python3-logging"
> -- 
> 2.30.1
> 
