Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3A8EB64DD
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 03:28:37 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.59545.1691810913818392375
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 20:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Z+2TQZf2;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6432a429f61so5639686d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Aug 2023 20:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691810913; x=1692415713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qaJWoCmUyhfdowd9lZ/dcQCLrc55lUbRg4zhphVSQjE=;
        b=Z+2TQZf2k3z4g4AdPgkU6sP24ydlsHLs8EvqSQ6fo6CI2jbKE37N7lT9wTTZkA7KyE
         NXoNwHEeWuhfa5VeZ2WzP5B1kMPyXIrXfR1jtAHcHq4iIQZSA2iJShY/e8B79D42A5B3
         C4E98rg5A8vIc6vL5w8qo8v5eDJbJbnT5p6yIU7Te/KnW+gBcHWBXuOhDa5KWLVswqUc
         GA4qwWA++KCdCXzALn6xPHqcf2i58WVhVJKrX3VLi3IgOcbBPvK0P81ho3pYsorTx179
         dll+YlVvlnHS5pxEPoh6KhXv0gepLp8TR0038Le+Eto2mq+AklQYksS1+yyVP3I0+mlG
         JEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691810913; x=1692415713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaJWoCmUyhfdowd9lZ/dcQCLrc55lUbRg4zhphVSQjE=;
        b=jccl7/V1StVNflgbHF38lUfQh/W1LQnIEfMdgPmsWI2ex95lfJfr2kUpnX9xYQ+vMP
         wOmdznfPxmPmQmZKBaE4h8fJixGXeaiqhFyttLXrStCSf+1dMWWZZq840d8L005DMAV2
         fZiGgPFJtOFa3MiBKLj6SQ6bLKbXtlH9/MwfT7ZuUKjR8UurEtdeh5J+dbGcoi97a3FE
         RzIuXAuALS4E73MPuGPfwAOW4nsjEz4zoz13FGyQPdAmVn+CMwkbbkbxz0OotG6YC/oB
         L2/icCnUKrTautugcRNa7D8gUTKCEeXe8WPDNXi0dygF8LZmnlBCM3jiYUAgr7EnNj/w
         6amA==
X-Gm-Message-State: AOJu0YyojkerFsLl8xdEZcK5UtOXEm1QDMkfpsYH/a8zSSiBGj21sqMY
	p5lrBuqkHvZLrW8Sqbd+hZBO/IWhHQxfXA==
X-Google-Smtp-Source: AGHT+IH7Z26VAPtzvRF3jnChwUxo+7AOe6U7i4Ii8ogdHMajN01kVo+PFHMX6XWwGivA1DiUffztRw==
X-Received: by 2002:a0c:aa9d:0:b0:63c:faba:5774 with SMTP id f29-20020a0caa9d000000b0063cfaba5774mr3100203qvb.5.1691810912742;
        Fri, 11 Aug 2023 20:28:32 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id z16-20020a0cda90000000b0063cf9478fddsm575068qvj.128.2023.08.11.20.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 20:28:32 -0700 (PDT)
Date: Sat, 12 Aug 2023 03:28:30 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [mickledore][PATCH] libvirt: fix
 CVE-2023-3750/CVE-2023-2700
Message-ID: <ZNb8XuSmNF3b1t+c@gmail.com>
References: <20230807064232.2816765-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230807064232.2816765-1-changqing.li@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 12 Aug 2023 03:28:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8176

merged.

Bruce

