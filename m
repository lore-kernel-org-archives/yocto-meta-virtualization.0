Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABF6C43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 19:10:45 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.21929.1655406641885396399
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 12:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WGyxWuGO;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d5so1988067plo.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DITjd+Wj31nWTBxsL2r6lxAvhdPtPcdYbVgumDHfolc=;
        b=WGyxWuGOxWYoAmC8K+RIXINCVvJZSYpm1Awki+l3KSUKKbnTTD0GZbafO95hp7dfOb
         q6hCrPFZHFzDzdUl2iRzujgr3NH5YbHZqAUeXeurpPQHOI0TZCllPDm56e8zd+BH9fBG
         gtc7QEHfYb12XuS6C8rtDtHzv1u4cyqmFfK+89YkwXsSeL+HAFnz5VhejK0aOsfMYow8
         7QMg9ZJWRhQEDSFbcLte6iG1FLboVgGtIdQcUUkn1NhAaMzWw/xx0nzV2DguOJWERo7f
         93usxATiUcaIC47zV9IfbG3ciGCEumoAmpF2tGc6induN9XCIYjE6iuP5F4ZphW/1egq
         CM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DITjd+Wj31nWTBxsL2r6lxAvhdPtPcdYbVgumDHfolc=;
        b=3Xl2w/8LPONDUqDcFTZdINAd0v3md4UgoUKvtShajLJ0X4fKID8emBQuCkjn1/5n37
         ThbekTT1/P+L3OlYN09tmARkxLDcRBFoELBbT4CnIKQUj2NfVgKUQLu71xcH+/EBAOTD
         STBIOvF4tFLQ+KdJYkFcrVj7RTEErkB8ZRYAtu3T3rovcwyBNR+XH6BeCXBIW7ErLNbt
         ag6M1On9rvIQ0pJsOCMMzydq/RPEgQQctE5A1V1J1xLE3R74badzLigmtB7hYTO4Wjhk
         kFwSLuXB3IU559NzqDksY7MgsUm+WWJDsrcvQcWUOBeL1fHGczsxXn+V6dvihnzrc2t6
         Qd/g==
X-Gm-Message-State: AJIora+nUcvNs7xqsBkMCVQkYT6QS3dVg9HtCRKcGrc7RJqdngVLqiKK
	xaPFUsBc8U5UKPpXTtYkJS4uGomA80D7V66uUqk=
X-Google-Smtp-Source: 
 AGRyM1tIxkL3yajHP5VqccB3lXBu6RcK+/fSfbH4aAzT//86bN/drTFJ/XTTx0G0qA2Ii4vVJtFu+FYvR/5NNKT4LU8=
X-Received: by 2002:a17:90b:1d02:b0:1e6:961d:d56f with SMTP id
 on2-20020a17090b1d0200b001e6961dd56fmr6597453pjb.225.1655406640621; Thu, 16
 Jun 2022 12:10:40 -0700 (PDT)
MIME-Version: 1.0
References: 
 <956614aeb05d3f6377da58e713309ca12e2fffe9.1654704740.git.diego.sueiro@arm.com>
 <CADkTA4OSvLY2XXxBJepn=MPEXjFzWBjyHX85SrEvV6kZk+d7ug@mail.gmail.com>
 <AM6PR08MB346165205ECFDCB2835D14FE92A79@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <16F74403FED38BBB.29749@lists.yoctoproject.org>
 <16F8948C75C465C6.5358@lists.yoctoproject.org>
In-Reply-To: <16F8948C75C465C6.5358@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 16 Jun 2022 15:10:28 -0400
Message-ID: 
 <CADkTA4PjF6SBT3JvXN4zHK7JnaEpDuM12KXozcsapEx9n=m7Wg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Fetch dependencies from github
 instead of googlesource to avoid rate-limit
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Jun 2022 19:10:45 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7386

On Tue, Jun 14, 2022 at 3:49 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Fri, Jun 10, 2022 at 9:02 AM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Thu, Jun 9, 2022 at 3:46 AM Diego Sueiro <Diego.Sueiro@arm.com> wrot=
e:
> > >
> > > Hi Bruce,
> > >
> > > ________________________________
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Sent: 08 June 2022 17:47
> > > To: Diego Sueiro <Diego.Sueiro@arm.com>
> > > Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@l=
ists.yoctoproject.org>; nd <nd@arm.com>
> > > Subject: Re: [meta-virtualization][PATCH] k3s: Fetch dependencies fro=
m github instead of googlesource to avoid rate-limit
> > >
> > > On Wed, Jun 8, 2022 at 12:21 PM Diego Sueiro <diego.sueiro@arm.com> w=
rote:
> > > >
> > > > All repositories under https://go.googlesource.com/ have a mirror i=
n
> > > > https://github.com.
> > > >
> > > > Fetching the dependencies from github is much faster and we avoid t=
imeouts due
> > > > to googlesource rate-limit.
> > > >
> > > > Reference: https://github.com/golang/go/issues/12933
> > >
> > > I've been working on updating k3s to the same format as nerdctl (with
> > > .inc files and better formatted dependencies), so let me finish that
> > > update, and then we can get this applied.
> > >
> > >
> > > Thanks. Do you have an ETA for it? Also, is it possible to have the s=
ame
> > > on kirkstone branch as well?
> > >
> >
> > I'm working through the change now. I expect to have everything done
> > by next week.
>
> FYI: I ran into some build/integration issues with the remapped
> sources during my testing.
>
> I'm working through the issues, but do expect to get it sorted in the
> next day or so.

With the mapped sources, I'm getting :

| HASH subkey 6e32f77375d0996065f1395ad10899fcdedbe48231e9d03e1c591d00e19a8=
54f
"stdout" =3D 1218368fb3aac4c208d7ebaf531ac1aec7e6f6a6ec38a6d43bd26406748b22=
c0

               | HASH subkey
5b6cfea3efc218f4f998049c59398fc4e4f37b6bc687bf28c5fc2aa1b234bbb9
"stdout" =3D 1b590c77d9dfe5682591a11b26db44a4ec48cab00e594f1afa8ceb7c1d1930=
c3

               | HASH subkey
02a4a19c3371ddd8668456c195196ed193d26cf46d3b865e501641d171fc2699
"stdout" =3D a388f248e081bb894bc2839c88e355947d135b158ea5f487dca7957a3fee18=
0b

               | HASH subkey
deb8f7886451cf2aba0d536711ade072310b92b59677fda1cdafd30b23b35891
"stdout" =3D 36cd81ab2a9578fc941df7ee2ec0728993495a8f6e9debfcbaafb6c7f3d328=
43

               | WARNING: exit code 2 from a shell command.


Which is go exiting and erroring during the build, the log file is
huge, and I haven't found the issue yet .. but I am working on it, so
I wanted to send an update!

Bruce

>
> Bruce
>
> >
> > Since it isn't a functional change or new features, I can definitely
> > put it on kirkstone at the same time as master.
> >
> > Bruce
> >
> > > I'll also need to teach my generation script to make that mapping, as
> > > it would otherwise be lost on upgrades, as all of those locations are
> > > discovered via the go infrastructure.
> > >
> > > One more question, as the non-linebroken relocation sites is super
> > > hard to read diffs (which is why I reformatted it), I assume you are
> > > mapping those github sites back to the googlesource location in the
> > > relocation step, so that go finds it, and doesn't fetch ?
> > >
> > > Yes, I've replaced in there as well (using sed and checking with grep=
).
> > > I have tested this change on both master and kikstone branches from a=
 cleanall.
