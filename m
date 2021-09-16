Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web09.4616.1631830189747287601
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 15:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ONpMMiFr;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id c19so7026882qte.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 15:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=POoeXK8Eh+WV0p72JwN4dOZH0ylegYhUeWKOTkyE5lY=;
        b=ONpMMiFrG25yCOIyE7TR46s/TK5rg9vzAFGQxnlBSH2xMBY4qkWRHoiuvf4pfuQtup
         z9TsihrKqGL0iFG0Gdu4NH56spKU0TmZU4yNCWVPkdPmb86az4g3HhR718NbIx3MfQ8M
         w/C8lsaiK3ABYmejvCBmRJfCwTQjJ84akEG3aAI6B0WNpN7nFziusPSjEgCVNP0SRnpf
         oKu7l5qhikRyZ1BC+spC4BmVKFcY6fyYyQwO+Yphg2jRNzDUGO7PgdiH2UmwOWXmcONV
         Q9hmXm7avW/HMf6BxPYreCVNR+z4C831Xnspj4sB85UuD2bwwpKM53QniugCxlJ+EQ6q
         7mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=POoeXK8Eh+WV0p72JwN4dOZH0ylegYhUeWKOTkyE5lY=;
        b=GrPPPNuN6d27i2cW7gTYGGw64ntetG8yeopmbbfbYI0tmppnLsdMVdD9Z6qH9PWVTM
         0pHVeFu6FtNXqrZk0rxE/d2Sho1TWvAihz2mEKIuVKX6P02JV8cBpwwf9c1iJqID47gN
         bssXyi9pYa6lqngNros/dUl/vjfRTH9GaKUHEeX2BXTtn0YcEMoiv9SIPlsz6t1TU6ZL
         SgEwbSbmwtVHSr19jye7i9evgm5J2FNGM3pM+jiQEEt/4M2a4LBc5cMQMBp9gtK5wrQ5
         AOQOc0PPT4FqGzuhTfHQ3Xiu3BArFA9dekyKndblm3vwpFb8+KtH5b/9mfW03fasjhIe
         IrTw==
X-Gm-Message-State: AOAM5331KPElOHZPIc/AOrZVyJDK06CTYmR12RmYPWvFWQGjFbvWoP/r
	LjpwzXk73DhziIdx06QkijECCt5XGwvzCQ==
X-Google-Smtp-Source: ABdhPJyasWFCe0TCPh9En1/Vy2fb3WHDB8VQBZV+7oCgV3MUibkuW+T+UCWTNdyGWGr2qhxt9/XInQ==
X-Received: by 2002:a05:622a:1aaa:: with SMTP id s42mr7484616qtc.122.1631830188861;
        Thu, 16 Sep 2021 15:09:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id w6sm3521575qkw.91.2021.09.16.15.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:09:48 -0700 (PDT)
Date: Thu, 16 Sep 2021 18:09:46 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: qiang.zhang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH] libvirt: fix CVE-2021-3631
Message-ID: <20210916220946.GB25504@gmail.com>
References: <20210910091154.28512-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210910091154.28512-1-qiang.zhang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In message: [PATCH] libvirt: fix CVE-2021-3631
on 10/09/2021 qiang.zhang@windriver.com wrote:

> From: Zqiang <qiang.zhang@windriver.com>
> 
> Selinux MCS generate a single category context and may
> be accessed by another machine.
> 
> link: https://gitlab.com/libvirt/libvirt/-/issues/153
> 
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  ...y-fix-SELinux-label-generation-logic.patch | 54 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-generation-logic.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-generation-logic.patch b/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-generation-logic.patch
> new file mode 100644
> index 00000000..e8952c36
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-generation-logic.patch
> @@ -0,0 +1,54 @@
> +From 15073504dbb624d3f6c911e85557019d3620fdb2 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> +Date: Mon, 28 Jun 2021 13:09:04 +0100
> +Subject: [PATCH] security: fix SELinux label generation logic
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +A process can access a file if the set of MCS categories
> +for the file is equal-to *or* a subset-of, the set of
> +MCS categories for the process.
> +
> +If there are two VMs:
> +
> +  a) svirt_t:s0:c117
> +  b) svirt_t:s0:c117,c720
> +
> +Then VM (b) is able to access files labelled for VM (a).
> +
> +IOW, we must discard case where the categories are equal
> +because that is a subset of many other valid category pairs.
> +
> +Fixes: https://gitlab.com/libvirt/libvirt/-/issues/153
> +CVE-2021-3631
> +Reviewed-by: Peter Krempa <pkrempa@redhat.com>
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +---
> + src/security/security_selinux.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/security/security_selinux.c b/src/security/security_selinux.c
> +index b50f4463cc..0c2cf1d1c7 100644
> +--- a/src/security/security_selinux.c
> ++++ b/src/security/security_selinux.c
> +@@ -383,7 +383,15 @@ virSecuritySELinuxMCSFind(virSecurityManager *mgr,
> +         VIR_DEBUG("Try cat %s:c%d,c%d", sens, c1 + catMin, c2 + catMin);
> + 
> +         if (c1 == c2) {
> +-            mcs = g_strdup_printf("%s:c%d", sens, catMin + c1);
> ++            /*
> ++             * A process can access a file if the set of MCS categories
> ++             * for the file is equal-to *or* a subset-of, the set of
> ++             * MCS categories for the process.
> ++             *
> ++             * IOW, we must discard case where the categories are equal
> ++             * because that is a subset of other category pairs.
> ++             */
> ++            continue;
> +         } else {
> +             if (c1 > c2) {
> +                 int t = c1;
> +-- 
> +2.17.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
> index 9cf29511..b7f8383a 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> @@ -29,6 +29,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://hook_support.py \
>             file://gnutls-helper.py \
>             file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
> +           file://0001-security-fix-SELinux-label-generation-logic.patch \

We could also just uprev libvirt, but this close to the release, I've opted
to just apply this patch.

The patch itself was missing an Upstream-status field, so I've added that
as part of the merge.

Bruce

>            "
>  
>  SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
> -- 
> 2.17.1
> 
