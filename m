Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7407BC3A59F
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10724.1649261706095165045
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 09:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0588923A
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed,  6 Apr 2022 09:15:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6B623F73B
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed,  6 Apr 2022 09:15:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] virt-what: add new recipe
Date: Wed,  6 Apr 2022 17:14:40 +0100
Message-Id: <20220406161440.2629415-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7125

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-extended/virt-what/virt-what_1.21.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 recipes-extended/virt-what/virt-what_1.21.bb

diff --git a/recipes-extended/virt-what/virt-what_1.21.bb b/recipes-exten=
ded/virt-what/virt-what_1.21.bb
new file mode 100644
index 0000000..aa235b3
--- /dev/null
+++ b/recipes-extended/virt-what/virt-what_1.21.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "Detect if we are running in a virtual machine"
+HOMEPAGE =3D "https://people.redhat.com/~rjones/virt-what/"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+SRC_URI =3D "https://people.redhat.com/~rjones/virt-what/files/${BP}.tar=
.gz"
+SRC_URI[sha256sum] =3D "12cb455334aa4cfd53ab78f27e2252e94d1f676dd093f483=
27ed94d8080d1f7b"
+
+DEPENDS =3D "perl-native"
+
+inherit autotools
--=20
2.25.1


