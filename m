Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA05C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 12:38:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8254.1643978294491628287
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 04:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 032E111D4
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri,  4 Feb 2022 04:38:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D6BB3F40C
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri,  4 Feb 2022 04:38:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] libibverbs: update LICENSE
Date: Fri,  4 Feb 2022 12:38:06 +0000
Message-Id: <20220204123806.950149-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 12:38:15 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7041

As per COPYING, this is BSD-2-Clause or GPLv2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-extended/libibverbs/libibverbs_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-ex=
tended/libibverbs/libibverbs_1.2.1.bb
index 90c424e..f40eccf 100644
--- a/recipes-extended/libibverbs/libibverbs_1.2.1.bb
+++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Libibverbs is a library that allows user=
space processes to use In
 HOMEPAGE =3D "http://www.openfabrics.org/downloads/verbs/"
 SECTION =3D "libs/devel"
=20
-LICENSE =3D "BSD"
+LICENSE =3D "GPLv2 | BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c557f27dd795ba77cc419dddc656=
b51"
=20
 # Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libib=
verbs.git
--=20
2.25.1


