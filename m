Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD2EC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.27412.1649673950947507856
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 03:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A961A169E;
	Mon, 11 Apr 2022 03:45:49 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21BA63F5A1;
	Mon, 11 Apr 2022 03:45:49 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH] cni: Add ;protocol=https for
 flannel_plugin SRC_URI
Date: Mon, 11 Apr 2022 11:45:33 +0100
Message-Id: 
 <d3d2905df2c1a8387caaec078700c1666a4df821.1649673869.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7148

Also, fix the indentation for the SRC_URI variable assignment.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-networking/cni/cni_git.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/c=
ni_git.bb
index 42eed1b..9248af2 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -15,10 +15,11 @@ SRCREV_plugins =3D "b8a10bbe111e9db72433f357c37077554=
ada7ca1"
 SRCREV_flannel_plugin =3D "076c4462d6c6887614fc881b806b690b9e56ceb2"
 SRCREV_FORMAT =3D "cni_plugins"
 SRC_URI =3D "\
-	git://github.com/containernetworking/cni.git;nobranch=3D1;name=3Dcni;pr=
otocol=3Dhttps \
-        git://github.com/containernetworking/plugins.git;nobranch=3D1;de=
stsuffix=3D${S}/src/github.com/containernetworking/plugins;name=3Dplugins=
;protocol=3Dhttps \
-        git://github.com/flannel-io/cni-plugin;branch=3Dmain;name=3Dflan=
nel_plugin;protcol=3Dhttps;destsuffix=3D${S}/src/github.com/containernetw=
orking/plugins/plugins/meta/flannel \
-	"
+    git://github.com/containernetworking/cni.git;nobranch=3D1;name=3Dcni=
;protocol=3Dhttps \
+    git://github.com/containernetworking/plugins.git;nobranch=3D1;destsu=
ffix=3D${S}/src/github.com/containernetworking/plugins;name=3Dplugins;pro=
tocol=3Dhttps \
+    git://github.com/flannel-io/cni-plugin;branch=3Dmain;name=3Dflannel_=
plugin;protcol=3Dhttps;destsuffix=3D${S}/src/github.com/containernetworki=
ng/plugins/plugins/meta/flannel;protocol=3Dhttps \
+    "
+
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3Dfa818a259cbed7ce8b=
c2a22d35a464fc"
=20
--=20
2.35.1


