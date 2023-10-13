Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FA6CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:32:33 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.50732.1697232752446275719
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 14:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/o6MkbB;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-79fa891b645so94615939f.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 14:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697232751; x=1697837551; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayY3SaREbglO1FT2aVpkcvID4VZP03Dyja8VDs63DTk=;
        b=V/o6MkbBJ8iyHMeDwR5W3T5i60Q0iUkj5njdLdt6NmfOUnBrAGbqfc56P44C+NgpwK
         +m2US7tvfe3jLgYJne0GuMY+boO7t+962203HJWIVYZvqlKQ/NGN8c+hMaaMPwmuHDzJ
         saDzHCGvZCde8WAsyPWjv2A6bOkyLH8st37ZsXtA/mRH4lTwOjZbPUhDdUb/V5I/i55t
         gQbrTvms3ajbz3UIETFYVqBlCGeuXNjZX2JJxOMrFGg2MRyW+i0xrRU09QZhXZO0xxEi
         /G3TrIdjDUQAgc95sw7sS7TVMBfNUZJ37tczcThNtc0decRr89zr2X+kffZI2V0T0dhQ
         pAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697232751; x=1697837551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayY3SaREbglO1FT2aVpkcvID4VZP03Dyja8VDs63DTk=;
        b=fjcidEYs6OAKeljs6e5mJ7fmsEK1LUNuZJc/sw25+HrNTaKPKAGDkdmc0xMjfll4i3
         kJ4Ypq3CeOUao10TPD7IXe4meQVjlEC7VByBvZHabjfWeJnw62+VTHkY6LcCHXQAsdVy
         eZKitPY42PxSS2H+k3uR0ZjrKrwhBv1lFJCZ4id2ggqOwN7NdgZvFb1nyn8d6AXVvOkG
         oHMkcCLo3o70S6noIDmr4AIU9Ixmr1y/xrx5ualvaKXoihgX0mDKIPWWeEHrgJuOrUx2
         Hl9CQLWcAjadolxVUPPLCatppXRavUx0Pb5dA644GA/useBCnyXgSLbNPyYlc1p3f8pm
         j3fw==
X-Gm-Message-State: AOJu0YyFxT/BGU9pj3DhsjqH2cifoZvv8DDovTY45OTWvFfE+7RuEajO
	VNMy4Ut4UtaIE2udQoh0AjsZQGJ0HiNUZqYaHCs=
X-Google-Smtp-Source: AGHT+IGTGKe0gdd2hX+EHo0uzhPuwol555RsDDBIGWP5vJGnNcRL3o8KsDNdn2d+gImMXikjj20XdWBQFIo2G6g2CQs=
X-Received: by 2002:a5e:c24d:0:b0:79f:e9ac:f60a with SMTP id
 w13-20020a5ec24d000000b0079fe9acf60amr30349163iop.20.1697232751476; Fri, 13
 Oct 2023 14:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231012162548.329780-1-JPEWhacker@gmail.com> <20231013153807.906542-1-JPEWhacker@gmail.com>
 <CADkTA4O-9_7c6iKoHP_vfDhfojqoY19VHK5p_kt7Ktybm1s2_w@mail.gmail.com> <CAJdd5GYtQci3+sk3J1HGL8fMvJob=KW7o6TdqABCU6G-=_j7hA@mail.gmail.com>
In-Reply-To: <CAJdd5GYtQci3+sk3J1HGL8fMvJob=KW7o6TdqABCU6G-=_j7hA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Oct 2023 17:32:19 -0400
Message-ID: <CADkTA4OfQqJAFcJW4+mNV18gU_Nr1qQgpB9h8H39Zp7ZO5-pTQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci-umoci: Handle
 mutliple entrypoint arguments
To: Joshua Watt <jpewhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 21:32:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8365

