Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61667C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 15:08:57 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.55229.1658329733929600589
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 08:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nPl2Ew9k;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id f11so16632662pgj.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nqo6Nl7gKihJmKUBWaK6LiLhDWALbQbvac+JqEGWNpE=;
        b=nPl2Ew9ki3u8eImjGi90/lakN3MJUEm0De6WAzc3Eoqft8DOwklMH3CyXMt6dD6fx7
         +G2MVxTQtJxh9DNYMGG0jUThORJl6tuiDPqIllOhLxHj/gX1VueyH2QUCbUu6+VY5pms
         EQVmbTx4NuIqthZYYlVhyZNf4mkVN3/e4y/L7N/9aPo9/M8z77ZUeqnYGL9QJPPS/S/a
         ZtG5k7WOcsEBBfqUhP8owAaWhSBGs/cdww7VtLe2NBbmEo31aJsc+u9/Jtks0T7Sp1Ed
         N8mnpKmnIsUltgqrJdvVU7pqZAc9zdtugYIjSJiNaI4p+grKV0ndUkefxu8Tg9Tiezf9
         q/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nqo6Nl7gKihJmKUBWaK6LiLhDWALbQbvac+JqEGWNpE=;
        b=OOM4nmPJqvr3c+caaj3/5CJCugk7s1E5vFt2Qo2mg9J2TY+ha0uRed5y2GxmxPs6FT
         WJariT//bi7JQv+DbJrAmdJVJXV1c+RQg4YEjRODknfkPAD1OcmZS2bCoTOeNg4BQMwj
         bc7mH8bOIG9rI/EjFlKYkUjGvnAtsIYddM0ll/0sUrCil1VFx5KbS2YguDSPdJBuRE/O
         f0OsnuQUebuBv2uSRPgnXVtrVRnx/JdVfENH2FgKtF1Ss+aKN1jsAPVG070/U3ORlDrg
         7TVGpEQBE6x3awiG4wYGj2gqCyzuFf7JYjD9i/W+LyVzDFEE/DrvEp/5AChlFsCySoFy
         TJYw==
X-Gm-Message-State: AJIora94qk74WC+B/z/yBDH1KZHdrvFROXhXSY+6Cpj2kGkel66u8Glu
	E0L5HofhTGsasD1lZMe+8MT1nWzLVFzVg/Z5X44=
X-Google-Smtp-Source: 
 AGRyM1siTdsw9eA8j3VY43Qv7rJXXRhNSxPOFX9nFqzypg6+APXnyvf4lcTODXb9BklQhBTDk3eM0GdBFFcWwxji9p8=
X-Received: by 2002:a63:680a:0:b0:415:aacf:d384 with SMTP id
 d10-20020a63680a000000b00415aacfd384mr34432280pgc.232.1658329733141; Wed, 20
 Jul 2022 08:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220707062949.110913-1-Qi.Chen@windriver.com>
 <20220707145724.GB40251@gmail.com>
 <CO6PR11MB56023A170143AACC074938A2ED8E9@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB56023A170143AACC074938A2ED8E9@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Jul 2022 11:08:41 -0400
Message-ID: 
 <CADkTA4Nc7aANwepjQE-g+hP11Zk46rU=CJ1-DhL0ja4mY1xZ_A@mail.gmail.com>
Subject: Re: [meta-virtualization][master][kirkstone][PATCH] containerd:
 upgrade to 1.6.6
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Jul 2022 15:08:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7471

On Tue, Jul 19, 2022 at 9:52 PM Chen, Qi <Qi.Chen@windriver.com> wrote:
>
> Hi Bruce,
>
> I just checked the commits on master-next. Hope everything is going well.
> I also found two typos in the staged commits.
>
> d73932c runc-docker: update to 1.3.3
> f21dd94 runc: update to 1.3.3
>
> The version should be '1.1.3' instead of '1.3.3'.

My scripts appear to have gotten the upgrade wrong, i fixed them manually.

As for the other upgrades, they are still under test as I'm having
some system level integration issues. But hopefully that is resolved
soon.

Bruce

>
> Regards,
> Qi
> ________________________________
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Thursday, July 7, 2022 22:57
> To: Chen, Qi <Qi.Chen@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org>
> Subject: Re: [meta-virtualization][master][kirkstone][PATCH] containerd: upgrade to 1.6.6
>
> I have a batched set of package updates pending, I've pushed
> them to master-next, with more to come in the next few days.
>
> Once I merge them to master, I'll cherry-pick the equivalent
> update to this to kirkstone.
>
> Bruce
>
> In message: [meta-virtualization][master][kirkstone][PATCH] containerd: upgrade to 1.6.6
> on 06/07/2022 Chen Qi wrote:
>
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  .../containerd/containerd-opencontainers_git.bb           | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> > index b0f92b12..c28b1510 100644
> > --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> > +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> > @@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
> >                 support as well as checkpoint and restore for cloning and live migration of containers."
> >
> >
> > -SRCREV = "d12516713c315ea9e651eb1df89cf32ff7c8137c"
> > +SRCREV = "10c12954828e7c7c9b6e0ea9b0c02b01407d3ae1"
> >  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https \
> >             file://0001-Add-build-option-GODEBUG-1.patch \
> >             file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
> > @@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
> >
> > -CONTAINERD_VERSION = "v1.6.1"
> > -CVE_VERSION = "1.6.1"
> > +CONTAINERD_VERSION = "v1.6.6"
> > +CVE_VERSION = "1.6.6"
> >
> >  EXTRA_OEMAKE += "GODEBUG=1"
> >
> > @@ -56,7 +56,7 @@ do_compile() {
> >                     metrics filters identifiers labels leases plugin server services \
> >                     cmd cio containers namespaces oci events log reaper sys rootfs nvidia seed apparmor seccomp \
> >                     cap cri userns atomic ioutil os registrar seutil runtimeoptions netns \
> > -                     shutdown schedcore tracing; do
> > +                     shutdown schedcore tracing kmutex; do
> >          if [ -d ${S}/src/import/${c} ]; then
> >            ln -sfn ${S}/src/import/${c} ${S}/src/import/vendor/github.com/containerd/containerd/${c}
> >          fi
> > --
> > 2.37.0
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7414): https://lists.yoctoproject.org/g/meta-virtualization/message/7414
> > Mute This Topic: https://lists.yoctoproject.org/mt/92223491/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

