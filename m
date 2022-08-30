Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A44ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 09:30:03 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web11.9564.1661851786336019449
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Aug 2022 02:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=sbBzK2uj;
 spf=pass (domain: gherzan.com, ip: 64.147.123.21,
 mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7197432009B0
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Aug 2022 05:29:45 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Tue, 30 Aug 2022 05:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661851784; x=1661938184; bh=F3QWqHx/XW
	liErsdZbCjjdEhOrwHOKi7H/xQdTA83Bg=; b=sbBzK2ujjF/whR1q5wfAkzJjZW
	lBzmrl79L9Bf/G47wTPpi/LuDGYcfaHCuXF5WYD/W5vVv3HiQGeNWO/3N0vHeiAU
	ZJKAtyhKoXiRxtQ6IhRBQcOgFPf0l6xuM7ZVJYEV80W4HP4PUMHx+8txM5nnj3/g
	d9OMP0H6RtHOt5Q9yvFNb63eQRiRLtDZDlMtjeTvka+rKCTujZaavbbOqmsp2zuJ
	UEm3sC5HvXowe6ptWiASiRV1IwsoPc+7hD+mZBNJ0eMIkyzlwZxcSeLlPTtKvdhh
	gYpKeaYxgnDcJb/sDZaNh1WhzM0eRH7V8FMSyQSPyNNReD2za3NKl/HsKVsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661851784; x=1661938184; bh=F3QWqHx/XWliErsdZbCjjdEhOrwH
	OKi7H/xQdTA83Bg=; b=XnfEthIPZqycnp6pp/Hf/icNFtS9N15oyU7uhibUkwKE
	3SpRLGaGB439ARrqCsRikPvf21AYfFmItqRUJg91w0xpSbI3dgm7l7+tqfF0BG62
	jvoAM9vBYFOX4CILhX99ppKn46sgNRpg8RIBtJQpQyWPZmHOThaDJf1wQipfVjQR
	gAu8AmFt6ddBqaT/a36x9TJK1SEiqvQ3knAz+RUezTi3a9ZQHZolclnhKWXpV/dt
	cCwX4685J9FVZeG9f6C+BaniVCK/NPeqCCTdB96Duk2abDetO3x82RcwP2PY5t5A
	5kQDi+YHPjoGtnyuJIpDXtDSfrYFgi1LNFKKwdbzhQ==
X-ME-Sender: <xms:iNgNYwjMmK-XzJv5Hnum237qk-B8y4TICllSO4vWqJmFBVgPg8lIbw>
    <xme:iNgNY5ArtFoA7qgprmXZ_Uw1EImhemiDQ6Egk5UPuyrwDR7MVGPzm4Z661E1-EK6C
    dYuc_u6y5cHCl2TFyg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehnughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgv
    ihesghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepfffggfeiueeuieeite
    fhvedtueegledvvdeggeekheehueegfeetvddtudfhgffhnecuffhomhgrihhnpehgihht
    hhhusgdrtghomhdpohhuthhpuhhtthhoshhtrhhinhhgrdhtohenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigr
    nhdrtghomh
X-ME-Proxy: <xmx:iNgNY4FE-n1cghvjg9Ov3_Ebc5B06DGIXlZui7bA5lkiaJ5XgX_Plg>
    <xmx:iNgNYxR96sbjvYGpD1Yz0rhQzbUmBLx04Ub0aotEiidmAPNolDxb5w>
    <xmx:iNgNY9z96kAUAdynFXLdVjKzr9zjIb--8sL5RY7qIafLxqV47fNLvA>
    <xmx:iNgNY8-v44qMD-tjiPTvEkiOV5JBHYWOhEKYM6mQa5_P8kwDSrEKJg>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A95632340077; Tue, 30 Aug 2022 05:29:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <29485dd0-ce72-421a-93f8-c9979647463e@www.fastmail.com>
In-Reply-To: <20220826113319.1269257-1-andrei@gherzan.com>
References: <20220826113319.1269257-1-andrei@gherzan.com>
Date: Tue, 30 Aug 2022 10:29:24 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [kirkstone][PATCH v2] podman: Patch for CVE-2022-27649
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Aug 2022 09:30:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7581

On Fri, 26 Aug 2022, at 12:33, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  .../podman/podman/CVE-2022-27649.patch        | 106 ++++++++++++++++++
>  recipes-containers/podman/podman_git.bb       |   3 +-
>  2 files changed, 108 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/podman/podman/CVE-2022-27649.patch
>
> diff --git a/recipes-containers/podman/podman/CVE-2022-27649.patch 
> b/recipes-containers/podman/podman/CVE-2022-27649.patch
> new file mode 100644
> index 0000000..cb786ad
> --- /dev/null
> +++ b/recipes-containers/podman/podman/CVE-2022-27649.patch
> @@ -0,0 +1,106 @@
> +From aafa80918a245edcbdaceb1191d749570f1872d0 Mon Sep 17 00:00:00 2001
> +From: Giuseppe Scrivano <gscrivan@redhat.com>
> +Date: Mon, 28 Feb 2022 09:48:52 +0100
> +Subject: [PATCH] do not set the inheritable capabilities
> +
> +The kernel never sets the inheritable capabilities for a process, they
> +are only set by userspace.  Emulate the same behavior.
> +
> +CVE: CVE-2022-27649
> +Upstream-Status: Backport 
> [https://github.com/containers/podman/commit/aafa80918a245edcbdaceb1191d749570f1872d0]
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> +---
> + libpod/oci_conmon_exec_linux.go  | 7 +++++--
> + pkg/specgen/generate/security.go | 7 +++++--
> + test/e2e/run_test.go             | 6 +++---
> + 3 files changed, 13 insertions(+), 7 deletions(-)
> +
> +diff --git a/libpod/oci_conmon_exec_linux.go 
> b/libpod/oci_conmon_exec_linux.go
> +index aa970bbde28..65123b37e6a 100644
> +--- a/libpod/oci_conmon_exec_linux.go
> ++++ b/libpod/oci_conmon_exec_linux.go
> +@@ -758,11 +758,14 @@ func prepareProcessExec(c *Container, options 
> *ExecOptions, env []string, sessio
> + 	} else {
> + 		pspec.Capabilities.Bounding = ctrSpec.Process.Capabilities.Bounding
> + 	}
> ++
> ++	// Always unset the inheritable capabilities similarly to what the 
> Linux kernel does
> ++	// They are used only when using capabilities with uid != 0.
> ++	pspec.Capabilities.Inheritable = []string{}
> ++
> + 	if execUser.Uid == 0 {
> + 		pspec.Capabilities.Effective = pspec.Capabilities.Bounding
> +-		pspec.Capabilities.Inheritable = pspec.Capabilities.Bounding
> + 		pspec.Capabilities.Permitted = pspec.Capabilities.Bounding
> +-		pspec.Capabilities.Ambient = pspec.Capabilities.Bounding
> + 	} else {
> + 		if user == c.config.User {
> + 			pspec.Capabilities.Effective = 
> ctrSpec.Process.Capabilities.Effective
> +diff --git a/pkg/specgen/generate/security.go 
> b/pkg/specgen/generate/security.go
> +index 9c67099054f..988c2983267 100644
> +--- a/pkg/specgen/generate/security.go
> ++++ b/pkg/specgen/generate/security.go
> +@@ -146,6 +146,10 @@ func securityConfigureGenerator(s 
> *specgen.SpecGenerator, g *generate.Generator,
> + 
> + 	configSpec := g.Config
> + 	configSpec.Process.Capabilities.Ambient = []string{}
> ++
> ++	// Always unset the inheritable capabilities similarly to what the 
> Linux kernel does
> ++	// They are used only when using capabilities with uid != 0.
> ++	configSpec.Process.Capabilities.Inheritable = []string{}
> + 	configSpec.Process.Capabilities.Bounding = caplist
> + 
> + 	user := strings.Split(s.User, ":")[0]
> +@@ -153,7 +157,6 @@ func securityConfigureGenerator(s 
> *specgen.SpecGenerator, g *generate.Generator,
> + 	if (user == "" && s.UserNS.NSMode != specgen.KeepID) || user == 
> "root" || user == "0" {
> + 		configSpec.Process.Capabilities.Effective = caplist
> + 		configSpec.Process.Capabilities.Permitted = caplist
> +-		configSpec.Process.Capabilities.Inheritable = caplist
> + 	} else {
> + 		mergedCaps, err := capabilities.MergeCapabilities(nil, s.CapAdd, 
> nil)
> + 		if err != nil {
> +@@ -175,12 +178,12 @@ func securityConfigureGenerator(s 
> *specgen.SpecGenerator, g *generate.Generator,
> + 		}
> + 		configSpec.Process.Capabilities.Effective = userCaps
> + 		configSpec.Process.Capabilities.Permitted = userCaps
> +-		configSpec.Process.Capabilities.Inheritable = userCaps
> + 
> + 		// Ambient capabilities were added to Linux 4.3.  Set ambient
> + 		// capabilities only when the kernel supports them.
> + 		if supportAmbientCapabilities() {
> + 			configSpec.Process.Capabilities.Ambient = userCaps
> ++			configSpec.Process.Capabilities.Inheritable = userCaps
> + 		}
> + 	}
> + 
> +diff --git a/test/e2e/run_test.go b/test/e2e/run_test.go
> +index 91a2eddadf6..f4a6e573355 100644
> +--- a/test/e2e/run_test.go
> ++++ b/test/e2e/run_test.go
> +@@ -498,7 +498,7 @@ var _ = Describe("Podman run", func() {
> + 		session = podmanTest.Podman([]string{"run", "--rm", "--user", 
> "root", ALPINE, "grep", "CapInh", "/proc/self/status"})
> + 		session.WaitWithDefaultTimeout()
> + 		Expect(session).Should(Exit(0))
> +-		Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
> ++		Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
> + 
> + 		session = podmanTest.Podman([]string{"run", "--rm", ALPINE, "grep", 
> "CapBnd", "/proc/self/status"})
> + 		session.WaitWithDefaultTimeout()
> +@@ -533,7 +533,7 @@ var _ = Describe("Podman run", func() {
> + 		session = podmanTest.Podman([]string{"run", "--user=0:0", 
> "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh", 
> "/proc/self/status"})
> + 		session.WaitWithDefaultTimeout()
> + 		Expect(session).Should(Exit(0))
> +-		Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
> ++		Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
> + 
> + 		if os.Geteuid() > 0 {
> + 			if os.Getenv("SKIP_USERNS") != "" {
> +@@ -550,7 +550,7 @@ var _ = Describe("Podman run", func() {
> + 			session = podmanTest.Podman([]string{"run", "--userns=keep-id", 
> "--privileged", "--rm", ALPINE, "grep", "CapInh", "/proc/self/status"})
> + 			session.WaitWithDefaultTimeout()
> + 			Expect(session).Should(Exit(0))
> +-			Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
> ++			Expect(session.OutputToString()).To(ContainSubstring("0000000000000002"))
> + 
> + 			session = podmanTest.Podman([]string{"run", "--userns=keep-id", 
> "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh", 
> "/proc/self/status"})
> + 			session.WaitWithDefaultTimeout()
> diff --git a/recipes-containers/podman/podman_git.bb 
> b/recipes-containers/podman/podman_git.bb
> index aedb988..65e0205 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -22,7 +22,8 @@ SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
>      
> file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import 
> \
>      
> file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang 
> \
> -    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 
> 'file://50-podman-rootless.conf', '', d)} \
> +    file://CVE-2022-27649.patch;patchdir=src/import \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 
> 'file://00-podman-rootless.conf', '', d)} \
>  "
> 
>  LICENSE = "Apache-2.0"
> -- 
> 2.25.1

Small reminder on this patch.

Thanks,
Andrei

