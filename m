Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52161CDB482
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 18:16:32 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.134778.1697480185922103728
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 11:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyoLE8tX;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7a2a9e5451bso187278639f.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 11:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697480185; x=1698084985; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VVlN+bDGrpG7/agqIBFD+cj/VQzsO6U8H5GR/xyUPY=;
        b=gyoLE8tXsc0mNex+r8bmobTfzVY4yD7afRIxRzMxRgotKO5JzADaMxaH+MHT53FoUf
         B4+ufSh5LO73KBtw8F9UntGZ66VVtpyJYGgOHk/c/Yz1mdAPYVMbhqmWT3nBmWLoGDhQ
         n3ehGF/7m43PjSmphVhTLiQKxyUqQsI3Gmt1GiB/FNxQdUZYAU5s/4eMbDgvmVcCuJCA
         G2ugdTWoh0f/5c8YOVUwcxKEUmfmK1YXKZ4vEsiiC7rwemoZTBH8cso9p23w1VPLAg5r
         2ulFDmoJHg2VPXD8CYQuncvnu8oEcpFNb0z0EDScJVcT/Qubqlh3wak11L4lHksTQvfR
         5fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697480185; x=1698084985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VVlN+bDGrpG7/agqIBFD+cj/VQzsO6U8H5GR/xyUPY=;
        b=afxf7xXUeARoHU9lA7hWQhbHKCKY+9KnYRJ0uM/hb1NgFjD+HWccdyP16A7nlemfJi
         rlWqVKlluIktX9PY+O/PxyW4JqVeCbcGqTbBihillxtAJjJcq4BeJws0mZ95n+05ej+L
         TbLolwaeeGSSl+wxzEEKsu6JtDFA8dfIuBlNsL06uk11YetJRi74VYHdNvyEVeMaVeaL
         Fx+A1858ZFSNLBCmdHX6PnML3b/r7J4NARDF3PXyu+2eZ7NzZISmlHVOlt4Z5KpU+FHL
         oS4eKlFmVPEedSL4p+oIKUYb6lKm7wKmBe3nmIIS97hRRIRVSRKWFkRAd36Fi34nYReU
         fkbQ==
X-Gm-Message-State: AOJu0YxJXQeZTwfFsaBM1SSKR69nsJJ2A0nN+fIcBPy0RTTCjrH3+5mB
	MbRy1aXiiCnLgvUCaKm9NhnhNKwR9w6Ecch7Th8=
X-Google-Smtp-Source: AGHT+IH/GKhNfZBo/CDdXJcuMq32Dd6MtgGFCw6fZUm+BdyiimLG0IdE1TXbWGDmBQItR24ZVEeT0UUbjCiI5/2ou/A=
X-Received: by 2002:a6b:d81a:0:b0:792:82f8:749d with SMTP id
 y26-20020a6bd81a000000b0079282f8749dmr42355740iob.10.1697480185025; Mon, 16
 Oct 2023 11:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231012162548.329780-1-JPEWhacker@gmail.com> <20231013153807.906542-1-JPEWhacker@gmail.com>
 <CADkTA4O-9_7c6iKoHP_vfDhfojqoY19VHK5p_kt7Ktybm1s2_w@mail.gmail.com>
 <CAJdd5GYtQci3+sk3J1HGL8fMvJob=KW7o6TdqABCU6G-=_j7hA@mail.gmail.com> <178DC83238988A4B.8679@lists.yoctoproject.org>
In-Reply-To: <178DC83238988A4B.8679@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2023 14:16:28 -0400
Message-ID: <CADkTA4OCAzhASkMv0umKOgqNc9bbaMZV5cjaVko7S_oQ1OE9Ag@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci-umoci: Handle
 mutliple entrypoint arguments
To: bruce.ashfield@gmail.com
Cc: Joshua Watt <jpewhacker@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 18:16:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8370

