Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA734CD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 13:08:48 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15509.1779714525736616958
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 06:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TTKo1mfe;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36af4b7840aso321232a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 06:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779714525; cv=none;
        d=google.com; s=arc-20240605;
        b=ebHqwPAE/FSvmudXrdHBIaPSaXgpjb8tTCCIzQ4T6oHKQ2CG0jRYgeq9F/eOC5OTK1
         klKd7ZmwE+7V7dlXwsgEOJOpQGRlO3mFkcW5CF4pCRB7dJTtFkiSgmKMZoH/EMvIqoXP
         TLhRmC11oDxq0jj8eAWP2u9G2Nj+sddfa6tgYj45oChpiL6l1VdV7zjnt7LzO/D1VckZ
         BdJlUyR9WF8hc9lBgDInc384rddArrYzQJ1wKxVLd7nNkxdspGjphsP/OMckkZb3I8z7
         ywmmsXV/PaWDP8Ce8GgvhswOFhO4OqEnBDtLPxfAMNBOeMtUFBBPe2IPV4k2YcotPptm
         nOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E8GSxiy+6lTjppjp6bkPR9Zr3dq1BLQe9AOlBdHQH9w=;
        fh=T1fsFJFZd3expnPhH4HQBhUXgCpxpAql7h9peGDMJdM=;
        b=OlPT+5svLtdFik8i/pyBrbQJvLnZdIWd0RdKmgQVjnqixM+wiWa1xVlGopuElx8Ggc
         Od3zclD7V8hojYTp/EpNclvRmBadOcBFR2bQD+1jszHPUQF//uXMNvmXnZQYbaBIeBo9
         uKRQaVoGODKgN2QBeJNueTsdud1DhHhY/3PMnl2W4YasTj7QiK5Zs/eFW120IdE72Q0W
         uOBO7Vt0aZwUeutHZ5S6bbW2Qpzwz1juU4kSKO3niXhbRSXMZdZhXxeUiRfZY2qknVhh
         SoLo/Q+nZ1CDPGFObSmu061p+Svht7iEcvkyJ+7CqRTc57p5x8clTAQuui9zxPDfAspj
         A1LQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779714525; x=1780319325; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E8GSxiy+6lTjppjp6bkPR9Zr3dq1BLQe9AOlBdHQH9w=;
        b=TTKo1mfeMkWudy9a1czRW7GCVqEKnteKyIecG9uLRzNgo0ko4LFvwR+j0eNF7MKy2O
         xjGp5yYz+CGnHY7APSYBL6PMhtL4MrADVRzoJsoVsd8/p6xO+PhvejXcK8mIJGdlpqK2
         /yV2UkiphsHt6nFr9NNuNCdlO1Q6XBywOlP3HsEHQtnMefYPPJH3O2ukANyMHnlkj6nb
         vXyV01Ypeh5mHViTMr46SmXOj1zHOriMdpXgHj7iUNKsmFFU0jJm9l8+AW5nE82lXww5
         iPbQ0Ir0UxD8KYBZX6xZYAojoqAeZ1huvIltUfB4tDIpj4iCQZRqS5FjAaE9DqZT+UUT
         Itbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714525; x=1780319325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8GSxiy+6lTjppjp6bkPR9Zr3dq1BLQe9AOlBdHQH9w=;
        b=eo6ppEJJj/JUF8b/ms1ylnUeEMkSlLmSyEx570+SvQyJFLoyCVnclyZmDdWPlViYWP
         tgacnWpPoVUGVJx6kEKqipwXueanIPZVU3IwXjg+NrclPv2TO30Ul1MbbAQh8TYXdIcY
         bH4rdIIw3+MuYGsc7M47JiYBpnydSYIv/2V7ZuKlq1D9A6cMvkOq24+S2pm+2bs3rNhK
         oTDMbPSXjBSWiz389Wpi3zEEGNIARQzDViIxl4IiHtp+TMYXLDmLFijxSOBzH0sWfRfK
         c0a8fJYA7aJrA+W4o8YQQgYC5zm+UEEh1cXraHNRdZR0EMtURT7ZpII1ZFlY6vRsZ5j3
         InKA==
X-Gm-Message-State: AOJu0Yz6XXjGngQcC0Dl+KplEXedgBLunhyYeQXJ3YT/tgyGpHMDJFWH
	rX+sgHph4ET/2J+YjtmE7hUBZi1WsbXl6vOm6iUqvXqrao6QaxKqOg6edfenWTQ5F7wa1FZ//NK
	53QWjLtQiX9W1uAtiV9E6BCRu573BzUmCw5nq
