Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.4796.1631830760612603139
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 15:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LcWc/woA;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id x5so7024212qtq.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 15:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=npol2S7HAs0WYHjJzRIFTsTeCCYRKwjXAl6j3eYO1fY=;
        b=LcWc/woAzzWavZVXnPcnvXmUViV12onJuBIpWz5x6cEkCw0OJPCCZrKfH7elzZ0ViV
         N+MR8Rv50YPU5wviyaKJKbrz8HtwbdW1Lpscd1SznpqPE9mzTZ2mEQ1AemS4DujzGsPB
         qXdtYqL/qD9sF5K4g3C919SqEh/XnDt9sGlIiTmwfWmlS5Y5ky4WatQ60zOsFlW6UB3j
         BdZH6eGaW1+3wb1dbQVqBOwHOe1Z1jP1z5KNlAUmQGJogteDDrZYsPVsVPo8ubpmqR+o
         GVLEO1UFpS2cn9rvIGhXtAk0ui/+eegDC/wz8bwM0RW6hlJzXpv1QK39bBPXDYwW3ldi
         ibYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=npol2S7HAs0WYHjJzRIFTsTeCCYRKwjXAl6j3eYO1fY=;
        b=4RGSxmk3g124xe68j+S+DQyDNJEqBQvPzopqo+aG/78G6C2w0PMDg9uJkfRL3Hocqs
         yDjhWNpOdpDxOaV2rYPqgexE8WvlyG97qARFc2sCeu2DxXgmJFGeSBZIt5MF7BtW91rw
         GXLTdc/uMWye/QwSmhWP9hCyG/3fTJdMKTtbxOSfW9k/XBkU/Z6Nc7A+26JAyEMPDzq7
         a1JdsoOGkUf5LdixNrBAebDOjzR166y+dkBw+xC57o2YQGCAHm+z+FLlV8LOpxunxmRc
         x+PK8nEcgpTqtjL/oDoEEZJ027t74/WX5RmFUBJvSHsFs1T59JK8e6D1nIvKu/OIVPTP
         xKgw==
X-Gm-Message-State: AOAM532pKzoGher7VrTTpz1T6TvL1sxnmgFdc/KBg93JEgcI2EyKlN8e
	ufaLhJGkmSvMao/CCEOVVXs=
X-Google-Smtp-Source: ABdhPJyf+6ZVk6AMrtJIlAkeGj3+dNKD5Xy0WK2Tm6bQXaw47WzLkSyQwK9FE5KCTRDgaWeRP/JE4Q==
X-Received: by 2002:a05:622a:1aaa:: with SMTP id s42mr7525297qtc.122.1631830759575;
        Thu, 16 Sep 2021 15:19:19 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id e5sm3063881qts.0.2021.09.16.15.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:19:19 -0700 (PDT)
Date: Thu, 16 Sep 2021 18:19:17 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: Security fix for CVE-2021-3631
Message-ID: <20210916221916.GC25504@gmail.com>
References: <20210916194711.759443-1-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210916194711.759443-1-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Wind River had also submitted this, so I grabbed that patch (since
I was going in order), but I'll grab all your backported ones now.

Bruce

In message: [meta-virtualization][PATCH] libvirt: Security fix for CVE-2021-3631
on 16/09/2021 Armin Kuster wrote:

> From: Armin Kuster <akuster@mvista.com>
> 
> Source: https://libvirt.org/git/libvirt.git
> MR: 112956
> Type: Security Fix
> Disposition: Backport from https://gitlab.com/libvirt/libvirt/-/commit/15073504dbb624d3f6c911e85557019d3620fdb2
> ChangeID: 314727e329e5b1351326737eb9c9232f465db184
> Description:
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../libvirt/libvirt/CVE-2021-3631.patch       | 56 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2021-3631.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2021-3631.patch b/recipes-extended/libvirt/libvirt/CVE-2021-3631.patch
> new file mode 100644
> index 0000000..c1fa8c2
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2021-3631.patch
> @@ -0,0 +1,56 @@
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
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-3631
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/security/security_selinux.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +Index: libvirt-6.1.0/src/security/security_selinux.c
> +===================================================================
> +--- libvirt-6.1.0.orig/src/security/security_selinux.c
> ++++ libvirt-6.1.0/src/security/security_selinux.c
> +@@ -391,7 +391,15 @@ virSecuritySELinuxMCSFind(virSecurityMan
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
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
> index 9cf2951..7bc93ff 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> @@ -29,6 +29,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://hook_support.py \
>             file://gnutls-helper.py \
>             file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
> +           file://CVE-2021-3631.patch \
>            "
>  
>  SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
> -- 
> 2.25.1
> 

> 
> 
> 

