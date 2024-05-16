Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1F6C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 14:46:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.15868.1715870796163806439
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 May 2024 07:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=cL+NmOQS;
 spf=pass (domain: snapchat.com, ip: 209.85.218.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59cf8140d0so292532666b.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 May 2024 07:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1715870794; x=1716475594; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LsFeb0guYS40cThgJ7rhMO7ksj3rMiZ7uJ3uwBmdaDc=;
        b=cL+NmOQSkraCdp2sysFc/vwjjOE4VgWCpsoboZ0fEBbKLpt8gaz+8Emcx3zznkYCtT
         xDmI7zZBQ7v8HQNsUBAoleheqQ9/bn4xjiTXWNZ04QEHxJiyS4MIRYxp1IZLW8EEclai
         lH2eirvfutxJkUMf1Aer9NhcwBYjnf0kIplWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715870794; x=1716475594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsFeb0guYS40cThgJ7rhMO7ksj3rMiZ7uJ3uwBmdaDc=;
        b=sI8LjZBo23oPp2TRbtrPrgTc2ppMB728H1xZr3AxL5JzInecDnv8rUqfSPXQ4OAIqk
         1pbjSvAK0AMirJW7VM6tU725+/8q2AsS6fd7y8+y+p50CLeXzl16I9oFKDW4driiYnh9
         YpLGUmIfqrVstwwogGCQmS5xhRS4Tg9q6T8l/MJyiRKorCtW7y/IAzTMoYgFQ5wQzZio
         5LTb4EuGfoqW381lEJxXg8zFtN0+R3JE3rNOj8PbSgyYglBkicrC4ru8cxcyLKiiQy5V
         sCXyMs9kIoQHb5iqy21J6Zzm+cJltWrbNn658C9gRgo5z/u52p+YaTXz9cL+YBFFyZcs
         QoFg==
X-Gm-Message-State: AOJu0YzQFz4i0PT6sLF9NxL0CBIMwu2ghO9MCXX96vobE7n2F8dDoe39
	deXLqzMbdLQcke8xX/G7X4g2VVwp+P1R2LI18FhzoWBmAChLBRweDZq/owzMnxr/lZPN0dsb8ju
	jrPFqB6IGrROu6Ue40LEn6dw+1SB9Ii2sk83jxg==
X-Google-Smtp-Source: AGHT+IHE7eIn0VzMJDDcrpuRQTckLmHzm/t2hdHkDqUhvZv86CVSp2ytoPhf4m3HE16hVuyXMm0WBKXdWVpkIt0vDZk=
X-Received: by 2002:a17:907:3601:b0:a55:9195:362c with SMTP id
 a640c23a62f3a-a5a2d66a3ffmr1472155266b.49.1715870794448; Thu, 16 May 2024
 07:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240516134007.653981-1-ecordonnier@snap.com> <CADkTA4MuPHH-+Jsfpy-TqafCuPqhNHs9ctTnw9_5XPPN2uoObA@mail.gmail.com>
In-Reply-To: <CADkTA4MuPHH-+Jsfpy-TqafCuPqhNHs9ctTnw9_5XPPN2uoObA@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 16 May 2024 16:46:23 +0200
Message-ID: <CAHUKmYZWJY8jEhPU0-bM1cJwukfZrzks=RWXJSpfQ_8w-PA4ew@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] crun: update to v1.15
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002fdc2e0618934d72"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 May 2024 14:46:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8727

--0000000000002fdc2e0618934d72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Bruce. What is M1?

