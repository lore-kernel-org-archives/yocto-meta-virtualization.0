Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE61ECCA47C
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:20:29 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.9577.1657635621585119968
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=Dnd9MvLn;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id D0435320095C;
	Tue, 12 Jul 2022 10:20:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jul 2022 10:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657635620; x=1657722020; bh=zP
	WTzRKuj8lZxAMV5o1QplVIYCUuT4H0W6bKlxbTAOA=; b=Dnd9MvLnhFVi7Gs/iw
	P1s/H+03UEtG3Z1ER8ji0AgcOayPlQFlUJsOZ69oCb/lyki78ZLPY35KT6HCvxgL
	CsjLJVdCU6TzrF+P+2/UC0ZKRHJOoJlnKSAGhWGTUBntxiyw1KrDZ/8UFkyDYLyU
	YHGRTr8kTfvnZYvMkKUCpWUZa5JHHLC0hVagEMP8nPN98OQ9pmQ+ompjm39Ae04S
	G8t2J+qh4jAnvmuxrPgCra3C3hoBThnTQUXGrHCVhkODd4JmxWx4SVW2lffU2YNN
	PGG9ewfso9B94FY1IbqhqDgRYEZE++LN214eW3hRFYZoaHMeu4EncOLAT0TB7jnm
	cM5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657635620; x=1657722020; bh=zPWTzRKuj8lZx
	AMV5o1QplVIYCUuT4H0W6bKlxbTAOA=; b=LRbsk/D1ittrUU4kxmhUVcd/BZHMl
	KFAUMiaAS+AtQE2g9khzQsf2tCcWHkfKk+ol3AJPuwM2R+o0ihLh46heFouAM1UI
	ATrRMheWjglufiVFBXu0MEoWCPVX46zwxSBPBWGNAXiz0fUdHRkBu9jwebAvfsoW
	hFV9ZKerZmgBOdRvs8Wz3iM5LgMFt7sDlpOsZrUrOvTTwx8IF3Cy8a2aBof+FnJn
	LrMmv51giOm7scxlvWH6AjfknYIUsVOqHirVYYNk6sQfVLj4Xm5EvKGYUo/v4k/i
	b6T64r7p6FT5pkaQzHEhD/57gLj1TSSBkKk7jyPCOoVUQJfe3pZOZRL3w==
X-ME-Sender: <xms:JIPNYhd-tQ0TehSNsVAYBOwU8IoHj-ouc8NSIq3L7UI6oe9b73fsMA>
    <xme:JIPNYvN1uVywnQ4RBEESSOEr-HQX4ri1qFvqE9wTeSjfCuxtAi1RDAblvYr8TPCbn
    MIiqm4eQaHGWky9tCk>
X-ME-Received: 
 <xmr:JIPNYqjiU4hE7skm4ohS2bY6BU37qqgCAnHzKU2tvlKl7cG-uUKWr9jERWw6IGKZcOzeeV0Tt6qGk30uIlPt56K3ppsg4lDlep8SzYTFmvKm_v8-mmmUNm8m>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:JIPNYq_dHVEH_vBKwt02ANezb8fjOIMeIK26MqFq2ah-boDm9XdEtQ>
    <xmx:JIPNYtthero3vJmRle2sLaDGcf8rr9vBhYNfuf7N7PLRixldCX1_Cg>
    <xmx:JIPNYpEI0frxKj4S71nTbGDsPmM1rtS4F5KjyRz6VoJSfJWNHGI1hg>
    <xmx:JIPNYuVPK9iGD835-OL2yJE8o7BAIPDF5wSrxyclomh5W5SRp9pXJA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 10:20:19 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH v2 3/4] podman: Add support
 for rootless mode
Date: Tue, 12 Jul 2022 16:20:00 +0200
Message-Id: <20220712142001.881461-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712142001.881461-1-andrei@gherzan.com>
References: <20220712142001.881461-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 14:20:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7447

