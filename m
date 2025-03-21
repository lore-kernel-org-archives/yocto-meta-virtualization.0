Return-Path: <k4230r6@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0951C35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 07:58:38 +0000 (UTC)
Subject: Re: Docker Compose is broken in the kirkstone branch
To: meta-virtualization@lists.yoctoproject.org
From: "Christian Ege" <k4230r6@gmail.com>
X-Originating-Location: CH (147.161.229.79)
X-Originating-Platform: Linux Chrome 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 21 Mar 2025 00:58:37 -0700
References: <pqcZ.1742295934410662356.eyju@lists.yoctoproject.org>
In-Reply-To: <pqcZ.1742295934410662356.eyju@lists.yoctoproject.org>
Message-ID: <31837.1742543917751179729@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="D4Hatylgld4d0nwsFlgR"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Mar 2025 07:58:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9170

--D4Hatylgld4d0nwsFlgR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hej, just a heads up, I have created a two bugfixes on my GitHub repo, unfo=
rtunately is sending mails to Mailing lists behind a corporate firewall a r=
eal pain.

- https://github.com/graugans/meta-virtualization/commit/d410a33c570f3cf087=
dc06dcc9ab8f8045189a11
- https://github.com/graugans/meta-virtualization/commit/4149812ca9581a313d=
e27c45a0f2dfa7bd8f53df

I also have created a test repo to verify this:

https://github.com/graugans/meta-docker-compose

I hope that's okay for you guys to pull in the changes.

Best
Christian

--D4Hatylgld4d0nwsFlgR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hej, just a heads up, I have created a two bugfixes on my GitHub repo,=
 unfortunately is sending mails to Mailing lists behind a corporate firewal=
l a real pain.</div>
<div>&nbsp;</div>
<div>- <a href=3D"https://github.com/graugans/meta-virtualization/commit/d4=
10a33c570f3cf087dc06dcc9ab8f8045189a11" target=3D"_blank" rel=3D"noopener">=
https://github.com/graugans/meta-virtualization/commit/d410a33c570f3cf087dc=
06dcc9ab8f8045189a11</a></div>
<div>- <a href=3D"https://github.com/graugans/meta-virtualization/commit/41=
49812ca9581a313de27c45a0f2dfa7bd8f53df" target=3D"_blank" rel=3D"noopener">=
https://github.com/graugans/meta-virtualization/commit/4149812ca9581a313de2=
7c45a0f2dfa7bd8f53df</a></div>
<div>&nbsp;</div>
<div>I also have created a test repo to verify this:</div>
<div>&nbsp;</div>
<div><a href=3D"https://github.com/graugans/meta-docker-compose" target=3D"=
_blank" rel=3D"noopener">https://github.com/graugans/meta-docker-compose</a=
></div>
<div>&nbsp;</div>
<div>I hope that's okay for you guys to pull in the changes.</div>
<div>&nbsp;</div>
<div>Best</div>
<div>Christian</div>

--D4Hatylgld4d0nwsFlgR--

