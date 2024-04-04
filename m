Return-Path: <tanski.piotr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D04CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 12:27:53 +0000 (UTC)
Subject: framebuffer problem on Yocto + Xen for Raspberry Pi 4B
To: meta-virtualization@lists.yoctoproject.org
From: tanski.piotr@gmail.com
X-Originating-Location: Pietrowice Wielkie, Silesia, PL (83.6.87.221)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 04 Apr 2024 05:27:33 -0700
Message-ID: <xHdn.1712223094569467303.vHnq@lists.yoctoproject.org>
X-Old-Date: Thu, 04 Apr 2024 02:31:34 -0700
Content-Type: multipart/alternative; boundary="cUScDWTrlAumpJfSzWYx"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Apr 2024 12:27:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8662
Message-ID: <20240404122733.WLv3CpwFQ7UemJc7Xr28kXKWDD7DHHWbLM3RmdmdJK8@z>

--cUScDWTrlAumpJfSzWYx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm building a xen image based on Yocto Linux for Raspberry Pi 4B. I'm usin=
g meta-oe, meta-raspberry + meta-virtualization.

I run an X server on my Dom0 Linux. It runs fine, because I'm able to forwa=
rd X11 via SSH and display e.g. galaxies game on my desktop. However, in my=
 Dom0 OS there's no /dev/fb0 and I'm not able to show anything on the HDMI-=
A-1 display.

I've added CONFIG_FB to the kernel and x11-base, x11-sato and xf86-video-fb=
dev to the image.
My Distro contains "x11 vulkan pam systemd virtualization xen".

Is this a problem with framebuffer passthrough to the dom0? How can I make =
it available to my dom0 OS?

--cUScDWTrlAumpJfSzWYx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>I'm building a xen image based on Yocto Linux for Raspberry Pi 4B. I'm=
 using meta-oe, meta-raspberry + meta-virtualization.</div>
<div>&nbsp;</div>
<div>I run an X server on my Dom0 Linux. It runs fine, because I'm able to =
forward X11 via SSH and display e.g. galaxies game on my desktop. However, =
in my Dom0 OS there's no /dev/fb0 and I'm not able to show anything on the =
HDMI-A-1 display.</div>
<div><br />I've added CONFIG_FB to the kernel and x11-base, x11-sato and xf=
86-video-fbdev to the image.</div>
<div>My Distro contains "x11 vulkan pam systemd virtualization xen".</div>
<div>&nbsp;</div>
<div>Is this a problem with framebuffer passthrough to the dom0? How can I =
make it available to my dom0 OS?</div>

--cUScDWTrlAumpJfSzWYx--

