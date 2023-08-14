Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9189AC001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 12:44:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.106650.1692017079713743986
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 05:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Yk3dSGGD;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3197b461bb5so489957f8f.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 05:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692017078; x=1692621878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mvx6hVaqYDXmPuWRKhEXlBA5ss+bEpy7z8WqojE9S6A=;
        b=Yk3dSGGDoYR1eg6Hp6qtLhEArIlWw8oz5M5wrFPK5X7Ehu0oHh6KsWzI6rPOJ1KUtp
         SlbgGQoFVWA7YKZDjOgH5vL5qu7LoNb89O5AyFJ1FBWcsG6BNW8HvjxlWP4G4/vitBk4
         CSNWJkNP+AWSbx7VAQyp9oS2WKo879Teq4+PeEM454C7H3YvhBIaXxcjI9fcGteQlaEa
         09wAY0c1wDjJ4rvOM+FEPkaCyWFLaDZNPRw8wxDsW5qAv8EGocyH94no7OHZ9HvxCtky
         VDuL1idY5PqplTx5d6guu6jVBQCInXOFQlq9hnLSX28jafhBnWyOztRAxKkwfjzUgQgC
         0ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692017078; x=1692621878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvx6hVaqYDXmPuWRKhEXlBA5ss+bEpy7z8WqojE9S6A=;
        b=cvrCJjTe3/pv7xVjDSwgmxw+t/aMXmKNZF5r4MXrslQE6VTsQCnx9Js6sLUCw927Ue
         JYf5rNMPIXMuMRiJooksMLxF3cfBmIvgdEXuv633D5UaLya/XZci14aeJPHP6u4FlnL5
         K7lo8PsU7DyTLuYTqEN1JxiF369cIpHD2zgl0cpjcUWYYONRlJqKba/i9L/vrcxMmS3c
         +UILxf/5M2wE2fWY2IEfEb+khveM4TD7cSR61quRsBAcTGsuDwfaV1dFdxwnPph5yjSQ
         YZjeafWbqOZbC3MMP4iBU87cutGwFCsLLY4viQpcMOR6UuW1mX2NsqkLcjLiASvaS7PX
         cBwQ==
X-Gm-Message-State: AOJu0YwdaPRYzGi//YX/gb3NWJVAyvV6WgjObEFeZGJYuGXDGw2wapq1
	/pUsKP2e8MROoiXv13dVsTgrW7arctJzJSdS7aE=
X-Google-Smtp-Source: AGHT+IEEiP0zvdBCsamnrzhQuhhHOq4pw+tkCgOVKC8vUKPN7Ca07kEIxWpAfXZ5KDiXWDyG94NLe1dgFzZxNWlQw4c=
X-Received: by 2002:adf:e30b:0:b0:314:11fe:c72e with SMTP id
 b11-20020adfe30b000000b0031411fec72emr7118595wrj.46.1692017077866; Mon, 14
 Aug 2023 05:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230802082210.1438735-1-mikko.rapeli@linaro.org>
 <CADkTA4OqTf4Z3kvdpnjjUHMKDnsfCpYWh0km-g7vaxu99X1x1w@mail.gmail.com> <ZNnFaZr31xzBO1Wa@nuoska>
In-Reply-To: <ZNnFaZr31xzBO1Wa@nuoska>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Aug 2023 14:44:22 +0200
Message-ID: <CA+chaQdgEY33tZcAiKbqO1pUvpF-4DTsjx6MmqnXdQq1GdnXGQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: update from 24.0.2 to 24.0.5
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org, 
	Javier Tia <javier.tia@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e15bc10602e16cc4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 12:44:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8183

--000000000000e15bc10602e16cc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

looks like kirkstone and dunfell are affected as well after go backports:
kirkstone: https://lists.openembedded.org/g/openembedded-core/message/18508=
2
dunfell: https://lists.openembedded.org/g/openembedded-core/message/185895

