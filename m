Return-Path: <vivsundar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375C5C54E41
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 06:09:27 +0000 (UTC)
Subject: Reduce Docker installation size in the disk  #meta-virtualization #yocto 
To: meta-virtualization@lists.yoctoproject.org
From: vivsundar@gmail.com
X-Originating-Location: Chennai, Tamil Nadu, IN (49.204.134.202)
X-Originating-Platform: Windows Chrome 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 25 Feb 2024 22:09:24 -0800
Message-ID: <8uml.1708927764963219775.KWwp@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="KkkkC8m3vOEM9Cu00qeg"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 06:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8582

--KkkkC8m3vOEM9Cu00qeg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I use yocto build for creating Kernel and Rootfs images to be used in CM4 m=
odule.=C2=A0 I use core-image-minimal which produces a nice 30M (Kernel + R=
FS) image.=C2=A0 But when is include docker with:

IMAGE_INSTALL:append =3D " python3-docker-compose"
IMAGE_INSTALL:append =3D " docker-ce"

The image size increases by 320M(Kernel + RFS).=C2=A0 Is there a way to rem=
ove some unnecessary components from docker?=C2=A0 I am quite new to docker=
 and its internal components.
I have fixed offsets in by boot loader, so, I am finding it hard to boot th=
e board with the new Kernel and RFS.

Any help will be greatly appreciated. Thanks.

--KkkkC8m3vOEM9Cu00qeg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I use yocto build for creating Kernel and Rootfs images to be used in CM4 m=
odule.&nbsp; I use core-image-minimal which produces a nice 30M (Kernel + R=
FS) image.&nbsp; But when is include docker with:<br /><br />
<div>IMAGE_INSTALL:append =3D " python3-docker-compose"</div>
<div>IMAGE_INSTALL:append =3D " docker-ce"<br /><br />The image size increa=
ses by 320M(Kernel + RFS).&nbsp; Is there a way to remove some unnecessary =
components from docker?&nbsp; I am quite new to docker and its internal com=
ponents.&nbsp;&nbsp;</div>
<div>I have fixed offsets in by boot loader, so, I am finding it hard to bo=
ot the board with the new Kernel and RFS.&nbsp;&nbsp;<br /><br />Any help w=
ill be greatly appreciated. Thanks.<br />&nbsp;&nbsp;</div>
<div>&nbsp;</div>

--KkkkC8m3vOEM9Cu00qeg--

