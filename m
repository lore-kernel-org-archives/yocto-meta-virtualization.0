Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E8BC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:04:47 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web09.896.1642442686205811391
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eQy/7l0d;
 spf=pass (domain: gmail.com, ip: 209.85.221.182,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id m131so1365050vkm.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e/zvqahAS7M5Gs9w6KPEwz/oCOSb3oWgp4weOEZoghw=;
        b=eQy/7l0doYvmS4B5C+9b8gXuvpF8IF5KeafpTd2eg+iPpZvfJFvUEBLPXAcQC1q3ld
         J5p7x5FJegWG1C86gFl+7rSSt0neOu67L9HCYd7kHWqgw6QuVNTl0Jip7V376m2EYDab
         sarTKANb1kiXnWogoHpUeSOHSZ4Z9Qg/YRSHvBG7cTFMMGgr4GpqlRceVRNpqQO/C4QP
         Z2l7IULaEvKa7Dlj3SjiGVueuNgppfho1H+uydNXyT3vJePodwYjvaXKTYghcXqFUMLc
         yUIQxKMFpvuvbmp6NvwGvjCjsOrCaVM4RpNOLjjgaxAkMxfIiMpU4BZCRh/BShRq+Z6S
         z5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e/zvqahAS7M5Gs9w6KPEwz/oCOSb3oWgp4weOEZoghw=;
        b=zOXN1gZLjKwWplTxiA1gqFMoUWkMeth1sqnAN4GWCxkcTczZ2l51S+hjlNmhcvu523
         5cj65RssOYBOoj5CEEohtdL1FMHun6gXK6eaNdn8vtmDfJTEuina+PXemM80k9rtdy/U
         IhVEKNmR54/0NGmUwNjmO1dfXJZf0hUCqmA03dk9RigXuSMyPgWQ6ziZoN8hATdYJFAD
         uRdO5HXJ0uZnA6iS6D2thI/hTzLWnOtWMvoostblfvmUEIYaNMLjAuljAJXnM9S+eWL5
         rlT4GHlkfB0B5diP12OuliVrHytwl2/E93LKv8IP+vWAqQiDMtOmUQE6Foxo9v6py4tN
         dMWA==
X-Gm-Message-State: AOAM532RlEo0KAewaGgQDHPhpgoq2uvvqhCp+rbkhLLvPJSfyejWWLQ0
	hAFpHYRx139/CKsPYwtnn8sV79bZR1wi0VDIIMs=
X-Google-Smtp-Source: 
 ABdhPJy8Qs2QXg41B3+logcG9DIH/Nm1lvMPuCAGEU9fqgKIeF3oqi6Bk/dbIg+d9jhB2BiBcPdt/PhAnldJHqyeiQ0=
X-Received: by 2002:ac5:c395:: with SMTP id s21mr8333031vkk.3.1642442685334;
 Mon, 17 Jan 2022 10:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20220113113059.20489-1-kamil.dziezyk@arm.com>
 <20220113113059.20489-2-kamil.dziezyk@arm.com>
 <977A07F3-C1CD-407C-AEED-9CC7C5B45E23@arm.com>
In-Reply-To: <977A07F3-C1CD-407C-AEED-9CC7C5B45E23@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 17 Jan 2022 10:04:34 -0800
Message-ID: 
 <CACMJ4GbvRYkbJe4mE0m+SGipcF19FufmmXFPLcChp46JmjZ7VA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v3 2/2] xen: Clear TUNE_CCARGS for
 Xen build for aarch64 machines
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: =?UTF-8?Q?Kamil_Dzie=C5=BCyk?= <Kamil.Dziezyk@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Content-Type: multipart/alternative; boundary="000000000000d2c84b05d5cafcb4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jan 2022 18:04:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7009

--000000000000d2c84b05d5cafcb4
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 17, 2022 at 12:34 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Kamil,
>
> > On 13 Jan 2022, at 11:30, Kamil Dziezyk via lists.yoctoproject.org
> <kamil.dziezyk=arm.com@lists.yoctoproject.org> wrote:
> >
> > Xen build may fail for arm machines that have enabled extra flags,
> > that can be enabled only for specific architecture version, e.g.
> armv8-2a.
> >
> > Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>

