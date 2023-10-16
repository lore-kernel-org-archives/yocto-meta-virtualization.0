Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7C5CDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 18:04:52 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.134444.1697479490371230872
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 11:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KWIIf71i;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-79fe6da0049so195000239f.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 11:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697479489; x=1698084289; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKDWujVyzqAhwT2MedqGJGmOO5BircNFksBwztrZkbA=;
        b=KWIIf71i8OIBRLF/fJTpBWm1D68eYFYL/9dwWOp0Ag+H2/mg1JfoieYo8NvI482KBL
         2MF2bl+kXtY8WpBwSoCGnSrMdDM90UPvOBZoWpB/hEmBCoT4kszeO4lQ0RI2k+trUku5
         IN91rbFD4QGufP/k5JOChxB4zKlGzbBk7tmlBj88wmRy0XMCYcrrzNoDTDJctFINkV7s
         Sh2mSXj+JOzyfjnULVxzGHq7uML9nakZekDGzraebjSppUemY6jNAFn1x8tguq+B+xLL
         ly+qRCH+Gzi9ta0C6m2AEku9SmhJeVLZniyS4e+y4GfisXmShrtjlfTUOKEIaMzovaXN
         qLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697479489; x=1698084289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKDWujVyzqAhwT2MedqGJGmOO5BircNFksBwztrZkbA=;
        b=Z23NrmVXTGdmAHGBVOu9MyQqKH4aXVVihPHhWa+EItMAocUzMvobvJx50ukppt4dha
         c7Y87iuhNj0cGsG+0xKLDO/0bzBRX2UCcz8/CZ7cd1Y5b600EE0AvjcEbJHH40NWr5Ry
         1sJrvU348z0+7Y3lqoVCK4e+G9iHjQJo1KPQqxafd2GPcVBN2w3DRbmwmn0qfTUP5LzS
         goAIsqanHFCARFp/AYSo1YfgcPFyfg2/Mbb4am7epHWVE7K2qx6PZamW8wLTrlTKlBRE
         I7kp0dmoBE9cH0waeaj6JdWE5qWMx1fRgnQEXyHwjB5iWJIxlKQcNIRbHj3JFH8gRo6i
         lopA==
X-Gm-Message-State: AOJu0YwSrpxgv1mAxbG/RbucyDCrYzB84helO1KiqFVsNo6C1CjQ3S/G
	Do36n30R86d4wBCAadClEos4doRWyVNkSbGwMqM=
X-Google-Smtp-Source: AGHT+IEthCP2Y+mzQ45k3p85Nmk4WPQ6GlLl0OlnCbLuYUzDPtTjZ+IVWP8PtGCrWGBRHR8YwJYHir+d02C7RqEsPX0=
X-Received: by 2002:a5d:9903:0:b0:79a:b667:4e97 with SMTP id
 x3-20020a5d9903000000b0079ab6674e97mr37385459iol.0.1697479489517; Mon, 16 Oct
 2023 11:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231004145433.3544915-1-JPEWhacker@gmail.com>
In-Reply-To: <20231004145433.3544915-1-JPEWhacker@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2023 14:04:52 -0400
Message-ID: <CADkTA4NcZv6uw=KDGcpUObSYbYnz1qOkCPE5irZQnuZBzALyvw@mail.gmail.com>
Subject: Re: [meta-virtualization][RFC] image-oci-umoci: Set image name and tag
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 18:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8368