X-Gm-Gg: Acq92OFwvzhw8ljY/h/TWE4BEoj4AmWX9h5uB5RfBjoa+0+iotKbyC/nBW7iZlGCvpa
	TAHG4nLkt7rlaLLq1NVXE1YXU5ANTaOvAWjcSZBdBLL0OHLAsjLfxFcsC6NXjg3th8aF0ZTQmWM
	Yp+wKR6fcrr2n23NPiZaKEGImE0GNHDdR31LDOF5fcebmJ1i4wz2+9Z47yBK7DWZYV6XHmCHHT6
	hCn/WeC1S0In9C3T+DnF2LLRDKdphosNeNNFidLfT6v/oRtztLP1+/XGEQNqgWTxytREJ+b2l9c
	+aLWEqKbSoYqQ/QQMvL/XKgIetFQ2hwAtuvuCRD+bmeCrBZYM/ydi5P0dXritKYKeP+NKfXeczr
	qCjOqT4bf/xTTFNIUAUBvBk7C1g==
X-Received: by 2002:a17:90b:3744:b0:36a:bfe3:3d7 with SMTP id
 98e67ed59e1d1-36abfe3080bmr3834446a91.14.1779714524635; Mon, 25 May 2026
 06:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260525130321.3963861-1-zhixiong.chi@windriver.com>
In-Reply-To: <20260525130321.3963861-1-zhixiong.chi@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 May 2026 09:08:32 -0400
X-Gm-Features: AVHnY4JVhFzpusADgOsoWWS6PjBF0N12T2-om7FSsSy_o13fQgTVkgFneErsG0k
Message-ID: <CADkTA4O0vb_-QPTjCDN=FNsSm9ApyKQ+ZqJvj27PmhvsLwWZKA@mail.gmail.com>
Subject: Re: [meta-virtualization][wrynose][PATCH] crun: upgrade to 1.27.1
To: zhixiong.chi@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000aeb380652a4144b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:08:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9813

--0000000000000aeb380652a4144b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 9:03=E2=80=AFAM Zhixiong Chi via lists.yoctoproject=
.org
<zhixiong.chi=3Dwindriver.com@lists.yoctoproject.org> wrote:

> Bumping crun to version v1.27.1, which comprises the following commits:
>
>     3ec076b3 NEWS: tag 1.27.1
>     60b2e8f8 tests, podman: pin to 5.8
>     3010d29d tests: fix failure in user namespace
>     d6ffa244 krun: remove unused variable
>     1c5c2f7d linux: pass correct propagation to get_bind_mount
>     d97461f0 tests: add regression test for idmapped mount leak
>     59cfa8b8 Revert "linux: skip redundant MS_PRIVATE propagation mounts"
>     f1b70c0b tests: add subcgroup cleanup test
>     6177dd86 cgroup: fix recursive cgroup cleanup consuming caller's fd
>     6c58b0c6 fix -Wdiscarded-qualifiers warnings
>     acb904c6 krun: Build passt argv based on nitro variant
>     8199cbb2 krun: implement support for passt networking
>     7c2500df krun: ignore RAM configurations below 128MB
>     23f7d9f0 krun: consolidate configuration in configure_vm
>     04c19ac6 krun: process the vm configuration earlier
>     81c21e0d handlers: add new hook to close fds
>     d8813f3d .codespellrc: ignore passt
>     94d7f641 utils: fix apparmor profile not applied in user namespaces
>     805e6a44 libcrun: skip cgroup filesystem type check when cgroups are
> disabled
>     4c530d43 libcrun: fall back to bind mount for /dev/console on
> read-only file systems
>     a718a92c NEWS: tag 1.27
>     6220914d nix: generate git-version.h in buildPhase
>     9553f8b8 exec: strengthen -u value validation
>     1bd7f424 exec: fix CVE-2026-30892
>     5699da29 nix: fix zlib cross-compilation for s390x
>     237f8100 nix: remove global overlay to eliminate rebuild cascade
>     b37594dc release: use path: flake ref to avoid libgit2 safe.directory
>     aaa6056c release: seed /nix from container image when empty
>     c4e3fd22 linux: set MS_PRIVATE on detached mounts from get_bind_mount=
()
>     360621a3 Revert "container: skip sigaction reset in unblock_signals
> for the run path"
>     5d1b0284 nix: migrate to flakes
>     246a3367 nix: generate git-version.h in buildPhase
>     3e9986bc nix: bump nixos/nix image from 2.24.9 to 2.34.2
>     094c97f3 nix: update
>     195f664f seccomp_notify: tighten crun_make_error input
>     1d76be72 seccomp: tighten crun_make_error input
>     62d3e852 container: tighten crun_make_error input
>     254a8a75 linux: use open_tree+mount_setattr for device mounts
>     2d6f4c0e linux: use open_tree+move_mount for masked paths
>     45e62ce5 linux: use open_tree+mount_setattr for readonly paths
>     f53aa376 linux: use mount_setattr for readonly remounts in
> finalize_mounts
>     2dae2238 linux: skip redundant MS_PRIVATE propagation mounts
>     38e17199 container: skip sigaction reset in unblock_signals for the
> run path
>     4b66d8f0 cgroup: skip enable_controllers when joined via
> CLONE_INTO_CGROUP
>     a59b186b linux: validate run.oci.mount_context_type annotation value
>     16bd4e48 utils: do not use errno after success
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  recipes-containers/crun/crun_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/crun/crun_git.bb
> b/recipes-containers/crun/crun_git.bb
> index d2f7b63b..f4e489d5 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  PRIORITY =3D "optional"
>
> -SRCREV_crun =3D "393509db566bedea037d1599c5a58b896f5d3b01"
> +SRCREV_crun =3D "3ec076b3b6714ec2f1a10533cf18d5605a6de637"
>  SRCREV_libocispec =3D "8b07b619df73a113f7721f1c7ce24f2572b04cea"
>  SRCREV_ispec =3D "a4c6ade7bb82b316d45391f572727a63e268b252"
>  SRCREV_rspec =3D "6f7b71c2d216403715f7364ac88dec88d9da989c"
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://
> github.com/containers/crun.git;branch=3Dmain;name=3Dcrun;protocol=3Dh
>
> file://0002-libocispec-fix-array-items-parsing.patch;patchdir=3Dlibocispe=
c \
>            "
>
> -PV =3D "1.26.0+git"
> +PV =3D "1.27.1+git"
>