Cheers,

On Mon, Aug 14, 2023 at 8:11=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Hi, would be nice to get this or similar change applied to master to get
> docker
> container network connections working again.
>
> FWIW, kirkstone branch suffers from same problem but docker and go
> versions are different. Point release update could fix the issue there
> too.
>
> Cheers,
>
> -Mikko
>
> On Wed, Aug 02, 2023 at 09:12:25AM -0400, Bruce Ashfield wrote:
> > Thanks for the change, I'll double check my pending set of component
> > updates against this.
> >
> > I have a full set of updates under test, but have been out of the
> > office the last week, so they are a bit delayed in making it to
> > master-next.
> >
> > Bruce
> >
> > On Wed, Aug 2, 2023 at 4:22=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linar=
o.org>
> wrote:
> > >
> > > From: Mikko Rapeli <mikko.rapeli@linaro.org>
> > >
> > > go 1.20.6 from poky is not compatible with docker 24.0.2 and network
> > > stack inside container is failing with "invalid Host header" error,
> > > see for example https://github.com/moby/moby/issues/45935
> > >
> > > 24.0.5 contains the fixes for go and also other bug fixes.
> > > Suggested by Javier Tia <javier.tia@linaro.org>.
> > >
> > > Changes listed in
> > > https://docs.docker.com/engine/release-notes/24.0/ are:
> > >
> > > 24.0.5
> > >
> > > 2023-07-24
> > >
> > > For a full list of pull requests and changes in this release, refer t=
o
> > > the relevant GitHub milestones:
> > >
> > >     docker/cli, 24.0.5 milestone
> > >     moby/moby, 24.0.5 milestone
> > >
> > > Bug fixes and enhancements
> > >
> > >     The Go client now avoids using UNIX socket paths in the HTTP Host=
:
> > > header, in order to be compatible with changes introduced in go1.20.6=
.
> > > moby/moby#45962, moby/moby#45990
> > >     containerd storage backend: Fix Variant not being included in
> docker
> > > image inspect and GET /images/{name}/json. moby/moby#46025
> > >     containerd storage backend: Prevent potential garbage collection =
of
> > > content during image export. moby/moby#46021
> > >     containerd storage backend: Prevent duplicate digest entries in
> > > RepoDigests. moby/moby#46014
> > >     containerd storage backend: Fix operations taking place against t=
he
> > > incorrect tag when working with an image referenced by tag and digest=
.
> > > moby/moby#46013
> > >     containerd storage backend: Fix a panic caused by EXPOSE when
> > > building containers with the legacy builder. moby/moby#45921
> > >     Fix a regression causing unintuitive errors to be returned when
> > > attempting to create an overlay network on a non-Swarm node.
> > > moby/moby#45974
> > >     Properly report errors parsing volume specifications from the
> > > command line. docker/cli#4423
> > >     Fix a panic caused when auths: null is found in the CLI config
> file.
> > > docker/cli#4450
> > >
> > > Packaging updates
> > >
> > >     Use init scripts as provided by in moby/moby contrib/init.
> > > docker/docker-ce-packaging#914, docker/docker-ce-packaging#926
> > >     Drop Upstart from contrib/init. moby/moby#46044
> > >     Upgrade Go to go1.20.6. docker/cli#4428, moby/moby#45970,
> > > docker/docker-ce-packaging#921
> > >     Upgrade Compose to v2.20.2. docker/docker-ce-packaging#924
> > >     Upgrade buildx to v0.11.2. docker/docker-ce-packaging#922
> > >
> > > 24.0.4
> > >
> > > 2023-07-07
> > >
> > > For a full list of pull requests and changes in this release, refer t=
o
> > > the relevant GitHub milestones:
> > >
> > >     docker/cli, 24.0.4 milestone
> > >     moby/moby, 24.0.4 milestone
> > >
> > > Bug fixes and enhancements
> > >
> > >     Fix a regression introduced during 24.0.3 that causes a panic
> during
> > > live-restore of containers with bind mounts. moby/moby#45903
> > >
> > > 24.0.3
> > >
> > > 2023-07-06
> > >
> > > For a full list of pull requests and changes in this release, refer t=
o
> > > the relevant GitHub milestones:
> > >
> > >     docker/cli, 24.0.3 milestone
> > >     moby/moby, 24.0.3 milestone
> > >
> > > Bug fixes and enhancements
> > >
> > >     containerd image store: Fix an issue where multi-platform images
> > > that did not include a manifest for the default platform could not be
> > > interacted with. moby/moby#45849
> > >     containerd image store: Fix specious attempts to cache FROM scrat=
ch
> > > in container builds. moby/moby#45822
> > >     containerd image store: Fix docker cp with snapshotters that cann=
ot
> > > mount the same content multiple times. moby/moby#45780, moby/moby#457=
86
> > >     containerd image store: Fix builds with type=3Dimage not being
> > > correctly unpacked/stored. moby/moby#45692
> > >     containerd image store: Fix incorrectly attempting to unpack
> > > pseudo-images (including attestations) in docker load. moby/moby#4568=
8
> > >     containerd image store: Correctly set the user agent, and include
> > > additional information like the snapshotter when interacting with
> > > registries. moby/moby#45671, moby/moby#45684
> > >     containerd image store: Fix a failure to unpack already-pulled
> > > content after switching between snapshotters. moby/moby#45678
> > >     containerd image store: Fix images that have been re-tagged or wi=
th
> > > all tags removed being pruned while still in use. moby/moby#45857
> > >     Fix a Swarm CSI issue where the Topology field was not propagated
> > > into NodeCSIInfo. moby/moby#45810
> > >     Fix failures to add new Swarm managers caused by a very large raf=
t
> > > log. moby/moby#45703, moby/swarmkit#3122, moby/swarmkit#3128
> > >     name_to_handle_at(2) is now always allowed in the default seccomp
> > > profile. moby/moby#45833
> > >     Fix an issue that prevented encrypted Swarm overlay networks from
> > > working on ports other than the default (4789). moby/moby#45637
> > >     Fix a failure to restore mount reference-counts during
> live-restore.
> > > moby/moby#45824
> > >     Fix various networking-related failures during live-restore.
> > > moby/moby#45658, moby/moby#45659
> > >     Fix running containers restoring with a zero (successful) exit
> > > status when the daemon is unexpectedly terminated. moby/moby#45801
> > >     Fix a potential panic while executing healthcheck probes.
> > > moby/moby#45798
> > >     Fix a panic caused by a race condition in container exec start.
> > > moby/moby#45794
> > >     Fix an exception caused by attaching a terminal to an exec with a
> > > non-existent command. moby/moby#45643
> > >     Fix host-gateway with BuildKit by passing the IP as a label (also
> > > requires docker/buildx#1894). moby/moby#45790
> > >     Fix an issue where POST /containers/{id}/stop would forcefully
> > > terminate the container when the request was canceled, instead of
> > > waiting until the specified timeout for a =E2=80=98graceful=E2=80=99 =
stop.
> > > moby/moby#45774
> > >     Fix an issue where docker cp -a from the root (/) directory would
> > > fail. moby/moby#45748
> > >     Improve compatibility with non-runc container runtimes by more
> > > correctly setting resource constraint parameters in the OCI config.
> > > moby/moby#45746
> > >     Fix an issue caused by overlapping subuid/subgid ranges in certai=
n
> > > configurations (e.g. LDAP) in rootless mode. moby/moby#45747,
> > > rootless-containers/rootlesskit#369
> > >     Greatly reduce CPU and memory usage while populating the Debug
> > > section of GET /info. moby/moby#45856
> > >     Fix an issue where debug information was not correctly printed
> > > during docker info when only the client is in debug mode.
> > > docker/cli#4393
> > >     Fix issues related to hung connections when connecting to hosts
> over
> > > a SSH connection. docker/cli#4395
> > >
> > > Packaging updates
> > >
> > >     Upgrade Go to go1.20.5. moby/moby#45745, docker/cli#4351,
> > > docker/docker-ce-packaging#904
> > >     Upgrade Compose to v2.19.1. docker/docker-ce-packaging#916
> > >     Upgrade buildx to v0.11.1. docker/docker-ce-packaging#918
> > >
> > > Cc: Javier Tia <javier.tia@linaro.org>
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  recipes-containers/docker/docker-moby_git.bb | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/recipes-containers/docker/docker-moby_git.bb
> b/recipes-containers/docker/docker-moby_git.bb
> > > index 2fc11d0..de20aa6 100644
> > > --- a/recipes-containers/docker/docker-moby_git.bb
> > > +++ b/recipes-containers/docker/docker-moby_git.bb
> > > @@ -44,9 +44,9 @@ DESCRIPTION =3D "Linux container runtime \
> > >  # so we get that tag, and make it our SRCREVS:
> > >  #
> > >
> > > -SRCREV_moby =3D "d7aa1e14e521af24c0aca800a837866f514f46f7"
> > > +SRCREV_moby =3D "a61e2b4c9c5f7c241aeb37f389b4444aee26bea4"
> > >  SRCREV_libnetwork =3D "3f0048413d95802b9c6c836eba06bfc54f9dbd03"
> > > -SRCREV_cli =3D "0823df7daa197bba96f2f2a85b9cbe156df78d43"
> > > +SRCREV_cli =3D "ced099660009713e0e845eeb754e6050dbaa45d0"
> > >  SRCREV_FORMAT =3D "moby_libnetwork"
> > >  SRC_URI =3D "\
> > >         git://
> github.com/moby/moby.git;branch=3D24.0;name=3Dmoby;protocol=3Dhttps \
> > > @@ -66,7 +66,7 @@ require docker.inc
> > >  LICENSE =3D "Apache-2.0"
> > >  LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28"
> > >
> > > -DOCKER_VERSION =3D "24.0.2"
> > > +DOCKER_VERSION =3D "24.0.5"
> > >  PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
> > >
> > >  CVE_PRODUCT =3D "docker mobyproject:moby"
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8177):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8177
> Mute This Topic: https://lists.yoctoproject.org/mt/100501205/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e15bc10602e16cc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>looks like kirkstone and dunfell ar=
e affected as well after go backports:</div><div>kirkstone: <a href=3D"http=
s://lists.openembedded.org/g/openembedded-core/message/185082">https://list=
s.openembedded.org/g/openembedded-core/message/185082</a><br></div><div>dun=
fell: <a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/185895">https://lists.openembedded.org/g/openembedded-core/message/185895<=
/a><br></div><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 14, 2023 at 8:11=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" tar=
get=3D"_blank">mikko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi, would be nice to get this or simi=
lar change applied to master to get docker<br>
container network connections working again.<br>
<br>
FWIW, kirkstone branch suffers from same problem but docker and go<br>
versions are different. Point release update could fix the issue there<br>
too.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
On Wed, Aug 02, 2023 at 09:12:25AM -0400, Bruce Ashfield wrote:<br>
&gt; Thanks for the change, I&#39;ll double check my pending set of compone=
nt<br>
&gt; updates against this.<br>
&gt; <br>
&gt; I have a full set of updates under test, but have been out of the<br>
&gt; office the last week, so they are a bit delayed in making it to<br>
&gt; master-next.<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; On Wed, Aug 2, 2023 at 4:22=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mai=
lto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&=
gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org"=
 target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; go 1.20.6 from poky is not compatible with docker 24.0.2 and netw=
