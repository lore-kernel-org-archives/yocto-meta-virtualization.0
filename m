Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BFAC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 18:21:37 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.349.1642616496524344174
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 10:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g2dj7vOx;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id z22so17103192edd.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 10:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QKoSURWbPzNSITuITczZ4iOL0BUs97XqDzciECmacNI=;
        b=g2dj7vOxIQ9QAGcXHNKj7P/eo+pILtWrheOjcePKK6H32K+icZfaeHtXO2T9EAKmhn
         M0IdSqD9i+IiyY+6Tyk3bxDLZQFC78D02s2RSankMkPBtDcHXH93W8Yxr2zAIt0QIrrX
         1h+HboaZAinw232bunIFtgQaEI1ru7N3Kiw3sklEcmRhIj6QTvp593rFZcahz2cPb9ge
         BQFwuTsuVts6vkApGZ4SP9PlpK/TBGmESoPAqlw/cbFT/yFqzAJJq8Du4/etvIjGJv/O
         gWLGwj7Tkr7cibXVruPwgVjXJGhGG/XwrTChiKa7yxxptGWgpHiGGJoYZKQuSkyTQqi3
         71CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QKoSURWbPzNSITuITczZ4iOL0BUs97XqDzciECmacNI=;
        b=EtCAzAbUi77S81psdqU6KsrhFVMd+DrPKYJMza5KcOWUVTF1gpCqpSecEXEcHiYW4Y
         fShOSegl4RjzwAg8Ax3l7E5tdWYhxxYj6cJt1TNwkI/Qj4mO+bRRRLgEIX/Iz7XgLdug
         kPmH0i1nCPP2PYKxaz4s2Jlgmvt9Imz1DFzpXyLJQTTehE4HPOO21eI9A9VyjecVo8t5
         MlSsEfRxPhc6C0D2gwGK6sOWCLjnkiGNZiSn6lAnJ1xtpf8a4lFmHA3cnwwxNzY7xsmE
         PpXoHnivfqFQwLhzS7PntQhqPugeP5alyOUuuVfwCrM+/mCyK7rp10YPa8QD5CrXKuvr
         jL8Q==
X-Gm-Message-State: AOAM530uyo2e15hHANN7teR2PJDq920x9SWQCb4I2Cd/0+t60JN5txY3
	cT/dZ8PJ2gpR8khpswe7UjvNoBdBbsLD1ZFe3Cw=
X-Google-Smtp-Source: 
 ABdhPJw4NSF6MzHe7bfoDpUMIhn6mpSiFLBtcvg97QahpiAWOi64L/izHSOF9nhkzzkiKdNHXt31fH0IfY2IXiUkkl0=
X-Received: by 2002:aa7:c750:: with SMTP id c16mr5244941eds.141.1642616494995;
 Wed, 19 Jan 2022 10:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20220113113059.20489-2-kamil.dziezyk@arm.com>
 <20220113113059.20489-1-kamil.dziezyk@arm.com>
 <20220119034402.GA51854@gmail.com>
 <AM6PR08MB34615E150DB7600831CD308792599@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB34615E150DB7600831CD308792599@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jan 2022 13:21:23 -0500
Message-ID: 
 <CADkTA4MN2ZhaaAN+3nk7V2UMsxfyDDXXqCQwO4=JUwPiPy+QhQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen related
 kernel modules during system boot
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: =?UTF-8?Q?Kamil_Dzie=C5=BCyk?= <Kamil.Dziezyk@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "cardoe@gentoo.org" <cardoe@gentoo.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 18:21:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7028

On Wed, Jan 19, 2022 at 7:39 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> Hello Bruce,
>
> Thanks for getting this merged.
>
> We consider these patches as bug fixing and in this case is it possible t=
o have them backported (cherry picked) to honister branch?
>

Agreed. they are bug fixes, so I've done the cherry pick to honister.

Bruce

> Cheers,
>
> --
> Diego Sueiro
>
> >-----Original Message-----
> >From: meta-virtualization@lists.yoctoproject.org <meta-
> >virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield via
> >lists.yoctoproject.org
> >Sent: 19 January 2022 03:44
> >To: Kamil Dzie=C5=BCyk <Kamil.Dziezyk@arm.com>
> >Cc: meta-virtualization@lists.yoctoproject.org;
> >christopher.w.clark@gmail.com; cardoe@gentoo.org
> >Subject: Re: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen re=
lated
> >kernel modules during system boot
> >
> >merged.
> >
> >Bruce
> >
> >In message: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen rel=
ated
> >kernel modules during system boot on 13/01/2022 Kamil Dziezyk wrote:
> >
> >> This patch changes the location of xen.conf file, that contains list
> >> of kernel modules to be loaded during system boot, to
> >> "${nonarch_libdir}". This is done by removing '--with-systemd-modules-
> >load=3D' flag from EXTRA_OECONF variable.
> >>
> >> Previous path based on "${systemd_unitdir}" was not considered by
> >> default by systemd-modules-load.service.
> >>
> >> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> >> ---
> >>  recipes-extended/xen/xen-tools.inc | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/recipes-extended/xen/xen-tools.inc
> >> b/recipes-extended/xen/xen-tools.inc
> >> index ca924f4..6e25046 100644
> >> --- a/recipes-extended/xen/xen-tools.inc
> >> +++ b/recipes-extended/xen/xen-tools.inc
> >> @@ -653,10 +653,10 @@ FILES:${PN}-xm =3D "\
> >>      "
> >>
> >>  FILES:${PN}-xencommons +=3D "\
> >> +    ${nonarch_libdir}/modules-load.d/xen.conf \
> >>      ${sysconfdir}/default/xencommons \
> >>      ${sysconfdir}/init.d/xencommons \
> >>      ${sysconfdir}/xen/scripts/launch-xenstore \
> >> -    ${systemd_unitdir}/modules-load.d/xen.conf \
> >>      ${systemd_unitdir}/system/proc-xen.mount \
> >>      ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
> >>      ${systemd_unitdir}/system/xenconsoled.service \ @@ -744,7 +744,6
> >> @@ SYSTEMD_SERVICE:${PN}-xendomains =3D "xendomains.service"
> >>
> >>  EXTRA_OECONF +=3D " \
> >>      --with-systemd=3D${systemd_unitdir}/system \
> >> -    --with-systemd-modules-load=3D${systemd_unitdir}/modules-load.d \
> >>      --with-initddir=3D${INIT_D_DIR} \
> >>      --with-sysconfig-leaf-dir=3Ddefault \
> >>      --with-system-qemu=3D${bindir}/qemu-system-i386 \
> >> --
> >> 2.17.1
> >>
> >> IMPORTANT NOTICE: The contents of this email and any attachments are
> >confidential and may also be privileged. If you are not the intended rec=
ipient,
> >please notify the sender immediately and do not disclose the contents to=
 any
> >other person, use it for any purpose, or store or copy the information i=
n any
> >medium. Thank you.
> >
> >>
> >>
> >>
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

