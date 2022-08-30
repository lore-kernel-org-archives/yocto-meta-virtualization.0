Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E4CECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 13:12:04 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.11416.1661865116803233971
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Aug 2022 06:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HXa3YAZS;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id j5so7184051plj.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Aug 2022 06:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PE1Z8yRck8fDFOJXM4hN47M/RawQzGH4uskgf0r/XOw=;
        b=HXa3YAZS2lLXFrA6jNcFz3a3moqRO2rHRXy9kGbSqGk1MVQhRv3xsu4w3Xf9d7kt34
         sFZEB7BXrQ8XclwCxVUJ/BJhQv0i6ah+YHOoYTHNJ6hruELgEenbFqb5VcEIvlw4yLok
         OSn4MLlLZHySnPfH87JYJZJIN/ha0GpjjJaxo4od1Ralu5Uj8q64wXPi4fGVKhNkLsxi
         2wlEfTlbrxO38t5INRt9LPFRoLTt2tWr87JzgVm0Ouw6AYtYltHCdYcBp5TaDgS3/cfj
         xqlVjaaCqxvyXhtm/MsxPgjdlNoEYFgxelJRl48QYy7v/ufPcpqhvwPUuxB1NGcGMivn
         4kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PE1Z8yRck8fDFOJXM4hN47M/RawQzGH4uskgf0r/XOw=;
        b=lu3i7QIEZSoezd5soz9ZKPUDx6fNmFBONWgE2B4wX6fLyoymAo7e+a0IRxoI5IUdk8
         OEyTRJYtZ/IzxjZ1Ava0ttErp4kU70gJV938+9jekuYvHlXaWsUPEw37aF63OZoydoCq
         mqUWHKv6zwz1CMws1teAORB4sv1EJK+k8AO7sE5VMrrzdjVfK9iQyVTRCIzzsIz01s3g
         mgEaXdSBVLzf6LqAWnEm18naCBPTYi5lAELGn6oflAGmYI3UkSDzh6oP+9ZpWXVuMRiC
         KOFH4byzmtbgRD/NkpWnukMHH565ftoxxc0wbnV9lT9JTKuW7I1tHLSlbVvDXPf2JssB
         6XPQ==
X-Gm-Message-State: ACgBeo32/PYv0L9o3CBbkXK7i25/WjxNIzU1iL51ozXYt03o9qXuJfjF
	6l7RgfcbW+S7lx0k3rUcqN2hONS5VTp04qx8LNmrx9bX
X-Google-Smtp-Source: 
 AA6agR7qPflhP4YPdmaoUtbmhVHGIIMX72xvF+5+Doj1vrR8mJl7IKSKq/s0X+I5ooEfs+p6UKCYQGwynzN0Em7tS0U=
X-Received: by 2002:a17:902:7c94:b0:170:aed6:7e6c with SMTP id
 y20-20020a1709027c9400b00170aed67e6cmr20705902pll.10.1661865116111; Tue, 30
 Aug 2022 06:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220826113319.1269257-1-andrei@gherzan.com>
 <29485dd0-ce72-421a-93f8-c9979647463e@www.fastmail.com>
In-Reply-To: <29485dd0-ce72-421a-93f8-c9979647463e@www.fastmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Aug 2022 10:11:26 -0300
Message-ID: 
 <CADkTA4PyLfzDo9BzABgzvBsYexdFfg8timFiF2en=7vdE06_4A@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH v2] podman: Patch for
 CVE-2022-27649
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Aug 2022 13:12:04 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7583

