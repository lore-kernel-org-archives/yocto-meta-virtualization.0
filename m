Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3841CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 19:34:02 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.177614.1697484841995452507
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 12:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W3YZccdd;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso65552171fa.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 12:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697484840; x=1698089640; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXP+52SrcQXghcIoWMwq7B8D93ES2jHrOPx4QixKC8w=;
        b=W3YZccddFloKwGOxfnADSiopkvJOfoz7YxYCl7V/yE5QakLRlqmZkrooYXbT2qXozX
         4f96FXIr0uxBnROcFKhEP2jvI0NHM3Vk/Qed6LtV/GpjHiNY6sSs+WJYCiB0Xl2YkGJk
         HEHBJ7z+SM75Bj6JKwcf7sUp+tjuZNAkRejd57Co8oX6s50fzb+ONp1QiPTHnLb6pZRh
         tHII4uhLs8lnYOR5CR12n1FZS3dQWjWGyW+1O37Y89U0vRvm0sNC6F29/uvXEXy422iD
         R/8BpDzWlqttd/tAQe5FtjEiAEbNjGkQK3gmwKvFeC9IineJJ5WJbFjoBmTKYHinLhj7
         xKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697484840; x=1698089640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXP+52SrcQXghcIoWMwq7B8D93ES2jHrOPx4QixKC8w=;
        b=Pfij8ggmbmKquFZ78FRTImE6dNDZOTVxvs0mNGI4PJFnGV3STVe89H/ND9fkTp82f9
         E4eG3No26CnyOTUBuDihh+RkiGkHpNTlfIMlN7dvu0fuuEfzFqs+T+6JbE//zhfnNg0p
         XhwQegHiqwk4xL3ICCvZ72mH2YKTxssOoa62IvcGne08ExJrEmd8v5qITLW9lyNQrpYE
         YNL1POBGCxburSXTdt8RNQgOj6n5ejg+3+T6ycro9/zDBSnA5waEfDYEwKoRDMsTyDdn
         h4BvO9RL7cHD/6yMbmrM12KxTLsWVJx0DTTy+Y/17AaB3nJzFW7YvH1wVcX5WjhLQBsv
         5ELQ==
X-Gm-Message-State: AOJu0Yw+R39mB0InHKKihlDhBcdubGiDsOdCP+PLwbUnHImhS4u7fLhB
	kHydcPcy6K5+J9Q4y/dgkpOtGxu9eirMYbQT7wo=
X-Google-Smtp-Source: AGHT+IFgfp24oq902/p+1Q0Lmu5G0PqrpaypGfNHoswch5pgsLwX5u94sPuhf8e8CPl9Py+z+eSv13P1Ax0JBOhttIA=
X-Received: by 2002:a2e:b538:0:b0:2c5:1d95:f7a1 with SMTP id
 z24-20020a2eb538000000b002c51d95f7a1mr144328ljm.27.1697484839820; Mon, 16 Oct
 2023 12:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231004145433.3544915-1-JPEWhacker@gmail.com> <CADkTA4NcZv6uw=KDGcpUObSYbYnz1qOkCPE5irZQnuZBzALyvw@mail.gmail.com>
In-Reply-To: <CADkTA4NcZv6uw=KDGcpUObSYbYnz1qOkCPE5irZQnuZBzALyvw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 16 Oct 2023 13:33:48 -0600
Message-ID: <CAJdd5GZNUW9K+h9npDk+NM1PTs8Rexvg+Bwjia1yc-WtzoNbZw@mail.gmail.com>
Subject: Re: [meta-virtualization][RFC] image-oci-umoci: Set image name and tag
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 19:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8374