I know I had mentioned that updates could be sent to released branches, but
these
simply won't be applied to that branch

bugfix only updates, or individual patches only.

master will continue to receive updates on a roughly monthly cadence.

Bruce



>
>  inherit autotools-brokensep pkgconfig features_check
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9809):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9809
> Mute This Topic: https://lists.yoctoproject.org/mt/119480093/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000aeb380652a4144b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 25, 2026 at 9:03=
=E2=80=AFAM Zhixiong Chi via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;zhixiong.chi=3D<a href=3D"mailto:windriver.com@l=
ists.yoctoproject.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Bumping crun to =
version v1.27.1, which comprises the following commits:<br>
<br>
=C2=A0 =C2=A0 3ec076b3 NEWS: tag 1.27.1<br>
=C2=A0 =C2=A0 60b2e8f8 tests, podman: pin to 5.8<br>
=C2=A0 =C2=A0 3010d29d tests: fix failure in user namespace<br>
=C2=A0 =C2=A0 d6ffa244 krun: remove unused variable<br>
=C2=A0 =C2=A0 1c5c2f7d linux: pass correct propagation to get_bind_mount<br=
>
=C2=A0 =C2=A0 d97461f0 tests: add regression test for idmapped mount leak<b=
r>
=C2=A0 =C2=A0 59cfa8b8 Revert &quot;linux: skip redundant MS_PRIVATE propag=
ation mounts&quot;<br>
=C2=A0 =C2=A0 f1b70c0b tests: add subcgroup cleanup test<br>
=C2=A0 =C2=A0 6177dd86 cgroup: fix recursive cgroup cleanup consuming calle=
r&#39;s fd<br>
=C2=A0 =C2=A0 6c58b0c6 fix -Wdiscarded-qualifiers warnings<br>
=C2=A0 =C2=A0 acb904c6 krun: Build passt argv based on nitro variant<br>
=C2=A0 =C2=A0 8199cbb2 krun: implement support for passt networking<br>
=C2=A0 =C2=A0 7c2500df krun: ignore RAM configurations below 128MB<br>
=C2=A0 =C2=A0 23f7d9f0 krun: consolidate configuration in configure_vm<br>
=C2=A0 =C2=A0 04c19ac6 krun: process the vm configuration earlier<br>
=C2=A0 =C2=A0 81c21e0d handlers: add new hook to close fds<br>
=C2=A0 =C2=A0 d8813f3d .codespellrc: ignore passt<br>
=C2=A0 =C2=A0 94d7f641 utils: fix apparmor profile not applied in user name=
spaces<br>
=C2=A0 =C2=A0 805e6a44 libcrun: skip cgroup filesystem type check when cgro=
ups are disabled<br>
=C2=A0 =C2=A0 4c530d43 libcrun: fall back to bind mount for /dev/console on=
 read-only file systems<br>