On Tue, Aug 30, 2022 at 6:29 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Fri, 26 Aug 2022, at 12:33, Andrei Gherzan wrote:
> > From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >
> > Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> > ---
> >  .../podman/podman/CVE-2022-27649.patch        | 106 ++++++++++++++++++
> >  recipes-containers/podman/podman_git.bb       |   3 +-
> >  2 files changed, 108 insertions(+), 1 deletion(-)
> >  create mode 100644 recipes-containers/podman/podman/CVE-2022-27649.patch
> >
> > diff --git a/recipes-containers/podman/podman/CVE-2022-27649.patch
> > b/recipes-containers/podman/podman/CVE-2022-27649.patch
> > new file mode 100644
> > index 0000000..cb786ad
> > --- /dev/null
> > +++ b/recipes-containers/podman/podman/CVE-2022-27649.patch
> > @@ -0,0 +1,106 @@
> > +From aafa80918a245edcbdaceb1191d749570f1872d0 Mon Sep 17 00:00:00 2001
> > +From: Giuseppe Scrivano <gscrivan@redhat.com>
> > +Date: Mon, 28 Feb 2022 09:48:52 +0100
> > +Subject: [PATCH] do not set the inheritable capabilities
> > +
> > +The kernel never sets the inheritable capabilities for a process, they
> > +are only set by userspace.  Emulate the same behavior.
> > +
> > +CVE: CVE-2022-27649
> > +Upstream-Status: Backport
> > [https://github.com/containers/podman/commit/aafa80918a245edcbdaceb1191d749570f1872d0]
> > +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> > +---
> > + libpod/oci_conmon_exec_linux.go  | 7 +++++--
> > + pkg/specgen/generate/security.go | 7 +++++--
> > + test/e2e/run_test.go             | 6 +++---
> > + 3 files changed, 13 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/libpod/oci_conmon_exec_linux.go
> > b/libpod/oci_conmon_exec_linux.go
> > +index aa970bbde28..65123b37e6a 100644
> > +--- a/libpod/oci_conmon_exec_linux.go
> > ++++ b/libpod/oci_conmon_exec_linux.go
> > +@@ -758,11 +758,14 @@ func prepareProcessExec(c *Container, options
> > *ExecOptions, env []string, sessio
> > +     } else {
> > +             pspec.Capabilities.Bounding = ctrSpec.Process.Capabilities.Bounding
> > +     }
> > ++
> > ++    // Always unset the inheritable capabilities similarly to what the
> > Linux kernel does
> > ++    // They are used only when using capabilities with uid != 0.
> > ++    pspec.Capabilities.Inheritable = []string{}
> > ++
> > +     if execUser.Uid == 0 {
> > +             pspec.Capabilities.Effective = pspec.Capabilities.Bounding
> > +-            pspec.Capabilities.Inheritable = pspec.Capabilities.Bounding
> > +             pspec.Capabilities.Permitted = pspec.Capabilities.Bounding
> > +-            pspec.Capabilities.Ambient = pspec.Capabilities.Bounding
> > +     } else {
> > +             if user == c.config.User {
> > +                     pspec.Capabilities.Effective =
> > ctrSpec.Process.Capabilities.Effective
> > +diff --git a/pkg/specgen/generate/security.go
> > b/pkg/specgen/generate/security.go
> > +index 9c67099054f..988c2983267 100644
> > +--- a/pkg/specgen/generate/security.go
> > ++++ b/pkg/specgen/generate/security.go
> > +@@ -146,6 +146,10 @@ func securityConfigureGenerator(s
> > *specgen.SpecGenerator, g *generate.Generator,
> > +
> > +     configSpec := g.Config
> > +     configSpec.Process.Capabilities.Ambient = []string{}
> > ++
> > ++    // Always unset the inheritable capabilities similarly to what the
> > Linux kernel does
> > ++    // They are used only when using capabilities with uid != 0.
> > ++    configSpec.Process.Capabilities.Inheritable = []string{}
> > +     configSpec.Process.Capabilities.Bounding = caplist
> > +
> > +     user := strings.Split(s.User, ":")[0]
> > +@@ -153,7 +157,6 @@ func securityConfigureGenerator(s
> > *specgen.SpecGenerator, g *generate.Generator,
> > +     if (user == "" && s.UserNS.NSMode != specgen.KeepID) || user ==
> > "root" || user == "0" {
> > +             configSpec.Process.Capabilities.Effective = caplist
> > +             configSpec.Process.Capabilities.Permitted = caplist
> > +-            configSpec.Process.Capabilities.Inheritable = caplist
> > +     } else {
> > +             mergedCaps, err := capabilities.MergeCapabilities(nil, s.CapAdd,
> > nil)
> > +             if err != nil {
> > +@@ -175,12 +178,12 @@ func securityConfigureGenerator(s
> > *specgen.SpecGenerator, g *generate.Generator,
> > +             }
> > +             configSpec.Process.Capabilities.Effective = userCaps
> > +             configSpec.Process.Capabilities.Permitted = userCaps
> > +-            configSpec.Process.Capabilities.Inheritable = userCaps
> > +
> > +             // Ambient capabilities were added to Linux 4.3.  Set ambient
> > +             // capabilities only when the kernel supports them.
> > +             if supportAmbientCapabilities() {
> > +                     configSpec.Process.Capabilities.Ambient = userCaps
> > ++                    configSpec.Process.Capabilities.Inheritable = userCaps
> > +             }
> > +     }
> > +
> > +diff --git a/test/e2e/run_test.go b/test/e2e/run_test.go
> > +index 91a2eddadf6..f4a6e573355 100644
> > +--- a/test/e2e/run_test.go
> > ++++ b/test/e2e/run_test.go
> > +@@ -498,7 +498,7 @@ var _ = Describe("Podman run", func() {
> > +             session = podmanTest.Podman([]string{"run", "--rm", "--user",
> > "root", ALPINE, "grep", "CapInh", "/proc/self/status"})
> > +             session.WaitWithDefaultTimeout()
> > +             Expect(session).Should(Exit(0))
> > +-            Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
> > ++            Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
> > +
> > +             session = podmanTest.Podman([]string{"run", "--rm", ALPINE, "grep",
> > "CapBnd", "/proc/self/status"})
> > +             session.WaitWithDefaultTimeout()
> > +@@ -533,7 +533,7 @@ var _ = Describe("Podman run", func() {
> > +             session = podmanTest.Podman([]string{"run", "--user=0:0",
> > "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh",
> > "/proc/self/status"})
> > +             session.WaitWithDefaultTimeout()
> > +             Expect(session).Should(Exit(0))
> > +-            Expect(session.OutputToString()).To(ContainSubstring("00000000a80425fb"))
> > ++            Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
> > +
> > +             if os.Geteuid() > 0 {
> > +                     if os.Getenv("SKIP_USERNS") != "" {
> > +@@ -550,7 +550,7 @@ var _ = Describe("Podman run", func() {
> > +                     session = podmanTest.Podman([]string{"run", "--userns=keep-id",
> > "--privileged", "--rm", ALPINE, "grep", "CapInh", "/proc/self/status"})
> > +                     session.WaitWithDefaultTimeout()
> > +                     Expect(session).Should(Exit(0))
> > +-                    Expect(session.OutputToString()).To(ContainSubstring("0000000000000000"))
> > ++                    Expect(session.OutputToString()).To(ContainSubstring("0000000000000002"))
> > +
> > +                     session = podmanTest.Podman([]string{"run", "--userns=keep-id",
> > "--cap-add=DAC_OVERRIDE", "--rm", ALPINE, "grep", "CapInh",
> > "/proc/self/status"})
> > +                     session.WaitWithDefaultTimeout()
> > diff --git a/recipes-containers/podman/podman_git.bb
> > b/recipes-containers/podman/podman_git.bb
> > index aedb988..65e0205 100644
> > --- a/recipes-containers/podman/podman_git.bb
> > +++ b/recipes-containers/podman/podman_git.bb
> > @@ -22,7 +22,8 @@ SRC_URI = " \
> >      git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
> >
> > file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import
> > \
> >
> > file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang
> > \
> > -    ${@bb.utils.contains('PACKAGECONFIG', 'rootless',
> > 'file://50-podman-rootless.conf', '', d)} \
> > +    file://CVE-2022-27649.patch;patchdir=src/import \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'rootless',
> > 'file://00-podman-rootless.conf', '', d)} \
> >  "
> >
> >  LICENSE = "Apache-2.0"
> > --
> > 2.25.1
>
> Small reminder on this patch.

I'm on holidays all this week, and my build machines have gone
offline. If I can't restore access, it will be next week before I can
get to merges.

Bruce

>
> Thanks,
> Andrei
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7581): https://lists.yoctoproject.org/g/meta-virtualization/message/7581
> Mute This Topic: https://lists.yoctoproject.org/mt/93267827/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

