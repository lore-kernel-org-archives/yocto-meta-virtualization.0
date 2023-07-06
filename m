Return-Path: <ml@calgera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1126EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 22:53:55 +0000 (UTC)
Received: from t4v1.calgera.eu (t4v1.calgera.eu [80.208.226.141])
 by mx.groups.io with SMTP id smtpd.web10.579.1688684026047163474
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 15:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@calgera.com header.s=mail header.b=S0jjk/R4;
 spf=pass (domain: calgera.com, ip: 80.208.226.141, mailfrom: renato@calgera.com)
Received: (nullmailer pid 3085628 invoked by uid 1000);
	Thu, 06 Jul 2023 22:53:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=calgera.com; s=mail;
	t=1688684023; bh=1DZ5/RED79zJvi/GgWKQBfxraY1upJ1uq9uJD44IQFM=;
	h=From:To:Cc:Subject:Date:From;
	b=S0jjk/R4d6Ky1OURxHO4o26c0v2Fmt6fuoTIBIQBscig+W0GurYbIQsyJE/Jc8aUs
	 6r8G2420PQoCMuhnz6hMfOpK/jyPH/fVJiKKR3JEdh0KW8MSFnokyLnfLm3KrCcLjh
	 fYcPrsfa4nZPgtFUS+hh0tmbkGfqDHbsa+m4Mw8pO0h90+ycvhJEiTceFxxILn/3Ok
	 KCg61Qs1kWXFd648ECEU6JnBiiuDAR12sbmadgNbhlhuVjYLmQGSKHAfw6W9DZFAcr
	 haBpvekFbRqq59Vl7NVEYoVpyrX/2clCN/e2oK0riOxVpsZ977FFZa2lv+WaSynSCZ
	 tHdHyFE+rScVQ==
From: Renato Caldas <ml@calgera.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Renato Caldas <renato@calgera.com>
Subject: [meta-virtualization][PATCH] cri-o: drop unneeded dependency on virtual-containerd
Date: Thu,  6 Jul 2023 23:53:13 +0100
Message-ID: <20230706225313.3085607-1-ml@calgera.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Jul 2023 22:53:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8122

From: Renato Caldas <renato@calgera.com>

Signed-off-by: Renato Caldas <renato@calgera.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/c=
ri-o/cri-o_git.bb
index 3b6bbf3..7ff3610 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[selinux] =3D ",,libselinux"
=20
 PACKAGES =3D+ "${PN}-config"
=20
-RDEPENDS:${PN} +=3D " virtual-containerd ${VIRTUAL-RUNTIME_container_run=
time}"
+RDEPENDS:${PN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
 RDEPENDS:${PN} +=3D " e2fsprogs-mke2fs conmon util-linux iptables conntr=
ack-tools"
=20
 inherit systemd
--=20
2.41.0


