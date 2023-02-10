Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429B6C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 14:29:56 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.16179.1676039394667805528
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 06:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SxAjLD4A;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id y7so1987349iob.6
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Feb 2023 06:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zOQBJk2vaLizT1T9+v7bY2haQ5VJmoAcMy+Z70Zl2vg=;
        b=SxAjLD4ABsj9/0E/FG7LV7lDXudagqcZpxSnoEGwfPV3uQfcIX1kpe8eDOhY+r/fs+
         Ies+iJVGrWCuGKKqvxy9JzteTRsuJQNc4oVJbxLZNd7da+Nx+CDL/SMHgycU6KDjNgTw
         8W3vbSfIG1kFUdP4JcqIUMzXZ/A4QncHBXrGlAFq1b03blMLparTKhPi3NywmF4i1EIs
         PrbyhmQz6d0hm5DaWXXziRfait1ZcuuBJQ9lMDYKnZ7BZIcReoO6XeA/aFBwYzVob904
         vyd6ZFCQwaWKwQPbDVP8KbJMqf9XITLkwZt8Svq1DtlabeCpGWSJzWeSZbexrxw0H2g2
         qdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOQBJk2vaLizT1T9+v7bY2haQ5VJmoAcMy+Z70Zl2vg=;
        b=jeuoYOBieQnxankJgRZGf8GwLgBk8zYavNTN3YXyJ/4OZ9uiNehGH2zSiHsb1UL6K9
         wUr60sfTo4JAgF2SKQBEyGJ0Mz6wPQxssFqav6hMb+T7c7xWDu851cJUoLvblOi7rGhJ
         wnXRgx9fgkITc0fsOvmJ7gELorpD9Vl7TubmKcie9zfKNW9rFnX2oLYJXDRpdEHKIcnZ
         Fgk+96v6dexv6fgFDg3Z3XTK+cmaDImhVUcLYyspyA0XOztrHOQidY3oWcjOfjBdOTrg
         my3ViVC4jot9p1QSeJacJKkdXmFrwEgwoYljoJ5SPG/0CoX4Rg34ru9KkTCHJ9+rTy0q
         GvxQ==
X-Gm-Message-State: AO0yUKUp3KUlJW/E31SPWnOZPzmL/Tn2zttpOZNPGqSGdIPxL7hrbENQ
	YV2nMsju3ay//mAYn2pyakBU/G0Mt9ieOVAoZLA=
X-Google-Smtp-Source: AK7set9C7Nks1wrjVHWui/nMcucclqRvX6qGN43QRCcf1FV0aKjp/yt3DV9jE03tvcUL09yMgxOu3J9uLo8Nei0pDu8=
X-Received: by 2002:a6b:e019:0:b0:717:58a7:a219 with SMTP id
 z25-20020a6be019000000b0071758a7a219mr7812380iog.24.1676039393815; Fri, 10
 Feb 2023 06:29:53 -0800 (PST)
MIME-Version: 1.0
References: <CAEFUPH1Yj9ZmOHRfuaHHcUmFPC+kvxb0ebM5pjFS7Dhr4iuaMA@mail.gmail.com>
In-Reply-To: <CAEFUPH1Yj9ZmOHRfuaHHcUmFPC+kvxb0ebM5pjFS7Dhr4iuaMA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Feb 2023 09:29:42 -0500
Message-ID: <CADkTA4PKZpAkN=vtAdEkjWr+udfSHEg7NfyeOKcj8qQz27+yww@mail.gmail.com>
Subject: Re: [meta-virtualization] query on container demo
To: SIMON BABY <simonkbaby@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Feb 2023 14:29:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7850

On Thu, Feb 9, 2023 at 2:02 PM SIMON BABY <simonkbaby@gmail.com> wrote:
>
> I was testing the meta-virtualization/recipes-demo/images/ app-container. I was able to build the container. But I am not sure where the image is created  and how we run the image using docker commands. I also see the .yaml files. Can you please help?
>

Those application containers are in the oci-image format. The yaml
files are sample kubernetes deploy instructions, so unless you are
using kubernetes, they won't be of any help.

As for the OCI image files, how you get them onto the target is image
and distro specific.

As of right now, we don't fully support (I have some work in progress
code that I expect to get into the tree for the upcoming release)
cross loading of containers. Mainly due to the need for root
permissions on the build host, and other issues with namespaces,
users, etc.

Some common ways to use the OCI images are by copying them to a
registry via skopeo (or whatever tool you want), or you can arrange to
have the containers installed into the image (via mulitconfig, or
rootfs post processing), and load them via podman/docker/etc, on the
first boot.

There are LOTS of different ways that you'll see the containers being
manipulated, most of them are very specific to the requirements of a
distro, or use some sort of workarounds to permissions issues.

Again, I'm trying to introduce a supported / standard way to cross
load our OCI generated containers, but that won't be ready for a bit
yet.

Bruce

> On the target I can see /usr/bin/flask-app.
>
>
>
> bitbake app-container
>
>
> The generated build foles are below.
>
>
>
> build/tmp/work/armv8a-poky-linux/helloworld-flask$ ls
>
> 0.1-r0
>
> /build/tmp/work/armv8a-poky-linux/helloworld-flask$ cd 0.1-r0/
>
> build/tmp/work/armv8a-poky-linux/helloworld-flask/0.1-r0$ ls -ll
>
> total 84
>
> -rw-r--r--  1 tdydev tdydev    65 Feb  7 11:58 configure.sstate
>
> drwxr-xr-x  3 tdydev tdydev  4096 Feb  7 12:10 deploy-debs
>
> drwxr-xr-x  2 tdydev tdydev  4096 Feb  7 11:38 deploy-source-date-epoch
>
> -rwxrwxr-x  1 tdydev tdydev   518 Feb  2 14:24 flask-app
>
> -rw-r--r--  1 tdydev tdydev   511 Feb  7 11:58 flask-app-service.yaml
>
> -rw-r--r--  1 tdydev tdydev   178 Feb  7 11:58 flask-app.yaml
>
> drwxr-xr-x  2 tdydev tdydev  4096 Feb  7 11:35 helloworld-flask-0.1
>
> drwxr-xr-x  4 tdydev tdydev  4096 Feb  7 11:58 image
>
> drwxr-xr-x  3 tdydev tdydev  4096 Feb  7 11:38 license-destdir
>
> drwxr-xr-x  4 tdydev tdydev  4096 Apr  5  2011 package
>
> drwxr-xr-x 10 tdydev tdydev  4096 Feb  7 12:10 packages-split
>
> drwxr-xr-x  7 tdydev tdydev  4096 Apr  5  2011 pkgdata
>
> drwxr-xr-x  7 tdydev tdydev  4096 Feb  7 11:58 pkgdata-pdata-input
>
> drwxr-xr-x  7 tdydev tdydev  4096 Feb  7 11:58 pkgdata-sysroot
>
> drwxrwxr-x  2 tdydev tdydev  4096 Feb  7 12:10 pseudo
>
> drwxr-xr-x  5 tdydev tdydev  4096 Feb  7 12:10 recipe-sysroot
>
> drwxr-xr-x  8 tdydev tdydev  4096 Feb  7 12:10 recipe-sysroot-native
>
> drwxr-xr-x  2 tdydev tdydev  4096 Feb  7 11:35 source-date-epoch
>
> drwxr-xr-x  2 tdydev tdydev 12288
>
>
> Regards
>
> Simon
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7849): https://lists.yoctoproject.org/g/meta-virtualization/message/7849
> Mute This Topic: https://lists.yoctoproject.org/mt/96860300/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

