Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B06C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 19:19:38 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.15435.1698434372294909431
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 12:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iiCDmi/u;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3574297c79eso7340575ab.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Oct 2023 12:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698434371; x=1699039171; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDRT+Sh5KwFr7DXsU/mit79RhajXuG+rTCberGeH4/k=;
        b=iiCDmi/uIwR425gP0cX+8EEtsxzf5S5x0U34jlxkB5Y6+xRxhoxXmBT/bzdB86Z5Z1
         sM2zatj0DRQwVXl13hCfvB5RT13h2rUGHNq61EG6u+RtvzFrf845rXxIknewr/Q1h1aD
         zOgIhlc4b8n0LVhFhK0V6ZFiefPLx1Ew28MGlqGLikiQzdBsLAaW4xPuxMhqqh9DLkql
         kFCH2XGSyUZDzSdfD6HSXIQpxbAREB3NXz7IebUWugjVNLaTNMrqdBOUXKqRkQJBiAN0
         PYB7r4hrVAaRB9xZON5fT1UCW58lZSXBYvgZViCsoMZfo19Ytvr1JB1PaR7warROxafV
         nU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698434371; x=1699039171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDRT+Sh5KwFr7DXsU/mit79RhajXuG+rTCberGeH4/k=;
        b=AnyEC/RVt+anNyeZfEtaVU5KTm62pfci3cZozT/pFpWaZ+6WaOzjyLMxeHkZ3rkxpB
         tVf7orq1kUFQJirTVb7+xoOZPo7egOylbEV7R2mqF/q1ihYX6Ru32yYtxhUyryMTpAxx
         bzP6chXoq8yo5TM1CsO8rRCMG4VHsoJpMWPL2NajzBjULjRGyBwBVpE1Uh/ECFKvoIHl
         5WT8EmjM6xXn/c++N3w687Lvv2F4nCtY+wH+FoWipdHU2pR7z+/VyJ/xRnUwlu+s/bq5
         ZumB474guSxj1oZW7UnFj5ZV7Y+uPNh/Pa7GXaH1rkrexyfJPnYoA9XjYHVb6mG/zqK+
         0ZRg==
X-Gm-Message-State: AOJu0Yz7DDtMYHQf3fhyUBymmAm1cp2fK59cD04iOxROG8aobtFCqqs6
	oWgcG8u0kx/zConi4W+Zn05OHImbO+rM/41MjVE=
X-Google-Smtp-Source: AGHT+IGoG9PkJgwnofGiOxRpS7u+Cmxwx/w6P6oYSYURrW5mqDxHCUeald7ThYWEOH50YUoOCiC1tGPDFqiAZfy1Nq0=
X-Received: by 2002:a05:6e02:1566:b0:352:a405:fc1c with SMTP id
 k6-20020a056e02156600b00352a405fc1cmr5213719ilu.17.1698434371356; Fri, 27 Oct
 2023 12:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231004145433.3544915-1-JPEWhacker@gmail.com>
 <CADkTA4NcZv6uw=KDGcpUObSYbYnz1qOkCPE5irZQnuZBzALyvw@mail.gmail.com>
 <CAJdd5GZNUW9K+h9npDk+NM1PTs8Rexvg+Bwjia1yc-WtzoNbZw@mail.gmail.com>
 <CADkTA4OvyOv0L_tD7-HkC2=_i1MFHGtn+TB6EC7hnLuZGibQDw@mail.gmail.com> <CAJdd5GaVHa7sBwF78L7Uu3VmYitq3GPXP6wGKoK-KSXdkOKwzw@mail.gmail.com>
In-Reply-To: <CAJdd5GaVHa7sBwF78L7Uu3VmYitq3GPXP6wGKoK-KSXdkOKwzw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 27 Oct 2023 15:19:19 -0400
Message-ID: <CADkTA4Pq5UN7K=U3J9sMRQCPQaHugWh+9S_aoFNSj5T31aWNLA@mail.gmail.com>
Subject: Re: [meta-virtualization][RFC] image-oci-umoci: Set image name and tag
To: Joshua Watt <jpewhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Oct 2023 19:19:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8405

