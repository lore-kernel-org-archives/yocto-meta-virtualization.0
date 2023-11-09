Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56E4C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 01:56:41 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.112625.1699495000684635631
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 17:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N+DRwMmi;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3576e74ae9dso1592945ab.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Nov 2023 17:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699495000; x=1700099800; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwVagHBOBKBNZuMRB5qi1x5l68usYlLoNu4mT+TB8M8=;
        b=N+DRwMmixj8bc6jqokuAgDPdthNhCZGulEFa58Rrwxyb0EUtdwqRTMmPi8pkXnUSkM
         T27ObFIoIppQ8jP9BzBKA1JuXTnj5FkUa7pEra/05H8Z961hRv6hXwvRRhlXTGzgvB9j
         UWjC8bIhq8yURuqPq9RBRYBL0ro0IPOhQIQGM7XngeIPh0VOAh4KB/SnMmUU86hqivb0
         fko2cIDK8/MLFTykYr4EpIiun0WkOjPV3wpuwKOrTp1cYKGxRtNTu1P9SJs17gklexZT
         CIeTC9NpKoHtBSDrFTi7IhD9gnvVBgzcAQOUjgDR+ftJCLvxoBdkk6ffUSEmEn6ePLpc
         +Iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699495000; x=1700099800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwVagHBOBKBNZuMRB5qi1x5l68usYlLoNu4mT+TB8M8=;
        b=gp5AuboEbSwQdvVN7TxavKckFunt9O1cjhvCS/5scbCAPRCUZd51u0HkG8VVAdJnU4
         +SdvtfrFCNriGnaIPjCaWWzEJ3g0XyVOr16IFQSInQ/5wysdWrcP/fePRcMGGw86KjRH
         jnoRGjcFrNFgrDF7EXgf9p2xMmNBDEvvlRjfDHKftgOgdCnsbuLopgZJdLfbcPNHzyN2
         JvfmuqvteZeRr8RaNbhLFBYWmNsOv92z7b3oBD9h+ieyd+wplGX1TkWkjvfHNFPP1xW9
         b1ND7pCrmyAYM8pcw2AgB163OQlpT8Cj9iVhLVguFU/MEZA1H8GlqE0walIEiOA8+eNx
         7udQ==
X-Gm-Message-State: AOJu0YxYQq0lFRNgee0inrG45DuDmPrCAyVuvZW8wSBFkgkWatwyJVna
	o5GOolVo/PtEWQmIY97NJ3yPffjpDE6LM16Ry6M=
X-Google-Smtp-Source: AGHT+IEpEcoZ1WeTH5P3P3QWHGO3RtFRVJnRNo8NJ0bAhV8MsPOFsbWWEb2ogto0TEnj5ZDiaO4SkXezN+OqTmRq9KM=
X-Received: by 2002:a05:6e02:1d11:b0:359:7739:6229 with SMTP id
 i17-20020a056e021d1100b0035977396229mr4067466ila.24.1699494999709; Wed, 08
 Nov 2023 17:56:39 -0800 (PST)
MIME-Version: 1.0
References: <CAFMvBt3aumWLd7vzsUHEZ5TvxDkC_2Tjfa=NJVe3qkkJxYieLg@mail.gmail.com>
In-Reply-To: <CAFMvBt3aumWLd7vzsUHEZ5TvxDkC_2Tjfa=NJVe3qkkJxYieLg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 8 Nov 2023 20:56:28 -0500
Message-ID: <CADkTA4OoJwX-zUzWZQa=5oD8o=7M35iP1sJOuiJ1T3F4k0gycg@mail.gmail.com>
Subject: Re: [meta-virtualization] Problems building podman and buildah
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Nov 2023 01:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8450

On Wed, Nov 8, 2023 at 6:42=E2=80=AFPM Theodore A. Roth <troth@openavr.org>=
 wrote:
>
> Hi,
>
> With the recent updates to meta-virtualization master branch for
> podman (to 4.7.1) and buildah (to 1.32.0),
>  our builds are breaking.
>
> I'm seeing the problem when building for either raspberrypi4 or qemuarm64=
.
>
> The podman failure appears to be due to not using the native go-md2man
> binary when building the man pages.
> I was able to work around this by adding the following to the
> do_compile() and do_install() functions
>  in the podman recipe:
>
>     export GOMD2MAN=3D"${RECIPE_SYSROOT_NATIVE}/usr/bin/go-md2man"
>

Argh. I have something in progress for this.

It works in x86. We used to inhibit the docs for this reason, but I re-enab=
led
them and it looks like I didn't drag all the changes forward.

> I'm more than happy to send a patch if that is the correct fix.
>
> I'm stumped on the buildah failure. Here's the error messages:
>
> NOTE: Executing Tasks
> ERROR: buildah-1.32.0-r0 do_package_qa: QA Issue: Architecture did not
> match (x86-64, expected ARM) in
> /usr/lib/go/src/github.com/containers/buildah/internal/mkcw/embed/entrypo=
int
> [arch]
> ERROR: buildah-1.32.0-r0 do_package_qa: Fatal QA errors were found,
> failing task.
> ERROR: Logfile of failure stored in:
> /home/troth/work/bedrock/bedrock-main/build-rpi4/tmp/work/cortexa7t2hf-ne=
on-vfpv4-trimble-linux-gnueabi/buildah/1.32.0/temp/log.do_package_qa.125278=
6
> ERROR: Task (/home/troth/work/bedrock/bedrock-main/build-rpi4/../oe/meta-=
virtualization/recipes-containers/buildah/buildah_git.bb:do_package_qa)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 5377 tasks of which 5353 didn't need to
> be rerun and 1 failed.
>
> Summary: 1 task failed:
>   /home/troth/work/bedrock/bedrock-main/build-rpi4/../oe/meta-virtualizat=
ion/recipes-containers/buildah/buildah_git.bb:do_package_qa
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
>
> This looks like bitbake is not using the go cross compiler to build
> the buildah binaries.
> Since I'm not versed in go development, I don't know how to fix or
> work around this one.
> Looking over the recipe and comparing it to other recipes did not
> yield any obvious change that I could try.
>
> Curious if anyone else is seeing either of these issues to allow me to
> determine if this is specific to my setup or a general problem with
> meta-virtualization.

They are general issues.

They did pass during my integration testing, but there might be
some interactions with OEcore that I missed.

With any luck, I can have it fixed shortly.

Bruce

>
> I'm building all of this using the master branches of poky,
> meta-openembedded, meta-raspberrypi and meta-virtualization (all
> updated from upstream git servers today).
>
> Can provide any other information if needed.
>
> Ted Roth
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8449): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8449
> Mute This Topic: https://lists.yoctoproject.org/mt/102476135/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

