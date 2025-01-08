Return-Path: <FlorianWickert@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B0BE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:59:40 +0000 (UTC)
Subject: Re: [PATCH] image-oci-umoci: preserve file modes in rootfs
To: meta-virtualization@lists.yoctoproject.org
From: "Florian Wickert" <FlorianWickert@gmail.com>
X-Originating-Location: Barcelona, Catalonia, ES (88.14.68.155)
X-Originating-Platform: Linux Firefox 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 00:59:34 -0800
References: <Z32oImpdKNsHV77n@gmail.com>
In-Reply-To: <Z32oImpdKNsHV77n@gmail.com>
Message-ID: <29605.1736326774982501371@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="GigluEW4j577Qx5zTlEs"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jan 2025 08:59:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9078

--GigluEW4j577Qx5zTlEs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I initially tried to use cp -a but that gave permission errors and I decide=
d to just
preserve the modes instead because that's what caused the problems in my ca=
se.
But I agree that something like cp -a would be even better.
Maybe even a hardlink would do the job, instead of copying all the files in=
to the
rootfs directory, avoiding the problem altogether.

Florian

--GigluEW4j577Qx5zTlEs
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I initially tried to use cp -a but that gave permission errors and I d=
ecided to just</div>
<div>preserve the modes instead because that's what caused the problems in =
my case.</div>
<div>But I agree that something like cp -a would be even better.<br />Maybe=
 even a hardlink would do the job, instead of copying all the files into th=
e</div>
<div>rootfs directory, avoiding the problem altogether.</div>
<div>&nbsp;</div>
<div>Florian</div>

--GigluEW4j577Qx5zTlEs--