On Fri, Oct 27, 2023 at 11:26=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com>=
 wrote:
>
> On Tue, Oct 24, 2023 at 12:58=E2=80=AFPM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > On Mon, Oct 16, 2023 at 3:34=E2=80=AFPM Joshua Watt <jpewhacker@gmail.c=
om> wrote:
> > >
> > > On Mon, Oct 16, 2023 at 12:04=E2=80=AFPM Bruce Ashfield
> > > <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Wed, Oct 4, 2023 at 10:54=E2=80=AFAM Joshua Watt <JPEWhacker@gma=
il.com> wrote:
> > > > >
> > > > > umoci treats the --image parameter as <DIRECTORY>:<NAME>, where t=
he OCI
> > > > > spec ref.name for the image it set to <NAME>. Therefore, if the
> > > > > intention is for the ref.name to be in the format <IMAGE_NAME>:<T=
AG> (as
> > > > > is expected by e.g. `podman load`, then the complete argument tha=
t is
> > > > > passed to umoci must be `--image <DIRECTORY>:<IMAGE_NAME>:<TAG>`
> > > >
> > > > This is going to take a few iterations as well, the changing spec
> > > > and umoci uses have made this a non-trivial area to modify.
> > > >
> > > > I assume you are talking about the oci ref.name annotation ?
> > >
> > > Correct. If you pass <DIRECTORY>:<IMAGE_NAME>:<TAG> to umoci, ref.nam=
e
> > > will be <IMAGE_NAME>:<TAG>
> > >
> > > >
> > > > >
> > > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > > ---
> > > > >  classes/image-oci-umoci.inc | 52 +++++++++++++++++++------------=
------
> > > > >  1 file changed, 27 insertions(+), 25 deletions(-)
> > > > >
> > > > > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoc=
i.inc
> > > > > index 58e4668..a58cb4c 100644
> > > > > --- a/classes/image-oci-umoci.inc
> > > > > +++ b/classes/image-oci-umoci.inc
> > > > > @@ -35,14 +35,16 @@ IMAGE_CMD:oci() {
> > > > >      fi
> > > > >
> > > > >      if [ -z "${OCI_IMAGE_TAG}" ]; then
> > > > > -       OCI_IMAGE_TAG=3D"initial-tag"
> > > > > -    fi
> > > > > +       image_spec=3D"$image_name:${IMAGE_BASENAME}:initial-tag"
> > > > > +    else
> > > > > +       image_spec=3D"$image_name:${IMAGE_BASENAME}:${OCI_IMAGE_T=
AG}"
> > > >
> > > > I'm not seeing any examples in the umoci documentation that shows
> > > > a "triplet" of values for the image.
> > > >
> > > > It is always image-path[:image-tag] in what I've read and see in th=
e source.
> > >
> > > Ya, I've noticed that. I think the reason for that is that ref.name
> > > being in the format "NAME:TAG" is a OCI convention that umoci doesn't
> > > _actually_ really need to care about. umoci cares about what director=
y
> > > the image is in (image-path) and what the ref.name should be set to
> > > (image-tag). Whether image-tag contains a ":" is irrelevant to umoci
> > > since it just copies whatever comes after the first ":" into ref.name=
.
> > >
> > > Importantly, image-path is never encoded in the JSON anywhere, so it'=
s
> > > not equivalent to the container name.
> > >
> > > >
> > > > Are you saying that what is written into th oci spec json file shou=
ld be
> > > > different ? and that encoding what you want in the image-path porti=
on
> > > > of the umoci --image parameter makes it pass through correctly ?
> > >
> > > Ya. I can get containers that have a "nice" ref.name encoded in them =
by doing:
> > >
> > > OCI_IMAGE_TAG =3D "$image_name:${IMAGE_BASENAME}:latest"
> > >
> > > Which then sets `ref.name =3D "${IMAGE_BASENAME}:latest"` and everyth=
ing
> > > is happy with this. My suggestion is that the default behavior should
> > > be to encode a nice ref.name like this. Otherwise, tools can (and do)
> > > weird things when loading an OCI image. For example, in the current
> > > implementation, `podmain load -i <IMAGE>` will import the container
> > > _name_ as `latest`, then give it a `latest` tag since none was
> > > specified, so you end up with a `podman run localhost/latest:latest`
> > > which is just weird (and IMHO, a bad experience).
> >
> > Finally back to this.
> >
> > Can you send me a link to the spec you are reading ? Because from
> > what I've been reading; ref.name has no semantic restrictions within
> > the specified grammar. I just want to be sure that I'm not missing
> > something.
>
> The OCI spec doesn't really seem to concern itself with the concept of
> image labels (e.g. "latest") at all. It's silent on them, so this is
> just an emperical observation that behavior of importing images
> created by the oci classes is terrible, unless you use a tool that
> forces you to explicitly specify the destination name (like skopeo
> copy)

See below as to why your comment is on the mark :)

