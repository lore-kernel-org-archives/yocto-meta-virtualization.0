Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF33CC46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:58:18 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.8933.1702979896023768618
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Dec 2023 01:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j1dSOhP+;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: liu.ming50@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6da5d2c3ec7so2441176a34.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 01:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702979895; x=1703584695; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkKdzKF6p7lzu3KyDatIj6emCnIH9On88iX/AsKedjY=;
        b=j1dSOhP+LdtM6yUne9RhP8WKDksfEWhUn9v9GAmyO43d5si6YPxwkT5yQSuyF5VnuR
         SJR7keJh8XAFD3Xn8L2h2amN/Eor0BgcKMiv55mpbJ0bqb/2iDRkGQ5vSRCkq+TzBzP2
         KluYBsJSceZeBsFz6RBO41sugKZqp9tx7iu+IfPgLjYu7DxuuhBDrFIrTNXjeUVd6QZr
         zEqSBCxwBPMr5fOZeBvTidfwGb6ux3VqvOwnceuxGT3OHCYoT8IcYNXCr/TiawBzXZ2M
         5EMyoB8dRyJpysFOi67PfjzDwKLRiCldFVYJgettC8ND5sfy9C6+t/pEWgo8umIKqjL2
         /5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702979895; x=1703584695;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkKdzKF6p7lzu3KyDatIj6emCnIH9On88iX/AsKedjY=;
        b=SpAvGmo/5B4wlzffH1YaTq0N4dhahwfXROHLKk4udTLas5sMtirEPMycUaJeWhA0Uq
         jnnBzVBja228f9KRabTopKzZe4K/hMvW/45vIzcSgWhmpy1IetL0gQYIugo/JoeHfhog
         ILkvCbqdDRpn6DO4Lj7xLoKsALP5ZH9pwoqO+iUFKtjfaPPP4+BwNavsC650RLUxDGLL
         G9Lfao9e13CFJyoE2kp0NU94FGL1tblaXqP5956CxL/J2I6MtqwvpvD8Gr7qHFIGrh8V
         GiTij/n4jJvN8ACw4XIVrSzSJ1BYEYPPWcmXyQFXbiE9Y4KHvBdVZ4ROi0fxq+uNc8VN
         YQwQ==
X-Gm-Message-State: AOJu0YzNDg+lSrOupT70kprfFAeiSKwXZZlSxsV9NTkvz9Gpfn74nnQq
	bAywIaiAUeJfAvCxIulYTNjRJ7fdderhYFQlVcdi9l4zpd0=
X-Google-Smtp-Source: AGHT+IFtdrjXYUqNGrATKjpc2U8mI4TGsso1xa2b0VBuJC7j5xG+uegR3rBrvnW9qZ636dCY9UddtjxEMucUPuqo+qU=
X-Received: by 2002:a05:6808:4496:b0:3b9:b3b7:e5cc with SMTP id
 eq22-20020a056808449600b003b9b3b7e5ccmr26306480oib.51.1702979894205; Tue, 19
 Dec 2023 01:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20231219092911.14331-1-liu.ming50@gmail.com> <20231219092911.14331-2-liu.ming50@gmail.com>
In-Reply-To: <20231219092911.14331-2-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 19 Dec 2023 10:58:02 +0100
Message-ID: <CALatG=7PiBmtdbVS=HfMtTtD6xE+ziuf8zoY56XLon5ovuYmgg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] podman: update to 4.8.2
To: meta-virtualization@lists.yoctoproject.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a760c2060cd9e7bc"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 09:58:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8520

--000000000000a760c2060cd9e7bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bruce, just noticed you had done this in master-next, please ignore
this commit.

the best,
thank you

