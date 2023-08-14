Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4C2C001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 13:12:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.106897.1692018746434990515
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 06:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=i5vjRdfb;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-313e742a787so2479746f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692018745; x=1692623545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k3hms6NFNlSHrHO5MdR0IH9H2ANIa/VEEIc86zaKonI=;
        b=i5vjRdfbtsPpNEfLi03X7B2j4MkkuV9cUdJv/KAcHAm8iCxvIOnHrb5X14KbvUp4a+
         AjurwZ5me7CvS0q2zZtDWdpbRoZdt2u4jGpyxSp6hiNkvhOE5ht5W2mSulUrj9rlBE8/
         6t/lFVug5jY8Q0r/HmJmheFf4mc0ftdhe49mhVR4hZ7lhgQXiZh68eHDY7ahyN+xrweN
         CDYJP82EQknPwoDsiTGQ7EDqwat7CGIumAWONbfs6rarN98LfK1ha+Fw6CjWBgrDf0Mr
         NYYRrdaJj79xtW5N5S9IM7nnWAYV6McbsGZtk+b4ag+wPShcisfBlNGYivJ3yKTml3Ks
         HQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692018745; x=1692623545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3hms6NFNlSHrHO5MdR0IH9H2ANIa/VEEIc86zaKonI=;
        b=gPwfJ3b/7uYhtdBFXX58u/ty5duk8wPDeGTJ4davMPzlqIL2SorDiT/JhJlWQxtwwJ
         BgIiGhP87SlbT2feLstdCdCfhfdO61ApGMpHgLIcWk8cF5OiNsLjZdnZY428y4eSFGXa
         2JGkYO6XfOsWFldTppatrW90/EP9U3c2yNYG0fddt/jdgLFVmo0AykkjpOOpd0fqYTdS
         LYZjGlXRMSUARlCmPDsvm9HvOrm3XcQtpE4Cf/ztSMaq7hhPGeKrt4lm1RvFfWtr42Jk
         HPlwuYICGR9gcYx2/epKsqyES7NDj+uy+3RLtUfBscjR3796/tERjUrzcNYeYWYiHI78
         r/ag==
X-Gm-Message-State: AOJu0YzUrstBnfcoo+mR37LYCOs6zEnY8XGH6TrWc3MUk/V9ENq3EBJE
	RfU1A1+rwmEQQurW66jmF6u13+tq6bgadm4KdOs=
X-Google-Smtp-Source: AGHT+IEHDd82nwjQ78DezxbkAm42zLDC4TponP83HeWjtanNAD835K7n/KsFhCoPtUnkou5A/oeKi0dlAtDJfVNwIlY=
X-Received: by 2002:a5d:5088:0:b0:319:6ed2:a5c4 with SMTP id
 a8-20020a5d5088000000b003196ed2a5c4mr4104560wrt.26.1692018744606; Mon, 14 Aug
 2023 06:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230802082210.1438735-1-mikko.rapeli@linaro.org>
 <CADkTA4OqTf4Z3kvdpnjjUHMKDnsfCpYWh0km-g7vaxu99X1x1w@mail.gmail.com>
 <ZNnFaZr31xzBO1Wa@nuoska> <CADkTA4MucbK9+1GHOHF0=OdU-3gdThQB6UziYLMhDud=dvL=NA@mail.gmail.com>
In-Reply-To: <CADkTA4MucbK9+1GHOHF0=OdU-3gdThQB6UziYLMhDud=dvL=NA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Aug 2023 15:12:09 +0200
Message-ID: <CA+chaQdKNECJQ8or3W8m_Of2u=efhDA1bwrXZb3xvEHkY=su=A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: update from 24.0.2 to 24.0.5
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, meta-virtualization@lists.yoctoproject.org, 
	Javier Tia <javier.tia@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000039c6cf0602e1d066"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 13:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8186

--00000000000039c6cf0602e1d066
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll check latest v20.10.x release in kirkstone, but when I looked before
sending the previous e-mail the change log in:
https://github.com/moby/moby/compare/v20.10.21...v20.10.25

doesn't show neither
https://github.com/moby/moby/pull/45962
nor
https://github.com/moby/moby/pull/45990
commits backported to v20, but maybe I've overlooked them (or they look
very different in v20).

