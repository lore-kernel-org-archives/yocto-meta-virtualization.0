Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76CAC02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 09:36:36 +0000 (UTC)
Subject: Re: [kirkstone][PATCH 1/1] runc-docker: upgrade 1.1.4 -> 1.1.12
To: meta-virtualization@lists.yoctoproject.org
From: "Jonas Gorski" <jonas.gorski@bisdn.de>
X-Originating-Location: Berlin, Land Berlin, DE (2.205.17.249)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 05 Feb 2025 01:36:28 -0800
References: <12196.1738732187186511335@lists.yoctoproject.org>
In-Reply-To: <12196.1738732187186511335@lists.yoctoproject.org>
Message-ID: <22391.1738748188874422514@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 09:36:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9119

Hi,

On Wed, Feb  5, 2025 at 06:09 AM, Ranjitsinh Rathod wrote:
> Hello Bruce,
>=20
> After this merge,
> 0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch is gettin=
g
> failed for runc-opencontainers as this recipe also uses this patch and no=
t
> upgraded to 1.1.12 and still uses 1.1.4.
>=20
> Is it possible to also upgrade runc-opencontainers to 1.1.12 to fix same =
CVEs
> which we fixed for runc-docker, else we may need to maintain two patches =
for
> two different versions.

I want to second that, especially since runc-opencontainers is the default =
provider for virtual/runc in kirkstone, so this broke it for everyone not e=
xplicitly using runc-docker.

Also the change of patch targets via patchdir isn't done in master; they st=
ill target git/src/import. I'm not sure it's a good idea to deviate how mas=
ter is doing things. Makes backporting things harder.

Best regards,
Jonas

