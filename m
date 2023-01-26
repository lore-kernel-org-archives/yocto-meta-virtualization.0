Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F04CC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 19:00:45 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.82946.1674759635239090511
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 11:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JWW5JrRw;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id z2so594645ilq.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jan 2023 11:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u9h5943OZN3AM9HDMvTSlSkZ2K05+hIgSHuDzoInClY=;
        b=JWW5JrRwltL71bTOVccHvVYhX3M5maSb2JDWGwvqWo2zTzNqNMiOVoeZu07WzzaliB
         Y/tQcmOaB+0oBUArA8AD2ctIR7b37JqGNbCc4zRxPEJvRjO3O0fni5qGHRk1QFmFYU31
         rmoHwbkoCT6v5DuRZaPInjXZ87CmiVf8qAbCMgAQYKLcdh7yoSBVceFkx01K3fcGKwj9
         8XmiUDpbniz18KVr/Edvc8gFUUvbulfNOomKrajX6WbPSFntr7zUrQPspvA5dWl0aFgh
         RAoUVjRwBlrFc6Zk6GvpK03oIHPkRa9cFsshfnA+NKgIh9ye7kbayu5u7PyOsEnAlEJQ
         7IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9h5943OZN3AM9HDMvTSlSkZ2K05+hIgSHuDzoInClY=;
        b=FZdr1P954mTsBecSRAE/Q3fzakxXrEW3YaTBi/3i/+t+UmizvDKx7GxSEgNGjiTVgp
         efdKzTlXXea3OvexJEXH5nbnU1FjwBoVnmW/jX6stzVZ4EiQRQZPyxEqlxHCBXCDT1Qw
         cRdesHmqUXoFD5xkNOLm5oXq8YG+laM55VxXE7+Om9sZ8b3hguiy4mdP5FJn5V3jJDR6
         X5Qjfu6vzbRrszSYLUKpcI1hTPzqiWgHbDbbhkK2s3+3sI905/3kstAVApsM9uul1CBE
         5dXegrDbt6ilfYeJSCUdRj0Xb4YZKMzVabfVcTPmIaokzz0iatOMY6Ipd6/LHAsXz/UW
         iQLw==
X-Gm-Message-State: AO0yUKUdcYJOpyvUmjVISLgcahOEnlY8K3ymaZOJFXvO1fKwACDZKJ8t
	jneSBv61TVzte8r9BgJSpgbFh6+1p7Bvh0SO8zQ=
X-Google-Smtp-Source: AK7set/dwQXOakII+d+Eq32homQX/sZY20vL6YyFkiaVtntKDdYTcWdY9Zhgl+1aj5G0Ub52P2YjI9U+E5T1aswzOyE=
X-Received: by 2002:a92:ce0d:0:b0:310:9a82:c52b with SMTP id
 b13-20020a92ce0d000000b003109a82c52bmr1112140ilo.193.1674759634571; Thu, 26
 Jan 2023 11:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20230126184146.881118-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230126184146.881118-1-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Jan 2023 14:00:23 -0500
Message-ID: <CADkTA4N-s2xE_VDrbaYKbvUeLhRbAa3gWCLFvLbNo8RtD8VpFA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] containerd-opencontainers: fix
 Upstream-Status format
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jan 2023 19:00:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7835

I'll take theses sorts of patches ... but as I was pretty clear on the
OE core thread, I consider these noise and am not enthusiastic about
them.

Bruce

On Thu, Jan 26, 2023 at 1:41 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...1-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
> index 0ef0d38..32da401 100644
> --- a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
> +++ b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
> @@ -12,7 +12,7 @@ packages, we end up with errors like:
>           recipe-sysroot-native/usr/lib/aarch64-poky-linux/go/pkg/tool/linux_amd64/link:
>           cannot open file : open : no such file or directory
>
> -Upstream-Status: Inappropriate: specific to OE go configuration and build
> +Upstream-Status: Inappropriate [specific to OE go configuration and build]
>
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>  ---
> --
> 2.39.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7834): https://lists.yoctoproject.org/g/meta-virtualization/message/7834
> Mute This Topic: https://lists.yoctoproject.org/mt/96549642/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

