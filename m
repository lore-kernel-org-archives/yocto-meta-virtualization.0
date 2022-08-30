Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6213ECAAD4
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 13:14:54 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.11286.1661865285695628625
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Aug 2022 06:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=qzQsEjca;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7E7565C0113;
	Tue, 30 Aug 2022 09:14:44 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Tue, 30 Aug 2022 09:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661865284; x=1661951684; bh=Rh4Rfx5W8z
	/6II/PhE+TMtygbwY26u84QoJCqvpDuQU=; b=qzQsEjcauigM+8d9ShvTpskCzR
	IXPDwgvnoDSWrC9h45q5oQd2m7kc3ZRKeiWX9zdPaKqV8/ql7iu0XYJhlCfRdVl8
	2qUaMr/ZwkqD4P9l+C6lwcmiNs5meFVkHD7FThdd1S8VLOBADVHaNDkkF/+JKrOB
	V+pLu9wBWLGMVhlXuxDOnkjknMvYqSwXlcXHMYdT70zTG+ZOSVtA+ItCChcSEzGg
	cmiEqTcoByScPP/WT+iqtggsdpUANfGUz9a+m21ce1DnPg2CaaTKzmtDjpqkgTfq
	tWme7hbR/yOlouhSzdOZGHBEHYzujyUU0/HCpfVaQsJsG54wMlo1hEkMYdtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661865284; x=1661951684; bh=Rh4Rfx5W8z/6II/PhE+TMtygbwY2
	6u84QoJCqvpDuQU=; b=lEMgAc4WthQm214RrH+xnAsIC8sOXfxcxSKYNnmh+kx6
	A83n3glW9mSKfSk4Ov39pTSMs8mZ3efKmJ8L+4TM7k6jGPwuBvnTDbcolVnqwn+8
	A1Lb5dk+2ihnxdPMYXN6SHX7G63OUtr1KtqS3ROmaRJ7yGwiIjWWwiQtiAjJI1jx
	/fHug3/yKB+FSvL9ART9O8GMQ1kxpcs1AWjGmX3c0EESJ+X5gSxkvbOSR3KPdqLx
	LxYGsxWq+VmBhXxW2haaAr7pd8/dxj136vzUkwXsrHA4TTl7NM6ZScWW/OIy0nQF
	p+4lntDPsu+zpNrbubeI0RoqohBOcOlrVzhk5W78sg==
X-ME-Sender: <xms:RA0OYxf2zvj--OLasBdiuYFmvbkkkK9gTQgcg_YUP4MUb5ppIWMkcA>
    <xme:RA0OY_ONYfjCnWc4pUeIy7NhrHsDCwasZUaxTg1JysTZKfjM-pJNUuUTGimCeFGlc
    N6wKGLx-I5JRNUpGow>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnhephfegudehfeffkefgteetteekvdegkedvheevteehueekffdu
    teeuvdektdetjeetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohhuthhpuhhtth
    hoshhtrhhinhhgrdhtohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:RA0OY6gadvTFeM8uQUp1fWtEO-GUddg5qOBfSuAAwweUkhFExi_-ew>
    <xmx:RA0OY6-1_7lMPQ1dNIKo6oK3HyScQcbCHtr5wdHqhQLkQn2ZPGj6_A>
    <xmx:RA0OY9tZs2pIsLbUwzfqAJQecxr6zxQFpM6vrBnBaNgbvh1F8gm9Wg>
    <xmx:RA0OYy5soHxrk0LLZpLuV9QfM5CfvotUs-0f7Vrjk-1kbi-jk4ksww>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4B6542340077; Tue, 30 Aug 2022 09:14:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <35130219-6cfb-4f4f-85af-5f5b2de57157@www.fastmail.com>
In-Reply-To: 
 <CADkTA4PyLfzDo9BzABgzvBsYexdFfg8timFiF2en=7vdE06_4A@mail.gmail.com>
References: <20220826113319.1269257-1-andrei@gherzan.com>
 <29485dd0-ce72-421a-93f8-c9979647463e@www.fastmail.com>
 <CADkTA4PyLfzDo9BzABgzvBsYexdFfg8timFiF2en=7vdE06_4A@mail.gmail.com>
Date: Tue, 30 Aug 2022 14:14:23 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [kirkstone][PATCH v2] podman: Patch for
 CVE-2022-27649
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Aug 2022 13:14:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7584

