Return-Path: <thitgahamtonghop@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04487C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 14:56:33 +0000 (UTC)
Subject: Failed build because of lxc-2.0.8
To: meta-virtualization@lists.yoctoproject.org
From: thitgahamtonghop@gmail.com
X-Originating-Location: Vaasa, Ostrobothnia, FI (83.245.206.61)
X-Originating-Platform: Linux Firefox 95
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 11 Dec 2021 06:56:31 -0800
Message-ID: <bLBX.1639234591413978357.GvLu@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="WAW20HopJZWOZrj9pLux"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 11 Dec 2021 14:56:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6976

--WAW20HopJZWOZrj9pLux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have successfully build a yocto image with branch rocko.

After that, I have cloned the layer meta-virtualization branch rocko and th=
e build has error as bellow. I have checked the lxc-2.0.8.bb file and it is=
 up-to-date to the rocko branch, what could be the problem? And how can I f=
ix this error?

ERROR: lxc-2.0.8-r0 do_package_qa: QA Issue: lxc-setup package is not obeyi=
ng usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
ERROR: lxc-2.0.8-r0 do_package_qa: QA run found fatal errors. Please consid=
er fixing them.
ERROR: lxc-2.0.8-r0 do_package_qa: Function failed: do_package_qa

--WAW20HopJZWOZrj9pLux
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I have successfully build a yocto image with branch rocko.</p>
<p>After that, I have cloned the layer meta-virtualization branch rocko and=
 the build has error as bellow. I have checked the lxc-2.0.8.bb file and it=
 is up-to-date to the rocko branch, what could be the problem? And how can =
I fix this error?</p>
<pre><code>ERROR: lxc-2.0.8-r0 do_package_qa: QA Issue: lxc-setup package i=
s not obeying usrmerge distro feature. /lib should be relocated to /usr. [u=
srmerge]
ERROR: lxc-2.0.8-r0 do_package_qa: QA run found fatal errors. Please consid=
er fixing them.
ERROR: lxc-2.0.8-r0 do_package_qa: Function failed: do_package_qa</code></p=
re>
<p>&nbsp;</p>

--WAW20HopJZWOZrj9pLux--