On Fri, Oct 13, 2023 at 5:32=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Fri, Oct 13, 2023 at 3:32=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com=
> wrote:
> >
> > On Fri, Oct 13, 2023 at 10:58=E2=80=AFAM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Fri, Oct 13, 2023 at 11:38=E2=80=AFAM Joshua Watt <JPEWhacker@gmai=
l.com> wrote:
> > > >
> > > > The entrypoint to a container is actually an array of the executabl=
e to
> > > > run and the arguments to pass to it. It is useful to be able to spe=
cify
> > > > the entire list as the entrypoint when creating containers so that
> > > > then entrypoint can be encoded with argument, e.g.
> > > >
> > > >     ENTRYPOINT ["/usr/bin/python3", "my-script"]
> > > >
> > > > The current way that image-oci-umoci.bbclass handles this is equiva=
lent
> > > > to:
> > > >
> > > >     ENTRYPOINT ["/usr/bin/python3"]
> > > >     CMD ["my-script"]
> > > >
> > > > But this is undesirable as it means if the user passes arguments wh=
en
> > > > running the container, it will override the "my-script" argument an=
d the
> > > > arguments will instead get passed to the python interpreter, which =
may
> > > > not be desired.
> > > >
> > > > Instead, pass all the entry point arguments to umoci in a single
> > > > invocation using multiple --config.entrypoint arguments, which corr=
ectly
> > > > make the list as described above. The entire ENTRYPOINT list will s=
tart
> > > > with OCI_IMAGE_ENTRYPOINT, then have OCI_IMAGE_ENRTYPOINT_ARGS spli=
t by
> > > > spaces concatenated after it.
> > > >
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >  classes/image-oci-umoci.inc | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.=
inc
> > > > index 58e4668..245dae5 100644
> > > > --- a/classes/image-oci-umoci.inc
> > > > +++ b/classes/image-oci-umoci.inc
> > > > @@ -99,10 +99,10 @@ IMAGE_CMD:oci() {
> > > >         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH},=
 but umoci does not"
> > > >         bbnote "     expose variants. use sloci instead if this is =
important"
> > > >      fi
> > > > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.ent=
rypoint ${OCI_IMAGE_ENTRYPOINT}
> > > > -    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> > > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.=
cmd "${OCI_IMAGE_ENTRYPOINT_ARGS}"
> > > > -    fi
> > > > +    umoci config --image $image_name:${OCI_IMAGE_TAG} \
> > > > +       --config.entrypoint "${OCI_IMAGE_ENTRYPOINT}" \
> > > > +       ${@" ".join("--config.entrypoint %s" % s for s in d.getVar(=
"OCI_IMAGE_ENTRYPOINT_ARGS").split())}
> > > > +
> > >
> > >
> > > This is super close to what I badly tried to describe. I realize I co=
uld have
> > >  just done a patch to be clear, but it was a bit late and I just
> > > wanted to get something out.
> > >
> > > Do you think something like the following would meet your use case :
> > >
> > > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.in=
c
> > > index 58e4668..0d6c712 100644
> > > --- a/classes/image-oci-umoci.inc
> > > +++ b/classes/image-oci-umoci.inc
> > > @@ -99,9 +99,10 @@ IMAGE_CMD:oci() {
> > >         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH},
> > > but umoci does not"
> > >         bbnote "     expose variants. use sloci instead if this is im=
portant"
> > >      fi
> > > -    umoci config --image $image_name:${OCI_IMAGE_TAG}
> > > --config.entrypoint ${OCI_IMAGE_ENTRYPOINT}
> > > +    umoci config --image $image_name:${OCI_IMAGE_TAG} \
> > > +         ${@" ".join("--config.entrypoint %s" % s for s in
> > > d.getVar("OCI_IMAGE_ENTRYPOINT").split())}
> > >      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> > > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cm=
d
> > > "${OCI_IMAGE_ENTRYPOINT_ARGS}"
> > > +       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@"
> > > ".join("--config.cmd %s" % s for s in
> > > d.getVar("OCI_IMAGE_ENTRYPOINT_ARGS").split())}
> > >      fi
> > >
> > > That way you aren't forced to split your multi argument entrypoint
> > > over two variables, and
> > > we can still have arguments in that ARGS variable available to be
> > > clobbered on container
> > > start, etc.
> > >
> > > I realize this is probably where you would have started if not for
> > > concerns about backward compatibility, etc.
> > > But looking at it more, it is easier to just convert both variables t=
o
> > > the repeated call to umoci. We are
> > > leaving the variables themselves the same with space separated
> > > arguments/entrypoint, so that is enough
> > > backward compatibility for me.
> >
> > Ah, yes. That is even better.
> >
> > I like how you can set both entrypoint and command as lists this way.
>
> I can make the commit here, and add your signed-off-by, since we can
> take your reply as you being ok with this change, derived from your
> patches.
>

My version of this is on master-next. I passed creation and skopeo copy
to dockerhub, pull and run, so it appears to be sane :)

Bruce

> Bruce
>
> >
> > >
> > > Bruce
> > >
> > >
> > > >
> > > >      umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${O=
CI_IMAGE_AUTHOR_EMAIL}
> > > >
> > > >      # make a tar version of the image direcotry
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8365): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8365
> Mute This Topic: https://lists.yoctoproject.org/mt/101942798/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

