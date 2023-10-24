Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D71EC00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 18:58:42 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.156113.1698173920327281725
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 11:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNQIQP6p;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3573e6dd79bso17061155ab.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698173919; x=1698778719; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T47LqDrWBUP8h9dv1/6Ob9Mh69jceeH6CQH+bPDAkR8=;
        b=lNQIQP6pm2Ai1Gs9r8ZWYBKk43Jxxo5dqpdud/wUiyCV42RmQ46MDV5+wKskTEujYv
         q7r8Qi7cCuYSzjSf7/TRElg2p2+uhHc1tdSpVEvZawwvK0VT9K6HCjQSJJ0/B2iEOLhj
         Ir3W52o7J9WdulYK29cCgDnerPWn4JXt9uxz9bGXG5egVbE1E1ue2oqQEQ0HdjG9zoEV
         kWkbp2Z/iwdV/fYQpX1MFqjbC3A34txxJ1fyml7SWyzBXDEAGifnNjPbwFln4RAujt+9
         oTXE9p4ltMFFFyjexQ3kLPsniYUCCga4/0pPXeiA2kWyGnApsSe+/KNPcAX9iXLzywC0
         l4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698173919; x=1698778719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T47LqDrWBUP8h9dv1/6Ob9Mh69jceeH6CQH+bPDAkR8=;
        b=dmj0TBROfPiHUJOhNpbsj1MKZGwiOxWuYQE2DLYYBgWkd4JcBePAc/5MCaHpFivm0f
         QjMmp6oxQ6Wy+JYD/N6Fz335Vxba0q1Kk9kj8uhJNIR6TfkJJWsk61Vho3zaoLoxv2OI
         cd5MZEOr64H7ferrEa9GAufIp3SduP+GWsR0bzlzfgoQyMp6SZVW/XJqiiYolnaRXuuC
         /7vK/TaNmk5ncoRZpp9bQ90QsQZdoY5oMK9Q81QEPXRqa2XOQjpuT+6x0fGnnebd1gJt
         d7WbPEQ4zcnUbqqZ2u2AQ1eArqWx7rUnutDzzzQ5wzlA23uxUynWyr1ZEWOix46OdqVr
         J0Mw==
X-Gm-Message-State: AOJu0YxVRsHQBocvulUSFaW3Q8+F5p25eb29/DII1Dqn/ASlzsvjZdEB
	yyzM6v4oij0rccCmgOeucuvMzGLdE2ZYqaJ3RdTcHll4fLs=
X-Google-Smtp-Source: AGHT+IEeQQKVB64iQqypMIb3V+WTQOi5PlomC5vs8lEyGq0nplecfJg4m/1x3BcLA7DviEdCTKfXIedXKpHgCiBtX68=
X-Received: by 2002:a92:ce4b:0:b0:352:a306:9ad1 with SMTP id
 a11-20020a92ce4b000000b00352a3069ad1mr13817047ilr.0.1698173919391; Tue, 24
 Oct 2023 11:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231004145433.3544915-1-JPEWhacker@gmail.com>
 <CADkTA4NcZv6uw=KDGcpUObSYbYnz1qOkCPE5irZQnuZBzALyvw@mail.gmail.com> <CAJdd5GZNUW9K+h9npDk+NM1PTs8Rexvg+Bwjia1yc-WtzoNbZw@mail.gmail.com>
In-Reply-To: <CAJdd5GZNUW9K+h9npDk+NM1PTs8Rexvg+Bwjia1yc-WtzoNbZw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Oct 2023 14:58:27 -0400
Message-ID: <CADkTA4OvyOv0L_tD7-HkC2=_i1MFHGtn+TB6EC7hnLuZGibQDw@mail.gmail.com>
Subject: Re: [meta-virtualization][RFC] image-oci-umoci: Set image name and tag
To: Joshua Watt <jpewhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 18:58:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8389