On Fri, Oct 13, 2023 at 3:32=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> On Fri, Oct 13, 2023 at 10:58=E2=80=AFAM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > On Fri, Oct 13, 2023 at 11:38=E2=80=AFAM Joshua Watt <JPEWhacker@gmail.=
com> wrote:
> > >
> > > The entrypoint to a container is actually an array of the executable =
to
> > > run and the arguments to pass to it. It is useful to be able to speci=
fy
> > > the entire list as the entrypoint when creating containers so that
> > > then entrypoint can be encoded with argument, e.g.
> > >
> > >     ENTRYPOINT ["/usr/bin/python3", "my-script"]
> > >
> > > The current way that image-oci-umoci.bbclass handles this is equivale=
nt
> > > to:
> > >
> > >     ENTRYPOINT ["/usr/bin/python3"]
> > >     CMD ["my-script"]
> > >
> > > But this is undesirable as it means if the user passes arguments when
> > > running the container, it will override the "my-script" argument and =
the
> > > arguments will instead get passed to the python interpreter, which ma=
y
> > > not be desired.
> > >
> > > Instead, pass all the entry point arguments to umoci in a single
> > > invocation using multiple --config.entrypoint arguments, which correc=
tly
> > > make the list as described above. The entire ENTRYPOINT list will sta=
rt
> > > with OCI_IMAGE_ENTRYPOINT, then have OCI_IMAGE_ENRTYPOINT_ARGS split =
by
> > > spaces concatenated after it.
> > >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  classes/image-oci-umoci.inc | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.in=
c
> > > index 58e4668..245dae5 100644
> > > --- a/classes/image-oci-umoci.inc
> > > +++ b/classes/image-oci-umoci.inc
> > > @@ -99,10 +99,10 @@ IMAGE_CMD:oci() {
> > >         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, b=
ut umoci does not"
> > >         bbnote "     expose variants. use sloci instead if this is im=
portant"
> > >      fi
> > > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entry=
point ${OCI_IMAGE_ENTRYPOINT}
> > > -    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cm=
d "${OCI_IMAGE_ENTRYPOINT_ARGS}"
> > > -    fi
> > > +    umoci config --image $image_name:${OCI_IMAGE_TAG} \
> > > +       --config.entrypoint "${OCI_IMAGE_ENTRYPOINT}" \
> > > +       ${@" ".join("--config.entrypoint %s" % s for s in d.getVar("O=
CI_IMAGE_ENTRYPOINT_ARGS").split())}
> > > +
> >
> >
> > This is super close to what I badly tried to describe. I realize I coul=
d have
> >  just done a patch to be clear, but it was a bit late and I just
> > wanted to get something out.
> >
> > Do you think something like the following would meet your use case :
> >
> > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> > index 58e4668..0d6c712 100644
> > --- a/classes/image-oci-umoci.inc
> > +++ b/classes/image-oci-umoci.inc
> > @@ -99,9 +99,10 @@ IMAGE_CMD:oci() {
> >         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH},
> > but umoci does not"
> >         bbnote "     expose variants. use sloci instead if this is impo=
rtant"
> >      fi
> > -    umoci config --image $image_name:${OCI_IMAGE_TAG}
> > --config.entrypoint ${OCI_IMAGE_ENTRYPOINT}
> > +    umoci config --image $image_name:${OCI_IMAGE_TAG} \
> > +         ${@" ".join("--config.entrypoint %s" % s for s in
> > d.getVar("OCI_IMAGE_ENTRYPOINT").split())}
> >      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd
> > "${OCI_IMAGE_ENTRYPOINT_ARGS}"
> > +       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@"
> > ".join("--config.cmd %s" % s for s in
> > d.getVar("OCI_IMAGE_ENTRYPOINT_ARGS").split())}
> >      fi
> >
> > That way you aren't forced to split your multi argument entrypoint
> > over two variables, and
> > we can still have arguments in that ARGS variable available to be
> > clobbered on container
> > start, etc.
> >
> > I realize this is probably where you would have started if not for
> > concerns about backward compatibility, etc.
> > But looking at it more, it is easier to just convert both variables to
> > the repeated call to umoci. We are
> > leaving the variables themselves the same with space separated
> > arguments/entrypoint, so that is enough
> > backward compatibility for me.
>
> Ah, yes. That is even better.
>
> I like how you can set both entrypoint and command as lists this way.

I can make the commit here, and add your signed-off-by, since we can
take your reply as you being ok with this change, derived from your
patches.

Bruce

>
> >
> > Bruce
> >
> >
> > >
> > >      umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI=
_IMAGE_AUTHOR_EMAIL}
> > >
> > >      # make a tar version of the image direcotry
> > > --
> > > 2.34.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#8362): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/8362
> > > Mute This Topic: https://lists.yoctoproject.org/mt/101942798/1050810
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



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

