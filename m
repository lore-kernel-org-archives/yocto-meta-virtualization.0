Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE611ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 11:33:25 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web08.36094.1661513604276125293
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 04:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=tvono1vI;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 725455C02E1;
	Fri, 26 Aug 2022 07:33:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 26 Aug 2022 07:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661513603; x=1661600003; bh=zQhu6tZhjVASuCQzF2w3XF4yA
	GBDeQVjG/FMhnFKHHI=; b=tvono1vIFoSNX0I9CaXFUzKK3Bs6UhsRIB1rKGSVF
	i25jFLceaVuFtYhKhPi4q4i0RX2jEvPQrOoclbPPh/ij/UjmdtTu9lJd568f9ZID
	kj5CFYnS4hOVgAo9axV1ATtf+u4kgr5F4bvxm+UpKetmtdoACntrbtODDhgLAUry
	lxuLuz9ZKAm3ICeDEW4h5/Rs4CdvQbBpEacqBUU3+zRwovX2eY5PIvnGbbdCiIuA
	4/8zND4t/Gi4PjeomGE0DwndT7YoRee5g+aErs2ChGAhgHqOFlDYeg1AN6Zs4pob
	6ir/zS3fpTt9rJkCbjDmhcWfie0ibzNLTvqpZciEYiqug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661513603; x=1661600003; bh=zQhu6tZhjVASuCQzF2w3XF4yAGBDeQVjG/F
	MhnFKHHI=; b=rI09hb9Y6T5UMeovGRFWrVrC1h0Vt7n9Onjdevi37rYe0WmyhUT
	ZCLwx4h3l1BrrbCbZaDpWF+pIzktlyQcANC6ixpRa0Bwz+32Og8XpFD8UvieiitM
	MxaFPN4GB3AahK5rb9g48zfqYLOmdgcEwVlqvvnU7U68nu8VGXtYYG5pvYXIh3nQ
	vbZ4AOXN8ILRQwG7sUIoFhgJBItVZiOUXKA/6ohJa7ZbdABFAfTymeb/Pr4EXx9c
	6I9V3aqSQG1DwiGkYAMHtCmfX8WQSvm76MsFoKgMYqFGCfyBbGpMBQjZWOHsFrrU
	GAR5WuVKcQLbNG4nGAVYmFGwcCch5H0idTw==
X-ME-Sender: <xms:g68IY-uKitrw5MnMKZkGlg3wR6ykMAiHH5WEy2lvPIaz7aEzLETpSQ>
    <xme:g68IYzdkZqireevdy--Lz8rMGOmhwgoZJl-TyotR4bWYIcwq537P0w1RBwyjcjGd6
    5BEsRuqZFK1P_hcFsM>
X-ME-Received: 
 <xmr:g68IY5xttr0-G_vdr3JYnzGrKb7zwcoD9ybEc-lcKYM72snEvSXTP4GeFToKNXd1tsxBX3DHtE3SvjY0UHHmRvFTxhkjbudbl-wmN1iiD8ATiU0_aCizNzdm>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepvdfgkeekfffggfekleefleeihf
    dvgffgffffheefhefgleeiiedtgeeftdekkedtnecuffhomhgrihhnpehgihhthhhusgdr
    tghomhdpohhuthhpuhhtthhoshhtrhhinhhgrdhtohenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtgho
    mh
X-ME-Proxy: <xmx:g68IY5M_2kWzUSnjUECJrIWT0xznP_r0Z8ZAQBce8fy37hb5CojE4w>
    <xmx:g68IY-_n0iQlJ-a0lGai66EkNcFjYhcaOO-sR_xtw3PU3-UHHWDauw>
    <xmx:g68IYxUXaL3QNbda2aQEZURqhu3WukIfS8mNdykIVXx4cqNLwEHzMA>
    <xmx:g68IY0mKNCf_TDETMriIn-CpMQtiB9izVT3XCTZkBflZBTVTvdzglA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 07:33:22 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [kirkstone][PATCH v2] podman: Patch for CVE-2022-27649
Date: Fri, 26 Aug 2022 13:33:19 +0200
Message-Id: <20220826113319.1269257-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Aug 2022 11:33:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7573

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../podman/podman/CVE-2022-27649.patch        | 106 ++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |   3 +-
 2 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/podman/podman/CVE-2022-27649.patch

