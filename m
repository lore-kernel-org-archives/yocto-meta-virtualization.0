Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B45ECAA24
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 17:09:50 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.26552.1661447383045257952
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 10:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=V+lAjaIJ;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 3A5855C0127;
	Thu, 25 Aug 2022 13:09:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 25 Aug 2022 13:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661447382; x=1661533782; bh=DH52VmUi88NDW3yBCXf6956Zi
	HgqPVb0XLtoe038oQw=; b=V+lAjaIJVo8OxZojlwsYAs629hEUljPAt+V3fr6A9
	pjFG0V06IqSqKGVSW7Uy0Shuv6PNjhXpuL+jCfPJCjqwwhsyxmmaTbnHgvD+a4fc
	fONEO7YgsruDLNq/P7D9PendveV++N21IIE/KtUuAL30xNJ+6VsocZPsTd7qVNKC
	daHW/Kpy5UDqcYAbZrkReYVIA5D9P1AhvrUpP8cFFPZY8l4Mb+XbKcRinRWrun4h
	8Kw3WBMM94AkcYXgvlycYQo1wDKqpTcDyVbF3fde4XrpLil5WrnIRg4vYV6y4kpd
	AgonyEj1j0xUh9qOX2iKUYKHktc7fcOZ+gIAu6isr7hNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661447382; x=1661533782; bh=DH52VmUi88NDW3yBCXf6956ZiHgqPVb0XLt
	oe038oQw=; b=Pyigw1H1+LL8chQGD5FSKLxntlZvdwW7KxmWOgUcBCz8PEoZKXt
	XQioR7fJ/RoP6rTKBC7WcvuO4VBY5NwD+ZR7cURAbfZ8o+oztG67uD0aNsg44Cjd
	JgJmKEK52raYwha98aWB8ifbZ0uwmPGMp8XJejGQyPYHLEAK8FlA/3QHj1Zp058k
	n4cddrfSoKaNpWbhTf8m5MbtehLwCbqiBmetzU5sxidYlXMF8MZ1IHk+mnOJ/2sL
	51fKGmJjz5A8zDzR+9RX932sMbcImDN5joTeuqBe4xagKIvhQNRg9whDohW/FEoA
	tPvWEhLqO0eg7h2AAYcfseFWMRUHSJb+C2g==
X-ME-Sender: <xms:1awHYzV0By6aQnwnieRzoueg7Z-Qjwh3fvILmle5GFrQsDGgwoDkhw>
    <xme:1awHY7k0ZqoNZWL-m0nxAr8cHDBMeaWSDUGK94AjkWb0sD1fYlwCzuxw0Vw24vw8U
    R0_uqqT5AjhqMzKfgw>
X-ME-Received: 
 <xmr:1awHY_YAz2Bz-GF9UL0zI1Yfz1dAcfkuvvgBlPRA_Qs4FRnMkNcvdqvv3N809MkF7mBlRSC7UPv0ls9Wfj-yOsVsZA2Ogkx8c4ZeEfmZba55aM4cs57tjEqK>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpedvgfekkeffgffgkeelfeelie
    fhvdfggfffffehfeehgfelieeitdegfedtkeektdenucffohhmrghinhepghhithhhuhgs
    rdgtohhmpdhouhhtphhuthhtohhsthhrihhnghdrthhonecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgt
    ohhm
X-ME-Proxy: <xmx:1awHY-XYq662prWTgmi-JYD2Ca0dDH8s66k4vUTPE24SKjzlQlq-Sw>
    <xmx:1awHY9nbaIkRU4dZlGIyFtqOW_WSXOPpLfRd0GNkpO8hN-sTHsgdTg>
    <xmx:1awHY7ctHRLz_5Aka8VjliHEmfvsQVFF7ApabpZYUes4OQ_--0dW9g>
    <xmx:1qwHY9s7Te9ohtP64wCDjXBYaUsE7uERzqAOPAgtsX6gWCNfFKhbFg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 13:09:40 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [kirkstone][PATCH] podman: Patch for CVE-2022-27649
Date: Thu, 25 Aug 2022 19:09:33 +0200
Message-Id: <20220825170933.1046874-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Aug 2022 17:09:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7565

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../podman/podman/CVE-2022-27649.patch        | 106 ++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |   1 +
 2 files changed, 107 insertions(+)
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
index e155c7b..d8484fd 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
     file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
     file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
+    file://CVE-2022-27649.patch;patchdir=src/import \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
 "
 
-- 
2.25.1


