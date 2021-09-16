Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.5499.1631834988026606861
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 16:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20210112.gappssmtp.com header.s=20210112 header.b=my6+jP7o;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: akuster@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id bg1so4899705plb.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 16:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=IoDocQpYuwpLRYJY/FIiI69rOYxL4wE2K95cNjtw3tI=;
        b=my6+jP7oH/CVzVOWcpJBmLOkBmws4HPqTrWgSr3EqEaxkJKXBtakYfwk6cZ2V49yZW
         rwyreRHLuaJfx/d9ezhWUt+h6zLp6IiSKFq9Sof+psNGIrXYmbzTFB1p7bVLu4+HaOia
         W11+Br1at4TLsmbcy0GqSUmydKstomecZ4nadKFYJUc38jMMexHrU/zvqVeZX8FRyVyZ
         i6La+0cUFTmo91Ai/kAjYuZu0QZCQOfrdosIT7RjVffwOKKz/ilT1QyEjXxtZDQhiqNh
         etuYi2pNprYaONmmiTIK3Fj3CjcNezTQLzM0TCZPKj+hrkCSqy/7LWla+zgdjILkUv+7
         Fteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=IoDocQpYuwpLRYJY/FIiI69rOYxL4wE2K95cNjtw3tI=;
        b=fD4FqVeoGOnmIOBeExaDgHao3dpxZbeuRV4xmR+CODlles66/2SKAcMuEj4otZxcBa
         8Qx1Tm4UdTNrAKj1/cTqdTWpPIdEB5n3Wnl9Ucr5sGjxi2lVHqiSNCfceV30Y3OdrTLP
         zG4l9zmdrCFPum9G7i2ounURyb6ooFTECbauJTk8JTNImXK/FK2z8fnRcaFgwBD/qzJO
         T+fe3GraGw0Xj2TvWKzrJgjinM0xBlkn/UkGuLsZJzgKtmVk62RRuOmDO/iQjqnSOfgc
         4eV85niR4tzJbZchXTSuUj8vw8zhGdqhpQwokQLm3b1P3oICtPWRsTo3SjY/arIbigQl
         jWXQ==
X-Gm-Message-State: AOAM532EOo0W83zwIZ4GsfXJPDW7SjeOw6Z/iv4vZkbX6hSIUjfhy4B9
	sIISTYHghF8aWG51eclaPP7bEXPOxKzrsVhy
X-Google-Smtp-Source: ABdhPJyG4CuhpiY8PytjVSB896JQ9u9tX4EriKvVuqKonbH5mrMr2DZBfBATJuXTMswth5ltuB7jXw==
X-Received: by 2002:a17:90b:4a52:: with SMTP id lb18mr6639075pjb.162.1631834986574;
        Thu, 16 Sep 2021 16:29:46 -0700 (PDT)
Return-Path: <akuster@mvista.com>
Received: from ?IPv6:2601:202:4180:a5c0:8e48:889d:1351:d2d2? ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id e13sm10314pfn.212.2021.09.16.16.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 16:29:45 -0700 (PDT)
Subject: Re: [meta-virtualization][PATCH] libvirt: Security fix for CVE-2021-3631
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Armin Kuster <akuster808@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20210916194711.759443-1-akuster808@gmail.com>
 <20210916221916.GC25504@gmail.com>
From: "Armin Kuster" <akuster@mvista.com>
Message-ID: <975e7f54-2386-4633-5e12-b52c83377ff3@mvista.com>
Date: Thu, 16 Sep 2021 16:29:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916221916.GC25504@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/16/21 3:19 PM, Bruce Ashfield wrote:
> Wind River had also submitted this, 
cool. just doing the master fix first policy, just want to ensure I was
covered for Dunfell in my workflow.

> so I grabbed that patch (since
> I was going in order), but I'll grab all your backported ones now.
thanks,
Armin
>
> Bruce
>
> In message: [meta-virtualization][PATCH] libvirt: Security fix for CVE-2021-3631
> on 16/09/2021 Armin Kuster wrote:
>
>> From: Armin Kuster <akuster@mvista.com>
>>
>> Source: https://libvirt.org/git/libvirt.git
>> MR: 112956
>> Type: Security Fix
>> Disposition: Backport from https://gitlab.com/libvirt/libvirt/-/commit/15073504dbb624d3f6c911e85557019d3620fdb2
>> ChangeID: 314727e329e5b1351326737eb9c9232f465db184
>> Description:
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  .../libvirt/libvirt/CVE-2021-3631.patch       | 56 +++++++++++++++++++
>>  recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
>>  2 files changed, 57 insertions(+)
>>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2021-3631.patch
>>
>> diff --git a/recipes-extended/libvirt/libvirt/CVE-2021-3631.patch b/recipes-extended/libvirt/libvirt/CVE-2021-3631.patch
>> new file mode 100644
>> index 0000000..c1fa8c2
>> --- /dev/null
>> +++ b/recipes-extended/libvirt/libvirt/CVE-2021-3631.patch
>> @@ -0,0 +1,56 @@
>> +From 15073504dbb624d3f6c911e85557019d3620fdb2 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
>> +Date: Mon, 28 Jun 2021 13:09:04 +0100
>> +Subject: [PATCH] security: fix SELinux label generation logic
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +A process can access a file if the set of MCS categories
>> +for the file is equal-to *or* a subset-of, the set of
>> +MCS categories for the process.
>> +
>> +If there are two VMs:
>> +
>> +  a) svirt_t:s0:c117
>> +  b) svirt_t:s0:c117,c720
>> +
>> +Then VM (b) is able to access files labelled for VM (a).
>> +
>> +IOW, we must discard case where the categories are equal
>> +because that is a subset of many other valid category pairs.
>> +
>> +Fixes: https://gitlab.com/libvirt/libvirt/-/issues/153
>> +CVE-2021-3631
>> +Reviewed-by: Peter Krempa <pkrempa@redhat.com>
>> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-3631
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + src/security/security_selinux.c | 10 +++++++++-
>> + 1 file changed, 9 insertions(+), 1 deletion(-)
>> +
>> +Index: libvirt-6.1.0/src/security/security_selinux.c
>> +===================================================================
>> +--- libvirt-6.1.0.orig/src/security/security_selinux.c
>> ++++ libvirt-6.1.0/src/security/security_selinux.c
>> +@@ -391,7 +391,15 @@ virSecuritySELinuxMCSFind(virSecurityMan
>> +         VIR_DEBUG("Try cat %s:c%d,c%d", sens, c1 + catMin, c2 + catMin);
>> + 
>> +         if (c1 == c2) {
>> +-            mcs = g_strdup_printf("%s:c%d", sens, catMin + c1);
>> ++            /*
>> ++             * A process can access a file if the set of MCS categories
>> ++             * for the file is equal-to *or* a subset-of, the set of
>> ++             * MCS categories for the process.
>> ++             *
>> ++             * IOW, we must discard case where the categories are equal
>> ++             * because that is a subset of other category pairs.
>> ++             */
>> ++            continue;
>> +         } else {
>> +             if (c1 > c2) {
>> +                 int t = c1;
>> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
>> index 9cf2951..7bc93ff 100644
>> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
>> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
>> @@ -29,6 +29,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>>             file://hook_support.py \
>>             file://gnutls-helper.py \
>>             file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
>> +           file://CVE-2021-3631.patch \
>>            "
>>  
>>  SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
>> -- 
>> 2.25.1
>>
>> 
>>

