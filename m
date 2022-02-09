Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1B0C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 18:52:10 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.31188.1644432728675687152
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 10:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q4ycs8Ie;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id cz16so7008916edb.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 10:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mOoLOK4UDfl0fAGaAoAKtswGMYPSBQOkunH2Iw18Nc4=;
        b=q4ycs8IexBLF64QkLQ7FDKXQgNFq5N3zbWlJ0b+ZBZc2aZHSKz2pdXTFhf47lGGVRN
         3GOPJ5TUqmQVKX7EsYwOzbN39ZhQW3HWif85yYTwCWkOH1f5GTSNkVTRgDOh/7BxXWkh
         GXDz2mtBcUE9ImREMDVOHUV9FAQcN5SR2fHLQn8jIByD76YKVf7BQi6RhcYnn6nzd1q5
         ZFxl6CCbNdxh7CQYsjVcwPAd59NlcRxvgspMo81oBa5lXhu4QFyJjf7mI6pFXaBn1Zu0
         R3DP+qcIfN9Et0ugsWB6R+sCAyw62HRDdVbtjvoHvGzgG15CtubUW07ZawXFjvwWst/k
         Gm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mOoLOK4UDfl0fAGaAoAKtswGMYPSBQOkunH2Iw18Nc4=;
        b=zhVDxs83+LyOwRCTlF61vWq92/WtxGKRNnsK1ojgrIjFb4jy4dMjUHmx5QuGBmzAC8
         LWychdyw6QGdxX6iqkHKIH3GaTpClCvGy7CfAIC9BQL96GRkRiVOwBf0IHP9Txq8cQdx
         V08RmwP0/XH4jST93OjxynFvjm8ghhRNNDsMbmNSzJNN73FBOkkf46ZXTzLYQYdmGN2q
         3NdRZak5ooUwl45RVQxSM8XQEaxrrUWmq+Pg6YXS+GiPOk2qPWBxS0cxBc9MXHds/HCw
         jPKEZp13yagWTpZ9O8ENVmeGWiIL16oUnJcry8JcrcRU4Mtj0sG/P1z2gD4I97f9SXOT
         uuag==
X-Gm-Message-State: AOAM533LCecZj7MiaAU3mwL9JrSlqKppDngfdoqLntMJwV80XLiuCuFf
	s9IsPRAOYCi0/MW8/F1syxfuKoQlx9aXcAcd8GdJkpLf2tk=
X-Google-Smtp-Source: 
 ABdhPJxo7zFGzEcfJB1y07AIQ//pukH9FyvN7Xixiwk8P+v7aaXnOg2FdDi4+hkL4z0itQ1Urk/9vEZ47x+ELIJAHMg=
X-Received: by 2002:aa7:c418:: with SMTP id j24mr4149991edq.451.1644432727072;
 Wed, 09 Feb 2022 10:52:07 -0800 (PST)
MIME-Version: 1.0
References: <ce2da674-576d-a0b1-d2ab-cd872b7b17aa@berginkonsult.se>
In-Reply-To: <ce2da674-576d-a0b1-d2ab-cd872b7b17aa@berginkonsult.se>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 Feb 2022 13:51:56 -0500
Message-ID: 
 <CADkTA4NgQ2nUGGs9CW2va8ehWseaRTo-Dz0WFH2_f=1xdDQcug@mail.gmail.com>
Subject: Re: [meta-virtualization] OCI images in yocto image
To: Peter Bergin <peter@berginkonsult.se>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Feb 2022 18:52:10 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7057

On Wed, Feb 9, 2022 at 1:29 PM Peter Bergin <peter@berginkonsult.se> wrote:
>
> Hi,
>
> I'm exploring the world of containers combined with Yocto. I can build a
> container image and bundle that one with my rootfs image. The container
> image is stored in the rootfs as a tar-file of a OCI image spec with the
> content blobs, index.json and oci-layout. As per the description in
> classes/image-oci.bbclass the way to run the container is to unpack the
> file and the create the OCI runtime bundle and start it with runc.
>
> I have played around with docker and tried to import OCI image directly
> in to docker store but have not succeeded. Anyone that knows if it is
> possible? 'docker image import <oci-image>.tar does not give any errors
> and the image shows up in 'docker images' but does not import the
> correct rootfs.

There's no viable way to do this on the build side, and then have it appear
in the image. I've experimented several times with this, and haven't found
a decent solution. Running docker on the build host is a non-starter, which
rules out many options.

There's more options if you use podman versus docker for the container
runtime, but I also haven't had time to finish anything there yet.

To get the OCI images into docker, I bounce them through a registry and
use docker pull. You can see the logs of that process in several of my
yocto summit presentations.

>
> When creating the OCI image in image-oci.bbclass the process starts with
> a bundle that is packaged as an image and compressed to a tar-file.
> Given the above the whole process needs to be reverted on target to
> start a container from that image. It should then be possible to just
> install the bundle directly on target rootfs that directly can be
> started with runc. Are there any drawbacks with this? I can see that a
> tar-file is easier to distribute and install afterwards but my question
> related to directly integrating an OCI-image to a Yocto rootfs-image.

Nope, there's no drawbacks. The tar is just a convenience for moving
the bundles around. It isn't an official OCI image format, just the unbundled
directory format (it is just a bit odd compared to other image formats, which
tend to be single files, so I created the tar step to be similar to them).

You can definitely copy the OCI image directory onto the image, and have
it be immediately runnable via runc. There's no common/defacto service
to start the images on boot, but that's a fairly trivial thing to do with your
init system of choice. (having a service to start those images on boot
is on my TODO list, but I'm still tangled up with package uprev and golang,
so I haven't gotten to it yet).

Bruce

>
> Best regards,
>
> /Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7056): https://lists.yoctoproject.org/g/meta-virtualization/message/7056
> Mute This Topic: https://lists.yoctoproject.org/mt/89028209/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

