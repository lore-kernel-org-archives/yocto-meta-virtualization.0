Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA3BCF8550
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 01:32:50 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1949.1727919168393634092
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 18:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXAUWo8A;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b7463dd89so3773185ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Oct 2024 18:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727919168; x=1728523968; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9YLbviE7/p4xw+u7LJX01mxkwd3XgFm1XorbrmoT9g=;
        b=jXAUWo8A2BFDsarb22HX2a61ROsLteb2uHOXnweEAsq1lqxwJOG4QQzLEv6ce8k00G
         TZsBcaOmmQrFJ7/NwSCD6Vm1zbChPwt23fXPT27h5ZENVHrUuL2DhT8AZXmjkq7SCmz7
         EZbaFjmjSdv5moe+c+W3HtiWKRl0z7mJIINCLimCiWqM4JYod8gYqdMRA/kQmS4gv1Vk
         ZSemZeyNU8Jl/FOANAtEwmEiTkBPZRbKzha9PzpVE0Ez6CrFhAAmmePsN5WLWruNYxFv
         dBL6hIaevq+ive0K7cC5wjSpNQSv9HwgzlIldQuqu57D4xDcqfmO3P3pkDWTqLJQJFB3
         KF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727919168; x=1728523968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9YLbviE7/p4xw+u7LJX01mxkwd3XgFm1XorbrmoT9g=;
        b=lwRhBarxJ8hocKnxgW114bErEhbBoLAgL7XSiYoP/wtaekwZfv5ix3NZ2a1Z5HUQ25
         DYqbg5tV+O8I2mCKOQUobWBpzhL+1adzbGoy22g0Dq/X0Og0NmhMgnq5wyS7r3BERskY
         G7LBHcERsGNRqFbEZVB2n9YPBqQQRrbTOD5dXkZW2TKH4EeeU9LlqOULJjU67eFxRS02
         q9EAAlFj/eT3z85S89bqPEe9ARrJ38DB0XOtbq3szpD4R2CLFiiB0GJRtTuuebIhGHLb
         QKkCpx0ya/qJg9vawUSq7EPax+Do8/uYfC7Z0gQq6N9vsS6lcJeOVpnuRDuyUpU4yZa4
         LDyA==
X-Forwarded-Encrypted: i=1; AJvYcCU5uuVQX+ddFMlrELhMEuhVwjccLUG45Eqw/iGzFJ3xUGloqHBaFDnLfyvPmPCAVOMT3ktNeIeECpK3oyYdZV1cnAkZ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzUX+nxwrrlGWlkUQvz2KrO0KLW3rp03SADdgG4873woqjhhdUg
	YzdWGfbi4H4yCPJLfO/rRXtAORNq7HvMHgjA5bGdXBShdiymxD7UgM9I4P93bWprGvzMANhsaKa
	VTvsm7/wn1zmsFWcUks6y6BWP4YU=
X-Google-Smtp-Source: AGHT+IFtK4oTGlrFfpnKDlkeRwAAcywl5a7ManQOW87RfVCG9FxMZ2Fqs38KjpC7Jrh+vhRch/D4rWfi5V43iM8n14c=
X-Received: by 2002:a17:902:ce87:b0:20b:9fa3:233c with SMTP id
 d9443c01a7336-20bc5a6a4c2mr67541655ad.40.1727919167598; Wed, 02 Oct 2024
 18:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <1727908743-22316-1-git-send-email-mark.hatle@kernel.crashing.org> <DB5PR02MB10213ED534518A5071B926B9BEF712@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213ED534518A5071B926B9BEF712@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Oct 2024 21:32:35 -0400
Message-ID: <CADkTA4NbCi7Gme=KcMbRh2jjdhAGwh9ipkWtUW4rCT+pvEfehw@mail.gmail.com>
Subject: Re: [meta-virtualization][scarthgap][PATCH] linux-yocto_virtualization.inc:
 If using externalsrc adjust dependency
To: peter.kjellerstedt@axis.com
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 03 Oct 2024 01:32:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8915