On Mon, Oct 16, 2023 at 12:04=E2=80=AFPM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Wed, Oct 4, 2023 at 10:54=E2=80=AFAM Joshua Watt <JPEWhacker@gmail.com=
> wrote:
> >
> > umoci treats the --image parameter as <DIRECTORY>:<NAME>, where the OCI
> > spec ref.name for the image it set to <NAME>. Therefore, if the
> > intention is for the ref.name to be in the format <IMAGE_NAME>:<TAG> (a=
s
> > is expected by e.g. `podman load`, then the complete argument that is
> > passed to umoci must be `--image <DIRECTORY>:<IMAGE_NAME>:<TAG>`
>
> This is going to take a few iterations as well, the changing spec
> and umoci uses have made this a non-trivial area to modify.
>
> I assume you are talking about the oci ref.name annotation ?

Correct. If you pass <DIRECTORY>:<IMAGE_NAME>:<TAG> to umoci, ref.name
will be <IMAGE_NAME>:<TAG>

>
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  classes/image-oci-umoci.inc | 52 +++++++++++++++++++------------------
> >  1 file changed, 27 insertions(+), 25 deletions(-)
> >
> > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> > index 58e4668..a58cb4c 100644
> > --- a/classes/image-oci-umoci.inc
> > +++ b/classes/image-oci-umoci.inc
> > @@ -35,14 +35,16 @@ IMAGE_CMD:oci() {
> >      fi
> >
> >      if [ -z "${OCI_IMAGE_TAG}" ]; then
> > -       OCI_IMAGE_TAG=3D"initial-tag"
> > -    fi
> > +       image_spec=3D"$image_name:${IMAGE_BASENAME}:initial-tag"
> > +    else
> > +       image_spec=3D"$image_name:${IMAGE_BASENAME}:${OCI_IMAGE_TAG}"
>
> I'm not seeing any examples in the umoci documentation that shows
> a "triplet" of values for the image.
>
> It is always image-path[:image-tag] in what I've read and see in the sour=
ce.

Ya, I've noticed that. I think the reason for that is that ref.name
being in the format "NAME:TAG" is a OCI convention that umoci doesn't
_actually_ really need to care about. umoci cares about what directory
the image is in (image-path) and what the ref.name should be set to
(image-tag). Whether image-tag contains a ":" is irrelevant to umoci
since it just copies whatever comes after the first ":" into ref.name.

Importantly, image-path is never encoded in the JSON anywhere, so it's
not equivalent to the container name.

>
> Are you saying that what is written into th oci spec json file should be
> different ? and that encoding what you want in the image-path portion
> of the umoci --image parameter makes it pass through correctly ?

Ya. I can get containers that have a "nice" ref.name encoded in them by doi=
ng:

OCI_IMAGE_TAG =3D "${IMAGE_BASENAME}:latest"

Which then sets `ref.name =3D "${IMAGE_BASENAME}:latest"` and everything
is happy with this. My suggestion is that the default behavior should
be to encode a nice ref.name like this. Otherwise, tools can (and do)
weird things when loading an OCI image. For example, in the current
implementation, `podmain load -i <IMAGE>` will import the container
_name_ as `latest`, then give it a `latest` tag since none was
specified, so you end up with a `podman run localhost/latest:latest`
which is just weird (and IMHO, a bad experience).

>
> Bruce
>
> > +   fi
> >
> >      if [ -n "$new_image" ]; then
> >         bbdebug 1 "OCI: umoci init --layout $image_name"
> >         umoci init --layout $image_name
> > -       umoci new --image $image_name:${OCI_IMAGE_TAG}
> > -       umoci unpack --rootless --image $image_name:${OCI_IMAGE_TAG} $i=
mage_bundle_name
> > +       umoci new --image $image_spec
> > +       umoci unpack --rootless --image $image_spec $image_bundle_name
> >      else
> >         # todo: create a different tag, after checking if the passed on=
e exists
> >         true
> > @@ -52,58 +54,58 @@ IMAGE_CMD:oci() {
> >      bbdebug 1 "OCI: cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs/=
"
> >      cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
> >
> > -    bbdebug 1 "OCI: umoci repack --image $image_name:${OCI_IMAGE_TAG} =
$image_bundle_name"
> > -    umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_na=
me
> > +    bbdebug 1 "OCI: umoci repack --image $image_spec $image_bundle_nam=
e"
> > +    umoci repack --image $image_spec $image_bundle_name
> >
> >      bbdebug 1 "OCI: configuring image"
> >      if [ -n "${OCI_IMAGE_LABELS}" ]; then
> >         for l in ${OCI_IMAGE_LABELS}; do
> > -           bbdebug 1 "OCI: umoci config --image $image_name:${OCI_IMAG=
E_TAG} --config.label $l"
> > -           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.=
label $l
> > +           bbdebug 1 "OCI: umoci config --image $image_spec --config.l=
abel $l"
> > +           umoci config --image $image_spec --config.label $l
> >         done
> >      fi
> >      if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
> >         for l in ${OCI_IMAGE_ENV_VARS}; do
> > -           bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG=
} --config.env $l"
> > -           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.=
env $l
> > +           bbdebug 1 "umoci config --image $image_spec --config.env $l=
"
> > +           umoci config --image $image_spec --config.env $l
> >         done
> >      fi
> >      if [ -n "${OCI_IMAGE_PORTS}" ]; then
> >         for l in ${OCI_IMAGE_PORTS}; do
> > -           bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG=
} --config.exposedports $l"
> > -           umoci config --image $image_name:${OCI_IMAGE_TAG} --config.=
exposedports $l
> > +           bbdebug 1 "umoci config --image $image_spec --config.expose=
dports $l"
> > +           umoci config --image $image_spec --config.exposedports $l
> >         done
> >      fi
> >      if [ -n "${OCI_IMAGE_RUNTIME_UID}" ]; then
> > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  -=
-config.user ${OCI_IMAGE_RUNTIME_UID}"
> > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.user=
 ${OCI_IMAGE_RUNTIME_UID}
