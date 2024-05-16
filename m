Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1F8C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 14:39:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.15705.1715870338796544863
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 May 2024 07:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iXuLrHdg;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f44a2d1e3dso286941b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 May 2024 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715870338; x=1716475138; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kT3ueXbhZ0mXiKuu8+z3/etkbegzNJcvMRi22YxPr3Y=;
        b=iXuLrHdgsaUUx8a75C6Rlpy6c4WouCJdI35yEh2QwnsWB04Jc1uZWvtQCos6WJ2mi0
         ZLulsq650qsNW/GMFdR9qBtNBXv0l+w0DQRjCXVAx+Up79D8vqQ91fGZ8X2hsLTHRLl8
         EC9QhYveyIuuhCn97HGbFm9xn6YHtRKEBNd6L91tRXj3hQ8Dc7CzuqCKQbXpj58XFEaZ
         SiJDViMx7ANx2+n5wyr1WHvf3Cvql2Js8jDji3lBwODg9bDFuHLOBbYo7L1+iEJXC7Ve
         4u3APumbGUqjkNlzkEIog/ZQgfIMLs+72aYgTcfd7Y7ni5HUoOL5YSbubfyD4ILI3arl
         SVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715870338; x=1716475138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kT3ueXbhZ0mXiKuu8+z3/etkbegzNJcvMRi22YxPr3Y=;
        b=cjH4zA8wZUtbZYWYRpecviVPKqahNteDapxXSSgSRtMg19QD1GKWj05W1S4TNnzi8L
         +ijhRx7TrB7UAc2dEhWHlUyPhy7OGWDwb1ST6S8dzPgrZR48beyx3GgXHaoWAXDk0DH/
         /9wanRZxbm19jo4IDGzoaPrcw1aXFdPtIB1TlpeFD79U2hYxRF/7MhiCLuD4UuSi80oQ
         49ilM8QUNs29bbWp1hbvUQFq1xfvkuxQMLIMvgaENUNKo+bCYGhN97ijnIL5kcJeN9NR
         r2aQigJPtSHt+8UU94sC0e8sN7MSLbN6yg6TGsn9CPnlXmwZDl2D9j+9WShkFsysZ1t2
         59Zw==
X-Gm-Message-State: AOJu0Yzse1Fj8moGhAla7naT9UPI6locan+oSEOdGKU9MD/77L4Yqwca
	7lWCdswCjzjQBbkjLzAcS58/JTAq5usk7/iyzMgDwBfTnkeIIXx5Frf2AXRsdNlGj5kVyv55/z5
	NryW+eRlwNy1/ZJAo8CFkHiWyu8S1OYrz
X-Google-Smtp-Source: AGHT+IFze5AqJ0P/GfcBjzze31LgRwf/K2GCTj8o3Z/JhG7AR6sPLMur7yelsli13XL6vG+O/PS2Bmid6WLMkREjkHA=
X-Received: by 2002:a17:90a:5d96:b0:2b6:2069:db37 with SMTP id
 98e67ed59e1d1-2b6cc7804d6mr15168842a91.25.1715870338060; Thu, 16 May 2024
 07:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240516134007.653981-1-ecordonnier@snap.com>
In-Reply-To: <20240516134007.653981-1-ecordonnier@snap.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 16 May 2024 10:38:46 -0400
Message-ID: <CADkTA4MuPHH-+Jsfpy-TqafCuPqhNHs9ctTnw9_5XPPN2uoObA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] crun: update to v1.15
To: ecordonnier@snap.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 May 2024 14:39:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8726

I'm holding package updates back until the end of M1 / start
of M2 and focusing on feature work early in the cycle (for once!).

But I've marked this and will have a look as I go through and
update all the packages for M2.

Bruce

On Thu, May 16, 2024 at 9:40=E2=80=AFAM Etienne Cordonnier via
lists.yoctoproject.org <ecordonnier=3Dsnap.com@lists.yoctoproject.org>
wrote:
>
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Bumping crun to version 1.15-0-ge6eacaf, which comprises the following co=
mmits:
>
>     e6eacaf NEWS: tag 1.15
>     f904485 Merge pull request #1459 from lsm5/packit-centos
>     08b5e78 Packit: Enable c10s downstream sync, rhel / centos separation=
 in tests
