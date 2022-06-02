Return-Path: <aurelienbertron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F63DC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 12:20:50 +0000 (UTC)
Subject: Missing https protocol for kata-containers recipes
To: meta-virtualization@lists.yoctoproject.org
From: =?UTF-8?B?QXVyw6lsaWVuIEJlcnRyb24=?= <aurelienbertron@gmail.com>
X-Originating-Location: Albigny-sur-Saone, Auvergne-Rhone-Alpes,
 FR (37.58.149.117)
X-Originating-Platform: Linux Firefox 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 02 Jun 2022 05:20:41 -0700
Message-ID: <VpOI.1654172441952282386.T9d4@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="KaKarp1tB5VyDnsCtglj"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Jun 2022 12:20:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7332

--KaKarp1tB5VyDnsCtglj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On branch kirkstone, the kata-* recipes clone their sources from github. Th=
e git fetcher uses unsafe git protocol by default which Github does not sup=
port. This makes the fetch step to fail.
One can fix this by adding ";protocol=3Dhttps" at the end of the SRC_URI en=
try.

Aur=C3=A9lien.

--KaKarp1tB5VyDnsCtglj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On branch kirkstone, the kata-* recipes clone their sources from github. Th=
e git fetcher uses unsafe git protocol by default which Github does not sup=
port. This makes the fetch step to fail.<br />One can fix this by adding ";=
protocol=3Dhttps" at the end of the SRC_URI entry.<br /><br />Aur&eacute;li=
en.

--KaKarp1tB5VyDnsCtglj--

