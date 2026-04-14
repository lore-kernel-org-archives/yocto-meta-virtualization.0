Return-Path: <tanguy.raufflet@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B586ED7B92
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 09:06:33 +0000 (UTC)
Subject: Re: [PATCH] libvirt-dbus: disable -Werror=inline to fix build error
To: meta-virtualization@lists.yoctoproject.org
From: "Tanguy Raufflet" <tanguy.raufflet@savoirfairelinux.com>
X-Originating-Location: FR (80.15.101.118)
X-Originating-Platform: Linux Firefox 149
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 02:06:27 -0700
References: <20260413115239.79131-1-tanguy.raufflet@savoirfairelinux.com> <1805d421-2e6f-4dd3-835a-e187a3152eca@windriver.com>
In-Reply-To: <1805d421-2e6f-4dd3-835a-e187a3152eca@windriver.com>
Message-ID: <1047141.1776157587979139642@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="TV0KOQxuPyi7kmGFDEty"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2026 09:06:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9703

--TV0KOQxuPyi7kmGFDEty
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for the review.

The flag "-Winline" has been removed recently upstream.

I've modified the commit to reference the upstream commit and a note to rem=
ove the workaround on the next version bump.
https://lists.yoctoproject.org/g/meta-virtualization/message/9702

--TV0KOQxuPyi7kmGFDEty
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div>
<div>&nbsp;</div>
<div>Thanks for the review.<br /><br /></div>
<div>The flag "-Winline" has been removed recently upstream.</div>
<div>&nbsp;</div>
<div>I've modified the commit to reference the upstream commit and a note t=
o remove the workaround on the next version bump.</div>
<div>https://lists.yoctoproject.org/g/meta-virtualization/message/9702</div=
>

--TV0KOQxuPyi7kmGFDEty--

