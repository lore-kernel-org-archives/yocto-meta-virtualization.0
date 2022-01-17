Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8B8C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:06:38 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web12.970.1642442797384191161
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cRYKrQ5N;
 spf=pass (domain: gmail.com, ip: 209.85.221.176,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id m131so1368298vkm.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JdkSQcWpbihK9LmP36YvSbiPb5mNNQFbgKqr5KFlwpM=;
        b=cRYKrQ5Nm+gDIN8/ulbiMLq+7SetOJ+X0U9BxmDlmcyoKUdGowUjfXKbVkC9ov51K2
         VT/Yk7JLD4qWbcdj2wan0BTLhK5WhDBamNyXoN8618ajZUuTOtib00MLRIGa8+/39rJb
         5prAxnGYI7XCJ4/VOxSsttI5ir3o2/Yy1flKS017OCzc7g4MWNgUkZIdb6qrB1VNZpp2
         F0pFy7G+vZ359O0NJe9DDZC3g5H7vKAf91JnI0zIg+DKf1OJWzeCubE6Hw+i4a/+K1TQ
         wC6aZaFt21752NYpUZURyuiopwNpE37oYFVTJU/Y/sF9X+qh6jbD9ax4l7uXJoGwFJhI
         /tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JdkSQcWpbihK9LmP36YvSbiPb5mNNQFbgKqr5KFlwpM=;
        b=wX6tYjzRZvqMRxD5ZUQPBxtPkmdczZiy+0U7p9YBkJPwDDhyzljPL3/EYNBBWJ3+NF
         ZDluCHLeCtxxwTky5LtMjqBansoMwZWVRvrBnlPwBS9dKUkoD4QXYQLjcR8bopKBiAQR
         +nbRNdb7SUfCbH2SwfMwqP4E8GnNFq8wv0GzKlcvmCJWgKTy5PFO8pUpuBncRYkoUEii
         cLwIkbZDm/5aAuzzQAdSXp7f5EpKivEDrw1GIid3relt8ZcFpUFi862S5TwOwKwpSJTC
         QpJVKH77TZet8KHsVYkj+AjTFdnCxp/q1K8cxqOgwF4EA2qhPO9qbhDVqAHqe34OoyTf
         Vy6g==
X-Gm-Message-State: AOAM532EIVnSM1CChYPfwIEJJfu7u2y7Lp2wTj3NvUUaeWEuJDCrMTGR
	gd1q95FOMpeWOcHwdX3YBwYpMuGqVEa/xZ4qOdKBqA0E
X-Google-Smtp-Source: 
 ABdhPJxOCzPcQFfYEKhNylGuuFtlbv0NKvW3hr91SDYQ3uzscbAFikOm0oT8vTWspRz4Bm8ZgbYxnRAAjVMs0Cb8LBo=
X-Received: by 2002:a05:6122:9a5:: with SMTP id
 g37mr7587701vkd.1.1642442796509;
 Mon, 17 Jan 2022 10:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20220113113059.20489-1-kamil.dziezyk@arm.com>
 <B3561BB1-3D00-4AA5-8176-9A28789F607F@arm.com>
In-Reply-To: <B3561BB1-3D00-4AA5-8176-9A28789F607F@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 17 Jan 2022 10:06:25 -0800
Message-ID: 
 <CACMJ4GYGr8Soooa4PgfpZ0TzUSHVF6+rmnk0826aFz9_-b22Yg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen related
 kernel modules during system boot
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: =?UTF-8?Q?Kamil_Dzie=C5=BCyk?= <Kamil.Dziezyk@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Content-Type: multipart/alternative; boundary="000000000000732f2205d5cb0347"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jan 2022 18:06:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7010

--000000000000732f2205d5cb0347
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 17, 2022 at 12:33 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Kamil,
>
> > On 13 Jan 2022, at 11:30, Kamil Dziezyk via lists.yoctoproject.org
> <kamil.dziezyk=arm.com@lists.yoctoproject.org> wrote:
> >
> > This patch changes the location of xen.conf file, that contains list of
> kernel
> > modules to be loaded during system boot, to "${nonarch_libdir}". This is
> done
> > by removing '--with-systemd-modules-load=' flag from EXTRA_OECONF
> variable.
> >
> > Previous path based on "${systemd_unitdir}" was not considered by
> default by
> > systemd-modules-load.service.
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
> > recipes-extended/xen/xen-tools.inc | 3 +--
> > 1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> > index ca924f4..6e25046 100644
> > --- a/recipes-extended/xen/xen-tools.inc
> > +++ b/recipes-extended/xen/xen-tools.inc
> > @@ -653,10 +653,10 @@ FILES:${PN}-xm = "\
> >     "
> >
> > FILES:${PN}-xencommons += "\
> > +    ${nonarch_libdir}/modules-load.d/xen.conf \
> >     ${sysconfdir}/default/xencommons \
> >     ${sysconfdir}/init.d/xencommons \
> >     ${sysconfdir}/xen/scripts/launch-xenstore \
> > -    ${systemd_unitdir}/modules-load.d/xen.conf \
> >     ${systemd_unitdir}/system/proc-xen.mount \
> >     ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
> >     ${systemd_unitdir}/system/xenconsoled.service \
> > @@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains =
> "xendomains.service"
> >
> > EXTRA_OECONF += " \
> >     --with-systemd=${systemd_unitdir}/system \
> > -    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
> >     --with-initddir=${INIT_D_DIR} \
> >     --with-sysconfig-leaf-dir=default \
> >     --with-system-qemu=${bindir}/qemu-system-i386 \
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
> > View/Reply Online (#6999):
> https://lists.yoctoproject.org/g/meta-virtualization/message/6999
> > Mute This Topic: https://lists.yoctoproject.org/mt/88394698/3619089
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

--000000000000732f2205d5cb0347
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 17, 2022 at 12:33 AM Bert=
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
&gt; This patch changes the location of xen.conf file, that contains list o=
f kernel<br>
&gt; modules to be loaded during system boot, to &quot;${nonarch_libdir}&qu=
ot;. This is done<br>
&gt; by removing &#39;--with-systemd-modules-load=3D&#39; flag from EXTRA_O=
ECONF variable.<br>
&gt;<br>
&gt; Previous path based on &quot;${systemd_unitdir}&quot; was not consider=
ed by default by<br>
&gt; systemd-modules-load.service.<br>
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
&gt; recipes-extended/xen/xen-tools.inc | 3 +--<br>
&gt; 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen=
/xen-tools.inc<br>
&gt; index ca924f4..6e25046 100644<br>
&gt; --- a/recipes-extended/xen/xen-tools.inc<br>
&gt; +++ b/recipes-extended/xen/xen-tools.inc<br>
&gt; @@ -653,10 +653,10 @@ FILES:${PN}-xm =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; FILES:${PN}-xencommons +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/modules-load.d/xen.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${sysconfdir}/default/xencommons \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${sysconfdir}/init.d/xencommons \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/launch-xenstore \<br>
&gt; -=C2=A0 =C2=A0 ${systemd_unitdir}/modules-load.d/xen.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/proc-xen.mount \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/xen-qemu-dom0-disk-backen=
d.service \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/xenconsoled.service \<br>
&gt; @@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains =3D &quot;xendoma=
ins.service&quot;<br>
&gt;<br>
&gt; EXTRA_OECONF +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--with-systemd=3D${systemd_unitdir}/system \<br>
&gt; -=C2=A0 =C2=A0 --with-systemd-modules-load=3D${systemd_unitdir}/module=
s-load.d \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--with-initddir=3D${INIT_D_DIR} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--with-sysconfig-leaf-dir=3Ddefault \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--with-system-qemu=3D${bindir}/qemu-system-i386 \<b=
r>
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
&gt; View/Reply Online (#6999): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/6999" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/6999</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/88394698=
/3619089" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/88394698/3619089</a><br>
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

--000000000000732f2205d5cb0347--