>
> >
> > I'm of course talking about: org.opencontainers.image.ref.name
> > and I'm using the oci image-spec repository.
>
> Yep
>
> >
> > That lack of semantics means we are just chasing whatever tools
> > have decided is their default, and there is no right choice IMHO.
>
> Maybe, but again, the default experience of `podman load`, which is
> IMHO the one we probably _really_ care about, is terrible.

meta-virt itself doesn't really dictate / anoint a preferred container
runtime / engine.  So I try and make sure that none of the experiences
are terrible, and have enough configuration options that we can
tweak things.

The starting of this development pre-dates podman, and was
focussed around sloci to create simple images without needing
any complex go applications as native / host tools.  It was those
images and being able to use the oci-image-tools + runc to
interrogate and execute the images without needing much of
a framework on top.

Then came docker and skopeo as the primary manipulators
of the images.

My tar'd up version of the oci directory was something I created
and then once a similar format was part of the spec, my structure
wasn't appropriate and I had to tweak it to keep tools happy
(which is why there are a couple of options for those oci image
directories).

>
> Based on the extra work the OCI class is doing to construct a
> directory name that looks like an image name, I had sort of assumed
> that it was trying (and failing) to encode the image name into the
> image so it would load nicely. Otherwise all the logic to construct
> the directory name could just be simplified to use a fixed name
> (like... "image") because the name of the directory has no affect on
> the name of the image. Maybe I'm reading too much into the tea leaves
> here :)

It is just a loose copy of the other image format naming conventions,
with additions that I thought would be useful when looking at a
jumbled deploy directory later :)

>
>
> >
> > It (ref.name) is most often just a tag (in the OCI examples), which is
> > why I was just setting it to the tag, and not containing the image
> > name in it at all, and also why I always check the variable to be
> > empty before assigning a simple default .. there's no way to get
> > it right for all consumers.
> >
> > Whatever is inheriting the class can tune it for the intended
> > container runtime. That being said, I'm ok with a bit more complexity
> > in the class to avoid everyone carrying more information than required
> > outside of the class.
> >
> > i.e. I don't really want to change the default, or more specifically fo=
rce
> > the <image name>:<tag>, since with the proposed change, there's no
> > way to pass in an OCI_IMAGE_TAG and not have it somehow modified.
> > But I also don't need to compose some of the values each time, if there=
's
> > a single variable it is easier to override and make sure it is consiste=
ntly
> > used (like your patch using the local variable image_spec).
> >
> > In this case, is something breaking if you make sure your tag is
> > encoded as "${IMAGE_BASENAME}:latest" before letting the image
> > class do its work ? From a glance, it will be consistently composed
> > as "$image_name:${IMAGE_BASENAME}:latest" and then passed
> > via --image.
>
> Ya, this works fine and I'll do that. Figured I'd at least make the
> case that the default is perhaps not particularly great.... It was
> really confusing to me (as a new person to meta-virt) why it was
> generating such bad names when I imported the images. If we don't
> change it, perhaps a least a warning against using `podman load` to
> load images in the README?

Maybe I can put some of the history and options for manipulating
the images in a README. I've captured a lot of it in my various
presentations over the years, but those aren't exactly accessible to
a user of the layer.