On Thu, May 16, 2024 at 4:40=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> I'm holding package updates back until the end of M1 / start
> of M2 and focusing on feature work early in the cycle (for once!).
>
> But I've marked this and will have a look as I go through and
> update all the packages for M2.
>
> Bruce
>
> On Thu, May 16, 2024 at 9:40=E2=80=AFAM Etienne Cordonnier via
> lists.yoctoproject.org <ecordonnier=3Dsnap.com@lists.yoctoproject.org>
> wrote:
> >
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > Bumping crun to version 1.15-0-ge6eacaf, which comprises the following
> commits:
> >
> >     e6eacaf NEWS: tag 1.15
> >     f904485 Merge pull request #1459 from lsm5/packit-centos
> >     08b5e78 Packit: Enable c10s downstream sync, rhel / centos
> separation in tests
> >     73cb769 Merge pull request #1456 from martinetd/cleanup_cgroup_moun=
t
> >     4618d50 status: rmdirfd: try harder to remove mount points
> >     c72bf7f linux: cgroups: cleanup unused mount if move failed
> >     1f5fa44 Merge pull request #1457 from giuseppe/fix-compiler-warning
> >     ff321e1 tests: install slirp4netns
> >     a946f04 utils: fix a compiler warning
> >     6df8cef Merge pull request #1449 from lsm5/rpm-rhel-wasm
> >     aa72cc4 Packit/TMT: add centos-stream-10, cleanup tests
> >     d075e53 Merge pull request #1455 from giuseppe/update-npm
> >     f39bc4a tests, oci-validation: use perl tap driver
> >     f5548f2 tests, oci-validation: use tap-18
> >     18e84a1 tests, oci-validation: use git clone
> >     b4539b5 Merge pull request #1453 from saschagrunert/s390x-musl
> >     49090f2 Build s390x binaries using musl libc
> >     8cd3e02 Merge pull request #1454 from saschagrunert/clang-format
> >     307d35e Fix clang format test
> >     37670c8 Merge pull request #1451 from
> containers/dependabot/github_actions/uraimo/run-on-arch-action-2.7.2
> >     4b8f7c9 build(deps): bump uraimo/run-on-arch-action from 2.7.1 to
> 2.7.2
> >     68df083 Merge pull request #1448 from Ecordonnier/eco/bump-libocisp=
ec
> >     e6a8d51 libocispec: update
> >     a1ed024 Merge pull request #1447 from giuseppe/bump-tap
> >     1809973 tests: use npm-18
> >     7202095 Merge pull request #1444 from
> haircommander/potentially_unsafe_config_annotations
> >     475a3fd features: add support for potentiallyUnsafeConfigAnnotation=
s
> >     a32cc45 Merge pull request #1432 from
> sohankunkerkar/add-preload-option
> >     4f5479e src/libcrun/handlers: add option to load wasi-nn plugin for
> wasmedge
> >     c90b8c9 Merge pull request #1443 from
> giuseppe/use-zstd-instead-of-xz-for-releases
> >     631e767 release: use zstd instead of xz
> >     0722689 release.sh: generate .zst release instead of .xz
> >     d05a5dd Merge pull request #1441 from kolyshkin/fixup
> >     3ad68ed linux: fixup libcrun_safe_chdir
> >     dcbdf9d Merge pull request #1440 from lsm5/rpm-remove-eln
> >     699564b rpm: remove eln macro
> >     d43d79f Merge pull request #1439 from
> lsm5/packit-failure-comment-reuse
> >     f50da23 Packit: reuse non-RHEL failure message notification on RHEL
> >     c4afd9c Merge pull request #1425 from lsm5/podman-revdep-tests
> >     0b7fc08 packit: podman reverse dependency tests
> >     64ee22c Merge pull request #1431 from flouthoc/use-runtimespec-v1.2=
.0
> >     0dbb353 Merge pull request #1430 from giuseppe/make-error-clearer
> >     820471a libocispec: use runtime-spec v1.2.0
> >     9eea9ff cgroup: make error clearer
> >     cde8f10 Merge pull request #1429 from giuseppe/add-flag-keep-to-run
> >     59ad70a container: validate option flags
> >     7918dca container: split create and run options
> >     8894495 crun: add option --keep to run
> >     35dccc3 libcrun, run: add option to not delete containers
> >     f04eebe Merge pull request #1427 from giuseppe/tag-1.14.4
> >     a220ca6 NEWS: tag 1.14.4
> >     31aab34 Merge pull request #1424 from saschagrunert/s390x
> >     6cd74cb Add support for s390x
> >     89d4446 Merge pull request #1422 from
> giuseppe/find-rro-bind-mount-from-file
> >     5884fd4 linux: fix mount of file with recursive flags
> >     b9e87e7 tests: test bind mounts of files
> >     3a07f6e Merge pull request #1415 from
> debarshiray/wip/rishi/rpm-relative-not-absolute-symlink
> >     e81086b rpm: Use relative, not absolute, symbolic links
> >     be5feff Merge pull request #1420 from
> giuseppe/enable-parallel-nix-builds
> >     9079a6d release: enable parallel builds
> >     d8aabe5 Merge pull request #1419 from giuseppe/drop-check-version
> >
> > crun/libocispec: update to -tip:
> >
> >     c715dcd Merge pull request #133 from Ecordonnier/eco/clang17
> >     86650dc fix compilation error with clang++17
> >     20d3936 helpers.py: remove __str__()
> >     afed951 generate.py: fix some typos
> >     f76be64 Merge pull request #131 from flouthoc/sync-runtime-spec
> >     daeb197 runtime-spec: use version v1.2.0
> >     3d16826 Merge pull request #130 from
> Ilya-source/optimize_strings_handling
> >     66f6f71 optimize writefile
> >     e9a99a8 Optimize headers writefile
> >     7a5f2b6 Refresh strings format sources
> >     210f4d3 Refresh strings format headers
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  recipes-containers/crun/crun_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-containers/crun/crun_git.bb
> b/recipes-containers/crun/crun_git.bb
> > index 89ba21b4..4dde55c6 100644
> > --- a/recipes-containers/crun/crun_git.bb
> > +++ b/recipes-containers/crun/crun_git.bb
> > @@ -3,8 +3,8 @@ LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> >  PRIORITY =3D "optional"
> >
> > -SRCREV_crun =3D "89d44467e3b410b73f2065756a12789be45b855b"
> > -SRCREV_libocispec =3D "19c05670c37a42c217caa7b141bcaada7867cc15"
> > +SRCREV_crun =3D "e6eacaf4034e84185fd8780ac9262bbf57082278"
> > +SRCREV_libocispec =3D "c715dcdbab8fe592daa8a11cbabc75aa76534c80"
> >  SRCREV_ispec =3D "9615142d016838b5dfe7453f80af0be74feb5c7c"
> >  SRCREV_rspec =3D "720792f25ae6e9ee6b1332db698f37659e69ce8d"
> >  SRCREV_yajl =3D "f344d21280c3e4094919fd318bc5ce75da91fc06"
> > @@ -17,7 +17,7 @@ SRC_URI =3D "git://
> github.com/containers/crun.git;branch=3Dmain;name=3Dcrun;protocol=3Dh
> >             git://
> github.com/containers/yajl.git;branch=3Dmain;name=3Dyajl;destsuffix=3Dgit=
/libocispec/yajl;protocol=3Dhttps
> \
> >            "
> >
> > -PV =3D "v1.14.3+git${SRCREV_crun}"
> > +PV =3D "v1.15+git${SRCREV_crun}"
> >  S =3D "${WORKDIR}/git"
> >
> >  REQUIRED_DISTRO_FEATURES ?=3D "systemd seccomp"
> > --
> > 2.36.1.vfs.0.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8725):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_meta-2Dvirtualization_message_8725&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3Ds4O-8IgHs3CqqQNrGDnhDORAs66cKMmnLSc6Owex82Ujudr2Dep27NNPXHMvVqZs&s=3DMac=
vtcQdmLQWovkmkOH_3R_QOwojTFisah796x3CQhY&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_mt_106134562_1050810&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Ds4O-8IgHs3Cqq=
QNrGDnhDORAs66cKMmnLSc6Owex82Ujudr2Dep27NNPXHMvVqZs&s=3D25VTjpldD8F1nWSsQap=
he51iF3Fgmwrpfljvpq7elUM&e=3D
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_meta-2Dvirtualization_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCH=
vabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Ds4O-=
8IgHs3CqqQNrGDnhDORAs66cKMmnLSc6Owex82Ujudr2Dep27NNPXHMvVqZs&s=3DQ9cedjpIER=
KBLkcVaRI3Sp8zVpKDqKQYIkuHQXcEYYg&e=3D
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

