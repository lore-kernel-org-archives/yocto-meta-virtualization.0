Return-Path: <michal.orzel@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D755C3527E
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2151.1650359246351638363
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 02:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michal.orzel@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04006106F;
	Tue, 19 Apr 2022 02:07:26 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.11.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E0DB3F5A1;
	Tue, 19 Apr 2022 02:07:24 -0700 (PDT)
From: Michal Orzel <michal.orzel@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org,
	bertrand.marquis@arm.com,
	nd@arm.com
Subject: [PATCH v2 2/3] xen: Add recipes for stable Xen 4.16 release and
 update master
Date: Tue, 19 Apr 2022 11:07:12 +0200
Message-Id: <20220419090713.134057-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419090713.134057-1-michal.orzel@arm.com>
References: <20220419090713.134057-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7190

Add recipes for Xen 4.16 release as, according to the documentation
we shall have recipes for the latest stable major version of Xen
before the next Yocto release. Bump PREFERED_VERSION to 4.16 as well.

Take the opportunity to update SRCREV of xen recipes for master
and bump XEN_REL version to 4.17 as this is the current development
version.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
-update SRCREV of 4.16 recipes to 4.16.1 as it was released a few days ag=
o
---
 .../include/meta-virt-default-versions.inc    |  4 ++--
 recipes-extended/xen/xen-tools_4.16.bb        | 19 +++++++++++++++++++
 recipes-extended/xen/xen-tools_git.bb         |  6 +++---
 recipes-extended/xen/xen_4.16.bb              | 19 +++++++++++++++++++
 recipes-extended/xen/xen_git.bb               |  6 +++---
 5 files changed, 46 insertions(+), 8 deletions(-)
 create mode 100644 recipes-extended/xen/xen-tools_4.16.bb
 create mode 100644 recipes-extended/xen/xen_4.16.bb

diff --git a/conf/distro/include/meta-virt-default-versions.inc b/conf/di=
stro/include/meta-virt-default-versions.inc
index 8a2db70..b2ce021 100644
--- a/conf/distro/include/meta-virt-default-versions.inc
+++ b/conf/distro/include/meta-virt-default-versions.inc
@@ -1,4 +1,4 @@
 # Meta-virtuailization PREFERED_VERSION
=20
-PREFERRED_VERSION_xen ?=3D "4.15+stable%"
-PREFERRED_VERSION_xen-tools ?=3D "4.15+stable%"
+PREFERRED_VERSION_xen ?=3D "4.16+stable%"
+PREFERRED_VERSION_xen-tools ?=3D "4.16+stable%"
diff --git a/recipes-extended/xen/xen-tools_4.16.bb b/recipes-extended/xe=
n/xen-tools_4.16.bb
new file mode 100644
index 0000000..ae1ae8a
--- /dev/null
+++ b/recipes-extended/xen/xen-tools_4.16.bb
@@ -0,0 +1,19 @@
+# xen 4.16.1 release sha
+SRCREV ?=3D "f26544492298cb82d66f9bf36e29d2f75b3133f2"
+
+XEN_REL ?=3D "4.16"
+XEN_BRANCH ?=3D "stable-${XEN_REL}"
+
+SRC_URI =3D " \
+    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
+    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
+    "
+
+LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
+
+PV =3D "${XEN_REL}+stable${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+require xen.inc
+require xen-tools.inc
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen=
/xen-tools_git.bb
index e733f1d..a450a7d 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,7 +1,7 @@
-# master status on 2022-03-08
-SRCREV ?=3D "9d4a44380d273de22d5753883cbf5581795ff24d"
+# master status on 2022-04-05
+SRCREV ?=3D "14dd241aad8af447680ac73e8579990e2c09c1e7"
=20
-XEN_REL ?=3D "4.16"
+XEN_REL ?=3D "4.17"
 XEN_BRANCH ?=3D "master"
=20
 SRC_URI =3D " \
diff --git a/recipes-extended/xen/xen_4.16.bb b/recipes-extended/xen/xen_=
4.16.bb
new file mode 100644
index 0000000..986484a
--- /dev/null
+++ b/recipes-extended/xen/xen_4.16.bb
@@ -0,0 +1,19 @@
+# xen 4.16.1 release sha
+SRCREV ?=3D "f26544492298cb82d66f9bf36e29d2f75b3133f2"
+
+XEN_REL ?=3D "4.16"
+XEN_BRANCH ?=3D "stable-${XEN_REL}"
+
+SRC_URI =3D " \
+    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
+    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-loca=
tion.patch \
+    "
+
+LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
+
+PV =3D "${XEN_REL}+stable${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+require xen.inc
+require xen-hypervisor.inc
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_g=
it.bb
index 2fbfb54..ebd1b76 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,7 +1,7 @@
-# master status on 2022-03-08
-SRCREV ?=3D "9d4a44380d273de22d5753883cbf5581795ff24d"
+# master status on 2022-04-05
+SRCREV ?=3D "14dd241aad8af447680ac73e8579990e2c09c1e7"
=20
-XEN_REL ?=3D "4.16"
+XEN_REL ?=3D "4.17"
 XEN_BRANCH ?=3D "master"
=20
 SRC_URI =3D " \
--=20
2.25.1