>     73cb769 Merge pull request #1456 from martinetd/cleanup_cgroup_mount
>     4618d50 status: rmdirfd: try harder to remove mount points
>     c72bf7f linux: cgroups: cleanup unused mount if move failed
>     1f5fa44 Merge pull request #1457 from giuseppe/fix-compiler-warning
>     ff321e1 tests: install slirp4netns
>     a946f04 utils: fix a compiler warning
>     6df8cef Merge pull request #1449 from lsm5/rpm-rhel-wasm
>     aa72cc4 Packit/TMT: add centos-stream-10, cleanup tests
>     d075e53 Merge pull request #1455 from giuseppe/update-npm
>     f39bc4a tests, oci-validation: use perl tap driver
>     f5548f2 tests, oci-validation: use tap-18
>     18e84a1 tests, oci-validation: use git clone
>     b4539b5 Merge pull request #1453 from saschagrunert/s390x-musl
>     49090f2 Build s390x binaries using musl libc
>     8cd3e02 Merge pull request #1454 from saschagrunert/clang-format
>     307d35e Fix clang format test
>     37670c8 Merge pull request #1451 from containers/dependabot/github_ac=
tions/uraimo/run-on-arch-action-2.7.2
>     4b8f7c9 build(deps): bump uraimo/run-on-arch-action from 2.7.1 to 2.7=
.2
>     68df083 Merge pull request #1448 from Ecordonnier/eco/bump-libocispec
>     e6a8d51 libocispec: update
>     a1ed024 Merge pull request #1447 from giuseppe/bump-tap
>     1809973 tests: use npm-18
>     7202095 Merge pull request #1444 from haircommander/potentially_unsaf=
e_config_annotations
>     475a3fd features: add support for potentiallyUnsafeConfigAnnotations
>     a32cc45 Merge pull request #1432 from sohankunkerkar/add-preload-opti=
on
>     4f5479e src/libcrun/handlers: add option to load wasi-nn plugin for w=
asmedge
>     c90b8c9 Merge pull request #1443 from giuseppe/use-zstd-instead-of-xz=
-for-releases
>     631e767 release: use zstd instead of xz
>     0722689 release.sh: generate .zst release instead of .xz
>     d05a5dd Merge pull request #1441 from kolyshkin/fixup
>     3ad68ed linux: fixup libcrun_safe_chdir
>     dcbdf9d Merge pull request #1440 from lsm5/rpm-remove-eln
>     699564b rpm: remove eln macro
>     d43d79f Merge pull request #1439 from lsm5/packit-failure-comment-reu=
se
>     f50da23 Packit: reuse non-RHEL failure message notification on RHEL
>     c4afd9c Merge pull request #1425 from lsm5/podman-revdep-tests
>     0b7fc08 packit: podman reverse dependency tests
>     64ee22c Merge pull request #1431 from flouthoc/use-runtimespec-v1.2.0
>     0dbb353 Merge pull request #1430 from giuseppe/make-error-clearer
>     820471a libocispec: use runtime-spec v1.2.0
>     9eea9ff cgroup: make error clearer
>     cde8f10 Merge pull request #1429 from giuseppe/add-flag-keep-to-run
>     59ad70a container: validate option flags
>     7918dca container: split create and run options
>     8894495 crun: add option --keep to run
>     35dccc3 libcrun, run: add option to not delete containers
>     f04eebe Merge pull request #1427 from giuseppe/tag-1.14.4
>     a220ca6 NEWS: tag 1.14.4
>     31aab34 Merge pull request #1424 from saschagrunert/s390x
>     6cd74cb Add support for s390x
>     89d4446 Merge pull request #1422 from giuseppe/find-rro-bind-mount-fr=
om-file
>     5884fd4 linux: fix mount of file with recursive flags
>     b9e87e7 tests: test bind mounts of files
>     3a07f6e Merge pull request #1415 from debarshiray/wip/rishi/rpm-relat=
ive-not-absolute-symlink
>     e81086b rpm: Use relative, not absolute, symbolic links
>     be5feff Merge pull request #1420 from giuseppe/enable-parallel-nix-bu=
ilds
>     9079a6d release: enable parallel builds
>     d8aabe5 Merge pull request #1419 from giuseppe/drop-check-version
>
> crun/libocispec: update to -tip:
>
>     c715dcd Merge pull request #133 from Ecordonnier/eco/clang17
>     86650dc fix compilation error with clang++17
>     20d3936 helpers.py: remove __str__()
>     afed951 generate.py: fix some typos
>     f76be64 Merge pull request #131 from flouthoc/sync-runtime-spec
>     daeb197 runtime-spec: use version v1.2.0
>     3d16826 Merge pull request #130 from Ilya-source/optimize_strings_han=
dling
>     66f6f71 optimize writefile
>     e9a99a8 Optimize headers writefile
>     7a5f2b6 Refresh strings format sources
>     210f4d3 Refresh strings format headers
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  recipes-containers/crun/crun_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/cru=
n/crun_git.bb
> index 89ba21b4..4dde55c6 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -3,8 +3,8 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  PRIORITY =3D "optional"
>
> -SRCREV_crun =3D "89d44467e3b410b73f2065756a12789be45b855b"
> -SRCREV_libocispec =3D "19c05670c37a42c217caa7b141bcaada7867cc15"
> +SRCREV_crun =3D "e6eacaf4034e84185fd8780ac9262bbf57082278"
> +SRCREV_libocispec =3D "c715dcdbab8fe592daa8a11cbabc75aa76534c80"
>  SRCREV_ispec =3D "9615142d016838b5dfe7453f80af0be74feb5c7c"
>  SRCREV_rspec =3D "720792f25ae6e9ee6b1332db698f37659e69ce8d"
>  SRCREV_yajl =3D "f344d21280c3e4094919fd318bc5ce75da91fc06"
> @@ -17,7 +17,7 @@ SRC_URI =3D "git://github.com/containers/crun.git;branc=
h=3Dmain;name=3Dcrun;protocol=3Dh
>             git://github.com/containers/yajl.git;branch=3Dmain;name=3Dyaj=
l;destsuffix=3Dgit/libocispec/yajl;protocol=3Dhttps \
>            "
>
> -PV =3D "v1.14.3+git${SRCREV_crun}"
> +PV =3D "v1.15+git${SRCREV_crun}"
>  S =3D "${WORKDIR}/git"
>
>  REQUIRED_DISTRO_FEATURES ?=3D "systemd seccomp"
> --
> 2.36.1.vfs.0.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8725): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8725
> Mute This Topic: https://lists.yoctoproject.org/mt/106134562/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

