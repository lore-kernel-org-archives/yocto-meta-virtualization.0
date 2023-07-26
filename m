Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672FEC001DE
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 13:24:00 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.10960.1690377838782566572
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 06:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=k/9nVOhJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-348d1cf5639so14080945ab.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jul 2023 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690377838; x=1690982638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym9tYkgZigBG7F3+bAYmBiBfOQTBUgqwzte7a6qKPHo=;
        b=k/9nVOhJbP9FLWHDhy2jRStUQtYTSMe8B9GoGnzj90qwMcUIab067jWloqfT8dEGqA
         uQvVFC4PPCkibrDVgJ1re7zryZaypQ9VT6CGWu8kaahRhkrN1CXjoO7j4wlN5Y6vAd7j
         LafJ+m4xkx/pChS+ZEIzFKbfSKeAMcULkPwVthl0GYYHZKdpBPyXJairFMhuEtd15x4J
         7YOSqqPbpPnqv1v6zwdtlGUptm1ENs4WspalOUniYAAjD0W1H7mM3T1Waul+BZTO1V9Y
         eIUBk50irfzt8jPXiCdl25maBUOXy2HdbFnRJH7oLE/m4sig0Z43QH5x8beQW18hR/nf
         jqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690377838; x=1690982638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ym9tYkgZigBG7F3+bAYmBiBfOQTBUgqwzte7a6qKPHo=;
        b=XppMKZhp+mtHTqdRMRCinqBOFpt/ZB3GFgbUQKjE1e/5Ox5uDAaJn8NktX1b/CDP5X
         /IjzmthiRPiU7o1PPZTIw72OvF5HlGKxFMWyLcQ0Mtr76mjZPv4lPU52FaxnUo/too7w
         de4JC6h4IzO9nvDGHNnqmZYw0HMX5ZmiRHbAqBnxr9LmFyZ1lY/rnXD8Gf9CciOTcW1s
         ELLNt3rwIpSoSC47rgJ2W6tkKdB3ZzumGdJ5O9l2UTZUqtsaz4Btj47Hzec/VXLDLGp3
         qifYEXJi6Knmf6NT5NFxVIUvo5NUHgNuQamfIyIJ7o7KaRJYPO1KGERgdMjj5TFnqN8W
         TAFA==
X-Gm-Message-State: ABy/qLYgtarhTFijpRMcanBv3UaQaXtovXztOQFpVqCgv9vIDXKZFLG5
	HVYKhz6mXznHBSrHbsLMl/4GAwYwv/137vSrN3M=
X-Google-Smtp-Source: APBJJlG04jQLFvCkm3ntJ05ckVrqt0a8QpW7jhCAcLRMiCU5PicPva1PCuYXAvt255teyFl7WV0P6m5w4f5KHTLiV+E=
X-Received: by 2002:a05:6e02:13ce:b0:32c:9c5e:900c with SMTP id
 v14-20020a056e0213ce00b0032c9c5e900cmr1920932ilj.8.1690377837834; Wed, 26 Jul
 2023 06:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230515152624.138713-1-adrian.freihofer@siemens.com>
 <20230515152624.138713-6-adrian.freihofer@siemens.com> <CA+chaQcSFzXgDVvDOtY74yL351Hpz1h6ug2ZRy=w00_4WgeVJg@mail.gmail.com>
In-Reply-To: <CA+chaQcSFzXgDVvDOtY74yL351Hpz1h6ug2ZRy=w00_4WgeVJg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 26 Jul 2023 09:23:46 -0400
Message-ID: <CADkTA4MOvy6ybJu5sJKUE6f5CpGogRh2MtdG67uwQVkoBsMZhg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 5/5] runc-docker: update to 1.1.7
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>, meta-virtualization@lists.yoctoproject.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jul 2023 13:24:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8138

On Wed, Jul 26, 2023 at 5:47=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.co=
m> wrote:
>
> FYI: This change seems to break the build with gold instead of bfd linker=
 (with ld-is-gold in DISTRO_FEATURES):
>

I'm about to push the next round of package bumps to master-next, I'll
have a closer look at the change log to see if there's anything
related to this.

Bruce