<liu.ming50@gmail.com> =E6=96=BC 2023=E5=B9=B412=E6=9C=8819=E6=97=A5 =E9=80=
=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:29=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Ming Liu <liu.ming50@gmail.com>
>
> Bumping libpod to version v4.8.2, which comprises the following commits:
>
> ```
> aa546902f v4.8.2
> a9b20a4a2 [CI:DOCS] Update RELEASE_NOTES.md for v4.8.2
> 775054343 Kube Play - set ReportWriter when building an image
> da52ed937 Merge pull request #20941 from
> openshift-cherrypick-robot/cherry-pick-20929-to-v4.8
> 1864ea94f Fix user-mode net init flag on first time install
> e5244656b Merge pull request #20935 from Luap99/v4.8
> 3c0d66d83 bump c/common to v0.57.1
> fc78e1062 Merge pull request #20907 from lsm5/v4.8.1-bump
> b0e2ffc51 bump version to v4.8.2-dev
> ef6e5ac40 v4.8.1
> 0b72d1bf2 Update RELEASE_NOTES.md for v4.8.1
> 3f3e19f9f Merge pull request #20825 from
> openshift-cherrypick-robot/cherry-pick-20798-to-v4.8
> 85c2543a8 Merge pull request #20873 from
> openshift-cherrypick-robot/cherry-pick-20869-to-v4.8
> 435258c45 Merge pull request #20888 from
> openshift-cherrypick-robot/cherry-pick-20874-to-v4.8
> 2d20d2e5c Handle symlinks when checking DB vs runtime configs
> 6bbbfaa05 libpod: Detect whether we have a private UTS namespace on FreeB=
SD
> 4635f40c6 Merge pull request #20865 from
> openshift-cherrypick-robot/cherry-pick-20831-to-v4.8
> a8b8dc570 pkg/bindings: add new APIVersionError error type
> 86bb91001 fix podman-remote exec regression with v4.8
> 1c434e333 Merge pull request #20850 from Luap99/v4.8-backports
> 0c606ef0d Merge pull request #20849 from
> openshift-cherrypick-robot/cherry-pick-20841-to-v4.8
> 9c9d2fcaf sqlite: fix issue in ValidateDBConfig()
> 1e5a1336f sqlite: fix missing Commit() in RemovePodContainers()
> 429080f02 sqlite: set busy timeout to 100s
> a72c39a53 Fix locking error in WSL machine rm -f
> 78fdb40cb Merge pull request #20846 from edsantiago/gating_fixes
> a7c522dfe Gating test fixes
> 0f8157916 Merge pull request #20832 from
> openshift-cherrypick-robot/cherry-pick-20744-to-v4.8
> a62b81d90 If API calls for kube play --replace, then replace pod
> 70ba64f4c Fix wsl.conf generation when user-mode-networking is disabled
> e3bd1e0c3 Merge pull request #20793 from ashley-cui/480final
> e627de1b4 Bump to v4.8.1-dev
> c4dfcf148 Bump to v4.8.0
> 0efc6ea30 Update release notes for 4.8.0
> 01ecd17ef Merge pull request #20791 from mheon/deprecations_upcoming
> 4b95c6c30 Add notes on upcoming deprecations to release notes
> 19ab23330 Merge pull request #20782 from
> TomSweeneyRedHat/dev/tsweeney/1.33.2
> 1c1477ddf [v4.8] Bump to Buildah v1.33.2
> efc88e56a Merge pull request #20751 from ashley-cui/48relno
> f02155142 [CI:DOCS] Update release notes
> 99039f8ec Merge pull request #20741 from
> openshift-cherrypick-robot/cherry-pick-20739-to-v4.8
> 697e66c78 machine applehv: create better error on start failure
> 698458d9a Merge pull request #20724 from ashley-cui/48rc1
> 53f176732 Bump to v4.8.0-dev
> ac1d54e68 Bump to v4.8.0-rc1
> 66cba2794 Create release notes for v4.8.0
> ac290f446 Update release notes from v4.7 branch
> 883ce7704 Cirrus: Update operating branch
> 2d4c57857 Merge pull request #20722 from edsantiago/rootless_tutorial
> 9ea390191 rootless_tutorial: modernize
> 7dfbc7276 Merge pull request #20715 from
> TomSweeneyRedHat/dev/tsweeney/buildah1.33.1
> ee1654622 Bump Buildah to v1.33.1
> 149d4f079 Merge pull request #20161 from edsantiago/ci_desired_storage
> b74785023 Merge pull request #20708 from baude/vendorlibhvee0.5.0
> f17d8df55 Merge pull request #20707 from baude/vmtypesarereserved
> 85f57b6ea Merge pull request #20709 from
> TomSweeneyRedHat/dev/tsweeney/buildah1.33.0
> 3d86a9658 Bump Buildah to v1.33.0
> 60d9f9b80 Update to libhvee 0.5.0
> a6bb60140 Merge pull request #20621 from mtrmac/docker-compat-login
> d32f61d91 vmtypes names cannot be used as machine names
> d0b32255e Add support for --compat-auth-file in login/logout
> a3d5814e0 Update tests for a c/common error message change
> ced07a55f Update c/image and c/common to latest, c/buildah to main
> 71aac2f43 Merge pull request #20704 from umohnani8/py-docs
> a10b88cb2 CI: test overlay and vfs
> da899b92d [CI:DOCS] Add link to podman py docs
> 5c97e12d5 Merge pull request #20610 from edsantiago/bump_vm_images
> 857d610d0 Merge pull request #20659 from rhatdan/subscriptions
> d2a4ec867 Test fixes for debian
> 23ead49de pasta tests: remove some skips
> d711c3f46 VM images: bump to 2023-11-16
> 638199c49 Merge pull request #20671 from ygalblum/quadlet-uidmap
> 50f4f5916 Merge pull request #20698 from containers/renovate/
> go-k8s.io/kubernetes-vulnerability
> ec2e533a2 <http://go-k8s.io/kubernetes-vulnerabilityec2e533a2> Merge pull
> request #20696 from ashley-cui/ci
> 5f3f8a3ca fix(deps): update module k8s.io/kubernetes to v1.28.4 [security=
]
> 3d88f614f [CI:DOCS] Machine test timeout env var
> fcf4f3327 Merge pull request #20592 from
> containers/renovate/github.com-gorilla-handlers-1.x
> d36593c65 Merge pull request #20688 from ygalblum/quadlet-root-symlink
> e35fc92c0 Quadlet - add support for UID and GID Mapping
> dc709e4d7 Quadlet - Allow using symlink on the base search paths
> 1d49773bb Merge pull request #20683 from baude/applehvsshkeys
> 540ade060 Merge pull request #20685 from
> containers/renovate/dessant-lock-threads-5.x
> 7b826b230 [skip-ci] Update dessant/lock-threads action to v5
> ea89eaa1c Avoid empty SSH keys on applehv
> 9c954739e Merge pull request #20678 from flouthoc/usb_pass_cleanup
> 24bf08e97 Merge pull request #20676 from
> andreasgerstmayr/fix-relabeling-command
> 33ddd79e2 qemu,parseUSB: minor refactor
> 669829447 fix(deps): update module github.com/gorilla/handlers to v1.5.2
> a9a74dada Merge pull request #20673 from edsantiago/emergency_ci_fix
> b7cfceaea Merge pull request #20601 from giuseppe/use-rootless-from-stora=
ge
> 49b152f49 docs: fix relabeling command
> 7dd33b307 Merge pull request #20540 from victortoso/usb-host-passthrough
> 5dc807487 Pass secrets from the host down to internal podman containers
> 2f09b635c Merge pull request #20674 from JoshuaBeighton/main
> c838a69c2 Merge pull request #20672 from lsm5/packit-pre-release
> 047da19b5 (Temporary) Emergency CI fix: quay search is broken
> e1f3ae0d8 Update podman-stats.1.md.in
> 6fa4a975c [CI:BUILD] packit: handle builds for RC releases
> a3f8f8c1c Merge pull request #20652 from
> containers/renovate/github.com-onsi-ginkgo-v2-2.x
> 8e6fe99fd Merge pull request #20662 from ygalblum/quadlet-mount-equal-sig=
n
> 6d4d59b04 Merge pull request #20646 from edsantiago/while_ed_was_sleeping
> bd375058c Quadlet test - add case for multi =3D sign in mount
> a22c29021 Merge pull request #20643 from protosam/main
> 5e0471ba7 set RLIMIT_NOFILE soft limit to match the hard limit on mac
> d636ce8d7 rootless: use functionalities from c/storage
> 6b5b39912 CI: e2e: fix a smattering of test bugs that slipped in
> d07263f34 fix(deps): update module github.com/onsi/ginkgo/v2 to v2.13.1
> bc7c01d19 Merge pull request #20638 from
> containers/renovate/golang.org-x-tools-0.x
> 0f18e4894 Merge pull request #20649 from rhatdan/man
> 5faaef653 Merge pull request #20550 from
> containers/renovate/github.com-containers-libhvee-digest
> f3e4b3114 Merge pull request #20637 from
> containers/renovate/github-issue-labeler-3.x
> fbd1ba68f vendor: update c/storage
> 956c0d6ec Improve the documentation of quadlet
> 7d107b989 Merge pull request #19879 from rhatdan/ulimits
> b5b9a2b96 Merge pull request #20607 from rhatdan/man
> 79eec47f5 Merge pull request #20626 from jakecorrenti/ignition-builder
> 4a20de7f7 Merge pull request #20641 from jakecorrenti/socket-mapping-nits
> 39d647a2f Fix socket mapping socket mapping nits
> d7d8b86e5 Merge pull request #20632 from
> containers/renovate/github.com-onsi-gomega-1.x
> 5388836c1 fix(deps): update module golang.org/x/tools to v0.15.0
> b0ec6d816 Merge pull request #20636 from
> containers/renovate/golang.org-x-net-0.x
> 60f67eec7 fix(deps): update github.com/containers/libhvee digest to
> 9651e31
> dfffa7b18 Merge pull request #20630 from lsm5/disable-goproxy
> 9cd975d59 [skip-ci] Update github/issue-labeler action to v3.3
> b8d59030c Document --userns=3Dauto behaviour for rootless users
> c23963d7a machine: qemu: add usb host passthrough
> 4a75a2b3c fix(deps): update module golang.org/x/net to v0.18.0
> 01fd9e906 Merge pull request #20620 from baude/codecleanup
> 1c5bc7e09 fix(deps): update module github.com/onsi/gomega to v1.30.0
> b2c56365b Refactor Ignition configuration for virt providers
> 81dc3f183 [CI:BUILD] rpm: disable GOPROXY
> 6bb2edd21 Merge pull request #20608 from rhatdan/codespell
> 78798cab0 Automatic code cleanups - JetBrains
> 111b2337f Merge pull request #20613 from edsantiago/doublecheck_db
> 6d2aa6734 Merge pull request #20614 from edsantiago/bats_tweaks
> 57dbd61f6 Merge pull request #20572 from baude/ocirefactor
> a45ba06d0 Refactor key machine objects
> f47a85f4f Merge pull request #20612 from baude/applehvvirtiosfsmounts
> 1c969219d systests: add [NNN] prefix in logs, NNN =3D filename
> 92cd7b25f systests: add a last-minute check for db backend
> d44f71c13 applehv: allow virtiofs to mount to /
> 886f932b0 Merge pull request #20591 from
> containers/renovate/github.com-spf13-cobra-1.x
> 8c834d05c Merge pull request #20606 from rhatdan/docs
> c2de6d34c Run codespell on podman
> 8f5c46c9e update completion scripts for cobra v1.8.0
> d68feff8c Merge pull request #20588 from
> containers/renovate/github.com-mattn-go-sqlite3-1.x
> dff4d898c Merge pull request #20596 from
> containers/renovate/golang.org-x-text-0.x
> 28f3e9fe3 Fix man page display of podman-kube-generate
> 2ca952ac7 Merge pull request #20605 from adelton/man-podman-kube-apply
> 796b9cf3b Merge pull request #20574 from rhatdan/push
> 8effb7825 Try to fix the broken formatting of man podman=E2=80=90kube=E2=
=80=90apply(1).
> e3b3653a9 Merge pull request #20578 from Luap99/CNI-removal-notice
> 3eb2d5ceb fix(deps): update module golang.org/x/text to v0.14.0
> 108d2bc43 docs: make CNI removal explicit
> 715451f69 Merge pull request #20580 from RiRa12621/main
> f845e1a3b Merge pull request #20558 from elezar/bump-cdi
> d2583c787 Merge pull request #20593 from
> containers/renovate/github.com-gorilla-mux-1.x
> c473305b5 Merge pull request #20589 from
> containers/renovate/golang.org-x-sync-0.x
> c1fe1f9d3 fix(deps): update module github.com/gorilla/mux to v1.8.1
> e78288344 fix(deps): update module github.com/spf13/cobra to v1.8.0
> 0824e45c8 fix(deps): update module golang.org/x/sync to v0.5.0
> da897bd04 fix(deps): update module github.com/mattn/go-sqlite3 to v1.14.1=
8
> 420316ef6 Podman push --help should reveal default compression
> 5e55d76af Merge pull request #20581 from Luap99/go-systemd
> 942bcf34b Update container-device-interface (CDI) to v0.6.2
> 375b0cc13 fix: adjust helper string in machine_common
> 9e05fb14a fix: adjust helper string in machine_common
> b44d372b1 Merge pull request #20559 from edsantiago/ci_default_sqlite
> 5fc758533 Merge pull request #20420 from
> jakecorrenti/refactor-socket-mapping
> 4953f7f49 Merge pull request #20582 from flouthoc/remove-symlink-from-rep=
o
> 127505dda Merge pull request #20583 from
> containers/renovate/golangci-golangci-lint-1.x
> 607aff55f remote,test: remove .dockerignore which is a symlink
> 6b7d7f6fb [CI:DOCS] Update dependency golangci/golangci-lint to v1.55.2
> b5f854458 fix: adjust helper string in machine_common
> ce334ed9d vendor: update github.com/coreos/go-systemd/v22 to latest main
> 0904c1942 Merge pull request #20568 from giuseppe/update-c-common
> 48b8b372a Merge pull request #20417 from baude/checkforsystemconnection
> ece4dfbc0 Merge pull request #20538 from baude/ocipull
> 2a17baa29 CI: default to sqlite
> 33753db47 vendor: update c/common
> f002e4516 Merge pull request #20565 from xduugu/fix-compose-debug-msg
> 613f50c7a check system connections before machine init
> ea4775ec9 Consume OCI images for machine image
> d2a37222b freebsd: drop dead code
> 06a07c98e libpod: make removePodCgroup linux specific
> e4f1c87ea containers: drop special handling for ErrCgroupV1Rootless
> 0b6abfe1e compose: fix compose provider debug message
> 0337b1b78 Merge pull request #20557 from edsantiago/eol-policy
> 3ef2f1396 Merge pull request #20560 from flouthoc/bump-c-image
> 54fca1f52 Merge pull request #20377 from rhatdan/commit
> aefa9abf4 image: replace GetStoreImage with ResolveReference
> 03419d6da vendor: bump c/image to 373c52a9466f
> ce9c1b9b8 Refactor machine socket mapping
> e622045af Merge pull request #20561 from ashley-cui/rm
> f6ec210f3 AppleHV: Fix machine rm error message
> af0ef47f0 Add status messages to podman --remote commit
> 1ef61cf99 Merge pull request #20556 from
> containers/renovate/github.com-shirou-gopsutil-v3-3.x
> 3241b3259 End-of-Life policy for github issues
> 0cd20090b Merge pull request #20554 from
> containers/renovate/github.com-docker-go-connections-digest
> f84dba227 Merge pull request #20506 from edsantiago/farm_tests
> 80a9f23f8 Merge pull request #20532 from
> containers/renovate/dawidd6-action-send-mail-3.x
> 390e9ddc9 fix(deps): update module github.com/shirou/gopsutil/v3 to
> v3.23.10
> 784f76924 Merge pull request #20552 from
> containers/renovate/github.com-crc-org-vfkit-digest
> 18d6bb40d Support passing of Ulimits as -1 to mean max
> 78765b14d fix(deps): update github.com/docker/go-connections digest to
> 0b8c1f4
> ffb96ad8b fix(deps): update github.com/crc-org/vfkit digest to f3c783d
> 55b9ea3ec Merge pull request #20358 from mheon/9p
> f5b2cf1b5 Merge pull request #20533 from cevich/fix_secret_scanner
> 7153124f9 Log gvproxy and server9 to file on log-level=3Ddebug
> d9c388e2f Change to using gopsutil for cross-OS process ops
> 642fa9897 Initial addition of 9p code to Podman
> 2972f5941 Merge pull request #20545 from
> giuseppe/fix-hostname-with-host-uts
> b332ca7a0 libpod: fix /etc/hostname with --uts=3Dhost
> 4eb02346d Merge pull request #20536 from edsantiago/pasta_timeout_tweaks
> 735e24331 Merge pull request #20539 from edsantiago/stty_flake
> 377644640 Merge pull request #20476 from rhatdan/build
> 89d7b2735 systests: stty test: retry once on flake
> 6b94c8fd3 systests: pasta: avoid hangs
> 4c67a6aed Fix secrets scanning GHA Workflow
> 2193bb8fc [skip-ci] Update dawidd6/action-send-mail action to v3.9.0
> 1146f2ca7 Merge pull request #20136 from cevich/credential_scanning_confi=
g
> f509a3421 Merge pull request #20529 from
> giuseppe/docs-clarify-systemd-mount
> 487118242 Merge pull request #20457 from rhatdan/pod
> 77d265820 Merge pull request #20369 from cgiradkar/Issue-16759-docs
> e9dd41183 docs: clarify systemd cgroup mount
> eee2ca2d8 Merge pull request #20444 from
> containers/renovate/github.com-onsi-gomega-1.x
> 0943f3bcb Merge pull request #20513 from baude/applehvtiming
> a1577ec7b podman build --remote URI Dockerfile shoud not be treated as fi=
le
> 4f6a8f0d5 Merge pull request #20483 from vrothberg/RUN-1934
> 6ec458d82 Merge pull request #20510 from mheon/powercap_2
> 95a5ad258 Small fixes for wacko CI environments
> 95fc0044f Merge pull request #20508 from vrothberg/fix-20502
> c6d410cc3 Do not add powercap mask if no paths are masked
> 09c64ef31 Merge pull request #20503 from
> containers/renovate/github.com-google-uuid-1.x
> 3743955d6 compose: try all possible providers before throwing an error
> 91df369ae podman kube play --replace should force removal of pods and
> containers
> 3ce62d3cc Sort kube options alphabetically
> 4a2efe0ec Merge pull request #20497 from
> containers/renovate/go.etcd.io-bbolt-1.x
> dfa7e3776 Merge pull request #20500 from
> containers/renovate/github.com-docker-docker-24.x
> e966c86d9 container.conf: support attributed string slices
> 7d5af58bd Merge pull request #20501 from mheon/powercap
> 91ccd7cd2 CI: podman farm tests cleanup
> be7dd128e Mask /sys/devices/virtual/powercap
> 05a607f14 Update module github.com/google/uuid to v1.4.0
> c3fae0136 Merge pull request #20494 from edsantiago/systest_subnet_check
> 6a0b2c680 fix(deps): update module github.com/docker/docker to
> v24.0.7+incompatible
> 6badb659c fix(deps): update module go.etcd.io/bbolt to v1.3.8
> e5101b28d Merge pull request #20492 from brlin-tw/patch-1
> 499c60890 Merge pull request #20489 from containers/renovate/
> go-google.golang.org/grpc-vulnerability
> 9e3363c5e <http://go-google.golang.org/grpc-vulnerability9e3363c5e> CI:
> systest: safer random_rfc1918_subnet
> c1d177e8e Merge pull request #20493 from edsantiago/getport_safe
> c841fa9e9 CI: e2e: safer GetPort()
> fd5140d87 Fix broken code block markup in Introduction.rst
> d0ce60c63 chore(deps): update module google.golang.org/grpc to v1.57.1
> [security]
> 642c0c798 Merge pull request #20478 from lstocchi/i20373
> 15969a60b chore: remove npipe const and use vmtype const for checking
> 0242a7439 Merge pull request #20470 from edsantiago/curl_port_flake_fix
> 84efd2b7e Merge pull request #20468 from
> p-fruck/fix/api-compat-network-docs
> 5a47b1e15 Merge pull request #20050 from umohnani8/farm-build-2
> 2158e1540 Update module github.com/onsi/gomega to v1.29.0
> 32ef2d708 Merge pull request #20479 from ygalblum/quadlet-read-only
> c0fb8fe59 CI: try to fix more networking flakes
> 556898511 Merge pull request #20481 from vrothberg/fix-20469
> c21f28813 fix: check wsl npipe when executing podman compose
> 532804be5 Merge pull request #20482 from
> containers/renovate/golangci-golangci-lint-1.x
> 9ea1ed6d4 [CI:DOCS] Update dependency golangci/golangci-lint to v1.55.1
> 151a01917 Merge pull request #20480 from ygalblum/makefile-user-control
> 76cca08f8 Quadlet - explicit support for read-only-tmpfs
> c13b8e3c9 compat API: fix image-prune --all
> 0e15861c5 Makefile - allow more control over Ginkgo parameters
> 242d22319 Merge pull request #20463 from vrothberg/RUN-1934
> ebe01ca29 Add e2e tests for farm build
> 989afd910 vendor c/{buildah,common}: appendable containers.conf strings,
> Part 1
> 35121f67b Merge pull request #20455 from rhatdan/play
> dd8f57a3b Add podman farm build command
> 2e88d580a Add emulation package
> 06b726497 Use buildah default isolation when working with podman play kub=
e
> e9e18acd5 Merge pull request #20451 from rhatdan/volume
> 0a2aae119 docs(API): Fix compat network (dis-)connect
> 83d7c3849 Merge pull request #20464 from Luap99/libpod-remote
> 1b466ccbd test/e2e: do not import buildah
> ed58ea784 Merge pull request #20422 from sstosh/api-skip-cgroupv1
> 8a0968baa pkg/specgen: remove config_unsupported.go
> cb9dfeb8e pkg/parallel/ctr: add !remote tag
> d4a67cf45 pkg/domain/filters: add !remote tag
> 9cecae8c2 pkg/ps: add !remote tag
> 1d1630990 pkg/systemd/generate: add !remote tag
> bad25da92 libpod: add !remote tag
> abb5c86b6 pkg/autoupdate: add !remote tag
> 01a750699 vendor latest c/common
> 3615af903 libpod: remove build support non linux/freebsd
> 629278ea9 Merge pull request #20458 from edsantiago/retry_cache_pulls
> c3b471179 Merge pull request #20461 from Alan-Cha/main
> 36b41997d Merge pull request #20456 from rhatdan/storage
> 1850670f1 Fix typo
> 2e57746ff test/apiv2: adapt apiv2 test on cgroups v1 environment
> c3ba0221e ginkgo setup: retry cache pulls
> 83f07729c Merge pull request #20454 from
> containers/renovate/github.com-vbatts-git-validation-1.x
> 3abf5c929 Merge pull request #20452 from edsantiago/cache_k8s_pause
> ecb4f487c Merge pull request #20446 from Luap99/common
> ee6070888 Support size option when creating tmpfs volumes
> 8876380af not mounted layers should be reported as info not error
> 85cc4092f CI: stop using registry.k8s.io
> a8e1a5ed1 fix(deps): update module github.com/vbatts/git-validation to
> v1.2.1
> 6d99cb5cd test fixes for c/common tag chnages
> dfdd93323 vendor latest c/common
> 19c870da0 Merge pull request #20425 from
> giuseppe/podman-do-not-leak-DBUS_SESSION_BUS_ADDRESS-into-conmon
> 3661c87d3 Merge pull request #20412 from ashley-cui/lastup
> 8022d696f Merge pull request #20427 from Luap99/lint
> d6f44d956 hyperV: Update lastUp time
> 1ac110835 [CI:DOCS] Update dependency golangci/golangci-lint to v1.55.0
> 9e648a1f5 lint: disable testifylint
> 29273cda1 lint: fix warnings found by perfsprint
> 64f43fed4 lint: fix warnings found by inamedparam
> c21f42a4e lint: fix warnings found by protogetter
> 03947ab03 libpod: skip DBUS_SESSION_BUS_ADDRESS in conmon
> e49ed78a4 Merge pull request #20385 from umohnani8/host-net
> 110914d87 Merge pull request #20359 from
> containers/renovate/common-image-and-storage-deps
> 26681c09a Merge pull request #20414 from edsantiago/perlunicode
> 37292a10b Merge pull request #20405 from
> giuseppe/do-not-leak-sessions-with-remote
> c1980a6a2 Merge pull request #20409 from Luap99/port-fw
> 85e8aa4e8 Merge pull request #20413 from Luap99/quadlet-cgroupv2
> 936e30f68 Use node hostname in kube play when hostNetwork=3Dtrue
> bd953fdc7 cirrus setup: special-case perl unicode
> ca9efb0cd network: document ports and macvlan interaction
> f2bc63894 quadlet: document cgroupv2 requirement
> 0b0f128bf Merge pull request #20410 from
> containers/renovate/actions-checkout-digest
> e8183e836 [skip-ci] Update actions/checkout digest to b4ffde6
> 1d2589c3f Revert "Emergency workaround for CI breakage"
> f48a706ab remote: exec: do not leak session IDs on errors
> 30b14b33a Merge pull request #20403 from
> containers/renovate/k8s.io-kubernetes-1.x
> c2e1debe8 Merge pull request #20395 from rhatdan/quadlet
> ad1ab71b8 fix(deps): update github.com/containers/storage digest to
> 79aa304
> d1086281b fix(deps): update module k8s.io/kubernetes to v1.28.3
> 68636416d Merge pull request #20357 from rhatdan/TERM
> b2192695b Merge pull request #20406 from edsantiago/systest_bork
> 657029da7 System tests: fix broken silence127
> 9a29eb05e Merge pull request #20400 from baude/issue20361
> b72bb1162 Add TERM iff TERM not defined in container when podman exec -t
> d4086f5ac Merge pull request #20404 from edsantiago/emergency_ci_fix
> 6c7104c4f Merge pull request #20402 from baude/applehvrmstopgvproxy
> 44ed415b2 Emergency workaround for CI breakage
> 62a81a166 Merge pull request #20383 from Luap99/init-path
> d4d76479c Kill gvproxy when machine rm -f
> cad4d0ee9 Fix path for omvf vars on Darwin/arm64
> c73e99aab Merge pull request #20397 from edsantiago/cp_test_cleanup
> 553cfb6b6 Merge pull request #20368 from ygalblum/quadlet-image-name
> aabe5c8aa Merge pull request #20394 from
> giuseppe/cleanup-exec-session-on-errors
> 02757ab20 Merge pull request #20391 from sstosh/nanocpu-api-test
> 285718915 Allow systemd specifiers in User and Group Quadlet keys
> caef657c5 libpod: rename confusing import name
> efe5e98d0 use FindInitBinary() for init binary
> 1d3ec78e0 vendor latest c/common
> fa19e1baa exec: do not leak session IDs on errors
> 1efcd1ecf systests: cp test: lots of cleanup
> 2d65e57ae Define better error message for container name conflicts with
> external storage.
> 9b8e01efd Quadlet - support ImageName for .image files
> ef2392f21 Merge pull request #20381 from vrothberg/fix-20375
> 64171043a test/system: ignore 127 if it is the expected rc
> a1982c043 Merge pull request #20365 from
> p-fruck/fix/api-compat-network-connected
> 074a0de7f Merge pull request #20388 from cevich/cross_target_comment
> c65d1c02b test/apiv2/20-containers.at: fix NanoCPUs tests on cgroups v1
> 6624ccb4b Merge pull request #20384 from Luap99/double-netns
> 9394171cb Merge pull request #20387 from Luap99/machine-doc
> 831844b59 image history: fix walking layers
> ad5319025 fix(api): Ensure compatibality for network connect
> b0a45a905 Merge pull request #20366 from ygalblum/quadlet-kube-down-force
> 91264e7d2 Merge pull request #19586 from rhatdan/ps
> c909afb88 Merge pull request #20239 from jackgris/docker-api-error-respon=
se
> e0561301c [CI:DOCS] Add cross-build target info.
> dc705d370 machine set: document --rootful better
> bbd6281ec libpod: restart+userns cleanup netns correctly
> 3b6a4ac37 Minor log and doc fixes
> f875ae317 Quadlet man page - discuss volume removal explicitly
> 5d5facbd7 Quadlet - add support for KubeDownForce
> 5853e2bee Merge pull request #20363 from ygalblum/quadlet-kube-oneshot-te=
st
> 6ba67ba96 System Test - Quadlet kube oneshot
> 206177c59 Merge pull request #20376 from edsantiago/buildah_tests
> ae707b58d Merge pull request #20338 from umohnani8/vendor-common
> 9637fed2f Fix output of podman --remote top
> acc7a94df Merge pull request #20235 from rhatdan/read-only
> dcb421bc5 buildah-bud: test relative TMPDIR
> c8604081e Fix handling of --read-only-tmpfs flag
> 1b0be2f34 Vendor common and buildah main
> dabf6c83a Merge pull request #20367 from flouthoc/bump-and-test-buildah
> 091d83d3c Merge pull request #20360 from
> containers/renovate/github.com-vbauerster-mpb-v8-8.x
> 5db3b753a remote,build: wire unsetlabels
> 331e47acb test: build with TMPDIR as relative
> 6cf3dd493 docs: add unsetlabel
> 64ff14932 vendor: bump buildah to v1.32.1-0.20231012130144-244170240d85
> 74ed1d6e7 fix(deps): update module github.com/vbauerster/mpb/v8 to v8.6.2
> b9f2c4d17 fix: pull error response docker rest api compatibility
> b5fec41f2 Merge pull request #20333 from baude/showinfo
> aa0e96e78 Merge pull request #20274 from ashley-cui/cleanup
> 29f5c563e Show client info even if remote connection fails
> 3e86bece9 Merge pull request #20354 from
> containers/renovate/github.com-containers-libhvee-digest
> 52112fc5c fix(deps): update github.com/containers/libhvee digest to
> e51be96
> 5afa949a4 Merge pull request #20322 from jakecorrenti/set-lock
> 6e40a5f9c Merge pull request #20348 from rhatdan/codespell
> e4ef27137 Merge pull request #20347 from Luap99/healthcheck-event
> cb53bcf23 Run codespell
> fb87f0a7b Merge pull request #20337 from ygalblum/quadlet-kube-oneshot
> 987dc2b8b SetLock for all virt providers
> 61e0b64b9 Machine: Teardown on init failure
> 99a14332e healthcheck: make sure to always show health_status events
> 7b84b55da Apply suggestions from code review
> 8de7c48df Merge pull request #20340 from baude/rtd
> ca518888e [CI:DOCS]rtd: implement v2 build file
> 702f15528 Quadlet - support oneshot .kube files
> e5a099df6 Merge pull request #20177 from cevich/podman-machine-hyperv
> d437ca8fd Merge pull request #20328 from vrothberg/RUN-1936
> 3dcd6af6e Merge pull request #20329 from Luap99/deadlock
> cdab56109 Merge pull request #20286 from
> containers/renovate/golang.org-x-net-0.x
> 3cc9db862 libpod: fix deadlock while parallel container create
> 706b55080 Merge pull request #20323 from
> containers/renovate/github.com-cpuguy83-go-md2man-v2-2.x
> 2301320f6 fix(deps): update module golang.org/x/net to v0.17.0
> 8b46e852e api: add `compatMode` paramenter to libpod's pull endpoint
> 76fec1227 api: break out compat image pull
> 40f897653 fix(deps): update module github.com/cpuguy83/go-md2man/v2 to
> v2.0.3
> 27ca6d487 Merge pull request #20321 from
> containers/renovate/github.com-nxadm-tail-1.x
> fd514b498 Merge pull request #20318 from Luap99/db-backend
> 29ae51600 use sqlite as default database
> 8a52e638e vendor latest c/common
> acd0a93c3 fix(deps): update module github.com/nxadm/tail to v1.4.11
> 040a4e4b1 Merge pull request #20232 from umohnani8/ctr-create
> 8615b165c Merge pull request #20299 from giuseppe/fix-flake-ENOENT
> d18369ee8 Check for image with /libpod/containers/create
> 8ac2aa793 container: always check if mountpoint is mounted
> d90fdfc63 Merge pull request #20311 from
> containers/renovate/github.com-onsi-ginkgo-v2-2.x
> 787b1b25c fix(deps): update module github.com/onsi/ginkgo/v2 to v2.13.0
> b2c5418fb Merge pull request #20288 from
> albnnc/fix/do-not-ignore-external-containerfiles
> 9beb3a972 vendor: update c/storage
> 0dba5acd8 Merge pull request #20308 from giuseppe/drop-debug-msg
> 6e7e87503 Merge pull request #20253 from ygalblum/quadlet-command-args
> 36bf90518 api: drop debug statement
> d321d427d Quadlet - add support for global arguments
> e9d6ffa8f Merge pull request #20252 from vrothberg/privileged
> b7f708a94 Merge pull request #20290 from
> containers/renovate/golang.org-x-tools-0.x
> 745cfb57d Merge pull request #20283 from
> containers/renovate/github.com-containers-libhvee-digest
> 732cec794 Add system test
> 10aa39068 fix(deps): update module golang.org/x/tools to v0.14.0
> 3fdb6ee2d Don't ignore containerfiles outside of build context
> b3209dc5d fix(deps): update github.com/containers/libhvee digest to
> fcf1cc2
> f4348bab6 Merge pull request #20279 from
> containers/renovate/golang.org-x-term-0.x
> eda275820 fix(deps): update module golang.org/x/term to v0.13.0
> d36c90868 Merge pull request #20277 from
> containers/renovate/golang.org-x-sys-0.x
> b8084274c Merge pull request #20273 from giuseppe/bump-storage
> a7390a408 Merge pull request #20276 from ashley-cui/rel
> da6c86dfc Update module golang.org/x/sys to v0.13.0
> 1c0780097 [CI:DOCS] Add updating version on podman.io to release process
> 362eca669 containers.conf: add `privileged` field to containers table
> 6cb10425d Implement secrets/credential scanning
> ecef03d81 Merge pull request #20271 from
> containers/renovate/golang.org-x-sync-0.x
> 106abd13b Cirrus: Execute Windows podman-machine e2e tests
> 338e4f590 vendor: bump c/storage
> 8807243cc Update module golang.org/x/sync to v0.4.0
> 158b11a10 Merge pull request #20245 from jakecorrenti/qemu-wrapper
> b144b17f7 Merge pull request #20268 from Luap99/api-doc
> 2168f0745 [CI:DOCS] update swagger version on docs.podman.io
> 516a03a6f Merge pull request #20266 from n1hility/fix-resolved-disable
> 458e56246 Merge pull request #20265 from n1hility/revert-systemd-change
> 0414f88b3 Create Qemu command wrapper
> 7dc5f7b49 Merge pull request #20263 from umohnani8/play-doc
> e46784971 Merge pull request #20262 from lsm5/gvisor-rhel
> 4a67d2276 Merge pull request #20256 from Luap99/revert-env
> df6a00026 Adjust to path name change for resolved unit
> 2a38f30b6 Revert "Fix WSL systemd detection"
> f622a2a54 [CI:BUILD] rpm/copr: gvforwarder recommends for RHEL
> 27f58803d [CI:DOCS] update kube play delete endpoint docs
> 46ca057f6 Merge pull request #20250 from Luap99/inspect-device
> 6d3cea3ce Merge pull request #20261 from cgiradkar/Issue-168-podman.io
> 3b39d4b08 Merge pull request #20132 from cgiradkar/Issue-17856
> 3fc7c42e1 [CI:DOCS] Remove dead link from README
> 1b3cedbf3 test/system: --env-file test fixes
> 617af9bea Revert "feat(env): support multiline in env-file"
> 5f340487e Revert "docs(env-file): improve document description"
> 9599589f1 Revert "fix(env): parsing --env incorrect in cli"
> 7e6e26732 Filter health_check and exec events for logging in console
> e78e76c23 Merge pull request #20205 from jakecorrenti/build-applehv-intel
> 0443c5166 inspect: ignore ENOENT during device lookup
> c14e8f6cc Merge pull request #20238 from
> containers/renovate/github.com-containers-libhvee-digest
> 267e80aa1 Merge pull request #20242 from flouthoc/manifest-retry
> b576b7932 test, manifest: test push retry
> 13456be1e Merge pull request #20234 from giuseppe/vendor-distribution
> 2457c259b Merge pull request #20240 from n1hility/fix-wsl-version-detecti=
on
> cbca39529 Fix locale issues with WSL version detection
> b988eadaf vendor: update module github.com/docker/distribution to
> v2.8.3+incompatible
> 1ebd22303 vendor: bump c/common to v0.56.1-0.20231002091908-745eaa498509
> fdf3e4b23 Merge pull request #20202 from cfergeau/gvproxy
> 8b647cdb5 Update github.com/containers/libhvee digest to e9b1811
> 527cf365c Merge pull request #20226 from
> containers/renovate/golang.org-x-exp-digest
> 162de835a Merge pull request #20215 from cevich/revert_faster_locking
> 3b3bb5d2d Merge pull request #20223 from
> containers/renovate/github.com-opencontainers-runtime-spec-digest
> fe828d223 Merge pull request #20192 from umohnani8/images
> cc946daff windows: Use prebuilt gvproxy/win-sshproxy binaries
> a0eb80c4c Merge pull request #20221 from rahilarious/remove-selinux-tag
> bbd9590b4 Merge pull request #20194 from umohnani8/kube-mode
> 9560d36bb Merge pull request #20208 from baude/newvfkit
> 988b90635 Merge pull request #20227 from ygalblum/volume-ignore-noop
> 4d8d081dd Merge pull request #20219 from rahilarious/main
> 979c77f10 Volume create - fast exit when ignore is set and volume exists
> 874e4466a Update golang.org/x/exp digest to 9212866
> 22a1d015c Update github.com/opencontainers/runtime-spec digest to c0e9043
> 229734c10 remove selinux tag as not needed anymore
> 049a5fb92 [skip-ci] Improve podmansh(1)
> 85ed9edde Build applehv for Intel Macs
> 7ef8519f4 Revert "GHA Workflow: Faster discussion-locking"
> 59e0919bc update vfkit vendored code
> 17cebb3ff Add DefaultMode to kube play
> ba788c1bb Fix broken podman images filters
> cc8c28eb7 Merge pull request #20198 from
> jakecorrenti/remove-extra-files-line
> fff4e2f0e Merge pull request #20191 from umohnani8/load
> 26ae0ba85 Merge pull request #20190 from baude/issue20122
> d602038c2 Merge pull request #20189 from
> giuseppe/run--replace-print-only-cid
> f3aa35aa0 Merge pull request #20186 from cfergeau/gvproxy
> 9b3964111 Remove `c.ExtraFiles` line in machine
> 5e216a2a7 Merge pull request #20193 from ashley-cui/lastupnever
> 744e09d6e Merge pull request #19994 from Syquel/fix-wsl-systemd-detection
> f21c1d238 podman: run --replace prints only the new container id
> 38f718e8c Merge pull request #20162 from edsantiago/f39
> bcfd9f340 New machines should show Never as LastUp
> 94818f594 podman machine: disable zincati update service
> b284128d7 Revert "cirrus setup: install en_US.UTF-8 locale"
> b28188de2 Cirrus: CI VM images w/ newer automation-library
> 2b9c0555f CI VMs: bump to f39 + f38
> ecd7b3802 [CI:DOCS] Update podman load doc
> 87dd93933 Merge pull request #20181 from
> containers/renovate/common-image-and-storage-deps
> c2a8ed19c Merge pull request #20180 from jackgris/fix-links-readme
> 58b5ae22e Update mac installer to latest gvproxy release
> 8fb719fd0 Merge pull request #20184 from MrSuicideParrot/main
> 5b990c383 Fix WSL systemd detection
> c9730e232 Merge pull request #20149 from ygalblum/quadlet-container-mount
> be823b388 Add documentation for the vrf option on netavark
> 46a1e25eb Merge pull request #20176 from edsantiago/e2e_check_stderr__mor=
e
> 4212b4998 Merge pull request #19823 from Backfighter/fix-17028
> 36f8e78d7 Merge pull request #20150 from wpross/add-rdt
> 71b3d7703 Merge pull request #20158 from baude/wslenableinit
> fda028ca0 fix(deps): update github.com/containers/common digest to 9342cd=
d
> 94139ece9 Merge pull request #20168 from boaz0/closes_20079
> 6306e8985 fix: typos in links, path and code example
> ccb7da52c e2e: ExitCleanly(): manual special cases
> 611db19b3 e2e: ExitCleanly(): the final fron^Wcommit
> b4d66a939 Merge pull request #20157 from ashley-cui/makesshproxy
> 3444f34d5 Merge pull request #20169 from
> containers/renovate/dawidd6-action-send-mail-3.x
> 149d3f7ad [CI:DOCS] Add win-sshproxy target to winmake
> 0d4526e61 wsl: enable machine init tests
> 455d16549 Update docs/source/markdown/options/rdt-class.md
> bfbd0c896 move IntelRdtClosID to HostConfig
> 4853320ce use default when user does not provide rdt-class
> 77336de8f Add documentation for Intel RDT support
> 24b2f829b Add test for Intel RDT support
> 40d3c3b9b Add Intel RDT support
> 295439265 [CI:DOCS] Fix podman form update --help examples
> 4e726f506 Merge pull request #20166 from
> containers/renovate/github.com-containers-gvisor-tap-vsock-0.x
> 1323bf97f Merge pull request #20164 from
> containers/renovate/common-image-and-storage-deps
> bf061312f Merge pull request #20167 from Luap99/e2e-netdefault
> f0eb45667 Quadlet container mount - support non key=3Dval options
> d05c77799 Merge pull request #20159 from baude/applehvenablerm
> 0b5ea1e6e test/e2e: default to netavark
> 4ed9dc1ad [skip-ci] Update dawidd6/action-send-mail action to v3.9.0
> 48ea4b9ec fix(deps): update module github.com/containers/gvisor-tap-vsock
> to v0.7.1
> 35824b647 Merge pull request #20148 from vrothberg/conmon-env
> 90eb73629 fix(deps): update github.com/containers/common digest to 461931=
4
> 31f9e678f Merge pull request #20160 from baude/applehvenablestart
> 779c33c33 Merge pull request #20140 from edsantiago/e2e_check_stderr__mor=
e
> f9b3fc79b Merge pull request #20128 from ashley-cui/mach
> 172494423 applehv: enable machine tests for start
> 2ff43429f applehv: machine tests for stop and rm
> 127ebe2b2 Update machine tests README
> 995a6a8ac Add podman socket info to machine inspect
> 80952db0b Fix podman machine info test for hyperV
> 94f47d6f6 Merge pull request #20141 from baude/wslenablestop
> f64234969 Merge pull request #20135 from ashley-cui/hypervroot
> 7ade97210 libpod: pass entire environment to conmon
> e4b7455b7 e2e: ExitCleanly(): manual fixes to get tests working
> dbd946a93 e2e: ExitCleanly(): a few more
> a5c7b0ea5 Merge pull request #20153 from lsm5/fcos-podman-next-followup-3
> 59ffea80d FCOS+podman-next: correct GHA conditional syntax
> 8bad842a4 pkg/machine/e2e: wsl stop
> d2d121a38 Merge pull request #20152 from baude/wslenableinspect
> 1e046833c Merge pull request #20151 from baude/wslenablessh
> 217c4d546 wsl: machine tests for inspect
> e4bfcfc25 wsl: machine tests for ssh
> a2434a9d3 Merge pull request #20144 from baude/wslenableset
> 72033cdc6 Merge pull request #20137 from baude/applehvenablee2e
> cfc176d49 Merge pull request #20146 from
> containers/renovate/common-image-and-storage-deps
> 5636d0219 fix(deps): update github.com/containers/common digest to e18cda=
8
> a018fe7c1 Merge pull request #20145 from baude/wslenablestart
> a112ee895 wsl: machine start test
> d3d5011dc wsl machine tests: set
> aebfde240 Merge pull request #20142 from baude/wslenablerm
> f52e414b2 Merge pull request #20138 from ashley-cui/proxytest
> cc4917d81 wsl: machine tests
> 8a16174f9 Merge pull request #20134 from lsm5/fcos-image-cron
> ec68a7489 Skip proxy test for hyperV
> 33a92aa00 Enable machine e2e test for applehv
> 65ce03486 hyperV: Respect rootful option on machine init
> 52ba1bfff [CI:BUILD] FCOS image: enable nightly build
> 7133f5d38 Merge pull request #20117 from baude/hypervsettest
> 97a02a036 Merge pull request #20130 from edsantiago/fedoraminimal_safe
> 2fef4c7ab Merge pull request #20088 from vrothberg/fix-19938
> c59d1df75 Merge pull request #20124 from vrothberg/build-docs
> ffd67cf75 e2e: use safe fedora-minimal image
> 41e51f473 hyperv: machine e2e tests for set command
> 59e295f2a podman build: correct default pull policy
> ca1cd0204 Merge pull request #20091 from lsm5/copr-rpm-version-sha
> 6293ec2e2 fix handling of static/volume dir
> 919564e1a Merge pull request #20127 from vrothberg/fix-20119
> 26b5b1dd3 unbreak CI: useradd not found
> f41d536f1 Merge pull request #20089 from edsantiago/e2e_check_stderr__mor=
e
> 9ba002290 Merge pull request #20115 from baude/hypervstarting
> 7359a2df1 Merge pull request #20116 from baude/hypervremoveforce
> 3d5b9e80c Merge pull request #20114 from baude/hypervtzfix
> e670374e3 Merge pull request #20110 from umohnani8/farm-update
> 08936db35 hyperv: set more realistic starting state
> 2bef573f3 hyperv: use StopWithForce with remove
> 2f7c2508c Merge pull request #20101 from ashley-cui/machcpus
> e7a86d19c Merge pull request #20111 from
> containers/renovate/github.com-containers-gvisor-tap-vsock-digest
> f52b02f40 Fix all ports exposed by kube play
> cd4f61181 Fix setting timezone on HyperV
> 172369b54 fix(deps): update github.com/containers/gvisor-tap-vsock digest
> to 97028a6
> e0b44bcf3 Fix farm update to check for connections
> d8e305716 Adjust machine CPU tests
> c3ab75ca4 Merge pull request #20103 from lsm5/main-version-bump
> 8188a6fcf Bump version on main
> 67aab1308 Merge pull request #20100 from Luap99/pod-rm-volume
> e65874903 [CI:BUILD] Packit: show SHORT_SHA in `podman --version` for COP=
R
> builds
> 96142c2f7 Vendor c/common
> af2665c28 pod rm: do not log error if anonymous volume is still used
> 4916f7d77 e2e: ExitCleanly(): manual fixes to get tests passing
> 8e743fa1d e2e: ExitCleanly(): a few more
> 5a3a9ce9c Merge pull request #20093 from baude/hypervinit
> da6ebeb51 Merge pull request #20086 from
> giuseppe/fix-mount-cgroupfs-without-netns
> 08d05b9b0 Merge pull request #20061 from lsm5/packit-fail-tag
> 8576a36f4 Merge pull request #20083 from
> giuseppe/fix-shared-propagation-test
> c66aa3b7b fixes for pkg/machine/e2e on hyperv
> 83b6975d1 test: fix rootless propagation test
> 6c2493f78 [CI:BUILD] packit: tag @containers/packit-build team on copr
> build failures
> aa152a779 Merge pull request #20082 from
> giuseppe/test-update-fedora-minimal
> 935a6d156 Merge pull request #20074 from baude/hypervmachinee2epass1
> aa286a532 Merge pull request #19964 from baude/resizeDisk
> 92f4dcb09 Enable disk resizing for applehv
> fea4613e9 Merge pull request #20085 from rhatdan/volumes
> 5b3801776 Various updates for hyperv and machine e2e tests
> 682ca6b2e test: update fedoraMinimal version
> cf3b216ac Merge pull request #20039 from lsm5/rpm-remove-gvproxy-subpacka=
ge
> 6db6645b4 Merge pull request #20084 from cgiradkar/hotfix-ActiveDestinati=
on
> ada67a248 Merge pull request #20041 from lsm5/fcos-crun-wasm
> f850339d0 Merge pull request #20049 from
> containers/renovate/github.com-containers-gvisor-tap-vsock-digest
> 8d3010d06 specgen, rootless: fix mount of cgroup without a netns
> 39ba5ff24 Automatically remove anonymous volumes when removing a containe=
r
> 24d3347ed Use ActiveServiceDestination in ssh remoteConnectionUsername
> b6ea49f5a fix(deps): update github.com/containers/gvisor-tap-vsock digest
> to 9298405
> e209c40ad Merge pull request #20071 from
> edsantiago/e2e_check_stderr__kubegen
> 0f0430702 Merge pull request #20065 from edsantiago/e2e_check_stderr__mor=
e
> 53e6a4435 Merge pull request #20031 from ashley-cui/winmake
> ebbc42359 Merge pull request #20069 from baude/noextrawindows
> c69873d67 e2e: ExitCleanly(): generate_kube_test.go
> 841cfa802 e2e: generate kube -> kube generate
> d1f86d524 e2e: ExitCleanly(): generate_kube_test.go
> f3e9a6369 windows cannot "do" extra files
> 8b498b74f Merge pull request #20063 from baude/strongunits
> 62e13bec7 e2e: ExitCleanly(): Fixes for breaking tests
> 09c3ac48f play kube -> kube play
> e83ced8a0 e2e: ExitCleanly(): play_kube_test.go
> eb9283c6f introduce pkg/strongunits
> 639eb52c8 Merge pull request #20062 from vrothberg/syslog-fix
> c5be3aecd Merge pull request #20056 from Luap99/fast-net-ls
> 93623fe0c Merge pull request #20058 from rhatdan/VENDOR
> 6d8b3047d Makefile equiv Powershell script
> 4652a2623 pass --syslog to the cleanup process
> 370937d6c Merge pull request #20057 from vrothberg/fix-auto-update-test
> cbfd92123 Merge pull request #20053 from martinpitt/packit-revdeps-notify
> 8f17ac5c1 Merge pull request #19997 from cgiradkar/Issue_15588
> 73dc72f80 vendor of containers/common
> 1cbe692de fix --authfile auto-update test
> 8e5adde0b compat API: speed up network list
> e80d9b7f8 Merge pull request #20036 from edsantiago/bats_check_stderr
> 28a1c5492 Merge pull request #20042 from cevich/faster_closed_issue_pr_lo=
ck
> 8c95aa402 Change priority for cli-flags for remotely operating Podman
> befdb4199 libpod: remove unused ContainerState() fucntion
> 07f8d4451 Merge pull request #20048 from edsantiago/e2e_check_stderr__mor=
e
> 26f25d314 Merge pull request #19992 from baude/wslenablee2e
> eae4e5079 Merge pull request #20046 from
> containers/renovate/github.com-onsi-ginkgo-v2-2.x
> 0ec63abca [CI:BUILD] Packit: Enable failure notifications for cockpit tes=
ts
> 0ac98176b e2e: ExitCleanly(): more low-hanging fruit
> a50fb7e06 e2e: ExitCleanly(): more low-hanging fruit
> 1908663f1 fix(deps): update module github.com/onsi/ginkgo/v2 to v2.12.1
> 38f5ead33 Enable machine e2e tests for WSL
> ff07abea4 systests: tighter checks for unwanted warnings
> 618f846ed GHA Workflow: Faster discussion-locking
> 696f4a6a4 Merge pull request #20038 from
> TomSweeneyRedHat/dev/tsweeney/nit_farm
> 6a4df3af3 Merge pull request #20037 from mheon/fix_sigproxy_docs
> 289be0c01 [CI:BUILD] FCOS + podman-next image: pull in wasm
> e688fdc1a Merge pull request #19830 from lsm5/copr-rpm-fcos-followup
> 96d5794a7 Merge pull request #20034 from edsantiago/e2e_check_stderr__mor=
e
> 910106040 Merge pull request #19723 from
> jakecorrenti/implement-gvproxy-cmdline
> 649539519 [CI:BUILD] rpm: remove gvproxy subpackage
> b0f7072ac [CI:DOCS] Tweak podman to Podman in a few farm man pages
> 8afffa1aa Docs on sig-proxy are wrong, we support TTY
> 4fca726f7 e2e: ExitCleanly(): low-hanging fruit, part 2
> 64c46c429 e2e: ExitCleanly(): low-hanging fruit, part 1
> 113b41b6f Buildtag out unix commands for common OS files
> 57fbdc1c4 Merge pull request #20030 from edsantiago/bats_cleanup
> aec58f515 systests: clean up after tests; fix missing path in logs
> fa7150451 [CI:BUILD] followup PR for fcos with podman-next
> 289e59ee1 Implement gvproxy networking using cmdline wrapper
> 63219d617 Merge pull request #20016 from flouthoc/test-rmi-wo-layer
> 5f3a5408e Merge pull request #20026 from ygalblum/quadlet-image-test-fixe=
s
> e68e37136 fix, test: rmi should work with images w/o layers
> e9b98510d vendor: bump c/common to v0.56.1-0.20230919073449-d1d9d38d8282
> 50a685bd1 Quadlet Image test - rearrange test function
> 0293e643c Merge pull request #20022 from edsantiago/e2e_check_stderr__mor=
e
> e6cf09b68 e2e: continuing ExitCleanly() work: manual tweaks
> d78221545 e2e: continuing ExitCleanly() work
> c5851976b Merge pull request #20014 from vrothberg/containers.conf-env-ho=
st
> 8434471a3 Merge pull request #20007 from rahilarious/main
> 47160da7a [CI:DOCS] Improve podman-tag man page
> ef553fb0d [CI:DOCS] Improve podman-build man page
> 364f989c4 Merge pull request #20005 from rhatdan/run
> 1d7efcbe2 Merge pull request #19912 from ygalblum/quadlet-unit-image
> 5e1b0ce0b Merge pull request #20017 from lsm5/main-release-process
> 81ddf4886 Merge pull request #20012 from vrothberg/module-parsing
> 5be2357a5 Merge pull request #19917 from afbjorklund/unix-url
> d41047c1c Merge pull request #20015 from
> edsantiago/xref_filter_no_asterisks
> 93dc30e1e [CI:DOCS] Include precheck to release process
> a80a908df [CI:DOCS] consistentize filter options in man pages
> 55ca571e5 Quadlet - add support for .image units
> 41beb5374 --env-host: use default from containers.conf
> 0b7142f4a error when --module is specified on the command level
> d912e735a Merge pull request #19987 from edsantiago/xref_filters
> deba3b80a man page crossrefs: add --filter autocompletes
> 5dc4370d9 Merge pull request #19911 from
> xtexChooser/xtex/impl-container-label-not
> 03dd5f256 Fix specification of unix:///run
> 98e6dda69 Add label! filter and tests to containers and pods
> 3e4e39d1e Merge pull request #19984 from lsm5/main-release-notes
> d501d45c7 Merge pull request #19981 from
> containers/renovate/github.com-opencontainers-image-spec-1.x
> 3f8f4946e Merge pull request #19979 from edsantiago/ci_trace_setup
> c361d076b Merge pull request #19960 from umohnani8/build-common
> 348f9fe0d Merge pull request #19988 from baude/wslrmdashf
> 04b85765e Merge pull request #19972 from baude/hypervenablee2e
> 0728a10c6 Move podman build opts to common file
> e106d6e49 Merge pull request #19985 from
> TomSweeneyRedHat/dev/tsweeney/buildahbump_1.32.0
> 8a9f778e2 Add ability for machine rm -f for WSL
> 919dce131 Plumbing to run machine tests with hyperv
> ade0c4932 CI: trace setup and runner scripts
> c37443e8b Bump to Buildah v1.32.0
> 7c05595e3 Merge pull request #19980 from rhatdan/completions
> 9b36f334d [CI:DOCS] bump release notes on main with the latest release
> cae110f8b fix(deps): update module github.com/opencontainers/image-spec
> to v1.1.0-rc5
> ae3e49f7e Merge pull request #19978 from edsantiago/e2e_check_stderr__mor=
e
> 4a2a423df Add --filter pod=3D autocompletion
> 075cf2254 e2e: ExitCleanly(): manual test fixes
> db5adca73 e2e: continuing ExitCleanly(): just the replacements
> 3984b45b4 Merge pull request #19976 from plettich/patch-1
> 33e565520 Merge pull request #19951 from Luap99/small-remote
> 61b9a38bd Merge pull request #19956 from rhatdan/ulimit
> 1e43fae5a Merge pull request #19873 from rst0git/update-checkpointctl
> d275203c5 Merge pull request #19973 from rhatdan/codespell
> c689fb4a5 Fix some spelling and formatting
> 522e0f43f Add support for Ulimit in quadlet
> b1e3e8d97 Run codespell on code
> 957523e62 Merge pull request #19969 from eriksjolund/rewrite-restart-md
> 88b415e34 Merge pull request #19955 from rhatdan/quadlet
> dde06ae0b Merge pull request #19970 from
> containers/renovate/k8s.io-kubernetes-1.x
> 6b7f718b4 wire in new buildah build options
> f9aba28ca make golangci-lint happy
> c1b6effac add !remote tag to pkg/specgen/generate
> 3acee29cf pkg/specgen: do not depend on libimage for remote
> 2c2299ad8 bump buildah to latest
> bf86ed72c [CI:DOCS] restart.md: migrate to container unit
> 18561f26a Merge pull request #19958 from ryanhockstad/main
> e3ea6bf2f Merge pull request #19954 from edsantiago/e2e_check_stderr__dif=
f
> 304b22729 fix(deps): update module k8s.io/kubernetes to v1.28.2
> 4ed3273f6 Add support for PidsLimit in quadlet
> 883612eff Merge branch 'containers:main' into main
> 7d6722bd6 Merge pull request #19957 from
> edsantiago/e2e_check_stderr__create
> 9554022ce Merge pull request #19959 from edsantiago/e2e_check_stderr__mor=
e
> 70560f916 Add DNS fields to Container and Network unit groups
> a0b413862 Merge pull request #19965 from Luap99/api-4.6
> 777b5efa4 [CI:DOCS] update API docs version list
> 7b9114023 Try to fix broken CI (gvisor-something)
> df011f437 e2e: more ExitCleanly(): manual test fixes
> cb1cb338c e2e: more ExitCleanly(): dumb string replacements
> 62ac96e12 e2e: create_test: use ExitCleanly()
> b0f77acd1 e2e: diff_test: use ExitCleanly()
> e8c4d7966 Merge pull request #19952 from mheon/init_cannot_modify
> 89d951aa9 Merge pull request #19948 from edsantiago/e2e_check_stderr__mor=
e
> f0557a27d Merge pull request #19932 from lsm5/podmansh-timeout
> c1703f7b5 Merge pull request #19950 from Luap99/vendor-common
> 5920bfa2e The `podman init` command cannot modify containers.
> 639a1a029 bump c/common to latest main
> 806c5de12 Podmansh: use podmansh_timeout
> eefaa512a e2e: more ExitCleanly(): low-hanging fruit
> 6f4f94137 Add test for legacy address without two slashes
> 7da91addc Merge pull request #19579 from
> danishprakash/generate-daemonset-support
> 91f3f3a52 Merge pull request #19924 from
> edsantiago/e2e_check_stderr__commit
> 9b17d6cb0 vendor: update checkpointctl to v1.1.0
> cdcf18b86 kube: add DaemonSet support for generate
> e9673502e Merge pull request #19929 from rhatdan/VENDOR
> 22003cbb8 Merge pull request #19923 from
> edsantiago/e2e_check_stderr__cleanup
> 75b4679a7 vendor of containers/(common, storage, image)
> cbb955811 Merge pull request #19245 from mheon/fix_19237
> 5e8c75e4a Merge pull request #19926 from edsantiago/e2e_check_stderr__clo=
ne
> 325736fcb Merge pull request #19914 from umohnani8/term
> fd886d657 Merge pull request #19927 from
> giuseppe/move-oom-clamp-at-start-time
> 19bd9b33d libpod: move oom_score_adj clamp to init
> 4f017236e e2e: commit_test: use ExitCleanly()
> 3a4be5e90 e2e: container_clone_test.go: use ExitCleanly()
> 8cb14e54a e2e: use ExitCleanly() in cleanup_test.go
> 925794c6a Ensure HC events fire after logs are written
> adc45ef88 Merge pull request #19916 from
> eriksjolund/fix-docs-podman-systemd-unit-equivalents
> 336055fe3 Use url with scheme and path for the unix address
> 65a64da27 [CI:DOCS] podman-systemd.unit: fix equivalents
> 8acd66c11 Merge pull request #19888 from giuseppe/fix-pod-lifecycle
> d9a85466a Add support for kube TerminationGracePeriodSeconds
> 8d37db75a Merge pull request #19910 from Daskan/main
> 51d01dd38 Merge pull request #19907 from n1hility/breakout-altbuild
> 5eb0a53a0 Update podman-kube-play.1.md.in
> 92bdd912b Merge pull request #19891 from edsantiago/run_rmi_warn
> 745201ea2 Merge pull request #19902 from giuseppe/fix-pod-run-with-mounts
> c2cd93cdc Split up alt binaries to speed up build
> 7bf9f302a Switch installer task to EC2
> ab5ca5b69 Merge pull request #19895 from edsantiago/ci_test_skipper_fix
> fbbad0439 pod: fix duplicate volumes from containers.conf
> 0c75eac63 tests: add test for pod cgroups
> b8f6a12d0 libpod: create the cgroup pod before containers
> 331b3c216 cmd, specgen: allow cgroup resources without --infra
> 83334fb4e specgen: allow --share-parent with --infra=3Dfalse
> 5de8f4aba libpod: allow cgroup path without infra container
> 5121c9eb0 libpod: check if cgroup exists before creating it
> 38209ef49 libpod: refactor platformMakePod signature
> 627ac1c96 libpod: destroy pod cgroup on pod stop
> 9a347619d utils: export MoveUnderCgroup
> 556db46a6 libpod: refactor code to new function
> f8e1ec731 Merge pull request #19897 from
> edsantiago/e2e_check_stderr_checkpoint
> 7524753ef Merge pull request #19896 from baude/issue17019
> 6ee8f73d4 Merge pull request #19885 from rhatdan/kube
> 5d6ec27e9 Merge pull request #19892 from edsantiago/StopSignal_default_na=
me
> 65bddfcd2 e2e: use ExitCleanly() in checkpoint tests
> 479680232 [CI:DOCS]Remove use of --latest|-l from tutorial
> afeab39d1 CI test runner: upgrade tests rely on system tests
> c0d36b8ab Merge pull request #19894 from edsantiago/urgent_ci_fix
> 59bd6a74a run --rmi: "cannot remove" is a warning, not an error
> 70cf9740f StopContainer: display signal num when name unknown
> 6f913f5f3 URGENT: fix broken CI
> e546aebb3 Merge pull request #19889 from vrothberg/restart-kill
> 0c72726f0 Merge pull request #19878 from edsantiago/bats_check_stderr
> 16f2dd36b Merge pull request #19887 from rhatdan/kube1
> b83485022 Add support for kube  securityContext\.procMount
> 589867d71 podman: don't restart after kill
> 2d7d8d1d1 Tmpfs should not be mounted noexec
> c2575f726 sys tests: run_podman: check for unwanted warnings/errors
> c17c190f8 Merge pull request #19882 from edsantiago/e2e_exitcleanly
> 24e9e946c Merge pull request #19883 from
> containers/renovate/setuptools-68.x
> 1211518e8 chore(deps): update dependency setuptools to ~=3D68.2.0
> 465150f10 e2e: use ExitCleanly() in attach & build tests
> c11ac807f Merge pull request #19759 from rhatdan/docs
> 27495981c Some distros do not default to docker.io for shortname searches
> af17ddaee Merge pull request #19871 from giuseppe/accept-empty-capabiliti=
es
> 2806378c1 Merge pull request #19872 from edsantiago/systest_fix_eaddrinus=
e
> 74a7d61f5 Merge pull request #19869 from
> containers/renovate/github.com-cyphar-filepath-securejoin-0.x
> 30abd7f1a security: accept empty capabilities list
> c32cfb1d0 systests: random_free_port: fix EADDRINUSE flake
> 3e5b28b1d Merge pull request #19867 from siretart/siretart/tests/fcos
> f14360f70 Merge pull request #19863 from mheon/fix_18874
> d7b7b2083 Merge pull request #19866 from
> containers/renovate/github.com-containers-libhvee-digest
> 3c0728df3 Merge pull request #19865 from
> containers/renovate/github.com-docker-docker-24.x
> 1004f53d0 Merge pull request #19864 from
> containers/renovate/golang.org-x-tools-0.x
> a5798e9f5 fix(deps): update module github.com/cyphar/filepath-securejoin
> to v0.2.4
> 14735f172 Merge pull request #19862 from
> containers/renovate/golang.org-x-net-0.x
> dbfc3e7e0 Restrict fcos_test to amd64, arm64
> 7b2fc5f8d fix(deps): update github.com/containers/libhvee digest to
> 56fb235
> 2aec77f1f Merge pull request #19861 from edsantiago/manifest_test_cleanup
> 0a913d578 fix(deps): update module github.com/docker/docker to
> v24.0.6+incompatible
> f9fd40221 fix(deps): update module golang.org/x/tools to v0.13.0
> 52e1acf86 Merge pull request #19850 from
> containers/renovate/actions-checkout-4.x
> 71549c642 Ignore spurious container-removal errors
> e5bf0f96d fix(deps): update module golang.org/x/net to v0.15.0
> fdf694fcf systests: manifest zstd test: lots of tiny cleanups
> 0e3b492fa Merge pull request #19849 from giuseppe/increase-inotify-watche=
rs
> 8914caf47 Merge pull request #19843 from giuseppe/clamp-oom-score-adj
> 203c2b815 Merge pull request #19854 from giuseppe/bump-runc-to-main
> 9730c0373 vendor: update github.com/opencontainers/runc to main
> e825bd5d5 [skip-ci] Update actions/checkout action to v4
> 8b4a79a74 linux, rootless: clamp oom_score_adj if it is too low
> 681b6db3f machine: increase max number of inotify instances
> 9bcab496e Merge pull request #19835 from
> Juneezee/refactor/redundant-nil-check
> 8f7453f9c Merge pull request #19840 from
> containers/renovate/golang.org-x-term-0.x
> 302d15334 fix(deps): update module golang.org/x/term to v0.12.0
> d58fe4e68 Merge pull request #19837 from
> containers/renovate/golang.org-x-text-0.x
> d6b538a79 Merge pull request #19836 from
> containers/renovate/golang.org-x-sys-0.x
> 6f43c9f10 Merge pull request #19833 from
> containers/renovate/github.com-containers-libhvee-digest
> f094884c1 Remove redundant nil checks in system connection remove
> 17037af48 fix(deps): update module golang.org/x/text to v0.13.0
> 1361fa230 Merge pull request #19820 from ashley-cui/gvproxytest
> 1d51cd14a fix(deps): update module golang.org/x/sys to v0.12.0
> f542d21a7 fix(deps): update github.com/containers/libhvee digest to
> 2bf7930
> ab579a90a Merge pull request #19831 from noritada/fix/readme-broken-link
> 7cde6ab52 Merge pull request #19477 from lsm5/copr-rpm-fcos
> d4fedb288 docs(readme): fix a broken link
> 50cd072bf [CI:BUILD] Podman FCOS image from main
> 99a5347c6 Merge pull request #19816 from giuseppe/fix-parsing-base
> 3033f1e9e Merge pull request #19826 from
> containers/renovate/golang.org-x-exp-digest
> 58a0b7ac8 Update golang.org/x/exp digest to d852ddb
> 66fa48af4 Merge pull request #19804 from nishipy/ja_index
> fe7bafb83 Add port forwarding and gvproxy machine test
> c2f34ed86 Merge pull request #19818 from testwill/typo
> 702709a91 libpod: do not parse --hostuser in base 8
> 13342e503 fix: default typo
> 77fe460d1 Merge pull request #19805 from vrothberg/fix-19801
> 779bc4996 Merge pull request #19802 from
> edsantiago/e2e_exit_cleanly_matcher
> 3a6fc8d2b Add Japanese locale and translation of index
> 9320efe0b Merge pull request #19814 from lsm5/remove-rhcontainerbot-email
> 2194bd098 Merge pull request #19812 from baude/hypervciprep
> e5ab4fbc5 Merge pull request #19810 from edsantiago/bats_cleanup
> bb9256a39 Merge pull request #19808 from zeehio/minor-doc-fixes
> bd7579a62 Merge pull request #19806 from vrothberg/vendor-common
> 4051a8a23 Merge pull request #19790 from flouthoc/conf_add_compression
> 39c5b7fac remove rh.container.bot@gmail.com
> a62abfe3d Tweaks and cleanups to prepare hyperv for CI
> a0738e7e6 system tests: housekeeping: various small fixes
> 4082b67f6 CI: e2e: first use of new ExitCleanly() matcher
> 6cbd17c0f CI: e2e: new ginkgo matcher, ExitCleanly()
> da1246d58 CI: e2e: fetch the standard system-test image
> d20b5869f kube play: fix pull policy
> 18d35b612 Fix gidmap command in example
> e66c04c1f vendor containers/common@12405381ff45
> e73e585f5 Merge pull request #18713 from zeehio/feat-gidmap-improvements
> 8114923fd Merge pull request #19794 from baude/remoteusername
> 16f6d6a23 Merge pull request #19784 from Jared-Sprague/troubleshooting-fu=
se
> b95ae3b4a manifest,push: support add_compression from containers.conf
> 1085177fe hyperv ignition: use gvforwarder instead of vm
> 2a8e6acec Set remote username earlier for hyperv
> 26cefcbf9 Added an additional troubleshooting problem and solution
> 29f4572f9 Merge pull request #19783 from mtrmac/ManifestListData-no-deps
> 94969a063 Merge pull request #19768 from chnrxn/patch-1
> 666c1167b Merge pull request #19780 from cevich/remove_multiarch_cron
> a3c2d6ad2 Remove a dependency on libimage from pkg/bindings
> b4aed53ea Merge pull request #19782 from mtrmac/specgen-duplicate-inspect
> 28ad5a32f Merge pull request #19781 from mtrmac/api-handlers-types-no-imp=
l
> ed819d4cc Merge pull request #19785 from yylyyl/main
> f1c24df4f Rename parameter in pkg/bindings
> 259ab8594 Remove a dependency on libimage from pkg/api/handlers
> 4cac1d3bc Don't re-inspect an image
> 99834947d Cirrus: Remove multi-arch podman image builds
> 91b8bc7f1 uid/gid mapping flags
> 18c2a2be8 [DOC] Clarify default behaviour on uidmap
> f83ca0490 Merge pull request #19754 from baude/updatelibhvee
> 8bda49608 Merge pull request #19696 from Luap99/api-stream-format
> 341fb14e7 Merge pull request #19774 from
> containers/renovate/github.com-vbauerster-mpb-v8-8.x
> ef4ca8b2f Merge pull request #19762 from ygalblum/kube-support-list
> 4d2fe27b1 Merge pull request #19777 from baude/updatecommon
> 5c1760a2b Merge pull request #19775 from
> edsantiago/another_kube_play_logs_race
> 60e3b5ef1 Update containers/common to latest
> fe3c4562f update libhvee
> dd2ec7c61 Merge pull request #19640 from flouthoc/force-compression
> 1b45fd723 /_ping handler: return OSType http header
> 2dbb0b096 e2e: fix race condition (kube play + logs)
> 44986f5b1 Merge pull request #19760 from
> giuseppe/print-stderr-only-after-checking-state
> fe11db1e8 Update module github.com/vbauerster/mpb/v8 to v8.6.0
> 009ff3af6 Merge pull request #19769 from vrothberg/fix-19711
> 7ef97fa49 Kube - support List documents
> 346e5e52e kube down/play --replace: handle absent objects
> 0938ee189 push, manifest-push: --force-compression must be true with
> --compression-format
> 92c588068 Merge pull request #19666 from ashley-cui/testinit
> 6ed4df964 Merge pull request #19758 from wehagy/good-doc-is-an-updated-do=
c
> 4b347609d oci: print stderr only after checking state
> 461230c49 Updated docs to reflect pod spec sysctls support added in v4.6
> f521fd284 Merge pull request #19753 from martinpitt/revdeps-adjustments
> b8146a8a2 [CI:BUILD] Packit: Disable unexpected journal message check for
> cockpit-podman
> a6f2f5854 [CI:BUILD] Packit: Restrict cockpit tests to recent Fedoras
> b6b300c79 Update machine init/set tests
> da81bc13a Add rootful status to machine inspect
> 4ff21cf1a Merge pull request #19568 from umohnani8/infra-name
> c3ac109f1 Merge pull request #19734 from baude/acquireimage
> e916b4e37 Merge pull request #19714 from rhatdan/umask
> 584c1e70d Merge pull request #19704 from rhatdan/timeout
> c2bb278a1 Merge pull request #19741 from edsantiago/wait_for_file_content
> 15d2ef84c Merge pull request #19644 from vrothberg/server-notify
> be380461e Merge pull request #19705 from n1hility/shared-bind-mnts
> b3439584f Merge pull request #19736 from cevich/stop_hello_multiarch_buil=
d
> d3618719b Dedup and refactor image acquisition
> adf34cbd7 Share podman sock bindings with other WSL distros
> db95e678a Fix user-mode validation check
> d898ae7f9 system tests: try to fix sdnotify flakes
> ecf9f9fd8 Cirrus: Disable only hello multiarch build
> 0322b9df9 Merge pull request #19733 from edsantiago/registry_282
> 7661ebbc6 Merge pull request #19500 from
> martinpitt/tmt-revdeps-cockpit-podman
> f32e954b8 Set StopTimeout for service-container started under podman kube
> play
> d2ec127c1 Set StopTimeout for compat API if not set by client
> 6f284dbd4 podman exec should set umask to match container
> 2c5c2d213 [CI:BUILD] Packit: run cockpit-podman tests in PRs
> 32f7bb131 Merge pull request #19727 from vrothberg/fix-19715
> 52ed7fce2 Add infra-name annotations to kube gen/play
> 6009d16b5 Merge pull request #19732 from
> containers/renovate/k8s.io-kubernetes-1.x
> 6545529df Merge pull request #19725 from
> containers/renovate/github.com-onsi-ginkgo-v2-2.x
> a5f6a4a3b kube: notifyproxy: close once
> 7a94f8c12 system service: unset NOTIFY_SOCKET
> 638f994c2 Update module k8s.io/kubernetes to v1.28.1
> 7c9c96981 API attach: return vnd.docker.multiplexed-stream header
> 60e58f059 test/apiv2/60-auth.at: use `doesnotexists.podman.io`
> 61dd7f80c e2e tests: use registry:2.8.2 (was 2.8)
> 243f365aa create apiutils package
> c5b4eb943 api docs: document stream format
> 4d5bef98f Merge pull request #19730 from
> edsantiago/you_say_hello_and_i_say_goodbye
> 70f77efef Revert "Remove `hello` multi-arch image build"
> 82bd56be7 manifest-push: add support for --force-compression
> 469ace091 push: add support for --force-compression
> 202cc433a Update module github.com/onsi/ginkgo/v2 to v2.12.0
> 7c0e92682 Merge pull request #19719 from cevich/stop_building_hello
> c07f46e15 Merge pull request #19630 from rhatdan/kube
> 7e0130f75 Remove `hello` multi-arch image build
> f29986178 Merge pull request #19710 from vrothberg/df-benchmarks
> 1b0e64a10 hack/perf/system-df.sh: add `df` benchmarks
> 7f6bcbba8 Merge pull request #19709 from vrothberg/vendor-storage
> d22c33628 Merge pull request #19707 from sstosh/cgroupv1-limit-ignore
> 148d95d8d Expand env variables for cmds/entrypoint with format $(ENV)
> a9c98770e Merge pull request #19557 from n1hility/automatic-ports
> 2978addf7 Merge pull request #19703 from baude/stopgvproxyfixups
> e092f887f vendor c/storage@6902c2d
> c416e4576 Ignore the resource limits on cgroups V1 rootless systems
> 9e680cbc6 Fixups for stopping gvproxy
> 7bd60867d Merge pull request #19700 from cevich/remove_lock_test
> 21c9517b5 Revert "GHA: Closed issue/PR comment-lock test"
> 5e295a940 Merge pull request #19691 from cevich/lock_closed_issues
> 260adf567 Merge pull request #19695 from vrothberg/auto-update-docs
> f0e8e79c9 GHA: Closed issue/PR comment-lock test
> 5477fd38a GHA: Add workflow to lock closed issues/PRs
> 75ce47347 [CI:DOCS] update auto-update docs
> f38668e32 Merge pull request #19622 from jakecorrenti/umask-on-play
> 8354be9cf Merge pull request #19683 from lsm5/main-spdx-license
> 960b3960f Merge pull request #19689 from
> containers/renovate/github.com-google-uuid-1.x
> 1bb96a87c Merge pull request #19687 from dfr/freebsd-netstat
> 8295bbced Merge pull request #19690 from
> containers/renovate/major-ci-vm-image
> f727428b5 Merge pull request #19663 from rhatdan/ramfs
> 5a6515c6e Merge pull request #19684 from
> containers/renovate/golangci-golangci-lint-1.x
> 85d0df330 chore(deps): update dependency containers/automation_images to
> v20230816
> bc35e28c0 fix(deps): update module github.com/google/uuid to v1.3.1
> 3d00744d2 libpod: sum per-interface network stats for FreeBSD
> 5eee8825e Set default Umask for `podman kube play`
> 375eb045c Merge pull request #19661 from dfr/freebsd-var-run
> 30ec94fea Merge pull request #19670 from lsm5/rpm-dep-man
> ef8f4db81 [CI:BUILD] rpm: spdx compatible license field
> e9539768c chore(deps): update dependency golangci/golangci-lint to v1.54.=
2
> 63a8926e9 Implement automatic port reassignment on Windows
> 45ce4834a Add support for ramfs as well as tmpfs in volume mounts
> 93f194cfb Merge pull request #19676 from rhatdan/pod
> 84447c085 Merge pull request #19677 from n1hility/detect-old-wsl
> bdc304058 Validate current generation of WSL2 with user-mode-networking
> 67756ac60 use container restart policy if user specifies one
> 20f28e538 Merge pull request #19516 from baude/stopgvproxy
> 884e5f693 Merge pull request #19668 from ashley-cui/teststart
> a161e8b7d Merge pull request #19667 from ashley-cui/testrm
> 062511df9 Merge pull request #19669 from ashley-cui/testlist
> 0772d8ddb Stop gvproxy on hyperv machine stop
> 50136ea86 [CI:BUILD] rpm: depend on man-db
> 36e09f18b Update machine list test
> 8b2990131 Update machine start tests
> c3dbfa9a1 Update machine rm tests
> 938a3e160 Merge pull request #19635 from Luap99/utf8-log-tag
> c726cf810 libpod: improve conmon error handling
> ed1f514d5 cirrus setup: install en_US.UTF-8 locale
> 8f85aaf07 fixup "podman logs with non ASCII log tag" tests
> 27b41f087 libpod: use /var/run instead of /run on FreeBSD
> 9b4f1cdb9 cirrus/lib.sh: extend env to passthrough at start for locale wo=
rk
> ff66f31dd libpod: correctly pass env so alternative locales work
> e0b8178ad Merge pull request #19656 from
> jontte75/fix-resource-leak-in-linux
> 29c298856 cgroups_linux: use SessionBusPrivateNoAutoStartup
> 53b2b0222 Merge pull request #19648 from edsantiago/scrap_icmp_test
> 3c6d800b2 Merge pull request #19647 from rhatdan/podmansh
> e163e2688 Merge pull request #19618 from PeterWhittaker/main
> 4ae71e0d8 Merge pull request #19582 from arixmkii/gvproxy-0.7.0
> f559fc55b Merge pull request #19567 from vrothberg/RUN-1873
> 6062a64ea Merge pull request #19643 from dfr/freebsd-readonly
> c1c0b4a03 Merge pull request #19641 from christian-2/issue-18387
> 362747cfa podmansh man page UID=3D$(id -u lockedu) is not allowed
> e38cf33a6 CI: systests: remove pasta ICMP tests
> 7103fdb3f podman.1.md: Fix formatting of exit code 127, clarify wording
> of `exit code` example.
> 896cab612 document available secret drivers
> 53dd37cc4 pkg/specgen: add support for read-only root on FreeBSD
> d5841ed52 add --module flag
> 9cd428692 Merge pull request #19596 from baude/allowdownload
> 7836401c8 Merge pull request #19626 from michalbiesek/feat-riscv64-suppor=
t
> 464e97f65 Merge pull request #19638 from
> containers/renovate/setuptools-68.x
> 8326c81db Merge pull request #19627 from
> containers/renovate/github.com-containers-ocicrypt-1.x
> 6a3f09e8a Update dependency setuptools to ~=3D68.1.0
> c8b7c7730 Merge pull request #19624 from
> TomSweeneyRedHat/dev/tsweeney/fixbuildmd
> 0e37599e8 Merge pull request #19621 from edsantiago/manifest_quay
> 1d5890bcd Add riscv64 architecture to the cross build target
> 252f51de8 GetFcosArch add `riscv64` arch
> 98e7d7af0 Update WSL backend to be compat with FCOS defaults
> 9e14e3ebe enabled hyperv image downloads
> 3e2e360b9 fix(deps): update module github.com/containers/ocicrypt to
> v1.1.8
> abd35d4d3 [CI:DOCS] Fix git build example in build page
> 3e8f19be9 Merge pull request #19619 from cevich/remove_ec2_experimental
> 0c52d1004 CI: e2e manifest_test: use image from quay
> c742ec6fe Merge pull request #19617 from edsantiago/sphinx_ignore
> 824c76616 Merge pull request #19591 from matejvasek/fix-build-pull-compat
> 31dc42224 Cirrus: Remove EC2 experimental flag
> 1c37acceb Merge pull request #19613 from PeterWhittaker/main
> 4c7546cb3 sphinx: skip options include dir
> 6727644b1 Merge pull request #19595 from Luap99/top-output-flake
> 345b9b029 Update rootfs.md: Fix formatting and wording of idmap option
> f33b01b73 fix: Docker API compatible bool deserialization
> 4cb2d48ca Revert "compat,build: pull must accept string"
> 0b612a9a2 Merge pull request #19576 from edsantiago/logpartial_flake
> 2487ea439 Merge pull request #19587 from cevich/kill_bench_job
> de6bdd190 Merge pull request #19152 from
> geichelberger/add-host-gateway-support
> 615a9cf29 Merge pull request #19598 from
> containers/renovate/golangci-golangci-lint-1.x
> 84bd6c71f Merge pull request #19607 from wjt/performance-machinectl-shell
> 79d87f467 Merge pull request #19599 from ashley-cui/rel
> 68bd81470 Add missing verb in machinectl example
> 6ab38e55e Merge pull request #19589 from lsm5/main-packit
> 78d6cd4c9 [CI:DOCS] Update Release Notes and Release Process
> b6349017a chore(deps): update dependency golangci/golangci-lint to v1.54.=
1
> 4b80492bd fix podman top missing output flake
> 5908999e6 New partial-line test is flaking
> 555b4f930 [CI:BUILD] Packit: add back fedora-eln targets
> f0dac3677 Cirrus: Prune defunct job + fix noop alias
> a60bafea4 Merge pull request #19573 from edsantiago/env-tests
> 14e290a30 Merge pull request #19358 from umohnani8/buildfarm-2
> 970976a7f Merge pull request #19503 from edsantiago/journalctl_unreliable
> 1947f035c Bump bundled gvproxy to 0.7.0
> df28df1ae systests: tests for --env and --env-file
> bcebcad1f Update system connection add & remove
> 310f971fc Add tests for podman farm
> dce3ef3c4 Add podman farm update command
> 44a704dfc Add podman farm remove command
> 59a8140f1 Add podman farm list command
> 6fcdf1a19 Add podman farm create command
> 1d5ef29f0 Add podman farm subcommand
> 23d5b5008 CI: e2e: add delay before podman logs or journalctl
> c01ec25e6 Merge pull request #19564 from
> containers/renovate/golangci-golangci-lint-1.x
> 1e6c73f59 Merge pull request #19562 from Luap99/logs-tail
> 2951316b2 Add completion for Farms
> b672ddc79 Vendor c/common changes
> 3963c5639 chore(deps): update dependency golangci/golangci-lint to v1.54.=
0
> 57fac93b3 Merge pull request #19560 from BlackHole1/fix
> a55c2636d file logger: fix podman logs --tail with partial lines
> 7adc58ffb Merge pull request #19547 from
> containers/renovate/dawidd6-action-send-mail-3.x
> eb465b40c Merge pull request #19549 from rhatdan/quadlet
> 7ce654fea fix(env): parsing --env incorrect in cli
> 6f92c59bc Merge pull request #19559 from
> containers/renovate/docker.io-library-golang-1.x
> 4c4bc0922 Update docker.io/library/golang Docker tag to v1.21
> d4f967c19 Merge pull request #19541 from
> containers/renovate/major-ci-vm-image
> 195f1be89 Merge pull request #19371 from danishprakash/daemonset-support
> f55c48ad3 podman stop --cidfile missing --ignore
> 331d618a8 Merge pull request #19543 from martinpitt/packit-temp-copr
> 7ef03517f Skip podman exec cannot be invoked on Debian
> 95ceacefb Re-enable checkpoint test on Debian SID
> c193dbd94 Require a non-generic reason for non-Fedora skip
> d79e3a23d CI FIXME removal/update.
> 5ec856652 Update dependency containers/automation_images to v20230807
> 1899d2121 Merge pull request #19544 from NitrogenUA/build-docs
> 7988dd82c [skip-ci] Update dawidd6/action-send-mail action to v3.8.0
> c13b403c0 Merge pull request #19534 from giuseppe/cp-close-tmp-file
> 406c48053 Merge pull request #19533 from hangscer8/fix_waitPidStop_timer
> 8a410784b [CI:DOCS] fixed couple typos in build docs
> cc31ac4b0 Merge pull request #19530 from mheon/fix_19529
> 2f50d8e57 Merge pull request #19425 from rhatdan/service
> 282594e58 Stop timer in function waitPidStop
> 7c0bccaf7 packit: Build PRs into default packit COPRs
> 2e97c6616 Merge pull request #19537 from ygalblum/quadlet-network-doc
> afaeedef7 Add support for host-gateway
> 2de22ebf0 Ensure volumes-from mounts override image volumes
> f6c2be918 Merge pull request #19539 from cevich/minor_gha_updates
> 03d7a5120 Minor: Include shasums in GHA workflow artifacts
> d63ac0652 Minor: Add important comment to windows GHA workflow
> 9d7fe4e90 Minor: Update/fix dry-run input descriptions
> 518daef72 [CI:DOCS] Quadlet - provide more information about network file=
s
> b3a2ce3dc Merge pull request #19535 from edsantiago/manpage_dups
> d56b61ef4 Merge pull request #19532 from dfr/freebsd-build
> 819129b0d man-page xref: check for duplicate entries
> 39641482c cp: close temporary file on error path
> c04ead152 Merge pull request #19522 from
> containers/renovate/golang.org-x-net-0.x
> c3cab7206 Merge pull request #19526 from HirazawaUi/fix-not-remove-tempfi=
le
> 018fdb48e Makefile: work around the lack of 'man -l' on FreeBSD
> e9a3b7cfa Merge pull request #19531 from dfr/freebsd-kube
> 0b7769fda Update module golang.org/x/net to v0.14.0
> ec5a9b9cc libpod: fix a crash in 'kube generate' on FreeBSD
> 23c5890f2 remove temporary files when copy [NO NEW TESTS NEEDED]
> eceae9da5 Merge pull request #19478 from dcermak/show-socket-exists
> 38b20bda2 Merge pull request #19510 from baude/errorifkeyexists
> 0ad376d92 Merge pull request #19514 from
> containers/renovate/golang.org-x-sys-0.x
> 78351cab8 Merge pull request #19509 from lsm5/main-version
> 9e18e9faf Merge pull request #19414 from rhatdan/systemd
> fab62f816 Update module golang.org/x/sys to v0.11.0
> 1304162b1 Merge pull request #19512 from baude/userkeyswitch
> 1384c30a9 Merge pull request #19501 from
> jakecorrenti/fix-machine-consolidation-nits
> b46d72fec [ci] Remove the podman socket in remove_packaged_podman_files()
> 706c51b52 [ci] Correct the podman systemd file names
> dd4f47dd9 Always show RemoteSocket.Exists in json
> fc7c6efd3 Fail if ssh key exists
> 69e883493 Fix regression for hyperv
> 803a49da4 [CI:BUILD] Makefile: rpm target generates correct version
> 1a63c1b23 Fix nits in #19480
> 1e5453943 Add support for passing container stop timeout as -1 (infinite)
> 0fb5b3acf Merge pull request #19483 from dfr/freebsd-devices
> 144098587 Merge pull request #19505 from
> eriksjolund/fix_issue_19462_remove_duplicate_lastup_from_man_page
> d50054f1e pkg/specgen: Add device support for FreeBSD
> f5058f148 [CI:DOCS] man: remove duplicate entry .LastUp
> 84dec2234 Merge pull request #19494 from rhatdan/codespell
> 92090d6ac Merge pull request #19310 from cgiradkar/fix_dash_t_flag
> 0fb6708e5 Merge pull request #19495 from edsantiago/remove_useless_test
> a8974d4a3 CI: e2e: remove useless test
> 53d44a65e Check tty flag to set default terminal in Env
> bde942e21 Merge pull request #19468 from flouthoc/manifest-add-compressio=
n
> 62a22c5d6 Run codespell on code
> 44f159ed3 Deprecate podman generate systemd
> 7a2c5422e Merge pull request #19418 from cevich/dry_run_actions
> b427fe76b Merge pull request #19489 from ashley-cui/relnotes
> b8c9ad898 Merge pull request #19482 from rhatdan/rmi
> 346f9cb4e manifest/push: add support for --add-compression
> ebf368dd6 Merge pull request #19484 from domdomegg/patch-2
> 3b7ad61f6 Merge pull request #19488 from edsantiago/journald_race
> da8e29b04 Merge pull request #18612 from
> containers/renovate/major-ci-vm-image
> 8ccda1ee8 [CI:DOCS]Update Release Notes
> b91599742 CI: sys: quadlet %T test: do not rely on journal
> 4d69f0146 GHA: Support testing build/sign workflows
> 15f35d354 Remove unnecessary backslashes
> 18e75daa5 [docs] Use code blocks for commands in podman-completion
> f3ebd798c Make podman run --rmi automatically set --rm
> cd5ce6372 Merge pull request #19406 from rhatdan/volumes
> e58136027 Merge pull request #19469 from vrothberg/fix-16054
> 2252ed124 Merge pull request #19436 from rhatdan/remote
> 8b7701f52 machine: QEMU: recover from failed start
> 1656b93b8 Merge pull request #19480 from
> jakecorrenti/machine-duplicate-code
> 74b7cdff4 Merge pull request #19479 from
> containers/renovate/golang.org-x-net-0.x
> 73df21bd9 Merge pull request #18982 from danishprakash/secret-rm-ignore
> 49b8b971a vendor: bump c/image to v5.26.1-0.20230801083106-fcf7f0e1712a
> 6d6dfbd48 Merge pull request #19472 from flouthoc/bump-common-image
> 8844b98f7 Merge pull request #19475 from
> edsantiago/remove_registryfile_workaround
> bfd2a8cad secret: add support for `--ignore` with rm
> 21ebe0e90 Move `writeConfig` logic to shared function
> 597ccff0b Move some logic of `setRootful` to a common file
> 98cf8462a move `removeFilesAndConnections` to a common file
> 75a8f13c4 Move `waitAPIAndPrintInfo` to common file
> 55c7b5cec Move `addSSHConnectionsToPodmanSocket` code to shared file
> 0489d3aa6 Update module golang.org/x/net to v0.13.0
> d74c225f4 chore(deps): update dependency containers/automation_images to
> v20230726
> 27d79e1fc Skip pasta local forwarder test on debian SID
> b69cd8d84 Skip broken/flaky blkio-weight test
> 822f2f495 Skip tarball re-inport test in rawhide for CI
> 851cd9cca Cleanup CIDFile on podman-remote run --rm command
> a237c3f46 CI: e2e: remove workaround for missing login file
> ee9fb3680 Merge branch 'main' of github.com:containers/podman into volume=
s
> 42ad0c6e7 vendor: bump c/image and c/common
> 5b7dce8a3 Add support for confined users
> 78b850c48 Cirrus: Temp. disable rawhide validation task
> def70012b Limit git-validation to 'short-subject'
> 33b8c451e Fix up man page and add test on globs
> 608f484e9 Merge pull request #19417 from lsm5/main-packit
> 850482b31 Move alternate image acquisition to separate function
> 906af5bbc Move `getDevNullFiles` into a common file
> 7d5f9de7a Merge pull request #19423 from rhatdan/man
> 57aa4850f Merge pull request #19434 from rhatdan/userns
> 843f663c8 Merge pull request #19460 from
> containers/renovate/github.com-digitalocean-go-qemu-digest
> a9948dafc Merge pull request #19455 from
> jakecorrenti/qemu-machine-funcs-to-methods
> 0ecda592c Merge pull request #19350 from
> jakecorrenti/breakup-applehv-machine-funcs
> 89f1fdc7f Update github.com/digitalocean/go-qemu digest to 2e3d018
> dcb7f5e13 Merge pull request #19450 from cevich/use_stable_go
> d6847b19c Convert QEMU functions to methods with documentation
> 0d21f8986 Merge pull request #19419 from
> Romain-Geissler-1A/remove-EOF-error-empty-context-with-podman-remote
> ad9015f47 Merge pull request #19096 from BlackHole1/support-new-line
> 3ddde2023 Merge pull request #19413 from vrothberg/fix-19368
> 30ad23e55 Merge pull request #19444 from Luap99/net-none-netns-path
> 6930f39a6 Update docs/source/markdown/podman-build.1.md.in
> a52cefe6b Merge pull request #19431 from rhatdan/man1
> e1114f03c do not redefine gobuild for eln
> 6b404759f Merge pull request #19422 from rhatdan/read-only
> 39341f283 Set default userns from containers.conf file
> 94743d4e7 Merge pull request #19451 from rhatdan/quadlet
> 9e91873c2 Merge pull request #19435 from rhatdan/codespell
> 4f1f88d7c Mention TimeoutStartSec in quadlet man page
> d351d47d4 Merge pull request #19449 from
> edsantiago/reenable_container_checkpoint_tests
> ada71889c inspect with network=3Dnone show SandboxKey netns path
> 93f4cc1b5 [CI:DOCS] GHA: Use stable go for Mac/Win builds
> ff7d287fc Breakup AppleHV machine funcs
> 330e51960 Merge pull request #19364 from
> jakecorrenti/breakup-hyperv-machine-funcs
> 320fc6ca3 Merge pull request #19401 from
> jakecorrenti/fix-hyperv-load-from-json-name
> 64873e322 Codespell fixups
> acbe7703f Update docs/source/markdown/podman-stats.1.md.in
> 0b7157e3b CI: e2e: reenable containerized checkpoint tests
> c67ef7c1a docs(env-file): improve document description
> 4ee31dc37 Don't log EOF error when using podman --remote build with an
> empty context directory.
> f2794f9a8 API: kill: return 409 on invalid state
> 170a78631 feat(env): support multiline in env-file
> 19deb6a34 Adds documentation to new functions that were added
> 481143e58 `startHostNetworking`: get DevNull files
> 13da82466 `Remove`: remove network and ready sockets from registry
> d896431b2 `Remove`: remove files and connections
> 32265e1f6 `Remove`: collect files to destroy
> 381b103dd `Init`: read and split ign file
> aa6827a67 `Init`: write ign config
> cc30639d7 `Init`: add network and registry socks to registry
> 78d3b549c `Init`: add SSH conns to podman sock
> 630e7ba39 Improve the description of fields in podman-stats man page
> 22a8b6886 make /dev & /dev/shm read/only when --read-only
> --read-only-tmpfs=3Dfalse
> 663fe9446 Mention no comment lines in Containerfile.in podman-build man
> page
> e973d15c3 [CI:BUILD] RPM: define gobuild macro for rhel/centos stream
> b6a52f1f8 Merge pull request #19333 from lsm5/conditionalize-gvproxy
> 7c1406f82 Merge pull request #19399 from ashley-cui/cimac
> 837bc2568 Fix HyperV loadMachineFromJSON function name
> 7496cbf0b Merge pull request #19411 from vrothberg/qemu-locking
> 4153e9756 Merge pull request #19302 from edsantiago/openqa
> 416a471ee machine: QEMU: lock VM on stop/rm/set
> 0afc1c6d8 Merge pull request #19412 from dfr/freebsd-pod-top
> bb57c1631 libpod: add 'pod top' support on FreeBSD
> aef42c87c Merge pull request #19400 from
> eriksjolund/add_github_issue_type_questions
> e99289934 Merge pull request #19367 from dfr/freebsd-kube
> bd0fe69ca Merge pull request #19385 from
> jakecorrenti/breakup-qemu-config-funcs
> 538ac5dc8 Merge pull request #19309 from rhatdan/volumes
> f592c33fb [CI:DOCS] Build and Sign Mac Pkginstaller
> 39ca4ac92 Merge pull request #19391 from rhatdan/authfile
> ef1fde310 Merge pull request #19392 from n1hility/fix-artifacts
> c10c2b67f Merge pull request #19396 from vrothberg/fix-18662
> f540bbffa Make sure users changes --authfile before checking
> 8757fe88a github: add issue type as link to podman github discussions
> 3523b9b05 Break QEMU `config.go` code into its own functions
> c341a0ffe machine: QEMU: lock VM on start
> afe8d5d84 libpod: fix 'podman kube generate' on FreeBSD
> 0fefcf8a4 Add glob support to podman run/create --mount
> cf1321f67 Merge pull request #19375 from rhatdan/mount
> f82f9baf9 Merge pull request #19378 from
> eriksjolund/socket_activation_increase_socat_timeout
> 60a30d31e Merge pull request #19388 from edsantiago/quadlet_specifier_rac=
e
> 66a829af5 Merge pull request #19387 from rhatdan/quadlet
> 8aeb951c7 Merge pull request #19372 from vrothberg/un-defer-start-event
> d6815da8c kube: add DaemonSet support
> 239a5b64a Fix artifacts script after removal of msitools msi build
> e335a66a9 System tests: quadlet: fix race in %T test
> d6a32a3da If quadlets have same name, only use first
> db0ba9b25 Add support for mounts listed in containers.conf
> 6dda21984 Update vendor of containers/common
> b2a857a02 Merge pull request #19351 from edsantiago/gomd2man-local
> 33891e8e9 System tests: add test tags
> 5ba055937 [CI:DOCS] socket_activation.md: increase socat timeout
> dfec510b4 go-md2man: use vendored-in version, not system
> aa372ce22 Merge pull request #19281 from edsantiago/alternate_tmpdir
> eac1e947e Merge pull request #19374 from edsantiago/bogus_authfile_cleanu=
p
> 63a0d013a Merge pull request #19254 from boaz0/closes_19252
> a92bb3219 CI: use different TMPDIR on prior-fedora
> 6894e2031 system tests: authfile-exists: minor cleanup
> 85ab62042 Merge pull request #19348 from rhatdan/authfile
> d70f15cc0 start(): don't defer event
> 970614708 Merge pull request #19353 from vrothberg/fix-6160
> de122bb44 Fix: use --all in podman stats to get all containers stats
> 1f455cf61 Merge pull request #19320 from
> eriksjolund/remove_unnecessary_please
> 349d775de Verify authfile exists if user specifies it
> 2a29fcb70 Merge pull request #19355 from dfr/freebsd-hc
> e0ef23955 libpod: don't generate errors for createTimer etc.
> 42e44795b Merge pull request #19339 from dfr/validate-device
> 0cfd12786 add "healthy" sdnotify policy
> 890aa4bbc Merge pull request #19343 from afbjorklund/distro-name
> 2a25d1d74 Merge pull request #19349 from n1hility/remove-old-msi
> 22cb23b41 Merge pull request #19297 from vrothberg/RUN-1865
> 0fac5123d Merge pull request #19316 from dcermak/spec-fixes
> cbc96a7b4 Remove LICENSE and general doc files that are installed by the
> main package
> 37f0e9620 Add missing `
> 2f21df7b3 Remove legacy msitools based msi installer
> 3e6b99b4e Merge pull request #19341 from
> containers/renovate/github.com-docker-docker-24.x
> 2a559dc1a Merge pull request #19230 from rhatdan/quadlet
> ac212605c Remove any quotes around distribution id
> 5f90fbcdc Merge pull request #19312 from sg2342/freebsd-remote-top
> e596b17fb add a podman-compose command
> eee2817de pkg/specgen: Don't crash for device spec with...
> d2796c6c1 fix(deps): update module github.com/docker/docker to
> v24.0.5+incompatible
> b9383f41a Merge pull request #19265 from rhatdan/tmpfs
> 03ea93c21 Merge pull request #19323 from
> eriksjolund/fix_language_typos_markdown_layout
> f4fbd6fd0 Update vendor of containers/(storage,image)
> d4fc66af9 Clean up /var/tmp/ when using oci-archives when creating
> containers
> ff97a208f Merge pull request #19314 from
> eriksjolund/use_quadlet_in_socket_activation_guide
> 17496592e Merge pull request #19311 from
> jakecorrenti/breakup-qemu-machine-funcs
> adcc0ddad Merge pull request #19331 from umohnani8/play-docs
> 0cc81193f Merge pull request #19315 from
> containers/renovate/github.com-onsi-gomega-1.x
> 49257a3c5 [CI:BUILD] RPM: separate out gvproxy for copr and rawhide
> b57091ac9 Reduce qemu machine function sizes
> baf30e612 [CI:DOCS] migrate socket_activation.md to quadlet
> 7314569cb [CI:DOCS] Update kube play volume support
> 1da9cbe6a Merge pull request #19308 from
> ygalblum/quadlet-systest-quick-journal
> 730fa0aff Merge pull request #19328 from ygalblum/additional-debugging-no=
te
> b5ce0ab2d Fix language, typos and markdown layout
> cb5450af7 [CI:DOCS] Add note about QUADLET_UNIT_DIRS to simplify quadlet
> debug
> 5dd8906e7 Merge pull request #19288 from IceWreck/quadlet-debugging-docs
> 0bb73bf55 Add note on debugging quadlet unit files
> d4cfc498d Remove unnecessary use of the word "please".
> a6a207673 libpod: fix FreeBSD 'podman-remote top' default behaviour
> 709beb6c0 fix(deps): update module github.com/onsi/gomega to v1.27.9
> 67f034068 Merge pull request #18830 from harikannan512/new-18032-2
> 9b7de8d41 Merge pull request #19231 from ariasmn/trust-local-policy
> 58dd5cbd1 Merge pull request #19262 from domdomegg/patch-1
> 3e534eff9 Add support for ShmSize to quadlet
> 87f5a15d6 Merge pull request #19306 from
> containers/renovate/github.com-containers-libhvee-0.x
> 4b9f670ca Quadlet system test - force journald log driver for short lived
> containers
> 731bd7d94 fix(deps): update module github.com/containers/libhvee to v0.4.=
0
> 413552e10 quadlet recursively scan for unit files
> 6156923d8 Merge pull request #19298 from mheon/tcp_is_insecure
> ce736413b Ensure that we appropriately warn that TCP is insecure
> 4315611ad Merge pull request #19278 from edsantiago/manpage_table_check
> 6ece09fea Merge pull request #19276 from edsantiago/quadlet_no_journal
> 7974eb181 Merge pull request #19275 from
> jakecorrenti/since-volume-filter-support
> 92d0233f5 Merge pull request #19249 from afbjorklund/decompress-progress
> 558a70262 systests: quadlet: fixes for RHEL8
> a977c8281 Merge pull request #19284 from
> ygalblum/quadlet-kube-replace-journalctl
> 99623184e Merge pull request #19261 from
> cgiradkar/podman_inspect_completion
> d98978ae1 Merge pull request #19256 from ygalblum/quadlet-working-dir
> 8d190704a Quadlet - Allow setting Service WorkingDirectory for Kube units
> 24bf6fc24 Quadlet system test - do not rely on journalctl in kube file
> tests
> e5faed79c Merge pull request #19279 from iczero/fix-doc-markdown
> cf18a1fea Merge pull request #19267 from edsantiago/quadlet_tmpdir
> 3d6bc2f86 Fix markdown in docs for podman-network-create
> 11ffea313 Man pages: check for corrupt tables
> 1d14bb7a8 quadlet systest: fix broken tmpdir references
> e55e128fc Add `since` as valid filter option for `volume` subcommands
> 7791ffd21 Merge pull request #19140 from lsm5/podmansh-followup
> f8eaec6f8 Merge pull request #19269 from
> jakecorrenti/volume-ls-mult-filters
> 6df17332b Podmansh: Better error, increase timeout to 30s
> 96241159a Fix multiple filter options logic for `podman volume ls `
> 00a5b0709 Add bash-completion for podman inspect
> 34a2a48e9 Merge pull request #19208 from jakecorrenti/add-reserved-flag
> b88f9b367 Merge pull request #19270 from n1hility/fix-win-installerr
> 3b6343202 Fix windows installer
> d7e25e14a Add missing reserved annotation support to `play`
> d2862c7dd Avoid progress hang with empty files
> 5c0912b07 Revert the usage of `home.GetConfigHome()`
> 5aa52659b Fix bug report issue template README link
> 47997857f Replace error check for non-existent file
> c6f8de8a4 Merge pull request #19253 from
> containers/renovate/github.com-vbauerster-mpb-v8-8.x
> 2d2dfc8d5 Merge pull request #19259 from edsantiago/xdg
> 8febb6aa1 Emergency gating-test fixes for RHEL8
> 7739e900e Merge pull request #19243 from lsm5/packit-remove-pre-sync
> d8d600b1d Add progress bar for decompress image
> 46058cfed refactor: move progressbar to a function
> ca9874ab7 Use pkg/homedir to get the home config directory
> 52af8a229 Merge pull request #19250 from rhatdan/tmpfs
> 7fb17ae78 fix(deps): update module github.com/vbauerster/mpb/v8 to v8.5.2
> 49a924cf3 Merge pull request #19211 from
> jakecorrenti/add-reserved-flag-generate
> a224ff731 Should be checking tmpfs versus type not source
> 0745fe892 Merge pull request #19187 from rhatdan/VENDOR
> 647c6543c Merge pull request #19244 from baude/applehvarm64
> b5fd9a9c0 Merge pull request #19246 from
> containers/renovate/github.com-vbauerster-mpb-v8-8.x
> 9e60f3ec5 fix(deps): update module github.com/vbauerster/mpb/v8 to v8.5.1
> b4ffbcdfd Enabled arm64 arch for podman applehv provider
> 4e4078dbb [CI:BUILD] Packit: remove pre-sync action
> d1ddd03a6 Merge pull request #19241 from rhatdan/bind
> d0602e8f7 Add `--podman-only` flag to `podman generate kube`
> c9c46fdf2 Merge pull request #19234 from edsantiago/cleanup_skips
> 13a950016 Update vendor containers/(common, buildah, image, storage)
> bb72016f5 Merge pull request #19066 from Luap99/ps
> f256f4f95 Use constants for mount types
> 960a764c5 Merge pull request #19173 from
> hedayat/support-port-name-in-probes
> c46fd411e Merge pull request #19098 from imphil/userns-docs
> a56370db4 Merge pull request #19238 from dfr/freebsd-copy
> 310a8f103 libpod: use define.TypeBind when resolving container paths
> 265718596 Merge pull request #19225 from Luap99/network-doc
> 1e9410094 Tests: remove/update obsolete skips
> a3bbc3a2c Fix trust not using local policy file
> 72ec8824a Merge pull request #19227 from
> jakecorrenti/container-prune-docs-error
> a6bdccdb8 Merge pull request #19217 from baude/applehvpass3
> 0997cf012 Fix `podman container prune` docs for `--filter`
> a8d8c9497 Add more tests for liveness probes with default hostname & name=
d
> ports
> 285665f6f Merge pull request #19214 from lsm5/package-rpm-rename
> 383d683f8 docs: podman-build --network add slirp and pasta
> 5e64cbf35 docs: podman run --network mention comma separted names
> 1443e2918 Podman machine AppleHV pass number 3
> eb2bf7a07 Merge pull request #19183 from eriksjolund/add_missing_return
> 0285bc122 Merge pull request #19222 from Luap99/macvlan-internal
> 561062dfc Merge pull request #19210 from vrothberg/fix-17403
> 04d808f93 Merge pull request #19216 from lsm5/packit-golist
> 315a7887a Makefile: `package` -> `rpm`
> 7a93a28e3 Merge pull request #19221 from dfr/freebsd-rootfs
> 85d936133 network create: document --internal better
> e43127e0b pkg/specgen: fix support for --rootfs on FreeBSD
> 69f112a8b Merge pull request #19200 from rhatdan/secret1
> 8c16322a8 machine start: qemu: wait for SSH readiness
> 20879aba0 Merge pull request #19188 from mheon/fix_19159
> 12dc546fc [CI:BUILD] Packit: downstream task action fix
> 2b2c4453f Fix container errors not being sent via pod removal API
> 6ec261e7a Add missing return after utils.InternalServerError()
> cd58306a8 Merge pull request #19207 from Luap99/mv-dns
> dcf0a3cfc Merge pull request #19203 from sstosh/remote-play-kube-userns
> d1950869a Update cmd/podman/login.go
> cce8501a5 [CI:DOCS] Reformat and reorder table with --userns options
> 9d9f4aaaf Merge pull request #19006 from
> deuill/quadlet-volume-network-names
> d497eb369 Add secret support to podman login
> 2a9b9bb53 netavark: macvlan networks keep custom nameservers
> 958191aed Merge pull request #19199 from
> containers/renovate/github.com-container-orchestrated-devices-container-d=
evice-interface-0.x
> 99ca4435f Merge pull request #19197 from containers/renovate/
> go-github.com/gin-gonic/gin-vulnerability
> 6fc7c4842 <http://go-github.com/gin-gonic/gin-vulnerability6fc7c4842>
> Merge pull request #19190 from
> containers/renovate/github.com-containers-libhvee-0.x
> c5006f478 Merge pull request #19204 from Luap99/vendor-tidy
> c6b5b9a02 remote: fix podman-remote play kube --userns
> 441af003a fix(deps): update container-device-interface to v0.6.0
> d3ac265fc Merge pull request #19196 from vrothberg/bz-2180483
> 656ad760f go mod: no longer use 1.18
> aeef403cd fix(deps): update module github.com/containers/libhvee to v0.3.=
0
> 6fd4ae6d2 chore(deps): update module github.com/gin-gonic/gin to v1.9.1
> [security]
> 544407358 Merge pull request #19186 from rhatdan/codespell
> 0dcfe6e06 Run codespell on code
> 1be2ec1d4 Merge pull request #19193 from Luap99/hostname-alias
> b994f8610 Merge pull request #19131 from baude/applehvpass2
> 3ad55f48b system service: unset listen fds on tcp
> b1dd0a335 Merge pull request #19189 from pjannesen/issue/19175
> f1c68b79e add hostname to network alias
> b6ec2127b libpod: set cid network alias in setupContainer()
> bd85be42f Merge pull request #19100 from edsantiago/pasta_better_cleanup
> 4e96686e9 AppleHV enablement pass #2
> e6dbb422e Merge pull request #19191 from sstosh/e2e-fix-username
> 72a1857e4 e2e: Fetch the correct user name
> 77b36ca35 Merge pull request #19102 from
> jakecorrenti/kube-generate-print-annotations
> 7b54fd84e Add `--no-trunc` flag to maintain original annotation length
> 600de05e3 Fix TCP probes when the optional host field is not given
> ac3a115c3 Add support for using port names in Kubernetes health probes
> 4494cefbc Fix: cgroup is not set: internal libpod error after os reboot
> 932fae402 Allow setting volume and network names in Quadlet
> 427b959a1 pasta tests: automatically determine test parameters
> d31b9eb9e Merge pull request #19170 from dfr/freebsd-mtab
> eb9d44241 Merge pull request #19004 from rhatdan/secret
> 7b08e024c Merge pull request #19180 from vrothberg/fix-19147
> 8c071ca65 Merge pull request #19179 from Luap99/syslog
> 79d3453f3 Merge pull request #19182 from Luap99/slow-remote-version
> 97fd03ccd test/e2e: wait for socket
> a69194b02 manifest inspect: support authentication
> 70428baef api: fix slow version endpoint
> f8213a6d5 libpod: don't make a broken symlink for /etc/mtab on FreeBSD
> 499b8d13c CI: remove build without cgo task
> 42ea0bf9c libpod: use io.Writer vs io.WriteCloser for attach streams
> 597ebeb60 top: do not depend on ps(1) in container
> 3f8ee70d0 make --syslog errors non fatal
> 7cd1fb77f Merge pull request #19172 from
> eriksjolund/fix_underscore_in_man_page
> b713fe399 Merge pull request #19174 from mhrivnak/fix-quadlet-docs
> dbec2b5aa api: fix doc for default ps_args
> 1b7eb44d3 Fixes typo in the path where quadlet looks for files
> efefd8cf5 Add --replace flag to podman secret create
> 5d706eb02 Merge pull request #19084 from
> eriksjolund/add_docs_to_system_service
> 478cd66cd Merge pull request #19134 from
> containers/renovate/golang.org-x-net-0.x
> 914752614 Merge pull request #19168 from
> containers/renovate/github-issue-labeler-3.x
> 05a420bc8 Merge pull request #19163 from
> containers/renovate/github.com-docker-docker-24.x
> eec438222 [CI:DOCS] uidmap man pages: fix corrupt italics
> 8d24e2838 [skip-ci] Update github/issue-labeler action to v3.2
> f9077689e [CI:DOCS] podman-system-service.1.md: document systemd usage
> dd16661b1 fix(deps): update module github.com/docker/docker to
> v24.0.4+incompatible
> 94dba6d89 Merge pull request #19150 from
> containers/renovate/github.com-docker-docker-24.x
> 46f9cf7e8 Merge pull request #19146 from afbjorklund/bytes-size
> 65136521e fix(deps): update module github.com/docker/docker to
> v24.0.3+incompatible
> 28abed6e2 Merge pull request #19145 from Luminger/fix-range-option-parsin=
g
> fa654e985 Use bytes size consistently instead of human size
> b721f96f5 Merge pull request #19074 from dfr/freebsd-build-test
> fce216460 Merge pull request #19137 from
> containers/renovate/golang.org-x-tools-0.x
> dee94ea69 bugfix: do not try to parse empty ranges
> 972e4ae76 Merge pull request #19117 from lsm5/packit-golist
> f1775a34a Merge pull request #19116 from vrothberg/qemu-backoffs
> 9e4045768 [CI:BUILD] Packit: fix pre-sync action for downstream tasks
> 531fb21d0 fix(deps): update module golang.org/x/tools to v0.11.0
> ab2fa45ad fix(deps): update module golang.org/x/net to v0.12.0
> 7c04d6ddd Merge pull request #19129 from
> containers/renovate/golang.org-x-term-0.x
> 904997999 Merge pull request #19127 from edsantiago/fix_toolbox_flake
> 459b1578c fix(deps): update module golang.org/x/term to v0.10.0
> 485de41a3 Merge pull request #19099 from cevich/minor_place_holders
> 99f93d55c e2e: fix two toolbox flakes
> 93447e292 Merge pull request #19092 from vrothberg/bz-2218315
> d25802a0d Merge pull request #19118 from Luap99/ginkgo
> 8d46e79e8 Merge pull request #19122 from
> containers/renovate/golang.org-x-text-0.x
> fc5aa9c9c test/e2e: use GinkgoT().TempDir() over MkdirTemp()
> ea8992cb4 test/e2e: use random ImageCacheDir
> 17a06d343 test/e2e: remove RHEL7 workaround
> bc22aefce test/e2e: remove unnecessary code in SynchronizedAfterSuite
> ff7790038 test/e2e: do not use /tmp for podman commands
> db7cb1dbf test/tools: vendor ginkgo v2.11
> c20612bab test/e2e: write timings directly to file
> f33a3bdc3 Merge pull request #19085 from dfr/emulate-linux
> a0b765552 machine start: qemu: adjust backoffs
> d874790bc auto update: fix usage of --authfile
> 10615e784 Merge pull request #19106 from edsantiago/refactor_registry
> ba1355b23 system tests: refactor registry code
> 94b321337 fix(deps): update module golang.org/x/text to v0.11.0
> 644f7cd9b pkg/specgen: properly identify image OS on FreeBSD
> 5c302db50 Merge pull request #19101 from haircommander/runc-bump
> a3a62275c libpod: use new libcontainer BlockIO constructors
> 2d68c3add [CI:BUILD] Minor: Don't confuse osx-debugging
> 5aabc5088 [CI:DOCS] Better document the default value of --userns
> e4644c3cb Cirrus: build FreeBSD binaries in a VM
> 92fc0f481 Makefile: add support for building freebsd release tarballs
> e0846ac38 Merge pull request #19088 from edsantiago/fix_corrupt_man_table=
s
> 4a5396b46 [CI:DOCS] uidmap man pages: fix corrupt tables
> 03d7ed468 Merge pull request #19080 from
> containers/renovate/github.com-crc-org-vfkit-digest
> 539be5816 Merge pull request #19079 from
> containers/renovate/github.com-containers-buildah-1.x
> 0004ae86e Merge pull request #19076 from
> containers/renovate/github.com-opencontainers-image-spec-1.x
> 5a8e092a2 fix(deps): update github.com/crc-org/vfkit digest to c9a4b08
> d0359fcca fix(deps): update module github.com/containers/buildah to
> v1.31.0
> 300eb36b4 fix(deps): update module github.com/opencontainers/image-spec
> to v1.1.0-rc4
> 82af41cf2 Merge pull request #19062 from
> Luminger/fix-use-gid-map-not-uid-map
> 92a22bb94 Merge pull request #19063 from BlackHole1/fix-search
> b05071082 Merge pull request #19060 from vrothberg/fix-17403
> 6652e29cc Merge pull request #19057 from dfr/freebsd-install
> b7a21aad7 Merge pull request #19055 from
> containers/renovate/github.com-containers-libhvee-0.x
> 94e59bd2f Use /proc/self/gid_map as intended, not uid_map
> a16488f89 fix(command): ignore `--format` in `podman search --list-tags`
> 5561390a0 Merge pull request #19053 from edsantiago/pasta_test_cleanup
> acaaf3de4 Merge pull request #19042 from dgibson/bug17922
> 9fb2f8e10 podman machine start: fix ready service
> 8408ad498 Makefile: don't rely on the non-standard -r flag for ln
> 39624473b pasta: Create /etc/hosts entries for pods using pasta networkin=
g
> fe0de8b9f fix(deps): update module github.com/containers/libhvee to v0.2.=
0
> fca3c2ef8 Merge pull request #19049 from dfr/freebsd-api-server
> 2393fe453 pasta tests: add sanity check for test name vs function
> 4da3e47b6 pasta tests: cleanup + 1 new test
> fad2fa3da Merge pull request #19047 from fwiesel/patch-1
> d09edd282 Merge pull request #19043 from dgibson/fix19021
> 43b9426fc cmd/podman, pkg/domain/infra: sockets should live in /var/run o=
n
> FreeBSD
> 92db6a871 Merge pull request #19032 from Luap99/def-rootless-network
> 4d270d246 Merge pull request #19039 from
> containers/renovate/github.com-coreos-stream-metadata-go-0.x
> e3f2a97d1 cmd/podman/system: add API server support on FreeBSD
> 8ff12e09f Merge pull request #19044 from dgibson/bug17287
> 0d7da5c0b [CI:DOCS] Document support of pod security context IDs
> f64a1a1cc rootless: use default_rootless_network_cmd config
> 62399c77b Merge pull request #19040 from
> TomSweeneyRedHat/dev/tsweeney/image_commonbump
> 45eaa4d41 Merge pull request #19035 from lsm5/rpm-fixes
> e4efd709d Revert^3 "pasta: Use two connections instead of three in TCP
> range forward tests"
> 17cd5aecb pasta: Workaround occasional socat failures in CI
> 13c7d05cc pasta: Remove some leftover code from pasta bats tests
> bc58dae36 Bump c/image to v5.26.0, c/common 0.54.0
> 2cb549339 fix(deps): update module github.com/coreos/stream-metadata-go
> to v0.4.3
> f0cb8dfe5 Merge pull request #19031 from dfr/freebsd-init
> 455c7c826 Merge pull request #19011 from rhatdan/secret1
> b2ce082df Merge pull request #19034 from
> edsantiago/enable_rootless_systemd_test
> bf60bb073 Display secret to user in inpspect
> 448e01566 [CI:BUILD] RPM: Fix koji and ELN issues
> 8fb719a9e e2e: systemd test: major fixes
> 2ac2ba9e4 Merge pull request #19030 from lsm5/main-bump
> 92b2a15a2 Merge pull request #19029 from rhatdan/inspect
> 865d77e94 pkg/specgen: add support for 'podman run --init' on FreeBSD
> 416b4eeac Merge pull request #18814 from danishprakash/kube-down-volrm
> 74b4615aa Bump version after v4.6 branch cut
> 9067d5c85 Merge pull request #19013 from dfr/emulate-linux
> b6e636cbe Remove 'inspecting object' from inspect errors
> be49741dc Merge pull request #19021 from dgibson/bug19007
> c8b9c2911 Merge pull request #19019 from BlackHole1/fix-windows-docs
> 6babf9492 Merge pull request #19015 from rhatdan/read-only
> f739f8f99 Merge pull request #18921 from
> fangpenlin/fix-18907-set-correct-cwd-for-poststop-hook-exe
> fe8355be7 pasta: Fix pasta tests to work on hosts with multiple interface=
s
> d15cca024 [CI:DOCS] fix command incorrect in windows
> bcb89fc8b Fix readonly=3Dfalse failure
> 4dc2e0861 Merge pull request #18977 from
> jakecorrenti/move-qemu-functions-to-proper-files
> 089dbed49 Merge pull request #18999 from Luap99/vendor
> c928da6d6 Merge pull request #18975 from rhatdan/man
> 1aacafbe1 Merge pull request #18984 from rhatdan/podmansh
> 609c47ae6 pkg/specgen: Add support for Linux emulation on FreeBSD
> cf9ebcddf Fix up podmansh man page
> 05eb3e6f1 Make Podman/Buildah use same DecryptConfig/EncryptConfig funcs
> f5cc0487e Fixes for vendoring Buildah
> 0f4c86e26 vendor in latest buildah
> 6eaf8a271 tests: fix "Storing signatures" check
> b80fd54a5 update c/image and c/storage to latest
> eeb7aeb49 Kube quadlets can support autoupdate as well as containers
> 4445a5040 Merge pull request #19008 from Luap99/800lines-flake
> 2160a114c debug tail 800 lines flake
> dd81f7ac6 Pass in correct cwd value for hooks exe
> 3794d067e Merge pull request #18997 from
> containers/renovate/google.golang.org-protobuf-1.x
> c2d46acde Merge pull request #18980 from vrothberg/bz-2216700
> 68f71f49d Merge pull request #19002 from giuseppe/skip-devices-userns
> 6a742cb2f Merge pull request #18981 from rhatdan/quadlet
> 227c07aeb specgen: honor --device-cgroup-rule with a new user namespace
> 0220f3338 specgen, rootless: raise error with --device-cgroup-rule
> db37d66cd make image listing more resilient
> 17a18b16c Update module google.golang.org/protobuf to v1.31.0
> bc5269f18 Trim whitespace from unit files while parsing
> 516034215 Re-organize hypervisor implementations
> ba3da15e0 play.go: remove volumes on down -f
> ```
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-containers/podman/podman_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> index 7634ac85..fce8f0b8 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -17,9 +17,9 @@ DEPENDS =3D " \
>      gettext-native \
>  "
>
> -SRCREV =3D "85b5f572348eeb60613bd0b24780269a760125f5"
> +SRCREV =3D "aa546902fa1a927b3d770528565627d1395b19f3"
>  SRC_URI =3D " \
> -    git://github.com/containers/libpod.git;branch=3Dv4.7;protocol=3Dhttp=
s \
> +    git://github.com/containers/libpod.git;branch=3Dv4.8;protocol=3Dhttp=
s \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless',
> 'file://50-podman-rootless.conf', '', d)} \
>      file://run-ptest \
>  "
> @@ -31,7 +31,7 @@ GO_IMPORT =3D "import"
>
>  S =3D "${WORKDIR}/git"
>
> -PV =3D "4.7.1+git"
> +PV =3D "4.8.2+git"
>
>  CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
> --
> 2.34.1
>
>

--000000000000a760c2060cd9e7bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Bruce, just noticed you had done this in master-next, =
please ignore this commit.<div><br></div><div>the best,</div><div>thank you=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">&lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&=
gt; =E6=96=BC 2023=E5=B9=B412=E6=9C=8819=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=
=8A=E5=8D=8810:29=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:liu.ming5=
0@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
<br>
Bumping libpod to version v4.8.2, which comprises the following commits:<br=
>
<br>
```<br>
aa546902f v4.8.2<br>
a9b20a4a2 [CI:DOCS] Update RELEASE_NOTES.md for v4.8.2<br>
775054343 Kube Play - set ReportWriter when building an image<br>
da52ed937 Merge pull request #20941 from openshift-cherrypick-robot/cherry-=
pick-20929-to-v4.8<br>
1864ea94f Fix user-mode net init flag on first time install<br>
e5244656b Merge pull request #20935 from Luap99/v4.8<br>
3c0d66d83 bump c/common to v0.57.1<br>
fc78e1062 Merge pull request #20907 from lsm5/v4.8.1-bump<br>
b0e2ffc51 bump version to v4.8.2-dev<br>
ef6e5ac40 v4.8.1<br>
0b72d1bf2 Update RELEASE_NOTES.md for v4.8.1<br>
3f3e19f9f Merge pull request #20825 from openshift-cherrypick-robot/cherry-=
pick-20798-to-v4.8<br>
85c2543a8 Merge pull request #20873 from openshift-cherrypick-robot/cherry-=
pick-20869-to-v4.8<br>
435258c45 Merge pull request #20888 from openshift-cherrypick-robot/cherry-=
pick-20874-to-v4.8<br>
2d20d2e5c Handle symlinks when checking DB vs runtime configs<br>
6bbbfaa05 libpod: Detect whether we have a private UTS namespace on FreeBSD=
<br>
4635f40c6 Merge pull request #20865 from openshift-cherrypick-robot/cherry-=
pick-20831-to-v4.8<br>
a8b8dc570 pkg/bindings: add new APIVersionError error type<br>
86bb91001 fix podman-remote exec regression with v4.8<br>
1c434e333 Merge pull request #20850 from Luap99/v4.8-backports<br>
0c606ef0d Merge pull request #20849 from openshift-cherrypick-robot/cherry-=
pick-20841-to-v4.8<br>
9c9d2fcaf sqlite: fix issue in ValidateDBConfig()<br>
1e5a1336f sqlite: fix missing Commit() in RemovePodContainers()<br>
429080f02 sqlite: set busy timeout to 100s<br>
a72c39a53 Fix locking error in WSL machine rm -f<br>
78fdb40cb Merge pull request #20846 from edsantiago/gating_fixes<br>
a7c522dfe Gating test fixes<br>
0f8157916 Merge pull request #20832 from openshift-cherrypick-robot/cherry-=
pick-20744-to-v4.8<br>
a62b81d90 If API calls for kube play --replace, then replace pod<br>
70ba64f4c Fix wsl.conf generation when user-mode-networking is disabled<br>
e3bd1e0c3 Merge pull request #20793 from ashley-cui/480final<br>
e627de1b4 Bump to v4.8.1-dev<br>
c4dfcf148 Bump to v4.8.0<br>
0efc6ea30 Update release notes for 4.8.0<br>
01ecd17ef Merge pull request #20791 from mheon/deprecations_upcoming<br>
4b95c6c30 Add notes on upcoming deprecations to release notes<br>
19ab23330 Merge pull request #20782 from TomSweeneyRedHat/dev/tsweeney/1.33=
.2<br>
1c1477ddf [v4.8] Bump to Buildah v1.33.2<br>
efc88e56a Merge pull request #20751 from ashley-cui/48relno<br>
f02155142 [CI:DOCS] Update release notes<br>
99039f8ec Merge pull request #20741 from openshift-cherrypick-robot/cherry-=
pick-20739-to-v4.8<br>
697e66c78 machine applehv: create better error on start failure<br>
698458d9a Merge pull request #20724 from ashley-cui/48rc1<br>
53f176732 Bump to v4.8.0-dev<br>
ac1d54e68 Bump to v4.8.0-rc1<br>
66cba2794 Create release notes for v4.8.0<br>
ac290f446 Update release notes from v4.7 branch<br>
883ce7704 Cirrus: Update operating branch<br>
2d4c57857 Merge pull request #20722 from edsantiago/rootless_tutorial<br>
9ea390191 rootless_tutorial: modernize<br>
7dfbc7276 Merge pull request #20715 from TomSweeneyRedHat/dev/tsweeney/buil=
dah1.33.1<br>
ee1654622 Bump Buildah to v1.33.1<br>
149d4f079 Merge pull request #20161 from edsantiago/ci_desired_storage<br>
b74785023 Merge pull request #20708 from baude/vendorlibhvee0.5.0<br>
f17d8df55 Merge pull request #20707 from baude/vmtypesarereserved<br>
85f57b6ea Merge pull request #20709 from TomSweeneyRedHat/dev/tsweeney/buil=
dah1.33.0<br>
3d86a9658 Bump Buildah to v1.33.0<br>
60d9f9b80 Update to libhvee 0.5.0<br>
a6bb60140 Merge pull request #20621 from mtrmac/docker-compat-login<br>
d32f61d91 vmtypes names cannot be used as machine names<br>
d0b32255e Add support for --compat-auth-file in login/logout<br>
a3d5814e0 Update tests for a c/common error message change<br>
ced07a55f Update c/image and c/common to latest, c/buildah to main<br>
71aac2f43 Merge pull request #20704 from umohnani8/py-docs<br>
a10b88cb2 CI: test overlay and vfs<br>
da899b92d [CI:DOCS] Add link to podman py docs<br>
5c97e12d5 Merge pull request #20610 from edsantiago/bump_vm_images<br>
857d610d0 Merge pull request #20659 from rhatdan/subscriptions<br>
d2a4ec867 Test fixes for debian<br>
23ead49de pasta tests: remove some skips<br>
d711c3f46 VM images: bump to 2023-11-16<br>
638199c49 Merge pull request #20671 from ygalblum/quadlet-uidmap<br>
50f4f5916 Merge pull request #20698 from containers/renovate/<a href=3D"htt=
p://go-k8s.io/kubernetes-vulnerabilityec2e533a2" rel=3D"noreferrer" target=
=3D"_blank">go-k8s.io/kubernetes-vulnerability<br>
ec2e533a2</a> Merge pull request #20696 from ashley-cui/ci<br>
5f3f8a3ca fix(deps): update module <a href=3D"http://k8s.io/kubernetes" rel=
=3D"noreferrer" target=3D"_blank">k8s.io/kubernetes</a> to v1.28.4 [securit=
y]<br>
3d88f614f [CI:DOCS] Machine test timeout env var<br>
fcf4f3327 Merge pull request #20592 from containers/renovate/github.com-gor=
illa-handlers-1.x<br>
d36593c65 Merge pull request #20688 from ygalblum/quadlet-root-symlink<br>
e35fc92c0 Quadlet - add support for UID and GID Mapping<br>
dc709e4d7 Quadlet - Allow using symlink on the base search paths<br>
1d49773bb Merge pull request #20683 from baude/applehvsshkeys<br>
540ade060 Merge pull request #20685 from containers/renovate/dessant-lock-t=
hreads-5.x<br>
7b826b230 [skip-ci] Update dessant/lock-threads action to v5<br>
ea89eaa1c Avoid empty SSH keys on applehv<br>
9c954739e Merge pull request #20678 from flouthoc/usb_pass_cleanup<br>
24bf08e97 Merge pull request #20676 from andreasgerstmayr/fix-relabeling-co=
mmand<br>
33ddd79e2 qemu,parseUSB: minor refactor<br>
669829447 fix(deps): update module <a href=3D"http://github.com/gorilla/han=
dlers" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/handlers</a>=
 to v1.5.2<br>
