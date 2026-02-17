Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08432E68152
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:30:05 +0000 (UTC)
Subject: Re: [PATCH 0/3] Update docker-moby to v25.0.9
To: meta-virtualization@lists.yoctoproject.org
From: felix@piedallu.me
X-Originating-Location: Manchester, England, GB (165.225.196.66)
X-Originating-Platform: Windows Chrome 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 17 Feb 2026 01:29:55 -0800
References: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com> <CADkTA4PF6nXSAm7Fo3DT8vPgEEiUStXO9zidXgVhwfyM5Hbzmw@mail.gmail.com>
In-Reply-To: <CADkTA4PF6nXSAm7Fo3DT8vPgEEiUStXO9zidXgVhwfyM5Hbzmw@mail.gmail.com>
Message-ID: <960627.1771320595010970409@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="ZOv2jkdarCx6WVBNQOxr"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Feb 2026 09:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9596

--ZOv2jkdarCx6WVBNQOxr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> So I assume this is for scarthgap ?=C2=A0 That's not indicated in the sub=
ject
> line, so I want to be sure.
>=20

Yes, it is for Scarthgap.
>=20
> Also note, if a newer go is backported to one of the mixin layers, I'm
> find to take newer 25.x releases of docker, we just need to select a
> default that builds with oe-core only.
>=20

Yes, 25.0.9 is the last release that will build with oe-core. We would need=
 to update oe-core before updating to newer 25.0.x releases or newer branch=
es (e.g v29).
F=C3=A9lix

--ZOv2jkdarCx6WVBNQOxr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>
<blockquote>
<div class=3D"gmail_default">So I assume this is for scarthgap ?&nbsp; That=
's not indicated in the subject line, so I want to be sure.</div>
</blockquote>
Yes, it is for Scarthgap.
<blockquote>
<div class=3D"gmail_default">Also note, if a newer go is backported to one =
of the mixin layers, I'm find to take newer 25.x releases of docker, we jus=
t need to select a default that builds with oe-core only.</div>
</blockquote>
Yes, 25.0.9 is the last release that will build with oe-core. We would need=
 to update oe-core before updating to newer 25.0.x releases or newer branch=
es (e.g v29).</div>
<div>F&eacute;lix</div>
</div>

--ZOv2jkdarCx6WVBNQOxr--