diff --git a/recipes-containers/podman/podman/CVE-2022-27649.patch b/recipes-containers/podman/podman/CVE-2022-27649.patch
new file mode 100644
index 0000000..cb786ad
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2022-27649.patch
@@ -0,0 +1,106 @@
+From aafa80918a245edcbdaceb1191d749570f1872d0 Mon Sep 17 00:00:00 2001
+From: Giuseppe Scrivano <gscrivan@redhat.com>
+Date: Mon, 28 Feb 2022 09:48:52 +0100
+Subject: [PATCH] do not set the inheritable capabilities
+
+The kernel never sets the inheritable capabilities for a process, they
+are only set by userspace.  Emulate the same behavior.
+
+CVE: CVE-2022-27649
+Upstream-Status: Backport [https://github.com/containers/podman/commit/aafa80918a245edcbdaceb1191d749570f1872d0]
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+---
+ libpod/oci_conmon_exec_linux.go  | 7 +++++--
+ pkg/specgen/generate/security.go | 7 +++++--
+ test/e2e/run_test.go             | 6 +++---
+ 3 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/libpod/oci_conmon_exec_linux.go b/libpod/oci_conmon_exec_linux.go
+index aa970bbde28..65123b37e6a 100644
+--- a/libpod/oci_conmon_exec_linux.go
++++ b/libpod/oci_conmon_exec_linux.go
+@@ -758,11 +758,14 @@ func prepareProcessExec(c *Container, options *ExecOptions, env []string, sessio
+ 	} else {
+ 		pspec.Capabilities.Bounding = ctrSpec.Process.Capabilities.Bounding
+ 	}
++
++	// Always unset the inheritable capabilities similarly to what the Linux kernel does
++	// They are used only when using capabilities with uid != 0.
++	pspec.Capabilities.Inheritable = []string{}
++
+ 	if execUser.Uid == 0 {
+ 		pspec.Capabilities.Effective = pspec.Capabilities.Bounding
+-		pspec.Capabilities.Inheritable = pspec.Capabilities.Bounding
+ 		pspec.Capabilities.Permitted = pspec.Capabilities.Bounding
+-		pspec.Capabilities.Ambient = pspec.Capabilities.Bounding
+ 	} else {
+ 		if user == c.config.User {
+ 			pspec.Capabilities.Effective = ctrSpec.Process.Capabilities.Effective
+diff --git a/pkg/specgen/generate/security.go b/pkg/specgen/generate/security.go
+index 9c67099054f..988c2983267 100644
+--- a/pkg/specgen/generate/security.go
++++ b/pkg/specgen/generate/security.go
+@@ -146,6 +146,10 @@ func securityConfigureGenerator(s *specgen.SpecGenerator, g *generate.Generator,
+ 
+ 	configSpec := g.Config
+ 	configSpec.Process.Capabilities.Ambient = []string{}
++
++	// Always unset the inheritable capabilities similarly to what the Linux kernel does
++	// They are used only when using capabilities with uid != 0.
++	configSpec.Process.Capabilities.Inheritable = []string{}
+ 	configSpec.Process.Capabilities.Bounding = caplist
+ 
+ 	user := strings.Split(s.User, ":")[0]
+@@ -153,7 +157,6 @@ func securityConfigureGenerator(s *specgen.SpecGenerator, g *generate.Generator,
+ 	if (user == "" && s.UserNS.NSMode != specgen.KeepID) || user == "root" || user == "0" {
+ 		configSpec.Process.Capabilities.Effective = caplist
+ 		configSpec.Process.Capabilities.Permitted = caplist
+-		configSpec.Process.Capabilities.Inheritable = caplist
+ 	} else {
+ 		mergedCaps, err := capabilities.MergeCapabilities(nil, s.CapAdd, nil)
+ 		if err != nil {
+@@ -175,12 +178,12 @@ func securityConfigureGenerator(s *specgen.SpecGenerator, g *generate.Generator,
+ 		}
+ 		configSpec.Process.Capabilities.Effective = userCaps
+ 		configSpec.Process.Capabilities.Permitted = userCaps
+-		configSpec.Process.Capabilities.Inheritable = userCaps
+ 
+ 		// Ambient capabilities were added to Linux 4.3.  Set ambient
+ 		// capabilities only when the kernel supports them.
+ 		if supportAmbientCapabilities() {
+ 			configSpec.Process.Capabilities.Ambient = userCaps
++			configSpec.Process.Capabilities.Inheritable = userCaps
+ 		}
+ 	}
+ 
+diff --git a/test/e2e/run_test.go b/test/e2e/run_test.go
+index 91a2eddadf6..f4a6e573355 100644
+--- a/test/e2e/run_test.go
++++ b/test/e2e/run_test.go
+@@ -498,7 +498,7 @@ var _ = Describe("Podman run", func() {
+ 		session = podmanTest.Podman([]string{"run", "--rm", "--user", "root", ALPINE, "grep", "CapInh", "/proc/self/status"})
+ 		session.WaitWithDefaultTimeout()
+ 		Expect(session).Should(Exit(0))
+-		Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
++		Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
+ 
+ 		session = podmanTest.Podman([]string{"run", "--rm", ALPINE, "grep", "CapBnd", "/proc/self/status"})
+ 		session.WaitWithDefaultTimeout()
+@@ -533,7 +533,7 @@ var _ = Describe("Podman run", func() {
+ 		session = podmanTest.Podman([]string{"run", "--user=0:0", "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh", "/proc/self/status"})
+ 		session.WaitWithDefaultTimeout()
+ 		Expect(session).Should(Exit(0))
+-		Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
++		Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
+ 
+ 		if os.Geteuid() > 0 {
+ 			if os.Getenv("SKIP_USERNS") != "" {
+@@ -550,7 +550,7 @@ var _ = Describe("Podman run", func() {
+ 			session = podmanTest.Podman([]string{"run", "--userns=keep-id", "--privileged", "--rm", ALPINE, "grep", "CapInh", "/proc/self/status"})
+ 			session.WaitWithDefaultTimeout()
+ 			Expect(session).Should(Exit(0))
+-			Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
++			Expect(session.OutputToString()).To(ContainSubstring("0000000000000002"))
+ 
+ 			session = podmanTest.Podman([]string{"run", "--userns=keep-id", "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh", "/proc/self/status"})
+ 			session.WaitWithDefaultTimeout()
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index aedb988..65e0205 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -22,7 +22,8 @@ SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
     file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
     file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
-    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
+    file://CVE-2022-27649.patch;patchdir=src/import \
+    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.25.1


