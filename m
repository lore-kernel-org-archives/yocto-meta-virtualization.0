Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A33E909A6
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 13:59:47 +0000 (UTC)
Subject: Re: [PATCH 0/3] Update docker-moby to v25.0.9
To: meta-virtualization@lists.yoctoproject.org
From: felix@piedallu.me
X-Originating-Location: FR (82.67.19.185)
X-Originating-Platform: Linux Firefox 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 17 Feb 2026 05:59:39 -0800
References: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com> <CADkTA4PF6nXSAm7Fo3DT8vPgEEiUStXO9zidXgVhwfyM5Hbzmw@mail.gmail.com> <960627.1771320595010970409@lists.yoctoproject.org> <CADkTA4NDJxJWfnvDAaY2BxrCtmroX5C6Qof9K=LY3gRVLX6VRg@mail.gmail.com>
In-Reply-To: <CADkTA4NDJxJWfnvDAaY2BxrCtmroX5C6Qof9K=LY3gRVLX6VRg@mail.gmail.com>
Message-ID: <15866.1771336779618346118@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="78B8KexKMO5Z91TXyzr5"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Feb 2026 13:59:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9598

--78B8KexKMO5Z91TXyzr5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> That's what I said :)
>=20
> If a newer go is available in a mixin layer, I'd accept a newer docker
> update in scarthgap. I just wouldn't replace the old recipe, it would be
> offered along side of the older one, and we'd pin the default to the last
> one that works with the go version in oe-core.
>=20

Ah, alright :) I didn't get it.
For now it seems that no layer provides go >=3D 1.23 for Scarthgap. So Dock=
er 25.0.9 is the last possible version for Scarthgap.
F=C3=A9lix

--78B8KexKMO5Z91TXyzr5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<blockquote>
<div class=3D"gmail_default">That's what I said :)</div>
<div class=3D"gmail_default">&nbsp;</div>
<div class=3D"gmail_default">If a newer go is available in a mixin layer, I=
'd accept a newer docker update in scarthgap. I just wouldn't replace the o=
ld recipe, it would be offered along side of the older one, and we'd pin th=
e default to the last one that works with the go version in oe-core.</div>
</blockquote>
Ah, alright :) I didn't get it.</div>
<div>For now it seems that no layer provides go &gt;=3D 1.23 for Scarthgap.=
 So Docker 25.0.9 is the last possible version for Scarthgap.</div>
<div>F&eacute;lix</div>
<div>&nbsp;</div>

--78B8KexKMO5Z91TXyzr5--

