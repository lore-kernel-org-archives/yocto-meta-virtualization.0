Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E787ECCA47B
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 18:53:37 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.289.1657565609257967084
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 11:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=c2AMspTp;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 973665C0106;
	Mon, 11 Jul 2022 14:53:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 11 Jul 2022 14:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657565608; x=1657652008; bh=Gs
	9ZKIvebA7b2Lv3jWm+BAiApi+uu3K5xxYZAvHq1KA=; b=c2AMspTpVi9K4LoN5S
	JG5ZwyMeVDsb4hK9KL6yxDKfTCsWt7gQ4CsM0KfZZ0oaEDG92H+/A0dE1iOAR/fT
	+04JVqNDzfhGi88NWsPk0o4xSZhd1QPI43iUue8/k06OPGi4CTI5Z0vK4zDsdi7X
	yBn2bYSk+TseLSCcYNTdX/NOkpbUxaBP2eM56g0q5Lbil++DGxzs7TtmQDp6JbHP
	NwHKYvHdMrW/vIL5tzc/FFPR12NmMREn10D1TJ92r36lX6pNzYdDmAN28o9uYs8N
	J0fcBUe+woqmh4u0vRHF3ykOZfPBY1pCADDEIENEFKIwG/SLxoPSxdBdQmv/sg4I
	HK9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657565608; x=1657652008; bh=Gs9ZKIvebA7b2
	Lv3jWm+BAiApi+uu3K5xxYZAvHq1KA=; b=IfElKdqvq9638Kl5A3BJGx6FSi96o
	ppKxO4FpDF5nBn1739MrATTrQrpx9cS+qUeX0jaxlNn8hgCrJq2JYXjF5yTXxujf
	6yQJB9xw8JGq4fAtcFvSmeYBWxieGtG8AwP1cRewcarTr96MC5uPB8Hh1bta+Yik
	M1Gz44BuAGfsQ/DiSy484GAoLaeITEVeBaBbtXjOlHUAnvq4sio9IlMH8C8AJLSp
	hQcJDxMmchQooH+gi1aK20WNRYqDWctN9Idg9gDjdKfCoMaPs6f8SfPJeLyKQZPd
	Nb/U2x0JeyyO5fV1nhUBP+GlvgMEE/j9QL1N967yMe7YOkbLMBcu074/g==
X-ME-Sender: <xms:qHHMYmi8b0d_4cADARys4UkX22_AZeBL6S7zw0MnBe855zDxR8G6Ww>
    <xme:qHHMYnDErvXHw5VOULutp2V5sQ5uuy-B3WkwLu2UhR2wHXMxOKagcAe-rrFkL8noO
    oyzpQVqneRn5_c2LAo>
X-ME-Received: 
 <xmr:qHHMYuGbhs5L4I2LduF3Xugn8un25FzIpyh87BdTwqqa7BcqlwxKpu_xqWA66rn7njmsnHcJecuMp7iJjrANO0JoBLmJDlRdPaBIDmvP8DKTSa208Qxc_4qv>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghi
    sehghhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleehgeejheegfefgud
    eikeeggeefvdeltdeljeetgfelvdekhfffuedvjedugfenucffohhmrghinhepghhithhh
    uhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:qHHMYvTwq_UhqkcXFRLsPWUqeYAScqzbxU7HZW5N3V9MuvA2yCbWwA>
    <xmx:qHHMYjyU5Ak9LOyoW7bVMNu9bLKr5rG0nPihIaquaNxFsprrNlFaUg>
    <xmx:qHHMYt6ht8PpYxImHQFTOVOkB28P8jIbYLi2hUan2Wo5qOUuYKvXXQ>
    <xmx:qHHMYsqmbPCjX26tsqAvslBMuiKi3f3TLSRMr8ACTYILA5es2ABCkw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 14:53:27 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH v2 3/4] podman: Add support for rootless
 mode
Date: Mon, 11 Jul 2022 20:53:04 +0200
Message-Id: <20220711185305.705539-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711185305.705539-1-andrei@gherzan.com>
References: <20220711185305.705539-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 18:53:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7438

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
index 961cd18..73d3c93 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -21,6 +21,7 @@ SRCREV = "cedbbfa543651a13055a1fe093a4d0a2a28ccdfd"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.1;protocol=https \
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


