Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2594FC54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 20:18:25 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.7449.1711052297180958770
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Mar 2024 13:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OmUJyjKk;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2a02c4dffd2so538265a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Mar 2024 13:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711052296; x=1711657096; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7XK7pzTqWx/ACkbMTRuTuOEU6jd19/773wjy3WoJI0=;
        b=OmUJyjKk3HohVa6Ep3v2bU224MSTWszsDULAgCL56io23Jk+gH8giBWISa4L3ljdSO
         exwKy99I1fLXNlNLeH3cRBiL7DfJwj+Gc7Lo8jy2EQqx6MF5y3QM/hiQ2YNzQjzKS76h
         iy4YFvVOi53OJVJmDzcbL4+PhTi1/5irOHsBi7joeNyIulgKh+sKeKGOgfqsgB5ZNOQN
         8zLOCsajSpOK14cVY/fJGxmh1Zs0ofJ0F9trHXOBY5MTvs5SM4NuETsRBAdWIBdQwgmp
         rRxuTTcsNXb8aCV1947TodiKafqWS0WXp7f4cjbXkPe22e7uTxHVZPB0/AiSFEUQ1Wu5
         uUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711052296; x=1711657096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7XK7pzTqWx/ACkbMTRuTuOEU6jd19/773wjy3WoJI0=;
        b=Zt+D8hynJIU0B+YZIgpvJX2+rQxWL/pQDDpRG3ZILbDqAdNXN1Nr4t3vytr/WQW9iJ
         bzVmVsxCaAKpgHYf4W3Nb1RFMnmWgznRb4EiYx0ZRDf+ausDhBJ+Xaw/P+jt0G+wr+2V
         scwBjha6Sg/lKgBoHFXKqyZjbwf/6lBrgcD8kRyN+p8x/bQnlRvA7WTRCazf0pz1XQex
         2UTvhuyKQTajikEHTFZQB8I3iWQx53hXEyV9DnZGwALIg1ITEmG9GYoThIxAc1VplkI4
         gv3LkJuQsXDmd7329UzU9FFyrZUwmJVmFVwodY9UcY2L9NxZK15n+E6zE8kRDQxGPPRL
         xBOA==
X-Gm-Message-State: AOJu0YyxAyL/ez0S2fj+mBvbB5S6P7B9NgW4BlOfSBBR3yrQbmg+mK+6
	oTJgWR+VTvP3b7tErP6SzKv9JDorxNOw38YOGrG89i5w3W6BIefPvAAFkTjEmOM8U1JQ2XN8fw/
	X0pV3oCRy/nx520Wm/78fQPWchgA=
X-Google-Smtp-Source: AGHT+IGFr8fpIl1wPAohB/en5ZWt8LnARTeqGy0IBgb4eVEAit3dHoRHt+nOuuD6XUu+sZhwI4kyKAvTbSMxjgnBjFM=
X-Received: by 2002:a17:90a:5218:b0:2a0:1720:f5dc with SMTP id
 v24-20020a17090a521800b002a01720f5dcmr482012pjh.9.1711052296456; Thu, 21 Mar
 2024 13:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240321195321.1204539-1-patrick.wicki@subset.ch>
In-Reply-To: <20240321195321.1204539-1-patrick.wicki@subset.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Mar 2024 16:18:05 -0400
Message-ID: <CADkTA4NqX4H0=RmwHiWqCdntFaBse3KOryXQm3cRd6Qp3iL4ow@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: update to v5.0.0
To: Patrick Wicki <patrick.wicki@subset.ch>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Patrick Wicki <patrick.wicki@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Mar 2024 20:18:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8652

I've actually skipped this update on purpose for now,  I'm going to update
a few packages again once the current master-next is stabilized, and this
was one of them .. but I'm trying to time a dot release, as it will be the
last updates before release.

