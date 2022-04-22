Return-Path: <deekshith565@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6C7C49EA4
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Subject: Which package provides virt-install CLI tool in Yocto?
 #meta-virtualization #yocto #virt-install #libvirt #virt-manager
To: meta-virtualization@lists.yoctoproject.org
From: deekshith565@gmail.com
X-Originating-Location: Bengaluru, Karnataka, IN (198.175.68.46)
X-Originating-Platform: Windows Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 22 Apr 2022 05:09:01 -0700
Message-ID: <cfbW.1650629341303900121.mUcg@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="BwTP1qgDoHAExoQirqG0"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7210

--BwTP1qgDoHAExoQirqG0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Does anyone know which package provides virt-install CLI tool in Yocto or h=
ow to use virt-install tool in yocto environment?
I have added below packages in my bb file but I don't see virt-install tool=
 getting built

* packagegroup-core-boot \
* qemu \
* libvirt \
* libvirt-libvirtd \
* libvirt-virsh \
* libvirt-python \
* kernel-module-kvm \
* kernel-module-kvm-intel \
* kernel-module-kvm-amd \

Please help me.

--BwTP1qgDoHAExoQirqG0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"auto" style=3D"margin-bottom: 16px; color: #24292f; font-family: =
-apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif=
, 'Apple Color Emoji', 'Segoe UI Emoji';">Hi,<br />Does anyone know which p=
ackage provides virt-install CLI tool in Yocto or how to use virt-install t=
ool in yocto environment?<br />I have added below packages in my bb file bu=
t I don't see virt-install tool getting built</p>
<ul dir=3D"auto" style=3D"padding-left: 2em; margin-bottom: 16px; color: #2=
4292f; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetic=
a, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji';">
<li style=3D"margin-left: 0px;">packagegroup-core-boot \</li>
<li style=3D"margin-top: 0.25em; margin-left: 0px;">qemu \</li>
<li style=3D"margin-top: 0.25em; margin-left: 0px;">libvirt \</li>
<li style=3D"margin-top: 0.25em; margin-left: 0px;">libvirt-libvirtd \</li>
<li style=3D"margin-top: 0.25em; margin-left: 0px;">libvirt-virsh \</li>
<li style=3D"margin-top: 0.25em; margin-left: 0px;">libvirt-python \</li>
<li style=3D"margin-top: 0.25em; margin-left: 0px;">kernel-module-kvm \</li=
>
<li style=3D"margin-top: 0.25em; margin-left: 0px;">kernel-module-kvm-intel=
 \</li>
<li style=3D"margin-top: 0.25em; margin-left: 0px;">kernel-module-kvm-amd \=
</li>
</ul>
<p dir=3D"auto" style=3D"color: #24292f; font-family: -apple-system, BlinkM=
acSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji'=
, 'Segoe UI Emoji'; margin-bottom: 0px !important;">Please help me.</p>

--BwTP1qgDoHAExoQirqG0--

