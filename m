Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA3CC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 06:28:53 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.115918.1699511326953655142
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 22:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gHtSGnKJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7a6889f33b9so19114639f.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Nov 2023 22:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699511326; x=1700116126; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Os9/rvo5OazPQLSsFaH4znRczw3ESOrnsIY5oLeP1t8=;
        b=gHtSGnKJaxGdlFovL60RbFF+iRCscXDDQ8WzRJIntIM0xirRqJ4YZ6IilgLAAfFxdX
         Wbs0zFy/pRHHPv7vh5XzAwxnGzdQ5RTgi6996EPVDcankSowHhrKLXxxYLmL5c4VBSho
         JwZCfPLb361gh5uLL5pv3QMW2G4bSMmOyGawlkreunmil5BL0T5fFWXTHFt9JFBhvr6h
         LiulgAgsP6PoQfmKCeXf3xYUJNdDa2Ns/8Yh596TW3LuuH8oMhyhiUIaYXOtTd9Hhilt
         WpK3AfTPx2cditO59F9eFxJhF5x6gY8KmFdDJ2O7lF8zmJqUsEb7hgDHO+9YDSJ/8BE7
         FHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699511326; x=1700116126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Os9/rvo5OazPQLSsFaH4znRczw3ESOrnsIY5oLeP1t8=;
        b=rYG79lBlWB//2wOKwf+FypGyt2mUmTugf3WENPu1nIDZ0lg8jlqC7s3MvufH8xOgbi
         tirpiLm8haPQP2wFIawSo1d+UlYmICYM+UmKcoxAs23zrixxRtEDKtbybrEYjP4gg0pn
         CjTVrCWRtNsA03nU9+LRM/LFsWvANGTAlQab9spPokHj4bmRxJrnf84WZBecGGCg7Shr
         PoQVwsDlL5qZsQ7TQOq2NmFhZIdBUY6dyfLa3g5v/hV805qyyh5LFdVmYvlztFH54lu4
         6mlUlu++NHzX91D4WlzMVOW7Vr5jfaUiEJgfqG9adTiQgKw6t25o+RdH+bgL1TMEpa/X
         CpYg==
X-Gm-Message-State: AOJu0Yy6k4NZZ7hmboKqPd2zTw0hsumWKGRxrs27h8HiDkfm0YEZLk0m
	C2f2tdSPu25iI8Eii0nYuCXVeg2KeOjJkZNo0OE=
X-Google-Smtp-Source: AGHT+IH4qgd4I8cHXOaUe14QaP7kH9r+4kzCNqB/9fMSto43HgU9Dc0ldmK9+mqQQScrb92NeyU3KwYXNCwxJBgfhK8=
X-Received: by 2002:a5d:94d6:0:b0:7a9:44af:ca5c with SMTP id
 y22-20020a5d94d6000000b007a944afca5cmr839305ior.12.1699511325982; Wed, 08 Nov
 2023 22:28:45 -0800 (PST)
MIME-Version: 1.0
References: <CAFMvBt3aumWLd7vzsUHEZ5TvxDkC_2Tjfa=NJVe3qkkJxYieLg@mail.gmail.com>
 <1795D1B2F2566CE7.15940@lists.yoctoproject.org>
In-Reply-To: <1795D1B2F2566CE7.15940@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 Nov 2023 01:28:34 -0500
Message-ID: <CADkTA4NtEq-1hJUkN50xjh1NYQEN_LQMzzhKqDQZUUSNWAJDyw@mail.gmail.com>
Subject: Re: [meta-virtualization] Problems building podman and buildah
To: bruce.ashfield@gmail.com
Cc: "Theodore A. Roth" <troth@openavr.org>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Nov 2023 06:28:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8451

On Wed, Nov 8, 2023 at 8:56=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Wed, Nov 8, 2023 at 6:42=E2=80=AFPM Theodore A. Roth <troth@openavr.or=
g> wrote:
> >
> > Hi,
> >
> > With the recent updates to meta-virtualization master branch for
> > podman (to 4.7.1) and buildah (to 1.32.0),
> >  our builds are breaking.
> >
> > I'm seeing the problem when building for either raspberrypi4 or qemuarm=
64.
> >
> > The podman failure appears to be due to not using the native go-md2man
> > binary when building the man pages.
> > I was able to work around this by adding the following to the
> > do_compile() and do_install() functions
> >  in the podman recipe:
> >
> >     export GOMD2MAN=3D"${RECIPE_SYSROOT_NATIVE}/usr/bin/go-md2man"
> >
>
> Argh. I have something in progress for this.
>
> It works in x86. We used to inhibit the docs for this reason, but I re-en=
abled
> them and it looks like I didn't drag all the changes forward.
>

My proposed patch for this is on master-next.

While we could use our separately build go-md2man, podman can now
build its own .. which apparently is to avoid version skew and issues with
the manpages.

I updated the build to define the host arch properly, so the build can run
the binary.

> > I'm more than happy to send a patch if that is the correct fix.
> >
> > I'm stumped on the buildah failure. Here's the error messages:
> >
> > NOTE: Executing Tasks
> > ERROR: buildah-1.32.0-r0 do_package_qa: QA Issue: Architecture did not
> > match (x86-64, expected ARM) in
> > /usr/lib/go/src/github.com/containers/buildah/internal/mkcw/embed/entry=
point
> > [arch]
> > ERROR: buildah-1.32.0-r0 do_package_qa: Fatal QA errors were found,
> > failing task.
> > ERROR: Logfile of failure stored in:
> > /home/troth/work/bedrock/bedrock-main/build-rpi4/tmp/work/cortexa7t2hf-=
neon-vfpv4-trimble-linux-gnueabi/buildah/1.32.0/temp/log.do_package_qa.1252=
786
> > ERROR: Task (/home/troth/work/bedrock/bedrock-main/build-rpi4/../oe/met=
a-virtualization/recipes-containers/buildah/buildah_git.bb:do_package_qa)
> > failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 5377 tasks of which 5353 didn't need to
> > be rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >   /home/troth/work/bedrock/bedrock-main/build-rpi4/../oe/meta-virtualiz=
ation/recipes-containers/buildah/buildah_git.bb:do_package_qa
> > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> >
> > This looks like bitbake is not using the go cross compiler to build
> > the buildah binaries.
> > Since I'm not versed in go development, I don't know how to fix or
> > work around this one.
> > Looking over the recipe and comparing it to other recipes did not
> > yield any obvious change that I could try.
> >
> > Curious if anyone else is seeing either of these issues to allow me to
> > determine if this is specific to my setup or a general problem with
> > meta-virtualization.
>

buildah has a statically linked x86 binary as an entrypoint. We aren't
building using the Makefiles, and I'm not seeing where it is used in
our common use cases.

So for now, I've removed the binary to avoid the QA issue.

I left a hint in the commit if someone wants to force it to rebuild (and
presumably they are using it). I didn't go that far, since I don't have
any way to test it.

Bruce

> They are general issues.
>
> They did pass during my integration testing, but there might be
> some interactions with OEcore that I missed.
>
> With any luck, I can have it fixed shortly.
>
> Bruce
>
> >
> > I'm building all of this using the master branches of poky,
> > meta-openembedded, meta-raspberrypi and meta-virtualization (all
> > updated from upstream git servers today).
> >
> > Can provide any other information if needed.
> >
> > Ted Roth
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8450): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8450
> Mute This Topic: https://lists.yoctoproject.org/mt/102476135/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