On Tue, 30 Aug 2022, at 14:11, Bruce Ashfield wrote:
> On Tue, Aug 30, 2022 at 6:29 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> On Fri, 26 Aug 2022, at 12:33, Andrei Gherzan wrote:
>> > From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> >
>> > Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> > ---
>> >  .../podman/podman/CVE-2022-27649.patch        | 106 ++++++++++++++++++
>> >  recipes-containers/podman/podman_git.bb       |   3 +-
>> >  2 files changed, 108 insertions(+), 1 deletion(-)
>> >  create mode 100644 recipes-containers/podman/podman/CVE-2022-27649.patch
>> >
>> > diff --git a/recipes-containers/podman/podman/CVE-2022-27649.patch
>> > b/recipes-containers/podman/podman/CVE-2022-27649.patch
>> > new file mode 100644
>> > index 0000000..cb786ad
>> > --- /dev/null
>> > +++ b/recipes-containers/podman/podman/CVE-2022-27649.patch
>> > @@ -0,0 +1,106 @@
>> > +From aafa80918a245edcbdaceb1191d749570f1872d0 Mon Sep 17 00:00:00 2001
>> > +From: Giuseppe Scrivano <gscrivan@redhat.com>
>> > +Date: Mon, 28 Feb 2022 09:48:52 +0100
>> > +Subject: [PATCH] do not set the inheritable capabilities
>> > +
>> > +The kernel never sets the inheritable capabilities for a process, they
>> > +are only set by userspace.  Emulate the same behavior.
>> > +
>> > +CVE: CVE-2022-27649
>> > +Upstream-Status: Backport
>> > [https://github.com/containers/podman/commit/aafa80918a245edcbdaceb1191d749570f1872d0]
>> > +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> > +---
>> > + libpod/oci_conmon_exec_linux.go  | 7 +++++--
>> > + pkg/specgen/generate/security.go | 7 +++++--
>> > + test/e2e/run_test.go             | 6 +++---
>> > + 3 files changed, 13 insertions(+), 7 deletions(-)
>> > +
>> > +diff --git a/libpod/oci_conmon_exec_linux.go
>> > b/libpod/oci_conmon_exec_linux.go
>> > +index aa970bbde28..65123b37e6a 100644
>> > +--- a/libpod/oci_conmon_exec_linux.go
>> > ++++ b/libpod/oci_conmon_exec_linux.go
>> > +@@ -758,11 +758,14 @@ func prepareProcessExec(c *Container, options
>> > *ExecOptions, env []string, sessio
>> > +     } else {
>> > +             pspec.Capabilities.Bounding = ctrSpec.Process.Capabilities.Bounding
>> > +     }
>> > ++
>> > ++    // Always unset the inheritable capabilities similarly to what the
>> > Linux kernel does
>> > ++    // They are used only when using capabilities with uid != 0.
>> > ++    pspec.Capabilities.Inheritable = []string{}
>> > ++
>> > +     if execUser.Uid == 0 {
>> > +             pspec.Capabilities.Effective = pspec.Capabilities.Bounding
>> > +-            pspec.Capabilities.Inheritable = pspec.Capabilities.Bounding
>> > +             pspec.Capabilities.Permitted = pspec.Capabilities.Bounding
>> > +-            pspec.Capabilities.Ambient = pspec.Capabilities.Bounding
>> > +     } else {
>> > +             if user == c.config.User {
>> > +                     pspec.Capabilities.Effective =
>> > ctrSpec.Process.Capabilities.Effective
>> > +diff --git a/pkg/specgen/generate/security.go
>> > b/pkg/specgen/generate/security.go
>> > +index 9c67099054f..988c2983267 100644
>> > +--- a/pkg/specgen/generate/security.go
>> > ++++ b/pkg/specgen/generate/security.go
>> > +@@ -146,6 +146,10 @@ func securityConfigureGenerator(s
>> > *specgen.SpecGenerator, g *generate.Generator,
>> > +
>> > +     configSpec := g.Config
>> > +     configSpec.Process.Capabilities.Ambient = []string{}
>> > ++
>> > ++    // Always unset the inheritable capabilities similarly to what the
>> > Linux kernel does
>> > ++    // They are used only when using capabilities with uid != 0.
>> > ++    configSpec.Process.Capabilities.Inheritable = []string{}
>> > +     configSpec.Process.Capabilities.Bounding = caplist
>> > +
>> > +     user := strings.Split(s.User, ":")[0]
>> > +@@ -153,7 +157,6 @@ func securityConfigureGenerator(s
>> > *specgen.SpecGenerator, g *generate.Generator,
>> > +     if (user == "" && s.UserNS.NSMode != specgen.KeepID) || user ==
>> > "root" || user == "0" {
>> > +             configSpec.Process.Capabilities.Effective = caplist
>> > +             configSpec.Process.Capabilities.Permitted = caplist
>> > +-            configSpec.Process.Capabilities.Inheritable = caplist
>> > +     } else {
>> > +             mergedCaps, err := capabilities.MergeCapabilities(nil, s.CapAdd,
>> > nil)
>> > +             if err != nil {
>> > +@@ -175,12 +178,12 @@ func securityConfigureGenerator(s
>> > *specgen.SpecGenerator, g *generate.Generator,
>> > +             }
>> > +             configSpec.Process.Capabilities.Effective = userCaps
>> > +             configSpec.Process.Capabilities.Permitted = userCaps
>> > +-            configSpec.Process.Capabilities.Inheritable = userCaps
>> > +
>> > +             // Ambient capabilities were added to Linux 4.3.  Set ambient
>> > +             // capabilities only when the kernel supports them.
>> > +             if supportAmbientCapabilities() {
>> > +                     configSpec.Process.Capabilities.Ambient = userCaps
>> > ++                    configSpec.Process.Capabilities.Inheritable = userCaps
>> > +             }
>> > +     }
>> > +
>> > +diff --git a/test/e2e/run_test.go b/test/e2e/run_test.go
>> > +index 91a2eddadf6..f4a6e573355 100644
>> > +--- a/test/e2e/run_test.go
>> > ++++ b/test/e2e/run_test.go
>> > +@@ -498,7 +498,7 @@ var _ = Describe("Podman run", func() {
>> > +             session = podmanTest.Podman([]string{"run", "--rm", "--user",
>> > "root", ALPINE, "grep", "CapInh", "/proc/self/status"})
>> > +             session.WaitWithDefaultTimeout()
>> > +             Expect(session).Should(Exit(0))
>> > +-            Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
>> > ++            Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
>> > +
>> > +             session = podmanTest.Podman([]string{"run", "--rm", ALPINE, "grep",
>> > "CapBnd", "/proc/self/status"})
>> > +             session.WaitWithDefaultTimeout()
>> > +@@ -533,7 +533,7 @@ var _ = Describe("Podman run", func() {
>> > +             session = podmanTest.Podman([]string{"run", "--user=0:0",
>> > "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh",
>> > "/proc/self/status"})
>> > +             session.WaitWithDefaultTimeout()
>> > +             Expect(session).Should(Exit(0))
>> > +-            Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
>> > ++            Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
>> > +
>> > +             if os.Geteuid() > 0 {
>> > +                     if os.Getenv("SKIP_USERNS") != "" {
>> > +@@ -550,7 +550,7 @@ var _ = Describe("Podman run", func() {
>> > +                     session = podmanTest.Podman([]string{"run", "--userns=keep-id",
>> > "--privileged", "--rm", ALPINE, "grep", "CapInh", "/proc/self/status"})
>> > +                     session.WaitWithDefaultTimeout()
>> > +                     Expect(session).Should(Exit(0))
>> > +-                    Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
>> > ++                    Expect(session.OutputToString()).To(ContainSubstring("0000000000000002"))
>> > +
>> > +                     session = podmanTest.Podman([]string{"run", "--userns=keep-id",
>> > "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh",
>> > "/proc/self/status"})
>> > +                     session.WaitWithDefaultTimeout()
>> > diff --git a/recipes-containers/podman/podman_git.bb
>> > b/recipes-containers/podman/podman_git.bb
>> > index aedb988..65e0205 100644
>> > --- a/recipes-containers/podman/podman_git.bb
>> > +++ b/recipes-containers/podman/podman_git.bb
>> > @@ -22,7 +22,8 @@ SRC_URI = " \
>> >      git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
>> >
>> > file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import
>> > \
>> >
>> > file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang
>> > \
>> > -    ${@bb.utils.contains('PACKAGECONFIG', 'rootless',
>> > 'file://50-podman-rootless.conf', '', d)} \
>> > +    file://CVE-2022-27649.patch;patchdir=src/import \
>> > +    ${@bb.utils.contains('PACKAGECONFIG', 'rootless',
>> > 'file://00-podman-rootless.conf', '', d)} \
>> >  "
>> >
>> >  LICENSE = "Apache-2.0"
>> > --
>> > 2.25.1
>>
>> Small reminder on this patch.
>
> I'm on holidays all this week, and my build machines have gone
> offline. If I can't restore access, it will be next week before I can
> get to merges.

Thanks for giving me a rough estimation - it helps. Enjoy your holiday!

Thanks,
Andrei