a9a74dada Merge pull request #20673 from edsantiago/emergency_ci_fix<br>
b7cfceaea Merge pull request #20601 from giuseppe/use-rootless-from-storage=
<br>
49b152f49 docs: fix relabeling command<br>
7dd33b307 Merge pull request #20540 from victortoso/usb-host-passthrough<br=
>
5dc807487 Pass secrets from the host down to internal podman containers<br>
2f09b635c Merge pull request #20674 from JoshuaBeighton/main<br>
c838a69c2 Merge pull request #20672 from lsm5/packit-pre-release<br>
047da19b5 (Temporary) Emergency CI fix: quay search is broken<br>
e1f3ae0d8 Update <a href=3D"http://podman-stats.1.md.in" rel=3D"noreferrer"=
 target=3D"_blank">podman-stats.1.md.in</a><br>
6fa4a975c [CI:BUILD] packit: handle builds for RC releases<br>
a3f8f8c1c Merge pull request #20652 from containers/renovate/github.com-ons=
i-ginkgo-v2-2.x<br>
8e6fe99fd Merge pull request #20662 from ygalblum/quadlet-mount-equal-sign<=
br>
6d4d59b04 Merge pull request #20646 from edsantiago/while_ed_was_sleeping<b=
r>
bd375058c Quadlet test - add case for multi =3D sign in mount<br>
a22c29021 Merge pull request #20643 from protosam/main<br>
5e0471ba7 set RLIMIT_NOFILE soft limit to match the hard limit on mac<br>
d636ce8d7 rootless: use functionalities from c/storage<br>
6b5b39912 CI: e2e: fix a smattering of test bugs that slipped in<br>
d07263f34 fix(deps): update module <a href=3D"http://github.com/onsi/ginkgo=
/v2" rel=3D"noreferrer" target=3D"_blank">github.com/onsi/ginkgo/v2</a> to =
v2.13.1<br>
bc7c01d19 Merge pull request #20638 from containers/renovate/golang.org-x-t=
ools-0.x<br>
0f18e4894 Merge pull request #20649 from rhatdan/man<br>
5faaef653 Merge pull request #20550 from containers/renovate/github.com-con=
tainers-libhvee-digest<br>
f3e4b3114 Merge pull request #20637 from containers/renovate/github-issue-l=
abeler-3.x<br>
fbd1ba68f vendor: update c/storage<br>
956c0d6ec Improve the documentation of quadlet<br>
7d107b989 Merge pull request #19879 from rhatdan/ulimits<br>
b5b9a2b96 Merge pull request #20607 from rhatdan/man<br>
79eec47f5 Merge pull request #20626 from jakecorrenti/ignition-builder<br>
4a20de7f7 Merge pull request #20641 from jakecorrenti/socket-mapping-nits<b=
r>
39d647a2f Fix socket mapping socket mapping nits<br>
d7d8b86e5 Merge pull request #20632 from containers/renovate/github.com-ons=
i-gomega-1.x<br>
5388836c1 fix(deps): update module <a href=3D"http://golang.org/x/tools" re=
l=3D"noreferrer" target=3D"_blank">golang.org/x/tools</a> to v0.15.0<br>
b0ec6d816 Merge pull request #20636 from containers/renovate/golang.org-x-n=
et-0.x<br>
60f67eec7 fix(deps): update <a href=3D"http://github.com/containers/libhvee=
" rel=3D"noreferrer" target=3D"_blank">github.com/containers/libhvee</a> di=
gest to 9651e31<br>
dfffa7b18 Merge pull request #20630 from lsm5/disable-goproxy<br>
9cd975d59 [skip-ci] Update github/issue-labeler action to v3.3<br>
b8d59030c Document --userns=3Dauto behaviour for rootless users<br>
c23963d7a machine: qemu: add usb host passthrough<br>
4a75a2b3c fix(deps): update module <a href=3D"http://golang.org/x/net" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/net</a> to v0.18.0<br>
01fd9e906 Merge pull request #20620 from baude/codecleanup<br>
1c5bc7e09 fix(deps): update module <a href=3D"http://github.com/onsi/gomega=
" rel=3D"noreferrer" target=3D"_blank">github.com/onsi/gomega</a> to v1.30.=
0<br>
b2c56365b Refactor Ignition configuration for virt providers<br>
81dc3f183 [CI:BUILD] rpm: disable GOPROXY<br>
6bb2edd21 Merge pull request #20608 from rhatdan/codespell<br>
78798cab0 Automatic code cleanups - JetBrains<br>
111b2337f Merge pull request #20613 from edsantiago/doublecheck_db<br>
6d2aa6734 Merge pull request #20614 from edsantiago/bats_tweaks<br>
57dbd61f6 Merge pull request #20572 from baude/ocirefactor<br>
a45ba06d0 Refactor key machine objects<br>
f47a85f4f Merge pull request #20612 from baude/applehvvirtiosfsmounts<br>
1c969219d systests: add [NNN] prefix in logs, NNN =3D filename<br>
92cd7b25f systests: add a last-minute check for db backend<br>
d44f71c13 applehv: allow virtiofs to mount to /<br>
886f932b0 Merge pull request #20591 from containers/renovate/github.com-spf=
13-cobra-1.x<br>
8c834d05c Merge pull request #20606 from rhatdan/docs<br>
c2de6d34c Run codespell on podman<br>
8f5c46c9e update completion scripts for cobra v1.8.0<br>
d68feff8c Merge pull request #20588 from containers/renovate/github.com-mat=
tn-go-sqlite3-1.x<br>
dff4d898c Merge pull request #20596 from containers/renovate/golang.org-x-t=
ext-0.x<br>
28f3e9fe3 Fix man page display of podman-kube-generate<br>
2ca952ac7 Merge pull request #20605 from adelton/man-podman-kube-apply<br>
796b9cf3b Merge pull request #20574 from rhatdan/push<br>
8effb7825 Try to fix the broken formatting of man podman=E2=80=90kube=E2=80=
=90apply(1).<br>
e3b3653a9 Merge pull request #20578 from Luap99/CNI-removal-notice<br>
3eb2d5ceb fix(deps): update module <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> to v0.14.0<br>
108d2bc43 docs: make CNI removal explicit<br>
715451f69 Merge pull request #20580 from RiRa12621/main<br>
f845e1a3b Merge pull request #20558 from elezar/bump-cdi<br>
d2583c787 Merge pull request #20593 from containers/renovate/github.com-gor=
illa-mux-1.x<br>
c473305b5 Merge pull request #20589 from containers/renovate/golang.org-x-s=
ync-0.x<br>
c1fe1f9d3 fix(deps): update module <a href=3D"http://github.com/gorilla/mux=
" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/mux</a> to v1.8.1=
<br>
e78288344 fix(deps): update module <a href=3D"http://github.com/spf13/cobra=
" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra</a> to v1.8.0=
<br>
0824e45c8 fix(deps): update module <a href=3D"http://golang.org/x/sync" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sync</a> to v0.5.0<br>
da897bd04 fix(deps): update module <a href=3D"http://github.com/mattn/go-sq=
lite3" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-sqlite3</a>=
 to v1.14.18<br>
