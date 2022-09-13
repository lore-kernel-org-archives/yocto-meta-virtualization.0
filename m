Return-Path: <kuzemkoyocto@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64433C6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:50:50 +0000 (UTC)
Subject: What the proper way to enable meta-virtualization
To: meta-virtualization@lists.yoctoproject.org
From: "Kuzemko Aleksandr" <kuzemkoyocto@gmail.com>
X-Originating-Location: Vinnytsia, Vinnytsya Oblast, UA (178.74.234.29)
X-Originating-Platform: Linux Firefox 104
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 Sep 2022 07:50:44 -0700
Message-ID: <X3gR.1663080644352218398.7GPk@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="IMG0vdhnXnjhBu0iJHdv"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Sep 2022 14:50:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7613

--IMG0vdhnXnjhBu0iJHdv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello.
I want add meta-virtualization to Boot2QT distro. When I git https://git.yo=
ctoproject.org/meta-virtualization/ and add
${BSPDIR}/sources/meta-virtualization to bblayers.conf I get error
$ bitbake b2qt-embedded-qt6-image
ERROR: Layer virtualization-layer is not compatible with the core layer whi=
ch only supports these series: kirkstone (layer is compatible with warrior =
thud)

I am newbie in Yocto, please help :)

--IMG0vdhnXnjhBu0iJHdv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello.<br />I want add meta-virtualization to Boot2QT distro. When I git&nb=
sp; <a href=3D"https://git.yoctoproject.org/meta-virtualization/" target=3D=
"_blank" rel=3D"noopener">https://git.yoctoproject.org/meta-virtualization/=
</a> and add&nbsp; <br />&nbsp;${BSPDIR}/sources/meta-virtualization to bbl=
ayers.conf I get error<br />$ bitbake b2qt-embedded-qt6-image<br />ERROR: L=
ayer virtualization-layer is not compatible with the core layer which only =
supports these series: kirkstone (layer is compatible with warrior thud)<br=
 /><br />I am newbie in Yocto, please help :)

--IMG0vdhnXnjhBu0iJHdv--