ork<br>
&gt; &gt; stack inside container is failing with &quot;invalid Host header&=
quot; error,<br>
&gt; &gt; see for example <a href=3D"https://github.com/moby/moby/issues/45=
935" rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/moby/issu=
es/45935</a><br>
&gt; &gt;<br>
&gt; &gt; 24.0.5 contains the fixes for go and also other bug fixes.<br>
&gt; &gt; Suggested by Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.o=
rg" target=3D"_blank">javier.tia@linaro.org</a>&gt;.<br>
&gt; &gt;<br>
&gt; &gt; Changes listed in<br>
&gt; &gt; <a href=3D"https://docs.docker.com/engine/release-notes/24.0/" re=
l=3D"noreferrer" target=3D"_blank">https://docs.docker.com/engine/release-n=
otes/24.0/</a> are:<br>
&gt; &gt;<br>
&gt; &gt; 24.0.5<br>
&gt; &gt;<br>
&gt; &gt; 2023-07-24<br>
&gt; &gt;<br>
&gt; &gt; For a full list of pull requests and changes in this release, ref=
er to<br>
&gt; &gt; the relevant GitHub milestones:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0docker/cli, 24.0.5 milestone<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0moby/moby, 24.0.5 milestone<br>
&gt; &gt;<br>
&gt; &gt; Bug fixes and enhancements<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0The Go client now avoids using UNIX socket pat=
hs in the HTTP Host:<br>
&gt; &gt; header, in order to be compatible with changes introduced in go1.=
20.6.<br>
&gt; &gt; moby/moby#45962, moby/moby#45990<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Fix Variant not be=
ing included in docker<br>
&gt; &gt; image inspect and GET /images/{name}/json. moby/moby#46025<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Prevent potential =
garbage collection of<br>
&gt; &gt; content during image export. moby/moby#46021<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Prevent duplicate =
digest entries in<br>
&gt; &gt; RepoDigests. moby/moby#46014<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Fix operations tak=
ing place against the<br>
&gt; &gt; incorrect tag when working with an image referenced by tag and di=
gest.<br>
&gt; &gt; moby/moby#46013<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Fix a panic caused=
 by EXPOSE when<br>