420316ef6 Podman push --help should reveal default compression<br>
5e55d76af Merge pull request #20581 from Luap99/go-systemd<br>
942bcf34b Update container-device-interface (CDI) to v0.6.2<br>
375b0cc13 fix: adjust helper string in machine_common<br>
9e05fb14a fix: adjust helper string in machine_common<br>
b44d372b1 Merge pull request #20559 from edsantiago/ci_default_sqlite<br>
5fc758533 Merge pull request #20420 from jakecorrenti/refactor-socket-mappi=
ng<br>
4953f7f49 Merge pull request #20582 from flouthoc/remove-symlink-from-repo<=
br>
127505dda Merge pull request #20583 from containers/renovate/golangci-golan=
gci-lint-1.x<br>
607aff55f remote,test: remove .dockerignore which is a symlink<br>
6b7d7f6fb [CI:DOCS] Update dependency golangci/golangci-lint to v1.55.2<br>
b5f854458 fix: adjust helper string in machine_common<br>
ce334ed9d vendor: update <a href=3D"http://github.com/coreos/go-systemd/v22=
" rel=3D"noreferrer" target=3D"_blank">github.com/coreos/go-systemd/v22</a>=
 to latest main<br>
0904c1942 Merge pull request #20568 from giuseppe/update-c-common<br>
48b8b372a Merge pull request #20417 from baude/checkforsystemconnection<br>
ece4dfbc0 Merge pull request #20538 from baude/ocipull<br>
2a17baa29 CI: default to sqlite<br>
33753db47 vendor: update c/common<br>
f002e4516 Merge pull request #20565 from xduugu/fix-compose-debug-msg<br>
613f50c7a check system connections before machine init<br>
ea4775ec9 Consume OCI images for machine image<br>
d2a37222b freebsd: drop dead code<br>
06a07c98e libpod: make removePodCgroup linux specific<br>
e4f1c87ea containers: drop special handling for ErrCgroupV1Rootless<br>
0b6abfe1e compose: fix compose provider debug message<br>
0337b1b78 Merge pull request #20557 from edsantiago/eol-policy<br>
3ef2f1396 Merge pull request #20560 from flouthoc/bump-c-image<br>
54fca1f52 Merge pull request #20377 from rhatdan/commit<br>
aefa9abf4 image: replace GetStoreImage with ResolveReference<br>
03419d6da vendor: bump c/image to 373c52a9466f<br>
ce9c1b9b8 Refactor machine socket mapping<br>
e622045af Merge pull request #20561 from ashley-cui/rm<br>
f6ec210f3 AppleHV: Fix machine rm error message<br>
af0ef47f0 Add status messages to podman --remote commit<br>
1ef61cf99 Merge pull request #20556 from containers/renovate/github.com-shi=
rou-gopsutil-v3-3.x<br>
3241b3259 End-of-Life policy for github issues<br>
0cd20090b Merge pull request #20554 from containers/renovate/github.com-doc=
ker-go-connections-digest<br>
f84dba227 Merge pull request #20506 from edsantiago/farm_tests<br>
80a9f23f8 Merge pull request #20532 from containers/renovate/dawidd6-action=
-send-mail-3.x<br>
390e9ddc9 fix(deps): update module <a href=3D"http://github.com/shirou/gops=
util/v3" rel=3D"noreferrer" target=3D"_blank">github.com/shirou/gopsutil/v3=
</a> to v3.23.10<br>
784f76924 Merge pull request #20552 from containers/renovate/github.com-crc=
-org-vfkit-digest<br>
18d6bb40d Support passing of Ulimits as -1 to mean max<br>
78765b14d fix(deps): update <a href=3D"http://github.com/docker/go-connecti=
ons" rel=3D"noreferrer" target=3D"_blank">github.com/docker/go-connections<=
/a> digest to 0b8c1f4<br>
ffb96ad8b fix(deps): update <a href=3D"http://github.com/crc-org/vfkit" rel=
=3D"noreferrer" target=3D"_blank">github.com/crc-org/vfkit</a> digest to f3=
c783d<br>
55b9ea3ec Merge pull request #20358 from mheon/9p<br>
f5b2cf1b5 Merge pull request #20533 from cevich/fix_secret_scanner<br>
7153124f9 Log gvproxy and server9 to file on log-level=3Ddebug<br>
d9c388e2f Change to using gopsutil for cross-OS process ops<br>
642fa9897 Initial addition of 9p code to Podman<br>
2972f5941 Merge pull request #20545 from giuseppe/fix-hostname-with-host-ut=
s<br>
b332ca7a0 libpod: fix /etc/hostname with --uts=3Dhost<br>
4eb02346d Merge pull request #20536 from edsantiago/pasta_timeout_tweaks<br=
>
735e24331 Merge pull request #20539 from edsantiago/stty_flake<br>
377644640 Merge pull request #20476 from rhatdan/build<br>
89d7b2735 systests: stty test: retry once on flake<br>
6b94c8fd3 systests: pasta: avoid hangs<br>
4c67a6aed Fix secrets scanning GHA Workflow<br>
2193bb8fc [skip-ci] Update dawidd6/action-send-mail action to v3.9.0<br>
1146f2ca7 Merge pull request #20136 from cevich/credential_scanning_config<=
br>
f509a3421 Merge pull request #20529 from giuseppe/docs-clarify-systemd-moun=
t<br>
487118242 Merge pull request #20457 from rhatdan/pod<br>
77d265820 Merge pull request #20369 from cgiradkar/Issue-16759-docs<br>
e9dd41183 docs: clarify systemd cgroup mount<br>
eee2ca2d8 Merge pull request #20444 from containers/renovate/github.com-ons=
i-gomega-1.x<br>
0943f3bcb Merge pull request #20513 from baude/applehvtiming<br>
a1577ec7b podman build --remote URI Dockerfile shoud not be treated as file=
<br>
4f6a8f0d5 Merge pull request #20483 from vrothberg/RUN-1934<br>
6ec458d82 Merge pull request #20510 from mheon/powercap_2<br>
95a5ad258 Small fixes for wacko CI environments<br>
95fc0044f Merge pull request #20508 from vrothberg/fix-20502<br>
c6d410cc3 Do not add powercap mask if no paths are masked<br>
09c64ef31 Merge pull request #20503 from containers/renovate/github.com-goo=
gle-uuid-1.x<br>
3743955d6 compose: try all possible providers before throwing an error<br>
91df369ae podman kube play --replace should force removal of pods and conta=
iners<br>
3ce62d3cc Sort kube options alphabetically<br>
4a2efe0ec Merge pull request #20497 from containers/renovate/go.etcd.io-bbo=
lt-1.x<br>
dfa7e3776 Merge pull request #20500 from containers/renovate/github.com-doc=
ker-docker-24.x<br>
e966c86d9 container.conf: support attributed string slices<br>
7d5af58bd Merge pull request #20501 from mheon/powercap<br>
91ccd7cd2 CI: podman farm tests cleanup<br>
be7dd128e Mask /sys/devices/virtual/powercap<br>
05a607f14 Update module <a href=3D"http://github.com/google/uuid" rel=3D"no=
referrer" target=3D"_blank">github.com/google/uuid</a> to v1.4.0<br>
c3fae0136 Merge pull request #20494 from edsantiago/systest_subnet_check<br=
>
6a0b2c680 fix(deps): update module <a href=3D"http://github.com/docker/dock=
er" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> to v2=
4.0.7+incompatible<br>
6badb659c fix(deps): update module <a href=3D"http://go.etcd.io/bbolt" rel=
=3D"noreferrer" target=3D"_blank">go.etcd.io/bbolt</a> to v1.3.8<br>
e5101b28d Merge pull request #20492 from brlin-tw/patch-1<br>
499c60890 Merge pull request #20489 from containers/renovate/<a href=3D"htt=
p://go-google.golang.org/grpc-vulnerability9e3363c5e" rel=3D"noreferrer" ta=
rget=3D"_blank">go-google.golang.org/grpc-vulnerability<br>
9e3363c5e</a> CI: systest: safer random_rfc1918_subnet<br>
c1d177e8e Merge pull request #20493 from edsantiago/getport_safe<br>
c841fa9e9 CI: e2e: safer GetPort()<br>
fd5140d87 Fix broken code block markup in Introduction.rst<br>
d0ce60c63 chore(deps): update module <a href=3D"http://google.golang.org/gr=
pc" rel=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> to v1.5=
7.1 [security]<br>
642c0c798 Merge pull request #20478 from lstocchi/i20373<br>
15969a60b chore: remove npipe const and use vmtype const for checking<br>
0242a7439 Merge pull request #20470 from edsantiago/curl_port_flake_fix<br>
84efd2b7e Merge pull request #20468 from p-fruck/fix/api-compat-network-doc=
s<br>
5a47b1e15 Merge pull request #20050 from umohnani8/farm-build-2<br>
2158e1540 Update module <a href=3D"http://github.com/onsi/gomega" rel=3D"no=
referrer" target=3D"_blank">github.com/onsi/gomega</a> to v1.29.0<br>
32ef2d708 Merge pull request #20479 from ygalblum/quadlet-read-only<br>
c0fb8fe59 CI: try to fix more networking flakes<br>
556898511 Merge pull request #20481 from vrothberg/fix-20469<br>
c21f28813 fix: check wsl npipe when executing podman compose<br>
532804be5 Merge pull request #20482 from containers/renovate/golangci-golan=
gci-lint-1.x<br>
9ea1ed6d4 [CI:DOCS] Update dependency golangci/golangci-lint to v1.55.1<br>
151a01917 Merge pull request #20480 from ygalblum/makefile-user-control<br>
76cca08f8 Quadlet - explicit support for read-only-tmpfs<br>
c13b8e3c9 compat API: fix image-prune --all<br>
0e15861c5 Makefile - allow more control over Ginkgo parameters<br>
242d22319 Merge pull request #20463 from vrothberg/RUN-1934<br>
ebe01ca29 Add e2e tests for farm build<br>
989afd910 vendor c/{buildah,common}: appendable containers.conf strings, Pa=
rt 1<br>
35121f67b Merge pull request #20455 from rhatdan/play<br>
dd8f57a3b Add podman farm build command<br>
2e88d580a Add emulation package<br>
06b726497 Use buildah default isolation when working with podman play kube<=
br>
e9e18acd5 Merge pull request #20451 from rhatdan/volume<br>
0a2aae119 docs(API): Fix compat network (dis-)connect<br>
83d7c3849 Merge pull request #20464 from Luap99/libpod-remote<br>
1b466ccbd test/e2e: do not import buildah<br>
ed58ea784 Merge pull request #20422 from sstosh/api-skip-cgroupv1<br>
8a0968baa pkg/specgen: remove config_unsupported.go<br>
cb9dfeb8e pkg/parallel/ctr: add !remote tag<br>
d4a67cf45 pkg/domain/filters: add !remote tag<br>
9cecae8c2 pkg/ps: add !remote tag<br>
1d1630990 pkg/systemd/generate: add !remote tag<br>
bad25da92 libpod: add !remote tag<br>
abb5c86b6 pkg/autoupdate: add !remote tag<br>
01a750699 vendor latest c/common<br>
3615af903 libpod: remove build support non linux/freebsd<br>
629278ea9 Merge pull request #20458 from edsantiago/retry_cache_pulls<br>
c3b471179 Merge pull request #20461 from Alan-Cha/main<br>
36b41997d Merge pull request #20456 from rhatdan/storage<br>
1850670f1 Fix typo<br>
2e57746ff test/apiv2: adapt apiv2 test on cgroups v1 environment<br>
c3ba0221e ginkgo setup: retry cache pulls<br>
83f07729c Merge pull request #20454 from containers/renovate/github.com-vba=
tts-git-validation-1.x<br>
3abf5c929 Merge pull request #20452 from edsantiago/cache_k8s_pause<br>
ecb4f487c Merge pull request #20446 from Luap99/common<br>
ee6070888 Support size option when creating tmpfs volumes<br>
8876380af not mounted layers should be reported as info not error<br>
85cc4092f CI: stop using <a href=3D"http://registry.k8s.io" rel=3D"noreferr=
er" target=3D"_blank">registry.k8s.io</a><br>
a8e1a5ed1 fix(deps): update module <a href=3D"http://github.com/vbatts/git-=
validation" rel=3D"noreferrer" target=3D"_blank">github.com/vbatts/git-vali=
dation</a> to v1.2.1<br>
6d99cb5cd test fixes for c/common tag chnages<br>
dfdd93323 vendor latest c/common<br>
19c870da0 Merge pull request #20425 from giuseppe/podman-do-not-leak-DBUS_S=
ESSION_BUS_ADDRESS-into-conmon<br>
3661c87d3 Merge pull request #20412 from ashley-cui/lastup<br>
8022d696f Merge pull request #20427 from Luap99/lint<br>
d6f44d956 hyperV: Update lastUp time<br>
1ac110835 [CI:DOCS] Update dependency golangci/golangci-lint to v1.55.0<br>
9e648a1f5 lint: disable testifylint<br>
29273cda1 lint: fix warnings found by perfsprint<br>
64f43fed4 lint: fix warnings found by inamedparam<br>
c21f42a4e lint: fix warnings found by protogetter<br>
03947ab03 libpod: skip DBUS_SESSION_BUS_ADDRESS in conmon<br>
e49ed78a4 Merge pull request #20385 from umohnani8/host-net<br>
110914d87 Merge pull request #20359 from containers/renovate/common-image-a=
nd-storage-deps<br>
26681c09a Merge pull request #20414 from edsantiago/perlunicode<br>
37292a10b Merge pull request #20405 from giuseppe/do-not-leak-sessions-with=
-remote<br>
c1980a6a2 Merge pull request #20409 from Luap99/port-fw<br>
85e8aa4e8 Merge pull request #20413 from Luap99/quadlet-cgroupv2<br>
936e30f68 Use node hostname in kube play when hostNetwork=3Dtrue<br>
bd953fdc7 cirrus setup: special-case perl unicode<br>
ca9efb0cd network: document ports and macvlan interaction<br>
f2bc63894 quadlet: document cgroupv2 requirement<br>
0b0f128bf Merge pull request #20410 from containers/renovate/actions-checko=
ut-digest<br>
e8183e836 [skip-ci] Update actions/checkout digest to b4ffde6<br>
1d2589c3f Revert &quot;Emergency workaround for CI breakage&quot;<br>
f48a706ab remote: exec: do not leak session IDs on errors<br>
30b14b33a Merge pull request #20403 from containers/renovate/k8s.io-kuberne=
tes-1.x<br>
c2e1debe8 Merge pull request #20395 from rhatdan/quadlet<br>
ad1ab71b8 fix(deps): update <a href=3D"http://github.com/containers/storage=
" rel=3D"noreferrer" target=3D"_blank">github.com/containers/storage</a> di=
gest to 79aa304<br>
d1086281b fix(deps): update module <a href=3D"http://k8s.io/kubernetes" rel=
=3D"noreferrer" target=3D"_blank">k8s.io/kubernetes</a> to v1.28.3<br>
68636416d Merge pull request #20357 from rhatdan/TERM<br>
b2192695b Merge pull request #20406 from edsantiago/systest_bork<br>
657029da7 System tests: fix broken silence127<br>
9a29eb05e Merge pull request #20400 from baude/issue20361<br>
b72bb1162 Add TERM iff TERM not defined in container when podman exec -t<br=
>
d4086f5ac Merge pull request #20404 from edsantiago/emergency_ci_fix<br>
6c7104c4f Merge pull request #20402 from baude/applehvrmstopgvproxy<br>
44ed415b2 Emergency workaround for CI breakage<br>
62a81a166 Merge pull request #20383 from Luap99/init-path<br>
d4d76479c Kill gvproxy when machine rm -f<br>
cad4d0ee9 Fix path for omvf vars on Darwin/arm64<br>
c73e99aab Merge pull request #20397 from edsantiago/cp_test_cleanup<br>
553cfb6b6 Merge pull request #20368 from ygalblum/quadlet-image-name<br>
aabe5c8aa Merge pull request #20394 from giuseppe/cleanup-exec-session-on-e=
rrors<br>
02757ab20 Merge pull request #20391 from sstosh/nanocpu-api-test<br>
285718915 Allow systemd specifiers in User and Group Quadlet keys<br>
caef657c5 libpod: rename confusing import name<br>
efe5e98d0 use FindInitBinary() for init binary<br>
1d3ec78e0 vendor latest c/common<br>
fa19e1baa exec: do not leak session IDs on errors<br>
1efcd1ecf systests: cp test: lots of cleanup<br>
2d65e57ae Define better error message for container name conflicts with ext=
ernal storage.<br>
9b8e01efd Quadlet - support ImageName for .image files<br>
ef2392f21 Merge pull request #20381 from vrothberg/fix-20375<br>
64171043a test/system: ignore 127 if it is the expected rc<br>
a1982c043 Merge pull request #20365 from p-fruck/fix/api-compat-network-con=
nected<br>
074a0de7f Merge pull request #20388 from cevich/cross_target_comment<br>
c65d1c02b test/apiv2/<a href=3D"http://20-containers.at" rel=3D"noreferrer"=
 target=3D"_blank">20-containers.at</a>: fix NanoCPUs tests on cgroups v1<b=
