Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE4EC77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 09:54:37 +0000 (UTC)
Subject: Re: [dunfell][PATCH] lxc: Fix CVE-2022-47952
To: meta-virtualization@lists.yoctoproject.org
From: "Ranjitsinh Rathod" <ranjitsinh.rathod@kpit.com>
X-Originating-Location: Pune, Maharashtra, IN (165.225.120.234)
X-Originating-Platform: Linux Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 20 Apr 2023 02:54:37 -0700
References: <Y/ThAuqvluHZM+/x@gmail.com>
In-Reply-To: <Y/ThAuqvluHZM+/x@gmail.com>
Message-ID: <27624.1681984477160553329@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="5Icakk8n75c3LWEgQGsc"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Apr 2023 09:54:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8002

--5Icakk8n75c3LWEgQGsc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

When I checked in https://github.com/lxc/lxc/compare/stable-4.0 branch and =
check, it seems the CVE is not fixed there and so this fix is not available=
 for the 4.0.12 version as well if we sned the bump.

Please suggest what we can do here to fix the CVE at least for the dunfell =
branch.

If CVE is not fixed in the stable branch for lxc upstream, do we not going =
to fix this CVE by applying a patch?

Thanks,
Ranjitsinh Rathod

--5Icakk8n75c3LWEgQGsc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,<br /><br />When I checked in <a href=3D"https://github.com/lxc/lx=
c/compare/stable-4.0" target=3D"_blank" rel=3D"noopener">https://github.com=
/lxc/lxc/compare/stable-4.0</a>&nbsp;branch and check, it seems the CVE is =
not fixed there and so this fix is not available for the 4.0.12 version as =
well if we sned the bump.<br /><br />Please suggest what we can do here to =
fix the CVE at least for the dunfell branch.<br /><br />If CVE is not fixed=
 in the stable branch for lxc upstream, do we not going to fix this CVE by =
applying a patch?<br /><br />Thanks,<br />Ranjitsinh Rathod

--5Icakk8n75c3LWEgQGsc--

