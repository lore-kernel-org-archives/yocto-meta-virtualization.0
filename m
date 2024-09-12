Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAF4EEB58C
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 10:42:12 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.44999.1726137722735078011
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Sep 2024 03:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout12.t-online.de (Postfix) with SMTP id 68950F4FA;
	Thu, 12 Sep 2024 12:41:59 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.34.202]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sohGv-19ElY80; Thu, 12 Sep 2024 12:41:57 +0200
Date: Thu, 12 Sep 2024 12:43:39 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-virtualization][PATCH] linux-%.bbappend: fix compatibility
 issue with linux-intel
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	meta-virtualization@lists.yoctoproject.org
Message-Id: <SG4PJS.15GM9H9ULONU@t-online.de>
In-Reply-To: <CA+chaQeJoEypkzx7rBxW7mBFDYtyFKSr37Fm4CVvwMiM2cj6Pw@mail.gmail.com>
References: <20240912083239.237361-1-f_l_k@t-online.de>
	<CA+chaQfdVmLsJD3WL_O8YiJ9urPvgwiHO82=48rBruRcw9-PWg@mail.gmail.com>
	<A7ZOJS.J4CMW0BLYVKO2@t-online.de>
	<CA+chaQeJoEypkzx7rBxW7mBFDYtyFKSr37Fm4CVvwMiM2cj6Pw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yxpQzY+H7S8v7f9AxzmF"
X-TOI-EXPURGATEID: 150726::1726137717-897F85AD-5F72DD03/0/0 CLEAN NORMAL
X-TOI-MSGID: 3001649f-34e0-4578-96e7-b1c9e54ddc93
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Sep 2024 10:42:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8890

--=-yxpQzY+H7S8v7f9AxzmF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I see, thanks for the clarification. After looking into this I can say=20
that in fact
the issue was caused by this commit:
<https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af9473163=
1b3432b8ddee2b89761ab32530ee>


It fails because meta-intel missed to set the patch version in=20
LINUX_VERSION in linux-intel_6.10.bb
<https://git.yoctoproject.org/meta-intel/tree/recipes-kernel/linux/linux-in=
tel_6.10.bb#n16>

changing to LINUX_VERSION ?=3D "6.10.0" fixes the issue

On Thu, Sep 12 2024 at 11:32:52 AM +02:00:00, Martin Jansa=20
<martin.jansa@gmail.com> wrote:
> That's weird, these LINUX_MAJOR/LINUX_MINOR are used only to include
> the .inc file in:
> recipes-kernel/linux/linux-%.bbappend:include
> ${@bb.utils.contains <mailto:${@bb.utils.contains>('DISTRO_FEATURES',=20
> 'virtualization',
> 'linux-${KERNEL_META_TYPE}_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.i=
nc',
> '', d)}
>=20
> while yocto-cfg-fragments dependency you've mentioned in the error is
> added based on PV now in this .inc file:
> recipes-kernel/linux/linux-yocto_virtualization.inc:        return
> "yocto-cfg-fragments-%s-native:do_populate_sysroot" % pv
>=20
> So I think your fix only prevents either of these to be included:
> ./recipes-kernel/linux/linux-yocto_virtualization.inc
> ./recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
> ./recipes-kernel/linux/linux-yocto_6.10_virtualization.inc
>=20
> and not only for people using meta-intel, but for everybody, because
> there is no linux-yocto_x.y_virtualization.inc at all.
>=20
> That doesn't look right. I think
> "oe.utils.trim_version(d.getVar('PV'), 2)" should be improved to strip
> trailing +git as well or maybe to use LINUX_MAJOR/LINUX_MINOR instead
> of PV inside the .inc file.
>=20
> Regards,
>=20
> On Thu, Sep 12, 2024 at 10:48=E2=80=AFAM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  On Thu, Sep 12 2024 at 10:36:04 AM +02:00:00, Martin Jansa=20
>> <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>> wrote:
>>=20
>>  Wasn't this fixed by=20
>> <https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af9473=
1631b3432b8ddee2b89761ab32530ee>=20
>> ?
>>=20
>>  I have meta-virtualization layer up to date, so it includes this=20
>> commit, but was still hit by this problem.


--=-yxpQzY+H7S8v7f9AxzmF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I see, thanks for the clarificatio=
n. After looking into this I can say that in fact</div><div>the issue was c=
aused by this commit:</div><div><a href=3D"https://git.yoctoproject.org/met=
a-virtualization/commit/?id=3Dc02af94731631b3432b8ddee2b89761ab32530ee">htt=
ps://git.yoctoproject.org/meta-virtualization/commit/?id=3Dc02af94731631b34=
32b8ddee2b89761ab32530ee</a></div><div><br></div><div><br></div><div>It fai=
ls because meta-intel missed to set the patch version in LINUX_VERSION in l=
inux-intel_6.10.bb</div><div><a href=3D"https://git.yoctoproject.org/meta-i=
ntel/tree/recipes-kernel/linux/linux-intel_6.10.bb#n16">https://git.yoctopr=
oject.org/meta-intel/tree/recipes-kernel/linux/linux-intel_6.10.bb#n16</a><=
/div><div><br></div><div>changing to LINUX_VERSION ?=3D "6.10.0" fixes the =
issue</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Thu, Sep 12 20=
24 at 11:32:52 AM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wr=
ote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-s=
pace: break-spaces;">That's weird, these LINUX_MAJOR/LINUX_MINOR are used o=
nly to include
the .inc file in:
recipes-kernel/linux/linux-%.bbappend:include
<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FE=
ATURES', 'virtualization',
'linux-${KERNEL_META_TYPE}_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.inc=
',
'', d)}

while yocto-cfg-fragments dependency you've mentioned in the error is
added based on PV now in this .inc file:
recipes-kernel/linux/linux-yocto_virtualization.inc:        return
"yocto-cfg-fragments-%s-native:do_populate_sysroot" % pv

So I think your fix only prevents either of these to be included:
./recipes-kernel/linux/linux-yocto_virtualization.inc
./recipes-kernel/linux/linux-yocto_6.6_virtualization.inc
./recipes-kernel/linux/linux-yocto_6.10_virtualization.inc

and not only for people using meta-intel, but for everybody, because
there is no linux-yocto_x.y_virtualization.inc at all.

That doesn't look right. I think
"oe.utils.trim_version(d.getVar('PV'), 2)" should be improved to strip
trailing +git as well or maybe to use LINUX_MAJOR/LINUX_MINOR instead
of PV inside the .inc file.

Regards,

On Thu, Sep 12, 2024 at 10:48=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:=
f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 On Thu, Sep 12 2024 at 10:36:04 AM +02:00:00, Martin Jansa &lt;<a href=3D"=
mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:

 Wasn't this fixed by <a href=3D"https://git.yoctoproject.org/meta-virtuali=
zation/commit/?id=3Dc02af94731631b3432b8ddee2b89761ab32530ee">https://git.y=
octoproject.org/meta-virtualization/commit/?id=3Dc02af94731631b3432b8ddee2b=
89761ab32530ee</a> ?

 I have meta-virtualization layer up to date, so it includes this commit, b=
ut was still hit by this problem.
</blockquote></div></blockquote></div>
--=-yxpQzY+H7S8v7f9AxzmF--