r>
6624ccb4b Merge pull request #20384 from Luap99/double-netns<br>
9394171cb Merge pull request #20387 from Luap99/machine-doc<br>
831844b59 image history: fix walking layers<br>
ad5319025 fix(api): Ensure compatibality for network connect<br>
b0a45a905 Merge pull request #20366 from ygalblum/quadlet-kube-down-force<b=
r>
91264e7d2 Merge pull request #19586 from rhatdan/ps<br>
c909afb88 Merge pull request #20239 from jackgris/docker-api-error-response=
<br>
e0561301c [CI:DOCS] Add cross-build target info.<br>
dc705d370 machine set: document --rootful better<br>
bbd6281ec libpod: restart+userns cleanup netns correctly<br>
3b6a4ac37 Minor log and doc fixes<br>
f875ae317 Quadlet man page - discuss volume removal explicitly<br>
5d5facbd7 Quadlet - add support for KubeDownForce<br>
5853e2bee Merge pull request #20363 from ygalblum/quadlet-kube-oneshot-test=
<br>
6ba67ba96 System Test - Quadlet kube oneshot<br>
206177c59 Merge pull request #20376 from edsantiago/buildah_tests<br>
ae707b58d Merge pull request #20338 from umohnani8/vendor-common<br>
9637fed2f Fix output of podman --remote top<br>
acc7a94df Merge pull request #20235 from rhatdan/read-only<br>
dcb421bc5 buildah-bud: test relative TMPDIR<br>
c8604081e Fix handling of --read-only-tmpfs flag<br>
1b0be2f34 Vendor common and buildah main<br>
dabf6c83a Merge pull request #20367 from flouthoc/bump-and-test-buildah<br>
091d83d3c Merge pull request #20360 from containers/renovate/github.com-vba=
uerster-mpb-v8-8.x<br>
5db3b753a remote,build: wire unsetlabels<br>
331e47acb test: build with TMPDIR as relative<br>
6cf3dd493 docs: add unsetlabel<br>
64ff14932 vendor: bump buildah to v1.32.1-0.20231012130144-244170240d85<br>
74ed1d6e7 fix(deps): update module <a href=3D"http://github.com/vbauerster/=
mpb/v8" rel=3D"noreferrer" target=3D"_blank">github.com/vbauerster/mpb/v8</=
a> to v8.6.2<br>
b9f2c4d17 fix: pull error response docker rest api compatibility<br>
b5fec41f2 Merge pull request #20333 from baude/showinfo<br>
aa0e96e78 Merge pull request #20274 from ashley-cui/cleanup<br>
29f5c563e Show client info even if remote connection fails<br>
3e86bece9 Merge pull request #20354 from containers/renovate/github.com-con=
tainers-libhvee-digest<br>
52112fc5c fix(deps): update <a href=3D"http://github.com/containers/libhvee=
" rel=3D"noreferrer" target=3D"_blank">github.com/containers/libhvee</a> di=
gest to e51be96<br>
5afa949a4 Merge pull request #20322 from jakecorrenti/set-lock<br>
6e40a5f9c Merge pull request #20348 from rhatdan/codespell<br>
e4ef27137 Merge pull request #20347 from Luap99/healthcheck-event<br>
cb53bcf23 Run codespell<br>
fb87f0a7b Merge pull request #20337 from ygalblum/quadlet-kube-oneshot<br>
987dc2b8b SetLock for all virt providers<br>
61e0b64b9 Machine: Teardown on init failure<br>
99a14332e healthcheck: make sure to always show health_status events<br>
7b84b55da Apply suggestions from code review<br>
8de7c48df Merge pull request #20340 from baude/rtd<br>
ca518888e [CI:DOCS]rtd: implement v2 build file<br>
702f15528 Quadlet - support oneshot .kube files<br>
e5a099df6 Merge pull request #20177 from cevich/podman-machine-hyperv<br>
d437ca8fd Merge pull request #20328 from vrothberg/RUN-1936<br>
3dcd6af6e Merge pull request #20329 from Luap99/deadlock<br>
cdab56109 Merge pull request #20286 from containers/renovate/golang.org-x-n=
et-0.x<br>
3cc9db862 libpod: fix deadlock while parallel container create<br>
706b55080 Merge pull request #20323 from containers/renovate/github.com-cpu=
guy83-go-md2man-v2-2.x<br>
2301320f6 fix(deps): update module <a href=3D"http://golang.org/x/net" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/net</a> to v0.17.0<br>
8b46e852e api: add `compatMode` paramenter to libpod&#39;s pull endpoint<br=
>
76fec1227 api: break out compat image pull<br>
40f897653 fix(deps): update module <a href=3D"http://github.com/cpuguy83/go=
-md2man/v2" rel=3D"noreferrer" target=3D"_blank">github.com/cpuguy83/go-md2=
man/v2</a> to v2.0.3<br>
27ca6d487 Merge pull request #20321 from containers/renovate/github.com-nxa=
dm-tail-1.x<br>
fd514b498 Merge pull request #20318 from Luap99/db-backend<br>
29ae51600 use sqlite as default database<br>
8a52e638e vendor latest c/common<br>
acd0a93c3 fix(deps): update module <a href=3D"http://github.com/nxadm/tail"=
 rel=3D"noreferrer" target=3D"_blank">github.com/nxadm/tail</a> to v1.4.11<=
