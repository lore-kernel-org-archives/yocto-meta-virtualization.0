Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.544.1617756100112902853
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 17:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bnu3U4Bw;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id e7so18662178edu.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 17:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x7h1YSLryUTA4TLzyMEe20D6X7GUUaWCveJMGCsDx5g=;
        b=Bnu3U4Bwfbd5n/lf9BVJQGmGJVCIPm/HOfjbmN+9N7/fB/O8r2z8Mq7VmxvhFl0Qgd
         mfLLPIokx79ODsbdIfgMmunCNkVxtx7xSfFcLosPbbdLuxZTEy/gMYpqtJIeLjwLgMPC
         ISho94EgXPQb2hnL1byFN5FEtJHajVDqOv0qoHuAvoHa2IM0YReVZj/HST5LZEHedvXQ
         FqdXDAdA+W6ekv8PSf0ly4mHd90ZL0I2YEZsQKyycTSi5hMCcycxY7YePLKZcTCSoSOG
         ESvYM1K31XPbo608gpMyyk/BufPIisXH1UepyWlDQ5Bzxfk4QUgA3g8V/dftzpkkxeLS
         li9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x7h1YSLryUTA4TLzyMEe20D6X7GUUaWCveJMGCsDx5g=;
        b=cHdg63H3gjWX5WmbiJXhuPnW57c8L3H5gGfw4LggZv6DfJ0KWHIVxIwVSpR9cR61vD
         c0Q0KeYtkFltlvCvtSQhQkm+4py6Jb+J/AfV+1S7OYnx1gMgpSbJ7JefEgC4HOd2iX/8
         GzptBtyRKb8LI+uJ5SMp7iSxxGTSZaDhKrExgb7kMh4iItgaHbjmGDLiIz5gPmUtqv8r
         JJgSpI27MdBb+8nSiLJvbwJPQOpMohbGTUAc+Yguy1gSQMJUlJKLUjiMVQKId4VJGTWQ
         iAU1FN8LgCFgyutVHeUTAzBBhRFGhkTmZhfOMnS1emhtsMwXi+C8+qwkEZfDfy8wQzWz
         FFxg==
X-Gm-Message-State: AOAM530q8G5a4GazQ3ifA1A1Cr2ivl7+cYOZ5mtv0gbioTyTAPpAHNXa
	YigoWFkWrpYD4YH/d9zpWXJ7affBAIg4DoNFIEU=
X-Google-Smtp-Source: ABdhPJx0VjMekHRD0AAqymH6imMbRWeyr0GwBESISgUwdzQzfbC6g5CREHFUuwD+45uIISQAe6v/gM4VoLLZG1/unyI=
X-Received: by 2002:a50:8711:: with SMTP id i17mr1260432edb.352.1617756098500;
 Tue, 06 Apr 2021 17:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
 <20210403195133.1401406-3-Martin.Jansa@gmail.com> <CADkTA4OUZYj1GfcRr3zXQCjru4LA_a2EgCx+qRbFozgx4q1QAA@mail.gmail.com>
 <20210406131931.lwwhis6hw2j6klex@jama>
In-Reply-To: <20210406131931.lwwhis6hw2j6klex@jama>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Apr 2021 20:41:27 -0400
Message-ID: <CADkTA4OLdwndSYXxZxE2qh1T1AHy54-uoSySceXeyg0BaaAvGQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/5] cri-o, podman, packagegroup-container: replace anonymous python function calling bb.parse.SkipRecipe with conditional PNBLACKLISTs
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 6, 2021 at 9:19 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Tue, Apr 06, 2021 at 08:58:13AM -0400, Bruce Ashfield wrote:
> > On Sat, Apr 3, 2021 at 3:51 PM Martin Jansa <Martin.Jansa@gmail.com> w=
rote:
> > >
> > > * PNBLACKLISTs are IMHO a bit easier to read and easier to override =
from distro
> > >   which e.g. provides own recipe for libseccomp
> >
> > Thanks Martin,
> >
> > I'm trying to decide if I should just give up and make meta-security a
> > hard/full layer dependency. More and more of the container components
> > just don't work if we don't have seccomp enabled.
>
> Agreed, but Armin also mentioned that he plans to send libseccomp to
> meta-oe, so this PNBLACKLIST change should be only temporary until that =
happens.
>

Thanks for the detailed description, it helps me understand how things
are being used and gives me things to check before merging potential
breakages.

As it turns out, there was a yocto meeting today and where libseccomp
lives came up. There seems to be a consensus that it should end up in
oe-core (and at the very least meta-oe), so this will work itself out over
time.

So I went ahead and merged everything as-is, since we might as well
keep the optional meta-security dependency for now, and revisit with
libseccomp moves.

> And I can imagine some people pulling libseccomp to their layer already
> (instead of adding whole meta-security) and then being able to simply
> set PNBLACKLIST to empty for these recipes would be much easier than
> undoing the anonymous python (witch is imho impossible without
> overlaying whole recipe except the function).

Agreed.

>
> > But I agree that the blacklist technique is easier to read than the
> > proliferating anonymous python. I'll merge it while I ponder the above
> > question.
> >
> > On that topic, would adding meta-security as a layer dependency cause
> > any issues in your setup/distros/builds ?
>
> I wouldn't call it my setup anymore, but I'm just going through
> PNBLACKLISTs used in webOS OSE:
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/conf/di=
stro/include/webos-recipe-blacklist.inc
> https://github.com/webosose/meta-webosose/blob/master/meta-webos-virtual=
ization/conf/layer.conf#L19
>
> and fixing some of them or moving them to the layer where the issue is
> introduced.

Aha!

