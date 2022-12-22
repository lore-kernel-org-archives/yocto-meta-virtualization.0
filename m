Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057B4C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 15:33:32 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.48027.1671723210719679028
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 07:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=afcylnz6;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3cbdd6c00adso30974387b3.11
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Dec 2022 07:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWZ+XwEVCm+dhusnOpnZBNtHivnPiYBm0DStrQcihFE=;
        b=afcylnz6GTKS2fX3wEtOTBiQcH+q30FCYgi1mV/lCz1xkXW12ABOIiwSXaHfzRdtgn
         adbqOHMxKoMealpoLR5Zk2OkY52mbRUCzVrvBZ96kE8FCsBoVSimimaSFezBumexNKnZ
         FX8pO2QIwzqqtrCe+ulVytuYtbtxhYx27PTlilHQezI45jDWdm0owpZ6MFS+ghG3vUfp
         17+JIJ65UTl2avfTqaZOnOepDVam/803ZNMfv2PIXgcMfZu6B0Br6yqXuomMuTJNx6Hu
         gw5Ehaku0bvrIIqSBQVGbnolAm6huRm1E7L7Zs7L3qM1HtJcFh5S/Q1pT5r5019FMuoW
         bQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWZ+XwEVCm+dhusnOpnZBNtHivnPiYBm0DStrQcihFE=;
        b=o0rzNsFO4xlvGeIuXheeUivyxXD6ueV7o29NReEPT0nvmwGL4x7oQmOVqKHVHUY6sc
         R7ufo4ctFVyek4bK97FwYAu34r9lXn9GsNNwDw5HF67+MsBmjoaOF6Lh7aoIBTzPSbXi
         a77CpKGbGGIwc4Z4VxQo87Dqj0DxYAY0TdkApE4K9Lq3BUAM//GFau6Cy+qf23TzVuRe
         JkyK3JdQ4IHMw2dvBAikJXhxvR4C4FQV7VQVwMJOr7cEFP22I78CEn+IuPKRM+GxAktw
         LpvQZ55ITzrrIa5FK+JwHN0iUL2DdGwKWQMPJI4c7aPWfN8FMBoE7isxFOHmZRz49ou1
         fkGQ==
X-Gm-Message-State: AFqh2krbIY8osJMAvR30KV9GhNtv+p+YLh+5OoHl3ZzNWo/pp/anFgwO
	daLlPDWGHaJC4+jsEieFC+CDFjDFyaw=
X-Google-Smtp-Source: AMrXdXuKcBn/NiR3T6g7hhWM5rbRRoK/tN0CfxBE8q/mG7W7YQPE5DTfBDhCnLl8xmkAkkhb0cnhiQ==
X-Received: by 2002:a81:a212:0:b0:3b6:e8f9:255 with SMTP id w18-20020a81a212000000b003b6e8f90255mr5633567ywg.4.1671723209660;
        Thu, 22 Dec 2022 07:33:29 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id bl33-20020a05620a1aa100b006f474e6a715sm435722qkb.131.2022.12.22.07.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 07:33:29 -0800 (PST)
Date: Thu, 22 Dec 2022 10:33:27 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] criu: avoid textrel QA Issue warning
Message-ID: <20221222153325.GA42362@gmail.com>
References: <20221220022436.167085-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220022436.167085-1-xiangyu.chen@eng.windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Dec 2022 15:33:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7778

merged.

Bruce

In message: [meta-virtualization][PATCH] criu: avoid textrel QA Issue warning
on 20/12/2022 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Fix some of arch such as arm/aarch64 would report QA warning as below:
> WARNING: criu-3.17.1+gitAUTOINC+d46f40f4ff-r0 do_package_qa: QA Issue: criu: ELF binary /usr/sbin/criu has relocations in .text [textrel]
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 733e911..3d25aa2 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -66,6 +66,9 @@ PACKAGECONFIG[selinux] = ",,libselinux"
>  
>  CLEANBROKEN = "1"
>  
> +# WARNING: criu-3.17.1 do_package_qa: QA Issue: criu: ELF binary /usr/sbin/criu has relocations in .text [textrel]
> +INSANE_SKIP:${PN} += "textrel"
> +
>  do_compile:prepend() {
>      rm -rf ${S}/images/google/protobuf/descriptor.proto
>      ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/images/google/protobuf/descriptor.proto
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7775): https://lists.yoctoproject.org/g/meta-virtualization/message/7775
> Mute This Topic: https://lists.yoctoproject.org/mt/95779051/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