&gt; &gt; building containers with the legacy builder. moby/moby#45921<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a regression causing unintuitive errors to=
 be returned when<br>
&gt; &gt; attempting to create an overlay network on a non-Swarm node.<br>
&gt; &gt; moby/moby#45974<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Properly report errors parsing volume specific=
ations from the<br>
&gt; &gt; command line. docker/cli#4423<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a panic caused when auths: null is found i=
n the CLI config file.<br>
&gt; &gt; docker/cli#4450<br>
&gt; &gt;<br>
&gt; &gt; Packaging updates<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Use init scripts as provided by in moby/moby c=
ontrib/init.<br>
&gt; &gt; docker/docker-ce-packaging#914, docker/docker-ce-packaging#926<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Drop Upstart from contrib/init. moby/moby#4604=
4<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade Go to go1.20.6. docker/cli#4428, moby/=
moby#45970,<br>
&gt; &gt; docker/docker-ce-packaging#921<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade Compose to v2.20.2. docker/docker-ce-p=
ackaging#924<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade buildx to v0.11.2. docker/docker-ce-pa=
ckaging#922<br>
&gt; &gt;<br>
&gt; &gt; 24.0.4<br>
&gt; &gt;<br>
&gt; &gt; 2023-07-07<br>
&gt; &gt;<br>
&gt; &gt; For a full list of pull requests and changes in this release, ref=
er to<br>
&gt; &gt; the relevant GitHub milestones:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0docker/cli, 24.0.4 milestone<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0moby/moby, 24.0.4 milestone<br>
&gt; &gt;<br>
&gt; &gt; Bug fixes and enhancements<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a regression introduced during 24.0.3 that=
 causes a panic during<br>
