Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4224C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 13:49:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.121488.1699537749571747652
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Nov 2023 05:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=u6sNrVq0;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.43, mailfrom: troth@openavr.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso5995135e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Nov 2023 05:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1699537748; x=1700142548; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xu51XY7BZB2Jps/WpcF8gLih3qj0ji3g7/OhHKzenvs=;
        b=u6sNrVq0PYx0hcqIb1po75g6pFaNV3VfK0ODwqcd/TYuuMW/CQHQ+5fxp4dc1GIdH0
         BZbCbBaXvllnYRytwSmqfEaWWS90Y+pFvvi1koi8On6BlIylh8QmghZB2i/mESm4P6Ce
         3NAVi/ddGYqgOAJUNEOVdXzJUxr6IPJPF+Zgjj+McZO/G1oS4ndFyVALt3U69SaQjfVo
         lv7t9+LdlAol6IcIPnEJHHzimi3ioP893bVXeEO2/8n2oxctgHr03rqKL1sHKzscGLkk
         MDF78PpeHsfbEtwtRaEuzFJ8+u68Fjk/I2YlWaSJMUhHFhZrZN5EJlMF855bVi72wPsw
         qy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699537748; x=1700142548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xu51XY7BZB2Jps/WpcF8gLih3qj0ji3g7/OhHKzenvs=;
        b=DSGdipLPbv+kdzsh1e31eF8APoqIrbyrcOPS4gNemCMz6CDEBkeJRQcYCUSSpdF5hA
         z3aGYKVviPuOUGT4iCZtrOS/tcEnnGw16oYx71+SA6ceEAndtMSzbH8zJXHdnmgvlRaa
         PvXaSM7vnZxmXo4pKhPs3J9xAkIyKZNjVG8BTEHQqjbDmz5gR1WtdegxOq2s/2h43Jk4
         qMaQsL/jhszd8zLBER9usrH04Rp2FCxDx6SdBGg2RZWSGEGGGUNCfOA1u7/MHdYnG9ND
         00Q16LwARqq7gfdHtqALWSCeJ5B9Rh+mEc859wRzLDKTtvPkFG4cP93VcsTpVL7fpz+w
         BarQ==
X-Gm-Message-State: AOJu0YyGB9BWo7b/DIyq5vufxoINBt5thhaJE3eHqa2KIpQ/AmgoR6EK
	TxApmIqssWFfWjbKj43S5oU8s8RzjG1mORb+NRw2qQ==
X-Google-Smtp-Source: AGHT+IELV+YdiFBAQZfE1CCWQwY12B/spFB+1hh5gd3H7vGyfBLya7qMKBjYBm/oCw8+fPrr9/Zsk9tWWKURbWOIhm8=
X-Received: by 2002:a5d:6d85:0:b0:32f:9696:c3e8 with SMTP id
 l5-20020a5d6d85000000b0032f9696c3e8mr4002298wrs.51.1699537747540; Thu, 09 Nov
 2023 05:49:07 -0800 (PST)
MIME-Version: 1.0
References: <CAFMvBt3aumWLd7vzsUHEZ5TvxDkC_2Tjfa=NJVe3qkkJxYieLg@mail.gmail.com>
 <1795D1B2F2566CE7.15940@lists.yoctoproject.org> <CADkTA4NtEq-1hJUkN50xjh1NYQEN_LQMzzhKqDQZUUSNWAJDyw@mail.gmail.com>
In-Reply-To: <CADkTA4NtEq-1hJUkN50xjh1NYQEN_LQMzzhKqDQZUUSNWAJDyw@mail.gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Thu, 9 Nov 2023 06:48:56 -0700
Message-ID: <CAFMvBt1Hcx2=JrRmHiQLfMfkbvLXbAmngcSi4YoMBW=Y_019oA@mail.gmail.com>
Subject: Re: [meta-virtualization] Problems building podman and buildah
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Nov 2023 13:49:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8453

