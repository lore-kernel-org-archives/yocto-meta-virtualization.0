Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72469C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 20:45:03 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web11.57299.1674161093079719634
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 12:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zu9tLaVC;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id j185so3489006vsc.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 12:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvqdZNdxHzy2E3jlQWWw8oFqmOu/wQfJ6APGwVG/P1k=;
        b=Zu9tLaVCXQwbkwsyZaLTl9H3lO4Y8BGVOSKr6dGs3ttxWrjha1FNOiR9dGyBAocoiJ
         1aHHJLXrOp+EzDeozDoE/gD4Ea3fFOgXjcQ/FZHsI1Db1MoNHMjlAFGbez4Ko8h/xiDG
         YeBwoEXl6UNO29DUbiQet6X/yz8yK3ZCB7RTbdMAUyd+oUTvbhXlOSrDLw5UogrLqTE0
         tO7fFjbFVYeo5s343c1+1Ab7+LcTPjO0nLf3nujAVdU3Y5Xus7yeKFeIN2qnyM6p5pUE
         rrWkauzFPpyoAYRe71VijAUmGXoIw4m55lXZ9g+VTiLVn89pJN31T7ReQd4Dw8UYNC86
         qMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvqdZNdxHzy2E3jlQWWw8oFqmOu/wQfJ6APGwVG/P1k=;
        b=hqupmgrCa5RbWzPq8MbsHTHao2HXXJD4Fcg778NijHNMsuKu5yA1NxzsyKuiKeKMyr
         szkZugHwIj5pNPR7E4Kvj4n3z7vSjKswJyNoG9AgI56n/ZPSM6W21FvFMt8Ot9Xo0v11
         f++d/KCThzWIAvkMk/2c6w13j74IL5ztuMcEky2naVQhmEuLVjL5qsCZwAouqqrGL3rY
         ttvAogaije6sfNNy6BjDFluuoQ3wmHrUkYcZr7XnhLz/jRhys5CovdqT5sne/5NsaMDE
         Nybk5j1T82LQBFucqTQ3/7ee0v/aIO5Hkp0s/Mwzj4bWraie+eoFr48PKUJpp8kgTCc0
         RNhA==
X-Gm-Message-State: AFqh2ko+UtVNGzyNR8OlNNzzZJoc77E6LoOagGCyq5HN9/BooXIQEBdY
	n+J4796HH8KU0r4VPxnt2ToMhres76dMFw==
X-Google-Smtp-Source: AMrXdXuDxNZkSYwl5dVOtzU008vtu81MfdfV7JCFyowpIANKsMqjDWBiv88kVu0omKuhpt2B+1qhuA==
X-Received: by 2002:a67:c21c:0:b0:3d0:b4e7:c2d2 with SMTP id i28-20020a67c21c000000b003d0b4e7c2d2mr9128698vsj.18.1674161092114;
        Thu, 19 Jan 2023 12:44:52 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id az20-20020a05620a171400b007091068cff1sm92435qkb.28.2023.01.19.12.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 12:44:51 -0800 (PST)
Date: Thu, 19 Jan 2023 15:44:50 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: fix soruce code comments
 contain build folder path cause QA Issue warning
Message-ID: <Y8mrwrQr7+TsVnVC@gmail.com>
References: <20230118054242.2619152-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118054242.2619152-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7824

merged.

Bruce

In message: [meta-virtualization][PATCH] libvirt: fix soruce code comments contain build folder path cause QA Issue warning
on 18/01/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> gendispatch.pl add build dir in code comments which was generated
> by itself. those build dir information would cause yocto qa report
> warnings like:
> 
> WARNING: libvirt-8.1.0-r0 do_package_qa: QA Issue:
> File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheckqemu.h in package libvirt-src contains reference to TMPDIR
> File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapichecklxc.h in package libvirt-src contains reference to TMPDIR
> File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheckqemu.c in package libvirt-src contains reference to TMPDIR
> File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapichecklxc.c in package libvirt-src contains reference to TMPDIR
> File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheck.h in package libvirt-src contains reference to TMPDIR
> File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheck.c in package libvirt-src contains reference to TMPDIR [buildpaths]
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...tch.pl-generating-build-path-in-code.patch | 54 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_8.1.0.bb     |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0001-prevent-gendispatch.pl-generating-build-path-in-code.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/0001-prevent-gendispatch.pl-generating-build-path-in-code.patch b/recipes-extended/libvirt/libvirt/0001-prevent-gendispatch.pl-generating-build-path-in-code.patch
> new file mode 100644
> index 0000000..5a909b4
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-prevent-gendispatch.pl-generating-build-path-in-code.patch
> @@ -0,0 +1,54 @@
> +From ba915b13b92f3a625633ede43789c1ba780371af Mon Sep 17 00:00:00 2001
> +From: Xiangyu Chen <xiangyu.chen@windriver.com>
> +Date: Wed, 18 Jan 2023 03:19:07 +0000
> +Subject: [PATCH] prevent gendispatch.pl generating build path in code comments
> +
> +gendispatch.pl will add build dir in code comments which was generated
> +by itself. those build dir information would cause yocto qa report
> +warnings like:
> +
> +WARNING: libvirt-8.1.0-r0 do_package_qa: 
> +QA Issue: File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheckqemu.h in package libvirt-src contains reference to TMPDIR
> +File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapichecklxc.h in package libvirt-src contains reference to TMPDIR
> +File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheckqemu.c in package libvirt-src contains reference to TMPDIR
> +File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapichecklxc.c in package libvirt-src contains reference to TMPDIR
> +File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheck.h in package libvirt-src contains reference to TMPDIR
> +File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheck.c in package libvirt-src contains reference to TMPDIR [buildpaths]
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + src/rpc/gendispatch.pl | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/rpc/gendispatch.pl b/src/rpc/gendispatch.pl
> +index 9f5bf0e..c73a9dd 100755
> +--- a/src/rpc/gendispatch.pl
> ++++ b/src/rpc/gendispatch.pl
> +@@ -449,19 +449,19 @@ sub hyper_to_long
> + 
> + if ($mode eq "aclsym") {
> +     print <<__EOF__;
> +-# Automatically generated from $protocol by gendispatch.pl.
> ++# Automatically generated by gendispatch.pl.
> + # Do not edit this file.  Any changes you make will be lost.
> + __EOF__
> + } elsif ($mode eq "aclapi") {
> +     print <<__EOF__;
> + <!--
> +-  -  Automatically generated from $protocol by gendispatch.pl.
> ++  -  Automatically generated by gendispatch.pl.
> +   -  Do not edit this file.  Any changes you make will be lost.
> +   -->
> + __EOF__
> + } else {
> +     print <<__EOF__;
> +-/* Automatically generated from $protocol by gendispatch.pl.
> ++/* Automatically generated by gendispatch.pl.
> +  * Do not edit this file.  Any changes you make will be lost.
> +  */
> + __EOF__
> +-- 
> +2.33.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index 1de2988..0ffd510 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -29,6 +29,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://hook_support.py \
>             file://gnutls-helper.py \
>             file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
> +           file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
>            "
>  
>  SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7817): https://lists.yoctoproject.org/g/meta-virtualization/message/7817
> Mute This Topic: https://lists.yoctoproject.org/mt/96348672/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


