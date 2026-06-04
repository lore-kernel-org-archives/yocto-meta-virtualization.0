Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C2DCD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 04:59:55 +0000 (UTC)
Subject: [Question] container-bundle: CONTAINER_SERVICE_FILE silently dropped (do_unpack noexec)
To: meta-virtualization@lists.yoctoproject.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Nowon-gu, Seoul, KR (27.122.242.71)
X-Originating-Platform: Windows Chrome 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 21:59:45 -0700
Message-ID: <UeWl.1780549185744414138.ZP1e@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="6I76ssl36Xoqd0jlQWmv"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 04:59:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9849

--6I76ssl36Xoqd0jlQWmv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On master there seems to be a contradiction between the
CONTAINER_SERVICE_FILE docs and do_unpack in container-bundle.bbclass.

The custom-service docs (bbclass header and docs/container-bundling.md) say=
 to
ship the unit like this:

SRC_URI =3D "file://myapp.service"
CONTAINER_SERVICE_FILE[myapp-container] =3D "${UNPACKDIR}/myapp.service"

But container-bundle.bbclass sets do_unpack[noexec] =3D "1", so the
file:// is never unpacked into ${UNPACKDIR}. The do_install loop that copie=
s
custom services then fails its "[ ! -f $service_file ]" check, skips silent=
ly,
and the bundle ends up with an empty container-bundles/<runtime>/services/.

..Or have I misunderstood how this is meant to be used?

Thanks!

--6I76ssl36Xoqd0jlQWmv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello!<br /><br />On master there seems to be a contradiction between =
the<br />CONTAINER_SERVICE_FILE docs and do_unpack in container-bundle.bbcl=
ass.<br /><br />The custom-service docs (bbclass header and docs/container-=
bundling.md) say to<br />ship the unit like this:<br /><br />&nbsp; &nbsp; =
SRC_URI =3D "file://myapp.service"<br />&nbsp; &nbsp; CONTAINER_SERVICE_FIL=
E[myapp-container] =3D "${UNPACKDIR}/myapp.service"<br /><br />But containe=
r-bundle.bbclass sets do_unpack[noexec] =3D "1", so the<br />file:// is nev=
er unpacked into ${UNPACKDIR}. The do_install loop that copies<br />custom =
services then fails its "[ ! -f $service_file ]" check, skips silently,<br =
/>and the bundle ends up with an empty container-bundles/&lt;runtime&gt;/se=
rvices/.<br /><br />..Or have I misunderstood how this is meant to be used?=
<br /><br />Thanks!</div>

--6I76ssl36Xoqd0jlQWmv--