br>
040a4e4b1 Merge pull request #20232 from umohnani8/ctr-create<br>
8615b165c Merge pull request #20299 from giuseppe/fix-flake-ENOENT<br>
d18369ee8 Check for image with /libpod/containers/create<br>
8ac2aa793 container: always check if mountpoint is mounted<br>
d90fdfc63 Merge pull request #20311 from containers/renovate/github.com-ons=
i-ginkgo-v2-2.x<br>
787b1b25c fix(deps): update module <a href=3D"http://github.com/onsi/ginkgo=
/v2" rel=3D"noreferrer" target=3D"_blank">github.com/onsi/ginkgo/v2</a> to =
v2.13.0<br>
b2c5418fb Merge pull request #20288 from albnnc/fix/do-not-ignore-external-=
containerfiles<br>
9beb3a972 vendor: update c/storage<br>
0dba5acd8 Merge pull request #20308 from giuseppe/drop-debug-msg<br>
6e7e87503 Merge pull request #20253 from ygalblum/quadlet-command-args<br>
36bf90518 api: drop debug statement<br>
d321d427d Quadlet - add support for global arguments<br>
e9d6ffa8f Merge pull request #20252 from vrothberg/privileged<br>
b7f708a94 Merge pull request #20290 from containers/renovate/golang.org-x-t=
ools-0.x<br>
745cfb57d Merge pull request #20283 from containers/renovate/github.com-con=
tainers-libhvee-digest<br>
732cec794 Add system test<br>
10aa39068 fix(deps): update module <a href=3D"http://golang.org/x/tools" re=
l=3D"noreferrer" target=3D"_blank">golang.org/x/tools</a> to v0.14.0<br>
3fdb6ee2d Don&#39;t ignore containerfiles outside of build context<br>
b3209dc5d fix(deps): update <a href=3D"http://github.com/containers/libhvee=
" rel=3D"noreferrer" target=3D"_blank">github.com/containers/libhvee</a> di=
gest to fcf1cc2<br>
f4348bab6 Merge pull request #20279 from containers/renovate/golang.org-x-t=
erm-0.x<br>
eda275820 fix(deps): update module <a href=3D"http://golang.org/x/term" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> to v0.13.0<br>
d36c90868 Merge pull request #20277 from containers/renovate/golang.org-x-s=
ys-0.x<br>
b8084274c Merge pull request #20273 from giuseppe/bump-storage<br>
a7390a408 Merge pull request #20276 from ashley-cui/rel<br>
da6c86dfc Update module <a href=3D"http://golang.org/x/sys" rel=3D"noreferr=
er" target=3D"_blank">golang.org/x/sys</a> to v0.13.0<br>
1c0780097 [CI:DOCS] Add updating version on <a href=3D"http://podman.io" re=
l=3D"noreferrer" target=3D"_blank">podman.io</a> to release process<br>
362eca669 containers.conf: add `privileged` field to containers table<br>
6cb10425d Implement secrets/credential scanning<br>
ecef03d81 Merge pull request #20271 from containers/renovate/golang.org-x-s=
ync-0.x<br>
106abd13b Cirrus: Execute Windows podman-machine e2e tests<br>
338e4f590 vendor: bump c/storage<br>
8807243cc Update module <a href=3D"http://golang.org/x/sync" rel=3D"norefer=
rer" target=3D"_blank">golang.org/x/sync</a> to v0.4.0<br>
158b11a10 Merge pull request #20245 from jakecorrenti/qemu-wrapper<br>
b144b17f7 Merge pull request #20268 from Luap99/api-doc<br>
2168f0745 [CI:DOCS] update swagger version on <a href=3D"http://docs.podman=
.io" rel=3D"noreferrer" target=3D"_blank">docs.podman.io</a><br>
516a03a6f Merge pull request #20266 from n1hility/fix-resolved-disable<br>
458e56246 Merge pull request #20265 from n1hility/revert-systemd-change<br>
0414f88b3 Create Qemu command wrapper<br>
7dc5f7b49 Merge pull request #20263 from umohnani8/play-doc<br>
e46784971 Merge pull request #20262 from lsm5/gvisor-rhel<br>
4a67d2276 Merge pull request #20256 from Luap99/revert-env<br>
df6a00026 Adjust to path name change for resolved unit<br>
2a38f30b6 Revert &quot;Fix WSL systemd detection&quot;<br>
f622a2a54 [CI:BUILD] rpm/copr: gvforwarder recommends for RHEL<br>
27f58803d [CI:DOCS] update kube play delete endpoint docs<br>
46ca057f6 Merge pull request #20250 from Luap99/inspect-device<br>
6d3cea3ce Merge pull request #20261 from cgiradkar/Issue-168-podman.io<br>
3b39d4b08 Merge pull request #20132 from cgiradkar/Issue-17856<br>
3fc7c42e1 [CI:DOCS] Remove dead link from README<br>
1b3cedbf3 test/system: --env-file test fixes<br>
617af9bea Revert &quot;feat(env): support multiline in env-file&quot;<br>
5f340487e Revert &quot;docs(env-file): improve document description&quot;<b=
r>
9599589f1 Revert &quot;fix(env): parsing --env incorrect in cli&quot;<br>
7e6e26732 Filter health_check and exec events for logging in console<br>
e78e76c23 Merge pull request #20205 from jakecorrenti/build-applehv-intel<b=
r>
0443c5166 inspect: ignore ENOENT during device lookup<br>
c14e8f6cc Merge pull request #20238 from containers/renovate/github.com-con=
tainers-libhvee-digest<br>
267e80aa1 Merge pull request #20242 from flouthoc/manifest-retry<br>
b576b7932 test, manifest: test push retry<br>
13456be1e Merge pull request #20234 from giuseppe/vendor-distribution<br>
2457c259b Merge pull request #20240 from n1hility/fix-wsl-version-detection=
<br>
cbca39529 Fix locale issues with WSL version detection<br>
b988eadaf vendor: update module <a href=3D"http://github.com/docker/distrib=
ution" rel=3D"noreferrer" target=3D"_blank">github.com/docker/distribution<=
/a> to v2.8.3+incompatible<br>
1ebd22303 vendor: bump c/common to v0.56.1-0.20231002091908-745eaa498509<br=
>
fdf3e4b23 Merge pull request #20202 from cfergeau/gvproxy<br>
8b647cdb5 Update <a href=3D"http://github.com/containers/libhvee" rel=3D"no=
referrer" target=3D"_blank">github.com/containers/libhvee</a> digest to e9b=
1811<br>
527cf365c Merge pull request #20226 from containers/renovate/golang.org-x-e=
xp-digest<br>
162de835a Merge pull request #20215 from cevich/revert_faster_locking<br>
3b3bb5d2d Merge pull request #20223 from containers/renovate/github.com-ope=
ncontainers-runtime-spec-digest<br>
fe828d223 Merge pull request #20192 from umohnani8/images<br>
cc946daff windows: Use prebuilt gvproxy/win-sshproxy binaries<br>
a0eb80c4c Merge pull request #20221 from rahilarious/remove-selinux-tag<br>
bbd9590b4 Merge pull request #20194 from umohnani8/kube-mode<br>
9560d36bb Merge pull request #20208 from baude/newvfkit<br>
988b90635 Merge pull request #20227 from ygalblum/volume-ignore-noop<br>
4d8d081dd Merge pull request #20219 from rahilarious/main<br>
979c77f10 Volume create - fast exit when ignore is set and volume exists<br=
>
874e4466a Update <a href=3D"http://golang.org/x/exp" rel=3D"noreferrer" tar=
get=3D"_blank">golang.org/x/exp</a> digest to 9212866<br>
22a1d015c Update <a href=3D"http://github.com/opencontainers/runtime-spec" =
rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/runtime-spec=
</a> digest to c0e9043<br>
229734c10 remove selinux tag as not needed anymore<br>
049a5fb92 [skip-ci] Improve podmansh(1)<br>
85ed9edde Build applehv for Intel Macs<br>
7ef8519f4 Revert &quot;GHA Workflow: Faster discussion-locking&quot;<br>
59e0919bc update vfkit vendored code<br>
17cebb3ff Add DefaultMode to kube play<br>
ba788c1bb Fix broken podman images filters<br>
cc8c28eb7 Merge pull request #20198 from jakecorrenti/remove-extra-files-li=
ne<br>
fff4e2f0e Merge pull request #20191 from umohnani8/load<br>
26ae0ba85 Merge pull request #20190 from baude/issue20122<br>
d602038c2 Merge pull request #20189 from giuseppe/run--replace-print-only-c=
id<br>
f3aa35aa0 Merge pull request #20186 from cfergeau/gvproxy<br>
9b3964111 Remove `c.ExtraFiles` line in machine<br>
5e216a2a7 Merge pull request #20193 from ashley-cui/lastupnever<br>
744e09d6e Merge pull request #19994 from Syquel/fix-wsl-systemd-detection<b=
r>
f21c1d238 podman: run --replace prints only the new container id<br>
38f718e8c Merge pull request #20162 from edsantiago/f39<br>
bcfd9f340 New machines should show Never as LastUp<br>
94818f594 podman machine: disable zincati update service<br>
b284128d7 Revert &quot;cirrus setup: install en_US.UTF-8 locale&quot;<br>
b28188de2 Cirrus: CI VM images w/ newer automation-library<br>
2b9c0555f CI VMs: bump to f39 + f38<br>
ecd7b3802 [CI:DOCS] Update podman load doc<br>
87dd93933 Merge pull request #20181 from containers/renovate/common-image-a=
nd-storage-deps<br>
c2a8ed19c Merge pull request #20180 from jackgris/fix-links-readme<br>
58b5ae22e Update mac installer to latest gvproxy release<br>
8fb719fd0 Merge pull request #20184 from MrSuicideParrot/main<br>
5b990c383 Fix WSL systemd detection<br>
c9730e232 Merge pull request #20149 from ygalblum/quadlet-container-mount<b=
r>
be823b388 Add documentation for the vrf option on netavark<br>
46a1e25eb Merge pull request #20176 from edsantiago/e2e_check_stderr__more<=
br>
4212b4998 Merge pull request #19823 from Backfighter/fix-17028<br>
36f8e78d7 Merge pull request #20150 from wpross/add-rdt<br>
71b3d7703 Merge pull request #20158 from baude/wslenableinit<br>
fda028ca0 fix(deps): update <a href=3D"http://github.com/containers/common"=
 rel=3D"noreferrer" target=3D"_blank">github.com/containers/common</a> dige=
st to 9342cdd<br>
94139ece9 Merge pull request #20168 from boaz0/closes_20079<br>
6306e8985 fix: typos in links, path and code example<br>
ccb7da52c e2e: ExitCleanly(): manual special cases<br>
611db19b3 e2e: ExitCleanly(): the final fron^Wcommit<br>
b4d66a939 Merge pull request #20157 from ashley-cui/makesshproxy<br>
3444f34d5 Merge pull request #20169 from containers/renovate/dawidd6-action=
-send-mail-3.x<br>
149d3f7ad [CI:DOCS] Add win-sshproxy target to winmake<br>
0d4526e61 wsl: enable machine init tests<br>
455d16549 Update docs/source/markdown/options/rdt-class.md<br>
bfbd0c896 move IntelRdtClosID to HostConfig<br>
4853320ce use default when user does not provide rdt-class<br>
77336de8f Add documentation for Intel RDT support<br>
24b2f829b Add test for Intel RDT support<br>
40d3c3b9b Add Intel RDT support<br>
295439265 [CI:DOCS] Fix podman form update --help examples<br>
4e726f506 Merge pull request #20166 from containers/renovate/github.com-con=
tainers-gvisor-tap-vsock-0.x<br>
1323bf97f Merge pull request #20164 from containers/renovate/common-image-a=
nd-storage-deps<br>
bf061312f Merge pull request #20167 from Luap99/e2e-netdefault<br>
f0eb45667 Quadlet container mount - support non key=3Dval options<br>
d05c77799 Merge pull request #20159 from baude/applehvenablerm<br>
0b5ea1e6e test/e2e: default to netavark<br>
4ed9dc1ad [skip-ci] Update dawidd6/action-send-mail action to v3.9.0<br>
48ea4b9ec fix(deps): update module <a href=3D"http://github.com/containers/=
gvisor-tap-vsock" rel=3D"noreferrer" target=3D"_blank">github.com/container=
s/gvisor-tap-vsock</a> to v0.7.1<br>
35824b647 Merge pull request #20148 from vrothberg/conmon-env<br>
90eb73629 fix(deps): update <a href=3D"http://github.com/containers/common"=
 rel=3D"noreferrer" target=3D"_blank">github.com/containers/common</a> dige=
st to 4619314<br>
31f9e678f Merge pull request #20160 from baude/applehvenablestart<br>
779c33c33 Merge pull request #20140 from edsantiago/e2e_check_stderr__more<=
br>
f9b3fc79b Merge pull request #20128 from ashley-cui/mach<br>
172494423 applehv: enable machine tests for start<br>
2ff43429f applehv: machine tests for stop and rm<br>
127ebe2b2 Update machine tests README<br>
995a6a8ac Add podman socket info to machine inspect<br>
80952db0b Fix podman machine info test for hyperV<br>
94f47d6f6 Merge pull request #20141 from baude/wslenablestop<br>
f64234969 Merge pull request #20135 from ashley-cui/hypervroot<br>
7ade97210 libpod: pass entire environment to conmon<br>
e4b7455b7 e2e: ExitCleanly(): manual fixes to get tests working<br>
dbd946a93 e2e: ExitCleanly(): a few more<br>
a5c7b0ea5 Merge pull request #20153 from lsm5/fcos-podman-next-followup-3<b=
r>
59ffea80d FCOS+podman-next: correct GHA conditional syntax<br>
8bad842a4 pkg/machine/e2e: wsl stop<br>
d2d121a38 Merge pull request #20152 from baude/wslenableinspect<br>
1e046833c Merge pull request #20151 from baude/wslenablessh<br>
217c4d546 wsl: machine tests for inspect<br>
e4bfcfc25 wsl: machine tests for ssh<br>
a2434a9d3 Merge pull request #20144 from baude/wslenableset<br>
72033cdc6 Merge pull request #20137 from baude/applehvenablee2e<br>
cfc176d49 Merge pull request #20146 from containers/renovate/common-image-a=
nd-storage-deps<br>
5636d0219 fix(deps): update <a href=3D"http://github.com/containers/common"=
 rel=3D"noreferrer" target=3D"_blank">github.com/containers/common</a> dige=
