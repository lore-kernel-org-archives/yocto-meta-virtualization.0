Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.4664.1637791025626316323
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 13:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dti0BORE;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id f20so4204841qtb.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Nov 2021 13:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H/1sqox8PksQ2zsRyS7qR8Vvwtq7o4DE1dhfEk0cQAg=;
        b=dti0BOREMhz0mtVaQuD2ERlb8BA/DCw+SZLcKPz0dRLno/IUuElLmIYc7kian2O3nY
         ZmE4dbmoewLxdwPrtRaShl+kvwWoxC+E2LZmbYr+14Mj7gvNG9aO3LnnnRH9XTKxHn91
         rb4WRNuFNO+8yUk+Un4pPnVNzS2LN+NZIisVjdFSeMMKLr3rrrZmG9xQX9+Gu21IFG18
         rUfpTodAU8IHdrs/3Wyn0qq6KMf8lDQ9Rb9GarUwA9EoisOFnLpuCju8SI2fFdoA/2vQ
         kqKLat3rGPnRTkNLAGDrqN2Y72EoiFnp6J5vtYo8UhHZajOYm2kQ0+Ox1pszRUS15l6Y
         qkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H/1sqox8PksQ2zsRyS7qR8Vvwtq7o4DE1dhfEk0cQAg=;
        b=4XsADNX8L2OjN1R6tpAhDdERRPsN8qU2RouKcRdrr6s3A2EQx0DEDzTrhLOgITzEfp
         xZPh2hEkud/MLsQnG3Xbd/X1XV5avuLDgXh2ltHm8D/7BBB0N9WRf7uuRV/cv35bAeSG
         PV1BKTQsJFPNGxowPLo8Hg2vTxrFLTAdRHdLn/Ek8NrgY3DLDcneSGKiiDNzZgyq8NCN
         ojwBcwDtcS6pb0AZYMFtS7MXuyKLC9XlaAWA6YINB9aZ3xhk0q35BmCZ1H2oOiGnOoFL
         iTJS4M9P0TrX/IAQnei5cqIZk0wYjJEv5vT2WVLvPLvxW1/ySxrXeohU1oNNuFxHFYio
         xv3Q==
X-Gm-Message-State: AOAM5313Lmpd4tTiprazOb8fdLgRkvkD22U3F3RYWAdeJRil/t0OFWR+
	ojlyN7J2Sy2GXcykJxM/jDM=
X-Google-Smtp-Source: ABdhPJzEBKLBHTCoarV0uy01WwPT5UGKhu7rmS1bqm0AYgP28V7B0clGk0OEa7ztpbcXnmjbgtuVqA==
X-Received: by 2002:ac8:5848:: with SMTP id h8mr11280912qth.339.1637791024606;
        Wed, 24 Nov 2021 13:57:04 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id v15sm509652qkl.91.2021.11.24.13.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:57:04 -0800 (PST)
Date: Wed, 24 Nov 2021 16:57:02 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: fix CVE-2021-3667
Message-ID: <20211124215659.GA41316@gmail.com>
References: <20211123075031.2902715-1-yanfei.xu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20211123075031.2902715-1-yanfei.xu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In master, I tend to favour uprev's versus specific CVE patches.

That being said, I have a lot of pending changes right now, and
won't have time to uprev for a few more weeks, so I've gone ahead
and merged the change.

Bruce

In message: [meta-virtualization][PATCH] libvirt: fix CVE-2021-3667
on 23/11/2021 Xu, Yanfei wrote:

> Backport a fix for CVE-2021-3667.
> 
> The CVE discription: An improper locking issue was found in the
> virStoragePoolLookupByTargetPath API of libvirt. It occurs in the
> storagePoolLookupByTargetPath function where a locked virStoragePoolObj
> object is not properly released on ACL permission failure. Clients
> connecting to the read-write socket with limited ACL permissions could
> use this flaw to acquire the lock and prevent other users from accessing
> storage pool/volume APIs, resulting in a denial of service condition.
> The highest threat from this vulnerability is to system availability.
> 
> Refer to: https://bugzilla.redhat.com/show_bug.cgi?id=1986094
> 
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  ...nlock-object-on-ACL-fail-in-storageP.patch | 40 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch b/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch
> new file mode 100644
> index 00000000..608322d9
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch
> @@ -0,0 +1,40 @@
> +From d3e20e186ed531e196bb1529430f39b0c917e6dc Mon Sep 17 00:00:00 2001
> +From: Peter Krempa <pkrempa@redhat.com>
> +Date: Wed, 21 Jul 2021 11:22:25 +0200
> +Subject: [PATCH] storage_driver: Unlock object on ACL fail in
> + storagePoolLookupByTargetPath
> +
> +'virStoragePoolObjListSearch' returns a locked and refed object, thus we
> +must release it on ACL permission failure.
> +
> +Fixes: 7aa0e8c0cb8
> +Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1984318
> +Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> +Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> +
> +Upstream-status: Backport
> +CVE-2021-3667 [https://bugzilla.redhat.com/show_bug.cgi?id=1986094]
> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> +---
> + src/storage/storage_driver.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/storage/storage_driver.c b/src/storage/storage_driver.c
> +index ecb5b86b4f..de66f1f9e5 100644
> +--- a/src/storage/storage_driver.c
> ++++ b/src/storage/storage_driver.c
> +@@ -1739,8 +1739,10 @@ storagePoolLookupByTargetPath(virConnectPtr conn,
> +                                            storagePoolLookupByTargetPathCallback,
> +                                            cleanpath))) {
> +         def = virStoragePoolObjGetDef(obj);
> +-        if (virStoragePoolLookupByTargetPathEnsureACL(conn, def) < 0)
> ++        if (virStoragePoolLookupByTargetPathEnsureACL(conn, def) < 0) {
> ++            virStoragePoolObjEndAPI(&obj);
> +             return NULL;
> ++        }
> + 
> +         pool = virGetStoragePool(conn, def->name, def->uuid, NULL, NULL);
> +         virStoragePoolObjEndAPI(&obj);
> +-- 
> +2.27.0
> +
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
> index cc7bb2cb..4ec11fb5 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> @@ -30,6 +30,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://gnutls-helper.py \
>             file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
>             file://0001-security-fix-SELinux-label-generation-logic.patch \
> +           file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
>            "
>  
>  SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
> -- 
> 2.27.0
> 

> 
> 
> 

