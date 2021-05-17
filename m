Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.19585.1621261769239574163
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 May 2021 07:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u7uAA8kT;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id f29so5946550qka.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 May 2021 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zr3Pyb+9s5NgkTRf8sV/yjeqJb3Rm6a7ssTqELw11zQ=;
        b=u7uAA8kTwop3P2BwEwA482zlpGAH+/IBkjG8ExgEKLpx85btMCvxKMEAF0w+ztdlaU
         tWxPMLs+mlfiLanKM/uaon7h9d7xVgJDgOrXtTAIA8tLXEKQLuxfRBpVcojnGZNpBYVh
         ZG2NsXcxsKDVJku9rSG7Ok3MvMkQlfHh8a9/s1vFWh7K6cvJVIMr4cQox//JhAxeHJT0
         xVV4dQLJPEUVCxZNhMIEa6dSi+UKc1yeTmlCRy3iOpcePsQGgdhzj2T3vYI9eSXX1kqp
         c6bCsAom1ifbpmGDO6pFsjynJRZOzOdPHCHfLLx7aFF4TSeRSaCfeHSSVgAwD/szQfrF
         DlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zr3Pyb+9s5NgkTRf8sV/yjeqJb3Rm6a7ssTqELw11zQ=;
        b=kHN008MSNpTPnL0O/1kEYWQ7qPTMXHowqVVTCOK18LfglmAhHJhvVWcS/PmIk5gSD2
         fpZReMG2a7OZd08XnjRZvgweM6/8H7eJ69ONRmGl54sh63YGYnhx2mLcbZgs+PSDl+rY
         vC3DTtYxvjUvs9jxEJKAyVffUWW6K92PzFGDeWouvljz1rXC08vsxdyuqCquzFQbR7Lo
         MOe2sJqmqXxswbvduCWjMg68V745i87dMZbgDLVxLYk46K3VCfbq4WltXIfl3n7k0TQr
         UYgtNLOdAFidPFiBKlDSgm6O8YaEzjD9JJhH20ibkPeUUazB5mh98V7tw/6keGNIrexM
         dOGA==
X-Gm-Message-State: AOAM5326sXgWGLXwdwDBx0ukzgt88fZcRjWEd4P4pN6aM/txoTAUZta6
	siss5z5Ltzx5pkWri+PuJKQ=
X-Google-Smtp-Source: ABdhPJzlDNQew/tGIhCEQCi7+yF86qIDrbRtk7fg+crw+Y0DwFwEFvaQqZNmTFdchZQgzWtGReFLkA==
X-Received: by 2002:a05:620a:b09:: with SMTP id t9mr93689qkg.17.1621261768395;
        Mon, 17 May 2021 07:29:28 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id n19sm10145343qtp.65.2021.05.17.07.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:29:28 -0700 (PDT)
Date: Mon, 17 May 2021 10:29:26 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] libvirt: backport patch to fix compatibility with Meson-0.58
Message-ID: <20210517142925.GA27200@gmail.com>
References: <20210515212510.47256-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210515212510.47256-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] libvirt: backport patch to fix compatibility with Meson-0.58
on 15/05/2021 Martin Jansa wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...on-Fix-compatibility-with-Meson-0.58.patch | 48 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meson-0.58.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meson-0.58.patch b/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meson-0.58.patch
> new file mode 100644
> index 0000000..3201eed
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meson-0.58.patch
> @@ -0,0 +1,48 @@
> +From c607266619c5ab78ad5d4179b3ea93cfb6348391 Mon Sep 17 00:00:00 2001
> +From: Andrea Bolognani <abologna@redhat.com>
> +Date: Mon, 3 May 2021 09:06:34 +0200
> +Subject: [PATCH] meson: Fix compatibility with Meson 0.58
> +
> +Builds failed with
> +
> +  tests/meson.build:690:0: ERROR: List item must be one
> +  of <class 'str'>, not <class 'list'>
> +
> +before this change.
> +
> +https://gitlab.com/libvirt/libvirt/-/issues/158
> +
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/c607266619c5ab78ad5d4179b3ea93cfb6348391]
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Andrea Bolognani <abologna@redhat.com>
> +Reviewed-by: Peter Krempa <pkrempa@redhat.com>
> +Reviewed-by: Pavel Hrdina <phrdina@redhat.com>
> +---
> + tests/meson.build | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/tests/meson.build b/tests/meson.build
> +index 05c3e90195..9900983d0c 100644
> +--- a/tests/meson.build
> ++++ b/tests/meson.build
> +@@ -687,12 +687,12 @@ foreach name : test_scripts
> +   test(name, script, env: tests_env)
> + endforeach
> + 
> ++testenv = runutf8
> ++testenv += 'VIR_TEST_FILE_ACCESS=1'
> ++
> + add_test_setup(
> +   'access',
> +-  env: [
> +-    'VIR_TEST_FILE_ACCESS=1',
> +-    runutf8,
> +-  ],
> ++  env: testenv,
> +   exe_wrapper: [ python3_prog, check_file_access_prog.path() ],
> + )
> + 
> +-- 
> +GitLab
> +
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
> index 24748ef..b569953 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> @@ -28,6 +28,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://dnsmasq.conf \
>             file://hook_support.py \
>             file://gnutls-helper.py \
> +           file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
>            "
>  
>  SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
> -- 
> 2.30.2
> 

> 
> 
> 