--0000000000002fdc2e0618934d72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Bruce. What is M1?</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 16, 2024 at 4:40=E2=
=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bru=
ce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">I&#39;m holding package updates back until the end of =
M1 / start<br>
of M2 and focusing on feature work early in the cycle (for once!).<br>
<br>
But I&#39;ve marked this and will have a look as I go through and<br>
update all the packages for M2.<br>
<br>
Bruce<br>
<br>
On Thu, May 16, 2024 at 9:40=E2=80=AFAM Etienne Cordonnier via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com=
@lists.yoctoproject.org" target=3D"_blank">snap.com@lists.yoctoproject.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;<br>
&gt; Bumping crun to version 1.15-0-ge6eacaf, which comprises the following=
 commits:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0e6eacaf NEWS: tag 1.15<br>
&gt;=C2=A0 =C2=A0 =C2=A0f904485 Merge pull request #1459 from lsm5/packit-c=
entos<br>
&gt;=C2=A0 =C2=A0 =C2=A008b5e78 Packit: Enable c10s downstream sync, rhel /=
 centos separation in tests<br>
&gt;=C2=A0 =C2=A0 =C2=A073cb769 Merge pull request #1456 from martinetd/cle=
anup_cgroup_mount<br>
&gt;=C2=A0 =C2=A0 =C2=A04618d50 status: rmdirfd: try harder to remove mount=
 points<br>