On Mon, Aug 14, 2023 at 3:09=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Mon, Aug 14, 2023 at 2:10=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro=
.org>
> wrote:
> >
> > Hi, would be nice to get this or similar change applied to master to ge=
t
> docker
> > container network connections working again.
> >
> > FWIW, kirkstone branch suffers from same problem but docker and go
> > versions are different. Point release update could fix the issue there
> > too.
>
> I'm running into some issues when testing the package upgrades you see
> on master-next in some k8s, k3s and a custom container framework.
>
> I'm unfortunately also working with Richard on OE-core to get some
> remaining
> 6.4 kernel issues fixed (if anyone has insight into clock issues at
> bootup, we'd
> be happy for ideas), so I'm bouncing between the two debug tasks.
>
> With any luck, I'll get this sorted today/tomorrow and will move
> master-next
> into master.
>
> I'll consider the -stable branch issues once I know I haven't broken mast=
er
> for everyone.
>
> Bruce
>
> >
> > Cheers,
> >
> > -Mikko
> >
> > On Wed, Aug 02, 2023 at 09:12:25AM -0400, Bruce Ashfield wrote:
> > > Thanks for the change, I'll double check my pending set of component
> > > updates against this.
> > >
> > > I have a full set of updates under test, but have been out of the
> > > office the last week, so they are a bit delayed in making it to
> > > master-next.
> > >
> > > Bruce
> > >
> > > On Wed, Aug 2, 2023 at 4:22=E2=80=AFAM Mikko Rapeli <mikko.rapeli@lin=
aro.org>
> wrote:
> > > >
> > > > From: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > >
> > > > go 1.20.6 from poky is not compatible with docker 24.0.2 and networ=
k
> > > > stack inside container is failing with "invalid Host header" error,
> > > > see for example https://github.com/moby/moby/issues/45935
> > > >
> > > > 24.0.5 contains the fixes for go and also other bug fixes.
> > > > Suggested by Javier Tia <javier.tia@linaro.org>.
> > > >
> > > > Changes listed in
> > > > https://docs.docker.com/engine/release-notes/24.0/ are:
> > > >
> > > > 24.0.5
> > > >
> > > > 2023-07-24
> > > >
> > > > For a full list of pull requests and changes in this release, refer
> to
> > > > the relevant GitHub milestones:
> > > >
> > > >     docker/cli, 24.0.5 milestone
> > > >     moby/moby, 24.0.5 milestone
> > > >
> > > > Bug fixes and enhancements
> > > >
> > > >     The Go client now avoids using UNIX socket paths in the HTTP
> Host:
> > > > header, in order to be compatible with changes introduced in
> go1.20.6.
> > > > moby/moby#45962, moby/moby#45990
> > > >     containerd storage backend: Fix Variant not being included in
> docker
> > > > image inspect and GET /images/{name}/json. moby/moby#46025
> > > >     containerd storage backend: Prevent potential garbage collectio=
n
> of
> > > > content during image export. moby/moby#46021
> > > >     containerd storage backend: Prevent duplicate digest entries in
> > > > RepoDigests. moby/moby#46014
> > > >     containerd storage backend: Fix operations taking place against
> the
> > > > incorrect tag when working with an image referenced by tag and
> digest.
> > > > moby/moby#46013
> > > >     containerd storage backend: Fix a panic caused by EXPOSE when
> > > > building containers with the legacy builder. moby/moby#45921
> > > >     Fix a regression causing unintuitive errors to be returned when
> > > > attempting to create an overlay network on a non-Swarm node.
> > > > moby/moby#45974
> > > >     Properly report errors parsing volume specifications from the
> > > > command line. docker/cli#4423
> > > >     Fix a panic caused when auths: null is found in the CLI config
> file.
> > > > docker/cli#4450
> > > >
> > > > Packaging updates
> > > >
> > > >     Use init scripts as provided by in moby/moby contrib/init.
> > > > docker/docker-ce-packaging#914, docker/docker-ce-packaging#926
> > > >     Drop Upstart from contrib/init. moby/moby#46044
> > > >     Upgrade Go to go1.20.6. docker/cli#4428, moby/moby#45970,
> > > > docker/docker-ce-packaging#921
> > > >     Upgrade Compose to v2.20.2. docker/docker-ce-packaging#924
> > > >     Upgrade buildx to v0.11.2. docker/docker-ce-packaging#922
> > > >
> > > > 24.0.4
> > > >
> > > > 2023-07-07
> > > >
> > > > For a full list of pull requests and changes in this release, refer
> to
> > > > the relevant GitHub milestones:
> > > >
> > > >     docker/cli, 24.0.4 milestone
> > > >     moby/moby, 24.0.4 milestone
> > > >
> > > > Bug fixes and enhancements
> > > >
> > > >     Fix a regression introduced during 24.0.3 that causes a panic
> during
> > > > live-restore of containers with bind mounts. moby/moby#45903
> > > >
> > > > 24.0.3
> > > >
> > > > 2023-07-06
> > > >
> > > > For a full list of pull requests and changes in this release, refer
> to
> > > > the relevant GitHub milestones:
> > > >
> > > >     docker/cli, 24.0.3 milestone
> > > >     moby/moby, 24.0.3 milestone
> > > >
> > > > Bug fixes and enhancements
> > > >
> > > >     containerd image store: Fix an issue where multi-platform image=
s
> > > > that did not include a manifest for the default platform could not =
be
> > > > interacted with. moby/moby#45849
> > > >     containerd image store: Fix specious attempts to cache FROM
> scratch
> > > > in container builds. moby/moby#45822
> > > >     containerd image store: Fix docker cp with snapshotters that
> cannot
> > > > mount the same content multiple times. moby/moby#45780,
> moby/moby#45786
> > > >     containerd image store: Fix builds with type=3Dimage not being
> > > > correctly unpacked/stored. moby/moby#45692
> > > >     containerd image store: Fix incorrectly attempting to unpack
> > > > pseudo-images (including attestations) in docker load.
> moby/moby#45688
> > > >     containerd image store: Correctly set the user agent, and inclu=
de
> > > > additional information like the snapshotter when interacting with
> > > > registries. moby/moby#45671, moby/moby#45684
> > > >     containerd image store: Fix a failure to unpack already-pulled
> > > > content after switching between snapshotters. moby/moby#45678
> > > >     containerd image store: Fix images that have been re-tagged or
> with
> > > > all tags removed being pruned while still in use. moby/moby#45857
> > > >     Fix a Swarm CSI issue where the Topology field was not propagat=
ed
> > > > into NodeCSIInfo. moby/moby#45810
> > > >     Fix failures to add new Swarm managers caused by a very large
> raft
> > > > log. moby/moby#45703, moby/swarmkit#3122, moby/swarmkit#3128
> > > >     name_to_handle_at(2) is now always allowed in the default secco=
mp
> > > > profile. moby/moby#45833
> > > >     Fix an issue that prevented encrypted Swarm overlay networks fr=
om
> > > > working on ports other than the default (4789). moby/moby#45637
> > > >     Fix a failure to restore mount reference-counts during
> live-restore.
> > > > moby/moby#45824
> > > >     Fix various networking-related failures during live-restore.
> > > > moby/moby#45658, moby/moby#45659
> > > >     Fix running containers restoring with a zero (successful) exit
> > > > status when the daemon is unexpectedly terminated. moby/moby#45801
> > > >     Fix a potential panic while executing healthcheck probes.
> > > > moby/moby#45798
> > > >     Fix a panic caused by a race condition in container exec start.
> > > > moby/moby#45794
> > > >     Fix an exception caused by attaching a terminal to an exec with=
 a
