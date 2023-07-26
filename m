Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63683C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 13:35:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.11207.1690378508154464827
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 06:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WlCidbVE;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3172144c084so6311068f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jul 2023 06:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690378506; x=1690983306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fLxJlkrC3HW753/2SX8m1y7Z3fTsgu1BI0Dfevaoiss=;
        b=WlCidbVEfqoOCXGQPCAM4qltBEqJPUTT+0xVPypFWVTaFccix1ebVe5c3eSIYWXVcV
         dLuo98RW/UNQ/zq15YP5PpGTdRgJqt6gfpI4+DIyN3lYqjdXtt9lCWEnIPMvm4jKnGuY
         905arfrJuZ6/sCLkAjCznF8vFX1daKeVMN9J8rLn/UsdukprOXotubOJM9fH9cmeFvIw
         k7uYi8heH90x5lc8WtYtg/MQxSGZhEKytdQCMU+O1mIxcjDs6Y0WwYG2OZqQFaELIoIJ
         BPzVERjMMFpELJ/s6Ag7yEiDD5bAxSCAMt3LX97aFrs/SSnd85gG0MmrX9Gov5pdPD4u
         /bHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690378506; x=1690983306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLxJlkrC3HW753/2SX8m1y7Z3fTsgu1BI0Dfevaoiss=;
        b=jKiKzu9KYFNFwZC4IB5tQVRl9XnyqaTjfY0/HTZRsMVHszQCTHH5ExC1mxNifuSGnq
         eTIHe0vpvTSNtoSynssApl/K3Bk10hhj6joeVNkNEoEbRNizjjc2EEwKzy/8ifELG62U
         37Im9YOwElbSroMvnF/rUWJQlqHiFYez9p/KskPVWFkbNegB532YG+c72BLIStaIvxZj
         JaJWJS4x7kzemOiLtYkkfpnd+wKIFzlupY3txAt+YJV8n7BsOnDKSc0spBqjDApMQlBl
         jA4MBXPjZnI+J8V8AvyklhG2b95p4y25T7MGvpWxkbEvj0dYnd+wBhCD6DwIvvdB0mVv
         S+mQ==
X-Gm-Message-State: ABy/qLaLWdrYooRiNdmGGvFw9cFOlLFDaZwA6Hl6Lw+b7/xsQRenZc+E
	N6OOXr6+gRUHnqzmX4UKjmlpUKFQe4I6D79Gb5w=
X-Google-Smtp-Source: APBJJlG3mOhIsh8X0IqgYrtsWg46WHi58OQa3ylAyAHzsZuWv0O+sx1qpuWspalJY4leOHGlE2iWbH28agv5lJH9tpo=
X-Received: by 2002:a5d:4a42:0:b0:313:f5f8:b6d2 with SMTP id
 v2-20020a5d4a42000000b00313f5f8b6d2mr1451796wrs.48.1690378506087; Wed, 26 Jul
 2023 06:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230515152624.138713-1-adrian.freihofer@siemens.com>
 <20230515152624.138713-6-adrian.freihofer@siemens.com> <CA+chaQcSFzXgDVvDOtY74yL351Hpz1h6ug2ZRy=w00_4WgeVJg@mail.gmail.com>
 <CADkTA4MOvy6ybJu5sJKUE6f5CpGogRh2MtdG67uwQVkoBsMZhg@mail.gmail.com>
In-Reply-To: <CADkTA4MOvy6ybJu5sJKUE6f5CpGogRh2MtdG67uwQVkoBsMZhg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 26 Jul 2023 15:34:48 +0200
Message-ID: <CA+chaQcYkUpYDGZbDSN3qmB=QrV98gfJY_A+zdKUfWieVtEy_A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 5/5] runc-docker: update to 1.1.7
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>, meta-virtualization@lists.yoctoproject.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="00000000000064315f060163ea68"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jul 2023 13:35:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8139

--00000000000064315f060163ea68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's actually from your "runc-opencontainers: update to 1.1.7-tip", not
just 1.1.7 upgrade.

I've work around ready, will send it shortly.