&gt;=C2=A0 =C2=A0 =C2=A0c72bf7f linux: cgroups: cleanup unused mount if mov=
e failed<br>
&gt;=C2=A0 =C2=A0 =C2=A01f5fa44 Merge pull request #1457 from giuseppe/fix-=
compiler-warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0ff321e1 tests: install slirp4netns<br>
&gt;=C2=A0 =C2=A0 =C2=A0a946f04 utils: fix a compiler warning<br>
&gt;=C2=A0 =C2=A0 =C2=A06df8cef Merge pull request #1449 from lsm5/rpm-rhel=
-wasm<br>
&gt;=C2=A0 =C2=A0 =C2=A0aa72cc4 Packit/TMT: add centos-stream-10, cleanup t=
ests<br>
&gt;=C2=A0 =C2=A0 =C2=A0d075e53 Merge pull request #1455 from giuseppe/upda=
te-npm<br>
&gt;=C2=A0 =C2=A0 =C2=A0f39bc4a tests, oci-validation: use perl tap driver<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0f5548f2 tests, oci-validation: use tap-18<br>
&gt;=C2=A0 =C2=A0 =C2=A018e84a1 tests, oci-validation: use git clone<br>
&gt;=C2=A0 =C2=A0 =C2=A0b4539b5 Merge pull request #1453 from saschagrunert=
/s390x-musl<br>
&gt;=C2=A0 =C2=A0 =C2=A049090f2 Build s390x binaries using musl libc<br>
&gt;=C2=A0 =C2=A0 =C2=A08cd3e02 Merge pull request #1454 from saschagrunert=
/clang-format<br>
&gt;=C2=A0 =C2=A0 =C2=A0307d35e Fix clang format test<br>
&gt;=C2=A0 =C2=A0 =C2=A037670c8 Merge pull request #1451 from containers/de=
pendabot/github_actions/uraimo/run-on-arch-action-2.7.2<br>
&gt;=C2=A0 =C2=A0 =C2=A04b8f7c9 build(deps): bump uraimo/run-on-arch-action=
 from 2.7.1 to 2.7.2<br>