> > > > non-existent command. moby/moby#45643
> > > >     Fix host-gateway with BuildKit by passing the IP as a label (al=
so
> > > > requires docker/buildx#1894). moby/moby#45790
> > > >     Fix an issue where POST /containers/{id}/stop would forcefully
> > > > terminate the container when the request was canceled, instead of
> > > > waiting until the specified timeout for a =E2=80=98graceful=E2=80=
=99 stop.
> > > > moby/moby#45774
> > > >     Fix an issue where docker cp -a from the root (/) directory wou=
ld
> > > > fail. moby/moby#45748
> > > >     Improve compatibility with non-runc container runtimes by more
> > > > correctly setting resource constraint parameters in the OCI config.
> > > > moby/moby#45746
> > > >     Fix an issue caused by overlapping subuid/subgid ranges in
> certain
> > > > configurations (e.g. LDAP) in rootless mode. moby/moby#45747,
> > > > rootless-containers/rootlesskit#369
> > > >     Greatly reduce CPU and memory usage while populating the Debug
> > > > section of GET /info. moby/moby#45856
> > > >     Fix an issue where debug information was not correctly printed
> > > > during docker info when only the client is in debug mode.
> > > > docker/cli#4393
> > > >     Fix issues related to hung connections when connecting to hosts
> over
> > > > a SSH connection. docker/cli#4395
> > > >
> > > > Packaging updates
> > > >
> > > >     Upgrade Go to go1.20.5. moby/moby#45745, docker/cli#4351,
> > > > docker/docker-ce-packaging#904
> > > >     Upgrade Compose to v2.19.1. docker/docker-ce-packaging#916
> > > >     Upgrade buildx to v0.11.1. docker/docker-ce-packaging#918
> > > >
> > > > Cc: Javier Tia <javier.tia@linaro.org>
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > >  recipes-containers/docker/docker-moby_git.bb | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/recipes-containers/docker/docker-moby_git.bb
> b/recipes-containers/docker/docker-moby_git.bb
> > > > index 2fc11d0..de20aa6 100644
> > > > --- a/recipes-containers/docker/docker-moby_git.bb
> > > > +++ b/recipes-containers/docker/docker-moby_git.bb
> > > > @@ -44,9 +44,9 @@ DESCRIPTION =3D "Linux container runtime \
> > > >  # so we get that tag, and make it our SRCREVS:
> > > >  #
> > > >
> > > > -SRCREV_moby =3D "d7aa1e14e521af24c0aca800a837866f514f46f7"
> > > > +SRCREV_moby =3D "a61e2b4c9c5f7c241aeb37f389b4444aee26bea4"
> > > >  SRCREV_libnetwork =3D "3f0048413d95802b9c6c836eba06bfc54f9dbd03"
> > > > -SRCREV_cli =3D "0823df7daa197bba96f2f2a85b9cbe156df78d43"
> > > > +SRCREV_cli =3D "ced099660009713e0e845eeb754e6050dbaa45d0"
> > > >  SRCREV_FORMAT =3D "moby_libnetwork"
> > > >  SRC_URI =3D "\
> > > >         git://
> github.com/moby/moby.git;branch=3D24.0;name=3Dmoby;protocol=3Dhttps \
> > > > @@ -66,7 +66,7 @@ require docker.inc
> > > >  LICENSE =3D "Apache-2.0"
> > > >  LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28"
> > > >
> > > > -DOCKER_VERSION =3D "24.0.2"
> > > > +DOCKER_VERSION =3D "24.0.5"
> > > >  PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
> > > >
> > > >  CVE_PRODUCT =3D "docker mobyproject:moby"
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8185):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8185
> Mute This Topic: https://lists.yoctoproject.org/mt/100501205/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/7925988/361715=
6/1068030116/xyzzy
> [Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000039c6cf0602e1d066
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ll check latest v20.10.x release in kirkstone, but w=
hen I looked before sending the previous e-mail the change log in:<div><div=
><a href=3D"https://github.com/moby/moby/compare/v20.10.21...v20.10.25">htt=
ps://github.com/moby/moby/compare/v20.10.21...v20.10.25</a><br></div></div>=
<div><br></div><div>doesn&#39;t show neither</div><div><a href=3D"https://g=
ithub.com/moby/moby/pull/45962">https://github.com/moby/moby/pull/45962</a>=
<br></div><div>nor</div><div><a href=3D"https://github.com/moby/moby/pull/4=
5990">https://github.com/moby/moby/pull/45990</a><br></div><div>commits bac=
kported to v20, but maybe I&#39;ve overlooked them (or they look very diffe=
rent in v20).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Aug 14, 2023 at 3:09=E2=80=AFPM Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On M=
on, Aug 14, 2023 at 2:10=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikk=
o.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Hi, would be nice to get this or similar change applied to master to g=
et docker<br>
&gt; container network connections working again.<br>
&gt;<br>
&gt; FWIW, kirkstone branch suffers from same problem but docker and go<br>
&gt; versions are different. Point release update could fix the issue there=
<br>
&gt; too.<br>
<br>
I&#39;m running into some issues when testing the package upgrades you see<=
br>
on master-next in some k8s, k3s and a custom container framework.<br>
<br>
I&#39;m unfortunately also working with Richard on OE-core to get some rema=
ining<br>
6.4 kernel issues fixed (if anyone has insight into clock issues at bootup,=
 we&#39;d<br>
be happy for ideas), so I&#39;m bouncing between the two debug tasks.<br>
<br>
With any luck, I&#39;ll get this sorted today/tomorrow and will move master=
-next<br>
into master.<br>
<br>
I&#39;ll consider the -stable branch issues once I know I haven&#39;t broke=
n master<br>
for everyone.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; -Mikko<br>
&gt;<br>
&gt; On Wed, Aug 02, 2023 at 09:12:25AM -0400, Bruce Ashfield wrote:<br>
&gt; &gt; Thanks for the change, I&#39;ll double check my pending set of co=
mponent<br>
&gt; &gt; updates against this.<br>
&gt; &gt;<br>
&gt; &gt; I have a full set of updates under test, but have been out of the=
<br>
&gt; &gt; office the last week, so they are a bit delayed in making it to<b=
r>
&gt; &gt; master-next.<br>
&gt; &gt;<br>
&gt; &gt; Bruce<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Aug 2, 2023 at 4:22=E2=80=AFAM Mikko Rapeli &lt;<a href=
=3D"mailto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.o=
rg</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro=
.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; go 1.20.6 from poky is not compatible with docker 24.0.2 and=
 network<br>