On Mon, Oct 16, 2023 at 3:34=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> On Mon, Oct 16, 2023 at 12:04=E2=80=AFPM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, Oct 4, 2023 at 10:54=E2=80=AFAM Joshua Watt <JPEWhacker@gmail.c=
om> wrote:
> > >
> > > umoci treats the --image parameter as <DIRECTORY>:<NAME>, where the O=
CI
> > > spec ref.name for the image it set to <NAME>. Therefore, if the
> > > intention is for the ref.name to be in the format <IMAGE_NAME>:<TAG> =
(as
> > > is expected by e.g. `podman load`, then the complete argument that is
> > > passed to umoci must be `--image <DIRECTORY>:<IMAGE_NAME>:<TAG>`
> >
> > This is going to take a few iterations as well, the changing spec
> > and umoci uses have made this a non-trivial area to modify.
> >
> > I assume you are talking about the oci ref.name annotation ?
>
> Correct. If you pass <DIRECTORY>:<IMAGE_NAME>:<TAG> to umoci, ref.name
> will be <IMAGE_NAME>:<TAG>
>
> >
> > >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  classes/image-oci-umoci.inc | 52 +++++++++++++++++++----------------=
--
> > >  1 file changed, 27 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.in=
c
> > > index 58e4668..a58cb4c 100644
> > > --- a/classes/image-oci-umoci.inc
> > > +++ b/classes/image-oci-umoci.inc
> > > @@ -35,14 +35,16 @@ IMAGE_CMD:oci() {
> > >      fi
> > >
> > >      if [ -z "${OCI_IMAGE_TAG}" ]; then
> > > -       OCI_IMAGE_TAG=3D"initial-tag"
> > > -    fi
> > > +       image_spec=3D"$image_name:${IMAGE_BASENAME}:initial-tag"
> > > +    else
> > > +       image_spec=3D"$image_name:${IMAGE_BASENAME}:${OCI_IMAGE_TAG}"
> >
> > I'm not seeing any examples in the umoci documentation that shows
> > a "triplet" of values for the image.
> >
> > It is always image-path[:image-tag] in what I've read and see in the so=
urce.
>
> Ya, I've noticed that. I think the reason for that is that ref.name
> being in the format "NAME:TAG" is a OCI convention that umoci doesn't
> _actually_ really need to care about. umoci cares about what directory
> the image is in (image-path) and what the ref.name should be set to
> (image-tag). Whether image-tag contains a ":" is irrelevant to umoci
> since it just copies whatever comes after the first ":" into ref.name.
>
> Importantly, image-path is never encoded in the JSON anywhere, so it's
> not equivalent to the container name.
>
> >
> > Are you saying that what is written into th oci spec json file should b=
e
> > different ? and that encoding what you want in the image-path portion
> > of the umoci --image parameter makes it pass through correctly ?
>
> Ya. I can get containers that have a "nice" ref.name encoded in them by d=
oing:
>
> OCI_IMAGE_TAG =3D "$image_name:${IMAGE_BASENAME}:latest"
>
> Which then sets `ref.name =3D "${IMAGE_BASENAME}:latest"` and everything
> is happy with this. My suggestion is that the default behavior should
> be to encode a nice ref.name like this. Otherwise, tools can (and do)
> weird things when loading an OCI image. For example, in the current
> implementation, `podmain load -i <IMAGE>` will import the container
> _name_ as `latest`, then give it a `latest` tag since none was
> specified, so you end up with a `podman run localhost/latest:latest`
> which is just weird (and IMHO, a bad experience).

Finally back to this.

Can you send me a link to the spec you are reading ? Because from
what I've been reading; ref.name has no semantic restrictions within
the specified grammar. I just want to be sure that I'm not missing
something.

I'm of course talking about: org.opencontainers.image.ref.name
and I'm using the oci image-spec repository.

That lack of semantics means we are just chasing whatever tools
have decided is their default, and there is no right choice IMHO.

It (ref.name) is most often just a tag (in the OCI examples), which is
why I was just setting it to the tag, and not containing the image
name in it at all, and also why I always check the variable to be
empty before assigning a simple default .. there's no way to get
it right for all consumers.

Whatever is inheriting the class can tune it for the intended
container runtime. That being said, I'm ok with a bit more complexity
in the class to avoid everyone carrying more information than required
outside of the class.

i.e. I don't really want to change the default, or more specifically force
the <image name>:<tag>, since with the proposed change, there's no
way to pass in an OCI_IMAGE_TAG and not have it somehow modified.
But I also don't need to compose some of the values each time, if there's
a single variable it is easier to override and make sure it is consistently
used (like your patch using the local variable image_spec).

In this case, is something breaking if you make sure your tag is
encoded as "${IMAGE_BASENAME}:latest" before letting the image
class do its work ? From a glance, it will be consistently composed
as "$image_name:${IMAGE_BASENAME}:latest" and then passed
via --image.

I'm building some oci-images now and having a look at the different
runtimes and copies of the images .. to see what happens with the
ref.name. and I'm going to experiment with some ways we can hint
about the format as an input.

Bruce


>
> >
> > Bruce
> >
> > > +   fi
> > >
> > >      if [ -n "$new_image" ]; then
> > >         bbdebug 1 "OCI: umoci init --layout $image_name"
> > >         umoci init --layout $image_name
> > > -       umoci new --image $image_name:${OCI_IMAGE_TAG}
> > > -       umoci unpack --rootless --image $image_name:${OCI_IMAGE_TAG} =
$image_bundle_name
> > > +       umoci new --image $image_spec
> > > +       umoci unpack --rootless --image $image_spec $image_bundle_nam=
e
> > >      else
> > >         # todo: create a different tag, after checking if the passed =
one exists
> > >         true
> > > @@ -52,58 +54,58 @@ IMAGE_CMD:oci() {
> > >      bbdebug 1 "OCI: cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootf=
s/"
> > >      cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
> > >
> > > -    bbdebug 1 "OCI: umoci repack --image $image_name:${OCI_IMAGE_TAG=
} $image_bundle_name"
> > > -    umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_=
name
> > > +    bbdebug 1 "OCI: umoci repack --image $image_spec $image_bundle_n=
ame"
> > > +    umoci repack --image $image_spec $image_bundle_name
> > >
> > >      bbdebug 1 "OCI: configuring image"
> > >      if [ -n "${OCI_IMAGE_LABELS}" ]; then
> > >         for l in ${OCI_IMAGE_LABELS}; do
> > > -           bbdebug 1 "OCI: umoci config --image $image_name:${OCI_IM=
AGE_TAG} --config.label $l"
> > > -           umoci config --image $image_name:${OCI_IMAGE_TAG} --confi=
g.label $l
> > > +           bbdebug 1 "OCI: umoci config --image $image_spec --config=
.label $l"
> > > +           umoci config --image $image_spec --config.label $l
> > >         done
> > >      fi
> > >      if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
> > >         for l in ${OCI_IMAGE_ENV_VARS}; do
> > > -           bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_T=
AG} --config.env $l"
> > > -           umoci config --image $image_name:${OCI_IMAGE_TAG} --confi=
g.env $l
> > > +           bbdebug 1 "umoci config --image $image_spec --config.env =
$l"
> > > +           umoci config --image $image_spec --config.env $l
> > >         done
> > >      fi
> > >      if [ -n "${OCI_IMAGE_PORTS}" ]; then
> > >         for l in ${OCI_IMAGE_PORTS}; do
> > > -           bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_T=
AG} --config.exposedports $l"
> > > -           umoci config --image $image_name:${OCI_IMAGE_TAG} --confi=
g.exposedports $l
> > > +           bbdebug 1 "umoci config --image $image_spec --config.expo=
sedports $l"
> > > +           umoci config --image $image_spec --config.exposedports $l
> > >         done
> > >      fi
> > >      if [ -n "${OCI_IMAGE_RUNTIME_UID}" ]; then
> > > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} =
 --config.user ${OCI_IMAGE_RUNTIME_UID}"
> > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.us=
er ${OCI_IMAGE_RUNTIME_UID}
> > > +       bbdebug 1 "umoci config --image $image_spec  --config.user ${=
OCI_IMAGE_RUNTIME_UID}"
> > > +       umoci config --image $image_spec --config.user ${OCI_IMAGE_RU=
NTIME_UID}
> > >      fi
> > >      if [ -n "${OCI_IMAGE_WORKINGDIR}" ]; then
> > > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} =
 --config.workingdir ${OCI_IMAGE_WORKINGDIR}"
> > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.wo=
rkingdir ${OCI_IMAGE_WORKINGDIR}
> > > +       bbdebug 1 "umoci config --image $image_spec  --config.working=
dir ${OCI_IMAGE_WORKINGDIR}"
> > > +       umoci config --image $image_spec --config.workingdir ${OCI_IM=
AGE_WORKINGDIR}
> > >      fi
> > >      if [ -n "${OCI_IMAGE_STOPSIGNAL}" ]; then
> > > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} =
 --config.stopsignal ${OCI_IMAGE_STOPSIGNAL}"
> > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.st=
opsignal ${OCI_IMAGE_STOPSIGNAL}
> > > +       bbdebug 1 "umoci config --image $image_spec  --config.stopsig=
nal ${OCI_IMAGE_STOPSIGNAL}"
> > > +       umoci config --image $image_spec --config.stopsignal ${OCI_IM=
AGE_STOPSIGNAL}
> > >      fi
> > >      if [ -n "${OCI_IMAGE_OS}" ]; then
> > > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} =
 --os ${OCI_IMAGE_OS}"
> > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --os ${OCI_=
IMAGE_OS}
> > > +       bbdebug 1 "umoci config --image $image_spec  --os ${OCI_IMAGE=
_OS}"
> > > +       umoci config --image $image_spec --os ${OCI_IMAGE_OS}
> > >      fi
> > >
> > > -    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --=
architecture ${OCI_IMAGE_ARCH}"
> > > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --architecture=
 ${OCI_IMAGE_ARCH}
> > > +    bbdebug 1 "umoci config --image $image_spec  --architecture ${OC=
I_IMAGE_ARCH}"
> > > +    umoci config --image $image_spec --architecture ${OCI_IMAGE_ARCH=
}
> > >      # NOTE: umoci doesn't currently expose setting the architecture =
variant,
> > >      #       so if you need it use sloci instead
> > >      if [ -n "${OCI_IMAGE_SUBARCH}" ]; then
> > >         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, b=
ut umoci does not"
> > >         bbnote "     expose variants. use sloci instead if this is im=
portant"
> > >      fi
> > > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entry=
point ${OCI_IMAGE_ENTRYPOINT}
> > > +    umoci config --image $image_spec --config.entrypoint ${OCI_IMAGE=
_ENTRYPOINT}
> > >      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cm=
d "${OCI_IMAGE_ENTRYPOINT_ARGS}"
> > > +       umoci config --image $image_spec --config.cmd "${OCI_IMAGE_EN=
TRYPOINT_ARGS}"
> > >      fi
> > > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI=
_IMAGE_AUTHOR_EMAIL}
> > > +    umoci config --image $image_spec --author ${OCI_IMAGE_AUTHOR_EMA=
IL}
> > >
> > >      # make a tar version of the image direcotry
> > >      #  1) image_name.tar: compatible with oci tar format, blobs and =
rootfs
> > > --
> > > 2.34.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#8335): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/8335
> > > Mute This Topic: https://lists.yoctoproject.org/mt/101756743/1050810
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [bruce.ashfield@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