Acked-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher



>
> Cheers
> Bertrand
>
> > ---
> > recipes-extended/xen/xen-hypervisor.inc | 4 ++++
> > 1 file changed, 4 insertions(+)
> >
> > diff --git a/recipes-extended/xen/xen-hypervisor.inc
> b/recipes-extended/xen/xen-hypervisor.inc
> > index cffd491..81e361f 100644
> > --- a/recipes-extended/xen/xen-hypervisor.inc
> > +++ b/recipes-extended/xen/xen-hypervisor.inc
> > @@ -103,3 +103,7 @@ CROSS_CURSES_LIB += "-L${STAGING_LIBDIR_NATIVE}"
> > # Specify the root dir of the .config file for do_menuconfig and
> do_diffconfig
> > # tasks
> > KCONFIG_CONFIG_ROOTDIR = "${S}/xen"
> > +
> > +# Xen is setting all CC flags on its own. Make sure that they are not
> modified
> > +# for aarch64, e.g. with architecture-specific optimizations.
> > +TUNE_CCARGS:aarch64=""
> > --
> > 2.17.1
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7000):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7000
> > Mute This Topic: https://lists.yoctoproject.org/mt/88394702/3619089
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bertrand.marquis@arm.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>

--000000000000d2c84b05d5cafcb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 17, 2022 at 12:34 AM Bert=
rand Marquis &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marqu=
is@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Kamil,<br>
<br>
&gt; On 13 Jan 2022, at 11:30, Kamil Dziezyk via <a href=3D"http://lists.yo=
ctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org=
</a> &lt;kamil.dziezyk=3D<a href=3D"mailto:arm.com@lists.yoctoproject.org" =
target=3D"_blank">arm.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Xen build may fail for arm machines that have enabled extra flags,<br>
&gt; that can be enabled only for specific architecture version, e.g. armv8=
-2a.<br>
&gt;<br>
&gt; Signed-off-by: Kamil Dziezyk &lt;<a href=3D"mailto:kamil.dziezyk@arm.c=
om" target=3D"_blank">kamil.dziezyk@arm.com</a>&gt;<br>
<br>
Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.co=
m" target=3D"_blank">bertrand.marquis@arm.com</a>&gt;<br></blockquote><div>=
<br></div><div>Acked-by: Christopher Clark &lt;<a href=3D"mailto:christophe=
r.w.clark@gmail.com">christopher.w.clark@gmail.com</a>&gt;</div><div><br></=
div><div>Christopher</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Cheers<br>
Bertrand<br>
<br>
&gt; ---<br>
&gt; recipes-extended/xen/xen-hypervisor.inc | 4 ++++<br>
&gt; 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extende=
d/xen/xen-hypervisor.inc<br>
&gt; index cffd491..81e361f 100644<br>
&gt; --- a/recipes-extended/xen/xen-hypervisor.inc<br>
&gt; +++ b/recipes-extended/xen/xen-hypervisor.inc<br>
&gt; @@ -103,3 +103,7 @@ CROSS_CURSES_LIB +=3D &quot;-L${STAGING_LIBDIR_NAT=
IVE}&quot;<br>
&gt; # Specify the root dir of the .config file for do_menuconfig and do_di=
ffconfig<br>
&gt; # tasks<br>
&gt; KCONFIG_CONFIG_ROOTDIR =3D &quot;${S}/xen&quot;<br>
&gt; +<br>
&gt; +# Xen is setting all CC flags on its own. Make sure that they are not=
 modified<br>
&gt; +# for aarch64, e.g. with architecture-specific optimizations.<br>
&gt; +TUNE_CCARGS:aarch64=3D&quot;&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7000): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7000" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7000</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/88394702=
/3619089" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/88394702/3619089</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bertrand.marquis@=
arm.com" target=3D"_blank">bertrand.marquis@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
</blockquote></div></div>

--000000000000d2c84b05d5cafcb4--

