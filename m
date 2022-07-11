Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC38C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:00:50 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web11.28246.1657544448068116338
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=EnHxdXno;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 651C55C0040;
	Mon, 11 Jul 2022 09:00:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 11 Jul 2022 09:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657544447; x=1657630847; bh=qn
	XJWfgrxC8pGFeZ9DlZSnFQ8+fxSxX/LcL9sFGCTBU=; b=EnHxdXnoMCGloGfyg7
	5I3oPmJeFUh+eN4YQha3Izm0uM4QrFWRqH0gZBTLEpRjRm7JGUg+Vty5M6h43tG3
	NIogVwofV9R7XXtwD0uo9HWFrUos+Z8kJ7WX4qa+mWemUXirvmbsnnliEalpzByZ
	LhrDZTNs1zdxQGHbnsXzqL5abjoacehuiXLNw9t4i86SJ1xzd2mYS8UVtiWpSNZ4
	yeIXefALbBuERxYUhOWzusuB8bg6CzNDOHv2hegzduof72xzA4OnMKJs3EK1KgGw
	zpAfrgNYL/IgkDwsqN2+tmPGYsTsUdTEraMlFgLYrdfibtdE7dH2FQZd8T2VMdiH
	hK6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657544447; x=1657630847; bh=qnXJWfgrxC8pG
	FeZ9DlZSnFQ8+fxSxX/LcL9sFGCTBU=; b=TrThVZXEPNxfQJvBLxx507Oaetnif
	IsIid2CU7vyNeWiiONN/VpcDw9Yl59w/sGu47l94d3akwZ4QwDo3IfPpT9qyyieF
	FaRMkQJzC2PLkh3O+599bAsX8dImvmcSoBi+IG56Xhx6fPjDLewIZc4Q4KXEAew0
	bAMDXqboWhtCetWtl9hIqzlnAkpVeUwcM/ofwYhrb6tfZq4VedoHxX9tdoizztWH
	JN5nTkcbBMC5pd4qfl5cz1ovEI7mxowUOK9RLZPHsmkqibb7MpZhy9elpIaMCw8g
	YMCVo87AmXSi8qp2OSdu3heRIMHNwBD7VoG5Fg8MvHscnoLySbKO5TL/w==
X-ME-Sender: <xms:_R7MYjdQ6UTXnzNoiQrRneSmeqO_dtPD9kR5AHd3dpb6fvdYkd7aBw>
    <xme:_R7MYpOtEuLh4LTJuTm__yDQmjakNlZZOovaHl058eHMKXO05elBlzb7Ac0oQ_HNr
    Ozj8T3gkFgVPVDNh5Y>
X-ME-Received: 
 <xmr:_R7MYshRyn4A1LkRbI38TCDvNbuXWdVcN7sJk4bxMBaEh_X49zjF7YPM0xfqgsyY3O8Efmu_1B9cK73wuz1djok8slMy9DAvk7ZQ3VwAsQWQ7OHftHzeAuzX>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:_R7MYk_u4dos1OyXjdrmWPYUtSE8n527LxAnhm1kaIcsFFvsHQdX2Q>
    <xmx:_R7MYvs1ZZ3d7mrmQLIiRGm6sINTbhqdNRsRynunYMenZCH_Cyj-aw>
    <xmx:_R7MYjEa4uBQTPXJhUf4U281Iws6jqeRCeddmyyaOlkkC9z_yyubaw>
    <xmx:_x7MYoXU5CeY5KshGtgQXW5dzvYEpo3Q9L3yZ_WBM-CGWk_EE4VqWQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 09:00:45 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH 3/3] podman: Add support for rootless
 mode
Date: Mon, 11 Jul 2022 15:00:22 +0200
Message-Id: <20220711130022.3264142-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711130022.3264142-1-andrei@gherzan.com>
References: <20220711130022.3264142-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:00:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7423

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 docs/00-INDEX                                     |  3 +++
 docs/podman.txt                                   | 15 +++++++++++++++
 docs/podman.txt.license                           |  3 +++
 .../podman/podman/00-podman-rootless.conf         |  6 ++++++
 recipes-containers/podman/podman_git.bb           | 15 ++++++++++++++-
 5 files changed, 41 insertions(+), 1 deletion(-)
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
index 0000000..9f35501
--- /dev/null
+++ b/docs/podman.txt
@@ -0,0 +1,15 @@
+Podman
+======
+
+Rootless mode
+-------------
+
+Podman is a daemonless container engine that has as one of its features the
+ability to run in rootless mode. This requires a set of configurations and
+additional components. The OE/Yocto integration configures podman with this
+support enabled by default. This can be changed via configuration files
+(distro, local.conf, etc.) or bbaappends using the `PODMAN_ROOTLESS` variable.
+
+To disable rootless support set the variable to '0':
+
+PODMAN_ROOTLESS = "0"
diff --git a/docs/podman.txt.license b/docs/podman.txt.license
new file mode 100644
index 0000000..940435e
--- /dev/null
+++ b/docs/podman.txt.license
@@ -0,0 +1,3 @@
+SPDX-FileCopyrightText: Huawei Inc.
+
+SPDX-License-Identifier: Apache-2.0
diff --git a/recipes-containers/podman/podman/00-podman-rootless.conf b/recipes-containers/podman/podman/00-podman-rootless.conf
new file mode 100644
index 0000000..2aca663
--- /dev/null
+++ b/recipes-containers/podman/podman/00-podman-rootless.conf
@@ -0,0 +1,6 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: Apache-2.0
+
+# User namespaces are required for rootless containers.
+user.max_user_namespaces	= 15000
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 961cd18..2680f40 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -6,6 +6,10 @@ DESCRIPTION = "Podman is a daemonless container engine for developing, \
     `alias docker=podman`. \
     "
 
+# podman can run in rootless mode with the help of additional components:
+# https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md
+PODMAN_ROOTLESS ?= "1"
+
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp ipv6"
 
@@ -21,6 +25,7 @@ SRCREV = "cedbbfa543651a13055a1fe093a4d0a2a28ccdfd"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.1;protocol=https \
     file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
+    ${@bb.utils.contains('PODMAN_ROOTLESS', '1', 'file://00-podman-rootless.conf', '', d)} \
 "
 
 LICENSE = "Apache-2.0"
@@ -97,6 +102,11 @@ do_install() {
 	# Silence docker emulation warnings.
 	mkdir -p ${D}/etc/containers
 	touch ${D}/etc/containers/nodocker
+
+	if [ "${PODMAN_ROOTLESS}" = "1" ]; then
+		install -d "${D}${sysconfdir}/sysctl.d"
+		install -m 0644 "${WORKDIR}/00-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
+	fi
 }
 
 FILES:${PN} += " \
@@ -112,6 +122,9 @@ SYSTEMD_SERVICE:${PN} = "podman.service podman.socket"
 # that busybox is configured with nsenter
 VIRTUAL-RUNTIME_base-utils-nsenter ?= "util-linux-nsenter"
 
-RDEPENDS:${PN} += "conmon virtual-runc iptables cni skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter}"
+RDEPENDS:${PN} += "\
+	conmon virtual-runc iptables cni skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter} \
+	${@bb.utils.contains('PODMAN_ROOTLESS', '1', 'fuse-overlayfs slirp4netns', '', d)} \
+"
 RRECOMMENDS:${PN} += "slirp4netns kernel-module-xt-masquerade kernel-module-xt-comment"
 RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
-- 
2.25.1


