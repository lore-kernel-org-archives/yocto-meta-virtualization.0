Return-Path: <richard.neill@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7CCC433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:09:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6971.1651673353388659033
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 194C41042;
	Wed,  4 May 2022 07:09:13 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.2.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F1B73F85F;
	Wed,  4 May 2022 07:09:12 -0700 (PDT)
From: Richard Neill <richard.neill@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization] [PATCH] docker: Add runtime provide for
 virtual-docker
Date: Wed,  4 May 2022 15:09:17 +0100
Message-Id: <20220504140917.623536-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 May 2022 14:09:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7241

This patch enables successful runtime-dependency on the Docker preferred
provider, as virtual/docker does not resolve. Doing so aligns with other =
virtual
package providers (e.g. virtual-runc), and follows the Yocto Project
documentation
(https://docs.yoctoproject.org/singleindex.html#virtual-runtime-provides)=
.

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 recipes-containers/docker/docker.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/do=
cker/docker.inc
index 40a3642..e196f9b 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -32,6 +32,7 @@ RDEPENDS:${PN} +=3D "virtual-containerd virtual-runc"
 RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool kernel-module-nf-nat k=
ernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module=
-xt-masquerade"

 PROVIDES +=3D "virtual/docker"
+RPROVIDES:${PN} +=3D "virtual-docker"

 # we want all the docker variant recpes to be installable via "docker"
 PACKAGE_NAME =3D "docker"
--
2.25.1