> > +       bbdebug 1 "umoci config --image $image_spec  --config.user ${OC=
I_IMAGE_RUNTIME_UID}"
> > +       umoci config --image $image_spec --config.user ${OCI_IMAGE_RUNT=
IME_UID}
> >      fi
> >      if [ -n "${OCI_IMAGE_WORKINGDIR}" ]; then
> > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  -=
-config.workingdir ${OCI_IMAGE_WORKINGDIR}"
> > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.work=
ingdir ${OCI_IMAGE_WORKINGDIR}
> > +       bbdebug 1 "umoci config --image $image_spec  --config.workingdi=
r ${OCI_IMAGE_WORKINGDIR}"
> > +       umoci config --image $image_spec --config.workingdir ${OCI_IMAG=
E_WORKINGDIR}
> >      fi
> >      if [ -n "${OCI_IMAGE_STOPSIGNAL}" ]; then
> > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  -=
-config.stopsignal ${OCI_IMAGE_STOPSIGNAL}"
> > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.stop=
signal ${OCI_IMAGE_STOPSIGNAL}
> > +       bbdebug 1 "umoci config --image $image_spec  --config.stopsigna=
l ${OCI_IMAGE_STOPSIGNAL}"
> > +       umoci config --image $image_spec --config.stopsignal ${OCI_IMAG=
E_STOPSIGNAL}
> >      fi
> >      if [ -n "${OCI_IMAGE_OS}" ]; then
> > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  -=
-os ${OCI_IMAGE_OS}"
> > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --os ${OCI_IM=
AGE_OS}
> > +       bbdebug 1 "umoci config --image $image_spec  --os ${OCI_IMAGE_O=
S}"
> > +       umoci config --image $image_spec --os ${OCI_IMAGE_OS}
> >      fi
> >
> > -    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --ar=
chitecture ${OCI_IMAGE_ARCH}"
> > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --architecture $=
{OCI_IMAGE_ARCH}
> > +    bbdebug 1 "umoci config --image $image_spec  --architecture ${OCI_=
IMAGE_ARCH}"
> > +    umoci config --image $image_spec --architecture ${OCI_IMAGE_ARCH}
> >      # NOTE: umoci doesn't currently expose setting the architecture va=
riant,
> >      #       so if you need it use sloci instead
> >      if [ -n "${OCI_IMAGE_SUBARCH}" ]; then
> >         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, but=
 umoci does not"
> >         bbnote "     expose variants. use sloci instead if this is impo=
rtant"
> >      fi
> > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entrypo=
int ${OCI_IMAGE_ENTRYPOINT}
> > +    umoci config --image $image_spec --config.entrypoint ${OCI_IMAGE_E=
NTRYPOINT}
> >      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd =
"${OCI_IMAGE_ENTRYPOINT_ARGS}"
> > +       umoci config --image $image_spec --config.cmd "${OCI_IMAGE_ENTR=
YPOINT_ARGS}"
> >      fi
> > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_I=
MAGE_AUTHOR_EMAIL}
> > +    umoci config --image $image_spec --author ${OCI_IMAGE_AUTHOR_EMAIL=
}
> >
> >      # make a tar version of the image direcotry
> >      #  1) image_name.tar: compatible with oci tar format, blobs and ro=
otfs
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8335): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8335
> > Mute This Topic: https://lists.yoctoproject.org/mt/101756743/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