=C2=A0 =C2=A0 a718a92c NEWS: tag 1.27<br>
=C2=A0 =C2=A0 6220914d nix: generate git-version.h in buildPhase<br>
=C2=A0 =C2=A0 9553f8b8 exec: strengthen -u value validation<br>
=C2=A0 =C2=A0 1bd7f424 exec: fix CVE-2026-30892<br>
=C2=A0 =C2=A0 5699da29 nix: fix zlib cross-compilation for s390x<br>
=C2=A0 =C2=A0 237f8100 nix: remove global overlay to eliminate rebuild casc=
ade<br>
=C2=A0 =C2=A0 b37594dc release: use path: flake ref to avoid libgit2 safe.d=
irectory<br>
=C2=A0 =C2=A0 aaa6056c release: seed /nix from container image when empty<b=
r>
=C2=A0 =C2=A0 c4e3fd22 linux: set MS_PRIVATE on detached mounts from get_bi=
nd_mount()<br>
=C2=A0 =C2=A0 360621a3 Revert &quot;container: skip sigaction reset in unbl=
ock_signals for the run path&quot;<br>
=C2=A0 =C2=A0 5d1b0284 nix: migrate to flakes<br>
=C2=A0 =C2=A0 246a3367 nix: generate git-version.h in buildPhase<br>
=C2=A0 =C2=A0 3e9986bc nix: bump nixos/nix image from 2.24.9 to 2.34.2<br>
=C2=A0 =C2=A0 094c97f3 nix: update<br>
=C2=A0 =C2=A0 195f664f seccomp_notify: tighten crun_make_error input<br>
=C2=A0 =C2=A0 1d76be72 seccomp: tighten crun_make_error input<br>
=C2=A0 =C2=A0 62d3e852 container: tighten crun_make_error input<br>
=C2=A0 =C2=A0 254a8a75 linux: use open_tree+mount_setattr for device mounts=
<br>
=C2=A0 =C2=A0 2d6f4c0e linux: use open_tree+move_mount for masked paths<br>
=C2=A0 =C2=A0 45e62ce5 linux: use open_tree+mount_setattr for readonly path=
s<br>
=C2=A0 =C2=A0 f53aa376 linux: use mount_setattr for readonly remounts in fi=
nalize_mounts<br>
=C2=A0 =C2=A0 2dae2238 linux: skip redundant MS_PRIVATE propagation mounts<=
br>
=C2=A0 =C2=A0 38e17199 container: skip sigaction reset in unblock_signals f=
or the run path<br>
=C2=A0 =C2=A0 4b66d8f0 cgroup: skip enable_controllers when joined via CLON=
E_INTO_CGROUP<br>
=C2=A0 =C2=A0 a59b186b linux: validate run.oci.mount_context_type annotatio=
n value<br>
=C2=A0 =C2=A0 16bd4e48 utils: do not use errno after success<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/crun/<a href=3D"http://crun_git.bb" rel=3D"norefer=
rer" target=3D"_blank">crun_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/crun/<a href=3D"http://crun_git.bb" rel=3D"=
noreferrer" target=3D"_blank">crun_git.bb</a> b/recipes-containers/crun/<a =
href=3D"http://crun_git.bb" rel=3D"noreferrer" target=3D"_blank">crun_git.b=
b</a><br>
index d2f7b63b..f4e489d5 100644<br>
--- a/recipes-containers/crun/<a href=3D"http://crun_git.bb" rel=3D"norefer=
rer" target=3D"_blank">crun_git.bb</a><br>
+++ b/recipes-containers/crun/<a href=3D"http://crun_git.bb" rel=3D"norefer=
rer" target=3D"_blank">crun_git.bb</a><br>
@@ -3,7 +3,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
=C2=A0PRIORITY =3D &quot;optional&quot;<br>
<br>
-SRCREV_crun =3D &quot;393509db566bedea037d1599c5a58b896f5d3b01&quot;<br>
+SRCREV_crun =3D &quot;3ec076b3b6714ec2f1a10533cf18d5605a6de637&quot;<br>
=C2=A0SRCREV_libocispec =3D &quot;8b07b619df73a113f7721f1c7ce24f2572b04cea&=
quot;<br>
=C2=A0SRCREV_ispec =3D &quot;a4c6ade7bb82b316d45391f572727a63e268b252&quot;=
<br>
=C2=A0SRCREV_rspec =3D &quot;6f7b71c2d216403715f7364ac88dec88d9da989c&quot;=
<br>
@@ -19,7 +19,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/cont=
ainers/crun.git;branch=3Dmain;name=3Dcrun;protocol=3Dh" rel=3D"noreferrer" =
target=3D"_blank">github.com/containers/crun.git;branch=3Dmain;name=3Dcrun;=
protocol=3Dh</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-libocispec-fix-array-=
items-parsing.patch;patchdir=3Dlibocispec \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-PV =3D &quot;1.26.0+git&quot;<br>
+PV =3D &quot;1.27.1+git&quot;<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I know I had mentioned that =
updates could be sent to released branches, but these</div><div class=3D"gm=
ail_default" style=3D"font-size:small">simply won&#39;t be applied to that =
branch</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">bugfix only update=
s, or individual patches only.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">master will continue to receive updates on a roughly monthly cadence.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0inherit autotools-brokensep pkgconfig features_check<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9809): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9809" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9809</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119480093/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119480093/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000000aeb380652a4144b--

