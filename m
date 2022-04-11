Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8573BC47092
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Subject: Re: [PATCH] libvirt: fix do_package issue
To: meta-virtualization@lists.yoctoproject.org
From: preeti.sachan@intel.com
X-Originating-Location: Bengaluru, Karnataka, IN (198.175.68.46)
X-Originating-Platform: Windows Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 10 Apr 2022 20:49:22 -0700
References: 
 <CADkTA4MBM_yP+DyR4=mS0K06JzACmJZP5v0E_hG0c+9e=ypikw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MBM_yP+DyR4=mS0K06JzACmJZP5v0E_hG0c+9e=ypikw@mail.gmail.com>
Message-ID: <4446.1649648962103104390@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="9P30gk0TxPYjRZLT5eFp"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7146

--9P30gk0TxPYjRZLT5eFp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: QA Issue: libvirt: Files/di=
rectories were installed but not shipped in any package:
/usr/lib/sysctl.d/60-qemu-postcopy-migration.conf
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
libvirt: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: Fatal QA errors were found,=
 failing task.

--9P30gk0TxPYjRZLT5eFp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: QA Issue: libvirt: Fil=
es/directories were installed but not shipped in any package:</div>
<div>&nbsp; /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf</div>
<div>Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within do_install.<=
/div>
<div>libvirt: 1 installed and not shipped files. [installed-vs-shipped]</di=
v>
<div>ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: Fatal QA errors were f=
ound, failing task.</div>

--9P30gk0TxPYjRZLT5eFp--