On Wed, Jul 26, 2023 at 3:23=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Wed, Jul 26, 2023 at 5:47=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.=
com>
> wrote:
> >
> > FYI: This change seems to break the build with gold instead of bfd
> linker (with ld-is-gold in DISTRO_FEATURES):
> >
>
> I'm about to push the next round of package bumps to master-next, I'll
> have a closer look at the change log to see if there's anything
> related to this.
>
> Bruce
>
> > ld: --no-dynamic-linker: unknown option
> >
> > jama ~ # ld.gold --help | grep dynamic-linker
> >   -I PROGRAM, --dynamic-linker PROGRAM
> > jama ~ # ld.bfd --help | grep dynamic-linker
> >   -I PROGRAM, --dynamic-linker PROGRAM
> >   --no-dynamic-linker         Produce an executable with no program
> interpreter header
> > jama ~ # ld.lld --help | grep dynamic-linker
> >   --dynamic-linker=3D<value>
> >   --no-dynamic-linker     Inhibit output of .interp section
> >
> > Regards,
> >
> > On Mon, May 15, 2023 at 5:27=E2=80=AFPM Adrian Freihofer <
> adrian.freihofer@gmail.com> wrote:
> >>
> >> Bumping runc to version v1.1.7, which comprises the following commits:
> >>
> >>     860f061b (HEAD -> release-1.1, tag: v1.1.7) VERSION: release 1.1.7
> >>     26480338 Merge pull request #3838 from cyphar/1.1-release-gpgkeys
> >>     f72cd0a6 Merge pull request #3845 from kolyshkin/1.1-rm-warning
> >>     c1063b1c runc.keyring: add Akihiro Suda
> >>     b0fae8c4 scripts: keyring validate: print some more information
> >>     79a52b43 libct/cg/sd: use systemd version when generating dev prop=
s
> >>     6a806d4d runc.keyring: add Kolyshkin
> >>     b6f686f2 keyring: add Aleksa's <cyphar@cyphar.com> signing key
> >>     63355bf8 keyring: add Aleksa's <asarai@suse.com> signing key
> >>     3bdb63bf keyring: verify runc.keyring has legitimate maintainer ke=
ys
> >>     853d5e38 scripts: release: add verification checks for signing key=
s
> >>     bd1d5370 release: add runc.keyring file and script
> >>     6ccf104a merge #3818 into release-1.1
> >>     7cd72cc3 VERSION: go back to development
> >>     0f48801a (tag: v1.1.6) VERSION: release 1.1.6
> >>     0690c4ec merge #3823 into release-1.1
> >>     e4ce94e2 libct/cg: add misc controller to v1 drivers
> >>     53333a55 Merge pull request #3811 from
> haircommander/root-cgroup-no-init-1.1
> >>     10cfd816 libctr/cgroups: don't take init's cgroup into account
> >>     9c1c8446 Merge pull request #3817 from kolyshkin/1.1-user-exec
> >>     d30d240b tests/int: test for CAP_DAC_OVERRIDE
> >>     840b9539 Fix runc run "permission denied" when rootless
> >>     c7a72aba Merge pull request #3808 from
> kolyshkin/1.1-cpuset-byte-order
> >>     165d2323 tests/int: add a "update cpuset cpus range via v2 unified
> map" test
> >>     26a58fdb cgroups: cpuset: fix byte order while parsing cpuset rang=
e
> to bits
> >>     add2f548 Merge pull request #3791 from kolyshkin/1.1-refresh-ci
> >>     c0647d3a Merge pull request #3807 from kolyshkin/1.1-skip-flaky-ce=
7
> >>     8d9d1d25 libct/int: make TestFdLeaks more robust
> >>     b66d6d56 libct/int: wording nits
> >>     ddbb6d41 libc/int: add/use runContainerOk wrapper
> >>     3531cc2d ci: add call to check-config.sh
> >>     ed9a0e1d ci/gha: bump actions/cache to v3
> >>     7683e508 ci/gha: switch to Go 1.19.x for validate
> >>     568d4407 ci/gha: bump golangci-lint to 1.48
> >>     1f9e36c0 libct: fixes for godoc 1.19
> >>     50f06554 ci: bump golangci-lint to 1.46
> >>     77472ef6 libct: fix staticcheck warning
> >>     9994fe3f libct: suppress strings.Title deprecation warning
> >>     403ea1f0 ci/gha: convert lint-extra from a job to a step
> >>     d2c83bdf ci/gha: switch to Go 1.18.x for validate
> >>     03a631df ci: switch to golangci-lint 1.45
> >>     e5a5522a Add supported Go releases (1.19, 1.20)
> >>     3ce12483 Dockerfile: fix build wrt new git
> >>     bac06cf6 ci/gha: remove stable: when installing Go
> >>     e74040e0 build(deps): bump actions/setup-go from 2 to 3
> >>     55462355 Require Go 1.17, bump x/sys and x/net
> >>     3ce9c1e2 tests: Fix weird error on centos-9
> >>     abd6adde ci: bump shfmt to 3.5.1, simplify CI setup
> >>     1a4bf049 man/*sh: fix shellcheck warnings, add to shellcheck
> >>     9201794a script/check-config.sh: fix remaining shellcheck warnings
> >>     8b976428 shfmt: add more files
> >>     b0fbd2f8 script/check-config.sh: fix SC2166 warnings
> >>     7f8cb3d6 script/check-config.sh: fix wrap_color usage
> >>     f6562f19 [1.1] libct/cg/dev: skip flaky test of CentOS 7
> >>     55b2dbf0 Merge pull request #3806 from kolyshkin/1.1-fix-sd-start
> >>     12f2f03f [1.1] runc run: refuse a non-empty cgroup for systemd
> driver
> >>     e618ec36 libct/cg/sd: reset-failed and retry startUnit on UnitExis=
ts
> >>     931b9bf3 libct/cg/sd: ignore UnitExists only for Apply(-1)
> >>     b46ac860 libct/cg/sd: refactor startUnit
> >>     060a61c6 merge branch 'pr-3796' into release-1.1
> >>     822623b6 CHANGELOG.md: move 1.1.5 CVEs to Security section
> >>     54cfb25d Makefile: add verify-changelog as release dependency
> >>     7b3ac330 verify-changelog: allow non-ASCII
> >>     37e586ab CHANGELOG: fix a typo
> >>     de0c2277 [1.1] CHANGELOG: fix 1.1.5 git compare link
> >>     16e5d1d4 merge branch 'pr-3799' into release-1.1
> >>     1fe2ec53 tests/int/mounts: only check non-shadowed mounts
> >>     9b8ebe4d tests/int/mount: fix issues with ro cgroup test
> >>
> >> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> >> ---
> >>  recipes-containers/runc/runc-docker_git.bb | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/recipes-containers/runc/runc-docker_git.bb
> b/recipes-containers/runc/runc-docker_git.bb
> >> index b74ffc3..c763d71 100644
> >> --- a/recipes-containers/runc/runc-docker_git.bb
> >> +++ b/recipes-containers/runc/runc-docker_git.bb
> >> @@ -2,13 +2,13 @@ include runc.inc
> >>
> >>  # Note: this rev is before the required protocol field, update when
> all components
> >>  #       have been updated to match.
> >> -SRCREV_runc-docker =3D "17a2d451d635e5eda2e4902324428f1bc65b0364"
> >> +SRCREV_runc-docker =3D "860f061b76bb4fc671f0f9e900f7d80ff93d4eb7"
> >>  SRC_URI =3D "git://
> github.com/opencontainers/runc;branch=3Drelease-1.1;name=3Drunc-docker;pr=
otocol=3Dhttps
> \
> >>             file://0001-runc-Add-console-socket-dev-null.patch \
> >>
>  file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
> >>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
> >>            "
> >>
> >> -RUNC_VERSION =3D "1.1.5"
> >> +RUNC_VERSION =3D "1.1.7"
> >>
> >>  CVE_PRODUCT =3D "runc"
> >> --
> >> 2.40.1
> >>
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8137):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8137
> > Mute This Topic: https://lists.yoctoproject.org/mt/98905951/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--00000000000064315f060163ea68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s actually from your &quot;runc-opencontainers: upd=
ate to 1.1.7-tip&quot;, not just 1.1.7 upgrade.<div><br></div><div>I&#39;ve=
 work around ready, will send it shortly.</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 26, 2023 at 3:23=
=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">=
bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Jul 26, 2023 at 5:47=E2=80=AFAM Martin Jans=
a &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Ja=
nsa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; FYI: This change seems to break the build with gold instead of bfd lin=
ker (with ld-is-gold in DISTRO_FEATURES):<br>
&gt;<br>
<br>
I&#39;m about to push the next round of package bumps to master-next, I&#39=
;ll<br>
have a closer look at the change log to see if there&#39;s anything<br>
related to this.<br>
<br>
Bruce<br>
<br>
&gt; ld: --no-dynamic-linker: unknown option<br>
&gt;<br>
&gt; jama ~ # ld.gold --help | grep dynamic-linker<br>
&gt;=C2=A0 =C2=A0-I PROGRAM, --dynamic-linker PROGRAM<br>
&gt; jama ~ # ld.bfd --help | grep dynamic-linker<br>
&gt;=C2=A0 =C2=A0-I PROGRAM, --dynamic-linker PROGRAM<br>
&gt;=C2=A0 =C2=A0--no-dynamic-linker=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Produ=
ce an executable with no program interpreter header<br>
&gt; jama ~ # ld.lld --help | grep dynamic-linker<br>
&gt;=C2=A0 =C2=A0--dynamic-linker=3D&lt;value&gt;<br>
&gt;=C2=A0 =C2=A0--no-dynamic-linker=C2=A0 =C2=A0 =C2=A0Inhibit output of .=
interp section<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; On Mon, May 15, 2023 at 5:27=E2=80=AFPM Adrian Freihofer &lt;<a href=
=3D"mailto:adrian.freihofer@gmail.com" target=3D"_blank">adrian.freihofer@g=
mail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Bumping runc to version v1.1.7, which comprises the following comm=
its:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0860f061b (HEAD -&gt; release-1.1, tag: v1.1.7) =
VERSION: release 1.1.7<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A026480338 Merge pull request #3838 from cyphar/1=
.1-release-gpgkeys<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0f72cd0a6 Merge pull request #3845 from kolyshki=
n/1.1-rm-warning<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0c1063b1c runc.keyring: add Akihiro Suda<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0b0fae8c4 scripts: keyring validate: print some =
more information<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A079a52b43 libct/cg/sd: use systemd version when =
generating dev props<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A06a806d4d runc.keyring: add Kolyshkin<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0b6f686f2 keyring: add Aleksa&#39;s &lt;<a href=
=3D"mailto:cyphar@cyphar.com" target=3D"_blank">cyphar@cyphar.com</a>&gt; s=
igning key<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A063355bf8 keyring: add Aleksa&#39;s &lt;<a href=
=3D"mailto:asarai@suse.com" target=3D"_blank">asarai@suse.com</a>&gt; signi=
ng key<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A03bdb63bf keyring: verify runc.keyring has legit=
imate maintainer keys<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0853d5e38 scripts: release: add verification che=
cks for signing keys<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0bd1d5370 release: add runc.keyring file and scr=
ipt<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A06ccf104a merge #3818 into release-1.1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A07cd72cc3 VERSION: go back to development<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A00f48801a (tag: v1.1.6) VERSION: release 1.1.6<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A00690c4ec merge #3823 into release-1.1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0e4ce94e2 libct/cg: add misc controller to v1 dr=
ivers<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A053333a55 Merge pull request #3811 from haircomm=
ander/root-cgroup-no-init-1.1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A010cfd816 libctr/cgroups: don&#39;t take init&#3=
9;s cgroup into account<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A09c1c8446 Merge pull request #3817 from kolyshki=
n/1.1-user-exec<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0d30d240b tests/int: test for CAP_DAC_OVERRIDE<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0840b9539 Fix runc run &quot;permission denied&q=
uot; when rootless<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0c7a72aba Merge pull request #3808 from kolyshki=
n/1.1-cpuset-byte-order<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0165d2323 tests/int: add a &quot;update cpuset c=
pus range via v2 unified map&quot; test<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A026a58fdb cgroups: cpuset: fix byte order while =
parsing cpuset range to bits<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0add2f548 Merge pull request #3791 from kolyshki=
n/1.1-refresh-ci<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0c0647d3a Merge pull request #3807 from kolyshki=
n/1.1-skip-flaky-ce7<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A08d9d1d25 libct/int: make TestFdLeaks more robus=
t<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0b66d6d56 libct/int: wording nits<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0ddbb6d41 libc/int: add/use runContainerOk wrapp=
er<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A03531cc2d ci: add call to check-config.sh<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0ed9a0e1d ci/gha: bump actions/cache to v3<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A07683e508 ci/gha: switch to Go 1.19.x for valida=
te<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0568d4407 ci/gha: bump golangci-lint to 1.48<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A01f9e36c0 libct: fixes for godoc 1.19<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A050f06554 ci: bump golangci-lint to 1.46<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A077472ef6 libct: fix staticcheck warning<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A09994fe3f libct: suppress strings.Title deprecat=
ion warning<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0403ea1f0 ci/gha: convert lint-extra from a job =
to a step<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0d2c83bdf ci/gha: switch to Go 1.18.x for valida=
te<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A003a631df ci: switch to golangci-lint 1.45<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0e5a5522a Add supported Go releases (1.19, 1.20)=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A03ce12483 Dockerfile: fix build wrt new git<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0bac06cf6 ci/gha: remove stable: when installing=
 Go<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0e74040e0 build(deps): bump actions/setup-go fro=
m 2 to 3<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A055462355 Require Go 1.17, bump x/sys and x/net<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A03ce9c1e2 tests: Fix weird error on centos-9<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0abd6adde ci: bump shfmt to 3.5.1, simplify CI s=
etup<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A01a4bf049 man/*sh: fix shellcheck warnings, add =
to shellcheck<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A09201794a script/check-config.sh: fix remaining =
shellcheck warnings<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A08b976428 shfmt: add more files<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0b0fbd2f8 script/check-config.sh: fix SC2166 war=
nings<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A07f8cb3d6 script/check-config.sh: fix wrap_color=
 usage<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0f6562f19 [1.1] libct/cg/dev: skip flaky test of=
 CentOS 7<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A055b2dbf0 Merge pull request #3806 from kolyshki=
n/1.1-fix-sd-start<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A012f2f03f [1.1] runc run: refuse a non-empty cgr=
oup for systemd driver<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0e618ec36 libct/cg/sd: reset-failed and retry st=
artUnit on UnitExists<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0931b9bf3 libct/cg/sd: ignore UnitExists only fo=
r Apply(-1)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0b46ac860 libct/cg/sd: refactor startUnit<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0060a61c6 merge branch &#39;pr-3796&#39; into re=
lease-1.1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0822623b6 CHANGELOG.md: move 1.1.5 CVEs to Secur=
ity section<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A054cfb25d Makefile: add verify-changelog as rele=
ase dependency<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A07b3ac330 verify-changelog: allow non-ASCII<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A037e586ab CHANGELOG: fix a typo<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0de0c2277 [1.1] CHANGELOG: fix 1.1.5 git compare=
 link<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A016e5d1d4 merge branch &#39;pr-3799&#39; into re=
lease-1.1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A01fe2ec53 tests/int/mounts: only check non-shado=
wed mounts<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A09b8ebe4d tests/int/mount: fix issues with ro cg=
roup test<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freih=
ofer@siemens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br=
>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 recipes-containers/runc/<a href=3D"http://runc-docker_git.bb=
" rel=3D"noreferrer" target=3D"_blank">runc-docker_git.bb</a> | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker=
_git.bb" rel=3D"noreferrer" target=3D"_blank">runc-docker_git.bb</a> b/reci=
pes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferrer=
" target=3D"_blank">runc-docker_git.bb</a><br>
&gt;&gt; index b74ffc3..c763d71 100644<br>
&gt;&gt; --- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb=
" rel=3D"noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
&gt;&gt; +++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb=
" rel=3D"noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
&gt;&gt; @@ -2,13 +2,13 @@ include runc.inc<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Note: this rev is before the required protocol field, upda=
te when all components<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0have been updated to match.<br>
&gt;&gt; -SRCREV_runc-docker =3D &quot;17a2d451d635e5eda2e4902324428f1bc65b=
0364&quot;<br>
&gt;&gt; +SRCREV_runc-docker =3D &quot;860f061b76bb4fc671f0f9e900f7d80ff93d=
4eb7&quot;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencon=
tainers/runc;branch=3Drelease-1.1;name=3Drunc-docker;protocol=3Dhttps" rel=
=3D"noreferrer" target=3D"_blank">github.com/opencontainers/runc;branch=3Dr=
elease-1.1;name=3Drunc-docker;protocol=3Dhttps</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-runc-Ad=
d-console-socket-dev-null.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefil=
e-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-runc-do=
cker-SIGUSR1-daemonize.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt; -RUNC_VERSION =3D &quot;1.1.5&quot;<br>
&gt;&gt; +RUNC_VERSION =3D &quot;1.1.7&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 CVE_PRODUCT =3D &quot;runc&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.40.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8137): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8137" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8137</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/98905951=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/98905951/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--00000000000064315f060163ea68--