I'd still like to figure out a switch that you could set when including
the class, I've already added variables for the intended container
runtime for some of the other "distro/image" level features. I could
use them, and make the defaults sane based on that.

So I'll do the following:

- create a README with some details
- see if I can use the OCI variables I've added previously to set a default
- merge the : _ substitution patch, because regardless of the above, I
don't want the tools interpreting tags out of the names.

Bruce

>
> >
> > I'm building some oci-images now and having a look at the different
> > runtimes and copies of the images .. to see what happens with the
> > ref.name. and I'm going to experiment with some ways we can hint
> > about the format as an input.
> >
> > Bruce
> >
> >
> > >
> > > >
> > > > Bruce
> > > >
> > > > > +   fi
> > > > >
> > > > >      if [ -n "$new_image" ]; then
> > > > >         bbdebug 1 "OCI: umoci init --layout $image_name"
> > > > >         umoci init --layout $image_name
> > > > > -       umoci new --image $image_name:${OCI_IMAGE_TAG}
> > > > > -       umoci unpack --rootless --image $image_name:${OCI_IMAGE_T=
AG} $image_bundle_name
> > > > > +       umoci new --image $image_spec
> > > > > +       umoci unpack --rootless --image $image_spec $image_bundle=
_name
> > > > >      else
> > > > >         # todo: create a different tag, after checking if the pas=
sed one exists
> > > > >         true
> > > > > @@ -52,58 +54,58 @@ IMAGE_CMD:oci() {
> > > > >      bbdebug 1 "OCI: cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/r=
ootfs/"
> > > > >      cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
> > > > >
> > > > > -    bbdebug 1 "OCI: umoci repack --image $image_name:${OCI_IMAGE=
_TAG} $image_bundle_name"
> > > > > -    umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bun=
dle_name
> > > > > +    bbdebug 1 "OCI: umoci repack --image $image_spec $image_bund=
le_name"
> > > > > +    umoci repack --image $image_spec $image_bundle_name
> > > > >
> > > > >      bbdebug 1 "OCI: configuring image"
> > > > >      if [ -n "${OCI_IMAGE_LABELS}" ]; then
> > > > >         for l in ${OCI_IMAGE_LABELS}; do
> > > > > -           bbdebug 1 "OCI: umoci config --image $image_name:${OC=
I_IMAGE_TAG} --config.label $l"
> > > > > -           umoci config --image $image_name:${OCI_IMAGE_TAG} --c=
onfig.label $l
> > > > > +           bbdebug 1 "OCI: umoci config --image $image_spec --co=
nfig.label $l"
> > > > > +           umoci config --image $image_spec --config.label $l
> > > > >         done
> > > > >      fi
> > > > >      if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
> > > > >         for l in ${OCI_IMAGE_ENV_VARS}; do
> > > > > -           bbdebug 1 "umoci config --image $image_name:${OCI_IMA=
GE_TAG} --config.env $l"
> > > > > -           umoci config --image $image_name:${OCI_IMAGE_TAG} --c=
onfig.env $l
> > > > > +           bbdebug 1 "umoci config --image $image_spec --config.=
env $l"
> > > > > +           umoci config --image $image_spec --config.env $l
> > > > >         done
> > > > >      fi
> > > > >      if [ -n "${OCI_IMAGE_PORTS}" ]; then
> > > > >         for l in ${OCI_IMAGE_PORTS}; do
> > > > > -           bbdebug 1 "umoci config --image $image_name:${OCI_IMA=
GE_TAG} --config.exposedports $l"
> > > > > -           umoci config --image $image_name:${OCI_IMAGE_TAG} --c=
onfig.exposedports $l
> > > > > +           bbdebug 1 "umoci config --image $image_spec --config.=
exposedports $l"
> > > > > +           umoci config --image $image_spec --config.exposedport=
s $l
> > > > >         done
> > > > >      fi
> > > > >      if [ -n "${OCI_IMAGE_RUNTIME_UID}" ]; then
> > > > > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_T=
AG}  --config.user ${OCI_IMAGE_RUNTIME_UID}"
> > > > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --confi=
g.user ${OCI_IMAGE_RUNTIME_UID}
> > > > > +       bbdebug 1 "umoci config --image $image_spec  --config.use=
r ${OCI_IMAGE_RUNTIME_UID}"
> > > > > +       umoci config --image $image_spec --config.user ${OCI_IMAG=
E_RUNTIME_UID}
> > > > >      fi
> > > > >      if [ -n "${OCI_IMAGE_WORKINGDIR}" ]; then
> > > > > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_T=
AG}  --config.workingdir ${OCI_IMAGE_WORKINGDIR}"
> > > > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --confi=
g.workingdir ${OCI_IMAGE_WORKINGDIR}
> > > > > +       bbdebug 1 "umoci config --image $image_spec  --config.wor=
kingdir ${OCI_IMAGE_WORKINGDIR}"
> > > > > +       umoci config --image $image_spec --config.workingdir ${OC=
I_IMAGE_WORKINGDIR}
> > > > >      fi
> > > > >      if [ -n "${OCI_IMAGE_STOPSIGNAL}" ]; then
> > > > > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_T=
AG}  --config.stopsignal ${OCI_IMAGE_STOPSIGNAL}"
> > > > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --confi=
g.stopsignal ${OCI_IMAGE_STOPSIGNAL}
> > > > > +       bbdebug 1 "umoci config --image $image_spec  --config.sto=
psignal ${OCI_IMAGE_STOPSIGNAL}"
> > > > > +       umoci config --image $image_spec --config.stopsignal ${OC=
I_IMAGE_STOPSIGNAL}
> > > > >      fi
> > > > >      if [ -n "${OCI_IMAGE_OS}" ]; then
> > > > > -       bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_T=
AG}  --os ${OCI_IMAGE_OS}"
> > > > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --os ${=
OCI_IMAGE_OS}
> > > > > +       bbdebug 1 "umoci config --image $image_spec  --os ${OCI_I=
MAGE_OS}"
> > > > > +       umoci config --image $image_spec --os ${OCI_IMAGE_OS}
> > > > >      fi
> > > > >
> > > > > -    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}=
  --architecture ${OCI_IMAGE_ARCH}"
> > > > > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --architec=
ture ${OCI_IMAGE_ARCH}
> > > > > +    bbdebug 1 "umoci config --image $image_spec  --architecture =
${OCI_IMAGE_ARCH}"
> > > > > +    umoci config --image $image_spec --architecture ${OCI_IMAGE_=
ARCH}
> > > > >      # NOTE: umoci doesn't currently expose setting the architect=
ure variant,
> > > > >      #       so if you need it use sloci instead
> > > > >      if [ -n "${OCI_IMAGE_SUBARCH}" ]; then
> > > > >         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH=
}, but umoci does not"
> > > > >         bbnote "     expose variants. use sloci instead if this i=
s important"
> > > > >      fi
> > > > > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.e=
ntrypoint ${OCI_IMAGE_ENTRYPOINT}
> > > > > +    umoci config --image $image_spec --config.entrypoint ${OCI_I=
MAGE_ENTRYPOINT}
> > > > >      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> > > > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --confi=
g.cmd "${OCI_IMAGE_ENTRYPOINT_ARGS}"
> > > > > +       umoci config --image $image_spec --config.cmd "${OCI_IMAG=
E_ENTRYPOINT_ARGS}"
> > > > >      fi
> > > > > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --author $=
{OCI_IMAGE_AUTHOR_EMAIL}
> > > > > +    umoci config --image $image_spec --author ${OCI_IMAGE_AUTHOR=
_EMAIL}
> > > > >
> > > > >      # make a tar version of the image direcotry
> > > > >      #  1) image_name.tar: compatible with oci tar format, blobs =
and rootfs
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#8335): https://lists.yoctoproject.org/g/meta-=
virtualization/message/8335
> > > > > Mute This Topic: https://lists.yoctoproject.org/mt/101756743/1050=
810
> > > > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > > > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization=
/unsub [bruce.ashfield@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