On Thu, Mar 21, 2024 at 3:54=E2=80=AFPM Patrick Wicki <patrick.wicki@subset=
.ch> wrote:
>
> From: Patrick Wicki <patrick.wicki@siemens.com>
>
> An important change is the deprecation of the CNI network backend. So
> far the backend was configurable and CNI was still the default in the
> layer through 'VIRTUAL-RUNTIME_container_networking'. It's apparently
> still possible to use it by setting the 'cni' build tag. I attempted
> this, but despite CNI being installed and podman built with 'cni' in
> BUILDTAGS, I still got:
>
> root@qemux86-64:~# podman version
> Error: could not find "netavark" in one of {[/usr/local/libexec/podman /u=
sr/local/lib/podman /usr/libexec/podman /usr/lib/podman] {<nil>}}.  To reso=
lve this error, set the helper_binaries_dir key in the `[engine]` section o=
f containers.conf to the directory containing your helper binaries.
> root@qemux86-64:~#
>
> But it seems like the CNI backend is hanging by a thread anyway and is
> likely going to disappear entirely once netavark is supported on
> FreeBSD. So I think at this point it makes sense to remove the choice
> and just use netavark.
>
> Version bump comprises the following commits:
>
>     f32338dfc bump version to v5.0.1-dev
>     e71ec6f1d New release: v5.0.0
>     6b93d9e11 Update RELEASE_NOTES.md with CVE-2024-1753
>     eb2b16d6d [v5.0] Bump Buildah to v1.35.1
>     43b9ea8b9 Adjust to the standard location of gvforwarder used in new =
images
>     4a84f39b3 Switch to 5.x WSL machine os stream using new automation
>     a03de4c14 rpm: use macro supported vendoring
>     069439820 Bump to v5.0.0-dev
>     f8888a13b Bump to v5.0.0-RC7
>     2e387df07 Add release notes for v5.0.0-rc7
>     d36ce9c2b fix invalid HTTP header values when hijacking a connection
>     8891d592b Use faster gzip for compression for 3x speedup for sending =
large contexts to remote
>     59512272b pkg/machine: make checkExclusiveActiveVM race free
>     51eee609c pkg/machine/wsl: remove unused CheckExclusiveActiveVM()
>     412648207 pkg/machine: CheckExclusiveActiveVM should also check for s=
tarting
>     1ca93f3fb pkg/machine: refresh config after we hold lock
>     71320df8e rpm: update containers-common dep on f40+
>     e58cb97de Change API socket to be machine name isolated
>     dbf38779b Makefile: drop tests-included from validate target
>     0fdd83173 Add release notes for v5.0.0
>     d7bc7b7b4 do not require policy.json
>     82597144b Machine decompress.go refactoring follow-up
>     abaa179aa Add target win-gvproxy in winmake.ps1
>     4c5d26f6f Add final machine endpoint
>     068ddfd19 update API doc version to 5.0.0
>     f2af295e4 Bump to 5.0.0-dev
>     d26113ca8 Bump to 5.0.0-rc6
>     52ed774c2 docs: generate-systemd: add clarification statement
>     3d6758a61 docs: quadlet: improve docs on root/rootless dirs
>     885dd2add [CI:DOCS] performance: fix URL and kernel version requireme=
nt
>     e6ac569a1 [CI:DOCS] Remove outdated references
>     364813da6 Add note for RHEL 8.5
>     e220d1ce6 Update module gopkg.in/go-jose/go-jose.v2 to v2.6.3 [SECURI=
TY]
>     f91b8e77b Update module github.com/go-jose/go-jose/v3 to v3.0.3 [SECU=
RITY]
>     9b21a5b79 Bump to v5.0.0-dev
>     bbad09bb0 Bump to v5.0.0-rc5
>     432f4fbf9 Fix Mac CI
>     d54a37399 Complete policy.json inclusion
>     b234bb55e Bump Buildah to v1.35.0
>     5d3a19f8d podman compose: enable machine socket connection
>     6f4ee16d9 [CI:DOCS] Add farm command to commands list
>     25f3a8ce7 podman machine start/stop do not write config unlocked
>     75fa38d52 [CI:BUILD] Build universal Podman binary for Mac installer
>     7a7591492 podman machine init: do not write config unlocked
>     7bfe5e700 Fail on failures to close the file descriptors, and especia=
lly the SparseWriter
>     5e0b7e54c Avoid reliance on fs.ErrClosed in SparseWriter users
>     4c6505be5 Fix the logic for detecting an unexpected close error
>     81906081e vendor libhvee-0.7.0
>     3c9c5be7d podman machine set: change options only locked
>     a65b546c6 Remove copySparseFile
>     2ba3a2d56 pkg/machine: fix relative DefaultPolicyJSONPath
>     724c5a06b Don't read full VM File before decompressing
>     ff81cf7c7 [CI:DOCS] Fix windows installer action
>     4d2fc293c machine: make more use of strongunits
>     92b67a69a Fix wrong units size return
>     79012795a fix(deps): update github.com/containers/libhvee digest to 7=
cee23c
>     d6d260174 [CI:DOCS] Migrate podman container image
>     a349f8d10 fix(deps): update module google.golang.org/protobuf to v1.3=
3.0
>     39851a0b9 CI: try to fix more flakes
>     835cfbc05 [CI:BUILD] rpm: Put the podmansh(1) manual in the podmansh =
sub-package
>     945995be1 e2e: fix potential race in file-locks test
>     02403c2e6 Makefile: podman should have correct selinux label
>     9ee96a956 properly implement pull-error event status
>     155cd463d fix(deps): update module golang.org/x/tools to v0.19.0
>     6272abbbb Resurrect auto-port reassignment, but for all providers
>     ef7727238 Refactor env dir and port functions into new leaf pkgs
>     eabf0acfa fix(deps): update module golang.org/x/net to v0.22.0
>     3b72f9178 Revert "Expose as-tested Mac/Windows repository state"
>     24516f3ef fix(deps): update module golang.org/x/term to v0.18.0
>     e8bf9a323 Update podman-for-windows.md
>     8c9222848 fix(deps): update github.com/containers/libhvee digest to 0=
ff33af
>     e09444327 machine init: print output to improve UX
>     530782e11 logformatter: fixes for Macintosh
>     ebce0e71d test/e2e: check for stderr errors in cleanup()
>     ef6d38752 Bump to FreeBSD 13.3 (13.2 vanished)
>     bce14b1e6 fix(deps): update module github.com/stretchr/testify to v1.=
9.0
>     185981fa5 Copy past golang/expansion form ks8.io/kubernetes
>
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  recipes-containers/podman/podman_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
> index fc532d6a..8dc836c3 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -17,9 +17,9 @@ DEPENDS =3D " \
>      gettext-native \
>  "
>
> -SRCREV =3D "460fc4d65f3681c3b0dbd78d6521ddd905578b6d"
> +SRCREV =3D "0bf85ac730600a45d0df5b259c072a7bc0742f4b"
>  SRC_URI =3D " \
> -    git://github.com/containers/libpod.git;branch=3Dmain;protocol=3Dhttp=
s \
> +    git://github.com/containers/libpod.git;branch=3Dv5.0;protocol=3Dhttp=
s \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-=
rootless.conf', '', d)} \
>      file://run-ptest \
>  "
> @@ -31,7 +31,7 @@ GO_IMPORT =3D "import"
>
>  S =3D "${WORKDIR}/git"
>
> -PV =3D "5.0.0-rc4+git"
> +PV =3D "5.0.0+git"
>
>  CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
> @@ -147,7 +147,7 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D "util-linux-n=
senter"
>  COMPATIBLE_HOST =3D "^(?!mips).*"
>
>  RDEPENDS:${PN} +=3D "\
> -       conmon ${VIRTUAL-RUNTIME_container_runtime} iptables ${VIRTUAL-RU=
NTIME_container_networking} skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter} \
> +       conmon ${VIRTUAL-RUNTIME_container_runtime} iptables netavark sko=
peo ${VIRTUAL-RUNTIME_base-utils-nsenter} \

I realize that looking at the layer, you might think that the variable
is mainly (only)
used by podman, but I know of several other layers that are using the
variable to
coordinate networking between different packages.

So this will indeed stay as a variable, since we will switch all packages a=
t the
same time if it is used, as there's no plans to support mixed cni / other
networking solutions .. we can change the default of course,  but making it
a variable is still important so it can be used for coordination.

Either way, I'll revisit this in a few weeks, once I'm doing that last swee=
p for
updates before the release.

Thanks for the patch, I've staged it  in my "to-revisit" queue.

Bruce

>         ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs=
 slirp4netns', '', d)} \
>  "
>  RRECOMMENDS:${PN} +=3D "slirp4netns kernel-module-xt-masquerade kernel-m=
odule-xt-comment"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8651): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8651
> Mute This Topic: https://lists.yoctoproject.org/mt/105072782/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