st to e18cda8<br>
a018fe7c1 Merge pull request #20145 from baude/wslenablestart<br>
a112ee895 wsl: machine start test<br>
d3d5011dc wsl machine tests: set<br>
aebfde240 Merge pull request #20142 from baude/wslenablerm<br>
f52e414b2 Merge pull request #20138 from ashley-cui/proxytest<br>
cc4917d81 wsl: machine tests<br>
8a16174f9 Merge pull request #20134 from lsm5/fcos-image-cron<br>
ec68a7489 Skip proxy test for hyperV<br>
33a92aa00 Enable machine e2e test for applehv<br>
65ce03486 hyperV: Respect rootful option on machine init<br>
52ba1bfff [CI:BUILD] FCOS image: enable nightly build<br>
7133f5d38 Merge pull request #20117 from baude/hypervsettest<br>
97a02a036 Merge pull request #20130 from edsantiago/fedoraminimal_safe<br>
2fef4c7ab Merge pull request #20088 from vrothberg/fix-19938<br>
c59d1df75 Merge pull request #20124 from vrothberg/build-docs<br>
ffd67cf75 e2e: use safe fedora-minimal image<br>
41e51f473 hyperv: machine e2e tests for set command<br>
59e295f2a podman build: correct default pull policy<br>
ca1cd0204 Merge pull request #20091 from lsm5/copr-rpm-version-sha<br>
6293ec2e2 fix handling of static/volume dir<br>
919564e1a Merge pull request #20127 from vrothberg/fix-20119<br>
26b5b1dd3 unbreak CI: useradd not found<br>
f41d536f1 Merge pull request #20089 from edsantiago/e2e_check_stderr__more<=
br>
9ba002290 Merge pull request #20115 from baude/hypervstarting<br>
7359a2df1 Merge pull request #20116 from baude/hypervremoveforce<br>
3d5b9e80c Merge pull request #20114 from baude/hypervtzfix<br>
e670374e3 Merge pull request #20110 from umohnani8/farm-update<br>
08936db35 hyperv: set more realistic starting state<br>
2bef573f3 hyperv: use StopWithForce with remove<br>
2f7c2508c Merge pull request #20101 from ashley-cui/machcpus<br>
e7a86d19c Merge pull request #20111 from containers/renovate/github.com-con=
tainers-gvisor-tap-vsock-digest<br>
f52b02f40 Fix all ports exposed by kube play<br>
cd4f61181 Fix setting timezone on HyperV<br>
172369b54 fix(deps): update <a href=3D"http://github.com/containers/gvisor-=
tap-vsock" rel=3D"noreferrer" target=3D"_blank">github.com/containers/gviso=
r-tap-vsock</a> digest to 97028a6<br>
e0b44bcf3 Fix farm update to check for connections<br>
d8e305716 Adjust machine CPU tests<br>
c3ab75ca4 Merge pull request #20103 from lsm5/main-version-bump<br>
8188a6fcf Bump version on main<br>
67aab1308 Merge pull request #20100 from Luap99/pod-rm-volume<br>
e65874903 [CI:BUILD] Packit: show SHORT_SHA in `podman --version` for COPR =
builds<br>
96142c2f7 Vendor c/common<br>
af2665c28 pod rm: do not log error if anonymous volume is still used<br>
4916f7d77 e2e: ExitCleanly(): manual fixes to get tests passing<br>
8e743fa1d e2e: ExitCleanly(): a few more<br>
5a3a9ce9c Merge pull request #20093 from baude/hypervinit<br>
da6ebeb51 Merge pull request #20086 from giuseppe/fix-mount-cgroupfs-withou=
t-netns<br>
08d05b9b0 Merge pull request #20061 from lsm5/packit-fail-tag<br>
8576a36f4 Merge pull request #20083 from giuseppe/fix-shared-propagation-te=
st<br>
c66aa3b7b fixes for pkg/machine/e2e on hyperv<br>
83b6975d1 test: fix rootless propagation test<br>
6c2493f78 [CI:BUILD] packit: tag @containers/packit-build team on copr buil=
d failures<br>
aa152a779 Merge pull request #20082 from giuseppe/test-update-fedora-minima=
l<br>
935a6d156 Merge pull request #20074 from baude/hypervmachinee2epass1<br>
aa286a532 Merge pull request #19964 from baude/resizeDisk<br>
92f4dcb09 Enable disk resizing for applehv<br>
fea4613e9 Merge pull request #20085 from rhatdan/volumes<br>
5b3801776 Various updates for hyperv and machine e2e tests<br>
682ca6b2e test: update fedoraMinimal version<br>
cf3b216ac Merge pull request #20039 from lsm5/rpm-remove-gvproxy-subpackage=
<br>
6db6645b4 Merge pull request #20084 from cgiradkar/hotfix-ActiveDestination=
<br>
ada67a248 Merge pull request #20041 from lsm5/fcos-crun-wasm<br>
f850339d0 Merge pull request #20049 from containers/renovate/github.com-con=
tainers-gvisor-tap-vsock-digest<br>
8d3010d06 specgen, rootless: fix mount of cgroup without a netns<br>
39ba5ff24 Automatically remove anonymous volumes when removing a container<=
br>
24d3347ed Use ActiveServiceDestination in ssh remoteConnectionUsername<br>
b6ea49f5a fix(deps): update <a href=3D"http://github.com/containers/gvisor-=
tap-vsock" rel=3D"noreferrer" target=3D"_blank">github.com/containers/gviso=
r-tap-vsock</a> digest to 9298405<br>
e209c40ad Merge pull request #20071 from edsantiago/e2e_check_stderr__kubeg=
en<br>
0f0430702 Merge pull request #20065 from edsantiago/e2e_check_stderr__more<=
br>
53e6a4435 Merge pull request #20031 from ashley-cui/winmake<br>
ebbc42359 Merge pull request #20069 from baude/noextrawindows<br>
c69873d67 e2e: ExitCleanly(): generate_kube_test.go<br>
841cfa802 e2e: generate kube -&gt; kube generate<br>
d1f86d524 e2e: ExitCleanly(): generate_kube_test.go<br>
f3e9a6369 windows cannot &quot;do&quot; extra files<br>
8b498b74f Merge pull request #20063 from baude/strongunits<br>
62e13bec7 e2e: ExitCleanly(): Fixes for breaking tests<br>
09c3ac48f play kube -&gt; kube play<br>
e83ced8a0 e2e: ExitCleanly(): play_kube_test.go<br>
eb9283c6f introduce pkg/strongunits<br>
639eb52c8 Merge pull request #20062 from vrothberg/syslog-fix<br>
c5be3aecd Merge pull request #20056 from Luap99/fast-net-ls<br>
93623fe0c Merge pull request #20058 from rhatdan/VENDOR<br>
6d8b3047d Makefile equiv Powershell script<br>
4652a2623 pass --syslog to the cleanup process<br>
370937d6c Merge pull request #20057 from vrothberg/fix-auto-update-test<br>
cbfd92123 Merge pull request #20053 from martinpitt/packit-revdeps-notify<b=
r>
8f17ac5c1 Merge pull request #19997 from cgiradkar/Issue_15588<br>
73dc72f80 vendor of containers/common<br>
1cbe692de fix --authfile auto-update test<br>
8e5adde0b compat API: speed up network list<br>
e80d9b7f8 Merge pull request #20036 from edsantiago/bats_check_stderr<br>
28a1c5492 Merge pull request #20042 from cevich/faster_closed_issue_pr_lock=
<br>
8c95aa402 Change priority for cli-flags for remotely operating Podman<br>
befdb4199 libpod: remove unused ContainerState() fucntion<br>
07f8d4451 Merge pull request #20048 from edsantiago/e2e_check_stderr__more<=
br>
26f25d314 Merge pull request #19992 from baude/wslenablee2e<br>
eae4e5079 Merge pull request #20046 from containers/renovate/github.com-ons=
i-ginkgo-v2-2.x<br>
0ec63abca [CI:BUILD] Packit: Enable failure notifications for cockpit tests=
<br>
0ac98176b e2e: ExitCleanly(): more low-hanging fruit<br>
a50fb7e06 e2e: ExitCleanly(): more low-hanging fruit<br>
1908663f1 fix(deps): update module <a href=3D"http://github.com/onsi/ginkgo=
/v2" rel=3D"noreferrer" target=3D"_blank">github.com/onsi/ginkgo/v2</a> to =
v2.12.1<br>
38f5ead33 Enable machine e2e tests for WSL<br>
ff07abea4 systests: tighter checks for unwanted warnings<br>
618f846ed GHA Workflow: Faster discussion-locking<br>
696f4a6a4 Merge pull request #20038 from TomSweeneyRedHat/dev/tsweeney/nit_=
farm<br>
6a4df3af3 Merge pull request #20037 from mheon/fix_sigproxy_docs<br>
289be0c01 [CI:BUILD] FCOS + podman-next image: pull in wasm<br>
e688fdc1a Merge pull request #19830 from lsm5/copr-rpm-fcos-followup<br>
96d5794a7 Merge pull request #20034 from edsantiago/e2e_check_stderr__more<=
br>
910106040 Merge pull request #19723 from jakecorrenti/implement-gvproxy-cmd=
line<br>
649539519 [CI:BUILD] rpm: remove gvproxy subpackage<br>
b0f7072ac [CI:DOCS] Tweak podman to Podman in a few farm man pages<br>
8afffa1aa Docs on sig-proxy are wrong, we support TTY<br>
4fca726f7 e2e: ExitCleanly(): low-hanging fruit, part 2<br>
64c46c429 e2e: ExitCleanly(): low-hanging fruit, part 1<br>
113b41b6f Buildtag out unix commands for common OS files<br>
57fbdc1c4 Merge pull request #20030 from edsantiago/bats_cleanup<br>
aec58f515 systests: clean up after tests; fix missing path in logs<br>
fa7150451 [CI:BUILD] followup PR for fcos with podman-next<br>
289e59ee1 Implement gvproxy networking using cmdline wrapper<br>
63219d617 Merge pull request #20016 from flouthoc/test-rmi-wo-layer<br>
5f3a5408e Merge pull request #20026 from ygalblum/quadlet-image-test-fixes<=
br>
e68e37136 fix, test: rmi should work with images w/o layers<br>
e9b98510d vendor: bump c/common to v0.56.1-0.20230919073449-d1d9d38d8282<br=
>
50a685bd1 Quadlet Image test - rearrange test function<br>
0293e643c Merge pull request #20022 from edsantiago/e2e_check_stderr__more<=
br>
e6cf09b68 e2e: continuing ExitCleanly() work: manual tweaks<br>
d78221545 e2e: continuing ExitCleanly() work<br>
c5851976b Merge pull request #20014 from vrothberg/containers.conf-env-host=
<br>
8434471a3 Merge pull request #20007 from rahilarious/main<br>
47160da7a [CI:DOCS] Improve podman-tag man page<br>
ef553fb0d [CI:DOCS] Improve podman-build man page<br>
364f989c4 Merge pull request #20005 from rhatdan/run<br>
1d7efcbe2 Merge pull request #19912 from ygalblum/quadlet-unit-image<br>
5e1b0ce0b Merge pull request #20017 from lsm5/main-release-process<br>
81ddf4886 Merge pull request #20012 from vrothberg/module-parsing<br>
5be2357a5 Merge pull request #19917 from afbjorklund/unix-url<br>
d41047c1c Merge pull request #20015 from edsantiago/xref_filter_no_asterisk=
s<br>
93dc30e1e [CI:DOCS] Include precheck to release process<br>
a80a908df [CI:DOCS] consistentize filter options in man pages<br>
55ca571e5 Quadlet - add support for .image units<br>
41beb5374 --env-host: use default from containers.conf<br>
0b7142f4a error when --module is specified on the command level<br>
d912e735a Merge pull request #19987 from edsantiago/xref_filters<br>
deba3b80a man page crossrefs: add --filter autocompletes<br>
5dc4370d9 Merge pull request #19911 from xtexChooser/xtex/impl-container-la=
bel-not<br>
03dd5f256 Fix specification of unix:///run<br>
98e6dda69 Add label! filter and tests to containers and pods<br>
3e4e39d1e Merge pull request #19984 from lsm5/main-release-notes<br>
d501d45c7 Merge pull request #19981 from containers/renovate/github.com-ope=
ncontainers-image-spec-1.x<br>
3f8f4946e Merge pull request #19979 from edsantiago/ci_trace_setup<br>
c361d076b Merge pull request #19960 from umohnani8/build-common<br>
348f9fe0d Merge pull request #19988 from baude/wslrmdashf<br>
04b85765e Merge pull request #19972 from baude/hypervenablee2e<br>
0728a10c6 Move podman build opts to common file<br>
e106d6e49 Merge pull request #19985 from TomSweeneyRedHat/dev/tsweeney/buil=
dahbump_1.32.0<br>
8a9f778e2 Add ability for machine rm -f for WSL<br>
919dce131 Plumbing to run machine tests with hyperv<br>
ade0c4932 CI: trace setup and runner scripts<br>
c37443e8b Bump to Buildah v1.32.0<br>
7c05595e3 Merge pull request #19980 from rhatdan/completions<br>
9b36f334d [CI:DOCS] bump release notes on main with the latest release<br>
cae110f8b fix(deps): update module <a href=3D"http://github.com/opencontain=
ers/image-spec" rel=3D"noreferrer" target=3D"_blank">github.com/opencontain=
ers/image-spec</a> to v1.1.0-rc5<br>
ae3e49f7e Merge pull request #19978 from edsantiago/e2e_check_stderr__more<=
br>
4a2a423df Add --filter pod=3D autocompletion<br>
075cf2254 e2e: ExitCleanly(): manual test fixes<br>
db5adca73 e2e: continuing ExitCleanly(): just the replacements<br>
3984b45b4 Merge pull request #19976 from plettich/patch-1<br>
33e565520 Merge pull request #19951 from Luap99/small-remote<br>
61b9a38bd Merge pull request #19956 from rhatdan/ulimit<br>
1e43fae5a Merge pull request #19873 from rst0git/update-checkpointctl<br>
d275203c5 Merge pull request #19973 from rhatdan/codespell<br>
c689fb4a5 Fix some spelling and formatting<br>
522e0f43f Add support for Ulimit in quadlet<br>
b1e3e8d97 Run codespell on code<br>
957523e62 Merge pull request #19969 from eriksjolund/rewrite-restart-md<br>
88b415e34 Merge pull request #19955 from rhatdan/quadlet<br>
dde06ae0b Merge pull request #19970 from containers/renovate/k8s.io-kuberne=
tes-1.x<br>
6b7f718b4 wire in new buildah build options<br>
f9aba28ca make golangci-lint happy<br>
c1b6effac add !remote tag to pkg/specgen/generate<br>
3acee29cf pkg/specgen: do not depend on libimage for remote<br>
2c2299ad8 bump buildah to latest<br>
bf86ed72c [CI:DOCS] restart.md: migrate to container unit<br>
18561f26a Merge pull request #19958 from ryanhockstad/main<br>
e3ea6bf2f Merge pull request #19954 from edsantiago/e2e_check_stderr__diff<=
br>
304b22729 fix(deps): update module <a href=3D"http://k8s.io/kubernetes" rel=
=3D"noreferrer" target=3D"_blank">k8s.io/kubernetes</a> to v1.28.2<br>
4ed3273f6 Add support for PidsLimit in quadlet<br>
883612eff Merge branch &#39;containers:main&#39; into main<br>
7d6722bd6 Merge pull request #19957 from edsantiago/e2e_check_stderr__creat=
e<br>
9554022ce Merge pull request #19959 from edsantiago/e2e_check_stderr__more<=
br>
70560f916 Add DNS fields to Container and Network unit groups<br>
a0b413862 Merge pull request #19965 from Luap99/api-4.6<br>
777b5efa4 [CI:DOCS] update API docs version list<br>
7b9114023 Try to fix broken CI (gvisor-something)<br>
df011f437 e2e: more ExitCleanly(): manual test fixes<br>
cb1cb338c e2e: more ExitCleanly(): dumb string replacements<br>
62ac96e12 e2e: create_test: use ExitCleanly()<br>
b0f77acd1 e2e: diff_test: use ExitCleanly()<br>
e8c4d7966 Merge pull request #19952 from mheon/init_cannot_modify<br>
89d951aa9 Merge pull request #19948 from edsantiago/e2e_check_stderr__more<=
br>
f0557a27d Merge pull request #19932 from lsm5/podmansh-timeout<br>
c1703f7b5 Merge pull request #19950 from Luap99/vendor-common<br>
5920bfa2e The `podman init` command cannot modify containers.<br>
639a1a029 bump c/common to latest main<br>
806c5de12 Podmansh: use podmansh_timeout<br>
eefaa512a e2e: more ExitCleanly(): low-hanging fruit<br>
6f4f94137 Add test for legacy address without two slashes<br>
7da91addc Merge pull request #19579 from danishprakash/generate-daemonset-s=
upport<br>
91f3f3a52 Merge pull request #19924 from edsantiago/e2e_check_stderr__commi=
t<br>
9b17d6cb0 vendor: update checkpointctl to v1.1.0<br>
cdcf18b86 kube: add DaemonSet support for generate<br>
e9673502e Merge pull request #19929 from rhatdan/VENDOR<br>
22003cbb8 Merge pull request #19923 from edsantiago/e2e_check_stderr__clean=
up<br>
75b4679a7 vendor of containers/(common, storage, image)<br>
cbb955811 Merge pull request #19245 from mheon/fix_19237<br>
5e8c75e4a Merge pull request #19926 from edsantiago/e2e_check_stderr__clone=
<br>
325736fcb Merge pull request #19914 from umohnani8/term<br>
fd886d657 Merge pull request #19927 from giuseppe/move-oom-clamp-at-start-t=
ime<br>
19bd9b33d libpod: move oom_score_adj clamp to init<br>
4f017236e e2e: commit_test: use ExitCleanly()<br>
3a4be5e90 e2e: container_clone_test.go: use ExitCleanly()<br>
8cb14e54a e2e: use ExitCleanly() in cleanup_test.go<br>
925794c6a Ensure HC events fire after logs are written<br>
adc45ef88 Merge pull request #19916 from eriksjolund/fix-docs-podman-system=
d-unit-equivalents<br>
336055fe3 Use url with scheme and path for the unix address<br>
65a64da27 [CI:DOCS] podman-systemd.unit: fix equivalents<br>
8acd66c11 Merge pull request #19888 from giuseppe/fix-pod-lifecycle<br>
d9a85466a Add support for kube TerminationGracePeriodSeconds<br>
8d37db75a Merge pull request #19910 from Daskan/main<br>
51d01dd38 Merge pull request #19907 from n1hility/breakout-altbuild<br>
5eb0a53a0 Update <a href=3D"http://podman-kube-play.1.md.in" rel=3D"norefer=
rer" target=3D"_blank">podman-kube-play.1.md.in</a><br>
92bdd912b Merge pull request #19891 from edsantiago/run_rmi_warn<br>
745201ea2 Merge pull request #19902 from giuseppe/fix-pod-run-with-mounts<b=
r>
c2cd93cdc Split up alt binaries to speed up build<br>
7bf9f302a Switch installer task to EC2<br>
ab5ca5b69 Merge pull request #19895 from edsantiago/ci_test_skipper_fix<br>
fbbad0439 pod: fix duplicate volumes from containers.conf<br>
0c75eac63 tests: add test for pod cgroups<br>
b8f6a12d0 libpod: create the cgroup pod before containers<br>
331b3c216 cmd, specgen: allow cgroup resources without --infra<br>
83334fb4e specgen: allow --share-parent with --infra=3Dfalse<br>
5de8f4aba libpod: allow cgroup path without infra container<br>
5121c9eb0 libpod: check if cgroup exists before creating it<br>
38209ef49 libpod: refactor platformMakePod signature<br>
627ac1c96 libpod: destroy pod cgroup on pod stop<br>
9a347619d utils: export MoveUnderCgroup<br>
556db46a6 libpod: refactor code to new function<br>
f8e1ec731 Merge pull request #19897 from edsantiago/e2e_check_stderr_checkp=
oint<br>
7524753ef Merge pull request #19896 from baude/issue17019<br>
6ee8f73d4 Merge pull request #19885 from rhatdan/kube<br>
5d6ec27e9 Merge pull request #19892 from edsantiago/StopSignal_default_name=
<br>
65bddfcd2 e2e: use ExitCleanly() in checkpoint tests<br>
479680232 [CI:DOCS]Remove use of --latest|-l from tutorial<br>
afeab39d1 CI test runner: upgrade tests rely on system tests<br>
c0d36b8ab Merge pull request #19894 from edsantiago/urgent_ci_fix<br>
59bd6a74a run --rmi: &quot;cannot remove&quot; is a warning, not an error<b=
r>
70cf9740f StopContainer: display signal num when name unknown<br>
6f913f5f3 URGENT: fix broken CI<br>
e546aebb3 Merge pull request #19889 from vrothberg/restart-kill<br>
0c72726f0 Merge pull request #19878 from edsantiago/bats_check_stderr<br>
16f2dd36b Merge pull request #19887 from rhatdan/kube1<br>
b83485022 Add support for kube=C2=A0 securityContext\.procMount<br>
589867d71 podman: don&#39;t restart after kill<br>
2d7d8d1d1 Tmpfs should not be mounted noexec<br>
c2575f726 sys tests: run_podman: check for unwanted warnings/errors<br>
c17c190f8 Merge pull request #19882 from edsantiago/e2e_exitcleanly<br>
24e9e946c Merge pull request #19883 from containers/renovate/setuptools-68.=
x<br>
1211518e8 chore(deps): update dependency setuptools to ~=3D68.2.0<br>
465150f10 e2e: use ExitCleanly() in attach &amp; build tests<br>
c11ac807f Merge pull request #19759 from rhatdan/docs<br>
27495981c Some distros do not default to <a href=3D"http://docker.io" rel=
=3D"noreferrer" target=3D"_blank">docker.io</a> for shortname searches<br>
af17ddaee Merge pull request #19871 from giuseppe/accept-empty-capabilities=
<br>
2806378c1 Merge pull request #19872 from edsantiago/systest_fix_eaddrinuse<=
br>
74a7d61f5 Merge pull request #19869 from containers/renovate/github.com-cyp=
har-filepath-securejoin-0.x<br>
30abd7f1a security: accept empty capabilities list<br>
c32cfb1d0 systests: random_free_port: fix EADDRINUSE flake<br>
3e5b28b1d Merge pull request #19867 from siretart/siretart/tests/fcos<br>
f14360f70 Merge pull request #19863 from mheon/fix_18874<br>
d7b7b2083 Merge pull request #19866 from containers/renovate/github.com-con=
tainers-libhvee-digest<br>
3c0728df3 Merge pull request #19865 from containers/renovate/github.com-doc=
ker-docker-24.x<br>
1004f53d0 Merge pull request #19864 from containers/renovate/golang.org-x-t=
ools-0.x<br>
a5798e9f5 fix(deps): update module <a href=3D"http://github.com/cyphar/file=
path-securejoin" rel=3D"noreferrer" target=3D"_blank">github.com/cyphar/fil=
epath-securejoin</a> to v0.2.4<br>
14735f172 Merge pull request #19862 from containers/renovate/golang.org-x-n=
et-0.x<br>
dbfc3e7e0 Restrict fcos_test to amd64, arm64<br>
7b2fc5f8d fix(deps): update <a href=3D"http://github.com/containers/libhvee=
" rel=3D"noreferrer" target=3D"_blank">github.com/containers/libhvee</a> di=
gest to 56fb235<br>
2aec77f1f Merge pull request #19861 from edsantiago/manifest_test_cleanup<b=
r>
0a913d578 fix(deps): update module <a href=3D"http://github.com/docker/dock=
er" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> to v2=
4.0.6+incompatible<br>
f9fd40221 fix(deps): update module <a href=3D"http://golang.org/x/tools" re=
l=3D"noreferrer" target=3D"_blank">golang.org/x/tools</a> to v0.13.0<br>
52e1acf86 Merge pull request #19850 from containers/renovate/actions-checko=
ut-4.x<br>
71549c642 Ignore spurious container-removal errors<br>
e5bf0f96d fix(deps): update module <a href=3D"http://golang.org/x/net" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/net</a> to v0.15.0<br>
fdf694fcf systests: manifest zstd test: lots of tiny cleanups<br>
0e3b492fa Merge pull request #19849 from giuseppe/increase-inotify-watchers=
<br>
8914caf47 Merge pull request #19843 from giuseppe/clamp-oom-score-adj<br>
203c2b815 Merge pull request #19854 from giuseppe/bump-runc-to-main<br>
9730c0373 vendor: update <a href=3D"http://github.com/opencontainers/runc" =
rel=3D"noreferrer" target=3D"_blank">github.com/opencontainers/runc</a> to =
main<br>
e825bd5d5 [skip-ci] Update actions/checkout action to v4<br>
8b4a79a74 linux, rootless: clamp oom_score_adj if it is too low<br>
681b6db3f machine: increase max number of inotify instances<br>
9bcab496e Merge pull request #19835 from Juneezee/refactor/redundant-nil-ch=
eck<br>
8f7453f9c Merge pull request #19840 from containers/renovate/golang.org-x-t=
erm-0.x<br>
302d15334 fix(deps): update module <a href=3D"http://golang.org/x/term" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> to v0.12.0<br>
d58fe4e68 Merge pull request #19837 from containers/renovate/golang.org-x-t=
ext-0.x<br>
d6b538a79 Merge pull request #19836 from containers/renovate/golang.org-x-s=
ys-0.x<br>
6f43c9f10 Merge pull request #19833 from containers/renovate/github.com-con=
tainers-libhvee-digest<br>
f094884c1 Remove redundant nil checks in system connection remove<br>
17037af48 fix(deps): update module <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> to v0.13.0<br>
1361fa230 Merge pull request #19820 from ashley-cui/gvproxytest<br>
1d51cd14a fix(deps): update module <a href=3D"http://golang.org/x/sys" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/sys</a> to v0.12.0<br>
f542d21a7 fix(deps): update <a href=3D"http://github.com/containers/libhvee=
" rel=3D"noreferrer" target=3D"_blank">github.com/containers/libhvee</a> di=
gest to 2bf7930<br>
ab579a90a Merge pull request #19831 from noritada/fix/readme-broken-link<br=
>
7cde6ab52 Merge pull request #19477 from lsm5/copr-rpm-fcos<br>
d4fedb288 docs(readme): fix a broken link<br>
50cd072bf [CI:BUILD] Podman FCOS image from main<br>
99a5347c6 Merge pull request #19816 from giuseppe/fix-parsing-base<br>
3033f1e9e Merge pull request #19826 from containers/renovate/golang.org-x-e=
xp-digest<br>
58a0b7ac8 Update <a href=3D"http://golang.org/x/exp" rel=3D"noreferrer" tar=
get=3D"_blank">golang.org/x/exp</a> digest to d852ddb<br>
66fa48af4 Merge pull request #19804 from nishipy/ja_index<br>
fe7bafb83 Add port forwarding and gvproxy machine test<br>
c2f34ed86 Merge pull request #19818 from testwill/typo<br>
702709a91 libpod: do not parse --hostuser in base 8<br>
13342e503 fix: default typo<br>
77fe460d1 Merge pull request #19805 from vrothberg/fix-19801<br>
779bc4996 Merge pull request #19802 from edsantiago/e2e_exit_cleanly_matche=
r<br>
3a6fc8d2b Add Japanese locale and translation of index<br>
9320efe0b Merge pull request #19814 from lsm5/remove-rhcontainerbot-email<b=
r>
2194bd098 Merge pull request #19812 from baude/hypervciprep<br>
e5ab4fbc5 Merge pull request #19810 from edsantiago/bats_cleanup<br>
bb9256a39 Merge pull request #19808 from zeehio/minor-doc-fixes<br>
bd7579a62 Merge pull request #19806 from vrothberg/vendor-common<br>
4051a8a23 Merge pull request #19790 from flouthoc/conf_add_compression<br>
39c5b7fac remove <a href=3D"mailto:rh.container.bot@gmail.com" target=3D"_b=
lank">rh.container.bot@gmail.com</a><br>
a62abfe3d Tweaks and cleanups to prepare hyperv for CI<br>
a0738e7e6 system tests: housekeeping: various small fixes<br>
4082b67f6 CI: e2e: first use of new ExitCleanly() matcher<br>
6cbd17c0f CI: e2e: new ginkgo matcher, ExitCleanly()<br>
da1246d58 CI: e2e: fetch the standard system-test image<br>
d20b5869f kube play: fix pull policy<br>
18d35b612 Fix gidmap command in example<br>
e66c04c1f vendor containers/common@12405381ff45<br>
e73e585f5 Merge pull request #18713 from zeehio/feat-gidmap-improvements<br=
>
8114923fd Merge pull request #19794 from baude/remoteusername<br>
16f6d6a23 Merge pull request #19784 from Jared-Sprague/troubleshooting-fuse=
<br>
b95ae3b4a manifest,push: support add_compression from containers.conf<br>
1085177fe hyperv ignition: use gvforwarder instead of vm<br>
2a8e6acec Set remote username earlier for hyperv<br>
26cefcbf9 Added an additional troubleshooting problem and solution<br>
29f4572f9 Merge pull request #19783 from mtrmac/ManifestListData-no-deps<br=
>
94969a063 Merge pull request #19768 from chnrxn/patch-1<br>
666c1167b Merge pull request #19780 from cevich/remove_multiarch_cron<br>
a3c2d6ad2 Remove a dependency on libimage from pkg/bindings<br>
b4aed53ea Merge pull request #19782 from mtrmac/specgen-duplicate-inspect<b=
r>
28ad5a32f Merge pull request #19781 from mtrmac/api-handlers-types-no-impl<=
br>
ed819d4cc Merge pull request #19785 from yylyyl/main<br>
f1c24df4f Rename parameter in pkg/bindings<br>
259ab8594 Remove a dependency on libimage from pkg/api/handlers<br>
4cac1d3bc Don&#39;t re-inspect an image<br>
99834947d Cirrus: Remove multi-arch podman image builds<br>
91b8bc7f1 uid/gid mapping flags<br>
18c2a2be8 [DOC] Clarify default behaviour on uidmap<br>
f83ca0490 Merge pull request #19754 from baude/updatelibhvee<br>
8bda49608 Merge pull request #19696 from Luap99/api-stream-format<br>
341fb14e7 Merge pull request #19774 from containers/renovate/github.com-vba=
uerster-mpb-v8-8.x<br>
ef4ca8b2f Merge pull request #19762 from ygalblum/kube-support-list<br>
4d2fe27b1 Merge pull request #19777 from baude/updatecommon<br>
5c1760a2b Merge pull request #19775 from edsantiago/another_kube_play_logs_=
race<br>
60e3b5ef1 Update containers/common to latest<br>
fe3c4562f update libhvee<br>
dd2ec7c61 Merge pull request #19640 from flouthoc/force-compression<br>
1b45fd723 /_ping handler: return OSType http header<br>
2dbb0b096 e2e: fix race condition (kube play + logs)<br>
44986f5b1 Merge pull request #19760 from giuseppe/print-stderr-only-after-c=
hecking-state<br>
fe11db1e8 Update module <a href=3D"http://github.com/vbauerster/mpb/v8" rel=
=3D"noreferrer" target=3D"_blank">github.com/vbauerster/mpb/v8</a> to v8.6.=
0<br>
009ff3af6 Merge pull request #19769 from vrothberg/fix-19711<br>
7ef97fa49 Kube - support List documents<br>
346e5e52e kube down/play --replace: handle absent objects<br>
0938ee189 push, manifest-push: --force-compression must be true with --comp=
ression-format<br>
92c588068 Merge pull request #19666 from ashley-cui/testinit<br>
6ed4df964 Merge pull request #19758 from wehagy/good-doc-is-an-updated-doc<=
br>
4b347609d oci: print stderr only after checking state<br>
461230c49 Updated docs to reflect pod spec sysctls support added in v4.6<br=
>
f521fd284 Merge pull request #19753 from martinpitt/revdeps-adjustments<br>
b8146a8a2 [CI:BUILD] Packit: Disable unexpected journal message check for c=
ockpit-podman<br>
a6f2f5854 [CI:BUILD] Packit: Restrict cockpit tests to recent Fedoras<br>
b6b300c79 Update machine init/set tests<br>
da81bc13a Add rootful status to machine inspect<br>
4ff21cf1a Merge pull request #19568 from umohnani8/infra-name<br>
c3ac109f1 Merge pull request #19734 from baude/acquireimage<br>
e916b4e37 Merge pull request #19714 from rhatdan/umask<br>
584c1e70d Merge pull request #19704 from rhatdan/timeout<br>
c2bb278a1 Merge pull request #19741 from edsantiago/wait_for_file_content<b=
r>
15d2ef84c Merge pull request #19644 from vrothberg/server-notify<br>
be380461e Merge pull request #19705 from n1hility/shared-bind-mnts<br>
b3439584f Merge pull request #19736 from cevich/stop_hello_multiarch_build<=
br>
d3618719b Dedup and refactor image acquisition<br>
adf34cbd7 Share podman sock bindings with other WSL distros<br>
db95e678a Fix user-mode validation check<br>
d898ae7f9 system tests: try to fix sdnotify flakes<br>
ecf9f9fd8 Cirrus: Disable only hello multiarch build<br>
0322b9df9 Merge pull request #19733 from edsantiago/registry_282<br>
7661ebbc6 Merge pull request #19500 from martinpitt/tmt-revdeps-cockpit-pod=
man<br>
f32e954b8 Set StopTimeout for service-container started under podman kube p=
lay<br>
d2ec127c1 Set StopTimeout for compat API if not set by client<br>
6f284dbd4 podman exec should set umask to match container<br>
2c5c2d213 [CI:BUILD] Packit: run cockpit-podman tests in PRs<br>
32f7bb131 Merge pull request #19727 from vrothberg/fix-19715<br>
52ed7fce2 Add infra-name annotations to kube gen/play<br>
6009d16b5 Merge pull request #19732 from containers/renovate/k8s.io-kuberne=
tes-1.x<br>
6545529df Merge pull request #19725 from containers/renovate/github.com-ons=
i-ginkgo-v2-2.x<br>
a5f6a4a3b kube: notifyproxy: close once<br>
7a94f8c12 system service: unset NOTIFY_SOCKET<br>
638f994c2 Update module <a href=3D"http://k8s.io/kubernetes" rel=3D"norefer=
rer" target=3D"_blank">k8s.io/kubernetes</a> to v1.28.1<br>
7c9c96981 API attach: return vnd.docker.multiplexed-stream header<br>
60e58f059 test/apiv2/<a href=3D"http://60-auth.at" rel=3D"noreferrer" targe=
t=3D"_blank">60-auth.at</a>: use `<a href=3D"http://doesnotexists.podman.io=
" rel=3D"noreferrer" target=3D"_blank">doesnotexists.podman.io</a>`<br>
61dd7f80c e2e tests: use registry:2.8.2 (was 2.8)<br>
243f365aa create apiutils package<br>
c5b4eb943 api docs: document stream format<br>
4d5bef98f Merge pull request #19730 from edsantiago/you_say_hello_and_i_say=
_goodbye<br>
70f77efef Revert &quot;Remove `hello` multi-arch image build&quot;<br>
82bd56be7 manifest-push: add support for --force-compression<br>
469ace091 push: add support for --force-compression<br>
202cc433a Update module <a href=3D"http://github.com/onsi/ginkgo/v2" rel=3D=
"noreferrer" target=3D"_blank">github.com/onsi/ginkgo/v2</a> to v2.12.0<br>
7c0e92682 Merge pull request #19719 from cevich/stop_building_hello<br>
c07f46e15 Merge pull request #19630 from rhatdan/kube<br>
7e0130f75 Remove `hello` multi-arch image build<br>
f29986178 Merge pull request #19710 from vrothberg/df-benchmarks<br>
1b0e64a10 hack/perf/system-df.sh: add `df` benchmarks<br>
7f6bcbba8 Merge pull request #19709 from vrothberg/vendor-storage<br>
d22c33628 Merge pull request #19707 from sstosh/cgroupv1-limit-ignore<br>
148d95d8d Expand env variables for cmds/entrypoint with format $(ENV)<br>
a9c98770e Merge pull request #19557 from n1hility/automatic-ports<br>
2978addf7 Merge pull request #19703 from baude/stopgvproxyfixups<br>
e092f887f vendor c/storage@6902c2d<br>
c416e4576 Ignore the resource limits on cgroups V1 rootless systems<br>
9e680cbc6 Fixups for stopping gvproxy<br>
7bd60867d Merge pull request #19700 from cevich/remove_lock_test<br>
21c9517b5 Revert &quot;GHA: Closed issue/PR comment-lock test&quot;<br>
5e295a940 Merge pull request #19691 from cevich/lock_closed_issues<br>
260adf567 Merge pull request #19695 from vrothberg/auto-update-docs<br>
f0e8e79c9 GHA: Closed issue/PR comment-lock test<br>
5477fd38a GHA: Add workflow to lock closed issues/PRs<br>
75ce47347 [CI:DOCS] update auto-update docs<br>
f38668e32 Merge pull request #19622 from jakecorrenti/umask-on-play<br>
8354be9cf Merge pull request #19683 from lsm5/main-spdx-license<br>
960b3960f Merge pull request #19689 from containers/renovate/github.com-goo=
gle-uuid-1.x<br>
1bb96a87c Merge pull request #19687 from dfr/freebsd-netstat<br>
8295bbced Merge pull request #19690 from containers/renovate/major-ci-vm-im=
age<br>
f727428b5 Merge pull request #19663 from rhatdan/ramfs<br>
5a6515c6e Merge pull request #19684 from containers/renovate/golangci-golan=
gci-lint-1.x<br>
85d0df330 chore(deps): update dependency containers/automation_images to v2=
0230816<br>
bc35e28c0 fix(deps): update module <a href=3D"http://github.com/google/uuid=
" rel=3D"noreferrer" target=3D"_blank">github.com/google/uuid</a> to v1.3.1=
<br>
3d00744d2 libpod: sum per-interface network stats for FreeBSD<br>
5eee8825e Set default Umask for `podman kube play`<br>
375eb045c Merge pull request #19661 from dfr/freebsd-var-run<br>
30ec94fea Merge pull request #19670 from lsm5/rpm-dep-man<br>
ef8f4db81 [CI:BUILD] rpm: spdx compatible license field<br>
e9539768c chore(deps): update dependency golangci/golangci-lint to v1.54.2<=
br>
63a8926e9 Implement automatic port reassignment on Windows<br>
45ce4834a Add support for ramfs as well as tmpfs in volume mounts<br>
93f194cfb Merge pull request #19676 from rhatdan/pod<br>
84447c085 Merge pull request #19677 from n1hility/detect-old-wsl<br>
bdc304058 Validate current generation of WSL2 with user-mode-networking<br>
67756ac60 use container restart policy if user specifies one<br>
20f28e538 Merge pull request #19516 from baude/stopgvproxy<br>
884e5f693 Merge pull request #19668 from ashley-cui/teststart<br>
a161e8b7d Merge pull request #19667 from ashley-cui/testrm<br>
062511df9 Merge pull request #19669 from ashley-cui/testlist<br>
0772d8ddb Stop gvproxy on hyperv machine stop<br>
50136ea86 [CI:BUILD] rpm: depend on man-db<br>
36e09f18b Update machine list test<br>
8b2990131 Update machine start tests<br>
c3dbfa9a1 Update machine rm tests<br>
938a3e160 Merge pull request #19635 from Luap99/utf8-log-tag<br>
c726cf810 libpod: improve conmon error handling<br>
ed1f514d5 cirrus setup: install en_US.UTF-8 locale<br>
8f85aaf07 fixup &quot;podman logs with non ASCII log tag&quot; tests<br>
27b41f087 libpod: use /var/run instead of /run on FreeBSD<br>
9b4f1cdb9 cirrus/lib.sh: extend env to passthrough at start for locale work=
<br>
ff66f31dd libpod: correctly pass env so alternative locales work<br>
e0b8178ad Merge pull request #19656 from jontte75/fix-resource-leak-in-linu=
x<br>
29c298856 cgroups_linux: use SessionBusPrivateNoAutoStartup<br>
53b2b0222 Merge pull request #19648 from edsantiago/scrap_icmp_test<br>
3c6d800b2 Merge pull request #19647 from rhatdan/podmansh<br>
e163e2688 Merge pull request #19618 from PeterWhittaker/main<br>
4ae71e0d8 Merge pull request #19582 from arixmkii/gvproxy-0.7.0<br>
f559fc55b Merge pull request #19567 from vrothberg/RUN-1873<br>
6062a64ea Merge pull request #19643 from dfr/freebsd-readonly<br>
c1c0b4a03 Merge pull request #19641 from christian-2/issue-18387<br>
362747cfa podmansh man page UID=3D$(id -u lockedu) is not allowed<br>
e38cf33a6 CI: systests: remove pasta ICMP tests<br>
7103fdb3f <a href=3D"http://podman.1.md" rel=3D"noreferrer" target=3D"_blan=
k">podman.1.md</a>: Fix formatting of exit code 127, clarify wording of `ex=
it code` example.<br>
896cab612 document available secret drivers<br>
53dd37cc4 pkg/specgen: add support for read-only root on FreeBSD<br>
d5841ed52 add --module flag<br>
9cd428692 Merge pull request #19596 from baude/allowdownload<br>
7836401c8 Merge pull request #19626 from michalbiesek/feat-riscv64-support<=
br>
464e97f65 Merge pull request #19638 from containers/renovate/setuptools-68.=
x<br>
8326c81db Merge pull request #19627 from containers/renovate/github.com-con=
tainers-ocicrypt-1.x<br>
6a3f09e8a Update dependency setuptools to ~=3D68.1.0<br>
c8b7c7730 Merge pull request #19624 from TomSweeneyRedHat/dev/tsweeney/fixb=
uildmd<br>
0e37599e8 Merge pull request #19621 from edsantiago/manifest_quay<br>
1d5890bcd Add riscv64 architecture to the cross build target<br>
252f51de8 GetFcosArch add `riscv64` arch<br>
98e7d7af0 Update WSL backend to be compat with FCOS defaults<br>
9e14e3ebe enabled hyperv image downloads<br>
3e2e360b9 fix(deps): update module <a href=3D"http://github.com/containers/=
ocicrypt" rel=3D"noreferrer" target=3D"_blank">github.com/containers/ocicry=
pt</a> to v1.1.8<br>
abd35d4d3 [CI:DOCS] Fix git build example in build page<br>
3e8f19be9 Merge pull request #19619 from cevich/remove_ec2_experimental<br>
0c52d1004 CI: e2e manifest_test: use image from quay<br>
c742ec6fe Merge pull request #19617 from edsantiago/sphinx_ignore<br>
824c76616 Merge pull request #19591 from matejvasek/fix-build-pull-compat<b=
r>
31dc42224 Cirrus: Remove EC2 experimental flag<br>
1c37acceb Merge pull request #19613 from PeterWhittaker/main<br>
4c7546cb3 sphinx: skip options include dir<br>
6727644b1 Merge pull request #19595 from Luap99/top-output-flake<br>
345b9b029 Update rootfs.md: Fix formatting and wording of idmap option<br>
f33b01b73 fix: Docker API compatible bool deserialization<br>
4cb2d48ca Revert &quot;compat,build: pull must accept string&quot;<br>
0b612a9a2 Merge pull request #19576 from edsantiago/logpartial_flake<br>
2487ea439 Merge pull request #19587 from cevich/kill_bench_job<br>
de6bdd190 Merge pull request #19152 from geichelberger/add-host-gateway-sup=
port<br>
615a9cf29 Merge pull request #19598 from containers/renovate/golangci-golan=
gci-lint-1.x<br>
84bd6c71f Merge pull request #19607 from wjt/performance-machinectl-shell<b=
r>
79d87f467 Merge pull request #19599 from ashley-cui/rel<br>
68bd81470 Add missing verb in machinectl example<br>
6ab38e55e Merge pull request #19589 from lsm5/main-packit<br>
78d6cd4c9 [CI:DOCS] Update Release Notes and Release Process<br>
b6349017a chore(deps): update dependency golangci/golangci-lint to v1.54.1<=
br>
4b80492bd fix podman top missing output flake<br>
5908999e6 New partial-line test is flaking<br>
555b4f930 [CI:BUILD] Packit: add back fedora-eln targets<br>
f0dac3677 Cirrus: Prune defunct job + fix noop alias<br>
a60bafea4 Merge pull request #19573 from edsantiago/env-tests<br>
14e290a30 Merge pull request #19358 from umohnani8/buildfarm-2<br>
970976a7f Merge pull request #19503 from edsantiago/journalctl_unreliable<b=
r>
1947f035c Bump bundled gvproxy to 0.7.0<br>
df28df1ae systests: tests for --env and --env-file<br>
bcebcad1f Update system connection add &amp; remove<br>
310f971fc Add tests for podman farm<br>
dce3ef3c4 Add podman farm update command<br>
44a704dfc Add podman farm remove command<br>
59a8140f1 Add podman farm list command<br>
6fcdf1a19 Add podman farm create command<br>
1d5ef29f0 Add podman farm subcommand<br>
23d5b5008 CI: e2e: add delay before podman logs or journalctl<br>
c01ec25e6 Merge pull request #19564 from containers/renovate/golangci-golan=
gci-lint-1.x<br>
1e6c73f59 Merge pull request #19562 from Luap99/logs-tail<br>
2951316b2 Add completion for Farms<br>
b672ddc79 Vendor c/common changes<br>
3963c5639 chore(deps): update dependency golangci/golangci-lint to v1.54.0<=
br>
57fac93b3 Merge pull request #19560 from BlackHole1/fix<br>
a55c2636d file logger: fix podman logs --tail with partial lines<br>
7adc58ffb Merge pull request #19547 from containers/renovate/dawidd6-action=
-send-mail-3.x<br>
eb465b40c Merge pull request #19549 from rhatdan/quadlet<br>
7ce654fea fix(env): parsing --env incorrect in cli<br>
6f92c59bc Merge pull request #19559 from containers/renovate/docker.io-libr=
ary-golang-1.x<br>
4c4bc0922 Update <a href=3D"http://docker.io/library/golang" rel=3D"norefer=
rer" target=3D"_blank">docker.io/library/golang</a> Docker tag to v1.21<br>
d4f967c19 Merge pull request #19541 from containers/renovate/major-ci-vm-im=
age<br>
195f1be89 Merge pull request #19371 from danishprakash/daemonset-support<br=
>
f55c48ad3 podman stop --cidfile missing --ignore<br>
331d618a8 Merge pull request #19543 from martinpitt/packit-temp-copr<br>
7ef03517f Skip podman exec cannot be invoked on Debian<br>
95ceacefb Re-enable checkpoint test on Debian SID<br>
c193dbd94 Require a non-generic reason for non-Fedora skip<br>
d79e3a23d CI FIXME removal/update.<br>
5ec856652 Update dependency containers/automation_images to v20230807<br>
1899d2121 Merge pull request #19544 from NitrogenUA/build-docs<br>
7988dd82c [skip-ci] Update dawidd6/action-send-mail action to v3.8.0<br>
c13b403c0 Merge pull request #19534 from giuseppe/cp-close-tmp-file<br>
406c48053 Merge pull request #19533 from hangscer8/fix_waitPidStop_timer<br=
>
8a410784b [CI:DOCS] fixed couple typos in build docs<br>
cc31ac4b0 Merge pull request #19530 from mheon/fix_19529<br>
2f50d8e57 Merge pull request #19425 from rhatdan/service<br>
282594e58 Stop timer in function waitPidStop<br>
7c0bccaf7 packit: Build PRs into default packit COPRs<br>
2e97c6616 Merge pull request #19537 from ygalblum/quadlet-network-doc<br>
afaeedef7 Add support for host-gateway<br>
2de22ebf0 Ensure volumes-from mounts override image volumes<br>
f6c2be918 Merge pull request #19539 from cevich/minor_gha_updates<br>
03d7a5120 Minor: Include shasums in GHA workflow artifacts<br>
d63ac0652 Minor: Add important comment to windows GHA workflow<br>
9d7fe4e90 Minor: Update/fix dry-run input descriptions<br>
518daef72 [CI:DOCS] Quadlet - provide more information about network files<=
br>
b3a2ce3dc Merge pull request #19535 from edsantiago/manpage_dups<br>
d56b61ef4 Merge pull request #19532 from dfr/freebsd-build<br>
819129b0d man-page xref: check for duplicate entries<br>
39641482c cp: close temporary file on error path<br>
c04ead152 Merge pull request #19522 from containers/renovate/golang.org-x-n=
et-0.x<br>
c3cab7206 Merge pull request #19526 from HirazawaUi/fix-not-remove-tempfile=
<br>
018fdb48e Makefile: work around the lack of &#39;man -l&#39; on FreeBSD<br>
e9a3b7cfa Merge pull request #19531 from dfr/freebsd-kube<br>
0b7769fda Update module <a href=3D"http://golang.org/x/net" rel=3D"noreferr=
er" target=3D"_blank">golang.org/x/net</a> to v0.14.0<br>
ec5a9b9cc libpod: fix a crash in &#39;kube generate&#39; on FreeBSD<br>
23c5890f2 remove temporary files when copy [NO NEW TESTS NEEDED]<br>
eceae9da5 Merge pull request #19478 from dcermak/show-socket-exists<br>
38b20bda2 Merge pull request #19510 from baude/errorifkeyexists<br>
0ad376d92 Merge pull request #19514 from containers/renovate/golang.org-x-s=
ys-0.x<br>
78351cab8 Merge pull request #19509 from lsm5/main-version<br>
9e18e9faf Merge pull request #19414 from rhatdan/systemd<br>
fab62f816 Update module <a href=3D"http://golang.org/x/sys" rel=3D"noreferr=
er" target=3D"_blank">golang.org/x/sys</a> to v0.11.0<br>
1304162b1 Merge pull request #19512 from baude/userkeyswitch<br>
1384c30a9 Merge pull request #19501 from jakecorrenti/fix-machine-consolida=
tion-nits<br>
b46d72fec [ci] Remove the podman socket in remove_packaged_podman_files()<b=
r>
706c51b52 [ci] Correct the podman systemd file names<br>
dd4f47dd9 Always show RemoteSocket.Exists in json<br>
fc7c6efd3 Fail if ssh key exists<br>
69e883493 Fix regression for hyperv<br>
803a49da4 [CI:BUILD] Makefile: rpm target generates correct version<br>
1a63c1b23 Fix nits in #19480<br>
1e5453943 Add support for passing container stop timeout as -1 (infinite)<b=
r>
0fb5b3acf Merge pull request #19483 from dfr/freebsd-devices<br>
144098587 Merge pull request #19505 from eriksjolund/fix_issue_19462_remove=
_duplicate_lastup_from_man_page<br>
d50054f1e pkg/specgen: Add device support for FreeBSD<br>
f5058f148 [CI:DOCS] man: remove duplicate entry .LastUp<br>
84dec2234 Merge pull request #19494 from rhatdan/codespell<br>
92090d6ac Merge pull request #19310 from cgiradkar/fix_dash_t_flag<br>
0fb6708e5 Merge pull request #19495 from edsantiago/remove_useless_test<br>
a8974d4a3 CI: e2e: remove useless test<br>
53d44a65e Check tty flag to set default terminal in Env<br>
bde942e21 Merge pull request #19468 from flouthoc/manifest-add-compression<=
br>
62a22c5d6 Run codespell on code<br>
44f159ed3 Deprecate podman generate systemd<br>
7a2c5422e Merge pull request #19418 from cevich/dry_run_actions<br>
b427fe76b Merge pull request #19489 from ashley-cui/relnotes<br>
b8c9ad898 Merge pull request #19482 from rhatdan/rmi<br>
346f9cb4e manifest/push: add support for --add-compression<br>
ebf368dd6 Merge pull request #19484 from domdomegg/patch-2<br>
3b7ad61f6 Merge pull request #19488 from edsantiago/journald_race<br>
da8e29b04 Merge pull request #18612 from containers/renovate/major-ci-vm-im=
age<br>
8ccda1ee8 [CI:DOCS]Update Release Notes<br>
b91599742 CI: sys: quadlet %T test: do not rely on journal<br>
4d69f0146 GHA: Support testing build/sign workflows<br>
15f35d354 Remove unnecessary backslashes<br>
18e75daa5 [docs] Use code blocks for commands in podman-completion<br>
f3ebd798c Make podman run --rmi automatically set --rm<br>
cd5ce6372 Merge pull request #19406 from rhatdan/volumes<br>
e58136027 Merge pull request #19469 from vrothberg/fix-16054<br>
2252ed124 Merge pull request #19436 from rhatdan/remote<br>
8b7701f52 machine: QEMU: recover from failed start<br>
1656b93b8 Merge pull request #19480 from jakecorrenti/machine-duplicate-cod=
e<br>
74b7cdff4 Merge pull request #19479 from containers/renovate/golang.org-x-n=
et-0.x<br>
73df21bd9 Merge pull request #18982 from danishprakash/secret-rm-ignore<br>
49b8b971a vendor: bump c/image to v5.26.1-0.20230801083106-fcf7f0e1712a<br>
6d6dfbd48 Merge pull request #19472 from flouthoc/bump-common-image<br>
8844b98f7 Merge pull request #19475 from edsantiago/remove_registryfile_wor=
karound<br>
bfd2a8cad secret: add support for `--ignore` with rm<br>
21ebe0e90 Move `writeConfig` logic to shared function<br>
597ccff0b Move some logic of `setRootful` to a common file<br>
98cf8462a move `removeFilesAndConnections` to a common file<br>
75a8f13c4 Move `waitAPIAndPrintInfo` to common file<br>
55c7b5cec Move `addSSHConnectionsToPodmanSocket` code to shared file<br>
0489d3aa6 Update module <a href=3D"http://golang.org/x/net" rel=3D"noreferr=
er" target=3D"_blank">golang.org/x/net</a> to v0.13.0<br>
d74c225f4 chore(deps): update dependency containers/automation_images to v2=
0230726<br>
27d79e1fc Skip pasta local forwarder test on debian SID<br>
b69cd8d84 Skip broken/flaky blkio-weight test<br>
822f2f495 Skip tarball re-inport test in rawhide for CI<br>
851cd9cca Cleanup CIDFile on podman-remote run --rm command<br>
a237c3f46 CI: e2e: remove workaround for missing login file<br>
ee9fb3680 Merge branch &#39;main&#39; of github.com:containers/podman into =
volumes<br>
42ad0c6e7 vendor: bump c/image and c/common<br>
5b7dce8a3 Add support for confined users<br>
78b850c48 Cirrus: Temp. disable rawhide validation task<br>
def70012b Limit git-validation to &#39;short-subject&#39;<br>
33b8c451e Fix up man page and add test on globs<br>
608f484e9 Merge pull request #19417 from lsm5/main-packit<br>
850482b31 Move alternate image acquisition to separate function<br>
906af5bbc Move `getDevNullFiles` into a common file<br>
7d5f9de7a Merge pull request #19423 from rhatdan/man<br>
57aa4850f Merge pull request #19434 from rhatdan/userns<br>
843f663c8 Merge pull request #19460 from containers/renovate/github.com-dig=
italocean-go-qemu-digest<br>
a9948dafc Merge pull request #19455 from jakecorrenti/qemu-machine-funcs-to=
-methods<br>
0ecda592c Merge pull request #19350 from jakecorrenti/breakup-applehv-machi=
ne-funcs<br>
89f1fdc7f Update <a href=3D"http://github.com/digitalocean/go-qemu" rel=3D"=
noreferrer" target=3D"_blank">github.com/digitalocean/go-qemu</a> digest to=
 2e3d018<br>
dcb7f5e13 Merge pull request #19450 from cevich/use_stable_go<br>
d6847b19c Convert QEMU functions to methods with documentation<br>
0d21f8986 Merge pull request #19419 from Romain-Geissler-1A/remove-EOF-erro=
r-empty-context-with-podman-remote<br>
ad9015f47 Merge pull request #19096 from BlackHole1/support-new-line<br>
3ddde2023 Merge pull request #19413 from vrothberg/fix-19368<br>
30ad23e55 Merge pull request #19444 from Luap99/net-none-netns-path<br>
6930f39a6 Update docs/source/markdown/<a href=3D"http://podman-build.1.md.i=
n" rel=3D"noreferrer" target=3D"_blank">podman-build.1.md.in</a><br>
a52cefe6b Merge pull request #19431 from rhatdan/man1<br>
e1114f03c do not redefine gobuild for eln<br>
6b404759f Merge pull request #19422 from rhatdan/read-only<br>
39341f283 Set default userns from containers.conf file<br>
94743d4e7 Merge pull request #19451 from rhatdan/quadlet<br>
9e91873c2 Merge pull request #19435 from rhatdan/codespell<br>
4f1f88d7c Mention TimeoutStartSec in quadlet man page<br>
d351d47d4 Merge pull request #19449 from edsantiago/reenable_container_chec=
kpoint_tests<br>
ada71889c inspect with network=3Dnone show SandboxKey netns path<br>
93f4cc1b5 [CI:DOCS] GHA: Use stable go for Mac/Win builds<br>
ff7d287fc Breakup AppleHV machine funcs<br>
330e51960 Merge pull request #19364 from jakecorrenti/breakup-hyperv-machin=
e-funcs<br>
320fc6ca3 Merge pull request #19401 from jakecorrenti/fix-hyperv-load-from-=
json-name<br>
64873e322 Codespell fixups<br>
acbe7703f Update docs/source/markdown/<a href=3D"http://podman-stats.1.md.i=
n" rel=3D"noreferrer" target=3D"_blank">podman-stats.1.md.in</a><br>
0b7157e3b CI: e2e: reenable containerized checkpoint tests<br>
c67ef7c1a docs(env-file): improve document description<br>
4ee31dc37 Don&#39;t log EOF error when using podman --remote build with an =
empty context directory.<br>
f2794f9a8 API: kill: return 409 on invalid state<br>
170a78631 feat(env): support multiline in env-file<br>
19deb6a34 Adds documentation to new functions that were added<br>
481143e58 `startHostNetworking`: get DevNull files<br>
13da82466 `Remove`: remove network and ready sockets from registry<br>
d896431b2 `Remove`: remove files and connections<br>
32265e1f6 `Remove`: collect files to destroy<br>
381b103dd `Init`: read and split ign file<br>
aa6827a67 `Init`: write ign config<br>
cc30639d7 `Init`: add network and registry socks to registry<br>
78d3b549c `Init`: add SSH conns to podman sock<br>
630e7ba39 Improve the description of fields in podman-stats man page<br>
22a8b6886 make /dev &amp; /dev/shm read/only when --read-only --read-only-t=
mpfs=3Dfalse<br>
663fe9446 Mention no comment lines in Containerfile.in podman-build man pag=
e<br>
e973d15c3 [CI:BUILD] RPM: define gobuild macro for rhel/centos stream<br>
b6a52f1f8 Merge pull request #19333 from lsm5/conditionalize-gvproxy<br>
7c1406f82 Merge pull request #19399 from ashley-cui/cimac<br>
837bc2568 Fix HyperV loadMachineFromJSON function name<br>
7496cbf0b Merge pull request #19411 from vrothberg/qemu-locking<br>
4153e9756 Merge pull request #19302 from edsantiago/openqa<br>
416a471ee machine: QEMU: lock VM on stop/rm/set<br>
0afc1c6d8 Merge pull request #19412 from dfr/freebsd-pod-top<br>
bb57c1631 libpod: add &#39;pod top&#39; support on FreeBSD<br>
aef42c87c Merge pull request #19400 from eriksjolund/add_github_issue_type_=
questions<br>
e99289934 Merge pull request #19367 from dfr/freebsd-kube<br>
bd0fe69ca Merge pull request #19385 from jakecorrenti/breakup-qemu-config-f=
uncs<br>
538ac5dc8 Merge pull request #19309 from rhatdan/volumes<br>
f592c33fb [CI:DOCS] Build and Sign Mac Pkginstaller<br>
39ca4ac92 Merge pull request #19391 from rhatdan/authfile<br>
ef1fde310 Merge pull request #19392 from n1hility/fix-artifacts<br>
c10c2b67f Merge pull request #19396 from vrothberg/fix-18662<br>
f540bbffa Make sure users changes --authfile before checking<br>
8757fe88a github: add issue type as link to podman github discussions<br>
3523b9b05 Break QEMU `config.go` code into its own functions<br>
c341a0ffe machine: QEMU: lock VM on start<br>
afe8d5d84 libpod: fix &#39;podman kube generate&#39; on FreeBSD<br>
0fefcf8a4 Add glob support to podman run/create --mount<br>
cf1321f67 Merge pull request #19375 from rhatdan/mount<br>
f82f9baf9 Merge pull request #19378 from eriksjolund/socket_activation_incr=
ease_socat_timeout<br>
60a30d31e Merge pull request #19388 from edsantiago/quadlet_specifier_race<=
br>
66a829af5 Merge pull request #19387 from rhatdan/quadlet<br>
8aeb951c7 Merge pull request #19372 from vrothberg/un-defer-start-event<br>
d6815da8c kube: add DaemonSet support<br>
239a5b64a Fix artifacts script after removal of msitools msi build<br>
e335a66a9 System tests: quadlet: fix race in %T test<br>
d6a32a3da If quadlets have same name, only use first<br>
db0ba9b25 Add support for mounts listed in containers.conf<br>
6dda21984 Update vendor of containers/common<br>
b2a857a02 Merge pull request #19351 from edsantiago/gomd2man-local<br>
33891e8e9 System tests: add test tags<br>
5ba055937 [CI:DOCS] socket_activation.md: increase socat timeout<br>
dfec510b4 go-md2man: use vendored-in version, not system<br>
aa372ce22 Merge pull request #19281 from edsantiago/alternate_tmpdir<br>
eac1e947e Merge pull request #19374 from edsantiago/bogus_authfile_cleanup<=
br>
63a0d013a Merge pull request #19254 from boaz0/closes_19252<br>
a92bb3219 CI: use different TMPDIR on prior-fedora<br>
6894e2031 system tests: authfile-exists: minor cleanup<br>
85ab62042 Merge pull request #19348 from rhatdan/authfile<br>
d70f15cc0 start(): don&#39;t defer event<br>
970614708 Merge pull request #19353 from vrothberg/fix-6160<br>
de122bb44 Fix: use --all in podman stats to get all containers stats<br>
1f455cf61 Merge pull request #19320 from eriksjolund/remove_unnecessary_ple=
ase<br>
349d775de Verify authfile exists if user specifies it<br>
2a29fcb70 Merge pull request #19355 from dfr/freebsd-hc<br>
e0ef23955 libpod: don&#39;t generate errors for createTimer etc.<br>
42e44795b Merge pull request #19339 from dfr/validate-device<br>
0cfd12786 add &quot;healthy&quot; sdnotify policy<br>
890aa4bbc Merge pull request #19343 from afbjorklund/distro-name<br>
2a25d1d74 Merge pull request #19349 from n1hility/remove-old-msi<br>
22cb23b41 Merge pull request #19297 from vrothberg/RUN-1865<br>
0fac5123d Merge pull request #19316 from dcermak/spec-fixes<br>
cbc96a7b4 Remove LICENSE and general doc files that are installed by the ma=
in package<br>
37f0e9620 Add missing `<br>
2f21df7b3 Remove legacy msitools based msi installer<br>
3e6b99b4e Merge pull request #19341 from containers/renovate/github.com-doc=
ker-docker-24.x<br>
2a559dc1a Merge pull request #19230 from rhatdan/quadlet<br>
ac212605c Remove any quotes around distribution id<br>
5f90fbcdc Merge pull request #19312 from sg2342/freebsd-remote-top<br>
e596b17fb add a podman-compose command<br>
eee2817de pkg/specgen: Don&#39;t crash for device spec with...<br>
d2796c6c1 fix(deps): update module <a href=3D"http://github.com/docker/dock=
er" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> to v2=
4.0.5+incompatible<br>
b9383f41a Merge pull request #19265 from rhatdan/tmpfs<br>
03ea93c21 Merge pull request #19323 from eriksjolund/fix_language_typos_mar=
kdown_layout<br>
f4fbd6fd0 Update vendor of containers/(storage,image)<br>
d4fc66af9 Clean up /var/tmp/ when using oci-archives when creating=C2=A0 co=
ntainers<br>
ff97a208f Merge pull request #19314 from eriksjolund/use_quadlet_in_socket_=
activation_guide<br>
17496592e Merge pull request #19311 from jakecorrenti/breakup-qemu-machine-=
funcs<br>
adcc0ddad Merge pull request #19331 from umohnani8/play-docs<br>
0cc81193f Merge pull request #19315 from containers/renovate/github.com-ons=
i-gomega-1.x<br>
49257a3c5 [CI:BUILD] RPM: separate out gvproxy for copr and rawhide<br>
b57091ac9 Reduce qemu machine function sizes<br>
baf30e612 [CI:DOCS] migrate socket_activation.md to quadlet<br>
7314569cb [CI:DOCS] Update kube play volume support<br>
1da9cbe6a Merge pull request #19308 from ygalblum/quadlet-systest-quick-jou=
rnal<br>
730fa0aff Merge pull request #19328 from ygalblum/additional-debugging-note=
<br>
b5ce0ab2d Fix language, typos and markdown layout<br>
cb5450af7 [CI:DOCS] Add note about QUADLET_UNIT_DIRS to simplify quadlet de=
bug<br>
5dd8906e7 Merge pull request #19288 from IceWreck/quadlet-debugging-docs<br=
>
0bb73bf55 Add note on debugging quadlet unit files<br>
d4cfc498d Remove unnecessary use of the word &quot;please&quot;.<br>
a6a207673 libpod: fix FreeBSD &#39;podman-remote top&#39; default behaviour=
<br>
709beb6c0 fix(deps): update module <a href=3D"http://github.com/onsi/gomega=
" rel=3D"noreferrer" target=3D"_blank">github.com/onsi/gomega</a> to v1.27.=
9<br>
67f034068 Merge pull request #18830 from harikannan512/new-18032-2<br>
9b7de8d41 Merge pull request #19231 from ariasmn/trust-local-policy<br>
58dd5cbd1 Merge pull request #19262 from domdomegg/patch-1<br>
3e534eff9 Add support for ShmSize to quadlet<br>
87f5a15d6 Merge pull request #19306 from containers/renovate/github.com-con=
tainers-libhvee-0.x<br>
4b9f670ca Quadlet system test - force journald log driver for short lived c=
ontainers<br>
731bd7d94 fix(deps): update module <a href=3D"http://github.com/containers/=
libhvee" rel=3D"noreferrer" target=3D"_blank">github.com/containers/libhvee=
</a> to v0.4.0<br>
413552e10 quadlet recursively scan for unit files<br>
6156923d8 Merge pull request #19298 from mheon/tcp_is_insecure<br>
ce736413b Ensure that we appropriately warn that TCP is insecure<br>
4315611ad Merge pull request #19278 from edsantiago/manpage_table_check<br>
6ece09fea Merge pull request #19276 from edsantiago/quadlet_no_journal<br>
7974eb181 Merge pull request #19275 from jakecorrenti/since-volume-filter-s=
upport<br>
92d0233f5 Merge pull request #19249 from afbjorklund/decompress-progress<br=
>
558a70262 systests: quadlet: fixes for RHEL8<br>
a977c8281 Merge pull request #19284 from ygalblum/quadlet-kube-replace-jour=
nalctl<br>
99623184e Merge pull request #19261 from cgiradkar/podman_inspect_completio=
n<br>
d98978ae1 Merge pull request #19256 from ygalblum/quadlet-working-dir<br>
8d190704a Quadlet - Allow setting Service WorkingDirectory for Kube units<b=
r>
24bf6fc24 Quadlet system test - do not rely on journalctl in kube file test=
s<br>
e5faed79c Merge pull request #19279 from iczero/fix-doc-markdown<br>
cf18a1fea Merge pull request #19267 from edsantiago/quadlet_tmpdir<br>
3d6bc2f86 Fix markdown in docs for podman-network-create<br>
11ffea313 Man pages: check for corrupt tables<br>
1d14bb7a8 quadlet systest: fix broken tmpdir references<br>
e55e128fc Add `since` as valid filter option for `volume` subcommands<br>
7791ffd21 Merge pull request #19140 from lsm5/podmansh-followup<br>
f8eaec6f8 Merge pull request #19269 from jakecorrenti/volume-ls-mult-filter=
s<br>
6df17332b Podmansh: Better error, increase timeout to 30s<br>
96241159a Fix multiple filter options logic for `podman volume ls `<br>
00a5b0709 Add bash-completion for podman inspect<br>
34a2a48e9 Merge pull request #19208 from jakecorrenti/add-reserved-flag<br>
b88f9b367 Merge pull request #19270 from n1hility/fix-win-installerr<br>
3b6343202 Fix windows installer<br>
d7e25e14a Add missing reserved annotation support to `play`<br>
d2862c7dd Avoid progress hang with empty files<br>
5c0912b07 Revert the usage of `home.GetConfigHome()`<br>
5aa52659b Fix bug report issue template README link<br>
47997857f Replace error check for non-existent file<br>
c6f8de8a4 Merge pull request #19253 from containers/renovate/github.com-vba=
uerster-mpb-v8-8.x<br>
2d2dfc8d5 Merge pull request #19259 from edsantiago/xdg<br>
8febb6aa1 Emergency gating-test fixes for RHEL8<br>
7739e900e Merge pull request #19243 from lsm5/packit-remove-pre-sync<br>
d8d600b1d Add progress bar for decompress image<br>
46058cfed refactor: move progressbar to a function<br>
ca9874ab7 Use pkg/homedir to get the home config directory<br>
52af8a229 Merge pull request #19250 from rhatdan/tmpfs<br>
7fb17ae78 fix(deps): update module <a href=3D"http://github.com/vbauerster/=
mpb/v8" rel=3D"noreferrer" target=3D"_blank">github.com/vbauerster/mpb/v8</=
a> to v8.5.2<br>
49a924cf3 Merge pull request #19211 from jakecorrenti/add-reserved-flag-gen=
erate<br>
a224ff731 Should be checking tmpfs versus type not source<br>
0745fe892 Merge pull request #19187 from rhatdan/VENDOR<br>
647c6543c Merge pull request #19244 from baude/applehvarm64<br>
b5fd9a9c0 Merge pull request #19246 from containers/renovate/github.com-vba=
uerster-mpb-v8-8.x<br>
9e60f3ec5 fix(deps): update module <a href=3D"http://github.com/vbauerster/=
mpb/v8" rel=3D"noreferrer" target=3D"_blank">github.com/vbauerster/mpb/v8</=
a> to v8.5.1<br>
b4ffbcdfd Enabled arm64 arch for podman applehv provider<br>
4e4078dbb [CI:BUILD] Packit: remove pre-sync action<br>
d1ddd03a6 Merge pull request #19241 from rhatdan/bind<br>
d0602e8f7 Add `--podman-only` flag to `podman generate kube`<br>
c9c46fdf2 Merge pull request #19234 from edsantiago/cleanup_skips<br>
13a950016 Update vendor containers/(common, buildah, image, storage)<br>
bb72016f5 Merge pull request #19066 from Luap99/ps<br>
f256f4f95 Use constants for mount types<br>
960a764c5 Merge pull request #19173 from hedayat/support-port-name-in-probe=
s<br>
c46fd411e Merge pull request #19098 from imphil/userns-docs<br>
a56370db4 Merge pull request #19238 from dfr/freebsd-copy<br>
310a8f103 libpod: use define.TypeBind when resolving container paths<br>
265718596 Merge pull request #19225 from Luap99/network-doc<br>
1e9410094 Tests: remove/update obsolete skips<br>
a3bbc3a2c Fix trust not using local policy file<br>
72ec8824a Merge pull request #19227 from jakecorrenti/container-prune-docs-=
error<br>
a6bdccdb8 Merge pull request #19217 from baude/applehvpass3<br>
0997cf012 Fix `podman container prune` docs for `--filter`<br>
a8d8c9497 Add more tests for liveness probes with default hostname &amp; na=
med ports<br>
285665f6f Merge pull request #19214 from lsm5/package-rpm-rename<br>
383d683f8 docs: podman-build --network add slirp and pasta<br>
5e64cbf35 docs: podman run --network mention comma separted names<br>
1443e2918 Podman machine AppleHV pass number 3<br>
eb2bf7a07 Merge pull request #19183 from eriksjolund/add_missing_return<br>
0285bc122 Merge pull request #19222 from Luap99/macvlan-internal<br>
561062dfc Merge pull request #19210 from vrothberg/fix-17403<br>
04d808f93 Merge pull request #19216 from lsm5/packit-golist<br>
315a7887a Makefile: `package` -&gt; `rpm`<br>
7a93a28e3 Merge pull request #19221 from dfr/freebsd-rootfs<br>
85d936133 network create: document --internal better<br>
e43127e0b pkg/specgen: fix support for --rootfs on FreeBSD<br>
69f112a8b Merge pull request #19200 from rhatdan/secret1<br>
8c16322a8 machine start: qemu: wait for SSH readiness<br>
20879aba0 Merge pull request #19188 from mheon/fix_19159<br>
12dc546fc [CI:BUILD] Packit: downstream task action fix<br>
2b2c4453f Fix container errors not being sent via pod removal API<br>
6ec261e7a Add missing return after utils.InternalServerError()<br>
cd58306a8 Merge pull request #19207 from Luap99/mv-dns<br>
dcf0a3cfc Merge pull request #19203 from sstosh/remote-play-kube-userns<br>
d1950869a Update cmd/podman/login.go<br>
cce8501a5 [CI:DOCS] Reformat and reorder table with --userns options<br>
9d9f4aaaf Merge pull request #19006 from deuill/quadlet-volume-network-name=
s<br>
d497eb369 Add secret support to podman login<br>
2a9b9bb53 netavark: macvlan networks keep custom nameservers<br>
958191aed Merge pull request #19199 from containers/renovate/github.com-con=
tainer-orchestrated-devices-container-device-interface-0.x<br>
99ca4435f Merge pull request #19197 from containers/renovate/<a href=3D"htt=
p://go-github.com/gin-gonic/gin-vulnerability6fc7c4842" rel=3D"noreferrer" =
target=3D"_blank">go-github.com/gin-gonic/gin-vulnerability<br>
6fc7c4842</a> Merge pull request #19190 from containers/renovate/github.com=
-containers-libhvee-0.x<br>
c5006f478 Merge pull request #19204 from Luap99/vendor-tidy<br>
c6b5b9a02 remote: fix podman-remote play kube --userns<br>
441af003a fix(deps): update container-device-interface to v0.6.0<br>
d3ac265fc Merge pull request #19196 from vrothberg/bz-2180483<br>
656ad760f go mod: no longer use 1.18<br>
aeef403cd fix(deps): update module <a href=3D"http://github.com/containers/=
libhvee" rel=3D"noreferrer" target=3D"_blank">github.com/containers/libhvee=
</a> to v0.3.0<br>
6fd4ae6d2 chore(deps): update module <a href=3D"http://github.com/gin-gonic=
/gin" rel=3D"noreferrer" target=3D"_blank">github.com/gin-gonic/gin</a> to =
v1.9.1 [security]<br>
544407358 Merge pull request #19186 from rhatdan/codespell<br>
0dcfe6e06 Run codespell on code<br>
1be2ec1d4 Merge pull request #19193 from Luap99/hostname-alias<br>
b994f8610 Merge pull request #19131 from baude/applehvpass2<br>
3ad55f48b system service: unset listen fds on tcp<br>
b1dd0a335 Merge pull request #19189 from pjannesen/issue/19175<br>
f1c68b79e add hostname to network alias<br>
b6ec2127b libpod: set cid network alias in setupContainer()<br>
bd85be42f Merge pull request #19100 from edsantiago/pasta_better_cleanup<br=
>
4e96686e9 AppleHV enablement pass #2<br>
e6dbb422e Merge pull request #19191 from sstosh/e2e-fix-username<br>
72a1857e4 e2e: Fetch the correct user name<br>
77b36ca35 Merge pull request #19102 from jakecorrenti/kube-generate-print-a=
nnotations<br>
7b54fd84e Add `--no-trunc` flag to maintain original annotation length<br>
600de05e3 Fix TCP probes when the optional host field is not given<br>
ac3a115c3 Add support for using port names in Kubernetes health probes<br>
4494cefbc Fix: cgroup is not set: internal libpod error after os reboot<br>
932fae402 Allow setting volume and network names in Quadlet<br>
427b959a1 pasta tests: automatically determine test parameters<br>
d31b9eb9e Merge pull request #19170 from dfr/freebsd-mtab<br>
eb9d44241 Merge pull request #19004 from rhatdan/secret<br>
7b08e024c Merge pull request #19180 from vrothberg/fix-19147<br>
8c071ca65 Merge pull request #19179 from Luap99/syslog<br>
79d3453f3 Merge pull request #19182 from Luap99/slow-remote-version<br>
97fd03ccd test/e2e: wait for socket<br>
a69194b02 manifest inspect: support authentication<br>
70428baef api: fix slow version endpoint<br>
f8213a6d5 libpod: don&#39;t make a broken symlink for /etc/mtab on FreeBSD<=
br>
499b8d13c CI: remove build without cgo task<br>
42ea0bf9c libpod: use io.Writer vs io.WriteCloser for attach streams<br>
597ebeb60 top: do not depend on ps(1) in container<br>
3f8ee70d0 make --syslog errors non fatal<br>
7cd1fb77f Merge pull request #19172 from eriksjolund/fix_underscore_in_man_=
page<br>
b713fe399 Merge pull request #19174 from mhrivnak/fix-quadlet-docs<br>
dbec2b5aa api: fix doc for default ps_args<br>
1b7eb44d3 Fixes typo in the path where quadlet looks for files<br>
efefd8cf5 Add --replace flag to podman secret create<br>
5d706eb02 Merge pull request #19084 from eriksjolund/add_docs_to_system_ser=
vice<br>
478cd66cd Merge pull request #19134 from containers/renovate/golang.org-x-n=
et-0.x<br>
914752614 Merge pull request #19168 from containers/renovate/github-issue-l=
abeler-3.x<br>
05a420bc8 Merge pull request #19163 from containers/renovate/github.com-doc=
ker-docker-24.x<br>
eec438222 [CI:DOCS] uidmap man pages: fix corrupt italics<br>
8d24e2838 [skip-ci] Update github/issue-labeler action to v3.2<br>
f9077689e [CI:DOCS] <a href=3D"http://podman-system-service.1.md" rel=3D"no=
referrer" target=3D"_blank">podman-system-service.1.md</a>: document system=
d usage<br>
dd16661b1 fix(deps): update module <a href=3D"http://github.com/docker/dock=
er" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> to v2=
4.0.4+incompatible<br>
94dba6d89 Merge pull request #19150 from containers/renovate/github.com-doc=
ker-docker-24.x<br>
46f9cf7e8 Merge pull request #19146 from afbjorklund/bytes-size<br>
65136521e fix(deps): update module <a href=3D"http://github.com/docker/dock=
er" rel=3D"noreferrer" target=3D"_blank">github.com/docker/docker</a> to v2=
4.0.3+incompatible<br>
28abed6e2 Merge pull request #19145 from Luminger/fix-range-option-parsing<=
br>
fa654e985 Use bytes size consistently instead of human size<br>
b721f96f5 Merge pull request #19074 from dfr/freebsd-build-test<br>
fce216460 Merge pull request #19137 from containers/renovate/golang.org-x-t=
ools-0.x<br>
dee94ea69 bugfix: do not try to parse empty ranges<br>
972e4ae76 Merge pull request #19117 from lsm5/packit-golist<br>
f1775a34a Merge pull request #19116 from vrothberg/qemu-backoffs<br>
9e4045768 [CI:BUILD] Packit: fix pre-sync action for downstream tasks<br>
531fb21d0 fix(deps): update module <a href=3D"http://golang.org/x/tools" re=
l=3D"noreferrer" target=3D"_blank">golang.org/x/tools</a> to v0.11.0<br>
ab2fa45ad fix(deps): update module <a href=3D"http://golang.org/x/net" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/net</a> to v0.12.0<br>
7c04d6ddd Merge pull request #19129 from containers/renovate/golang.org-x-t=
erm-0.x<br>
904997999 Merge pull request #19127 from edsantiago/fix_toolbox_flake<br>
459b1578c fix(deps): update module <a href=3D"http://golang.org/x/term" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/term</a> to v0.10.0<br>
485de41a3 Merge pull request #19099 from cevich/minor_place_holders<br>
99f93d55c e2e: fix two toolbox flakes<br>
93447e292 Merge pull request #19092 from vrothberg/bz-2218315<br>
d25802a0d Merge pull request #19118 from Luap99/ginkgo<br>
8d46e79e8 Merge pull request #19122 from containers/renovate/golang.org-x-t=
ext-0.x<br>
fc5aa9c9c test/e2e: use GinkgoT().TempDir() over MkdirTemp()<br>
ea8992cb4 test/e2e: use random ImageCacheDir<br>
17a06d343 test/e2e: remove RHEL7 workaround<br>
bc22aefce test/e2e: remove unnecessary code in SynchronizedAfterSuite<br>
ff7790038 test/e2e: do not use /tmp for podman commands<br>
db7cb1dbf test/tools: vendor ginkgo v2.11<br>
c20612bab test/e2e: write timings directly to file<br>
f33a3bdc3 Merge pull request #19085 from dfr/emulate-linux<br>
a0b765552 machine start: qemu: adjust backoffs<br>
d874790bc auto update: fix usage of --authfile<br>
10615e784 Merge pull request #19106 from edsantiago/refactor_registry<br>
ba1355b23 system tests: refactor registry code<br>
94b321337 fix(deps): update module <a href=3D"http://golang.org/x/text" rel=
=3D"noreferrer" target=3D"_blank">golang.org/x/text</a> to v0.11.0<br>
644f7cd9b pkg/specgen: properly identify image OS on FreeBSD<br>
5c302db50 Merge pull request #19101 from haircommander/runc-bump<br>
a3a62275c libpod: use new libcontainer BlockIO constructors<br>
2d68c3add [CI:BUILD] Minor: Don&#39;t confuse osx-debugging<br>
5aabc5088 [CI:DOCS] Better document the default value of --userns<br>
e4644c3cb Cirrus: build FreeBSD binaries in a VM<br>
92fc0f481 Makefile: add support for building freebsd release tarballs<br>
e0846ac38 Merge pull request #19088 from edsantiago/fix_corrupt_man_tables<=
br>
4a5396b46 [CI:DOCS] uidmap man pages: fix corrupt tables<br>
03d7ed468 Merge pull request #19080 from containers/renovate/github.com-crc=
-org-vfkit-digest<br>
539be5816 Merge pull request #19079 from containers/renovate/github.com-con=
tainers-buildah-1.x<br>
0004ae86e Merge pull request #19076 from containers/renovate/github.com-ope=
ncontainers-image-spec-1.x<br>
5a8e092a2 fix(deps): update <a href=3D"http://github.com/crc-org/vfkit" rel=
=3D"noreferrer" target=3D"_blank">github.com/crc-org/vfkit</a> digest to c9=
a4b08<br>
d0359fcca fix(deps): update module <a href=3D"http://github.com/containers/=
buildah" rel=3D"noreferrer" target=3D"_blank">github.com/containers/buildah=
</a> to v1.31.0<br>
300eb36b4 fix(deps): update module <a href=3D"http://github.com/opencontain=
ers/image-spec" rel=3D"noreferrer" target=3D"_blank">github.com/opencontain=
ers/image-spec</a> to v1.1.0-rc4<br>
82af41cf2 Merge pull request #19062 from Luminger/fix-use-gid-map-not-uid-m=
ap<br>
92a22bb94 Merge pull request #19063 from BlackHole1/fix-search<br>
b05071082 Merge pull request #19060 from vrothberg/fix-17403<br>
6652e29cc Merge pull request #19057 from dfr/freebsd-install<br>
b7a21aad7 Merge pull request #19055 from containers/renovate/github.com-con=
tainers-libhvee-0.x<br>
94e59bd2f Use /proc/self/gid_map as intended, not uid_map<br>
a16488f89 fix(command): ignore `--format` in `podman search --list-tags`<br=
>
5561390a0 Merge pull request #19053 from edsantiago/pasta_test_cleanup<br>
acaaf3de4 Merge pull request #19042 from dgibson/bug17922<br>
9fb2f8e10 podman machine start: fix ready service<br>
8408ad498 Makefile: don&#39;t rely on the non-standard -r flag for ln<br>
39624473b pasta: Create /etc/hosts entries for pods using pasta networking<=
br>
fe0de8b9f fix(deps): update module <a href=3D"http://github.com/containers/=
libhvee" rel=3D"noreferrer" target=3D"_blank">github.com/containers/libhvee=
</a> to v0.2.0<br>
fca3c2ef8 Merge pull request #19049 from dfr/freebsd-api-server<br>
2393fe453 pasta tests: add sanity check for test name vs function<br>
4da3e47b6 pasta tests: cleanup + 1 new test<br>
fad2fa3da Merge pull request #19047 from fwiesel/patch-1<br>
d09edd282 Merge pull request #19043 from dgibson/fix19021<br>
43b9426fc cmd/podman, pkg/domain/infra: sockets should live in /var/run on =
FreeBSD<br>
92db6a871 Merge pull request #19032 from Luap99/def-rootless-network<br>
4d270d246 Merge pull request #19039 from containers/renovate/github.com-cor=
eos-stream-metadata-go-0.x<br>
e3f2a97d1 cmd/podman/system: add API server support on FreeBSD<br>
8ff12e09f Merge pull request #19044 from dgibson/bug17287<br>
0d7da5c0b [CI:DOCS] Document support of pod security context IDs<br>
f64a1a1cc rootless: use default_rootless_network_cmd config<br>
62399c77b Merge pull request #19040 from TomSweeneyRedHat/dev/tsweeney/imag=
e_commonbump<br>
45eaa4d41 Merge pull request #19035 from lsm5/rpm-fixes<br>
e4efd709d Revert^3 &quot;pasta: Use two connections instead of three in TCP=
 range forward tests&quot;<br>
