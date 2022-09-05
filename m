Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44A0ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 11:30:42 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.23527.1662377439131050364
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Sep 2022 04:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=gOMwLiks;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 772BD5C00F3;
	Mon,  5 Sep 2022 07:30:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 05 Sep 2022 07:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1662377438; x=1662463838; bh=BZ
	cEqe1S9mX+b/1tW12fNxPVMq0dm4GZS3764xH8vpk=; b=gOMwLiksgq5hE5OjY3
	FDJzPj8lWGocGkQEKpPuyGhOpz2vX0yBEPjrTuHmPZK8MviUplliugaZTjJiTgl3
	wIv9BnD+opJf0J12WuO1sXQzddpE5EEf3mugs4TGAR0UeXCS+pBAE0bMPaEgesb6
	fHx3njp4J+lMntIwtbXzita4BqKcYPgx94nh2/tuiIgosMAdFjdTnPHw7+2R+4/I
	AZrfiu6X+rWEHrF1eQ3xkaLZymya5MG1tMuzkMo1VASbN29YHNF7q5YZkODzh5sg
	23suhJ07v2ofQwkTr3OuZZiW0oC904hcGFPN8ikElyd3iP7Go+FuiWGikbWxSo2C
	XQhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1662377438; x=1662463838; bh=BZcEqe1S9mX+b
	/1tW12fNxPVMq0dm4GZS3764xH8vpk=; b=QnG2UvnCwF3PtvSR/LqWrl1Qmc3QK
	BlxPc+1281pH7wSIbXgppzD9HasbeIXiGHJV3KJMMPA4RZmc2ykhr/sONnWlhpdP
	ptXfS2AiT0d/UjceHtaXDT3pn0OcNQ99LuiAtCUEU1y0Gaa8QEEEKavmioaDsOXE
	3HISVfbNt1zOz3FL1vtvu/mgLcOJ/VdNmxxp3LZM9bvB9SRRbZHi0Ng3ygKq2FrM
	gYb64uXUI3p5yJAGH1XXfPnx7OJBc6vLm16aXAhoi9Mro8eR0PbTyIARg7kCJZSG
	CmJI50/YKTQGO0P0QGs7l5DRt62sj81auO6RwOQ+TlXQJyUnwayl5+MqA==
X-ME-Sender: <xms:3t0VY9HbZRjiDuMZ2HK1uIZSKC_DJscKHeqF5DQTa6I01fyR-2QWnw>
    <xme:3t0VYyV6fhFdVtKCi7UFcUTDbEPWc9q9HaaBBlCNGj0-Lo4y4MgrXW5099KsLPCDZ
    XBQt3atEz6P63rSJ2I>
X-ME-Received: 
 <xmr:3t0VY_KXE7yMdccf-_S1l2wGS8AEj_S6V634N7e3-fsbzD2D4f2IY_EiFvZ3d0KSyfgU78LDbQauFNNaB2Zfp4f_7V7_mZ_I79Y_rrgSyxwGqI6inQ0IzS1->
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:3t0VYzGK1uKwlgvofKXUhypwJzG4G-x39rQduZSzDEcHf1VJ7yuNOQ>
    <xmx:3t0VYzWh8HTAUb5X46x_4-MrIrMa9AvBfcJI1FC9fEyYtHU1b8l_9w>
    <xmx:3t0VY-PdDA_EnkoDeN7I0UyjGVsp-NDY-QU90un49EOLtQ0EHgU5og>
    <xmx:3t0VY6dK6ACUGsdpvpRnJZBpPeOp-PmUjIq5LFCJigGTcF7KXmaA9A>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 07:30:37 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][master][PATCH 2/2] podman: Add ptest support
 for system tests
Date: Mon,  5 Sep 2022 13:30:03 +0200
Message-Id: <20220905113003.1730364-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905113003.1730364-1-andrei@gherzan.com>
References: <20220905113003.1730364-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Sep 2022 11:30:42 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7595

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/podman/podman/run-ptest | 13 +++++++++++
 recipes-containers/podman/podman_git.bb    | 27 +++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/podman/podman/run-ptest

diff --git a/recipes-containers/podman/podman/run-ptest b/recipes-containers/podman/podman/run-ptest
new file mode 100644
index 0000000..108ff45
--- /dev/null
+++ b/recipes-containers/podman/podman/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: MIT
+
+#
+# Podman system tests
+#
+
+# The system tests don't need any go related variables. Dummy-define them to
+# avoid useless warnings/errors.
+GOOS=undefined GO=true BUILDTAGS= make localsystem
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index e999192..e0d7164 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
     file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
+    file://run-ptest \
 "
 
 LICENSE = "Apache-2.0"
@@ -48,7 +49,7 @@ export LDFLAGS=""
 TOOLCHAIN = "gcc"
 
 inherit go goarch
-inherit systemd pkgconfig
+inherit systemd pkgconfig ptest
 
 do_configure[noexec] = "1"
 
@@ -109,6 +110,17 @@ do_install() {
 	fi
 }
 
+do_install_ptest () {
+	cp ${S}/src/import/Makefile ${D}${PTEST_PATH}
+	install -d ${D}${PTEST_PATH}/test
+	cp -r ${S}/src/import/test/system ${D}${PTEST_PATH}/test
+
+	# Some compatibility links for the Makefile assumptions.
+	install -d ${D}${PTEST_PATH}/bin
+	ln -s ${bindir}/podman ${D}${PTEST_PATH}/bin/podman
+	ln -s ${bindir}/podman-remote ${D}${PTEST_PATH}/bin/podman-remote
+}
+
 FILES:${PN} += " \
     ${systemd_unitdir}/system/* \
     ${systemd_unitdir}/user/* \
@@ -128,3 +140,16 @@ RDEPENDS:${PN} += "\
 "
 RRECOMMENDS:${PN} += "slirp4netns kernel-module-xt-masquerade kernel-module-xt-comment"
 RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
+
+RDEPENDS:${PN}-ptest += " \
+	bash \
+	bats \
+	buildah \
+	catatonit \
+	coreutils \
+	file \
+	gnupg \
+	jq \
+	make \
+	tar \
+"
-- 
2.25.1


