Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E24ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:56:23 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.32932.1661482574900703707
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bUPK5wA5;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id h21so390803qta.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=kVuKiDPDQ59g7congWvFot9pKdjKa4i0JU1frIyB+Go=;
        b=bUPK5wA5GawJhxLiYaVLT96rfjUbge9PXw3Zvvmhu3VN059mwD2Oos/44d/yWxyK7f
         Oh75B4GTsqmYNCbGEtfdnrMZkvZ/LRUN/NwgbLQ8KWtk2oV3Y5dsghXKx3l/gwreE7iN
         yD0IA2N/hqbrUhYcctEBQBBTY16qr4F7zYlvXPEevptCCH1COZmBpR7rn6sGguSMJyAl
         sQQ8OaYDgKKJRT1ghikF+A5KJWc1nJ1osg3inJF2A+4n7zmwivi8Oy8OD0xmvsvPa2Fw
         Z+rPj4oXk98yGHkAuh1bWQ8+GnTt9IsDWLGImsaLUwnVKhQa+uj335JSr7sqPQfSf5fC
         jcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=kVuKiDPDQ59g7congWvFot9pKdjKa4i0JU1frIyB+Go=;
        b=lJCstzt5b6OlgGToRhpui7oovOvt2SDn8zlapoe8I4kndlYz9PmwYzt66oRR6HkLJL
         3wIRf3J32XWeLLkPnvbMrRgOorE8zrqP9MYJ/XqfFNLC6gzaN7+spEuDe3/l2xhRDHnC
         q0z9IXG3c/AtNIrxWhWxEE/1jHbqw6jMxj/WhMQx6S2bKD/OUhpEg8kPqBXQ/LpI2cRP
         VNvCje8+xQB1+GYCvdwT7WnQAs+oANnCo1t/SRiWEGGr9TVm5MPlOFXXIB+fJPhzlNnw
         u0mdgLS6+vWtbf4RZiyeNj6Z5GkEsrrSOM+7y4Sb0+D9uGj6gGPm+igi/mu61L2fLbP6
         +KlA==
X-Gm-Message-State: ACgBeo32jMZSpKnajLHTba+XOQAh04KGP0SfZHnGQyj73/xXgefq+uaC
	YkdPbt5xYKk5Bbob/EybEdw=
X-Google-Smtp-Source: 
 AA6agR4p0jZ4WgQBjhvQqBbQAMZBoFbk5n7GI4w8z4CWSAmkjIKAwwZhPolRAt/4l+E5vJTKva4CIQ==
X-Received: by 2002:a05:622a:34c:b0:343:71c7:9c0e with SMTP id
 r12-20020a05622a034c00b0034371c79c0emr6205574qtw.326.1661482573919;
        Thu, 25 Aug 2022 19:56:13 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 i21-20020ac871d5000000b00342f917444csm436477qtp.85.2022.08.25.19.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:56:13 -0700 (PDT)
Date: Thu, 25 Aug 2022 22:56:11 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] podman: Patch for
 CVE-2022-27649
Message-ID: <20220826025610.GE23530@gmail.com>
References: <20220825170933.1046874-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825170933.1046874-1-andrei@gherzan.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Aug 2022 02:56:23 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7572

This doesn't apply to my kirkstone branches, can you double
check the patch ?

Bruce

In message: [meta-virtualization] [kirkstone][PATCH] podman: Patch for CVE-2022-27649
on 25/08/2022 Andrei Gherzan wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  .../podman/podman/CVE-2022-27649.patch        | 106 ++++++++++++++++++
>  recipes-containers/podman/podman_git.bb       |   1 +
>  2 files changed, 107 insertions(+)
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
> index e155c7b..d8484fd 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -22,6 +22,7 @@ SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
>      file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
>      file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
> +    file://CVE-2022-27649.patch;patchdir=src/import \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
>  "
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7565): https://lists.yoctoproject.org/g/meta-virtualization/message/7565
> Mute This Topic: https://lists.yoctoproject.org/mt/93252866/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