&gt; &gt; live-restore of containers with bind mounts. moby/moby#45903<br>
&gt; &gt;<br>
&gt; &gt; 24.0.3<br>
&gt; &gt;<br>
&gt; &gt; 2023-07-06<br>
&gt; &gt;<br>
&gt; &gt; For a full list of pull requests and changes in this release, ref=
er to<br>
&gt; &gt; the relevant GitHub milestones:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0docker/cli, 24.0.3 milestone<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0moby/moby, 24.0.3 milestone<br>
&gt; &gt;<br>
&gt; &gt; Bug fixes and enhancements<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix an issue where mul=
ti-platform images<br>
&gt; &gt; that did not include a manifest for the default platform could no=
t be<br>
&gt; &gt; interacted with. moby/moby#45849<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix specious attempts =
to cache FROM scratch<br>
&gt; &gt; in container builds. moby/moby#45822<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix docker cp with sna=
pshotters that cannot<br>
&gt; &gt; mount the same content multiple times. moby/moby#45780, moby/moby=
#45786<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix builds with type=
=3Dimage not being<br>
&gt; &gt; correctly unpacked/stored. moby/moby#45692<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix incorrectly attemp=
ting to unpack<br>
&gt; &gt; pseudo-images (including attestations) in docker load. moby/moby#=
45688<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Correctly set the user=
 agent, and include<br>