&gt; &gt; &gt; stack inside container is failing with &quot;invalid Host he=
ader&quot; error,<br>
&gt; &gt; &gt; see for example <a href=3D"https://github.com/moby/moby/issu=
es/45935" rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/moby=
/issues/45935</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 24.0.5 contains the fixes for go and also other bug fixes.<b=
r>
&gt; &gt; &gt; Suggested by Javier Tia &lt;<a href=3D"mailto:javier.tia@lin=
aro.org" target=3D"_blank">javier.tia@linaro.org</a>&gt;.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Changes listed in<br>
&gt; &gt; &gt; <a href=3D"https://docs.docker.com/engine/release-notes/24.0=
/" rel=3D"noreferrer" target=3D"_blank">https://docs.docker.com/engine/rele=
ase-notes/24.0/</a> are:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 24.0.5<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 2023-07-24<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For a full list of pull requests and changes in this release=
, refer to<br>
&gt; &gt; &gt; the relevant GitHub milestones:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0docker/cli, 24.0.5 milestone<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0moby/moby, 24.0.5 milestone<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Bug fixes and enhancements<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0The Go client now avoids using UNIX socke=
t paths in the HTTP Host:<br>
&gt; &gt; &gt; header, in order to be compatible with changes introduced in=
 go1.20.6.<br>
