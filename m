Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD12C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 13:44:50 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.10046.1644500689174433600
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Feb 2022 05:44:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UUmeccB9;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id d10so15393376eje.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Feb 2022 05:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZTA0v5nc5uNz3fDdH4WYfsmH9Parb4j9m2enB6rgayI=;
        b=UUmeccB9TNtyIGsuOn7ri9RJzTztHv4SnsL5yXEpPr59VGHdiEm0fWKHZ1SOmPD9DN
         07qrKdPa1h5geCxKmT0dWSRenbsEphf55x5WK7uuSMEXvZF3hTtEX79sK3xDnFliSZP6
         xtVcPA3RR6uYWIc08WQcSf2W7ug2Re5P3RJX4AyRo7EIXs5nVf/ZuBBLkrZsAJ6Jmef+
         9FiQfQ3tKWVkJAEbsyDSiS0EzQr+fXM3TXcNil/4u/CyxTteojaKGFMpyO8q+ujdHSg0
         gbdMl3f3Berp88HHip1mAv4VXlXoWyd1F9KHRq+fC/a2UHpih+uMK+XrI8vH0kOwtLKO
         VC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZTA0v5nc5uNz3fDdH4WYfsmH9Parb4j9m2enB6rgayI=;
        b=QqZLi5ltBShDWYPXFiI9B9GA4aGyYb4PHDU/sfJy1TaeI3CyYo29q7MSoUDRANnISt
         2Iifd7BdVew9icbDAZBdgj9lPtV4ZaP0eL3dNPYKaPhYYh94pHTiN8FVaR1TMjtc9who
         B0wtJLMJN5xT+I6BpSiKaBHbhpjCN8Gfax1HOsKU2QuVAXo/NOLzKRTHzHEy2BKYT6cm
         nJNzIHqCMT8F9tafrkSLEAlyjXcQ3aM+eaaRMVTlRB7h7JhnMHzxm2DG7LQoXuvTWvuA
         4EAxQX8lbzCTl+eEjWGyii/QTopi3Z5PU/OUNBm7LvZ9hKWnJ1MXYlBB0bHjW3Os52xb
         EZVw==
X-Gm-Message-State: AOAM531tWEm4ggjVVP3Qv511n2FuP8i5oP3BQFmPVqPvsbX2bTxBLzCB
	h7AhL1/fgDfZ0dB/BXW1jD35c92gLAH9BlULwrk=
X-Google-Smtp-Source: 
 ABdhPJwY7A/4Zg537IVVKkjG8igpkVQXMsDqVE7z4EpDE8TdykovAmyWsilR7CnRLnGaTXFDfhUU67yRINt7WDp5n6o=
X-Received: by 2002:a17:906:7294:: with SMTP id
 b20mr3048009ejl.651.1644500687485;
 Thu, 10 Feb 2022 05:44:47 -0800 (PST)
MIME-Version: 1.0
References: 
 <418a985b65f8fe5aa5d2728586d0bea68bc7181c.1644420463.git.diego.sueiro@arm.com>
 <CADkTA4NTHfQDJNmrb0AbNGLHa0OZ3Ske4J43BDtscQ=R+bvKrA@mail.gmail.com>
 <AM6PR08MB3461274BA8D92A309BEBEA6D922F9@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB3461274BA8D92A309BEBEA6D922F9@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Feb 2022 08:44:36 -0500
Message-ID: 
 <CADkTA4PimBVG8OWvTd8LcNmLm1SU+VQm3U0NVbXQzWUcQLMv8Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH honister] k3s: uprev from
 v1.21.5+k3s1 to v1.21.9+k3s1
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Feb 2022 13:44:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7059