On Wed, Oct 4, 2023 at 10:54=E2=80=AFAM Joshua Watt <JPEWhacker@gmail.com> =
wrote:
>
> umoci treats the --image parameter as <DIRECTORY>:<NAME>, where the OCI
> spec ref.name for the image it set to <NAME>. Therefore, if the
> intention is for the ref.name to be in the format <IMAGE_NAME>:<TAG> (as
> is expected by e.g. `podman load`, then the complete argument that is
> passed to umoci must be `--image <DIRECTORY>:<IMAGE_NAME>:<TAG>`

This is going to take a few iterations as well, the changing spec
and umoci uses have made this a non-trivial area to modify.

I assume you are talking about the oci ref.name annotation ?

>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/image-oci-umoci.inc | 52 +++++++++++++++++++------------------
>  1 file changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index 58e4668..a58cb4c 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -35,14 +35,16 @@ IMAGE_CMD:oci() {
>      fi
>
>      if [ -z "${OCI_IMAGE_TAG}" ]; then
> -       OCI_IMAGE_TAG=3D"initial-tag"
> -    fi
> +       image_spec=3D"$image_name:${IMAGE_BASENAME}:initial-tag"
> +    else
> +       image_spec=3D"$image_name:${IMAGE_BASENAME}:${OCI_IMAGE_TAG}"

I'm not seeing any examples in the umoci documentation that shows
a "triplet" of values for the image.

It is always image-path[:image-tag] in what I've read and see in the source=
.

Are you saying that what is written into th oci spec json file should be
different ? and that encoding what you want in the image-path portion
of the umoci --image parameter makes it pass through correctly ?

Bruce

> +   fi
>
>      if [ -n "$new_image" ]; then
>         bbdebug 1 "OCI: umoci init --layout $image_name"
>         umoci init --layout $image_name
> -       umoci new --image $image_name:${OCI_IMAGE_TAG}
> -       umoci unpack --rootless --image $image_name:${OCI_IMAGE_TAG} $ima=
ge_bundle_name
> +       umoci new --image $image_spec
> +       umoci unpack --rootless --image $image_spec $image_bundle_name
>      else
>         # todo: create a different tag, after checking if the passed one =
exists
>         true
> @@ -52,58 +54,58 @@ IMAGE_CMD:oci() {
>      bbdebug 1 "OCI: cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs/"
>      cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
>
> -    bbdebug 1 "OCI: umoci repack --image $image_name:${OCI_IMAGE_TAG} $i=
mage_bundle_name"
> -    umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name
> +    bbdebug 1 "OCI: umoci repack --image $image_spec $image_bundle_name"
> +    umoci repack --image $image_spec $image_bundle_name
>
>      bbdebug 1 "OCI: configuring image"
>      if [ -n "${OCI_IMAGE_LABELS}" ]; then
>         for l in ${OCI_IMAGE_LABELS}; do
> -           bbdebug 1 "OCI: umoci config --image $image_name:${OCI_IMAGE_=
TAG} --config.label $l"
> -           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.la=
bel $l
> +           bbdebug 1 "OCI: umoci config --image $image_spec --config.lab=
el $l"
> +           umoci config --image $image_spec --config.label $l
>         done
>      fi
>      if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
>         for l in ${OCI_IMAGE_ENV_VARS}; do
> -           bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} =
--config.env $l"
> -           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.en=
v $l
> +           bbdebug 1 "umoci config --image $image_spec --config.env $l"
> +           umoci config --image $image_spec --config.env $l
>         done
>      fi
>      if [ -n "${OCI_IMAGE_PORTS}" ]; then
>         for l in ${OCI_IMAGE_PORTS}; do
> -           bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} =
--config.exposedports $l"
> -           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.ex=
posedports $l
> +           bbdebug 1 "umoci config --image $image_spec --config.exposedp=
orts $l"
> +           umoci config --image $image_spec --config.exposedports $l
>         done
>      fi
>      if [ -n "${OCI_IMAGE_RUNTIME_UID}" ]; then
> -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --c=
onfig.user ${OCI_IMAGE_RUNTIME_UID}"
> -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.user $=
{OCI_IMAGE_RUNTIME_UID}
> +       bbdebug 1 "umoci config --image $image_spec  --config.user ${OCI_=
IMAGE_RUNTIME_UID}"
> +       umoci config --image $image_spec --config.user ${OCI_IMAGE_RUNTIM=
E_UID}
>      fi
>      if [ -n "${OCI_IMAGE_WORKINGDIR}" ]; then
> -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --c=
onfig.workingdir ${OCI_IMAGE_WORKINGDIR}"
> -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.workin=
gdir ${OCI_IMAGE_WORKINGDIR}
> +       bbdebug 1 "umoci config --image $image_spec  --config.workingdir =
${OCI_IMAGE_WORKINGDIR}"
> +       umoci config --image $image_spec --config.workingdir ${OCI_IMAGE_=
WORKINGDIR}
>      fi
>      if [ -n "${OCI_IMAGE_STOPSIGNAL}" ]; then
> -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --c=
onfig.stopsignal ${OCI_IMAGE_STOPSIGNAL}"
> -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.stopsi=
gnal ${OCI_IMAGE_STOPSIGNAL}
> +       bbdebug 1 "umoci config --image $image_spec  --config.stopsignal =
${OCI_IMAGE_STOPSIGNAL}"
> +       umoci config --image $image_spec --config.stopsignal ${OCI_IMAGE_=
STOPSIGNAL}
>      fi
>      if [ -n "${OCI_IMAGE_OS}" ]; then
> -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --o=
s ${OCI_IMAGE_OS}"
> -       umoci config --image $image_name:${OCI_IMAGE_TAG} --os ${OCI_IMAG=
E_OS}
> +       bbdebug 1 "umoci config --image $image_spec  --os ${OCI_IMAGE_OS}=
"
> +       umoci config --image $image_spec --os ${OCI_IMAGE_OS}
>      fi
>
> -    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --arch=
itecture ${OCI_IMAGE_ARCH}"
> -    umoci config --image $image_name:${OCI_IMAGE_TAG} --architecture ${O=
CI_IMAGE_ARCH}
> +    bbdebug 1 "umoci config --image $image_spec  --architecture ${OCI_IM=
AGE_ARCH}"
> +    umoci config --image $image_spec --architecture ${OCI_IMAGE_ARCH}
>      # NOTE: umoci doesn't currently expose setting the architecture vari=
ant,
>      #       so if you need it use sloci instead
>      if [ -n "${OCI_IMAGE_SUBARCH}" ]; then
>         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, but u=
moci does not"
>         bbnote "     expose variants. use sloci instead if this is import=
ant"
>      fi
> -    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entrypoin=
t ${OCI_IMAGE_ENTRYPOINT}
> +    umoci config --image $image_spec --config.entrypoint ${OCI_IMAGE_ENT=
RYPOINT}
>      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd "$=
{OCI_IMAGE_ENTRYPOINT_ARGS}"
> +       umoci config --image $image_spec --config.cmd "${OCI_IMAGE_ENTRYP=
OINT_ARGS}"
>      fi
> -    umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_IMA=
GE_AUTHOR_EMAIL}
> +    umoci config --image $image_spec --author ${OCI_IMAGE_AUTHOR_EMAIL}
>
>      # make a tar version of the image direcotry
>      #  1) image_name.tar: compatible with oci tar format, blobs and root=
fs
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8335): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8335
> Mute This Topic: https://lists.yoctoproject.org/mt/101756743/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