&gt; &gt; &gt; moby/moby#45962, moby/moby#45990<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Fix Variant n=
ot being included in docker<br>
&gt; &gt; &gt; image inspect and GET /images/{name}/json. moby/moby#46025<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Prevent poten=
tial garbage collection of<br>
&gt; &gt; &gt; content during image export. moby/moby#46021<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Prevent dupli=
cate digest entries in<br>
&gt; &gt; &gt; RepoDigests. moby/moby#46014<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Fix operation=
s taking place against the<br>
&gt; &gt; &gt; incorrect tag when working with an image referenced by tag a=
nd digest.<br>
&gt; &gt; &gt; moby/moby#46013<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd storage backend: Fix a panic c=
aused by EXPOSE when<br>
&gt; &gt; &gt; building containers with the legacy builder. moby/moby#45921=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a regression causing unintuitive erro=
rs to be returned when<br>
&gt; &gt; &gt; attempting to create an overlay network on a non-Swarm node.=
<br>
&gt; &gt; &gt; moby/moby#45974<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Properly report errors parsing volume spe=
cifications from the<br>
&gt; &gt; &gt; command line. docker/cli#4423<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a panic caused when auths: null is fo=
und in the CLI config file.<br>
&gt; &gt; &gt; docker/cli#4450<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Packaging updates<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Use init scripts as provided by in moby/m=
oby contrib/init.<br>
&gt; &gt; &gt; docker/docker-ce-packaging#914, docker/docker-ce-packaging#9=
26<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Drop Upstart from contrib/init. moby/moby=
#46044<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade Go to go1.20.6. docker/cli#4428, =
moby/moby#45970,<br>
&gt; &gt; &gt; docker/docker-ce-packaging#921<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade Compose to v2.20.2. docker/docker=
-ce-packaging#924<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade buildx to v0.11.2. docker/docker-=
ce-packaging#922<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 24.0.4<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 2023-07-07<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For a full list of pull requests and changes in this release=
, refer to<br>
&gt; &gt; &gt; the relevant GitHub milestones:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0docker/cli, 24.0.4 milestone<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0moby/moby, 24.0.4 milestone<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Bug fixes and enhancements<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a regression introduced during 24.0.3=
 that causes a panic during<br>