> ld: --no-dynamic-linker: unknown option
>
> jama ~ # ld.gold --help | grep dynamic-linker
>   -I PROGRAM, --dynamic-linker PROGRAM
> jama ~ # ld.bfd --help | grep dynamic-linker
>   -I PROGRAM, --dynamic-linker PROGRAM
>   --no-dynamic-linker         Produce an executable with no program inter=
preter header
> jama ~ # ld.lld --help | grep dynamic-linker
>   --dynamic-linker=3D<value>
>   --no-dynamic-linker     Inhibit output of .interp section
>
> Regards,
>
> On Mon, May 15, 2023 at 5:27=E2=80=AFPM Adrian Freihofer <adrian.freihofe=
r@gmail.com> wrote:
>>
>> Bumping runc to version v1.1.7, which comprises the following commits:
>>
>>     860f061b (HEAD -> release-1.1, tag: v1.1.7) VERSION: release 1.1.7
>>     26480338 Merge pull request #3838 from cyphar/1.1-release-gpgkeys
>>     f72cd0a6 Merge pull request #3845 from kolyshkin/1.1-rm-warning
>>     c1063b1c runc.keyring: add Akihiro Suda
>>     b0fae8c4 scripts: keyring validate: print some more information
>>     79a52b43 libct/cg/sd: use systemd version when generating dev props
>>     6a806d4d runc.keyring: add Kolyshkin
>>     b6f686f2 keyring: add Aleksa's <cyphar@cyphar.com> signing key
>>     63355bf8 keyring: add Aleksa's <asarai@suse.com> signing key
>>     3bdb63bf keyring: verify runc.keyring has legitimate maintainer keys
>>     853d5e38 scripts: release: add verification checks for signing keys
>>     bd1d5370 release: add runc.keyring file and script
>>     6ccf104a merge #3818 into release-1.1
>>     7cd72cc3 VERSION: go back to development
>>     0f48801a (tag: v1.1.6) VERSION: release 1.1.6
>>     0690c4ec merge #3823 into release-1.1
>>     e4ce94e2 libct/cg: add misc controller to v1 drivers
>>     53333a55 Merge pull request #3811 from haircommander/root-cgroup-no-=
init-1.1
>>     10cfd816 libctr/cgroups: don't take init's cgroup into account
>>     9c1c8446 Merge pull request #3817 from kolyshkin/1.1-user-exec
>>     d30d240b tests/int: test for CAP_DAC_OVERRIDE
>>     840b9539 Fix runc run "permission denied" when rootless
>>     c7a72aba Merge pull request #3808 from kolyshkin/1.1-cpuset-byte-ord=
er
>>     165d2323 tests/int: add a "update cpuset cpus range via v2 unified m=
ap" test
>>     26a58fdb cgroups: cpuset: fix byte order while parsing cpuset range =
to bits
>>     add2f548 Merge pull request #3791 from kolyshkin/1.1-refresh-ci
>>     c0647d3a Merge pull request #3807 from kolyshkin/1.1-skip-flaky-ce7
>>     8d9d1d25 libct/int: make TestFdLeaks more robust
>>     b66d6d56 libct/int: wording nits
>>     ddbb6d41 libc/int: add/use runContainerOk wrapper
>>     3531cc2d ci: add call to check-config.sh
>>     ed9a0e1d ci/gha: bump actions/cache to v3
>>     7683e508 ci/gha: switch to Go 1.19.x for validate
>>     568d4407 ci/gha: bump golangci-lint to 1.48
>>     1f9e36c0 libct: fixes for godoc 1.19
>>     50f06554 ci: bump golangci-lint to 1.46
>>     77472ef6 libct: fix staticcheck warning
>>     9994fe3f libct: suppress strings.Title deprecation warning
>>     403ea1f0 ci/gha: convert lint-extra from a job to a step
>>     d2c83bdf ci/gha: switch to Go 1.18.x for validate
>>     03a631df ci: switch to golangci-lint 1.45
>>     e5a5522a Add supported Go releases (1.19, 1.20)
>>     3ce12483 Dockerfile: fix build wrt new git
>>     bac06cf6 ci/gha: remove stable: when installing Go
>>     e74040e0 build(deps): bump actions/setup-go from 2 to 3
>>     55462355 Require Go 1.17, bump x/sys and x/net
>>     3ce9c1e2 tests: Fix weird error on centos-9
>>     abd6adde ci: bump shfmt to 3.5.1, simplify CI setup
>>     1a4bf049 man/*sh: fix shellcheck warnings, add to shellcheck
>>     9201794a script/check-config.sh: fix remaining shellcheck warnings
>>     8b976428 shfmt: add more files
>>     b0fbd2f8 script/check-config.sh: fix SC2166 warnings
>>     7f8cb3d6 script/check-config.sh: fix wrap_color usage
>>     f6562f19 [1.1] libct/cg/dev: skip flaky test of CentOS 7
>>     55b2dbf0 Merge pull request #3806 from kolyshkin/1.1-fix-sd-start
>>     12f2f03f [1.1] runc run: refuse a non-empty cgroup for systemd drive=
r
>>     e618ec36 libct/cg/sd: reset-failed and retry startUnit on UnitExists
>>     931b9bf3 libct/cg/sd: ignore UnitExists only for Apply(-1)
>>     b46ac860 libct/cg/sd: refactor startUnit
>>     060a61c6 merge branch 'pr-3796' into release-1.1
>>     822623b6 CHANGELOG.md: move 1.1.5 CVEs to Security section
>>     54cfb25d Makefile: add verify-changelog as release dependency
>>     7b3ac330 verify-changelog: allow non-ASCII
>>     37e586ab CHANGELOG: fix a typo
>>     de0c2277 [1.1] CHANGELOG: fix 1.1.5 git compare link
>>     16e5d1d4 merge branch 'pr-3799' into release-1.1
>>     1fe2ec53 tests/int/mounts: only check non-shadowed mounts
>>     9b8ebe4d tests/int/mount: fix issues with ro cgroup test
>>
>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>> ---
>>  recipes-containers/runc/runc-docker_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-contai=
ners/runc/runc-docker_git.bb
>> index b74ffc3..c763d71 100644
>> --- a/recipes-containers/runc/runc-docker_git.bb
>> +++ b/recipes-containers/runc/runc-docker_git.bb
>> @@ -2,13 +2,13 @@ include runc.inc
>>
>>  # Note: this rev is before the required protocol field, update when all=
 components
>>  #       have been updated to match.
>> -SRCREV_runc-docker =3D "17a2d451d635e5eda2e4902324428f1bc65b0364"
>> +SRCREV_runc-docker =3D "860f061b76bb4fc671f0f9e900f7d80ff93d4eb7"
>>  SRC_URI =3D "git://github.com/opencontainers/runc;branch=3Drelease-1.1;=
name=3Drunc-docker;protocol=3Dhttps \
>>             file://0001-runc-Add-console-socket-dev-null.patch \
>>             file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remov=
e-re.patch \
>>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
>>            "
>>
>> -RUNC_VERSION =3D "1.1.5"
>> +RUNC_VERSION =3D "1.1.7"
>>
>>  CVE_PRODUCT =3D "runc"
>> --
>> 2.40.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8137): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8137
> Mute This Topic: https://lists.yoctoproject.org/mt/98905951/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

