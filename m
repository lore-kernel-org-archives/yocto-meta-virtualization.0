Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755B0E7107A
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 14:12:32 +0000 (UTC)
Subject: Re: [PATCH] docker: update from 24.0.2 to 24.0.5
To: meta-virtualization@lists.yoctoproject.org
From: "Adam Johnston" <adam.johnston@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.106.13)
X-Originating-Platform: Windows Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 21 Sep 2023 07:12:28 -0700
References: <ZQw/9kbKangmiM34@nuoska>
In-Reply-To: <ZQw/9kbKangmiM34@nuoska>
Message-ID: <558.1695305548586655871@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="XKDJh8oYFv2IAreF04nH"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Sep 2023 14:12:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8316

--XKDJh8oYFv2IAreF04nH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 02:07 PM, Mikko Rapeli wrote:

>=20
> 49fdcebf5b28d0661313bc34361f031f28db194e moby: update to v24.0.2
> 23373571e71f951b16defae9dbee589168753322 moby: update to v24.0.5

We've already tested v24.0.5 (with mickledore) and can confirm it does fix =
the issue, however my assumption was that sticking with docker 23.x.x was p=
referred for stable/mickledore

Am I right/wrong?

--XKDJh8oYFv2IAreF04nH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 02:07 PM, Mikko Rapeli wrote:<br />
<blockquote>49fdcebf5b28d0661313bc34361f031f28db194e moby: update to v24.0.=
2<br />23373571e71f951b16defae9dbee589168753322 moby: update to v24.0.5</bl=
ockquote>
<p>We've already tested v24.0.5 (with mickledore) and can confirm it does f=
ix the issue, however my assumption was that sticking with docker 23.x.x wa=
s preferred for stable/mickledore</p>
<p>Am I right/wrong?</p>

--XKDJh8oYFv2IAreF04nH--