&gt; &gt; &gt; live-restore of containers with bind mounts. moby/moby#45903=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 24.0.3<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 2023-07-06<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; For a full list of pull requests and changes in this release=
, refer to<br>
&gt; &gt; &gt; the relevant GitHub milestones:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0docker/cli, 24.0.3 milestone<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0moby/moby, 24.0.3 milestone<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Bug fixes and enhancements<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix an issue wher=
e multi-platform images<br>
&gt; &gt; &gt; that did not include a manifest for the default platform cou=
ld not be<br>
&gt; &gt; &gt; interacted with. moby/moby#45849<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix specious atte=
mpts to cache FROM scratch<br>
&gt; &gt; &gt; in container builds. moby/moby#45822<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix docker cp wit=
h snapshotters that cannot<br>
&gt; &gt; &gt; mount the same content multiple times. moby/moby#45780, moby=
/moby#45786<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix builds with t=
ype=3Dimage not being<br>
&gt; &gt; &gt; correctly unpacked/stored. moby/moby#45692<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix incorrectly a=
ttempting to unpack<br>
&gt; &gt; &gt; pseudo-images (including attestations) in docker load. moby/=
moby#45688<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Correctly set the=
 user agent, and include<br>
&gt; &gt; &gt; additional information like the snapshotter when interacting=
 with<br>
&gt; &gt; &gt; registries. moby/moby#45671, moby/moby#45684<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix a failure to =
unpack already-pulled<br>
&gt; &gt; &gt; content after switching between snapshotters. moby/moby#4567=
8<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0containerd image store: Fix images that h=
ave been re-tagged or with<br>
&gt; &gt; &gt; all tags removed being pruned while still in use. moby/moby#=
45857<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a Swarm CSI issue where the Topology =
field was not propagated<br>
&gt; &gt; &gt; into NodeCSIInfo. moby/moby#45810<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix failures to add new Swarm managers ca=
used by a very large raft<br>
&gt; &gt; &gt; log. moby/moby#45703, moby/swarmkit#3122, moby/swarmkit#3128=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0name_to_handle_at(2) is now always allowe=
d in the default seccomp<br>
&gt; &gt; &gt; profile. moby/moby#45833<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue that prevented encrypted Swa=
rm overlay networks from<br>
&gt; &gt; &gt; working on ports other than the default (4789). moby/moby#45=
637<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a failure to restore mount reference-=
counts during live-restore.<br>
&gt; &gt; &gt; moby/moby#45824<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix various networking-related failures d=
uring live-restore.<br>
&gt; &gt; &gt; moby/moby#45658, moby/moby#45659<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix running containers restoring with a z=
ero (successful) exit<br>
&gt; &gt; &gt; status when the daemon is unexpectedly terminated. moby/moby=
#45801<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a potential panic while executing hea=
lthcheck probes.<br>
&gt; &gt; &gt; moby/moby#45798<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix a panic caused by a race condition in=
 container exec start.<br>
