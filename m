Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348A3ECAAD5
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 01:47:28 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.20221.1661910438020350099
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Aug 2022 18:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E3Dt0ipX;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id h27so9848525qkk.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Aug 2022 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=adSdcQYy4eTc+oYfu8bCIFuO1eRovjo4/NA2Fx4ibqA=;
        b=E3Dt0ipXCJ8XNaqtjlDVpPUetpUMhX1xYPRfUAOd0uT6/WpaArvY+LRwnb+1Xo2rK2
         vVxhN0jUBCzlIK1HAp/y9hVy/jKX3/IJikAoGGW5HsT8OqXLizNufi7I/gV2OQT5/OdE
         /TbFmV2YgNQnEzPBRiOwrb8aHWnAJZ/OtEv7KMMIChSJJ/srGALkZx1PrLLnDKwdAsrV
         fS8hthlCEYvYLHMb5matk7Ij4Tm/7g2CnNPLfwmxPXF5uTWnSxbbNNRs9K38W9oJmBjK
         VlZv4J5DOi6izmAIPMFNuu4cDbVIcLrJ4FHCVJrXaMPcXmo2biOp9GOTgbCQVUmVocTa
         w/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=adSdcQYy4eTc+oYfu8bCIFuO1eRovjo4/NA2Fx4ibqA=;
        b=fb4nkHJHg6+B+QaPk1TIuUsPu8GvWtqvHN/O033p1d5Eax38QbhFaCVBjmUnq5pTkM
         gVx7kKKnD3+WUC1zWMyxhWQYgREnFVTl6SkTS1tyNzFI+0INo61epvSHALuHWg/DNH9u
         R2Rq3G5IvaWG730oxzLZI4zEHmlRh29XFbRlKwTUBQ4/YrDX1Y4YyoLD3zqozGpIo4NA
         CU2mx/xnhXBf0qjVgG/xjXJFkfSstb31XZDMpm/eRlhR7/5BgAKj6klzGesTP0EDk/Q2
         3NroJUy7gQYbU8KQ80BYhN8/E/ycMsssIKlDFN0y1LlH4GmgbgNNUmGrb19rID2gW/9a
         NDpA==
X-Gm-Message-State: ACgBeo1p3AlajfsOwAOu66uA8TL0racfbJfhZPFAxphXSSYZC/Tk0Sj3
	ulNihe/tiFzP2W3am63MRyU=
X-Google-Smtp-Source: 
 AA6agR7G6+24jRD2KKzmINIvObb+HWLVRIuVxqwL++KpFgk1rGibKcWSjel1bfy1vgcrmlk/YJSzzg==
X-Received: by 2002:a05:620a:4e4:b0:6be:8dd8:87e0 with SMTP id
 b4-20020a05620a04e400b006be8dd887e0mr7216775qkh.677.1661910436915;
        Tue, 30 Aug 2022 18:47:16 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 i20-20020ac84894000000b00344c29bc045sm7635462qtq.25.2022.08.30.18.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 18:47:16 -0700 (PDT)
Date: Tue, 30 Aug 2022 21:47:14 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH v2] podman: Patch for
 CVE-2022-27649
Message-ID: <20220831014708.GA17114@gmail.com>
References: <20220826113319.1269257-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826113319.1269257-1-andrei@gherzan.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Aug 2022 01:47:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7585

merged!

Bruce

