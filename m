Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD79CC4321E
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:12:53 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web12.179.1650647062720819756
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 10:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GugjJeZ4;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id g6so3226162uaw.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GW9UJk8qJ3LyYOjlt246o52qQLxHpB8YluoqruNcFiI=;
        b=GugjJeZ45lkY/BcwbZSBn5KOOJ/VJOaT3yUBv6+TjfLnK1bc0gJnUyuANbZMker+4u
         YeeOuuMErMy6r2xTk0KKeKh94kmmoPISrdRBfXq/p5lPu2nSDq/dFEw190k2nYi+g5AN
         YyGsbUTnaPW9ugBCT3tXG2me+bydJfWhOehNPof8J/RW0fpVfyMCtoq5ihVDgAJ1JkZJ
         3CklQWkGUfQ1liGCwosXl5lImK0FZk2YDB5M9rWNaV4K01Yoezv/G4d0bMljD8N4LOFk
         wzgzyF/P+MmEBqHWpU+3WyPOVJK8zlAMRWABVoP057MRHJgl9iqunyc3z4hlPJK5qaxi
         MOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GW9UJk8qJ3LyYOjlt246o52qQLxHpB8YluoqruNcFiI=;
        b=GujgCA3E3Hyr075L9tCzoWr092rF8XylGa/7nanXxzH0Zs1c3oyTr50QV0tMmWXp5A
         2Qzdx5tlcqMHYYKEhDjEML/Jf9MiV0ImAA6Ytg8oO+eNxkeM8gnM56whW+gd0122NGkM
         OT5X6nChFHLiGkXMWvA0SERT2sNbF5fVQgMO2GqPn+UVAba/DTIy5kFd9M5EaIt4K9l9
         gVkltD1jNYLeYQmivt7b8Z3I/7BeW7VBAm4ypV5KGrmbACyzrDgabydcI7kiBVIEuZDI
         fxKobPyxIwrprxNLGdZMtzlZnznpeia1PlV42dKpTnInjzBbEqZO6viqF+iA0xwEjgru
         GJJg==
X-Gm-Message-State: AOAM532UNO08ojXjS8jHaVus88XguaRJvW5alS40o2gHjFOdTeBgsr5h
	ZCHLJYh+2lJ6G5MaiPvQygD1Q8nEQttY9a30rNM=
X-Google-Smtp-Source: 
 ABdhPJwdZRvK/WLagyn/Cnjp5v/ePuI6u1pkyZhgr+pg/Rr8BuPyoDseIgrY2eTwYDXLN15Hzf51hbo53mhgHvgxxZQ=
X-Received: by 2002:a9f:23c3:0:b0:35f:f7c8:2f22 with SMTP id
 61-20020a9f23c3000000b0035ff7c82f22mr2094092uao.3.1650647061748; Fri, 22 Apr
 2022 10:04:21 -0700 (PDT)
MIME-Version: 1.0
References: 
 <bba589c4be43035a5b84d5d470a0d62c2f14cd83.1650644264.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <bba589c4be43035a5b84d5d470a0d62c2f14cd83.1650644264.git.bertrand.marquis@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 22 Apr 2022 10:04:10 -0700
Message-ID: 
 <CACMJ4GYvNBxnHZ8zSc4uOpFZVnEq+ovJAR8bh9E6g9XZpu-JyQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Add missing space in append to
 IMAGE_INSTALL
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Apr 2022 19:12:53 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7212

On Fri, Apr 22, 2022 at 9:19 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add a space before doing an append in IMAGE_INSTALL on x86.
> This is solving issues happening if someone is using IMAGE_INSTALL in
> local.conf to add things to the generated image.

Thanks, Bertrand.

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher

> ---
>  recipes-extended/images/xen-image-minimal.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index f6fa5ed..3cf4230 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -21,8 +21,8 @@ IMAGE_INSTALL += " \
>  do_build[depends] += "xen:do_deploy"
>
>  # Networking for HVM-mode guests (x86/64 only) requires the tun kernel module
> -IMAGE_INSTALL:append:x86    = "kernel-module-tun"
> -IMAGE_INSTALL:append:x86-64 = "kernel-module-tun"
> +IMAGE_INSTALL:append:x86    = " kernel-module-tun"
> +IMAGE_INSTALL:append:x86-64 = " kernel-module-tun"
>
>  # Linux kernel option CONFIG_XEN_PCIDEV_BACKEND depends on X86
>  XEN_PCIBACK_MODULE = ""
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7211): https://lists.yoctoproject.org/g/meta-virtualization/message/7211
> Mute This Topic: https://lists.yoctoproject.org/mt/90631753/3619036
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [christopher.w.clark+meta-virt@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

