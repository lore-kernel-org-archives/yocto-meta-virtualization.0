Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1950ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 11:31:52 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.23785.1662377503193514085
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Sep 2022 04:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=o3TlsUVi;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 870D95C00F9;
	Mon,  5 Sep 2022 07:31:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 05 Sep 2022 07:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1662377502; x=1662463902; bh=mT
	nZ3uy9Tyq67ulZ/SDdN23e/R4BOTSQTQaGsPH02jM=; b=o3TlsUVi7/4S38J5k6
	tbD87X1rpGJ70SZ5MCxZeABytSNEcMO1GzHOaCdLDsTlRn8noU7GiNVwwC13xWC9
	oEsZcmRQxVnFO/gv4hNIRCqpW6ZApfpMLfIUvwgveN/1kp8Iao1BxNJaDWbK0LyU
	5iIVlhzsVHuwUrDIXGCkvptEULc7OGJrjRePVgque3RKp39szkMPghJCJBn7G865
	5GdqyLGbQ9bypJQx7chwXe1CalL/Rwr1Nu8eNfMBe5Xr2YT+0BYeXnKyXE6apoYi
	tieLwljmFpMqlZZxFP52FrvzrUXWUUOVp42d6NIG3u2eCmkaqmHBeiVq3QRSPD28
	LREQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1662377502; x=1662463902; bh=mTnZ3uy9Tyq67
	ulZ/SDdN23e/R4BOTSQTQaGsPH02jM=; b=WQodpN6j5/uIjIIwQnU1tIvDbxJKx
	ZL5Va1NlA9rLG2mGFijaY4bW/Bfum9ZRAMORxrcxlUnYZGSNBNheW3NmpU4YBd4v
	dOQ273qjqGnNoxhmCOa8DAGqJ1YlY54Iy7kpacp5Hj6RnyhgDUG/6cqekOCQo+bn
	v3vQIHNN6NTDHZfYPuDxvyGPbCHv9OwN3L26TcysHBUIXAku702T92hpxsQG0saf
	fPz2/lsNVlYtiTHFZJcyMhW6eH7DExgMNM+mcUUl9WFYQJwQrY4EQtaEK/4G27Ng
	jGhR/LSEofFpG4jNFaH8NTIbqrHtnvLmPjF433sN/da8TOff0K2bLveWQ==
X-ME-Sender: <xms:Ht4VY_gN3l8AUb72I9z9Ar43zihcCoPvGQW60qqx1IdJU7dq5SRp5g>
    <xme:Ht4VY8DeroqRhkhwdZt_d2b8GR-mbu6xw43ICqztqCK9BhfDlHEbha2BzcDFwrKPT
    nPssaTa-jigqWzN-Kg>
X-ME-Received: 
 <xmr:Ht4VY_Gv9fi5b3OdidnKptETekKYw2M3aLv6_LLikV-x5ma9xIzsL-dCaPXnTGzZS_awoLML-iaV__WUlcx5dRTsXh60Xgelp00FBvoMt8c3BdXaFpRWX7VH>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:Ht4VY8TbvTFW85-l5rOPrk-OJS0Wiprsg_00P1IKvvhKg5vt01wcVA>
    <xmx:Ht4VY8xuPI75sT2Nt7usis7WDcp6BCTXiGG2PyB9hDK3vXWz30NKhQ>
    <xmx:Ht4VYy4RPWij_6t2jF5C1QLFhVnGM6MeiZ9-iwv1wv0tisqME_ZfHg>
    <xmx:Ht4VY5obo-9D1Ys8lgx0EvV2rP2P3ZSjQoerkTHv7em9M2vyeJ12FA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 07:31:41 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH 3/3] podman: Add ptest support
 for system tests
Date: Mon,  5 Sep 2022 13:31:16 +0200
Message-Id: <20220905113116.1766939-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905113116.1766939-1-andrei@gherzan.com>
References: <20220905113116.1766939-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Sep 2022 11:31:52 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7598

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
index 09bf827..9dd40d4 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
     file://CVE-2022-27649.patch;patchdir=src/import \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
+    file://run-ptest \
 "
 
 LICENSE = "Apache-2.0"
@@ -49,7 +50,7 @@ export LDFLAGS=""
 TOOLCHAIN = "gcc"
 
 inherit go goarch
-inherit systemd pkgconfig
+inherit systemd pkgconfig ptest
 
 do_configure[noexec] = "1"
 
@@ -110,6 +111,17 @@ do_install() {
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
@@ -129,3 +141,16 @@ RDEPENDS:${PN} += "\
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


