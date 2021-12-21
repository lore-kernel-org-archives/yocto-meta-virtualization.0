Return-Path: <kamil.dziezyk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C99C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 17:41:44 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] xen: Clear TUNE_CCARGS for Xen build for aarch64
 machines
To: meta-virtualization@lists.yoctoproject.org
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
X-Originating-Location: Manchester, England, GB (217.140.99.251)
X-Originating-Platform: Linux Firefox 90
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Dec 2021 09:41:43 -0800
References: 
 <CACMJ4GZTTz9L1_+8Ldd8_4x6EUOfJeps_K11UP9stjdxBBKjmg@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GZTTz9L1_+8Ldd8_4x6EUOfJeps_K11UP9stjdxBBKjmg@mail.gmail.com>
Message-ID: <22546.1640108503354804524@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0wuHN4LkMOS7ykfQLLFo"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Dec 2021 17:41:44 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6987

--0wuHN4LkMOS7ykfQLLFo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristopher,

Thanks for your comments.

My intention was to clear TUNE_CCARGS only for hypervisor compilation, so I=
 will move this change to "xen-hypervisor.inc", to not impact "xen-tools".

An example of a machine this patch will fix the compilation is N1SDP from t=
he meta-arm layer.

>=20
>=20
>=20
> | cc1: error: switch '-mcpu=3Dgeneric' conflicts with
> '-march=3Darmv8.2-a+crypto' switch [-Werror]
> | cc1: all warnings being treated as errors
>=20
>=20

In the next version of this patch, I will reword that comment regarding "HV=
M-mode", because it's not accurate for Xen on Arm.

Thanks,

Kamil

--0wuHN4LkMOS7ykfQLLFo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Cristopher,</p>
<p>&nbsp;</p>
<p>Thanks for your comments.</p>
<p>My intention was to clear TUNE_CCARGS only for hypervisor compilation, s=
o I will move this change to "xen-hypervisor.inc", to not impact "xen-tools=
".</p>
<p>An example of a machine this patch will fix the compilation is N1SDP fro=
m the meta-arm layer.</p>
<blockquote>
<p>| cc1: error: switch '-mcpu=3Dgeneric' conflicts with '-march=3Darmv8.2-=
a+crypto' switch [-Werror]<br />| cc1: all warnings being treated as errors=
</p>
</blockquote>
<p>In the next version of this patch, I will reword that comment regarding =
"HVM-mode", because it's not accurate for Xen on Arm.</p>
<p>&nbsp;</p>
<p>Thanks,</p>
<p>Kamil</p>

--0wuHN4LkMOS7ykfQLLFo--

