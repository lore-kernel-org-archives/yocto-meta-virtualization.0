Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF469C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 11:09:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4288.1646824165595388255
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 03:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30DA41650;
	Wed,  9 Mar 2022 03:09:24 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 665303FA4D;
	Wed,  9 Mar 2022 03:09:23 -0800 (PST)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	christopher.w.clark@gmail.com,
	cardoe@gentoo.org,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH] xen: Override CC and CPP in make command line
Date: Wed,  9 Mar 2022 11:09:06 +0000
Message-Id: <20220309110906.2925117-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Mar 2022 11:09:26 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7079

From: Michal Orzel <michal.orzel@arm.com>

After 4.16 release, Xen build system has been changed significantly.
When building latest status of Xen it was observed that commit
317c98cb91 broke the hypervisor build on arm32 due to the change in
handling Rules.mk that xen.inc modifies to override CC and CPP.

In order to fix the issue this patch moves overriding CC and CPP from
Rules.mk to make command line by adding them to EXTRA_OEMAKE:arm.

Take the opportunity to bump SRCREV of xen_git.bb and xen-tools_git.bb
to the current status of master.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 8 ++++++++
 recipes-extended/xen/xen-tools_git.bb   | 4 ++--
 recipes-extended/xen/xen.inc            | 6 ------
 recipes-extended/xen/xen_git.bb         | 4 ++--
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/x=
en/xen-hypervisor.inc
index 81e361f..6f3d24d 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -48,6 +48,14 @@ do_configure() {
     fi
 }
=20
+# The hypervisor binary for arm must not be built with the hard floating=
 point
+# ABI. Override CC and CPP when invoking make so that they do not contai=
n
+# TUNE_CCARGS.
+EXTRA_OEMAKE:arm +=3D "CC=3D'${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTI=
ONS} \
+                         ${CC_REPRODUCIBLE_OPTIONS}' \
+                     CPP=3D'${CCACHE}${HOST_PREFIX}gcc -E ${TOOLCHAIN_OP=
TIONS} \
+                         ${CC_REPRODUCIBLE_OPTIONS}'"
+
 do_compile() {
     oe_runmake xen PYTHON=3D"${PYTHON}" \
                    EXTRA_CFLAGS_XEN_CORE=3D"${EXTRA_CFLAGS_XEN_CORE}"
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen=
/xen-tools_git.bb
index 8ff9c4c..e733f1d 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,5 +1,5 @@
-# master status on 2020-10-21
-SRCREV ?=3D "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
+# master status on 2022-03-08
+SRCREV ?=3D "9d4a44380d273de22d5753883cbf5581795ff24d"
=20
 XEN_REL ?=3D "4.16"
 XEN_BRANCH ?=3D "master"
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 4df99bf..8b86de5 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -193,12 +193,6 @@ do_post_patch() {
     fi
 }
=20
-do_post_patch:append:arm()  {
-    # The hypervisor binary must not be built with the hard floating poi=
nt ABI.
-    echo "CC :=3D \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${S}/xen/arch=
/arm/Rules.mk
-    echo "CPP :=3D \$(filter-out ${TUNE_CCARGS},\$(CPP))" >> ${S}/xen/ar=
ch/arm/Rules.mk
-}
-
 addtask post_patch after do_patch before do_configure
=20
 # Allow all hypervisor settings in a defconfig
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_g=
it.bb
index e014733..2fbfb54 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,5 +1,5 @@
-# master status on 2020-10-21
-SRCREV ?=3D "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
+# master status on 2022-03-08
+SRCREV ?=3D "9d4a44380d273de22d5753883cbf5581795ff24d"
=20
 XEN_REL ?=3D "4.16"
 XEN_BRANCH ?=3D "master"
--=20
2.25.1