&gt;=C2=A0 =C2=A0 =C2=A068df083 Merge pull request #1448 from Ecordonnier/e=
co/bump-libocispec<br>
&gt;=C2=A0 =C2=A0 =C2=A0e6a8d51 libocispec: update<br>
&gt;=C2=A0 =C2=A0 =C2=A0a1ed024 Merge pull request #1447 from giuseppe/bump=
-tap<br>
&gt;=C2=A0 =C2=A0 =C2=A01809973 tests: use npm-18<br>
&gt;=C2=A0 =C2=A0 =C2=A07202095 Merge pull request #1444 from haircommander=
/potentially_unsafe_config_annotations<br>
&gt;=C2=A0 =C2=A0 =C2=A0475a3fd features: add support for potentiallyUnsafe=
ConfigAnnotations<br>
&gt;=C2=A0 =C2=A0 =C2=A0a32cc45 Merge pull request #1432 from sohankunkerka=
r/add-preload-option<br>
&gt;=C2=A0 =C2=A0 =C2=A04f5479e src/libcrun/handlers: add option to load wa=
si-nn plugin for wasmedge<br>
&gt;=C2=A0 =C2=A0 =C2=A0c90b8c9 Merge pull request #1443 from giuseppe/use-=
zstd-instead-of-xz-for-releases<br>
&gt;=C2=A0 =C2=A0 =C2=A0631e767 release: use zstd instead of xz<br>
&gt;=C2=A0 =C2=A0 =C2=A00722689 release.sh: generate .zst release instead o=
f .xz<br>
&gt;=C2=A0 =C2=A0 =C2=A0d05a5dd Merge pull request #1441 from kolyshkin/fix=
up<br>
&gt;=C2=A0 =C2=A0 =C2=A03ad68ed linux: fixup libcrun_safe_chdir<br>
&gt;=C2=A0 =C2=A0 =C2=A0dcbdf9d Merge pull request #1440 from lsm5/rpm-remo=
ve-eln<br>
&gt;=C2=A0 =C2=A0 =C2=A0699564b rpm: remove eln macro<br>
&gt;=C2=A0 =C2=A0 =C2=A0d43d79f Merge pull request #1439 from lsm5/packit-f=
ailure-comment-reuse<br>
&gt;=C2=A0 =C2=A0 =C2=A0f50da23 Packit: reuse non-RHEL failure message noti=
fication on RHEL<br>
&gt;=C2=A0 =C2=A0 =C2=A0c4afd9c Merge pull request #1425 from lsm5/podman-r=
evdep-tests<br>
&gt;=C2=A0 =C2=A0 =C2=A00b7fc08 packit: podman reverse dependency tests<br>
&gt;=C2=A0 =C2=A0 =C2=A064ee22c Merge pull request #1431 from flouthoc/use-=
runtimespec-v1.2.0<br>
&gt;=C2=A0 =C2=A0 =C2=A00dbb353 Merge pull request #1430 from giuseppe/make=
-error-clearer<br>
&gt;=C2=A0 =C2=A0 =C2=A0820471a libocispec: use runtime-spec v1.2.0<br>
&gt;=C2=A0 =C2=A0 =C2=A09eea9ff cgroup: make error clearer<br>
&gt;=C2=A0 =C2=A0 =C2=A0cde8f10 Merge pull request #1429 from giuseppe/add-=
flag-keep-to-run<br>
&gt;=C2=A0 =C2=A0 =C2=A059ad70a container: validate option flags<br>
&gt;=C2=A0 =C2=A0 =C2=A07918dca container: split create and run options<br>
&gt;=C2=A0 =C2=A0 =C2=A08894495 crun: add option --keep to run<br>
&gt;=C2=A0 =C2=A0 =C2=A035dccc3 libcrun, run: add option to not delete cont=
ainers<br>
&gt;=C2=A0 =C2=A0 =C2=A0f04eebe Merge pull request #1427 from giuseppe/tag-=
1.14.4<br>
&gt;=C2=A0 =C2=A0 =C2=A0a220ca6 NEWS: tag 1.14.4<br>
&gt;=C2=A0 =C2=A0 =C2=A031aab34 Merge pull request #1424 from saschagrunert=
/s390x<br>
&gt;=C2=A0 =C2=A0 =C2=A06cd74cb Add support for s390x<br>
&gt;=C2=A0 =C2=A0 =C2=A089d4446 Merge pull request #1422 from giuseppe/find=
-rro-bind-mount-from-file<br>
&gt;=C2=A0 =C2=A0 =C2=A05884fd4 linux: fix mount of file with recursive fla=
gs<br>
&gt;=C2=A0 =C2=A0 =C2=A0b9e87e7 tests: test bind mounts of files<br>
&gt;=C2=A0 =C2=A0 =C2=A03a07f6e Merge pull request #1415 from debarshiray/w=
ip/rishi/rpm-relative-not-absolute-symlink<br>
&gt;=C2=A0 =C2=A0 =C2=A0e81086b rpm: Use relative, not absolute, symbolic l=
inks<br>
&gt;=C2=A0 =C2=A0 =C2=A0be5feff Merge pull request #1420 from giuseppe/enab=
le-parallel-nix-builds<br>
&gt;=C2=A0 =C2=A0 =C2=A09079a6d release: enable parallel builds<br>
&gt;=C2=A0 =C2=A0 =C2=A0d8aabe5 Merge pull request #1419 from giuseppe/drop=
-check-version<br>
&gt;<br>
&gt; crun/libocispec: update to -tip:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0c715dcd Merge pull request #133 from Ecordonnier/ec=
o/clang17<br>
&gt;=C2=A0 =C2=A0 =C2=A086650dc fix compilation error with clang++17<br>
&gt;=C2=A0 =C2=A0 =C2=A020d3936 helpers.py: remove __str__()<br>
&gt;=C2=A0 =C2=A0 =C2=A0afed951 generate.py: fix some typos<br>
&gt;=C2=A0 =C2=A0 =C2=A0f76be64 Merge pull request #131 from flouthoc/sync-=
runtime-spec<br>
&gt;=C2=A0 =C2=A0 =C2=A0daeb197 runtime-spec: use version v1.2.0<br>
&gt;=C2=A0 =C2=A0 =C2=A03d16826 Merge pull request #130 from Ilya-source/op=
timize_strings_handling<br>
&gt;=C2=A0 =C2=A0 =C2=A066f6f71 optimize writefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0e9a99a8 Optimize headers writefile<br>
&gt;=C2=A0 =C2=A0 =C2=A07a5f2b6 Refresh strings format sources<br>
&gt;=C2=A0 =C2=A0 =C2=A0210f4d3 Refresh strings format headers<br>
&gt;<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/crun/<a href=3D"http://crun_git.bb" rel=3D"no=
referrer" target=3D"_blank">crun_git.bb</a> | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/crun/<a href=3D"http://crun_git.bb" re=
l=3D"noreferrer" target=3D"_blank">crun_git.bb</a> b/recipes-containers/cru=
n/<a href=3D"http://crun_git.bb" rel=3D"noreferrer" target=3D"_blank">crun_=
git.bb</a><br>
&gt; index 89ba21b4..4dde55c6 100644<br>
&gt; --- a/recipes-containers/crun/<a href=3D"http://crun_git.bb" rel=3D"no=
referrer" target=3D"_blank">crun_git.bb</a><br>
&gt; +++ b/recipes-containers/crun/<a href=3D"http://crun_git.bb" rel=3D"no=
referrer" target=3D"_blank">crun_git.bb</a><br>
&gt; @@ -3,8 +3,8 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4=
486a80fdaf4a4263&quot;<br>
&gt;=C2=A0 PRIORITY =3D &quot;optional&quot;<br>
&gt;<br>
&gt; -SRCREV_crun =3D &quot;89d44467e3b410b73f2065756a12789be45b855b&quot;<=
br>
&gt; -SRCREV_libocispec =3D &quot;19c05670c37a42c217caa7b141bcaada7867cc15&=
quot;<br>
&gt; +SRCREV_crun =3D &quot;e6eacaf4034e84185fd8780ac9262bbf57082278&quot;<=
br>
&gt; +SRCREV_libocispec =3D &quot;c715dcdbab8fe592daa8a11cbabc75aa76534c80&=
quot;<br>
&gt;=C2=A0 SRCREV_ispec =3D &quot;9615142d016838b5dfe7453f80af0be74feb5c7c&=
quot;<br>
&gt;=C2=A0 SRCREV_rspec =3D &quot;720792f25ae6e9ee6b1332db698f37659e69ce8d&=
quot;<br>
&gt;=C2=A0 SRCREV_yajl =3D &quot;f344d21280c3e4094919fd318bc5ce75da91fc06&q=
uot;<br>
&gt; @@ -17,7 +17,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/containers/crun.git;branch=3Dmain;name=3Dcrun;protocol=3Dh" rel=3D"norefer=
rer" target=3D"_blank">github.com/containers/crun.git;branch=3Dmain;name=3D=
crun;protocol=3Dh</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:/=
/github.com/containers/yajl.git;branch=3Dmain;name=3Dyajl;destsuffix=3Dgit/=
libocispec/yajl;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/containers/yajl.git;branch=3Dmain;name=3Dyajl;destsuffix=3Dgit/liboc=
ispec/yajl;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -PV =3D &quot;v1.14.3+git${SRCREV_crun}&quot;<br>
&gt; +PV =3D &quot;v1.15+git${SRCREV_crun}&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES ?=3D &quot;systemd seccomp&quot;<br>
&gt; --<br>
&gt; 2.36.1.vfs.0.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8725): <a href=3D"https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_meta-2Dvirtualization_messa=
ge_8725&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&=
amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Ds4O-8IgHs3CqqQN=
rGDnhDORAs66cKMmnLSc6Owex82Ujudr2Dep27NNPXHMvVqZs&amp;s=3DMacvtcQdmLQWovkmk=
OH_3R_QOwojTFisah796x3CQhY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.or=
g_g_meta-2Dvirtualization_message_8725&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3Ds4O-8IgHs3CqqQNrGDnhDORAs66cKMmnLSc6Owex82Ujudr2Dep27NNPXHM=
vVqZs&amp;s=3DMacvtcQdmLQWovkmkOH_3R_QOwojTFisah796x3CQhY&amp;e=3D</a> <br>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.yoctoproject.org_mt_106134562_1050810&amp;d=3DDwIFaQ&amp=
;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&amp;m=3Ds4O-8IgHs3CqqQNrGDnhDORAs66cKMmnLSc6Owex8=
2Ujudr2Dep27NNPXHMvVqZs&amp;s=3D25VTjpldD8F1nWSsQaphe51iF3Fgmwrpfljvpq7elUM=
&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_mt_106134562_1050810&amp=
;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhk=
bNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Ds4O-8IgHs3CqqQNrGDnhDORAs6=
6cKMmnLSc6Owex82Ujudr2Dep27NNPXHMvVqZs&amp;s=3D25VTjpldD8F1nWSsQaphe51iF3Fg=
mwrpfljvpq7elUM&amp;e=3D</a> <br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.yoctoproject.org_g_meta-2Dvirtualization_unsub&amp;d=3DDwIFa=
Q&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Ds4O-8IgHs3CqqQNrGDnhDORAs66cKMmnLSc6=
Owex82Ujudr2Dep27NNPXHMvVqZs&amp;s=3DQ9cedjpIERKBLkcVaRI3Sp8zVpKDqKQYIkuHQX=
cEYYg&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_meta-2Dvirtualiza=
tion_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Ds4O-8IgHs3Cq=
qQNrGDnhDORAs66cKMmnLSc6Owex82Ujudr2Dep27NNPXHMvVqZs&amp;s=3DQ9cedjpIERKBLk=
cVaRI3Sp8zVpKDqKQYIkuHQXcEYYg&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--0000000000002fdc2e0618934d72--