From: Andrei Gherzan <andrei.gherzan@huawei.com>

This support is disabled by default and exposed via PACKAGECONFIG.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 docs/00-INDEX                                      |  3 +++
 docs/podman.txt                                    | 14 ++++++++++++++
 docs/podman.txt.license                            |  3 +++
 .../podman/podman/00-podman-rootless.conf          |  6 ++++++
 recipes-containers/podman/podman_git.bb            | 11 ++++++++++-
 5 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 docs/podman.txt
 create mode 100644 docs/podman.txt.license
 create mode 100644 recipes-containers/podman/podman/00-podman-rootless.conf

diff --git a/docs/00-INDEX b/docs/00-INDEX
index 5aa1b3c..6659fbe 100644
--- a/docs/00-INDEX
+++ b/docs/00-INDEX
@@ -11,5 +11,8 @@ alphabetical order as well.
 openvswitch.txt
 	- example on how to setup openvswitch with qemu/kvm.
 
+podman.txt
+	- documentation on podman container engine integration.
+
 xvisor.txt
 	- example on how to setup Xvisor for RISC-V QEMU.
diff --git a/docs/podman.txt b/docs/podman.txt
new file mode 100644
index 0000000..66a69b3
--- /dev/null
+++ b/docs/podman.txt
@@ -0,0 +1,14 @@
+Podman
+======
+
+Rootless mode
+-------------
+
+Podman is a daemonless container engine that has as one of its features the
+ability to run in rootless mode. This requires a set of configurations and
+additional components. The OE/Yocto integration configures podman with this
+support disabled by default. This can be changed via configuration files
+(distro, local.conf, etc.) or bbappends using the `PACKAGECONFIG` variable.
+
+To enable rootless support, add `rootless` to the `PACKAGECONFIG` podman
+recipe variable.
diff --git a/docs/podman.txt.license b/docs/podman.txt.license
new file mode 100644
index 0000000..c734870
--- /dev/null
+++ b/docs/podman.txt.license
@@ -0,0 +1,3 @@
+SPDX-FileCopyrightText: Huawei Inc.
+
+SPDX-License-Identifier: MIT
diff --git a/recipes-containers/podman/podman/00-podman-rootless.conf b/recipes-containers/podman/podman/00-podman-rootless.conf
new file mode 100644
index 0000000..aaede0e
--- /dev/null
+++ b/recipes-containers/podman/podman/00-podman-rootless.conf
@@ -0,0 +1,6 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: MIT
+
+# User namespaces are required for rootless containers.
+user.max_user_namespaces	= 15000
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 4693bd6..02d8921 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -21,6 +21,7 @@ SRCREV = "717edd7b844dcd66468f5d991991d87e9fc14c12"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
     file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
+    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
 "
 
 LICENSE = "Apache-2.0"
@@ -97,6 +98,11 @@ do_install() {
 	# Silence docker emulation warnings.
 	mkdir -p ${D}/etc/containers
 	touch ${D}/etc/containers/nodocker
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'true', 'false', d)}; then
+		install -d "${D}${sysconfdir}/sysctl.d"
+		install -m 0644 "${WORKDIR}/00-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
+	fi
 }
 
 FILES:${PN} += " \
@@ -112,6 +118,9 @@ SYSTEMD_SERVICE:${PN} = "podman.service podman.socket"
 # that busybox is configured with nsenter
 VIRTUAL-RUNTIME_base-utils-nsenter ?= "util-linux-nsenter"
 
-RDEPENDS:${PN} += "conmon virtual-runc iptables cni skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter}"
+RDEPENDS:${PN} += "\
+	conmon virtual-runc iptables cni skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter} \
+	${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs slirp4netns', '', d)} \
+"
 RRECOMMENDS:${PN} += "slirp4netns kernel-module-xt-masquerade kernel-module-xt-comment"
 RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
-- 
2.25.1