17cd5aecb pasta: Workaround occasional socat failures in CI<br>
13c7d05cc pasta: Remove some leftover code from pasta bats tests<br>
bc58dae36 Bump c/image to v5.26.0, c/common 0.54.0<br>
2cb549339 fix(deps): update module <a href=3D"http://github.com/coreos/stre=
am-metadata-go" rel=3D"noreferrer" target=3D"_blank">github.com/coreos/stre=
am-metadata-go</a> to v0.4.3<br>
f0cb8dfe5 Merge pull request #19031 from dfr/freebsd-init<br>
455c7c826 Merge pull request #19011 from rhatdan/secret1<br>
b2ce082df Merge pull request #19034 from edsantiago/enable_rootless_systemd=
_test<br>
bf60bb073 Display secret to user in inpspect<br>
448e01566 [CI:BUILD] RPM: Fix koji and ELN issues<br>
8fb719a9e e2e: systemd test: major fixes<br>
2ac2ba9e4 Merge pull request #19030 from lsm5/main-bump<br>
92b2a15a2 Merge pull request #19029 from rhatdan/inspect<br>
865d77e94 pkg/specgen: add support for &#39;podman run --init&#39; on FreeB=
SD<br>
416b4eeac Merge pull request #18814 from danishprakash/kube-down-volrm<br>
74b4615aa Bump version after v4.6 branch cut<br>
9067d5c85 Merge pull request #19013 from dfr/emulate-linux<br>
b6e636cbe Remove &#39;inspecting object&#39; from inspect errors<br>
be49741dc Merge pull request #19021 from dgibson/bug19007<br>
c8b9c2911 Merge pull request #19019 from BlackHole1/fix-windows-docs<br>
6babf9492 Merge pull request #19015 from rhatdan/read-only<br>
f739f8f99 Merge pull request #18921 from fangpenlin/fix-18907-set-correct-c=
wd-for-poststop-hook-exe<br>
fe8355be7 pasta: Fix pasta tests to work on hosts with multiple interfaces<=
br>
d15cca024 [CI:DOCS] fix command incorrect in windows<br>
bcb89fc8b Fix readonly=3Dfalse failure<br>
4dc2e0861 Merge pull request #18977 from jakecorrenti/move-qemu-functions-t=
o-proper-files<br>
089dbed49 Merge pull request #18999 from Luap99/vendor<br>
c928da6d6 Merge pull request #18975 from rhatdan/man<br>
1aacafbe1 Merge pull request #18984 from rhatdan/podmansh<br>
609c47ae6 pkg/specgen: Add support for Linux emulation on FreeBSD<br>
cf9ebcddf Fix up podmansh man page<br>
05eb3e6f1 Make Podman/Buildah use same DecryptConfig/EncryptConfig funcs<br=
>
f5cc0487e Fixes for vendoring Buildah<br>
0f4c86e26 vendor in latest buildah<br>
6eaf8a271 tests: fix &quot;Storing signatures&quot; check<br>
b80fd54a5 update c/image and c/storage to latest<br>
eeb7aeb49 Kube quadlets can support autoupdate as well as containers<br>
4445a5040 Merge pull request #19008 from Luap99/800lines-flake<br>
2160a114c debug tail 800 lines flake<br>
dd81f7ac6 Pass in correct cwd value for hooks exe<br>
3794d067e Merge pull request #18997 from containers/renovate/google.golang.=
org-protobuf-1.x<br>
c2d46acde Merge pull request #18980 from vrothberg/bz-2216700<br>
68f71f49d Merge pull request #19002 from giuseppe/skip-devices-userns<br>
6a742cb2f Merge pull request #18981 from rhatdan/quadlet<br>
227c07aeb specgen: honor --device-cgroup-rule with a new user namespace<br>
0220f3338 specgen, rootless: raise error with --device-cgroup-rule<br>
db37d66cd make image listing more resilient<br>
17a18b16c Update module <a href=3D"http://google.golang.org/protobuf" rel=
=3D"noreferrer" target=3D"_blank">google.golang.org/protobuf</a> to v1.31.0=
<br>
bc5269f18 Trim whitespace from unit files while parsing<br>
516034215 Re-organize hypervisor implementations<br>
ba3da15e0 play.go: remove volumes on down -f<br>
```<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containers/po=
dman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_blank">=
podman_git.bb</a><br>
index 7634ac85..fce8f0b8 100644<br>
--- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
+++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
@@ -17,9 +17,9 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0gettext-native \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;85b5f572348eeb60613bd0b24780269a760125f5&quot;<br>
+SRCREV =3D &quot;aa546902fa1a927b3d770528565627d1395b19f3&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/containers/libpod.git;bra=
nch=3Dv4.7;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/containers/libpod.git;branch=3Dv4.7;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/containers/libpod.git;bra=
nch=3Dv4.8;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/containers/libpod.git;branch=3Dv4.8;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;root=
less&#39;, &#39;file://50-podman-rootless.conf&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
@@ -31,7 +31,7 @@ GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-PV =3D &quot;4.7.1+git&quot;<br>
+PV =3D &quot;4.8.2+git&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2022-2989] =3D &quot;fixed-version: fixed since v4.3.0=
&quot;<br>
=C2=A0CVE_STATUS[CVE-2023-0778] =3D &quot;fixed-version: fixed since v4.5.0=
&quot;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000a760c2060cd9e7bc--

