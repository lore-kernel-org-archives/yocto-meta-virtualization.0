Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A2EC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 03:27:29 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.5351.1709090841081444332
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 19:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f958W6DO;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so4017669a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 19:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709090840; x=1709695640; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woxXiI6ML/ieW6FdSHtITmoXXwFI19zsfOO7nsPG4QU=;
        b=f958W6DOJwSOcPXJPxl8Bl8I8hN4qpcKbf/8NYZPfmB178hS2MZk7ljh0cq9Y/BKv+
         /UATWEfOdBUrUpQzq0J+trJ2e7wZ4UXNpb+EsNqRFIHnrXNsEYgouVR1XjCaaTN/Ey7M
         Q12SpeR3hN5tB/FmYMBMJKasuajxiGdYwnXnhBIe88VIlsxsjph7x/kOFDZV1DJsGP6M
         A4uyuVbOcySA6Ddn2j2EIzbcr/Gg+h7ZOQsZ3avaWce/0VHl5obue+7mXK/xyq0+yYIJ
         nlYmrZYkM/5J9IWpU3JTVANMEfnB8wJ9vO8ZMeaA4ANOVReEQ+Y98VCCOHE6Jsq8rhzk
         +Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709090840; x=1709695640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woxXiI6ML/ieW6FdSHtITmoXXwFI19zsfOO7nsPG4QU=;
        b=MWQ2nNLKiLgZoJGwhLTdGdcz71FOOjQxDf1srYniet1b9C+xrloYejfw2OICoVNggp
         2tJ9oC6bK7zHNczWsfm31JHP+H9UHI4oeI3VW/KfTRy4f419fFLh+7fnFWb9jKlVeXIo
         ZJ6Acwnbk5yl3jVC+CAYlbfMBHMeGdRtqPsAfsvoNXiKbdOcD6SxJkngU2dXLPoiitG7
         xeaoExNaDAyXj++8BSm1fzdLHbHlUSwXZ8KFC8QeYHWRbl2n1la2gW2GU/x9ypPqRCCG
         1GCtELWRhyX/bU8qFbNcLSYLkbU2895iKNFiv9anNwn0wh/1r1fFsf9lz+/YBWNS3IMO
         iM4g==
X-Gm-Message-State: AOJu0YzgpV1xuHSvOHq6O9mDHfigfMoD1Oq0m2SPFOZNH1rgxufKAxOi
	JHS7HzbB32wrVDF7SmIwmCzK1E+a7OjP3GmzkbybNfhuS1U8KlMYjT1IpyD8buj/gomPlU7A6Mp
	46I7bgidqFEa7TZRRIKOWTTzofmg=
X-Google-Smtp-Source: AGHT+IEZClaLRF/TyVnQW+saIoXgiHb5QR2HDWLBUVl8GTpBMiK3Oyk/KLPAVcV5w4ogGgTo/uxFL3o/3yp/g02R+bw=
X-Received: by 2002:a05:6a21:1f08:b0:1a0:de6e:ccf0 with SMTP id
 ry8-20020a056a211f0800b001a0de6eccf0mr3307772pzb.34.1709090840139; Tue, 27
 Feb 2024 19:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20240227051211.3390256-1-Qi.Chen@windriver.com>
 <CADkTA4MKpXktzigN7rzV6t8Zyj=+Fb45DTEdE2cQCxQUBGQ1Ng@mail.gmail.com> <3468b594-13dd-1d98-5336-19b5839449c7@windriver.com>
In-Reply-To: <3468b594-13dd-1d98-5336-19b5839449c7@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 22:27:08 -0500
Message-ID: <CADkTA4NnO7_yoNpjfb_fZjPBKFnjGdUuXuTcn+Lc5FeS4b08vA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/4] oci-image-tools: remove unneeded deps
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Feb 2024 03:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8594

On Tue, Feb 27, 2024 at 9:50=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wrot=
e:
>
> On 2/27/24 21:56, Bruce Ashfield wrote:
> > This patch is fine. I'll queue it shortly, once I work through some
> > other upgrade issues.
> >
> > Bruce
>
> Thanks Bruce.
>
> I'm also going to upgrade some go recipes in meta-virt. I will not touch
> those queued in master-next. Is there any other recipe you're working on
> or planning to work on?

I have upgrades in flight for pretty much all the packages in meta-virt,
this is the window that I do the updates. I do one early in the cycle, and
then another in the m3 timeframe. I won't take or do any more package
bumps (except for significant CVEs) until post release once I get
done with these upgrades.

So there's no need to send updates to any of those packages at this
time. If there's a package that I need help with, I tend to push it as
broken to master-next, ceph is the only remaining one like that currently
on master-next.

I've just finished up with docker-compose and will move through testing
the rest over the next few days.

>
> I found, just two days ago, that the go version in oe-core is 1.20. At
> the same time, I found oe-core has feature freezed. This would cause
> some trouble, I guess. So my initial plan was to upgrade the go recipes
> in meta-virt to the highest version that are compatible with go 1.20.

See my recent updates on master-next. I'm already taking care of the
updates, and I've managed to get some upgraded that claim they need
1.21 through some build side tweaks.

Bruce

>
> Now there are patches in mailing list to upgrade go to 1.21. Given the
> feature freeze fact, I'm not sure if the go 1.21 upgrade will make it
> into this LTS 5.0 release, especially with the dynlinking issue. I've
> also replied the email to check.
>
> Regards,
>
> Qi
>
>
> >
> > On Tue, Feb 27, 2024 at 12:12=E2=80=AFAM Chen Qi via lists.yoctoproject=
.org
> > <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
> >> From: Chen Qi <Qi.Chen@windriver.com>
> >>
> >> These deps no longer have any effect. Remove them.
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   .../oci-image-tools/oci-image-tools_git.bb               | 9 -------=
--
> >>   1 file changed, 9 deletions(-)
> >>
> >> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb=
 b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> >> index b925a2a7..ade6534d 100644
> >> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> >> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> >> @@ -3,15 +3,6 @@ SUMMARY =3D "A collection of tools for working with t=
he OCI image format specifica
> >>   LICENSE =3D "Apache-2.0"
> >>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a364313df4b21e=
f20c29e"
> >>
> >> -DEPENDS =3D "\
> >> -           oci-image-spec \
> >> -           oci-runtime-spec \
> >> -           go-digest \
> >> -           go-errors \
> >> -           spf13-cobra \
> >> -           spf13-pflag \
> >> -          "
> >> -
> >>   SRC_URI =3D "git://github.com/opencontainers/image-tools.git;branch=
=3Dmaster;protocol=3Dhttps;destsuffix=3Dgit/src/github.com/opencontainers/i=
mage-tools \
> >>              file://0001-config-make-Config.User-mapping-errors-a-warn=
ing.patch \
> >>              file://0001-tool-respect-GO-and-GOBUILDFLAGS-when-buildin=
g.patch"
> >> --
> >> 2.42.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#8586): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8586
> >> Mute This Topic: https://lists.yoctoproject.org/mt/104598180/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