On Wed, Nov 8, 2023 at 11:28=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Wed, Nov 8, 2023 at 8:56=E2=80=AFPM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Wed, Nov 8, 2023 at 6:42=E2=80=AFPM Theodore A. Roth <troth@openavr.=
org> wrote:
> > >
> > > Hi,
> > >
> > > With the recent updates to meta-virtualization master branch for
> > > podman (to 4.7.1) and buildah (to 1.32.0),
> > >  our builds are breaking.
> > >
> > > I'm seeing the problem when building for either raspberrypi4 or qemua=
rm64.
> > >
> > > The podman failure appears to be due to not using the native go-md2ma=
n
> > > binary when building the man pages.
> > > I was able to work around this by adding the following to the
> > > do_compile() and do_install() functions
> > >  in the podman recipe:
> > >
> > >     export GOMD2MAN=3D"${RECIPE_SYSROOT_NATIVE}/usr/bin/go-md2man"
> > >
> >
> > Argh. I have something in progress for this.
> >
> > It works in x86. We used to inhibit the docs for this reason, but I re-=
enabled
> > them and it looks like I didn't drag all the changes forward.
> >
>
> My proposed patch for this is on master-next.
>
> While we could use our separately build go-md2man, podman can now
> build its own .. which apparently is to avoid version skew and issues wit=
h
> the manpages.
>
> I updated the build to define the host arch properly, so the build can ru=
n
> the binary.
>
> > > I'm more than happy to send a patch if that is the correct fix.
> > >
> > > I'm stumped on the buildah failure. Here's the error messages:
> > >
> > > NOTE: Executing Tasks
> > > ERROR: buildah-1.32.0-r0 do_package_qa: QA Issue: Architecture did no=
t
> > > match (x86-64, expected ARM) in
> > > /usr/lib/go/src/github.com/containers/buildah/internal/mkcw/embed/ent=
rypoint
> > > [arch]
> > > ERROR: buildah-1.32.0-r0 do_package_qa: Fatal QA errors were found,
> > > failing task.
> > > ERROR: Logfile of failure stored in:
> > > /home/troth/work/bedrock/bedrock-main/build-rpi4/tmp/work/cortexa7t2h=
f-neon-vfpv4-trimble-linux-gnueabi/buildah/1.32.0/temp/log.do_package_qa.12=
52786
> > > ERROR: Task (/home/troth/work/bedrock/bedrock-main/build-rpi4/../oe/m=
eta-virtualization/recipes-containers/buildah/buildah_git.bb:do_package_qa)
> > > failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 5377 tasks of which 5353 didn't need t=
o
> > > be rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >   /home/troth/work/bedrock/bedrock-main/build-rpi4/../oe/meta-virtual=
ization/recipes-containers/buildah/buildah_git.bb:do_package_qa
> > > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> > >
> > > This looks like bitbake is not using the go cross compiler to build
> > > the buildah binaries.
> > > Since I'm not versed in go development, I don't know how to fix or
> > > work around this one.
> > > Looking over the recipe and comparing it to other recipes did not
> > > yield any obvious change that I could try.
> > >
> > > Curious if anyone else is seeing either of these issues to allow me t=
o
> > > determine if this is specific to my setup or a general problem with
> > > meta-virtualization.
> >
>
> buildah has a statically linked x86 binary as an entrypoint. We aren't
> building using the Makefiles, and I'm not seeing where it is used in
> our common use cases.
>
> So for now, I've removed the binary to avoid the QA issue.
>
> I left a hint in the commit if someone wants to force it to rebuild (and
> presumably they are using it). I didn't go that far, since I don't have
> any way to test it.
>
> Bruce

Thanks for the quick fix Bruce!

Tested your master-next fixes both on my workstation and on our CI
system. Builds are no longer failing.

Ted Roth

>
> > They are general issues.
> >
> > They did pass during my integration testing, but there might be
> > some interactions with OEcore that I missed.
> >
> > With any luck, I can have it fixed shortly.
> >
> > Bruce
> >
> > >
> > > I'm building all of this using the master branches of poky,
> > > meta-openembedded, meta-raspberrypi and meta-virtualization (all
> > > updated from upstream git servers today).
> > >
> > > Can provide any other information if needed.
> > >
> > > Ted Roth
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8450): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8450
> > Mute This Topic: https://lists.yoctoproject.org/mt/102476135/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave=
/6693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

