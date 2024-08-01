Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362F5C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 17:08:19 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.73737.1722532092829837476
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 10:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLZVKlmH;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-447d6edc6b1so34045611cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 10:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722532092; x=1723136892; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PVNa6uWDL2iZU3d2+Xg/sh2EOtZ3rCVW8qXOeTUR8W8=;
        b=LLZVKlmHxVWgj/rx+Kbum5cvjE/DQ3/KanMxydrnP4f59rJMD7Sh8nqDpUFiHQhjs/
         qYMte0ihLo4+QntPaF6tnNbmQ6KOC9DlmVtgp3H/U3CWVwYCjJnKPVX9oGRxopqa13D+
         AGIqqXQdrrw/ntIm6JOQxmPKgGM79Gq1w4W54AV2Bowa96hRnrMl34MTMF3PYAEo9fYH
         manLqnq9iq2CFxXTIWkbilMosxropim4vqWj29tF5wFFg3zJ9uMCsdkdY2/U0AmFpzOw
         fojxt2qTr04tZeLn8eE7CgL3MJsIfZAxG6OKd0VNFSfW2JK+aZ2uSTnb/pgvNikEhUGq
         UsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722532092; x=1723136892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVNa6uWDL2iZU3d2+Xg/sh2EOtZ3rCVW8qXOeTUR8W8=;
        b=YpP1aGprl/FmW914pELuLPOLDw7BvNChmvszBVvEOdqb7VH5IrntYtozB00ZhXlka9
         j52XEC3CModiAfQqTKNRjJFvMj7U2AOgLtqPpGWbN4TihHc+LVs/5LzzYTV/gllcVikG
         YUdE/ttqpr08OEeeiMfGLJncBPQwkWzGkvxFhgsLF2vD7locjvmOrGWu3OT85qcxNeDk
         padyBSeivfJWg6xPTF7CA6ppM08NaDb9AAU8RAH4IdUV3BUmZQGjkJFviJi6kKXGcB9U
         JLPemCOx/XK4JOHMtXZTPpQJ9a+g9YhJHeg+cWUn66SrNGVl4v2OpbASP2evZcny3sc/
         acZA==
X-Gm-Message-State: AOJu0Yy0p5v5+FDGu72s2ScUA3QgtF7gVnI7JTFh9wrk2xlVoPw2ChDr
	/3bsgcE4WTPFLcHtoJL+O/UBWnqNSYFIBB0QaIjARbwrFeCOJ70pBKzyU63o
X-Google-Smtp-Source: AGHT+IFQKBWR5mnzzBBvMH8TYyPwEFUUcZRDSStzObGpOc90zFnAcUOYIJst4UFTSav2I9hD9GXn7A==
X-Received: by 2002:a05:622a:1787:b0:44f:cf26:3a54 with SMTP id d75a77b69052e-4518924044emr9067481cf.35.1722532091649;
        Thu, 01 Aug 2024 10:08:11 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4518a6c4dcbsm512651cf.31.2024.08.01.10.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:08:11 -0700 (PDT)
Date: Thu, 1 Aug 2024 17:08:09 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: pavel@zhukoff.net
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][RFC][PATCH] meta-virt-container.inc:
 Install shadow in read-only rootfs
Message-ID: <ZqvA+YJ25uoVcmvp@gmail.com>
References: <20240613085409.1860824-2-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613085409.1860824-2-pavel@zhukoff.net>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 17:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8855

In message: [meta-virtualization][RFC][PATCH] meta-virt-container.inc: Install shadow in read-only rootfs
on 13/06/2024 Pavel Zhukov via lists.yoctoproject.org wrote:

> Podman requires /etc/sub[g]uid for rootless mode but the file is being deleted
> if shadow is in ROOTFS_RO_UNNEEDED (even if different package like the
> podman itself provides it) and rpm backend is used.
> 
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  conf/distro/include/meta-virt-container.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/distro/include/meta-virt-container.inc b/conf/distro/include/meta-virt-container.inc
> index c3ac8394..7a8a9616 100644
> --- a/conf/distro/include/meta-virt-container.inc
> +++ b/conf/distro/include/meta-virt-container.inc
> @@ -38,3 +38,4 @@ VIRTUAL-RUNTIME_container_orchestration ??= "k3s"
>  
>  VIRTUAL-RUNTIME_cri ??= "virtual-containerd"
>  VIRTUAL-RUNTIME_cni ??= "cni"
> +ROOTFS_RO_UNNEEDED:remove = " shadow"

I've finally got enough of my recipe version uprevs working
to get back to this.

I haven't come up with anything that is much different than
your proposal for this, but I still think we can make it a
bit more virtualization "friendly" and something that could
be overriden if needed.

The easiest way would be to just assign to a variable first,
make that variable a weak assignent and if someone wants
to override the behaviour they could.

Or alternatively, we just initialize our variable by
the default one, and do the remove from that variable,
finally doing the assignment back to ROORFS_RO_UNNEEDED.

I thought about asking for an image feature test, but
since the variable is only used when readonly roofs is
in image features, that seems exessive.

We are covered on the virtualization disto feature front
by the core meta-virt checks, so also good for that.

Did you want to have a crack at those changes, or should
I have a go at them ?

Bruce


> -- 
> 2.44.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8796): https://lists.yoctoproject.org/g/meta-virtualization/message/8796
> Mute This Topic: https://lists.yoctoproject.org/mt/106648146/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