>
> In webOS OSE setup this libseccomp issue is kind of special, because it
> already includes meta-security layer, but BBMASKs all its content except
> smack recipes which are actively used:
> https://github.com/webosose/meta-webosose/blob/master/meta-webos-smack/c=
onf/layer.conf#L10
> so these 3-4 PNBLACKLISTs will need to stay in OSE anyway even with the
> conditional on security-layer, I'll just move it to meta-webos-smack
> where the BBMASK is being set:
> https://github.com/shr-project/meta-webosose/commit/430589dbae6c8616d696=
92e65a3da40d2b192277
> at least until libseccomp is in meta-oe and I'll be able to drop this as
> well.
>
> And who know when LGE will update webOS OSE from currently used dunfell
> release, so whatever you decide in meta-virtualization is fine with me
> :).

Gotcha.

Again, thanks for the detailed explanation.

Bruce

>
> Cheers,
>
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  recipes-containers/cri-o/cri-o_git.bb            | 16 +------------=
---
> > >  recipes-containers/podman/podman_git.bb          | 10 +---------
> > >  .../packagegroups/packagegroup-container.bb      | 10 +---------
> > >  3 files changed, 3 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-contain=
ers/cri-o/cri-o_git.bb
> > > index 2d6187a..0ac5ddc 100644
> > > --- a/recipes-containers/cri-o/cri-o_git.bb
> > > +++ b/recipes-containers/cri-o/cri-o_git.bb
> > > @@ -43,21 +43,7 @@ RDEPENDS_${PN} =3D " \
> > >      libdevmapper \
> > >      "
> > >
> > > -python __anonymous() {
> > > -    msg =3D ""
> > > -    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/m=
eta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or othe=
rwise requires it).
> > > -    # ERROR: Required build target 'meta-world-pkgdata' has no buil=
dable providers.
> > > -    # Missing or unbuildable dependency chain was: ['meta-world-pkg=
data', 'cri-o', 'libseccomp']
> > > -    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> > > -        msg +=3D "Make sure meta-security should be present as it p=
rovides 'libseccomp'"
> > > -        raise bb.parse.SkipRecipe(msg)
> > > -    # ERROR: Nothing PROVIDES 'libselinux' (but /buildarea/layers/m=
eta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or othe=
rwise requires it).
> > > -    # ERROR: Required build target 'meta-world-pkgdata' has no buil=
dable providers.
> > > -    # Missing or unbuildable dependency chain was: ['meta-world-pkg=
data', 'cri-o', 'libselinux']
> > > -    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
> > > -        msg +=3D "Make sure meta-selinux should be present as it pr=
ovides 'libselinux'"
> > > -        raise bb.parse.SkipRecipe(msg)
> > > -}
> > > +PNBLACKLIST[cri-o] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS',=
 'security', bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depend=
s on libselinux from meta-selinux which is not included', d), 'Depends on l=
ibseccomp from meta-security which is not included', d)}"
> > >
> > >  PACKAGES =3D+ "${PN}-config"
> > >
> > > diff --git a/recipes-containers/podman/podman_git.bb b/recipes-conta=
iners/podman/podman_git.bb
> > > index a552a7f..62ae024 100644
> > > --- a/recipes-containers/podman/podman_git.bb
> > > +++ b/recipes-containers/podman/podman_git.bb
> > > @@ -14,15 +14,7 @@ DEPENDS =3D " \
> > >      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > >  "
> > >
> > > -python __anonymous() {
> > > -    msg =3D ""
> > > -    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization=
/recipes-containers/podman/ DEPENDS on or otherwise requires it).
> > > -    # ERROR: Required build target 'meta-world-pkgdata' has no buil=
dable providers.
> > > -    # Missing or unbuildable dependency chain was: ['meta-world-pkg=
data', 'podman', 'libseccomp']
> > > -    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> > > -        msg +=3D "Make sure meta-security should be present as it p=
rovides 'libseccomp'"
> > > -        raise bb.parse.SkipRecipe(msg)
> > > -}
> > > +PNBLACKLIST[podman] ?=3D "${@bb.utils.contains('BBFILE_COLLECTIONS'=
, 'security', '', 'Depends on libseccomp from meta-security which is not in=
cluded', d)}"
> > >
> > >  SRCREV =3D "288fb688964cb7fc7086d0728daa1f5f6b726dd6"
> > >  SRC_URI =3D " \
> > > diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/=
recipes-core/packagegroups/packagegroup-container.bb
> > > index b3b0d4c..b06a7c7 100644
> > > --- a/recipes-core/packagegroups/packagegroup-container.bb
> > > +++ b/recipes-core/packagegroups/packagegroup-container.bb
> > > @@ -44,12 +44,4 @@ RDEPENDS_packagegroup-containerd =3D " \
> > >      virtual/containerd \
> > >  "
> > >
> > > -python __anonymous() {
> > > -    msg =3D ""
> > > -    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization=
/recipes-containers/podman/ DEPENDS on or otherwise requires it).
> > > -    # ERROR: Required build target 'meta-world-pkgdata' has no buil=
dable providers.
> > > -    # Missing or unbuildable dependency chain was: ['meta-world-pkg=
data', 'podman', 'libseccomp']
> > > -    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> > > -        msg +=3D "Make sure meta-security should be present as it p=
rovides 'libseccomp'"
> > > -        raise bb.parse.SkipRecipe(msg)
> > > -}
> > > +PNBLACKLIST[packagegroup-container] ?=3D "${@bb.utils.contains('BBF=
ILE_COLLECTIONS', 'security', '', 'Depends on podman which depends on libse=
ccomp from meta-security which is not included', d)}"
> > > --
> > > 2.30.2
> > >
> > >
> > >=20
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