&gt; &gt; additional information like the snapshotter when interacting with=
<br>
&gt; &gt; registries. moby/moby#45671, moby/moby#45684<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix a failure to unpac=
k already-pulled<br>
&gt; &gt; content after switching between snapshotters. moby/moby#45678<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix images that have b=
een re-tagged or with<br>
&gt; &gt; all tags removed being pruned while still in use. moby/moby#45857=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a Swarm CSI issue where the Topology field=
 was not propagated<br>
&gt; &gt; into NodeCSIInfo. moby/moby#45810<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix failures to add new Swarm managers caused =
by a very large raft<br>
&gt; &gt; log. moby/moby#45703, moby/swarmkit#3122, moby/swarmkit#3128<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0name_to_handle_at(2) is now always allowed in =
the default seccomp<br>
&gt; &gt; profile. moby/moby#45833<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue that prevented encrypted Swarm ov=
erlay networks from<br>
&gt; &gt; working on ports other than the default (4789). moby/moby#45637<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a failure to restore mount reference-count=
s during live-restore.<br>
&gt; &gt; moby/moby#45824<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix various networking-related failures during=
 live-restore.<br>
&gt; &gt; moby/moby#45658, moby/moby#45659<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix running containers restoring with a zero (=
successful) exit<br>
&gt; &gt; status when the daemon is unexpectedly terminated. moby/moby#4580=
1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a potential panic while executing healthch=
eck probes.<br>
&gt; &gt; moby/moby#45798<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a panic caused by a race condition in cont=
ainer exec start.<br>
&gt; &gt; moby/moby#45794<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an exception caused by attaching a termina=
l to an exec with a<br>
&gt; &gt; non-existent command. moby/moby#45643<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix host-gateway with BuildKit by passing the =
IP as a label (also<br>
&gt; &gt; requires docker/buildx#1894). moby/moby#45790<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue where POST /containers/{id}/stop =
would forcefully<br>
&gt; &gt; terminate the container when the request was canceled, instead of=
<br>
&gt; &gt; waiting until the specified timeout for a =E2=80=98graceful=E2=80=
=99 stop.<br>
&gt; &gt; moby/moby#45774<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue where docker cp -a from the root =
(/) directory would<br>
&gt; &gt; fail. moby/moby#45748<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Improve compatibility with non-runc container =
runtimes by more<br>
&gt; &gt; correctly setting resource constraint parameters in the OCI confi=
g.<br>
&gt; &gt; moby/moby#45746<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue caused by overlapping subuid/subg=
id ranges in certain<br>
&gt; &gt; configurations (e.g. LDAP) in rootless mode. moby/moby#45747,<br>
&gt; &gt; rootless-containers/rootlesskit#369<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Greatly reduce CPU and memory usage while popu=
lating the Debug<br>
&gt; &gt; section of GET /info. moby/moby#45856<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue where debug information was not c=
orrectly printed<br>
&gt; &gt; during docker info when only the client is in debug mode.<br>
&gt; &gt; docker/cli#4393<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix issues related to hung connections when co=
nnecting to hosts over<br>
&gt; &gt; a SSH connection. docker/cli#4395<br>
&gt; &gt;<br>
&gt; &gt; Packaging updates<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade Go to go1.20.5. moby/moby#45745, docke=
r/cli#4351,<br>
&gt; &gt; docker/docker-ce-packaging#904<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade Compose to v2.19.1. docker/docker-ce-p=
ackaging#916<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade buildx to v0.11.1. docker/docker-ce-pa=
ckaging#918<br>
&gt; &gt;<br>
&gt; &gt; Cc: Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.org" targe=
t=3D"_blank">javier.tia@linaro.org</a>&gt;<br>
&gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@li=
naro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 recipes-containers/docker/<a href=3D"http://docker-moby_git=
.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> | 6 +++---=
<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-containers/docker/<a href=3D"http://docker-m=
oby_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> b/r=
ecipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=3D"noref=
errer" target=3D"_blank">docker-moby_git.bb</a><br>
&gt; &gt; index 2fc11d0..de20aa6 100644<br>
&gt; &gt; --- a/recipes-containers/docker/<a href=3D"http://docker-moby_git=
.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
&gt; &gt; +++ b/recipes-containers/docker/<a href=3D"http://docker-moby_git=
.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
&gt; &gt; @@ -44,9 +44,9 @@ DESCRIPTION =3D &quot;Linux container runtime \=
<br>
&gt; &gt;=C2=A0 # so we get that tag, and make it our SRCREVS:<br>
&gt; &gt;=C2=A0 #<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV_moby =3D &quot;d7aa1e14e521af24c0aca800a837866f514f46f7&q=
uot;<br>
&gt; &gt; +SRCREV_moby =3D &quot;a61e2b4c9c5f7c241aeb37f389b4444aee26bea4&q=
uot;<br>
&gt; &gt;=C2=A0 SRCREV_libnetwork =3D &quot;3f0048413d95802b9c6c836eba06bfc=
54f9dbd03&quot;<br>
&gt; &gt; -SRCREV_cli =3D &quot;0823df7daa197bba96f2f2a85b9cbe156df78d43&qu=
ot;<br>
&gt; &gt; +SRCREV_cli =3D &quot;ced099660009713e0e845eeb754e6050dbaa45d0&qu=
ot;<br>
&gt; &gt;=C2=A0 SRCREV_FORMAT =3D &quot;moby_libnetwork&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.c=
om/moby/moby.git;branch=3D24.0;name=3Dmoby;protocol=3Dhttps" rel=3D"norefer=
rer" target=3D"_blank">github.com/moby/moby.git;branch=3D24.0;name=3Dmoby;p=
rotocol=3Dhttps</a> \<br>
&gt; &gt; @@ -66,7 +66,7 @@ require docker.inc<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3D=
4859e97a9c7780e77972d989f0823f28&quot;<br>
&gt; &gt;<br>
&gt; &gt; -DOCKER_VERSION =3D &quot;24.0.2&quot;<br>
&gt; &gt; +DOCKER_VERSION =3D &quot;24.0.5&quot;<br>
&gt; &gt;=C2=A0 PV =3D &quot;${DOCKER_VERSION}+git${SRCREV_moby}&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 CVE_PRODUCT =3D &quot;docker mobyproject:moby&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8177): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8177" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8177</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/100501205/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/100501205/3617156</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com=
" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e15bc10602e16cc4--

