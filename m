Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D61EC0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:47:09 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.7441.1690364822422955066
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 02:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YrT+VDQo;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3143ccb0f75so6097565f8f.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jul 2023 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690364821; x=1690969621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AQbKKce0GVlvw0tjB/bABH/2cLfZ8uiPBz1BXv/bc/I=;
        b=YrT+VDQoUve1XNU7FsRq25awrIdECWPT7EYSuwexn3j8vru7IDr3cQgSVp8v1jr+1x
         sc+QFa/SfqLzV7WsO1zBTRt67QGlixX2tuYtsUU94mxbvDqqRY6q0n8u6HjusW4MCVzx
         2uGe21yFNy7oRVIl0Secywt4Eeu3Law1nPq5df6VQOSOemHo1en+cubRRu8mwq3whVYs
         HyAtQ0NIV3ifWhi4yXrib//G1JRBeljPHlju0zgqh6YYwgyglYW+aLgoJk348zOhqs+Y
         QlSAl0FATFpewTBlhcwQEqoCkrxCQB2c/N1JdqiyfHeEzdNd4+96MrvEGtKB3qCSdfIw
         z8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690364821; x=1690969621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQbKKce0GVlvw0tjB/bABH/2cLfZ8uiPBz1BXv/bc/I=;
        b=ZPg99w67mLCr6WXBr5KfDF8Q+9Zi3LjbMZiiJDUSu9OHbk5ukGRBkDPjQwEQ2L2FtG
         Yd62aXHcnnOINISFYuXZ1+UMFuc0W++7zqn0F59GG55rdNi+XsjY8M+EZjVcQyvX0FRT
         6sMDzj/iR8DW6SqC/q8PjroIR36ftQzg1YHxzSzGlwUp/+vVGDQDX1Dbg7uEvnT6qmk+
         3EtK0O4RUoV6wC4El4i/xzaJVWues4IFQyw+TYIisW1GVsKT5DqAAlz3VTiraidJVW1E
         ECH1Ziuj4wAFM/hkl9oHdK5sBqjfPG2pP/QkihijKh4z5O73XZTcGuXGKbh0DXRTAK6X
         s6ig==
X-Gm-Message-State: ABy/qLZvWrx7/nPvrZ/bMt678svF/HYEuaH52WPHaghFsXFBS7rySEGQ
	IFj8dFhGki5qWs8WmSL4ykO9ssYWTkEj9apm8E8=
X-Google-Smtp-Source: APBJJlGdfRb9437mxxw1bUctuuqyTKqjLZFn2k48kyFXP9DC6UQ6sfTQ2VzUKdMBqV2ZtHFBxy3yER1p1NVGDeu+ID4=
X-Received: by 2002:a05:6000:1201:b0:314:1416:3be3 with SMTP id
 e1-20020a056000120100b0031414163be3mr1201273wrx.70.1690364820401; Wed, 26 Jul
 2023 02:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230515152624.138713-1-adrian.freihofer@siemens.com> <20230515152624.138713-6-adrian.freihofer@siemens.com>
In-Reply-To: <20230515152624.138713-6-adrian.freihofer@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 26 Jul 2023 11:46:42 +0200
Message-ID: <CA+chaQcSFzXgDVvDOtY74yL351Hpz1h6ug2ZRy=w00_4WgeVJg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 5/5] runc-docker: update to 1.1.7
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000a9326e060160ba47"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jul 2023 09:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8137

--000000000000a9326e060160ba47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI: This change seems to break the build with gold instead of bfd linker
(with ld-is-gold in DISTRO_FEATURES):

ld: --no-dynamic-linker: unknown option

jama ~ # ld.gold --help | grep dynamic-linker
  -I PROGRAM, --dynamic-linker PROGRAM
jama ~ # ld.bfd --help | grep dynamic-linker
  -I PROGRAM, --dynamic-linker PROGRAM
  --no-dynamic-linker         Produce an executable with no program
interpreter header
jama ~ # ld.lld --help | grep dynamic-linker
  --dynamic-linker=3D<value>
  --no-dynamic-linker     Inhibit output of .interp section

Regards,

On Mon, May 15, 2023 at 5:27=E2=80=AFPM Adrian Freihofer <adrian.freihofer@=
gmail.com>
wrote:

> Bumping runc to version v1.1.7, which comprises the following commits:
>
>     860f061b (HEAD -> release-1.1, tag: v1.1.7) VERSION: release 1.1.7
>     26480338 Merge pull request #3838 from cyphar/1.1-release-gpgkeys
>     f72cd0a6 Merge pull request #3845 from kolyshkin/1.1-rm-warning
>     c1063b1c runc.keyring: add Akihiro Suda
>     b0fae8c4 scripts: keyring validate: print some more information
>     79a52b43 libct/cg/sd: use systemd version when generating dev props
>     6a806d4d runc.keyring: add Kolyshkin
>     b6f686f2 keyring: add Aleksa's <cyphar@cyphar.com> signing key
>     63355bf8 keyring: add Aleksa's <asarai@suse.com> signing key
>     3bdb63bf keyring: verify runc.keyring has legitimate maintainer keys
>     853d5e38 scripts: release: add verification checks for signing keys
>     bd1d5370 release: add runc.keyring file and script
>     6ccf104a merge #3818 into release-1.1
>     7cd72cc3 VERSION: go back to development
>     0f48801a (tag: v1.1.6) VERSION: release 1.1.6
>     0690c4ec merge #3823 into release-1.1
>     e4ce94e2 libct/cg: add misc controller to v1 drivers
>     53333a55 Merge pull request #3811 from
> haircommander/root-cgroup-no-init-1.1
>     10cfd816 libctr/cgroups: don't take init's cgroup into account
>     9c1c8446 Merge pull request #3817 from kolyshkin/1.1-user-exec
>     d30d240b tests/int: test for CAP_DAC_OVERRIDE
>     840b9539 Fix runc run "permission denied" when rootless
>     c7a72aba Merge pull request #3808 from kolyshkin/1.1-cpuset-byte-orde=
r
>     165d2323 tests/int: add a "update cpuset cpus range via v2 unified
> map" test
>     26a58fdb cgroups: cpuset: fix byte order while parsing cpuset range t=
o
> bits
>     add2f548 Merge pull request #3791 from kolyshkin/1.1-refresh-ci
>     c0647d3a Merge pull request #3807 from kolyshkin/1.1-skip-flaky-ce7
>     8d9d1d25 libct/int: make TestFdLeaks more robust
>     b66d6d56 libct/int: wording nits
>     ddbb6d41 libc/int: add/use runContainerOk wrapper
>     3531cc2d ci: add call to check-config.sh
>     ed9a0e1d ci/gha: bump actions/cache to v3
>     7683e508 ci/gha: switch to Go 1.19.x for validate
>     568d4407 ci/gha: bump golangci-lint to 1.48
>     1f9e36c0 libct: fixes for godoc 1.19
>     50f06554 ci: bump golangci-lint to 1.46
>     77472ef6 libct: fix staticcheck warning
>     9994fe3f libct: suppress strings.Title deprecation warning
>     403ea1f0 ci/gha: convert lint-extra from a job to a step
>     d2c83bdf ci/gha: switch to Go 1.18.x for validate
>     03a631df ci: switch to golangci-lint 1.45
>     e5a5522a Add supported Go releases (1.19, 1.20)
>     3ce12483 Dockerfile: fix build wrt new git
>     bac06cf6 ci/gha: remove stable: when installing Go
>     e74040e0 build(deps): bump actions/setup-go from 2 to 3
>     55462355 Require Go 1.17, bump x/sys and x/net
>     3ce9c1e2 tests: Fix weird error on centos-9
>     abd6adde ci: bump shfmt to 3.5.1, simplify CI setup
>     1a4bf049 man/*sh: fix shellcheck warnings, add to shellcheck
>     9201794a script/check-config.sh: fix remaining shellcheck warnings
>     8b976428 shfmt: add more files
>     b0fbd2f8 script/check-config.sh: fix SC2166 warnings
>     7f8cb3d6 script/check-config.sh: fix wrap_color usage
>     f6562f19 [1.1] libct/cg/dev: skip flaky test of CentOS 7
>     55b2dbf0 Merge pull request #3806 from kolyshkin/1.1-fix-sd-start
>     12f2f03f [1.1] runc run: refuse a non-empty cgroup for systemd driver
>     e618ec36 libct/cg/sd: reset-failed and retry startUnit on UnitExists
>     931b9bf3 libct/cg/sd: ignore UnitExists only for Apply(-1)
>     b46ac860 libct/cg/sd: refactor startUnit
>     060a61c6 merge branch 'pr-3796' into release-1.1
>     822623b6 CHANGELOG.md: move 1.1.5 CVEs to Security section
>     54cfb25d Makefile: add verify-changelog as release dependency
>     7b3ac330 verify-changelog: allow non-ASCII
>     37e586ab CHANGELOG: fix a typo
>     de0c2277 [1.1] CHANGELOG: fix 1.1.5 git compare link
>     16e5d1d4 merge branch 'pr-3799' into release-1.1
>     1fe2ec53 tests/int/mounts: only check non-shadowed mounts
>     9b8ebe4d tests/int/mount: fix issues with ro cgroup test
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb
> b/recipes-containers/runc/runc-docker_git.bb
> index b74ffc3..c763d71 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,13 +2,13 @@ include runc.inc
>
>  # Note: this rev is before the required protocol field, update when all
> components
>  #       have been updated to match.
> -SRCREV_runc-docker =3D "17a2d451d635e5eda2e4902324428f1bc65b0364"
> +SRCREV_runc-docker =3D "860f061b76bb4fc671f0f9e900f7d80ff93d4eb7"
>  SRC_URI =3D "git://
> github.com/opencontainers/runc;branch=3Drelease-1.1;name=3Drunc-docker;pr=
otocol=3Dhttps
> \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>
> file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
>            "
>
> -RUNC_VERSION =3D "1.1.5"
> +RUNC_VERSION =3D "1.1.7"
>
>  CVE_PRODUCT =3D "runc"
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8056):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8056
> Mute This Topic: https://lists.yoctoproject.org/mt/98905951/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a9326e060160ba47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">FYI: This change seems t=
o break the build with gold instead of bfd linker (with ld-is-gold in DISTR=
O_FEATURES):<div><br></div><div>ld: --no-dynamic-linker: unknown option<br>=
</div><div><br></div><div>jama ~ # ld.gold --help | grep dynamic-linker<br>=
=C2=A0 -I PROGRAM, --dynamic-linker PROGRAM<br>jama ~ # ld.bfd --help | gre=
p dynamic-linker<br>=C2=A0 -I PROGRAM, --dynamic-linker PROGRAM<br>=C2=A0 -=
-no-dynamic-linker =C2=A0 =C2=A0 =C2=A0 =C2=A0 Produce an executable with n=
o program interpreter header<br></div><div>jama ~ # ld.lld --help | grep dy=
namic-linker<br>=C2=A0 --dynamic-linker=3D&lt;value&gt;<br>=C2=A0 --no-dyna=
mic-linker =C2=A0 =C2=A0 Inhibit output of .interp section<br></div><div><b=
r></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, May 15, 2023 at 5:27=E2=80=AFPM Adrian F=
reihofer &lt;<a href=3D"mailto:adrian.freihofer@gmail.com">adrian.freihofer=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Bumping runc to version v1.1.7, which comprises the following co=
mmits:<br>
<br>
=C2=A0 =C2=A0 860f061b (HEAD -&gt; release-1.1, tag: v1.1.7) VERSION: relea=
se 1.1.7<br>
=C2=A0 =C2=A0 26480338 Merge pull request #3838 from cyphar/1.1-release-gpg=
keys<br>
=C2=A0 =C2=A0 f72cd0a6 Merge pull request #3845 from kolyshkin/1.1-rm-warni=
ng<br>
=C2=A0 =C2=A0 c1063b1c runc.keyring: add Akihiro Suda<br>
=C2=A0 =C2=A0 b0fae8c4 scripts: keyring validate: print some more informati=
on<br>
=C2=A0 =C2=A0 79a52b43 libct/cg/sd: use systemd version when generating dev=
 props<br>
=C2=A0 =C2=A0 6a806d4d runc.keyring: add Kolyshkin<br>
=C2=A0 =C2=A0 b6f686f2 keyring: add Aleksa&#39;s &lt;<a href=3D"mailto:cyph=
ar@cyphar.com" target=3D"_blank">cyphar@cyphar.com</a>&gt; signing key<br>
=C2=A0 =C2=A0 63355bf8 keyring: add Aleksa&#39;s &lt;<a href=3D"mailto:asar=
ai@suse.com" target=3D"_blank">asarai@suse.com</a>&gt; signing key<br>
=C2=A0 =C2=A0 3bdb63bf keyring: verify runc.keyring has legitimate maintain=
er keys<br>
=C2=A0 =C2=A0 853d5e38 scripts: release: add verification checks for signin=
g keys<br>
=C2=A0 =C2=A0 bd1d5370 release: add runc.keyring file and script<br>
=C2=A0 =C2=A0 6ccf104a merge #3818 into release-1.1<br>
=C2=A0 =C2=A0 7cd72cc3 VERSION: go back to development<br>
=C2=A0 =C2=A0 0f48801a (tag: v1.1.6) VERSION: release 1.1.6<br>
=C2=A0 =C2=A0 0690c4ec merge #3823 into release-1.1<br>
=C2=A0 =C2=A0 e4ce94e2 libct/cg: add misc controller to v1 drivers<br>
=C2=A0 =C2=A0 53333a55 Merge pull request #3811 from haircommander/root-cgr=
oup-no-init-1.1<br>
=C2=A0 =C2=A0 10cfd816 libctr/cgroups: don&#39;t take init&#39;s cgroup int=
o account<br>
=C2=A0 =C2=A0 9c1c8446 Merge pull request #3817 from kolyshkin/1.1-user-exe=
c<br>
=C2=A0 =C2=A0 d30d240b tests/int: test for CAP_DAC_OVERRIDE<br>
=C2=A0 =C2=A0 840b9539 Fix runc run &quot;permission denied&quot; when root=
less<br>
=C2=A0 =C2=A0 c7a72aba Merge pull request #3808 from kolyshkin/1.1-cpuset-b=
yte-order<br>
=C2=A0 =C2=A0 165d2323 tests/int: add a &quot;update cpuset cpus range via =
v2 unified map&quot; test<br>
=C2=A0 =C2=A0 26a58fdb cgroups: cpuset: fix byte order while parsing cpuset=
 range to bits<br>
=C2=A0 =C2=A0 add2f548 Merge pull request #3791 from kolyshkin/1.1-refresh-=
ci<br>
=C2=A0 =C2=A0 c0647d3a Merge pull request #3807 from kolyshkin/1.1-skip-fla=
ky-ce7<br>
=C2=A0 =C2=A0 8d9d1d25 libct/int: make TestFdLeaks more robust<br>
=C2=A0 =C2=A0 b66d6d56 libct/int: wording nits<br>
=C2=A0 =C2=A0 ddbb6d41 libc/int: add/use runContainerOk wrapper<br>
=C2=A0 =C2=A0 3531cc2d ci: add call to check-config.sh<br>
=C2=A0 =C2=A0 ed9a0e1d ci/gha: bump actions/cache to v3<br>
=C2=A0 =C2=A0 7683e508 ci/gha: switch to Go 1.19.x for validate<br>
=C2=A0 =C2=A0 568d4407 ci/gha: bump golangci-lint to 1.48<br>
=C2=A0 =C2=A0 1f9e36c0 libct: fixes for godoc 1.19<br>
=C2=A0 =C2=A0 50f06554 ci: bump golangci-lint to 1.46<br>
=C2=A0 =C2=A0 77472ef6 libct: fix staticcheck warning<br>
=C2=A0 =C2=A0 9994fe3f libct: suppress strings.Title deprecation warning<br=
>
=C2=A0 =C2=A0 403ea1f0 ci/gha: convert lint-extra from a job to a step<br>
=C2=A0 =C2=A0 d2c83bdf ci/gha: switch to Go 1.18.x for validate<br>
=C2=A0 =C2=A0 03a631df ci: switch to golangci-lint 1.45<br>
=C2=A0 =C2=A0 e5a5522a Add supported Go releases (1.19, 1.20)<br>
=C2=A0 =C2=A0 3ce12483 Dockerfile: fix build wrt new git<br>
=C2=A0 =C2=A0 bac06cf6 ci/gha: remove stable: when installing Go<br>
=C2=A0 =C2=A0 e74040e0 build(deps): bump actions/setup-go from 2 to 3<br>
=C2=A0 =C2=A0 55462355 Require Go 1.17, bump x/sys and x/net<br>
=C2=A0 =C2=A0 3ce9c1e2 tests: Fix weird error on centos-9<br>
=C2=A0 =C2=A0 abd6adde ci: bump shfmt to 3.5.1, simplify CI setup<br>
=C2=A0 =C2=A0 1a4bf049 man/*sh: fix shellcheck warnings, add to shellcheck<=
br>
=C2=A0 =C2=A0 9201794a script/check-config.sh: fix remaining shellcheck war=
nings<br>
=C2=A0 =C2=A0 8b976428 shfmt: add more files<br>
=C2=A0 =C2=A0 b0fbd2f8 script/check-config.sh: fix SC2166 warnings<br>
=C2=A0 =C2=A0 7f8cb3d6 script/check-config.sh: fix wrap_color usage<br>
=C2=A0 =C2=A0 f6562f19 [1.1] libct/cg/dev: skip flaky test of CentOS 7<br>
=C2=A0 =C2=A0 55b2dbf0 Merge pull request #3806 from kolyshkin/1.1-fix-sd-s=
tart<br>
=C2=A0 =C2=A0 12f2f03f [1.1] runc run: refuse a non-empty cgroup for system=
d driver<br>
=C2=A0 =C2=A0 e618ec36 libct/cg/sd: reset-failed and retry startUnit on Uni=
tExists<br>
=C2=A0 =C2=A0 931b9bf3 libct/cg/sd: ignore UnitExists only for Apply(-1)<br=
>
=C2=A0 =C2=A0 b46ac860 libct/cg/sd: refactor startUnit<br>
=C2=A0 =C2=A0 060a61c6 merge branch &#39;pr-3796&#39; into release-1.1<br>
=C2=A0 =C2=A0 822623b6 CHANGELOG.md: move 1.1.5 CVEs to Security section<br=
>
=C2=A0 =C2=A0 54cfb25d Makefile: add verify-changelog as release dependency=
<br>
=C2=A0 =C2=A0 7b3ac330 verify-changelog: allow non-ASCII<br>
=C2=A0 =C2=A0 37e586ab CHANGELOG: fix a typo<br>
=C2=A0 =C2=A0 de0c2277 [1.1] CHANGELOG: fix 1.1.5 git compare link<br>
=C2=A0 =C2=A0 16e5d1d4 merge branch &#39;pr-3799&#39; into release-1.1<br>
=C2=A0 =C2=A0 1fe2ec53 tests/int/mounts: only check non-shadowed mounts<br>
=C2=A0 =C2=A0 9b8ebe4d tests/int/mount: fix issues with ro cgroup test<br>
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-docker_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" =
rel=3D"noreferrer" target=3D"_blank">runc-docker_git.bb</a> b/recipes-conta=
iners/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferrer" target=
=3D"_blank">runc-docker_git.bb</a><br>
index b74ffc3..c763d71 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
@@ -2,13 +2,13 @@ include runc.inc<br>
<br>
=C2=A0# Note: this rev is before the required protocol field, update when a=
ll components<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0have been updated to match.<br>
-SRCREV_runc-docker =3D &quot;17a2d451d635e5eda2e4902324428f1bc65b0364&quot=
;<br>
+SRCREV_runc-docker =3D &quot;860f061b76bb4fc671f0f9e900f7d80ff93d4eb7&quot=
;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencontainers/r=
unc;branch=3Drelease-1.1;name=3Drunc-docker;protocol=3Dhttps" rel=3D"norefe=
rrer" target=3D"_blank">github.com/opencontainers/runc;branch=3Drelease-1.1=
;name=3Drunc-docker;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-Add-console-sock=
et-dev-null.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-respect-GOBU=
ILDFLAGS-for-runc-and-remove-re.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-docker-SIGUSR1-d=
aemonize.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-RUNC_VERSION =3D &quot;1.1.5&quot;<br>
+RUNC_VERSION =3D &quot;1.1.7&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;runc&quot;<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8056): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8056" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8056</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/98905951/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/98905951/3617156</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com=
" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000a9326e060160ba47--

