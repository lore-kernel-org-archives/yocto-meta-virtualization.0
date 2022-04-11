Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B73DC5519F
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Subject: Re: [PATCH] libvirt: fix do_package issue
To: meta-virtualization@lists.yoctoproject.org
From: preeti.sachan@intel.com
X-Originating-Location: Bengaluru, Karnataka, IN (198.175.68.46)
X-Originating-Platform: Windows Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 11 Apr 2022 05:54:56 -0700
References: <20220411003834.1547923-1-preeti.sachan@intel.com>
In-Reply-To: <20220411003834.1547923-1-preeti.sachan@intel.com>
Message-ID: <9262.1649681696025077976@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="b7jKpn092i3K28w5yWfZ"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7151

--b7jKpn092i3K28w5yWfZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

No libvirt bbappend file in build and multiconfig is created to build with =
particular kernel version.
In recipe https://git.yoctoproject.org/meta-virtualization/tree/recipes-ext=
ended/libvirt/libvirt_8.1.0.bb , FILES : ${ PN } - libvirtd is not includin=
g "/usr/lib/sysctl.d/60-qemu-postcopy-migration.conf " neither something " =
usr/lib/sysctl.d/* ". It's strange how it is packaging file "/usr/lib/sysct=
l.d/60-qemu-postcopy-migration.conf "

--b7jKpn092i3K28w5yWfZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

No libvirt bbappend file in build and multiconfig is created to build with =
particular kernel version.&nbsp;<br />In recipe <a href=3D"https://git.yoct=
oproject.org/meta-virtualization/tree/recipes-extended/libvirt/libvirt_8.1.=
0.bb" target=3D"_blank" rel=3D"noopener">https://git.yoctoproject.org/meta-=
virtualization/tree/recipes-extended/libvirt/libvirt_8.1.0.bb</a>&nbsp;,&nb=
sp;<span class=3D"nv" style=3D"font-family: Menlo, Monaco, Consolas, 'Couri=
er New', monospace; font-size: 13.3333px; color: #336699;">FILES</span><spa=
n class=3D"p" style=3D"color: #000000; font-family: Menlo, Monaco, Consolas=
, 'Courier New', monospace; font-size: 13.3333px;">:</span><span class=3D"e=
rr" style=3D"font-family: Menlo, Monaco, Consolas, 'Courier New', monospace=
; font-size: 13.3333px; color: #a61717; background-color: #e3d2d2;">${</spa=
n><span class=3D"nv" style=3D"font-family: Menlo, Monaco, Consolas, 'Courie=
r New', monospace; font-size: 13.3333px; color: #336699;">PN</span><span cl=
ass=3D"err" style=3D"font-family: Menlo, Monaco, Consolas, 'Courier New', m=
onospace; font-size: 13.3333px; color: #a61717; background-color: #e3d2d2;"=
>}</span><span class=3D"o" style=3D"color: #000000; font-family: Menlo, Mon=
aco, Consolas, 'Courier New', monospace; font-size: 13.3333px;">-</span><sp=
an class=3D"nv" style=3D"font-family: Menlo, Monaco, Consolas, 'Courier New=
', monospace; font-size: 13.3333px; color: #336699;">libvirtd&nbsp;</span>i=
s not including&nbsp;<span style=3D"white-space: pre-wrap;"> "/usr/lib/sysc=
tl.d/60-qemu-postcopy-migration.conf " neither something "</span><span styl=
e=3D"white-space: pre-wrap;">usr/lib/sysctl.d/*</span><span style=3D"white-=
space: pre-wrap;">". It's strange how it is packaging file </span><span sty=
le=3D"white-space: pre-wrap;">"/usr/lib/sysctl.d/60-qemu-postcopy-migration=
.conf "</span>

--b7jKpn092i3K28w5yWfZ--

