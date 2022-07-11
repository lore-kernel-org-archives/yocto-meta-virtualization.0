Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D76CCA481
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:01:20 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.28121.1657544478748525862
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=GoYaNfVq;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 18ABE5C0115;
	Mon, 11 Jul 2022 09:01:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 09:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657544478; x=1657630878; bh=0i
	gKMG5toq92QoFo6AiKmG/n9Y7S3cBgPZ9hiEvmtp0=; b=GoYaNfVqotxAMTnZ4W
	xc6FyWgw6gqE/qvI9B1K+Gtfa4aMQMpxkjchHqYIs59bZj6QbgaDdSvbeO5WKaM/
	k3CLV+Sc+cbZNGFoGU5+4+8TFV1bVksltWZnfJc5U6RCpeQWM7ucPjWghdmHQT2o
	KjSagh+ZHcDXeei2pc3rJIP7etWYEEclrMVahATUncHPwnKzsv+0l/ccoj41Nj1w
	Z11+poJfN9zdN15KveNjQknLV6dnfkbMjv0gjTBVvA/6w2itNK8MnpU7uKZOj+d1
	qbV7YfH82LLIlFouEsuYbgg63M9FqVKSAOQnrtfVmT3EIEgb2KcocLUWZYFMdqx+
	E0qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657544478; x=1657630878; bh=0igKMG5toq92Q
	oFo6AiKmG/n9Y7S3cBgPZ9hiEvmtp0=; b=S/NVAR72E2jlelBT5DZO/Is8XvCHR
	oNG27cg+9kBaCE+vhak8HMKeOpn8SoJi2pYZK2Kunaht+r8ugCFjPrwFl7GDOpzO
	2lUUloFL24xWgpMtZZv63t8lOwhiyAuLIcrUnfPcoyaIkHvPEnta2ccQjDnqEHnr
	uXJZaEXh2YpbOlB5NcySKHNS/NuuQqkrmxF2lRMlnn/AaFhq63n2gdjWTM/hoxbC
	SzjG74/5QPTR+bnZiP+WR2r8BZahPxB9n8to303/JKV2W5CBMEHweTUPiXY6Ifsv
	9/A48W4dhkcoiCSwAjqUsGnEzRwH8Su8yAj3WxGCRFvksdSMos+r0jUxg==
X-ME-Sender: <xms:HB_MYtdR9f2jlLroTZSZgAD0uf8jIOP45Ynd82EB8sXch7FSF6lHTA>
    <xme:HB_MYrMeJbW81xFGL92kEbMxCU8uCd_4-0KnOqi_BiWo0mzmvD2uZyHpLZrsLuF3d
    Kzm-8m95ycfCFiDWhg>
X-ME-Received: 
 <xmr:HB_MYmg8x_ihsXmqpSmv-1kLxo_b5ktbiTFN7oiotkVvc_hyNwdc2OBVJ0pfSrYAddoaCYI8mIM_Kxu_0Jg6DP0NSJoPZ_czXp1HFz7n8hTDD6-pT6FzmvNr>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:HB_MYm-U3REJDC1S0JqVxXOWREwS5sN5Po38y7-opVceJgAiDVa6Kw>
    <xmx:HB_MYpuxSwPuBhJjfiqbNIikBoJltTG7QXBrh0XiI7Z674gR5OWiSA>
    <xmx:HB_MYlF9lg7RSSsT89NOpN813RENR1USTzROZrcd4n8hEaUZ1XwF6A>
    <xmx:Hh_MYqUeI23ECAUQ7H9T5hqrbpXmU9HYJ8refg02DL7RcQ9aDse8kA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 09:01:16 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH 3/3] podman: Add support for
 rootless mode
Date: Mon, 11 Jul 2022 15:01:10 +0200
Message-Id: <20220711130110.3264816-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711130110.3264816-1-andrei@gherzan.com>
References: <20220711130110.3264816-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:01:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7426

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
index 4693bd6..4dcd0f2 100644
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
 
@@ -21,6 +25,7 @@ SRCREV = "717edd7b844dcd66468f5d991991d87e9fc14c12"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
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