On Wed, Oct 2, 2024 at 9:11=E2=80=AFPM Peter Kjellerstedt via
lists.yoctoproject.org
<peter.kjellerstedt=3Daxis.com@lists.yoctoproject.org> wrote:
>
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@l=
ists.yoctoproject.org> On Behalf Of Mark Hatle
> > Sent: den 3 oktober 2024 00:39
> > To: meta-virtualization@lists.yoctoproject.org
> > Subject: [meta-virtualization][scarthgap][PATCH] linux-yocto_virtualiza=
tion.inc: If using externalsrc adjust dependency
> >
> > From: Mark Hatle <mark.hatle@amd.com>
> >
> > When using externalsrc, the system will disable a number of tasks such =
as
> > do_validate_branches, do_unpack and do_patch.  The do_kernel_metadata t=
ask
> > is configured to run after do_validate_branches do_unpack and before
> > do_patch.  Since all of these have been removed, the task will never
> > run.
> >
> > The do_kernel_metadata task is responsible for populating the
> > recipe-sysroot-native/kcfg directory via it's own dependency to
> > yocto-cfg-fragments-native:do_populate_sysroot.
> >
> > Without do_kernel_metadata running, do_kernel_configme will fail to run
> > with errors like:
> >   ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Feature '../recip=
e-sysroot-native/kcfg/cfg/virtio.scc' not found, this will cause configurat=
ion failures.
> >   ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Check the SRC_URI=
 for meta-data repositories or directories that may be missing
> >   ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Set KERNEL_DANGLI=
NG_FEATURES_WARN_ONLY to ignore this issue
> >
> > Fix this issue by detecting if we're running with externalsrc, and then
> > adding the task do_kernel_metadata (from the current recipe) as a
> > dependency of do_kernel_configme.
> >
> > To reproduce th original issue:
> >
> >   $ . ./oe-initbuild-env
> >   $ bitbake linux-yocto -c patch
> >   $ cp -r tmp/work-shared/<machine>/kernel-source linux-yocto
> >
> >   edit the conf/local.conf adding:
> >   DISTRO_FEATURES:append =3D " virtualization"
> >   INHERIT +=3D "externalsrc"
> >   EXTERNALSRC:pn-linux-yocto =3D "${TOPDIR}/linux-yocto"
> >
> >   $ rm -rf tmp
> >   $ bitbake linux-yocto -c menuconfig
> >
> > Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > ---
> >  recipes-kernel/linux/linux-yocto_virtualization.inc | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/reci=
pes-kernel/linux/linux-yocto_virtualization.inc
> > index 9a6554d..f0ec80c 100644
> > --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> > +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> > @@ -49,6 +49,12 @@ KERNEL_FEATURES:append =3D " ${KERNEL_CACHE_FEATURES=
}"
> >  # features can be enabled via the fragments
> >  do_kernel_metadata[depends] +=3D "${@['', 'yocto-cfg-fragments-native:=
do_populate_sysroot'][(bb.data.inherits_class('kernel-yocto', d))]}"
> >
> > +# if externalsrc is enabled, do_kernel_metadata dependency on
> > +# yocto-cfg-fragments-native won't be run to populate
> > +# recipe-sysroot-native/kcfg because do_patch is not run.  Manully add
>
> Typo: Manully -> Manually

I'll fix this on the way into the tree.

>
> > +# the dependency to do_kernel_configme for this special case
> > +do_kernel_configme[depends] +=3D "${@['', d.getVar('PN') + ':do_kernel=
_metadata'][(bb.data.inherits_class('externalsrc', d))]}"
>
> This can be written more readable as:
>
> do_kernel_configme[depends] +=3D "${@d.getVar('PN') + ':do_kernel_metadat=
a' if bb.data.inherits_class('externalsrc', d) else ''}"
>

I agree that the index-style of conditionals is a bit strange, but for
now, I'm going to
go with consistency in the file, and will make a note to revisit this
in a month or so
(once I've released meta-virt).

Thanks for the review Peter, it is most appreciated.

Bruce

> > +
> >  # xen kernel support
> >  # SRC_URI +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file:=
//xen.scc', '', d)}"
> >  KERNEL_FEATURES:append =3D "${@distro_cond_feature('cfg/xen.scc', 'xen=
', d)}"
> > --
> > 2.34.1
>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8913): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8913
> Mute This Topic: https://lists.yoctoproject.org/mt/108789783/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