&gt; &gt; &gt; moby/moby#45794<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an exception caused by attaching a te=
rminal to an exec with a<br>
&gt; &gt; &gt; non-existent command. moby/moby#45643<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix host-gateway with BuildKit by passing=
 the IP as a label (also<br>
&gt; &gt; &gt; requires docker/buildx#1894). moby/moby#45790<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue where POST /containers/{id}/=
stop would forcefully<br>
&gt; &gt; &gt; terminate the container when the request was canceled, inste=
ad of<br>
&gt; &gt; &gt; waiting until the specified timeout for a =E2=80=98graceful=
=E2=80=99 stop.<br>
&gt; &gt; &gt; moby/moby#45774<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue where docker cp -a from the =
root (/) directory would<br>
&gt; &gt; &gt; fail. moby/moby#45748<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Improve compatibility with non-runc conta=
iner runtimes by more<br>
&gt; &gt; &gt; correctly setting resource constraint parameters in the OCI =
config.<br>
&gt; &gt; &gt; moby/moby#45746<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue caused by overlapping subuid=
/subgid ranges in certain<br>
&gt; &gt; &gt; configurations (e.g. LDAP) in rootless mode. moby/moby#45747=
,<br>
&gt; &gt; &gt; rootless-containers/rootlesskit#369<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Greatly reduce CPU and memory usage while=
 populating the Debug<br>
&gt; &gt; &gt; section of GET /info. moby/moby#45856<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix an issue where debug information was =
not correctly printed<br>
&gt; &gt; &gt; during docker info when only the client is in debug mode.<br=
>
&gt; &gt; &gt; docker/cli#4393<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Fix issues related to hung connections wh=
en connecting to hosts over<br>
&gt; &gt; &gt; a SSH connection. docker/cli#4395<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Packaging updates<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade Go to go1.20.5. moby/moby#45745, =
docker/cli#4351,<br>
&gt; &gt; &gt; docker/docker-ce-packaging#904<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade Compose to v2.19.1. docker/docker=
-ce-packaging#916<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Upgrade buildx to v0.11.1. docker/docker-=
ce-packaging#918<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Cc: Javier Tia &lt;<a href=3D"mailto:javier.tia@linaro.org" =
target=3D"_blank">javier.tia@linaro.org</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rape=
li@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 recipes-containers/docker/<a href=3D"http://docker-mob=
y_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> | 6 +=
++---<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/recipes-containers/docker/<a href=3D"http://doc=
ker-moby_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a=
> b/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=3D"=
noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
&gt; &gt; &gt; index 2fc11d0..de20aa6 100644<br>
&gt; &gt; &gt; --- a/recipes-containers/docker/<a href=3D"http://docker-mob=
y_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
&gt; &gt; &gt; +++ b/recipes-containers/docker/<a href=3D"http://docker-mob=
y_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
&gt; &gt; &gt; @@ -44,9 +44,9 @@ DESCRIPTION =3D &quot;Linux container runt=
ime \<br>
&gt; &gt; &gt;=C2=A0 # so we get that tag, and make it our SRCREVS:<br>
&gt; &gt; &gt;=C2=A0 #<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -SRCREV_moby =3D &quot;d7aa1e14e521af24c0aca800a837866f514f4=
6f7&quot;<br>
&gt; &gt; &gt; +SRCREV_moby =3D &quot;a61e2b4c9c5f7c241aeb37f389b4444aee26b=
ea4&quot;<br>
&gt; &gt; &gt;=C2=A0 SRCREV_libnetwork =3D &quot;3f0048413d95802b9c6c836eba=
06bfc54f9dbd03&quot;<br>
&gt; &gt; &gt; -SRCREV_cli =3D &quot;0823df7daa197bba96f2f2a85b9cbe156df78d=
43&quot;<br>
&gt; &gt; &gt; +SRCREV_cli =3D &quot;ced099660009713e0e845eeb754e6050dbaa45=
d0&quot;<br>
&gt; &gt; &gt;=C2=A0 SRCREV_FORMAT =3D &quot;moby_libnetwork&quot;<br>
&gt; &gt; &gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git=
hub.com/moby/moby.git;branch=3D24.0;name=3Dmoby;protocol=3Dhttps" rel=3D"no=
referrer" target=3D"_blank">github.com/moby/moby.git;branch=3D24.0;name=3Dm=
oby;protocol=3Dhttps</a> \<br>
&gt; &gt; &gt; @@ -66,7 +66,7 @@ require docker.inc<br>
&gt; &gt; &gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;m=
d5=3D4859e97a9c7780e77972d989f0823f28&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -DOCKER_VERSION =3D &quot;24.0.2&quot;<br>
&gt; &gt; &gt; +DOCKER_VERSION =3D &quot;24.0.5&quot;<br>
&gt; &gt; &gt;=C2=A0 PV =3D &quot;${DOCKER_VERSION}+git${SRCREV_moby}&quot;=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 CVE_PRODUCT =3D &quot;docker mobyproject:moby&quot;<br=
>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.34.1<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait<br>
&gt; &gt; thee at its end<br>
&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8185): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8185" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8185</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/100501205/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/100501205/3617156</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/leave/7925988/3617156/1068030116/xyzzy" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.yoctoproject.org/g/meta-virtualization/leave/7925988/3617=
156/1068030116/xyzzy</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" target=
=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000039c6cf0602e1d066--