> > >
> > > There is a k3s runtime issue in master (which predates this proposed =
change) which
> > > we will look in the upcoming days.
> > >
> > > --
> > > Diego Sueiro
> > >
> > >
> > > >
> > > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > > > ---
> > > >  recipes-containers/k3s/k3s_git.bb | 62 +++++++++++++++------------=
----
> > > >  1 file changed, 31 insertions(+), 31 deletions(-)
> > > >
> > > > diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers=
/k3s/k3s_git.bb
> > > > index a20092c..4f109ad 100644
> > > > --- a/recipes-containers/k3s/k3s_git.bb
> > > > +++ b/recipes-containers/k3s/k3s_git.bb
> > > > @@ -2238,79 +2238,79 @@ SRCREV_zap=3D"2908d3000567b86f0b7f1e99cc6bc=
5c9f30d43a0"
> > > >  SRC_URI +=3D "git://github.com/uber-go/zap;name=3Dzap;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.=
uber.org/zap"
> > > >
> > > >  # golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
> > > > -# [1] git ls-remote https://go.googlesource.com/crypto 5ea612d1eb8=
30b38bc4e914e37f55311eb58adce
> > > > +# [1] git ls-remote https://github.com/golang/crypto 5ea612d1eb830=
b38bc4e914e37f55311eb58adce
> > > >  SRCREV_crypto=3D"5ea612d1eb830b38bc4e914e37f55311eb58adce"
> > > > -SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/go.googlesource.com/crypto"
> > > > +SRC_URI +=3D "git://github.com/golang/crypto;name=3Dcrypto;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/golang/crypto"
> > > >
> > > >  # golang.org/x/exp v0.0.0-20210220032938-85be41e4509f
> > > > -# [1] git ls-remote https://go.googlesource.com/exp 85be41e4509f41=
7cbf99006a027aef75deb8afd1
> > > > +# [1] git ls-remote https://github.com/golang/exp 85be41e4509f417c=
bf99006a027aef75deb8afd1
> > > >  SRCREV_exp=3D"85be41e4509f417cbf99006a027aef75deb8afd1"
> > > > -SRC_URI +=3D "git://go.googlesource.com/exp;name=3Dexp;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/exp"
> > > > +SRC_URI +=3D "git://github.com/golang/exp;name=3Dexp;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/exp"
> > > >
> > > >  # golang.org/x/image v0.0.0-20190802002840-cff245a6509b
> > > > -# [1] git ls-remote https://go.googlesource.com/image cff245a6509b=
8c4de022d0d5b9037c503c5989d6
> > > > +# [1] git ls-remote https://github.com/golang/image cff245a6509b8c=
4de022d0d5b9037c503c5989d6
> > > >  SRCREV_image=3D"cff245a6509b8c4de022d0d5b9037c503c5989d6"
> > > > -SRC_URI +=3D "git://go.googlesource.com/image;name=3Dimage;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/go.googlesource.com/image"
> > > > +SRC_URI +=3D "git://github.com/golang/image;name=3Dimage;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/image"
> > > >
> > > >  # golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
> > > > -# [1] git ls-remote https://go.googlesource.com/lint 6edffad5e6160=
f5949cdefc81710b2706fbcd4f6
> > > > +# [1] git ls-remote https://github.com/golang/lint 6edffad5e6160f5=
949cdefc81710b2706fbcd4f6
> > > >  SRCREV_lint=3D"6edffad5e6160f5949cdefc81710b2706fbcd4f6"
> > > > -SRC_URI +=3D "git://go.googlesource.com/lint;name=3Dlint;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/lint"
> > > > +SRC_URI +=3D "git://github.com/golang/lint;name=3Dlint;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/lint"
> > > >
> > > >  # golang.org/x/mobile v0.0.0-20201217150744-e6ae53a27f4f
> > > > -# [1] git ls-remote https://go.googlesource.com/mobile e6ae53a27f4=
fd7cfa2943f2ae47b96cba8eb01c9
> > > > +# [1] git ls-remote https://github.com/golang/mobile e6ae53a27f4fd=
7cfa2943f2ae47b96cba8eb01c9
> > > >  SRCREV_mobile=3D"e6ae53a27f4fd7cfa2943f2ae47b96cba8eb01c9"
> > > > -SRC_URI +=3D "git://go.googlesource.com/mobile;name=3Dmobile;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/go.googlesource.com/mobile"
> > > > +SRC_URI +=3D "git://github.com/golang/mobile;name=3Dmobile;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/golang/mobile"
> > > >
> > > >  # golang.org/x/mod v0.5.1
> > > > -# [1] git ls-remote https://go.googlesource.com/mod 49f84bccfd3469=
cb3095201f7855641bcc8eb49a
> > > > +# [1] git ls-remote https://github.com/golang/mod 49f84bccfd3469cb=
3095201f7855641bcc8eb49a
> > > >  SRCREV_mod=3D"49f84bccfd3469cb3095201f7855641bcc8eb49a"
> > > > -SRC_URI +=3D "git://go.googlesource.com/mod;name=3Dmod;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/mod"
> > > > +SRC_URI +=3D "git://github.com/golang/mod;name=3Dmod;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/mod"
> > > >
> > > >  # golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4
> > > > -# [1] git ls-remote https://go.googlesource.com/net a5a99cb37ef4b6=
8617775ab669177656090ab396
> > > > +# [1] git ls-remote https://github.com/golang/net a5a99cb37ef4b686=
17775ab669177656090ab396
> > > >  SRCREV_net=3D"a5a99cb37ef4b68617775ab669177656090ab396"
> > > > -SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/net"
> > > > +SRC_URI +=3D "git://github.com/golang/net;name=3Dnet;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/net"
> > > >
> > > >  # golang.org/x/oauth2 v0.0.0-20211104180415-d3ed0bb246c8
> > > > -# [1] git ls-remote https://go.googlesource.com/oauth2 d3ed0bb246c=
8d3c75b63937d9a5eecff9c74d7fe
> > > > +# [1] git ls-remote https://github.com/golang/oauth2 d3ed0bb246c8d=
3c75b63937d9a5eecff9c74d7fe
> > > >  SRCREV_oauth2=3D"d3ed0bb246c8d3c75b63937d9a5eecff9c74d7fe"
> > > > -SRC_URI +=3D "git://go.googlesource.com/oauth2;name=3Doauth2;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/go.googlesource.com/oauth2"
> > > > +SRC_URI +=3D "git://github.com/golang/oauth2;name=3Doauth2;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/golang/oauth2"
> > > >
> > > >  # golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
> > > > -# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0=
ddf193dd5a34e034151da389d09
> > > > +# [1] git ls-remote https://github.com/golang/sync 036812b2e83c0dd=
f193dd5a34e034151da389d09
> > > >  SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
> > > > -SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/sync"
> > > > +SRC_URI +=3D "git://github.com/golang/sync;name=3Dsync;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/sync"
> > > >
> > > >  # golang.org/x/sys v0.0.0-20210831042530-f4d43177bf5e
> > > > -# [1] git ls-remote https://go.googlesource.com/sys f4d43177bf5e2e=
e98617956e417d0555d4b69c17
> > > > +# [1] git ls-remote https://github.com/golang/sys f4d43177bf5e2ee9=
8617956e417d0555d4b69c17
> > > >  SRCREV_sys=3D"f4d43177bf5e2ee98617956e417d0555d4b69c17"
> > > > -SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/sys"
> > > > +SRC_URI +=3D "git://github.com/golang/sys;name=3Dsys;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/sys"
> > > >
> > > >  # golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d
> > > > -# [1] git ls-remote https://go.googlesource.com/term 6a3ed077a48de=
71621ad530f9078fffa0bc0ce32
> > > > +# [1] git ls-remote https://github.com/golang/term 6a3ed077a48de71=
621ad530f9078fffa0bc0ce32
> > > >  SRCREV_term1=3D"6a3ed077a48de71621ad530f9078fffa0bc0ce32"
> > > > -SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/term"
> > > > +SRC_URI +=3D "git://github.com/golang/term;name=3Dterm1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/term"
> > > >
> > > >  # golang.org/x/text v0.3.7
> > > > -# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f=
883d229d707172ed356727aae99
> > > > +# [1] git ls-remote https://github.com/golang/text 3cd4007149f3f88=
3d229d707172ed356727aae99
> > > >  SRCREV_text1=3D"3cd4007149f3f883d229d707172ed356727aae99"
> > > > -SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/text"
> > > > +SRC_URI +=3D "git://github.com/golang/text;name=3Dtext1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/text"
> > > >
> > > >  # golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac
> > > > -# [1] git ls-remote https://go.googlesource.com/time 1f47c861a9ac5=
a6e7645609f91b895398ff31642
> > > > +# [1] git ls-remote https://github.com/golang/time 1f47c861a9ac5a6=
e7645609f91b895398ff31642
> > > >  SRCREV_time=3D"1f47c861a9ac5a6e7645609f91b895398ff31642"
> > > > -SRC_URI +=3D "git://go.googlesource.com/time;name=3Dtime;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/time"
> > > > +SRC_URI +=3D "git://github.com/golang/time;name=3Dtime;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/time"
> > > >
> > > >  # golang.org/x/tools v0.1.8
> > > > -# [1] git ls-remote https://go.googlesource.com/tools e212aff8fd14=
6c44ddb0167c1dfbd5531d6c9213
> > > > +# [1] git ls-remote https://github.com/golang/tools e212aff8fd146c=
44ddb0167c1dfbd5531d6c9213
> > > >  SRCREV_tools=3D"e212aff8fd146c44ddb0167c1dfbd5531d6c9213"
> > > > -SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/go.googlesource.com/tools"
> > > > +SRC_URI +=3D "git://github.com/golang/tools;name=3Dtools;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/tools"
> > > >
> > > >  # golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
> > > > -# [1] git ls-remote https://go.googlesource.com/xerrors 5ec99f83af=
f198f5fbd629d6c8d8eb38a04218ca
> > > > +# [1] git ls-remote https://github.com/golang/xerrors 5ec99f83aff1=
98f5fbd629d6c8d8eb38a04218ca
> > > >  SRCREV_xerrors=3D"5ec99f83aff198f5fbd629d6c8d8eb38a04218ca"
> > > > -SRC_URI +=3D "git://go.googlesource.com/xerrors;name=3Dxerrors;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/go.googlesource.com/xerrors"
> > > > +SRC_URI +=3D "git://github.com/golang/xerrors;name=3Dxerrors;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/golang/xerrors"
> > > >
> > > >  # golang.zx2c4.com/go118/netip v0.0.0-20211111135330-a4a02eeacf9d
> > > >  # [1] git ls-remote https://git.zx2c4.com/go118-netip a4a02eeacf9d=
49566df85e8cff878e5527e51779
> > > > @@ -2633,7 +2633,7 @@ do_compile() {
> > > >
> > > >          cd ${S}/src/import
> > > >
> > > > -        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.or=
g/bertimus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/=
go:github.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:githu=
b.com/googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/dat=
astore:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.goog=
le.com/go/firestore:github.com/googleapis/google-cloud-go/bigquery//firesto=
re cloud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquer=
y//pubsub cloud.google.com/go/storage:github.com/googleapis/google-cloud-go=
/bigquery//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mt=
l github.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skyla=
r/excelize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for=
-go github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Az=
ure/go-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/a=
utorest:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go=
-autorest/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/ada=
l github.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/a=
utorest//autorest/date github.com/Azure/go-autorest/autorest/mocks:github.c=
om/Azure/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/=
autorest/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/A=
zure/go-autorest/autorest/validation:github.com/Azure/go-autorest/autorest/=
/autorest/validation github.com/Azure/go-autorest/logger:github.com/Azure/g=
o-autorest/autorest//logger github.com/Azure/go-autorest/tracing:github.com=
/Azure/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/=
BurntSushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.=
com/GoogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k=
8s-cloud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_p=
dh github.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com=
/Microsoft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcss=
him:github.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/=
NYTimes/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash g=
ithub.com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/Pue=
rkitoBio/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc=
:github.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/re=
try github.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.=
com/ajstarks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:g=
ithub.com/alecthomas/template github.com/alecthomas/units:github.com/alecth=
omas/units github.com/alexflint/go-filemutex:github.com/alexflint/go-filemu=
tex github.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalh=
olm/cascadia:github.com/andybalholm/cascadia github.com/antihax/optional:gi=
thub.com/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf=
 github.com/armon/consul-api:github.com/armon/consul-api github.com/armon/g=
o-metrics:github.com/armon/go-metrics github.com/armon/go-radix:github.com/=
armon/go-radix github.com/asaskevich/govalidator:github.com/asaskevich/gova=
lidator github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middlewa=
re github.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohns=
on/clock:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/be=
orn7/perks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github=
.com/bits-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bk=
etelsen/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com=
/blang/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bron=
ze1man/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/b=
uger/jsonparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:=
github.com/canonical/go-dqlite github.com/census-instrumentation/opencensus=
-proto:github.com/census-instrumentation/opencensus-proto github.com/certif=
i/gocertifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.c=
om/cespare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2=
 github.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/c=
heckpoint-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 githu=
b.com/cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com=
/chzyer/logex github.com/chzyer/readline:github.com/chzyer/readline github.=
com/chzyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/ci=
lium/ebpf github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs=
/kube-router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-g=
o github.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachd=
b/datadriven:github.com/cockroachdb/datadriven github.com/cockroachdb/error=
s:github.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/c=
ockroachdb/logtags github.com/container-storage-interface/spec:github.com/c=
ontainer-storage-interface/spec github.com/containerd/aufs:github.com/conta=
inerd/aufs github.com/containerd/btrfs:github.com/containerd/btrfs github.c=
om/containerd/cgroups:github.com/containerd/cgroups github.com/containerd/c=
onsole:github.com/containerd/console github.com/containerd/containerd:githu=
b.com/containerd/containerd github.com/containerd/continuity:github.com/con=
tainerd/continuity github.com/containerd/fifo:github.com/containerd/fifo gi=
thub.com/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-o=
verlayfs-snapshotter github.com/containerd/go-cni:github.com/containerd/go-=
cni github.com/containerd/go-runc:github.com/containerd/go-runc github.com/=
containerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nr=
i:github.com/containerd/nri github.com/containerd/stargz-snapshotter:github=
.com/containerd/stargz-snapshotter github.com/containerd/stargz-snapshotter=
/estargz:github.com/containerd/stargz-snapshotter//estargz github.com/conta=
inerd/ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:githu=
b.com/containerd/typeurl github.com/containerd/zfs:github.com/containerd/zf=
s github.com/containernetworking/cni:github.com/containernetworking/cni git=
hub.com/containernetworking/plugins:github.com/containernetworking/plugins =
github.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/co=
redns/caddy:github.com/coredns/caddy github.com/coredns/corefile-migration:=
github.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/co=
reos/bbolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/=
go-iptables:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.=
com/coreos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver =
github.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos=
/go-systemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:gith=
ub.com/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-m=
d2man/v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/file=
path-securejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:=
github.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client =
github.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardwa=
readdr:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com=
/danieljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew g=
ithub.com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext gith=
ub.com/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrija=
lva/jwt-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.co=
m/dgryski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 g=
ithub.com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:gith=
ub.com/docker/cli github.com/docker/distribution:github.com/docker/distribu=
tion github.com/docker/docker:github.com/docker/docker github.com/docker/do=
cker-credential-helpers:github.com/docker/docker-credential-helpers github.=
com/docker/go-connections:github.com/docker/go-connections github.com/docke=
r/go-events:github.com/docker/go-events github.com/docker/go-metrics:github=
.com/docker/go-metrics github.com/docker/go-units:github.com/docker/go-unit=
s github.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin=
/go-humanize:github.com/dustin/go-humanize github.com/dustmop/soup:github.c=
om/dustmop/soup github.com/eapache/channels:github.com/eapache/channels git=
hub.com/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:g=
ithub.com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emickle=
i/go-restful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/g=
o-control-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoyp=
roxy/protoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubb=
elboer/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser=
 github.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/exp=
onent-io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-pro=
mise:github.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fa=
tih/camelcase github.com/fatih/color:github.com/fatih/color github.com/feli=
xge/httpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:gi=
thub.com/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-s=
hlex github.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss=
/jwt-go:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:githu=
b.com/frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/f=
snotify github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.=
com/getsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml=
:github.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo=
 github.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.c=
om/go-errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:githu=
b.com/go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3=
/glfw//v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-=
kit/kit:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log g=
ithub.com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/l=
ogr:github.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr=
 github.com/go-openapi/analysis:github.com/go-openapi/analysis github.com/g=
o-openapi/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpoi=
nter:github.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:=
github.com/go-openapi/jsonreference github.com/go-openapi/loads:github.com/=
go-openapi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtim=
e github.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-opena=
pi/strfmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.co=
m/go-openapi/swag github.com/go-openapi/validate:github.com/go-openapi/vali=
date github.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation =
github.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go=
-stack/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:github=
.com/go-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep git=
hub.com/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:githu=
b.com/godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 githu=
b.com/gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/g=
ofrs/uuid github.com/gogo/googleapis:github.com/gogo/googleapis github.com/=
gogo/protobuf:github.com/gogo/protobuf github.com/golang/freetype:github.co=
m/golang/freetype github.com/golang/glog:github.com/golang/glog github.com/=
golang/groupcache:github.com/golang/groupcache github.com/golang/mock:githu=
b.com/golang/mock github.com/golang/protobuf:github.com/golang/protobuf git=
hub.com/golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:=
github.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus=
/fmt github.com/golangplus/testing:github.com/golangplus/testing github.com=
/google/btree:github.com/google/btree github.com/google/cadvisor:github.com=
/google/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.c=
om/google/go-containerregistry:github.com/google/go-containerregistry githu=
b.com/google/gofuzz:github.com/google/gofuzz github.com/google/martian:gith=
ub.com/google/martian github.com/google/martian/v3:github.com/google/martia=
n/v3 github.com/google/pprof:github.com/google/pprof github.com/google/rena=
meio:github.com/google/renameio github.com/google/shlex:github.com/google/s=
hlex github.com/google/uuid:github.com/google/uuid github.com/googleapis/ga=
x-go/v2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:g=
ithub.com/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/=
gophercloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/go=
pherjs github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/web=
socket:github.com/gorilla/websocket github.com/gregjones/httpcache:github.c=
om/gregjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.=
com/grpc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-pro=
metheus:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosys=
tem/grpc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/g=
o-fuse/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:gith=
ub.com/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com=
/hashicorp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicor=
p/errwrap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanht=
tp github.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/h=
ashicorp/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.=
com/hashicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashico=
rp/go-multierror:github.com/hashicorp/go-multierror github.com/hashicorp/go=
-retryablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/g=
o-rootcerts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-socka=
ddr:github.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.=
com/hashicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/g=
o-uuid github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/h=
ashicorp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hc=
l:github.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashico=
rp/logutils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/=
hashicorp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/s=
erf:github.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/he=
keti github.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tai=
l:github.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelg=
upf/socketpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor=
/demangle github.com/imdario/mergo:github.com/imdario/mergo github.com/inco=
nshreveable/mousetrap:github.com/inconshreveable/mousetrap github.com/insom=
niacslk/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:gith=
ub.com/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping =
github.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespa=
th/go-jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmesp=
ath/internal/testify:github.com/jmespath/go-jmespath/internal/testify//inte=
rnal/testify github.com/joho/godotenv:github.com/joho/godotenv github.com/j=
onboulle/clockwork:github.com/jonboulle/clockwork github.com/josharian/inte=
rn:github.com/josharian/intern github.com/josharian/native:github.com/josha=
rian/native github.com/jpillora/backoff:github.com/jpillora/backoff github.=
com/jsimonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-it=
erator/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report:g=
ithub.com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/=
gls github.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter=
 github.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/=
critbitgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:git=
hub.com/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kin=
e github.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisi=
elk/errcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.c=
om/kisielk/gotool github.com/klauspost/compress:github.com/klauspost/compre=
ss github.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsort=
en/go-windows-terminal-sequences:github.com/konsorten/go-windows-terminal-s=
equences github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/=
kr/logfmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:githu=
b.com/kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-si=
gs/cri-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/god=
ebug:github.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq gith=
ub.com/libopenstorage/openstorage:github.com/libopenstorage/openstorage git=
hub.com/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer=
/dedent:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpab=
on/godbc github.com/magiconair/properties:github.com/magiconair/properties =
github.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-c=
olorable:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.co=
m/mattn/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewid=
th github.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com=
/mattn/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_=
protobuf_extensions:github.com/matttproud/golang_protobuf_extensions github=
.com/mdlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/eth=
tool:github.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/m=
dlayher/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink g=
ithub.com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:g=
ithub.com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.=
com/miekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.co=
m/mikioh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml g=
ithub.com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-g=
o/v7:github.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/m=
inio/sha256-simd github.com/minio/sio:github.com/minio/sio github.com/misti=
fyio/go-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com=
/mitchellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-home=
dir github.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testi=
ng-interface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordw=
rap github.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/=
iochan:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:github=
.com/mitchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs githu=
b.com/moby/locker:github.com/moby/locker github.com/moby/spdystream:github.=
com/moby/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mount=
info//mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//=
symlink github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:gi=
thub.com/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/c=
oncurrent github.com/modern-go/reflect2:github.com/modern-go/reflect2 githu=
b.com/mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go=
-gitignore:github.com/monochromegane/go-gitignore github.com/morikuni/aec:g=
ithub.com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/file=
utils github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/=
mvdan/xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.c=
om/mwitkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowra=
te github.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.c=
om/niemeyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.=
com/nxadm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/oleku=
konko/tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:=
github.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github=
.com/opencontainers/go-digest:github.com/opencontainers/go-digest github.co=
m/opencontainers/image-spec:github.com/opencontainers/image-spec github.com=
/opencontainers/runc:github.com/opencontainers/runc github.com/opencontaine=
rs/runtime-spec:github.com/opencontainers/runtime-spec github.com/openconta=
iners/selinux:github.com/opencontainers/selinux github.com/opentracing/open=
tracing-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:gith=
ub.com/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.co=
m/otiai10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/o=
tiai10/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.=
com/paulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com=
/pborman/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-bu=
ffruneio github.com/pelletier/go-toml:github.com/pelletier/go-toml github.c=
om/peterbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:=
github.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.c=
om/pkg/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pm=
ezard/go-difflib github.com/posener/complete:github.com/posener/complete gi=
thub.com/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/pr=
ometheus/client_golang:github.com/prometheus/client_golang github.com/prome=
theus/client_model:github.com/prometheus/client_model github.com/prometheus=
/common:github.com/prometheus/common github.com/prometheus/procfs:github.co=
m/prometheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb g=
ithub.com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:g=
ithub.com/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher=
/dynamiclistener github.com/rancher/lasso:github.com/rancher/lasso github.c=
om/rancher/remotedialer:github.com/rancher/remotedialer github.com/rancher/=
wharfie:github.com/rancher/wharfie github.com/rancher/wrangler:github.com/r=
ancher/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/=
bigfft github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpe=
ppe/fastuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:g=
ithub.com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:g=
ithub.com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/x=
id github.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/=
blackfriday:github.com/russross/blackfriday github.com/russross/blackfriday=
/v2:github.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github=
.com/ryanuber/columnize github.com/safchain/ethtool:github.com/safchain/eth=
tool github.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/s=
eed:github.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/s=
eccomp/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff =
github.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_anc=
hor_name github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/s=
martystreets/assertions:github.com/smartystreets/assertions github.com/smar=
tystreets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cm=
ux:github.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/wat=
er github.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf=
13/afero:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast=
 github.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweat=
herman:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com=
/spf13/pflag github.com/spf13/viper:github.com/spf13/viper github.com/stefa=
nberger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewe=
r/go-strcase:github.com/stoewer/go-strcase github.com/storageos/go-api:gith=
ub.com/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx g=
ithub.com/stretchr/testify:github.com/stretchr/testify github.com/subosito/=
gotenv:github.com/subosito/gotenv github.com/syndtr/gocapability:github.com=
/syndtr/gocapability github.com/tchap/go-patricia:github.com/tchap/go-patri=
cia github.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/ten=
centcloud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github=
.com/tmc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.co=
m/u-root/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ug=
orji/go github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v=
2:github.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negr=
oni github.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vekt=
ah/gqlparser:github.com/vektah/gqlparser github.com/vishvananda/netlink:git=
hub.com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishvan=
anda/netns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/w=
illf/bitset:github.com/willf/bitset github.com/xiang90/probing:github.com/x=
iang90/probing github.com/xlab/treeprint:github.com/xlab/treeprint github.c=
om/xordataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/g=
oldmark:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.=
io/etcd:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/et=
cd/client/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/e=
tcd/client/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/cli=
ent/pkg/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/=
v3//raft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.=
io/etcd/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/=
etcdutl/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3=
:github.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/=
pkcs7 go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.open=
telemetry.io/contrib go.opentelemetry.io/contrib/instrumentation/google.gol=
ang.org/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.g=
olang.org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/htt=
p/otelhttp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp g=
o.opentelemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/e=
xporters/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/=
otel/metric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/otelt=
est:go.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.open=
telemetry.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.opente=
lemetry.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.o=
pentelemetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opentele=
metry.io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemet=
ry/opentelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/star=
lark-go go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.or=
g/goleak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.=
org/zap golang.org/x/crypto:go.googlesource.com/crypto golang.org/x/exp:go.=
googlesource.com/exp golang.org/x/image:go.googlesource.com/image golang.or=
g/x/lint:go.googlesource.com/lint golang.org/x/mobile:go.googlesource.com/m=
obile golang.org/x/mod:go.googlesource.com/mod golang.org/x/net:go.googleso=
urce.com/net golang.org/x/oauth2:go.googlesource.com/oauth2 golang.org/x/sy=
nc:go.googlesource.com/sync golang.org/x/sys:go.googlesource.com/sys golang=
.org/x/term:go.googlesource.com/term golang.org/x/text:go.googlesource.com/=
text golang.org/x/time:go.googlesource.com/time golang.org/x/tools:go.googl=
esource.com/tools golang.org/x/xerrors:go.googlesource.com/xerrors golang.z=
x2c4.com/go118/netip:golang.zx2c4.com/go118/netip golang.zx2c4.com/wintun:g=
olang.zx2c4.com/wintun golang.zx2c4.com/wireguard:golang.zx2c4.com/wireguar=
d golang.zx2c4.com/wireguard/wgctrl:golang.zx2c4.com/wireguard/wgctrl gonum=
.org/v1/gonum:github.com/gonum/gonum gonum.org/v1/netlib:github.com/gonum/n=
etlib gonum.org/v1/plot:github.com/gonum/plot google.golang.org/api:google.=
golang.org/api google.golang.org/appengine:google.golang.org/appengine goog=
le.golang.org/genproto:google.golang.org/genproto google.golang.org/grpc:go=
ogle.golang.org/grpc google.golang.org/grpc/cmd/protoc-gen-go-grpc:google.g=
olang.org/grpc/cmd/protoc-gen-go-grpc google.golang.org/protobuf:google.gol=
ang.org/protobuf gopkg.in/airbrake/gobrake.v2:gopkg.in/airbrake/gobrake.v2 =
gopkg.in/alecthomas/kingpin.v2:gopkg.in/alecthomas/kingpin.v2 gopkg.in/chec=
k.v1:gopkg.in/check.v1 gopkg.in/cheggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopk=
g.in/errgo.v2:gopkg.in/errgo.v2 gopkg.in/fsnotify.v1:gopkg.in/fsnotify.v1 g=
opkg.in/gcfg.v1:gopkg.in/gcfg.v1 gopkg.in/gemnasium/logrus-airbrake-hook.v2=
:gopkg.in/gemnasium/logrus-airbrake-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0=
 gopkg.in/ini.v1:gopkg.in/ini.v1 gopkg.in/natefinch/lumberjack.v2:gopkg.in/=
natefinch/lumberjack.v2 gopkg.in/resty.v1:gopkg.in/resty.v1 gopkg.in/square=
/go-jose.v2:gopkg.in/square/go-jose.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 go=
pkg.in/warnings.v0:gopkg.in/warnings.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 g=
opkg.in/yaml.v3:gopkg.in/yaml.v3 gotest.tools:gotest.tools gotest.tools/v3:=
github.com/gotestyourself/gotest.tools/v3 honnef.co/go/tools:honnef.co/go/t=
ools inet.af/tcpproxy:inet.af/tcpproxy k8s.io/api:github.com/k3s-io/kuberne=
tes/staging/src/k8s.io/api//staging/src/k8s.io/api k8s.io/apiextensions-api=
server:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s=
.io/apiextensions-apiserver k8s.io/apimachinery:github.com/k3s-io/kubernete=
s/staging/src/k8s.io/api//staging/src/k8s.io/apimachinery k8s.io/apiserver:=
github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/api=
server k8s.io/cli-runtime:github.com/k3s-io/kubernetes/staging/src/k8s.io/a=
pi//staging/src/k8s.io/cli-runtime k8s.io/client-go:github.com/k3s-io/kuber=
netes/staging/src/k8s.io/api//staging/src/k8s.io/client-go k8s.io/cloud-pro=
vider:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.=
io/cloud-provider k8s.io/cluster-bootstrap:github.com/k3s-io/kubernetes/sta=
ging/src/k8s.io/api//staging/src/k8s.io/cluster-bootstrap k8s.io/code-gener=
ator:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.i=
o/code-generator k8s.io/component-base:github.com/k3s-io/kubernetes/staging=
/src/k8s.io/api//staging/src/k8s.io/component-base k8s.io/component-helpers=
:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/co=
mponent-helpers k8s.io/controller-manager:github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/api//staging/src/k8s.io/controller-manager k8s.io/cri-api:gi=
thub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cri-a=
pi k8s.io/csi-translation-lib:github.com/k3s-io/kubernetes/staging/src/k8s.=
io/api//staging/src/k8s.io/csi-translation-lib k8s.io/kube-aggregator:githu=
b.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-agg=
regator k8s.io/kube-controller-manager:github.com/k3s-io/kubernetes/staging=
/src/k8s.io/api//staging/src/k8s.io/kube-controller-manager k8s.io/kube-pro=
xy:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/=
kube-proxy k8s.io/kube-scheduler:github.com/k3s-io/kubernetes/staging/src/k=
8s.io/api//staging/src/k8s.io/kube-scheduler k8s.io/kubectl:github.com/k3s-=
io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kubectl k8s.io/kub=
elet:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.i=
o/kubelet k8s.io/kubernetes:github.com/k3s-io/kubernetes/staging/src/k8s.io=
/api k8s.io/legacy-cloud-providers:github.com/k3s-io/kubernetes/staging/src=
/k8s.io/api//staging/src/k8s.io/legacy-cloud-providers k8s.io/metrics:githu=
b.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/metrics =
k8s.io/mount-utils:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//sta=
ging/src/k8s.io/mount-utils k8s.io/pod-security-admission:github.com/k3s-io=
/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/pod-security-admissi=
on k8s.io/sample-apiserver:github.com/k3s-io/kubernetes/staging/src/k8s.io/=
api//staging/src/k8s.io/sample-apiserver k8s.io/gengo:k8s.io/gengo k8s.io/k=
log:k8s.io/klog k8s.io/klog/v2:github.com/k3s-io/klog/v2 k8s.io/kube-openap=
i:k8s.io/kube-openapi k8s.io/system-validators:k8s.io/system-validators k8s=
.io/utils:k8s.io/utils modernc.org/cc:modernc.org/cc modernc.org/golex:mode=
rnc.org/golex modernc.org/mathutil:modernc.org/mathutil modernc.org/strutil=
:modernc.org/strutil modernc.org/xc:modernc.org/xc rsc.io/binaryregexp:rsc.=
io/binaryregexp rsc.io/pdf:rsc.io/pdf rsc.io/quote/v3:github.com/rsc/quote/=
v3//v3 rsc.io/sampler:rsc.io/sampler sigs.k8s.io/apiserver-network-proxy/ko=
nnectivity-client:github.com/kubernetes-sigs/apiserver-network-proxy/konnec=
tivity-client//konnectivity-client sigs.k8s.io/cli-utils:sigs.k8s.io/cli-ut=
ils sigs.k8s.io/controller-runtime:sigs.k8s.io/controller-runtime sigs.k8s.=
io/kustomize/api:github.com/kubernetes-sigs/kustomize/api//api sigs.k8s.io/=
kustomize/cmd/config:github.com/kubernetes-sigs/kustomize/api//cmd/config s=
igs.k8s.io/kustomize/kustomize/v4:github.com/kubernetes-sigs/kustomize/api/=
/kustomize sigs.k8s.io/kustomize/kyaml:github.com/kubernetes-sigs/kustomize=
/api//kyaml sigs.k8s.io/structured-merge-diff/v4:github.com/kubernetes-sigs=
/structured-merge-diff/v4 sigs.k8s.io/testing_frameworks:sigs.k8s.io/testin=
g_frameworks sigs.k8s.io/yaml:sigs.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.io=
/json"
> > > > +        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.or=
g/bertimus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/=
go:github.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:githu=
b.com/googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/dat=
astore:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.goog=
le.com/go/firestore:github.com/googleapis/google-cloud-go/bigquery//firesto=
re cloud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquer=
y//pubsub cloud.google.com/go/storage:github.com/googleapis/google-cloud-go=
/bigquery//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mt=
l github.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skyla=
r/excelize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for=
-go github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Az=
ure/go-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/a=
utorest:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go=
-autorest/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/ada=
l github.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/a=
utorest//autorest/date github.com/Azure/go-autorest/autorest/mocks:github.c=
om/Azure/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/=
autorest/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/A=
zure/go-autorest/autorest/validation:github.com/Azure/go-autorest/autorest/=
/autorest/validation github.com/Azure/go-autorest/logger:github.com/Azure/g=
o-autorest/autorest//logger github.com/Azure/go-autorest/tracing:github.com=
/Azure/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/=
BurntSushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.=
com/GoogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k=
8s-cloud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_p=
dh github.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com=
/Microsoft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcss=
him:github.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/=
NYTimes/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash g=
ithub.com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/Pue=
rkitoBio/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc=
:github.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/re=
try github.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.=
com/ajstarks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:g=
ithub.com/alecthomas/template github.com/alecthomas/units:github.com/alecth=
omas/units github.com/alexflint/go-filemutex:github.com/alexflint/go-filemu=
tex github.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalh=
olm/cascadia:github.com/andybalholm/cascadia github.com/antihax/optional:gi=
thub.com/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf=
 github.com/armon/consul-api:github.com/armon/consul-api github.com/armon/g=
o-metrics:github.com/armon/go-metrics github.com/armon/go-radix:github.com/=
armon/go-radix github.com/asaskevich/govalidator:github.com/asaskevich/gova=
lidator github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middlewa=
re github.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohns=
on/clock:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/be=
orn7/perks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github=
.com/bits-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bk=
etelsen/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com=
/blang/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bron=
ze1man/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/b=
uger/jsonparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:=
github.com/canonical/go-dqlite github.com/census-instrumentation/opencensus=
-proto:github.com/census-instrumentation/opencensus-proto github.com/certif=
i/gocertifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.c=
om/cespare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2=
 github.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/c=
heckpoint-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 githu=
b.com/cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com=
/chzyer/logex github.com/chzyer/readline:github.com/chzyer/readline github.=
com/chzyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/ci=
lium/ebpf github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs=
/kube-router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-g=
o github.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachd=
b/datadriven:github.com/cockroachdb/datadriven github.com/cockroachdb/error=
s:github.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/c=
ockroachdb/logtags github.com/container-storage-interface/spec:github.com/c=
ontainer-storage-interface/spec github.com/containerd/aufs:github.com/conta=
inerd/aufs github.com/containerd/btrfs:github.com/containerd/btrfs github.c=
om/containerd/cgroups:github.com/containerd/cgroups github.com/containerd/c=
onsole:github.com/containerd/console github.com/containerd/containerd:githu=
b.com/containerd/containerd github.com/containerd/continuity:github.com/con=
tainerd/continuity github.com/containerd/fifo:github.com/containerd/fifo gi=
thub.com/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-o=
verlayfs-snapshotter github.com/containerd/go-cni:github.com/containerd/go-=
cni github.com/containerd/go-runc:github.com/containerd/go-runc github.com/=
containerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nr=
i:github.com/containerd/nri github.com/containerd/stargz-snapshotter:github=
.com/containerd/stargz-snapshotter github.com/containerd/stargz-snapshotter=
/estargz:github.com/containerd/stargz-snapshotter//estargz github.com/conta=
inerd/ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:githu=
b.com/containerd/typeurl github.com/containerd/zfs:github.com/containerd/zf=
s github.com/containernetworking/cni:github.com/containernetworking/cni git=
hub.com/containernetworking/plugins:github.com/containernetworking/plugins =
github.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/co=
redns/caddy:github.com/coredns/caddy github.com/coredns/corefile-migration:=
github.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/co=
reos/bbolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/=
go-iptables:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.=
com/coreos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver =
github.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos=
/go-systemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:gith=
ub.com/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-m=
d2man/v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/file=
path-securejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:=
github.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client =
github.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardwa=
readdr:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com=
/danieljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew g=
ithub.com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext gith=
ub.com/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrija=
lva/jwt-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.co=
m/dgryski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 g=
ithub.com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:gith=
ub.com/docker/cli github.com/docker/distribution:github.com/docker/distribu=
tion github.com/docker/docker:github.com/docker/docker github.com/docker/do=
cker-credential-helpers:github.com/docker/docker-credential-helpers github.=
com/docker/go-connections:github.com/docker/go-connections github.com/docke=
r/go-events:github.com/docker/go-events github.com/docker/go-metrics:github=
.com/docker/go-metrics github.com/docker/go-units:github.com/docker/go-unit=
s github.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin=
/go-humanize:github.com/dustin/go-humanize github.com/dustmop/soup:github.c=
om/dustmop/soup github.com/eapache/channels:github.com/eapache/channels git=
hub.com/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:g=
ithub.com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emickle=
i/go-restful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/g=
o-control-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoyp=
roxy/protoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubb=
elboer/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser=
 github.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/exp=
onent-io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-pro=
mise:github.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fa=
tih/camelcase github.com/fatih/color:github.com/fatih/color github.com/feli=
xge/httpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:gi=
thub.com/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-s=
hlex github.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss=
/jwt-go:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:githu=
b.com/frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/f=
snotify github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.=
com/getsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml=
:github.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo=
 github.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.c=
om/go-errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:githu=
b.com/go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3=
/glfw//v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-=
kit/kit:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log g=
ithub.com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/l=
ogr:github.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr=
 github.com/go-openapi/analysis:github.com/go-openapi/analysis github.com/g=
o-openapi/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpoi=
nter:github.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:=
github.com/go-openapi/jsonreference github.com/go-openapi/loads:github.com/=
go-openapi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtim=
e github.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-opena=
pi/strfmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.co=
m/go-openapi/swag github.com/go-openapi/validate:github.com/go-openapi/vali=
date github.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation =
github.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go=
-stack/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:github=
.com/go-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep git=
hub.com/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:githu=
b.com/godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 githu=
b.com/gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/g=
ofrs/uuid github.com/gogo/googleapis:github.com/gogo/googleapis github.com/=
gogo/protobuf:github.com/gogo/protobuf github.com/golang/freetype:github.co=
m/golang/freetype github.com/golang/glog:github.com/golang/glog github.com/=
golang/groupcache:github.com/golang/groupcache github.com/golang/mock:githu=
b.com/golang/mock github.com/golang/protobuf:github.com/golang/protobuf git=
hub.com/golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:=
github.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus=
/fmt github.com/golangplus/testing:github.com/golangplus/testing github.com=
/google/btree:github.com/google/btree github.com/google/cadvisor:github.com=
/google/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.c=
om/google/go-containerregistry:github.com/google/go-containerregistry githu=
b.com/google/gofuzz:github.com/google/gofuzz github.com/google/martian:gith=
ub.com/google/martian github.com/google/martian/v3:github.com/google/martia=
n/v3 github.com/google/pprof:github.com/google/pprof github.com/google/rena=
meio:github.com/google/renameio github.com/google/shlex:github.com/google/s=
hlex github.com/google/uuid:github.com/google/uuid github.com/googleapis/ga=
x-go/v2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:g=
ithub.com/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/=
gophercloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/go=
pherjs github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/web=
socket:github.com/gorilla/websocket github.com/gregjones/httpcache:github.c=
om/gregjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.=
com/grpc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-pro=
metheus:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosys=
tem/grpc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/g=
o-fuse/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:gith=
ub.com/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com=
/hashicorp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicor=
p/errwrap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanht=
tp github.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/h=
ashicorp/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.=
com/hashicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashico=
rp/go-multierror:github.com/hashicorp/go-multierror github.com/hashicorp/go=
-retryablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/g=
o-rootcerts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-socka=
ddr:github.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.=
com/hashicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/g=
o-uuid github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/h=
ashicorp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hc=
l:github.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashico=
rp/logutils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/=
hashicorp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/s=
erf:github.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/he=
keti github.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tai=
l:github.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelg=
upf/socketpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor=
/demangle github.com/imdario/mergo:github.com/imdario/mergo github.com/inco=
nshreveable/mousetrap:github.com/inconshreveable/mousetrap github.com/insom=
niacslk/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:gith=
ub.com/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping =
github.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespa=
th/go-jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmesp=
ath/internal/testify:github.com/jmespath/go-jmespath/internal/testify//inte=
rnal/testify github.com/joho/godotenv:github.com/joho/godotenv github.com/j=
onboulle/clockwork:github.com/jonboulle/clockwork github.com/josharian/inte=
rn:github.com/josharian/intern github.com/josharian/native:github.com/josha=
rian/native github.com/jpillora/backoff:github.com/jpillora/backoff github.=
com/jsimonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-it=
erator/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report:g=
ithub.com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/=
gls github.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter=
 github.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/=
critbitgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:git=
hub.com/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kin=
e github.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisi=
elk/errcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.c=
om/kisielk/gotool github.com/klauspost/compress:github.com/klauspost/compre=
ss github.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsort=
en/go-windows-terminal-sequences:github.com/konsorten/go-windows-terminal-s=
equences github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/=
kr/logfmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:githu=
b.com/kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-si=
gs/cri-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/god=
ebug:github.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq gith=
ub.com/libopenstorage/openstorage:github.com/libopenstorage/openstorage git=
hub.com/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer=
/dedent:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpab=
on/godbc github.com/magiconair/properties:github.com/magiconair/properties =
github.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-c=
olorable:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.co=
m/mattn/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewid=
th github.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com=
/mattn/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_=
protobuf_extensions:github.com/matttproud/golang_protobuf_extensions github=
.com/mdlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/eth=
tool:github.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/m=
dlayher/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink g=
ithub.com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:g=
ithub.com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.=
com/miekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.co=
m/mikioh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml g=
ithub.com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-g=
o/v7:github.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/m=
inio/sha256-simd github.com/minio/sio:github.com/minio/sio github.com/misti=
fyio/go-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com=
/mitchellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-home=
dir github.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testi=
ng-interface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordw=
rap github.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/=
iochan:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:github=
.com/mitchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs githu=
b.com/moby/locker:github.com/moby/locker github.com/moby/spdystream:github.=
com/moby/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mount=
info//mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//=
symlink github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:gi=
thub.com/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/c=
oncurrent github.com/modern-go/reflect2:github.com/modern-go/reflect2 githu=
b.com/mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go=
-gitignore:github.com/monochromegane/go-gitignore github.com/morikuni/aec:g=
ithub.com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/file=
utils github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/=
mvdan/xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.c=
om/mwitkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowra=
te github.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.c=
om/niemeyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.=
com/nxadm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/oleku=
konko/tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:=
github.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github=
.com/opencontainers/go-digest:github.com/opencontainers/go-digest github.co=
m/opencontainers/image-spec:github.com/opencontainers/image-spec github.com=
/opencontainers/runc:github.com/opencontainers/runc github.com/opencontaine=
rs/runtime-spec:github.com/opencontainers/runtime-spec github.com/openconta=
iners/selinux:github.com/opencontainers/selinux github.com/opentracing/open=
tracing-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:gith=
ub.com/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.co=
m/otiai10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/o=
tiai10/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.=
com/paulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com=
/pborman/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-bu=
ffruneio github.com/pelletier/go-toml:github.com/pelletier/go-toml github.c=
om/peterbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:=
github.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.c=
om/pkg/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pm=
ezard/go-difflib github.com/posener/complete:github.com/posener/complete gi=
thub.com/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/pr=
ometheus/client_golang:github.com/prometheus/client_golang github.com/prome=
theus/client_model:github.com/prometheus/client_model github.com/prometheus=
/common:github.com/prometheus/common github.com/prometheus/procfs:github.co=
m/prometheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb g=
ithub.com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:g=
ithub.com/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher=
/dynamiclistener github.com/rancher/lasso:github.com/rancher/lasso github.c=
om/rancher/remotedialer:github.com/rancher/remotedialer github.com/rancher/=
wharfie:github.com/rancher/wharfie github.com/rancher/wrangler:github.com/r=
ancher/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/=
bigfft github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpe=
ppe/fastuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:g=
ithub.com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:g=
ithub.com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/x=
id github.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/=
blackfriday:github.com/russross/blackfriday github.com/russross/blackfriday=
/v2:github.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github=
.com/ryanuber/columnize github.com/safchain/ethtool:github.com/safchain/eth=
tool github.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/s=
eed:github.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/s=
eccomp/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff =
github.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_anc=
hor_name github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/s=
martystreets/assertions:github.com/smartystreets/assertions github.com/smar=
tystreets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cm=
ux:github.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/wat=
er github.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf=
13/afero:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast=
 github.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweat=
herman:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com=
/spf13/pflag github.com/spf13/viper:github.com/spf13/viper github.com/stefa=
nberger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewe=
r/go-strcase:github.com/stoewer/go-strcase github.com/storageos/go-api:gith=
ub.com/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx g=
ithub.com/stretchr/testify:github.com/stretchr/testify github.com/subosito/=
gotenv:github.com/subosito/gotenv github.com/syndtr/gocapability:github.com=
/syndtr/gocapability github.com/tchap/go-patricia:github.com/tchap/go-patri=
cia github.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/ten=
centcloud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github=
.com/tmc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.co=
m/u-root/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ug=
orji/go github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v=
2:github.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negr=
oni github.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vekt=
ah/gqlparser:github.com/vektah/gqlparser github.com/vishvananda/netlink:git=
hub.com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishvan=
anda/netns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/w=
illf/bitset:github.com/willf/bitset github.com/xiang90/probing:github.com/x=
iang90/probing github.com/xlab/treeprint:github.com/xlab/treeprint github.c=
om/xordataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/g=
oldmark:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.=
io/etcd:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/et=
cd/client/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/e=
tcd/client/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/cli=
ent/pkg/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/=
v3//raft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.=
io/etcd/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/=
etcdutl/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3=
:github.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/=
pkcs7 go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.open=
telemetry.io/contrib go.opentelemetry.io/contrib/instrumentation/google.gol=
ang.org/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.g=
olang.org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/htt=
p/otelhttp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp g=
o.opentelemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/e=
xporters/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/=
otel/metric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/otelt=
est:go.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.open=
telemetry.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.opente=
lemetry.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.o=
pentelemetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opentele=
metry.io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemet=
ry/opentelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/star=
lark-go go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.or=
g/goleak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.=
org/zap golang.org/x/crypto:github.com/golang/crypto golang.org/x/exp:githu=
b.com/golang/exp golang.org/x/image:github.com/golang/image golang.org/x/li=
nt:github.com/golang/lint golang.org/x/mobile:github.com/golang/mobile gola=
ng.org/x/mod:github.com/golang/mod golang.org/x/net:github.com/golang/net g=
olang.org/x/oauth2:github.com/golang/oauth2 golang.org/x/sync:github.com/go=
lang/sync golang.org/x/sys:github.com/golang/sys golang.org/x/term:github.c=
om/golang/term golang.org/x/text:github.com/golang/text golang.org/x/time:g=
ithub.com/golang/time golang.org/x/tools:github.com/golang/tools golang.org=
/x/xerrors:github.com/golang/xerrors golang.zx2c4.com/go118/netip:golang.zx=
2c4.com/go118/netip golang.zx2c4.com/wintun:golang.zx2c4.com/wintun golang.=
zx2c4.com/wireguard:golang.zx2c4.com/wireguard golang.zx2c4.com/wireguard/w=
gctrl:golang.zx2c4.com/wireguard/wgctrl gonum.org/v1/gonum:github.com/gonum=
/gonum gonum.org/v1/netlib:github.com/gonum/netlib gonum.org/v1/plot:github=
.com/gonum/plot google.golang.org/api:google.golang.org/api google.golang.o=
rg/appengine:google.golang.org/appengine google.golang.org/genproto:google.=
golang.org/genproto google.golang.org/grpc:google.golang.org/grpc google.go=
lang.org/grpc/cmd/protoc-gen-go-grpc:google.golang.org/grpc/cmd/protoc-gen-=
go-grpc google.golang.org/protobuf:google.golang.org/protobuf gopkg.in/airb=
rake/gobrake.v2:gopkg.in/airbrake/gobrake.v2 gopkg.in/alecthomas/kingpin.v2=
:gopkg.in/alecthomas/kingpin.v2 gopkg.in/check.v1:gopkg.in/check.v1 gopkg.i=
n/cheggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.in/errgo.v2:gopkg.in/errgo.v=
2 gopkg.in/fsnotify.v1:gopkg.in/fsnotify.v1 gopkg.in/gcfg.v1:gopkg.in/gcfg.=
v1 gopkg.in/gemnasium/logrus-airbrake-hook.v2:gopkg.in/gemnasium/logrus-air=
brake-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 gopkg.in/ini.v1:gopkg.in/ini.=
v1 gopkg.in/natefinch/lumberjack.v2:gopkg.in/natefinch/lumberjack.v2 gopkg.=
in/resty.v1:gopkg.in/resty.v1 gopkg.in/square/go-jose.v2:gopkg.in/square/go=
-jose.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopkg.in/warnings.v0:gopkg.in/wa=
rnings.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gopkg.in/yaml.v3:gopkg.in/yaml.=
v3 gotest.tools:gotest.tools gotest.tools/v3:github.com/gotestyourself/gote=
st.tools/v3 honnef.co/go/tools:honnef.co/go/tools inet.af/tcpproxy:inet.af/=
tcpproxy k8s.io/api:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//st=
aging/src/k8s.io/api k8s.io/apiextensions-apiserver:github.com/k3s-io/kuber=
netes/staging/src/k8s.io/api//staging/src/k8s.io/apiextensions-apiserver k8=
s.io/apimachinery:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//stag=
ing/src/k8s.io/apimachinery k8s.io/apiserver:github.com/k3s-io/kubernetes/s=
taging/src/k8s.io/api//staging/src/k8s.io/apiserver k8s.io/cli-runtime:gith=
ub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cli-run=
time k8s.io/client-go:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//=
staging/src/k8s.io/client-go k8s.io/cloud-provider:github.com/k3s-io/kubern=
etes/staging/src/k8s.io/api//staging/src/k8s.io/cloud-provider k8s.io/clust=
er-bootstrap:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/s=
rc/k8s.io/cluster-bootstrap k8s.io/code-generator:github.com/k3s-io/kuberne=
tes/staging/src/k8s.io/api//staging/src/k8s.io/code-generator k8s.io/compon=
ent-base:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k=
8s.io/component-base k8s.io/component-helpers:github.com/k3s-io/kubernetes/=
staging/src/k8s.io/api//staging/src/k8s.io/component-helpers k8s.io/control=
ler-manager:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/sr=
c/k8s.io/controller-manager k8s.io/cri-api:github.com/k3s-io/kubernetes/sta=
ging/src/k8s.io/api//staging/src/k8s.io/cri-api k8s.io/csi-translation-lib:=
github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/csi=
-translation-lib k8s.io/kube-aggregator:github.com/k3s-io/kubernetes/stagin=
g/src/k8s.io/api//staging/src/k8s.io/kube-aggregator k8s.io/kube-controller=
-manager:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k=
8s.io/kube-controller-manager k8s.io/kube-proxy:github.com/k3s-io/kubernete=
s/staging/src/k8s.io/api//staging/src/k8s.io/kube-proxy k8s.io/kube-schedul=
er:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/=
kube-scheduler k8s.io/kubectl:github.com/k3s-io/kubernetes/staging/src/k8s.=
io/api//staging/src/k8s.io/kubectl k8s.io/kubelet:github.com/k3s-io/kuberne=
tes/staging/src/k8s.io/api//staging/src/k8s.io/kubelet k8s.io/kubernetes:gi=
thub.com/k3s-io/kubernetes/staging/src/k8s.io/api k8s.io/legacy-cloud-provi=
ders:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.i=
o/legacy-cloud-providers k8s.io/metrics:github.com/k3s-io/kubernetes/stagin=
g/src/k8s.io/api//staging/src/k8s.io/metrics k8s.io/mount-utils:github.com/=
k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/mount-utils k8=
s.io/pod-security-admission:github.com/k3s-io/kubernetes/staging/src/k8s.io=
/api//staging/src/k8s.io/pod-security-admission k8s.io/sample-apiserver:git=
hub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/sample=
-apiserver k8s.io/gengo:k8s.io/gengo k8s.io/klog:k8s.io/klog k8s.io/klog/v2=
:github.com/k3s-io/klog/v2 k8s.io/kube-openapi:k8s.io/kube-openapi k8s.io/s=
ystem-validators:k8s.io/system-validators k8s.io/utils:k8s.io/utils modernc=
.org/cc:modernc.org/cc modernc.org/golex:modernc.org/golex modernc.org/math=
util:modernc.org/mathutil modernc.org/strutil:modernc.org/strutil modernc.o=
rg/xc:modernc.org/xc rsc.io/binaryregexp:rsc.io/binaryregexp rsc.io/pdf:rsc=
.io/pdf rsc.io/quote/v3:github.com/rsc/quote/v3//v3 rsc.io/sampler:rsc.io/s=
ampler sigs.k8s.io/apiserver-network-proxy/konnectivity-client:github.com/k=
ubernetes-sigs/apiserver-network-proxy/konnectivity-client//konnectivity-cl=
ient sigs.k8s.io/cli-utils:sigs.k8s.io/cli-utils sigs.k8s.io/controller-run=
time:sigs.k8s.io/controller-runtime sigs.k8s.io/kustomize/api:github.com/ku=
bernetes-sigs/kustomize/api//api sigs.k8s.io/kustomize/cmd/config:github.co=
m/kubernetes-sigs/kustomize/api//cmd/config sigs.k8s.io/kustomize/kustomize=
/v4:github.com/kubernetes-sigs/kustomize/api//kustomize sigs.k8s.io/kustomi=
ze/kyaml:github.com/kubernetes-sigs/kustomize/api//kyaml sigs.k8s.io/struct=
ured-merge-diff/v4:github.com/kubernetes-sigs/structured-merge-diff/v4 sigs=
.k8s.io/testing_frameworks:sigs.k8s.io/testing_frameworks sigs.k8s.io/yaml:=
sigs.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.io/json"
> > > >          for s in $sites; do
> > > >              site_dest=3D$(echo $s | cut -d: -f1)
> > > >              site_source=3D$(echo $s | cut -d: -f2)
> > > > --
> > > > 2.35.1
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
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7383): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7383
> Mute This Topic: https://lists.yoctoproject.org/mt/91626824/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