On Thu, Feb 10, 2022 at 3:05 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> Hi Bruce,
>
> >> ---
> >>  recipes-containers/k3s/k3s_git.bb | 10 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/recipes-containers/k3s/k3s_git.bb
> >> b/recipes-containers/k3s/k3s_git.bb
> >> index bcfa959..77ad6d4 100644
> >> --- a/recipes-containers/k3s/k3s_git.bb
> >> +++ b/recipes-containers/k3s/k3s_git.bb
> >> @@ -13,10 +13,9 @@ SRC_URI =
> >"git://github.com/rancher/k3s.git;branch=release-1.21;name=k3s;protoco
> >>             file://0001-Finding-host-local-in-usr-
> >libexec.patch;patchdir=src/import \
> >>             file://k3s-killall.sh \
> >>            "
> >> -SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
> >> -SRCREV_k3s = "aa5a0a8c783a8a4475b727a04d6594c0fea09253"
> >> +SRCREV_k3s = "101917b0c493dd1effac1074feb1d5462b9a189b"
> >>
> >> -PV = "v1.21.5+k3s1"
> >> +PV = "v1.21.9+k3s1"
> >>
> >>  CNI_NETWORKING_FILES ?= "${WORKDIR}/cni-containerd-net.conf"
> >>
> >> @@ -30,7 +29,7 @@ PACKAGECONFIG[upx] = ",,upx-native"
> >>  GO_IMPORT = "import"
> >>  GO_BUILD_LDFLAGS = "-X
> >github.com/rancher/k3s/pkg/version.Version=${PV} \
> >>                      -X
> >github.com/rancher/k3s/pkg/version.GitCommit=${@d.getVar('SRCREV_k3s',
> >d, 1)[:8]} \
> >> -                    -w -s \
> >> +                    -w -s -v \
> >>                     "
> >>  BIN_PREFIX ?= "${exec_prefix}/local"
> >>
> >> @@ -40,11 +39,12 @@ REQUIRED_DISTRO_FEATURES ?= "seccomp"
> >>  do_compile() {
> >>          export
> >GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_T
> >ARGET}/${prefix}/local/go"
> >>          export CGO_ENABLED="1"
> >> -        export GOFLAGS="-mod=vendor"
> >> +        export GOFLAGS="-mod=vendor -modcacherw"
> >>
> >>          TAGS="static_build ctrd no_btrfs netcgo osusergo providerless"
> >>
> >>          cd ${S}/src/import
> >> +        ${GO} mod vendor -v && ${GO} mod tidy -v
> >
> >Unfortunately .. no, we can't take this change.
> >
> >I'm working on a full update to k3s in master, and it is running into similar
> >challenges due to the removal of vendor upstream.
> >
> Can you please elaborate a bit better what the problem is and why this solution
> is not appropriate for the honister branch?

It isn't appropriate for any branch, not just honister.

It is covered in detail on both the OE core and OE architecture mailing list
over the past year, to year and a half (with the latest being just recently).

The summary is that we can't allow go to do the fetching in the compile
phase, everything must be done in the fetch phase. And on top of that,
there is a list of requirements around the fetching for it to be correct, and
support all the OE features (offline building, licensing, reproducibility, etc).

It is probably best summarized by this recent thread:

https://lists.openembedded.org/g/openembedded-architecture/topic/88417908#1409

I'm working on a solution, and when something workable is ready, it can
be used on honister, as well as master.

Bruce

> I have no knowledge in Go both in aspects of the programming language as well
> as building.
>
> --
> Diego Sueiro
>
> >The solution isn't simple, since it is something that has to be generic, as it
> >applies to many different recipes in meta-virtualization.
> >
> >Bruce
> >
> >>          ${GO} build -tags "$TAGS" -ldflags "${GO_BUILD_LDFLAGS} -w
> >> -s" -o ./dist/artifacts/k3s ./cmd/server/main.go
> >>
> >>          # Use UPX if it is enabled (and thus exists) to compress
> >> binary
> >> --
> >> 2.35.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#7054):
> >> https://lists.yoctoproject.org/g/meta-virtualization/message/7054
> >> Mute This Topic: https://lists.yoctoproject.org/mt/89023734/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe:
> >> https://lists.yoctoproject.org/g/meta-virtualization/unsub
> >> [bruce.ashfield@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
> >
> >
> >--
> >- Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> >its end
> >- "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

