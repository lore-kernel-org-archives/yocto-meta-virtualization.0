Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F35CC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 16:37:34 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web12.125.1667925450682039231
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 08:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MP5ZNY6a;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id p184so11863110iof.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Nov 2022 08:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f7RE/7oUhoIDxnMk7PuPyZvxaKCw2z5jaPlHFBNNW5k=;
        b=MP5ZNY6a8zS3Ww+eGZnlHxhuex+Z4iJOlr8JpVytpGlsp2aPqNxWA44KDKFkONiPsu
         FkNJdKodI5de0vzI5vKueVhp5D2wcq8Xc7c35ZtQoXpue5dzmVISWTiLQNLml/u4eLPN
         jQadmAXv3rBAJVKIUshRm+jom2DjTYmQJiFIyLJOPHHP5YWWfbVh+/WSm2zpU7AQj5I8
         5nPWyn0H59iHrytekzDZ8Uy0iwZpv1s2t31ixICi4xSuvMMr7qY2g2TpF7umEqQTCPry
         ZXI1xRRXLPrDZZZjSIaX80NV8bbd+CNQCyCTAJAujCbjcBM2r6+QJUxRslykKrIjhI6V
         XIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7RE/7oUhoIDxnMk7PuPyZvxaKCw2z5jaPlHFBNNW5k=;
        b=OmUQSZ22Wy5aHuN+0yT9KeSstFEiKbTex9xCBZT2iSSwlMjhdpUAKFmMO+ExxwmVUa
         oEQTS+n/9vus3WaxNQX/LBjXACOIqRoKquCiEUGNshwYtYAbj58rF242al1PPimnp+Em
         f3asJWuKCihJpE1uStvYtAn3O+dtQLvoGTlg39uA2HC4enM0Wygat9dCjCHNm3go5WJE
         XQtgUVuUvyyzxc7wIgFmVBH+HZJ+dJy9CyE2mUjrD/8XjTADI3t8tMC9y96B3iiltslu
         iGiuawrYhOuoE25P8pAouDGOgyo1CA/QSKN+x+XmkrU4BOVqyF7/poJMTWzrzyTiI40i
         fQtA==
X-Gm-Message-State: ACrzQf2JAqi4dt6JXW7s/zV05g8mlWW+G2e2rkuqThDeEBJhWdefLOYc
	WoZvShgclHYhE45S3rGtnw7qN7qbexVgkteF0Hfh3YYTygDe9g==
X-Google-Smtp-Source: AMsMyM6+VlwDwUMdnldL5JDX/vpiiD8DEHI1Mg4EBw46d2YCk9Hti7Jn4EFdhiCkIj3j9J3M1SKDGPPJ8AAmMCrbrtM=
X-Received: by 2002:a02:271c:0:b0:375:5e38:607a with SMTP id
 g28-20020a02271c000000b003755e38607amr27786638jaa.245.1667925449782; Tue, 08
 Nov 2022 08:37:29 -0800 (PST)
MIME-Version: 1.0
References: <2422477.irdbgypaU6@serenity>
In-Reply-To: <2422477.irdbgypaU6@serenity>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Nov 2022 11:37:18 -0500
Message-ID: <CADkTA4NDNN=gkkCz0DG1VMHSq_S_1su3jEUa1oYcWDM79PDGkQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Problems building an OCI container image
To: Guenther Meyer <g.meyer@signum-media.de>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Nov 2022 16:37:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7678

On Tue, Nov 8, 2022 at 10:45 AM Guenther Meyer <g.meyer@signum-media.de> wrote:
>
> Hi,
>
> I am trying to build some OCI-containers, but there are some things that are
> not really clear to me:
>
> Issue one: When I build my container image, these are the resulting files:
>
> example-container-qemux86-64.testdata.json -> example-container-
> qemux86-64-20221108152401.testdata.json
> example-container-qemux86-64-20221108152401.testdata.json
> example-container-qemux86-64.manifest -> example-container-
> qemux86-64-20221108152401.rootfs.manifest
> example-container-qemux86-64-20221108152401.rootfs.manifest
> example-container-qemux86-64.qemuboot.conf -> example-container-
> qemux86-64-20221108152401.qemuboot.conf
> example-container-qemux86-64-20221108152401.qemuboot.conf
> example-container-qemux86-64-20221108152401.rootfs.tar.bz2
> example-container-qemux86-64.tar.bz2 -> example-container-
> qemux86-64-20221108152401.rootfs.tar.bz2
> example-container-qemux86-64-20221108152401.rootfs-oci
> example-container-qemux86-64-20221108152401.rootfs-oci.tar
>
> So the question is, why are there only stable symlinks for some of the files
> and not for the rootfs-oci files? How can this be changed?

Some of those symlinks are done by core and the base image classes
(the manifests, etc). Artifacts related to the oci image class are the
responsibility of the image class itself. Those are the -oci- components
of deploy.

I recently tweaked the container image backends to make an additional
symlink, you can see those on the master-next branch of meta-virt.
Additional convenience links are possible, but would have to be requested,
so I can understand the use case and come up with a patch and test
for them.

>
>
> The second issue is the resulting tar-file. I thought, I could directly load it
> as an image, but that results in an error.
> Investigating the content of the archive, I found, that the necessary content
> like index.json, oci-layout ad blob/* is not on the root level but inside a
> subfolder "example-container-qemux86-64-20221108152401.rootfs-oci/".
>
> Is that intentional, if yes, why?
> Because when I create an archive with the same files on the root level, it can
> directly be used with podman or other tools.
>

This has been discussed on the list before, it is intentional. The tar file was
created to make handling the images a bit easier (since when i did the work,
the oci image class was just specifying directories). There are workflows and
use-cases that expect that format. I promised to think about how to handle
and support both use cases, and I haven't come up with an answer yet.

I'll get to that shortly (fingers crossed).

The primary use case for the oci images is that they are expected to be
manipulated with something with skopeo and copied/transformed in that
sort of workflow.

>
> Issue number three:
> Maybe this is not directly related, but I'm fairly new into this container
> stuff, so forgive me, if I'm wrong:
> If I want to use a predeployed image with k3s, what is the name of the image
> that I have to use in the deployment yaml? Is it just the filename or is it
> something else? If the latter, how do I set the image name during the build?

I've never done something predeployed (or at least what I think of in that
sense), but you can find a very simple example of a yaml file that I did for
a ELC presentation in the meta-virt layer itself
(recipes-demo/helloworld-flask/helloworld-flask)

Anything more complex is an exercise for whoever is developing the
application and working with their deployment. But if there are ways to
generate more of the yaml, or streamline things. I'm always interested
in discussing it.

Bruce

>
> Cheers,
> Guenther
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7677): https://lists.yoctoproject.org/g/meta-virtualization/message/7677
> Mute This Topic: https://lists.yoctoproject.org/mt/94892904/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