In message: [meta-virtualization] [mickledore][PATCH] libvirt: fix CVE-2023-3750/CVE-2023-2700
on 07/08/2023 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libvirt/libvirt/CVE-2023-2700.patch       | 54 +++++++++++++++++
>  .../libvirt/libvirt/CVE-2023-3750.patch       | 59 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_9.2.0.bb     |  2 +
>  3 files changed, 115 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2023-2700.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2023-3750.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2023-2700.patch b/recipes-extended/libvirt/libvirt/CVE-2023-2700.patch
> new file mode 100644
> index 00000000..4711b1be
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2023-2700.patch
> @@ -0,0 +1,54 @@
> +From 1fc978bc032f53b61d00271d620d7fe1a134efe3 Mon Sep 17 00:00:00 2001
> +From: Tim Shearer <TShearer@adva.com>
> +Date: Mon, 1 May 2023 13:15:48 +0000
> +Subject: [PATCH] virpci: Resolve leak in virPCIVirtualFunctionList cleanup
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Repeatedly querying an SR-IOV PCI device's capabilities exposes a
> +memory leak caused by a failure to free the virPCIVirtualFunction
> +array within the parent struct's g_autoptr cleanup.
> +
> +Valgrind output after getting a single interface's XML description
> +1000 times:
> +
> +==325982== 256,000 bytes in 1,000 blocks are definitely lost in loss record 2,634 of 2,635
> +==325982==    at 0x4C3C096: realloc (vg_replace_malloc.c:1437)
> +==325982==    by 0x59D952D: g_realloc (in /usr/lib64/libglib-2.0.so.0.5600.4)
> +==325982==    by 0x4EE1F52: virReallocN (viralloc.c:52)
> +==325982==    by 0x4EE1FB7: virExpandN (viralloc.c:78)
> +==325982==    by 0x4EE219A: virInsertElementInternal (viralloc.c:183)
> +==325982==    by 0x4EE23B2: virAppendElement (viralloc.c:288)
> +==325982==    by 0x4F65D85: virPCIGetVirtualFunctionsFull (virpci.c:2389)
> +==325982==    by 0x4F65753: virPCIGetVirtualFunctions (virpci.c:2256)
> +==325982==    by 0x505CB75: virNodeDeviceGetPCISRIOVCaps (node_device_conf.c:2969)
> +==325982==    by 0x505D181: virNodeDeviceGetPCIDynamicCaps (node_device_conf.c:3099)
> +==325982==    by 0x505BC4E: virNodeDeviceUpdateCaps (node_device_conf.c:2677)
> +==325982==    by 0x260FCBB2: nodeDeviceGetXMLDesc (node_device_driver.c:355)
> +
> +Signed-off-by: Tim Shearer <tshearer@adva.com>
> +Reviewed-by: J�n Tomko <jtomko@redhat.com>
> +
> +CVE: CVE-2023-2700
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/6425a311b8ad19d6f9c0b315bf1d722551ea3585#874a1e768ade6ceb4538931cbc06248e73223306]
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/util/virpci.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/util/virpci.c b/src/util/virpci.c
> +index 7800966..a44f70f 100644
> +--- a/src/util/virpci.c
> ++++ b/src/util/virpci.c
> +@@ -2253,6 +2253,7 @@ virPCIVirtualFunctionListFree(virPCIVirtualFunctionList *list)
> +         g_free(list->functions[i].ifname);
> +     }
> + 
> ++    g_free(list->functions);
> +     g_free(list);
> + }
> + 
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2023-3750.patch b/recipes-extended/libvirt/libvirt/CVE-2023-3750.patch
> new file mode 100644
> index 00000000..13ead87b
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2023-3750.patch
> @@ -0,0 +1,59 @@
> +From 3fe8b15323a4666564c519f32fd4ab072c472051 Mon Sep 17 00:00:00 2001
> +From: Peter Krempa <pkrempa@redhat.com>
> +Date: Thu, 13 Jul 2023 16:16:37 +0200
> +Subject: [PATCH] storage: Fix returning of locked objects from
> + 'virStoragePoolObjListSearch'
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE-2023-3750
> +
> +'virStoragePoolObjListSearch' explicitly documents that it's returning
> +a pointer to a locked and ref'd pool that maches the lookup function.
> +
> +This was not the case as in commit 0c4b391e2a9 (released in
> +libvirt-8.3.0) the code was accidentally converted to use 'VIR_LOCK_GUARD'
> +which auto-unlocked it when leaving the scope, even when the code was
> +originally "leaking" the lock.
> +
> +Revert the corresponding conversion and add a comment that this function
> +is intentionally leaking a locked object.
> +
> +Fixes: 0c4b391e2a9
> +Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2221851
> +Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> +Reviewed-by: J�n Tomko <jtomko@redhat.com>
> +
> +CVE: CVE-2023-3750
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/9a47442366fcf8a7b6d7422016d7bbb6764a1098]
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/conf/virstorageobj.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/conf/virstorageobj.c b/src/conf/virstorageobj.c
> +index 7010e97..59fa5da 100644
> +--- a/src/conf/virstorageobj.c
> ++++ b/src/conf/virstorageobj.c
> +@@ -454,11 +454,16 @@ virStoragePoolObjListSearchCb(const void *payload,
> +     virStoragePoolObj *obj = (virStoragePoolObj *) payload;
> +     struct _virStoragePoolObjListSearchData *data =
> +         (struct _virStoragePoolObjListSearchData *)opaque;
> +-    VIR_LOCK_GUARD lock = virObjectLockGuard(obj);
> + 
> ++    virObjectLock(obj);
> ++
> ++    /* If we find the matching pool object we must return while the object is
> ++     * locked as the caller wants to return a locked object. */
> +     if (data->searcher(obj, data->opaque))
> +         return 1;
> + 
> ++    virObjectUnlock(obj);
> ++
> +     return 0;
> + }
> + 
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended/libvirt/libvirt_9.2.0.bb
> index 5e704704..9f97aa11 100644
> --- a/recipes-extended/libvirt/libvirt_9.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_9.2.0.bb
> @@ -30,6 +30,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://gnutls-helper.py \
>             file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
>             file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
> +           file://CVE-2023-3750.patch \
> +           file://CVE-2023-2700.patch \
>            "
>  
>  SRC_URI[libvirt.sha256sum] = "a07f501e99093ac1374888312be32182e799de17407ed7547d0e469fae8188c5"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8166): https://lists.yoctoproject.org/g/meta-virtualization/message/8166
> Mute This Topic: https://lists.yoctoproject.org/mt/100595000/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