In message: [meta-virtualization] [kirkstone][PATCH v2] podman: Patch for CVE-2022-27649
on 26/08/2022 Andrei Gherzan wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  .../podman/podman/CVE-2022-27649.patch        | 106 ++++++++++++++++++
>  recipes-containers/podman/podman_git.bb       |   3 +-
>  2 files changed, 108 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/podman/podman/CVE-2022-27649.patch
> 
> diff --git a/recipes-containers/podman/podman/CVE-2022-27649.patch b/recipes-containers/podman/podman/CVE-2022-27649.patch
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
> +Upstream-Status: Backport [https://github.com/containers/podman/commit/aafa80918a245edcbdaceb1191d749570f1872d0]
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> +---
> + libpod/oci_conmon_exec_linux.go  | 7 +++++--
> + pkg/specgen/generate/security.go | 7 +++++--
> + test/e2e/run_test.go             | 6 +++---
> + 3 files changed, 13 insertions(+), 7 deletions(-)
> +
> +diff --git a/libpod/oci_conmon_exec_linux.go b/libpod/oci_conmon_exec_linux.go
> +index aa970bbde28..65123b37e6a 100644
> +--- a/libpod/oci_conmon_exec_linux.go
> ++++ b/libpod/oci_conmon_exec_linux.go
> +@@ -758,11 +758,14 @@ func prepareProcessExec(c *Container, options *ExecOptions, env []string, sessio
> + 	} else {
> + 		pspec.Capabilities.Bounding = ctrSpec.Process.Capabilities.Bounding
> + 	}
> ++
> ++	// Always unset the inheritable capabilities similarly to what the Linux kernel does
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
> + 			pspec.Capabilities.Effective = ctrSpec.Process.Capabilities.Effective
> +diff --git a/pkg/specgen/generate/security.go b/pkg/specgen/generate/security.go
> +index 9c67099054f..988c2983267 100644
> +--- a/pkg/specgen/generate/security.go
> ++++ b/pkg/specgen/generate/security.go
> +@@ -146,6 +146,10 @@ func securityConfigureGenerator(s *specgen.SpecGenerator, g *generate.Generator,
> + 
> + 	configSpec := g.Config
> + 	configSpec.Process.Capabilities.Ambient = []string{}
> ++
> ++	// Always unset the inheritable capabilities similarly to what the Linux kernel does
> ++	// They are used only when using capabilities with uid != 0.
> ++	configSpec.Process.Capabilities.Inheritable = []string{}
> + 	configSpec.Process.Capabilities.Bounding = caplist
> + 
> + 	user := strings.Split(s.User, ":")[0]
> +@@ -153,7 +157,6 @@ func securityConfigureGenerator(s *specgen.SpecGenerator, g *generate.Generator,
> + 	if (user == "" && s.UserNS.NSMode != specgen.KeepID) || user == "root" || user == "0" {
> + 		configSpec.Process.Capabilities.Effective = caplist
> + 		configSpec.Process.Capabilities.Permitted = caplist
> +-		configSpec.Process.Capabilities.Inheritable = caplist
> + 	} else {
> + 		mergedCaps, err := capabilities.MergeCapabilities(nil, s.CapAdd, nil)
> + 		if err != nil {
> +@@ -175,12 +178,12 @@ func securityConfigureGenerator(s *specgen.SpecGenerator, g *generate.Generator,
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
> + 		session = podmanTest.Podman([]string{"run", "--rm", "--user", "root", ALPINE, "grep", "CapInh", "/proc/self/status"})
> + 		session.WaitWithDefaultTimeout()
> + 		Expect(session).Should(Exit(0))
> +-		Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
> ++		Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
> + 
> + 		session = podmanTest.Podman([]string{"run", "--rm", ALPINE, "grep", "CapBnd", "/proc/self/status"})
> + 		session.WaitWithDefaultTimeout()
> +@@ -533,7 +533,7 @@ var _ = Describe("Podman run", func() {
> + 		session = podmanTest.Podman([]string{"run", "--user=0:0", "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh", "/proc/self/status"})
> + 		session.WaitWithDefaultTimeout()
> + 		Expect(session).Should(Exit(0))
> +-		Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
> ++		Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
> + 
> + 		if os.Geteuid() > 0 {
> + 			if os.Getenv("SKIP_USERNS") != "" {
> +@@ -550,7 +550,7 @@ var _ = Describe("Podman run", func() {
> + 			session = podmanTest.Podman([]string{"run", "--userns=keep-id", "--privileged", "--rm", ALPINE, "grep", "CapInh", "/proc/self/status"})
> + 			session.WaitWithDefaultTimeout()
> + 			Expect(session).Should(Exit(0))
> +-			Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
> ++			Expect(session.OutputToString()).To(ContainSubstring("0000000000000002"))
> + 
> + 			session = podmanTest.Podman([]string{"run", "--userns=keep-id", "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh", "/proc/self/status"})
> + 			session.WaitWithDefaultTimeout()
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index aedb988..65e0205 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -22,7 +22,8 @@ SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
>      file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
>      file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
> -    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
> +    file://CVE-2022-27649.patch;patchdir=src/import \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
>  "
>  
>  LICENSE = "Apache-2.0"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7573): https://lists.yoctoproject.org/g/meta-virtualization/message/7573
> Mute This Topic: https://lists.yoctoproject.org/mt/93267827/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


