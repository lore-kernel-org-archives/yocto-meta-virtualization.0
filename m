Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1B4C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 03:16:40 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.26106.1655694995677071457
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Jun 2022 20:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m/mW1Dxi;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id p14so3383668pfh.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Jun 2022 20:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=21PdqXElX0T3ge0OuJ6qchQd6gz5ymjQW8wyWlZK4LU=;
        b=m/mW1DxiOFWI4BLhDJwMyjxRvPrNqM1oHmYu0E2hJhhpc+577dHh+z+puzVTeVXH8l
         y43FCSGPxHsY7vmczbZA21CmTJ9Bgx7kknLwy4t3l8Eq7In8TFgNnssakK4hN+G+i4Ar
         PyNU6fTW3lrjMudcgat6jLch5MfFGqsY44R3rRrEV1wUoTdvVyWY4LtEIqZREG1ZxlAZ
         HuWejQfE6JgAmZTo+7acIOHSdqKnuZU+uwjuUKEqiTEFd1t0OqK5N3fx2XqybKyrlMAO
         w5RPTdTS+BdO9uAHSHMT8EqYdEVzcBAmqIhve4u7EFwNarDBIZT6qDpWMybzGL58kKyQ
         269A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=21PdqXElX0T3ge0OuJ6qchQd6gz5ymjQW8wyWlZK4LU=;
        b=TzLIJv/iQWyBzG2nd0VuzLovHAl9gzNssmPYtbZURoBR4EgXyQA6AZkRftfA1tDpda
         LNhh4V4azEtUD2IAh6cSMgcsW4m3+yEtliI8VmJZDD7RYQsRNHkko+WYYjpch092/KD0
         q9i8FYFpc0X8G6hDRY7v1CVFgk+haLTBfTOEgfeb8ULGzoX/GOxMYRZiPxxM0pMnmHLj
         r8u74TKZOAbqaZSelWGOPk4rqv3HskuSdxkUknZQw6LzwGg1QrZxR64Bo4vtBJ6ADbWR
         nXLjS9CYmMkM59C7MxuYJP6FgeHfGhtJEukXjpHg931cWZgV2eaDbDCQEgaWE1Vq/Qgu
         o1DQ==
X-Gm-Message-State: AJIora+SUILiQ60XjpkUn7OiAveSDuzkTcwZdGVxV4BmSE4qbPC33PV3
	JBDjEMcAylMo+BJgEbwtzUtlnhbrG/1O4badh5Q=
X-Google-Smtp-Source: 
 AGRyM1tPLVRgFsoYRmubL2ymLnZyGSUWcsBggZknMOsBuYAXedaXCiLBufYG0Fo9gRaNyX17prrOWdyW7e+2q7SEqgs=
X-Received: by 2002:a05:6a00:cca:b0:51b:ed40:b08a with SMTP id
 b10-20020a056a000cca00b0051bed40b08amr22480482pfv.19.1655694994614; Sun, 19
 Jun 2022 20:16:34 -0700 (PDT)
MIME-Version: 1.0
References: 
 <956614aeb05d3f6377da58e713309ca12e2fffe9.1654704740.git.diego.sueiro@arm.com>
 <CADkTA4OSvLY2XXxBJepn=MPEXjFzWBjyHX85SrEvV6kZk+d7ug@mail.gmail.com>
 <AM6PR08MB346165205ECFDCB2835D14FE92A79@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <16F74403FED38BBB.29749@lists.yoctoproject.org>
 <16F8948C75C465C6.5358@lists.yoctoproject.org>
 <16F92F9204A32AE4.10812@lists.yoctoproject.org>
In-Reply-To: <16F92F9204A32AE4.10812@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 19 Jun 2022 23:16:22 -0400
Message-ID: 
 <CADkTA4NL2s3h+LwcGsc_xBh-n+OBR8XVwx9fRSBonSh1C1Kz=Q@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jun 2022 03:16:40 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7390

On Thu, Jun 16, 2022 at 3:10 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Jun 14, 2022 at 3:49 PM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Fri, Jun 10, 2022 at 9:02 AM Bruce Ashfield via
> > lists.yoctoproject.org
> > <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > > On Thu, Jun 9, 2022 at 3:46 AM Diego Sueiro <Diego.Sueiro@arm.com> wr=
ote:
> > > >
> > > > Hi Bruce,
> > > >
> > > > ________________________________
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > Sent: 08 June 2022 17:47
> > > > To: Diego Sueiro <Diego.Sueiro@arm.com>
> > > > Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization=
@lists.yoctoproject.org>; nd <nd@arm.com>
> > > > Subject: Re: [meta-virtualization][PATCH] k3s: Fetch dependencies f=
rom github instead of googlesource to avoid rate-limit
> > > >
> > > > On Wed, Jun 8, 2022 at 12:21 PM Diego Sueiro <diego.sueiro@arm.com>=
 wrote:
> > > > >
> > > > > All repositories under https://go.googlesource.com/ have a mirror=
 in
> > > > > https://github.com.
> > > > >
> > > > > Fetching the dependencies from github is much faster and we avoid=
 timeouts due
> > > > > to googlesource rate-limit.
> > > > >
> > > > > Reference: https://github.com/golang/go/issues/12933
> > > >
> > > > I've been working on updating k3s to the same format as nerdctl (wi=
th
> > > > .inc files and better formatted dependencies), so let me finish tha=
t
> > > > update, and then we can get this applied.
> > > >
> > > >
> > > > Thanks. Do you have an ETA for it? Also, is it possible to have the=
 same
> > > > on kirkstone branch as well?
> > > >
> > >
> > > I'm working through the change now. I expect to have everything done
> > > by next week.
> >
> > FYI: I ran into some build/integration issues with the remapped
> > sources during my testing.
> >
> > I'm working through the issues, but do expect to get it sorted in the
> > next day or so.
>
> With the mapped sources, I'm getting :
>
> | HASH subkey 6e32f77375d0996065f1395ad10899fcdedbe48231e9d03e1c591d00e19=
a854f
> "stdout" =3D 1218368fb3aac4c208d7ebaf531ac1aec7e6f6a6ec38a6d43bd26406748b=
22c0
>
>                | HASH subkey
> 5b6cfea3efc218f4f998049c59398fc4e4f37b6bc687bf28c5fc2aa1b234bbb9
> "stdout" =3D 1b590c77d9dfe5682591a11b26db44a4ec48cab00e594f1afa8ceb7c1d19=
30c3
>
>                | HASH subkey
> 02a4a19c3371ddd8668456c195196ed193d26cf46d3b865e501641d171fc2699
> "stdout" =3D a388f248e081bb894bc2839c88e355947d135b158ea5f487dca7957a3fee=
180b
>
>                | HASH subkey
> deb8f7886451cf2aba0d536711ade072310b92b59677fda1cdafd30b23b35891
> "stdout" =3D 36cd81ab2a9578fc941df7ee2ec0728993495a8f6e9debfcbaafb6c7f3d3=
2843
>
>                | WARNING: exit code 2 from a shell command.
>
>
> Which is go exiting and erroring during the build, the log file is
> huge, and I haven't found the issue yet .. but I am working on it, so
> I wanted to send an update!

I've managed to get a new binary built. There is a non-deterministic
error in the build (with gnostic) that resulted from a bad hash and
tag expansion. One build shows a warning, the next doesn't.

With a bit of luck, I'll get it sorted out on Monday.

Bruce

>
> Bruce
>
> >
> > Bruce
> >
> > >
> > > Since it isn't a functional change or new features, I can definitely
> > > put it on kirkstone at the same time as master.
> > >
> > > Bruce
> > >
> > > > I'll also need to teach my generation script to make that mapping, =
as
> > > > it would otherwise be lost on upgrades, as all of those locations a=
re
> > > > discovered via the go infrastructure.
> > > >
> > > > One more question, as the non-linebroken relocation sites is super
> > > > hard to read diffs (which is why I reformatted it), I assume you ar=
e
> > > > mapping those github sites back to the googlesource location in the
> > > > relocation step, so that go finds it, and doesn't fetch ?
> > > >
> > > > Yes, I've replaced in there as well (using sed and checking with gr=
ep).
> > > > I have tested this change on both master and kikstone branches from=
 a cleanall.
> > > >
> > > > There is a k3s runtime issue in master (which predates this propose=
d change) which
> > > > we will look in the upcoming days.
> > > >
> > > > --
> > > > Diego Sueiro
> > > >
> > > >
> > > > >
> > > > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > > > > ---
> > > > >  recipes-containers/k3s/k3s_git.bb | 62 +++++++++++++++----------=
------
> > > > >  1 file changed, 31 insertions(+), 31 deletions(-)
> > > > >
> > > > > diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containe=
rs/k3s/k3s_git.bb
> > > > > index a20092c..4f109ad 100644
> > > > > --- a/recipes-containers/k3s/k3s_git.bb
> > > > > +++ b/recipes-containers/k3s/k3s_git.bb
> > > > > @@ -2238,79 +2238,79 @@ SRCREV_zap=3D"2908d3000567b86f0b7f1e99cc6=
bc5c9f30d43a0"
> > > > >  SRC_URI +=3D "git://github.com/uber-go/zap;name=3Dzap;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.uber.org/zap"
> > > > >
> > > > >  # golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
> > > > > -# [1] git ls-remote https://go.googlesource.com/crypto 5ea612d1e=
b830b38bc4e914e37f55311eb58adce
> > > > > +# [1] git ls-remote https://github.com/golang/crypto 5ea612d1eb8=
30b38bc4e914e37f55311eb58adce
> > > > >  SRCREV_crypto=3D"5ea612d1eb830b38bc4e914e37f55311eb58adce"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/go.googlesource.com/crypto"
> > > > > +SRC_URI +=3D "git://github.com/golang/crypto;name=3Dcrypto;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/golang/crypto"
> > > > >
> > > > >  # golang.org/x/exp v0.0.0-20210220032938-85be41e4509f
> > > > > -# [1] git ls-remote https://go.googlesource.com/exp 85be41e4509f=
417cbf99006a027aef75deb8afd1
> > > > > +# [1] git ls-remote https://github.com/golang/exp 85be41e4509f41=
7cbf99006a027aef75deb8afd1
> > > > >  SRCREV_exp=3D"85be41e4509f417cbf99006a027aef75deb8afd1"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/exp;name=3Dexp;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/exp"
> > > > > +SRC_URI +=3D "git://github.com/golang/exp;name=3Dexp;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/exp"
> > > > >
> > > > >  # golang.org/x/image v0.0.0-20190802002840-cff245a6509b
> > > > > -# [1] git ls-remote https://go.googlesource.com/image cff245a650=
9b8c4de022d0d5b9037c503c5989d6
> > > > > +# [1] git ls-remote https://github.com/golang/image cff245a6509b=
8c4de022d0d5b9037c503c5989d6
> > > > >  SRCREV_image=3D"cff245a6509b8c4de022d0d5b9037c503c5989d6"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/image;name=3Dimage;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/go.googlesource.com/image"
> > > > > +SRC_URI +=3D "git://github.com/golang/image;name=3Dimage;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/golang/image"
> > > > >
> > > > >  # golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
> > > > > -# [1] git ls-remote https://go.googlesource.com/lint 6edffad5e61=
60f5949cdefc81710b2706fbcd4f6
> > > > > +# [1] git ls-remote https://github.com/golang/lint 6edffad5e6160=
f5949cdefc81710b2706fbcd4f6
> > > > >  SRCREV_lint=3D"6edffad5e6160f5949cdefc81710b2706fbcd4f6"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/lint;name=3Dlint;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/go.googlesource.com/lint"
> > > > > +SRC_URI +=3D "git://github.com/golang/lint;name=3Dlint;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/lint"
> > > > >
> > > > >  # golang.org/x/mobile v0.0.0-20201217150744-e6ae53a27f4f
> > > > > -# [1] git ls-remote https://go.googlesource.com/mobile e6ae53a27=
f4fd7cfa2943f2ae47b96cba8eb01c9
> > > > > +# [1] git ls-remote https://github.com/golang/mobile e6ae53a27f4=
fd7cfa2943f2ae47b96cba8eb01c9
> > > > >  SRCREV_mobile=3D"e6ae53a27f4fd7cfa2943f2ae47b96cba8eb01c9"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/mobile;name=3Dmobile;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/go.googlesource.com/mobile"
> > > > > +SRC_URI +=3D "git://github.com/golang/mobile;name=3Dmobile;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/golang/mobile"
> > > > >
> > > > >  # golang.org/x/mod v0.5.1
> > > > > -# [1] git ls-remote https://go.googlesource.com/mod 49f84bccfd34=
69cb3095201f7855641bcc8eb49a
> > > > > +# [1] git ls-remote https://github.com/golang/mod 49f84bccfd3469=
cb3095201f7855641bcc8eb49a
> > > > >  SRCREV_mod=3D"49f84bccfd3469cb3095201f7855641bcc8eb49a"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/mod;name=3Dmod;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/mod"
> > > > > +SRC_URI +=3D "git://github.com/golang/mod;name=3Dmod;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/mod"
> > > > >
> > > > >  # golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4
> > > > > -# [1] git ls-remote https://go.googlesource.com/net a5a99cb37ef4=
b68617775ab669177656090ab396
> > > > > +# [1] git ls-remote https://github.com/golang/net a5a99cb37ef4b6=
8617775ab669177656090ab396
> > > > >  SRCREV_net=3D"a5a99cb37ef4b68617775ab669177656090ab396"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/net"
> > > > > +SRC_URI +=3D "git://github.com/golang/net;name=3Dnet;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/net"
> > > > >
> > > > >  # golang.org/x/oauth2 v0.0.0-20211104180415-d3ed0bb246c8
> > > > > -# [1] git ls-remote https://go.googlesource.com/oauth2 d3ed0bb24=
6c8d3c75b63937d9a5eecff9c74d7fe
> > > > > +# [1] git ls-remote https://github.com/golang/oauth2 d3ed0bb246c=
8d3c75b63937d9a5eecff9c74d7fe
> > > > >  SRCREV_oauth2=3D"d3ed0bb246c8d3c75b63937d9a5eecff9c74d7fe"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/oauth2;name=3Doauth2;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/go.googlesource.com/oauth2"
> > > > > +SRC_URI +=3D "git://github.com/golang/oauth2;name=3Doauth2;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/golang/oauth2"
> > > > >
> > > > >  # golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
> > > > > -# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83=
c0ddf193dd5a34e034151da389d09
> > > > > +# [1] git ls-remote https://github.com/golang/sync 036812b2e83c0=
ddf193dd5a34e034151da389d09
> > > > >  SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/go.googlesource.com/sync"
> > > > > +SRC_URI +=3D "git://github.com/golang/sync;name=3Dsync;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/sync"
> > > > >
> > > > >  # golang.org/x/sys v0.0.0-20210831042530-f4d43177bf5e
> > > > > -# [1] git ls-remote https://go.googlesource.com/sys f4d43177bf5e=
2ee98617956e417d0555d4b69c17
> > > > > +# [1] git ls-remote https://github.com/golang/sys f4d43177bf5e2e=
e98617956e417d0555d4b69c17
> > > > >  SRCREV_sys=3D"f4d43177bf5e2ee98617956e417d0555d4b69c17"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/sys"
> > > > > +SRC_URI +=3D "git://github.com/golang/sys;name=3Dsys;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/sys"
> > > > >
> > > > >  # golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d
> > > > > -# [1] git ls-remote https://go.googlesource.com/term 6a3ed077a48=
de71621ad530f9078fffa0bc0ce32
> > > > > +# [1] git ls-remote https://github.com/golang/term 6a3ed077a48de=
71621ad530f9078fffa0bc0ce32
> > > > >  SRCREV_term1=3D"6a3ed077a48de71621ad530f9078fffa0bc0ce32"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm1;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/go.googlesource.com/term"
> > > > > +SRC_URI +=3D "git://github.com/golang/term;name=3Dterm1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/term"
> > > > >
> > > > >  # golang.org/x/text v0.3.7
> > > > > -# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f=
3f883d229d707172ed356727aae99
> > > > > +# [1] git ls-remote https://github.com/golang/text 3cd4007149f3f=
883d229d707172ed356727aae99
> > > > >  SRCREV_text1=3D"3cd4007149f3f883d229d707172ed356727aae99"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext1;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/go.googlesource.com/text"
> > > > > +SRC_URI +=3D "git://github.com/golang/text;name=3Dtext1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/text"
> > > > >
> > > > >  # golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac
> > > > > -# [1] git ls-remote https://go.googlesource.com/time 1f47c861a9a=
c5a6e7645609f91b895398ff31642
> > > > > +# [1] git ls-remote https://github.com/golang/time 1f47c861a9ac5=
a6e7645609f91b895398ff31642
> > > > >  SRCREV_time=3D"1f47c861a9ac5a6e7645609f91b895398ff31642"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/time;name=3Dtime;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/go.googlesource.com/time"
> > > > > +SRC_URI +=3D "git://github.com/golang/time;name=3Dtime;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/time"
> > > > >
> > > > >  # golang.org/x/tools v0.1.8
> > > > > -# [1] git ls-remote https://go.googlesource.com/tools e212aff8fd=
146c44ddb0167c1dfbd5531d6c9213
> > > > > +# [1] git ls-remote https://github.com/golang/tools e212aff8fd14=
6c44ddb0167c1dfbd5531d6c9213
> > > > >  SRCREV_tools=3D"e212aff8fd146c44ddb0167c1dfbd5531d6c9213"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/go.googlesource.com/tools"
> > > > > +SRC_URI +=3D "git://github.com/golang/tools;name=3Dtools;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/golang/tools"
> > > > >
> > > > >  # golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
> > > > > -# [1] git ls-remote https://go.googlesource.com/xerrors 5ec99f83=
aff198f5fbd629d6c8d8eb38a04218ca
> > > > > +# [1] git ls-remote https://github.com/golang/xerrors 5ec99f83af=
f198f5fbd629d6c8d8eb38a04218ca
> > > > >  SRCREV_xerrors=3D"5ec99f83aff198f5fbd629d6c8d8eb38a04218ca"
> > > > > -SRC_URI +=3D "git://go.googlesource.com/xerrors;name=3Dxerrors;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/go.googlesource.com/xerrors"
> > > > > +SRC_URI +=3D "git://github.com/golang/xerrors;name=3Dxerrors;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/golang/xerrors"
> > > > >
> > > > >  # golang.zx2c4.com/go118/netip v0.0.0-20211111135330-a4a02eeacf9=
d
> > > > >  # [1] git ls-remote https://git.zx2c4.com/go118-netip a4a02eeacf=
9d49566df85e8cff878e5527e51779
> > > > > @@ -2633,7 +2633,7 @@ do_compile() {
> > > > >
> > > > >          cd ${S}/src/import
> > > > >
> > > > > -        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.=
org/bertimus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.co=
m/go:github.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:git=
hub.com/googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/d=
atastore:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.go=
ogle.com/go/firestore:github.com/googleapis/google-cloud-go/bigquery//fires=
tore cloud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigqu=
ery//pubsub cloud.google.com/go/storage:github.com/googleapis/google-cloud-=
go/bigquery//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/=
mtl github.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Sky=
lar/excelize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-f=
or-go github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/=
Azure/go-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest=
/autorest:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/=
go-autorest/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/a=
dal github.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest=
/autorest//autorest/date github.com/Azure/go-autorest/autorest/mocks:github=
.com/Azure/go-autorest/autorest//autorest/mocks github.com/Azure/go-autores=
t/autorest/to:github.com/Azure/go-autorest/autorest//autorest/to github.com=
/Azure/go-autorest/autorest/validation:github.com/Azure/go-autorest/autores=
t//autorest/validation github.com/Azure/go-autorest/logger:github.com/Azure=
/go-autorest/autorest//logger github.com/Azure/go-autorest/tracing:github.c=
om/Azure/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.co=
m/BurntSushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb githu=
b.com/GoogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform=
/k8s-cloud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win=
_pdh github.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.c=
om/Microsoft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hc=
sshim:github.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.co=
m/NYTimes/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash=
 github.com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/P=
uerkitoBio/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urle=
sc:github.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/=
retry github.com/agnivade/levenshtein:github.com/agnivade/levenshtein githu=
b.com/ajstarks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template=
:github.com/alecthomas/template github.com/alecthomas/units:github.com/alec=
thomas/units github.com/alexflint/go-filemutex:github.com/alexflint/go-file=
mutex github.com/andreyvit/diff:github.com/andreyvit/diff github.com/andyba=
lholm/cascadia:github.com/andybalholm/cascadia github.com/antihax/optional:=
github.com/antihax/optional github.com/armon/circbuf:github.com/armon/circb=
uf github.com/armon/consul-api:github.com/armon/consul-api github.com/armon=
/go-metrics:github.com/armon/go-metrics github.com/armon/go-radix:github.co=
m/armon/go-radix github.com/asaskevich/govalidator:github.com/asaskevich/go=
validator github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middle=
ware github.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjoh=
nson/clock:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/=
beorn7/perks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy gith=
ub.com/bits-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/=
bketelsen/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.c=
om/blang/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/br=
onze1man/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com=
/buger/jsonparser:github.com/buger/jsonparser github.com/canonical/go-dqlit=
e:github.com/canonical/go-dqlite github.com/census-instrumentation/opencens=
us-proto:github.com/census-instrumentation/opencensus-proto github.com/cert=
ifi/gocertifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github=
.com/cespare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/=
v2 github.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com=
/checkpoint-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 git=
hub.com/cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.c=
om/chzyer/logex github.com/chzyer/readline:github.com/chzyer/readline githu=
b.com/chzyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/=
cilium/ebpf github.com/cloudnativelabs/kube-router:github.com/cloudnativela=
bs/kube-router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker=
-go github.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroac=
hdb/datadriven:github.com/cockroachdb/datadriven github.com/cockroachdb/err=
ors:github.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com=
/cockroachdb/logtags github.com/container-storage-interface/spec:github.com=
/container-storage-interface/spec github.com/containerd/aufs:github.com/con=
tainerd/aufs github.com/containerd/btrfs:github.com/containerd/btrfs github=
.com/containerd/cgroups:github.com/containerd/cgroups github.com/containerd=
/console:github.com/containerd/console github.com/containerd/containerd:git=
hub.com/containerd/containerd github.com/containerd/continuity:github.com/c=
ontainerd/continuity github.com/containerd/fifo:github.com/containerd/fifo =
github.com/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse=
-overlayfs-snapshotter github.com/containerd/go-cni:github.com/containerd/g=
o-cni github.com/containerd/go-runc:github.com/containerd/go-runc github.co=
m/containerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/=
nri:github.com/containerd/nri github.com/containerd/stargz-snapshotter:gith=
ub.com/containerd/stargz-snapshotter github.com/containerd/stargz-snapshott=
er/estargz:github.com/containerd/stargz-snapshotter//estargz github.com/con=
tainerd/ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:git=
hub.com/containerd/typeurl github.com/containerd/zfs:github.com/containerd/=
zfs github.com/containernetworking/cni:github.com/containernetworking/cni g=
ithub.com/containernetworking/plugins:github.com/containernetworking/plugin=
s github.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/=
coredns/caddy:github.com/coredns/caddy github.com/coredns/corefile-migratio=
n:github.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/=
coreos/bbolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreo=
s/go-iptables:github.com/coreos/go-iptables github.com/coreos/go-oidc:githu=
b.com/coreos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semve=
r github.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/core=
os/go-systemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:gi=
thub.com/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go=
-md2man/v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/fi=
lepath-securejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp=
4:github.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4clien=
t github.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hard=
wareaddr:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.c=
om/danieljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew=
 github.com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext gi=
thub.com/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgri=
jalva/jwt-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.=
com/dgryski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13=
 github.com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:gi=
thub.com/docker/cli github.com/docker/distribution:github.com/docker/distri=
bution github.com/docker/docker:github.com/docker/docker github.com/docker/=
docker-credential-helpers:github.com/docker/docker-credential-helpers githu=
b.com/docker/go-connections:github.com/docker/go-connections github.com/doc=
ker/go-events:github.com/docker/go-events github.com/docker/go-metrics:gith=
ub.com/docker/go-metrics github.com/docker/go-units:github.com/docker/go-un=
its github.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dust=
in/go-humanize:github.com/dustin/go-humanize github.com/dustmop/soup:github=
.com/dustmop/soup github.com/eapache/channels:github.com/eapache/channels g=
ithub.com/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy=
:github.com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emick=
lei/go-restful github.com/envoyproxy/go-control-plane:github.com/envoyproxy=
/go-control-plane github.com/envoyproxy/protoc-gen-validate:github.com/envo=
yproxy/protoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdu=
bbelboer/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-pars=
er github.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/e=
xponent-io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-p=
romise:github.com/fanliao/go-promise github.com/fatih/camelcase:github.com/=
fatih/camelcase github.com/fatih/color:github.com/fatih/color github.com/fe=
lixge/httpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:=
github.com/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go=
-shlex github.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-o=
ss/jwt-go:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:git=
hub.com/frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify=
/fsnotify github.com/fvbommel/sortorder:github.com/fvbommel/sortorder githu=
b.com/getsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/ya=
ml:github.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/m=
go github.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github=
.com/go-errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:git=
hub.com/go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3=
.3/glfw//v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/g=
o-kit/kit:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log=
 github.com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr=
/logr:github.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/za=
pr github.com/go-openapi/analysis:github.com/go-openapi/analysis github.com=
/go-openapi/errors:github.com/go-openapi/errors github.com/go-openapi/jsonp=
ointer:github.com/go-openapi/jsonpointer github.com/go-openapi/jsonreferenc=
e:github.com/go-openapi/jsonreference github.com/go-openapi/loads:github.co=
m/go-openapi/loads github.com/go-openapi/runtime:github.com/go-openapi/runt=
ime github.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-ope=
napi/strfmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.=
com/go-openapi/swag github.com/go-openapi/validate:github.com/go-openapi/va=
lidate github.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validatio=
n github.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/=
go-stack/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:gith=
ub.com/go-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep g=
ithub.com/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:git=
hub.com/godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 git=
hub.com/gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com=
/gofrs/uuid github.com/gogo/googleapis:github.com/gogo/googleapis github.co=
m/gogo/protobuf:github.com/gogo/protobuf github.com/golang/freetype:github.=
com/golang/freetype github.com/golang/glog:github.com/golang/glog github.co=
m/golang/groupcache:github.com/golang/groupcache github.com/golang/mock:git=
hub.com/golang/mock github.com/golang/protobuf:github.com/golang/protobuf g=
ithub.com/golang/snappy:github.com/golang/snappy github.com/golangplus/byte=
s:github.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangpl=
us/fmt github.com/golangplus/testing:github.com/golangplus/testing github.c=
om/google/btree:github.com/google/btree github.com/google/cadvisor:github.c=
om/google/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github=
.com/google/go-containerregistry:github.com/google/go-containerregistry git=
hub.com/google/gofuzz:github.com/google/gofuzz github.com/google/martian:gi=
thub.com/google/martian github.com/google/martian/v3:github.com/google/mart=
ian/v3 github.com/google/pprof:github.com/google/pprof github.com/google/re=
nameio:github.com/google/renameio github.com/google/shlex:github.com/google=
/shlex github.com/google/uuid:github.com/google/uuid github.com/googleapis/=
gax-go/v2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic=
:github.com/googleapis/gnostic github.com/gophercloud/gophercloud:github.co=
m/gophercloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/=
gopherjs github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/w=
ebsocket:github.com/gorilla/websocket github.com/gregjones/httpcache:github=
.com/gregjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:githu=
b.com/grpc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-p=
rometheus:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecos=
ystem/grpc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen=
/go-fuse/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:gi=
thub.com/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.c=
om/hashicorp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashic=
orp/errwrap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-clean=
http github.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com=
/hashicorp/go-immutable-radix:github.com/hashicorp/go-immutable-radix githu=
b.com/hashicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashi=
corp/go-multierror:github.com/hashicorp/go-multierror github.com/hashicorp/=
go-retryablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp=
/go-rootcerts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-soc=
kaddr:github.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:githu=
b.com/hashicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp=
/go-uuid github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com=
/hashicorp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/=
hcl:github.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashi=
corp/logutils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.co=
m/hashicorp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp=
/serf:github.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/=
heketi github.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/t=
ail:github.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/huge=
lgupf/socketpair github.com/ianlancetaylor/demangle:github.com/ianlancetayl=
or/demangle github.com/imdario/mergo:github.com/imdario/mergo github.com/in=
conshreveable/mousetrap:github.com/inconshreveable/mousetrap github.com/ins=
omniacslk/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:gi=
thub.com/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arpin=
g github.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmes=
path/go-jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jme=
spath/internal/testify:github.com/jmespath/go-jmespath/internal/testify//in=
ternal/testify github.com/joho/godotenv:github.com/joho/godotenv github.com=
/jonboulle/clockwork:github.com/jonboulle/clockwork github.com/josharian/in=
tern:github.com/josharian/intern github.com/josharian/native:github.com/jos=
harian/native github.com/jpillora/backoff:github.com/jpillora/backoff githu=
b.com/jsimonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-=
iterator/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report=
:github.com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtold=
s/gls github.com/julienschmidt/httprouter:github.com/julienschmidt/httprout=
er github.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-son=
e/critbitgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:g=
ithub.com/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/k=
ine github.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/ki=
sielk/errcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github=
.com/kisielk/gotool github.com/klauspost/compress:github.com/klauspost/comp=
ress github.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konso=
rten/go-windows-terminal-sequences:github.com/konsorten/go-windows-terminal=
-sequences github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.co=
m/kr/logfmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:git=
hub.com/kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-=
sigs/cri-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/g=
odebug:github.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq gi=
thub.com/libopenstorage/openstorage:github.com/libopenstorage/openstorage g=
ithub.com/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithamm=
er/dedent:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lp=
abon/godbc github.com/magiconair/properties:github.com/magiconair/propertie=
s github.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go=
-colorable:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.=
com/mattn/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runew=
idth github.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.c=
om/mattn/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golan=
g_protobuf_extensions:github.com/matttproud/golang_protobuf_extensions gith=
ub.com/mdlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/e=
thtool:github.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com=
/mdlayher/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink=
 github.com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket=
:github.com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns githu=
b.com/miekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.=
com/mikioh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml=
 github.com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio=
-go/v7:github.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com=
/minio/sha256-simd github.com/minio/sio:github.com/minio/sio github.com/mis=
tifyio/go-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.c=
om/mitchellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-ho=
medir github.com/mitchellh/go-testing-interface:github.com/mitchellh/go-tes=
ting-interface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wor=
dwrap github.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchell=
h/iochan:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:gith=
ub.com/mitchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs git=
hub.com/moby/locker:github.com/moby/locker github.com/moby/spdystream:githu=
b.com/moby/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mou=
ntinfo//mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo=
//symlink github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:=
github.com/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go=
/concurrent github.com/modern-go/reflect2:github.com/modern-go/reflect2 git=
hub.com/mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/=
go-gitignore:github.com/monochromegane/go-gitignore github.com/morikuni/aec=
:github.com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fi=
leutils github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.co=
m/mvdan/xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github=
.com/mwitkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flow=
rate github.com/natefinch/lumberjack:github.com/natefinch/lumberjack github=
.com/niemeyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:githu=
b.com/nxadm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/ole=
kukonko/tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkg=
o:github.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega gith=
ub.com/opencontainers/go-digest:github.com/opencontainers/go-digest github.=
com/opencontainers/image-spec:github.com/opencontainers/image-spec github.c=
om/opencontainers/runc:github.com/opencontainers/runc github.com/opencontai=
ners/runtime-spec:github.com/opencontainers/runtime-spec github.com/opencon=
tainers/selinux:github.com/opencontainers/selinux github.com/opentracing/op=
entracing-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:gi=
thub.com/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.=
com/otiai10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com=
/otiai10/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe githu=
b.com/paulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.c=
om/pborman/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-=
buffruneio github.com/pelletier/go-toml:github.com/pelletier/go-toml github=
.com/peterbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz=
4:github.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github=
.com/pkg/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/=
pmezard/go-difflib github.com/posener/complete:github.com/posener/complete =
github.com/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/=
prometheus/client_golang:github.com/prometheus/client_golang github.com/pro=
metheus/client_model:github.com/prometheus/client_model github.com/promethe=
us/common:github.com/prometheus/common github.com/prometheus/procfs:github.=
com/prometheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb=
 github.com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api=
:github.com/quobyte/api github.com/rancher/dynamiclistener:github.com/ranch=
er/dynamiclistener github.com/rancher/lasso:github.com/rancher/lasso github=
.com/rancher/remotedialer:github.com/rancher/remotedialer github.com/ranche=
r/wharfie:github.com/rancher/wharfie github.com/rancher/wrangler:github.com=
/rancher/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudomphen=
g/bigfft github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rog=
peppe/fastuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal=
:github.com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit=
:github.com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs=
/xid github.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russros=
s/blackfriday:github.com/russross/blackfriday github.com/russross/blackfrid=
ay/v2:github.com/russross/blackfriday/v2 github.com/ryanuber/columnize:gith=
ub.com/ryanuber/columnize github.com/safchain/ethtool:github.com/safchain/e=
thtool github.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-=
/seed:github.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com=
/seccomp/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-dif=
f github.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_a=
nchor_name github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com=
/smartystreets/assertions:github.com/smartystreets/assertions github.com/sm=
artystreets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/=
cmux:github.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/w=
ater github.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/s=
pf13/afero:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/ca=
st github.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterwe=
atherman:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.c=
om/spf13/pflag github.com/spf13/viper:github.com/spf13/viper github.com/ste=
fanberger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoe=
wer/go-strcase:github.com/stoewer/go-strcase github.com/storageos/go-api:gi=
thub.com/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx=
 github.com/stretchr/testify:github.com/stretchr/testify github.com/subosit=
o/gotenv:github.com/subosito/gotenv github.com/syndtr/gocapability:github.c=
om/syndtr/gocapability github.com/tchap/go-patricia:github.com/tchap/go-pat=
ricia github.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/t=
encentcloud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty gith=
ub.com/tmc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.=
com/u-root/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/=
ugorji/go github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli=
/v2:github.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/ne=
groni github.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/ve=
ktah/gqlparser:github.com/vektah/gqlparser github.com/vishvananda/netlink:g=
ithub.com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishv=
ananda/netns github.com/vmware/govmomi:github.com/vmware/govmomi github.com=
/willf/bitset:github.com/willf/bitset github.com/xiang90/probing:github.com=
/xiang90/probing github.com/xlab/treeprint:github.com/xlab/treeprint github=
.com/xordataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin=
/goldmark:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etc=
d.io/etcd:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/=
etcd/client/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io=
/etcd/client/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/c=
lient/pkg/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pk=
g/v3//raft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etc=
d.io/etcd/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etc=
d/etcdutl/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/=
v3:github.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.or=
g/pkcs7 go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.op=
entelemetry.io/contrib go.opentelemetry.io/contrib/instrumentation/google.g=
olang.org/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google=
.golang.org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/h=
ttp/otelhttp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp=
 go.opentelemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel=
/exporters/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.i=
o/otel/metric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/ote=
ltest:go.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.op=
entelemetry.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.open=
telemetry.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go=
.opentelemetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opente=
lemetry.io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telem=
etry/opentelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/st=
arlark-go go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.=
org/goleak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.ube=
r.org/zap golang.org/x/crypto:go.googlesource.com/crypto golang.org/x/exp:g=
o.googlesource.com/exp golang.org/x/image:go.googlesource.com/image golang.=
org/x/lint:go.googlesource.com/lint golang.org/x/mobile:go.googlesource.com=
/mobile golang.org/x/mod:go.googlesource.com/mod golang.org/x/net:go.google=
source.com/net golang.org/x/oauth2:go.googlesource.com/oauth2 golang.org/x/=
sync:go.googlesource.com/sync golang.org/x/sys:go.googlesource.com/sys gola=
ng.org/x/term:go.googlesource.com/term golang.org/x/text:go.googlesource.co=
m/text golang.org/x/time:go.googlesource.com/time golang.org/x/tools:go.goo=
glesource.com/tools golang.org/x/xerrors:go.googlesource.com/xerrors golang=
.zx2c4.com/go118/netip:golang.zx2c4.com/go118/netip golang.zx2c4.com/wintun=
:golang.zx2c4.com/wintun golang.zx2c4.com/wireguard:golang.zx2c4.com/wiregu=
ard golang.zx2c4.com/wireguard/wgctrl:golang.zx2c4.com/wireguard/wgctrl gon=
um.org/v1/gonum:github.com/gonum/gonum gonum.org/v1/netlib:github.com/gonum=
/netlib gonum.org/v1/plot:github.com/gonum/plot google.golang.org/api:googl=
e.golang.org/api google.golang.org/appengine:google.golang.org/appengine go=
ogle.golang.org/genproto:google.golang.org/genproto google.golang.org/grpc:=
google.golang.org/grpc google.golang.org/grpc/cmd/protoc-gen-go-grpc:google=
.golang.org/grpc/cmd/protoc-gen-go-grpc google.golang.org/protobuf:google.g=
olang.org/protobuf gopkg.in/airbrake/gobrake.v2:gopkg.in/airbrake/gobrake.v=
2 gopkg.in/alecthomas/kingpin.v2:gopkg.in/alecthomas/kingpin.v2 gopkg.in/ch=
eck.v1:gopkg.in/check.v1 gopkg.in/cheggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 go=
pkg.in/errgo.v2:gopkg.in/errgo.v2 gopkg.in/fsnotify.v1:gopkg.in/fsnotify.v1=
 gopkg.in/gcfg.v1:gopkg.in/gcfg.v1 gopkg.in/gemnasium/logrus-airbrake-hook.=
v2:gopkg.in/gemnasium/logrus-airbrake-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.=
v0 gopkg.in/ini.v1:gopkg.in/ini.v1 gopkg.in/natefinch/lumberjack.v2:gopkg.i=
n/natefinch/lumberjack.v2 gopkg.in/resty.v1:gopkg.in/resty.v1 gopkg.in/squa=
re/go-jose.v2:gopkg.in/square/go-jose.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 =
gopkg.in/warnings.v0:gopkg.in/warnings.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2=
 gopkg.in/yaml.v3:gopkg.in/yaml.v3 gotest.tools:gotest.tools gotest.tools/v=
3:github.com/gotestyourself/gotest.tools/v3 honnef.co/go/tools:honnef.co/go=
/tools inet.af/tcpproxy:inet.af/tcpproxy k8s.io/api:github.com/k3s-io/kuber=
netes/staging/src/k8s.io/api//staging/src/k8s.io/api k8s.io/apiextensions-a=
piserver:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k=
8s.io/apiextensions-apiserver k8s.io/apimachinery:github.com/k3s-io/kuberne=
tes/staging/src/k8s.io/api//staging/src/k8s.io/apimachinery k8s.io/apiserve=
r:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/a=
piserver k8s.io/cli-runtime:github.com/k3s-io/kubernetes/staging/src/k8s.io=
/api//staging/src/k8s.io/cli-runtime k8s.io/client-go:github.com/k3s-io/kub=
ernetes/staging/src/k8s.io/api//staging/src/k8s.io/client-go k8s.io/cloud-p=
rovider:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8=
s.io/cloud-provider k8s.io/cluster-bootstrap:github.com/k3s-io/kubernetes/s=
taging/src/k8s.io/api//staging/src/k8s.io/cluster-bootstrap k8s.io/code-gen=
erator:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s=
.io/code-generator k8s.io/component-base:github.com/k3s-io/kubernetes/stagi=
ng/src/k8s.io/api//staging/src/k8s.io/component-base k8s.io/component-helpe=
rs:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/=
component-helpers k8s.io/controller-manager:github.com/k3s-io/kubernetes/st=
aging/src/k8s.io/api//staging/src/k8s.io/controller-manager k8s.io/cri-api:=
github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cri=
-api k8s.io/csi-translation-lib:github.com/k3s-io/kubernetes/staging/src/k8=
s.io/api//staging/src/k8s.io/csi-translation-lib k8s.io/kube-aggregator:git=
hub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-a=
ggregator k8s.io/kube-controller-manager:github.com/k3s-io/kubernetes/stagi=
ng/src/k8s.io/api//staging/src/k8s.io/kube-controller-manager k8s.io/kube-p=
roxy:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.i=
o/kube-proxy k8s.io/kube-scheduler:github.com/k3s-io/kubernetes/staging/src=
/k8s.io/api//staging/src/k8s.io/kube-scheduler k8s.io/kubectl:github.com/k3=
s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kubectl k8s.io/k=
ubelet:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s=
.io/kubelet k8s.io/kubernetes:github.com/k3s-io/kubernetes/staging/src/k8s.=
io/api k8s.io/legacy-cloud-providers:github.com/k3s-io/kubernetes/staging/s=
rc/k8s.io/api//staging/src/k8s.io/legacy-cloud-providers k8s.io/metrics:git=
hub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/metric=
s k8s.io/mount-utils:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//s=
taging/src/k8s.io/mount-utils k8s.io/pod-security-admission:github.com/k3s-=
io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/pod-security-admis=
sion k8s.io/sample-apiserver:github.com/k3s-io/kubernetes/staging/src/k8s.i=
o/api//staging/src/k8s.io/sample-apiserver k8s.io/gengo:k8s.io/gengo k8s.io=
/klog:k8s.io/klog k8s.io/klog/v2:github.com/k3s-io/klog/v2 k8s.io/kube-open=
api:k8s.io/kube-openapi k8s.io/system-validators:k8s.io/system-validators k=
8s.io/utils:k8s.io/utils modernc.org/cc:modernc.org/cc modernc.org/golex:mo=
dernc.org/golex modernc.org/mathutil:modernc.org/mathutil modernc.org/strut=
il:modernc.org/strutil modernc.org/xc:modernc.org/xc rsc.io/binaryregexp:rs=
c.io/binaryregexp rsc.io/pdf:rsc.io/pdf rsc.io/quote/v3:github.com/rsc/quot=
e/v3//v3 rsc.io/sampler:rsc.io/sampler sigs.k8s.io/apiserver-network-proxy/=
konnectivity-client:github.com/kubernetes-sigs/apiserver-network-proxy/konn=
ectivity-client//konnectivity-client sigs.k8s.io/cli-utils:sigs.k8s.io/cli-=
utils sigs.k8s.io/controller-runtime:sigs.k8s.io/controller-runtime sigs.k8=
s.io/kustomize/api:github.com/kubernetes-sigs/kustomize/api//api sigs.k8s.i=
o/kustomize/cmd/config:github.com/kubernetes-sigs/kustomize/api//cmd/config=
 sigs.k8s.io/kustomize/kustomize/v4:github.com/kubernetes-sigs/kustomize/ap=
i//kustomize sigs.k8s.io/kustomize/kyaml:github.com/kubernetes-sigs/kustomi=
ze/api//kyaml sigs.k8s.io/structured-merge-diff/v4:github.com/kubernetes-si=
gs/structured-merge-diff/v4 sigs.k8s.io/testing_frameworks:sigs.k8s.io/test=
ing_frameworks sigs.k8s.io/yaml:sigs.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.=
io/json"
> > > > > +        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.=
org/bertimus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.co=
m/go:github.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:git=
hub.com/googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/d=
atastore:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.go=
ogle.com/go/firestore:github.com/googleapis/google-cloud-go/bigquery//fires=
tore cloud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigqu=
ery//pubsub cloud.google.com/go/storage:github.com/googleapis/google-cloud-=
go/bigquery//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/=
mtl github.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Sky=
lar/excelize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-f=
or-go github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/=
Azure/go-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest=
/autorest:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/=
go-autorest/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/a=
dal github.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest=
/autorest//autorest/date github.com/Azure/go-autorest/autorest/mocks:github=
.com/Azure/go-autorest/autorest//autorest/mocks github.com/Azure/go-autores=
t/autorest/to:github.com/Azure/go-autorest/autorest//autorest/to github.com=
/Azure/go-autorest/autorest/validation:github.com/Azure/go-autorest/autores=
t//autorest/validation github.com/Azure/go-autorest/logger:github.com/Azure=
/go-autorest/autorest//logger github.com/Azure/go-autorest/tracing:github.c=
om/Azure/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.co=
m/BurntSushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb githu=
b.com/GoogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform=
/k8s-cloud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win=
_pdh github.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.c=
om/Microsoft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hc=
sshim:github.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.co=
m/NYTimes/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash=
 github.com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/P=
uerkitoBio/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urle=
sc:github.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/=
retry github.com/agnivade/levenshtein:github.com/agnivade/levenshtein githu=
b.com/ajstarks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template=
:github.com/alecthomas/template github.com/alecthomas/units:github.com/alec=
thomas/units github.com/alexflint/go-filemutex:github.com/alexflint/go-file=
mutex github.com/andreyvit/diff:github.com/andreyvit/diff github.com/andyba=
lholm/cascadia:github.com/andybalholm/cascadia github.com/antihax/optional:=
github.com/antihax/optional github.com/armon/circbuf:github.com/armon/circb=
uf github.com/armon/consul-api:github.com/armon/consul-api github.com/armon=
/go-metrics:github.com/armon/go-metrics github.com/armon/go-radix:github.co=
m/armon/go-radix github.com/asaskevich/govalidator:github.com/asaskevich/go=
validator github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middle=
ware github.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjoh=
nson/clock:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/=
beorn7/perks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy gith=
ub.com/bits-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/=
bketelsen/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.c=
om/blang/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/br=
onze1man/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com=
/buger/jsonparser:github.com/buger/jsonparser github.com/canonical/go-dqlit=
e:github.com/canonical/go-dqlite github.com/census-instrumentation/opencens=
us-proto:github.com/census-instrumentation/opencensus-proto github.com/cert=
ifi/gocertifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github=
.com/cespare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/=
v2 github.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com=
/checkpoint-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 git=
hub.com/cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.c=
om/chzyer/logex github.com/chzyer/readline:github.com/chzyer/readline githu=
b.com/chzyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/=
cilium/ebpf github.com/cloudnativelabs/kube-router:github.com/cloudnativela=
bs/kube-router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker=
-go github.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroac=
hdb/datadriven:github.com/cockroachdb/datadriven github.com/cockroachdb/err=
ors:github.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com=
/cockroachdb/logtags github.com/container-storage-interface/spec:github.com=
/container-storage-interface/spec github.com/containerd/aufs:github.com/con=
tainerd/aufs github.com/containerd/btrfs:github.com/containerd/btrfs github=
.com/containerd/cgroups:github.com/containerd/cgroups github.com/containerd=
/console:github.com/containerd/console github.com/containerd/containerd:git=
hub.com/containerd/containerd github.com/containerd/continuity:github.com/c=
ontainerd/continuity github.com/containerd/fifo:github.com/containerd/fifo =
github.com/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse=
-overlayfs-snapshotter github.com/containerd/go-cni:github.com/containerd/g=
o-cni github.com/containerd/go-runc:github.com/containerd/go-runc github.co=
m/containerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/=
nri:github.com/containerd/nri github.com/containerd/stargz-snapshotter:gith=
ub.com/containerd/stargz-snapshotter github.com/containerd/stargz-snapshott=
er/estargz:github.com/containerd/stargz-snapshotter//estargz github.com/con=
tainerd/ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:git=
hub.com/containerd/typeurl github.com/containerd/zfs:github.com/containerd/=
zfs github.com/containernetworking/cni:github.com/containernetworking/cni g=
ithub.com/containernetworking/plugins:github.com/containernetworking/plugin=
s github.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/=
coredns/caddy:github.com/coredns/caddy github.com/coredns/corefile-migratio=
n:github.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/=
coreos/bbolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreo=
s/go-iptables:github.com/coreos/go-iptables github.com/coreos/go-oidc:githu=
b.com/coreos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semve=
r github.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/core=
os/go-systemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:gi=
thub.com/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go=
-md2man/v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/fi=
lepath-securejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp=
4:github.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4clien=
t github.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hard=
wareaddr:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.c=
om/danieljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew=
 github.com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext gi=
thub.com/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgri=
jalva/jwt-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.=
com/dgryski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13=
 github.com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:gi=
thub.com/docker/cli github.com/docker/distribution:github.com/docker/distri=
bution github.com/docker/docker:github.com/docker/docker github.com/docker/=
docker-credential-helpers:github.com/docker/docker-credential-helpers githu=
b.com/docker/go-connections:github.com/docker/go-connections github.com/doc=
ker/go-events:github.com/docker/go-events github.com/docker/go-metrics:gith=
ub.com/docker/go-metrics github.com/docker/go-units:github.com/docker/go-un=
its github.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dust=
in/go-humanize:github.com/dustin/go-humanize github.com/dustmop/soup:github=
.com/dustmop/soup github.com/eapache/channels:github.com/eapache/channels g=
ithub.com/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy=
:github.com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emick=
lei/go-restful github.com/envoyproxy/go-control-plane:github.com/envoyproxy=
/go-control-plane github.com/envoyproxy/protoc-gen-validate:github.com/envo=
yproxy/protoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdu=
bbelboer/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-pars=
er github.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/e=
xponent-io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-p=
romise:github.com/fanliao/go-promise github.com/fatih/camelcase:github.com/=
fatih/camelcase github.com/fatih/color:github.com/fatih/color github.com/fe=
lixge/httpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:=
github.com/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go=
-shlex github.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-o=
ss/jwt-go:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:git=
hub.com/frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify=
/fsnotify github.com/fvbommel/sortorder:github.com/fvbommel/sortorder githu=
b.com/getsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/ya=
ml:github.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/m=
go github.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github=
.com/go-errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:git=
hub.com/go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3=
.3/glfw//v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/g=
o-kit/kit:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log=
 github.com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr=
/logr:github.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/za=
pr github.com/go-openapi/analysis:github.com/go-openapi/analysis github.com=
/go-openapi/errors:github.com/go-openapi/errors github.com/go-openapi/jsonp=
ointer:github.com/go-openapi/jsonpointer github.com/go-openapi/jsonreferenc=
e:github.com/go-openapi/jsonreference github.com/go-openapi/loads:github.co=
m/go-openapi/loads github.com/go-openapi/runtime:github.com/go-openapi/runt=
ime github.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-ope=
napi/strfmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.=
com/go-openapi/swag github.com/go-openapi/validate:github.com/go-openapi/va=
lidate github.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validatio=
n github.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/=
go-stack/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:gith=
ub.com/go-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep g=
ithub.com/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:git=
hub.com/godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 git=
hub.com/gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com=
/gofrs/uuid github.com/gogo/googleapis:github.com/gogo/googleapis github.co=
m/gogo/protobuf:github.com/gogo/protobuf github.com/golang/freetype:github.=
com/golang/freetype github.com/golang/glog:github.com/golang/glog github.co=
m/golang/groupcache:github.com/golang/groupcache github.com/golang/mock:git=
hub.com/golang/mock github.com/golang/protobuf:github.com/golang/protobuf g=
ithub.com/golang/snappy:github.com/golang/snappy github.com/golangplus/byte=
s:github.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangpl=
us/fmt github.com/golangplus/testing:github.com/golangplus/testing github.c=
om/google/btree:github.com/google/btree github.com/google/cadvisor:github.c=
om/google/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github=
.com/google/go-containerregistry:github.com/google/go-containerregistry git=
hub.com/google/gofuzz:github.com/google/gofuzz github.com/google/martian:gi=
thub.com/google/martian github.com/google/martian/v3:github.com/google/mart=
ian/v3 github.com/google/pprof:github.com/google/pprof github.com/google/re=
nameio:github.com/google/renameio github.com/google/shlex:github.com/google=
/shlex github.com/google/uuid:github.com/google/uuid github.com/googleapis/=
gax-go/v2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic=
:github.com/googleapis/gnostic github.com/gophercloud/gophercloud:github.co=
m/gophercloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/=
gopherjs github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/w=
ebsocket:github.com/gorilla/websocket github.com/gregjones/httpcache:github=
.com/gregjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:githu=
b.com/grpc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-p=
rometheus:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecos=
ystem/grpc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen=
/go-fuse/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:gi=
thub.com/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.c=
om/hashicorp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashic=
orp/errwrap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-clean=
http github.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com=
/hashicorp/go-immutable-radix:github.com/hashicorp/go-immutable-radix githu=
b.com/hashicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashi=
corp/go-multierror:github.com/hashicorp/go-multierror github.com/hashicorp/=
go-retryablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp=
/go-rootcerts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-soc=
kaddr:github.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:githu=
b.com/hashicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp=
/go-uuid github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com=
/hashicorp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/=
hcl:github.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashi=
corp/logutils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.co=
m/hashicorp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp=
/serf:github.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/=
heketi github.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/t=
ail:github.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/huge=
lgupf/socketpair github.com/ianlancetaylor/demangle:github.com/ianlancetayl=
or/demangle github.com/imdario/mergo:github.com/imdario/mergo github.com/in=
conshreveable/mousetrap:github.com/inconshreveable/mousetrap github.com/ins=
omniacslk/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:gi=
thub.com/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arpin=
g github.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmes=
path/go-jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jme=
spath/internal/testify:github.com/jmespath/go-jmespath/internal/testify//in=
ternal/testify github.com/joho/godotenv:github.com/joho/godotenv github.com=
/jonboulle/clockwork:github.com/jonboulle/clockwork github.com/josharian/in=
tern:github.com/josharian/intern github.com/josharian/native:github.com/jos=
harian/native github.com/jpillora/backoff:github.com/jpillora/backoff githu=
b.com/jsimonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-=
iterator/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report=
:github.com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtold=
s/gls github.com/julienschmidt/httprouter:github.com/julienschmidt/httprout=
er github.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-son=
e/critbitgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:g=
ithub.com/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/k=
ine github.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/ki=
sielk/errcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github=
.com/kisielk/gotool github.com/klauspost/compress:github.com/klauspost/comp=
ress github.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konso=
rten/go-windows-terminal-sequences:github.com/konsorten/go-windows-terminal=
-sequences github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.co=
m/kr/logfmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:git=
hub.com/kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-=
sigs/cri-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/g=
odebug:github.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq gi=
thub.com/libopenstorage/openstorage:github.com/libopenstorage/openstorage g=
ithub.com/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithamm=
er/dedent:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lp=
abon/godbc github.com/magiconair/properties:github.com/magiconair/propertie=
s github.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go=
-colorable:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.=
com/mattn/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runew=
idth github.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.c=
om/mattn/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golan=
g_protobuf_extensions:github.com/matttproud/golang_protobuf_extensions gith=
ub.com/mdlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/e=
thtool:github.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com=
/mdlayher/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink=
 github.com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket=
:github.com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns githu=
b.com/miekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.=
com/mikioh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml=
 github.com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio=
-go/v7:github.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com=
/minio/sha256-simd github.com/minio/sio:github.com/minio/sio github.com/mis=
tifyio/go-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.c=
om/mitchellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-ho=
medir github.com/mitchellh/go-testing-interface:github.com/mitchellh/go-tes=
ting-interface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wor=
dwrap github.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchell=
h/iochan:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:gith=
ub.com/mitchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs git=
hub.com/moby/locker:github.com/moby/locker github.com/moby/spdystream:githu=
b.com/moby/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mou=
ntinfo//mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo=
//symlink github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:=
github.com/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go=
/concurrent github.com/modern-go/reflect2:github.com/modern-go/reflect2 git=
hub.com/mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/=
go-gitignore:github.com/monochromegane/go-gitignore github.com/morikuni/aec=
:github.com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fi=
leutils github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.co=
m/mvdan/xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github=
.com/mwitkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flow=
rate github.com/natefinch/lumberjack:github.com/natefinch/lumberjack github=
.com/niemeyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:githu=
b.com/nxadm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/ole=
kukonko/tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkg=
o:github.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega gith=
ub.com/opencontainers/go-digest:github.com/opencontainers/go-digest github.=
com/opencontainers/image-spec:github.com/opencontainers/image-spec github.c=
om/opencontainers/runc:github.com/opencontainers/runc github.com/opencontai=
ners/runtime-spec:github.com/opencontainers/runtime-spec github.com/opencon=
tainers/selinux:github.com/opencontainers/selinux github.com/opentracing/op=
entracing-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:gi=
thub.com/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.=
com/otiai10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com=
/otiai10/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe githu=
b.com/paulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.c=
om/pborman/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-=
buffruneio github.com/pelletier/go-toml:github.com/pelletier/go-toml github=
.com/peterbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz=
4:github.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github=
.com/pkg/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/=
pmezard/go-difflib github.com/posener/complete:github.com/posener/complete =
github.com/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/=
prometheus/client_golang:github.com/prometheus/client_golang github.com/pro=
metheus/client_model:github.com/prometheus/client_model github.com/promethe=
us/common:github.com/prometheus/common github.com/prometheus/procfs:github.=
com/prometheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb=
 github.com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api=
:github.com/quobyte/api github.com/rancher/dynamiclistener:github.com/ranch=
er/dynamiclistener github.com/rancher/lasso:github.com/rancher/lasso github=
.com/rancher/remotedialer:github.com/rancher/remotedialer github.com/ranche=
r/wharfie:github.com/rancher/wharfie github.com/rancher/wrangler:github.com=
/rancher/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudomphen=
g/bigfft github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rog=
peppe/fastuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal=
:github.com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit=
:github.com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs=
/xid github.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russros=
s/blackfriday:github.com/russross/blackfriday github.com/russross/blackfrid=
ay/v2:github.com/russross/blackfriday/v2 github.com/ryanuber/columnize:gith=
ub.com/ryanuber/columnize github.com/safchain/ethtool:github.com/safchain/e=
thtool github.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-=
/seed:github.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com=
/seccomp/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-dif=
f github.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_a=
nchor_name github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com=
/smartystreets/assertions:github.com/smartystreets/assertions github.com/sm=
artystreets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/=
cmux:github.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/w=
ater github.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/s=
pf13/afero:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/ca=
st github.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterwe=
atherman:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.c=
om/spf13/pflag github.com/spf13/viper:github.com/spf13/viper github.com/ste=
fanberger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoe=
wer/go-strcase:github.com/stoewer/go-strcase github.com/storageos/go-api:gi=
thub.com/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx=
 github.com/stretchr/testify:github.com/stretchr/testify github.com/subosit=
o/gotenv:github.com/subosito/gotenv github.com/syndtr/gocapability:github.c=
om/syndtr/gocapability github.com/tchap/go-patricia:github.com/tchap/go-pat=
ricia github.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/t=
encentcloud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty gith=
ub.com/tmc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.=
com/u-root/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/=
ugorji/go github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli=
/v2:github.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/ne=
groni github.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/ve=
ktah/gqlparser:github.com/vektah/gqlparser github.com/vishvananda/netlink:g=
ithub.com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishv=
ananda/netns github.com/vmware/govmomi:github.com/vmware/govmomi github.com=
/willf/bitset:github.com/willf/bitset github.com/xiang90/probing:github.com=
/xiang90/probing github.com/xlab/treeprint:github.com/xlab/treeprint github=
.com/xordataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin=
/goldmark:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etc=
d.io/etcd:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/=
etcd/client/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io=
/etcd/client/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/c=
lient/pkg/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pk=
g/v3//raft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etc=
d.io/etcd/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etc=
d/etcdutl/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/=
v3:github.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.or=
g/pkcs7 go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.op=
entelemetry.io/contrib go.opentelemetry.io/contrib/instrumentation/google.g=
olang.org/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google=
.golang.org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/h=
ttp/otelhttp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp=
 go.opentelemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel=
/exporters/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.i=
o/otel/metric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/ote=
ltest:go.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.op=
entelemetry.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.open=
telemetry.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go=
.opentelemetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opente=
lemetry.io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telem=
etry/opentelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/st=
arlark-go go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.=
org/goleak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.ube=
r.org/zap golang.org/x/crypto:github.com/golang/crypto golang.org/x/exp:git=
hub.com/golang/exp golang.org/x/image:github.com/golang/image golang.org/x/=
lint:github.com/golang/lint golang.org/x/mobile:github.com/golang/mobile go=
lang.org/x/mod:github.com/golang/mod golang.org/x/net:github.com/golang/net=
 golang.org/x/oauth2:github.com/golang/oauth2 golang.org/x/sync:github.com/=
golang/sync golang.org/x/sys:github.com/golang/sys golang.org/x/term:github=
.com/golang/term golang.org/x/text:github.com/golang/text golang.org/x/time=
:github.com/golang/time golang.org/x/tools:github.com/golang/tools golang.o=
rg/x/xerrors:github.com/golang/xerrors golang.zx2c4.com/go118/netip:golang.=
zx2c4.com/go118/netip golang.zx2c4.com/wintun:golang.zx2c4.com/wintun golan=
g.zx2c4.com/wireguard:golang.zx2c4.com/wireguard golang.zx2c4.com/wireguard=
/wgctrl:golang.zx2c4.com/wireguard/wgctrl gonum.org/v1/gonum:github.com/gon=
um/gonum gonum.org/v1/netlib:github.com/gonum/netlib gonum.org/v1/plot:gith=
ub.com/gonum/plot google.golang.org/api:google.golang.org/api google.golang=
.org/appengine:google.golang.org/appengine google.golang.org/genproto:googl=
e.golang.org/genproto google.golang.org/grpc:google.golang.org/grpc google.=
golang.org/grpc/cmd/protoc-gen-go-grpc:google.golang.org/grpc/cmd/protoc-ge=
n-go-grpc google.golang.org/protobuf:google.golang.org/protobuf gopkg.in/ai=
rbrake/gobrake.v2:gopkg.in/airbrake/gobrake.v2 gopkg.in/alecthomas/kingpin.=
v2:gopkg.in/alecthomas/kingpin.v2 gopkg.in/check.v1:gopkg.in/check.v1 gopkg=
.in/cheggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.in/errgo.v2:gopkg.in/errgo=
.v2 gopkg.in/fsnotify.v1:gopkg.in/fsnotify.v1 gopkg.in/gcfg.v1:gopkg.in/gcf=
g.v1 gopkg.in/gemnasium/logrus-airbrake-hook.v2:gopkg.in/gemnasium/logrus-a=
irbrake-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 gopkg.in/ini.v1:gopkg.in/in=
i.v1 gopkg.in/natefinch/lumberjack.v2:gopkg.in/natefinch/lumberjack.v2 gopk=
g.in/resty.v1:gopkg.in/resty.v1 gopkg.in/square/go-jose.v2:gopkg.in/square/=
go-jose.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopkg.in/warnings.v0:gopkg.in/=
warnings.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gopkg.in/yaml.v3:gopkg.in/yam=
l.v3 gotest.tools:gotest.tools gotest.tools/v3:github.com/gotestyourself/go=
test.tools/v3 honnef.co/go/tools:honnef.co/go/tools inet.af/tcpproxy:inet.a=
f/tcpproxy k8s.io/api:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//=
staging/src/k8s.io/api k8s.io/apiextensions-apiserver:github.com/k3s-io/kub=
ernetes/staging/src/k8s.io/api//staging/src/k8s.io/apiextensions-apiserver =
k8s.io/apimachinery:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//st=
aging/src/k8s.io/apimachinery k8s.io/apiserver:github.com/k3s-io/kubernetes=
/staging/src/k8s.io/api//staging/src/k8s.io/apiserver k8s.io/cli-runtime:gi=
thub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cli-r=
untime k8s.io/client-go:github.com/k3s-io/kubernetes/staging/src/k8s.io/api=
//staging/src/k8s.io/client-go k8s.io/cloud-provider:github.com/k3s-io/kube=
rnetes/staging/src/k8s.io/api//staging/src/k8s.io/cloud-provider k8s.io/clu=
ster-bootstrap:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging=
/src/k8s.io/cluster-bootstrap k8s.io/code-generator:github.com/k3s-io/kuber=
netes/staging/src/k8s.io/api//staging/src/k8s.io/code-generator k8s.io/comp=
onent-base:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src=
/k8s.io/component-base k8s.io/component-helpers:github.com/k3s-io/kubernete=
s/staging/src/k8s.io/api//staging/src/k8s.io/component-helpers k8s.io/contr=
oller-manager:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/=
src/k8s.io/controller-manager k8s.io/cri-api:github.com/k3s-io/kubernetes/s=
taging/src/k8s.io/api//staging/src/k8s.io/cri-api k8s.io/csi-translation-li=
b:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/c=
si-translation-lib k8s.io/kube-aggregator:github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/api//staging/src/k8s.io/kube-aggregator k8s.io/kube-controll=
er-manager:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src=
/k8s.io/kube-controller-manager k8s.io/kube-proxy:github.com/k3s-io/kuberne=
tes/staging/src/k8s.io/api//staging/src/k8s.io/kube-proxy k8s.io/kube-sched=
uler:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.i=
o/kube-scheduler k8s.io/kubectl:github.com/k3s-io/kubernetes/staging/src/k8=
s.io/api//staging/src/k8s.io/kubectl k8s.io/kubelet:github.com/k3s-io/kuber=
netes/staging/src/k8s.io/api//staging/src/k8s.io/kubelet k8s.io/kubernetes:=
github.com/k3s-io/kubernetes/staging/src/k8s.io/api k8s.io/legacy-cloud-pro=
viders:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s=
.io/legacy-cloud-providers k8s.io/metrics:github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/api//staging/src/k8s.io/metrics k8s.io/mount-utils:github.co=
m/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/mount-utils =
k8s.io/pod-security-admission:github.com/k3s-io/kubernetes/staging/src/k8s.=
io/api//staging/src/k8s.io/pod-security-admission k8s.io/sample-apiserver:g=
ithub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/samp=
le-apiserver k8s.io/gengo:k8s.io/gengo k8s.io/klog:k8s.io/klog k8s.io/klog/=
v2:github.com/k3s-io/klog/v2 k8s.io/kube-openapi:k8s.io/kube-openapi k8s.io=
/system-validators:k8s.io/system-validators k8s.io/utils:k8s.io/utils moder=
nc.org/cc:modernc.org/cc modernc.org/golex:modernc.org/golex modernc.org/ma=
thutil:modernc.org/mathutil modernc.org/strutil:modernc.org/strutil modernc=
.org/xc:modernc.org/xc rsc.io/binaryregexp:rsc.io/binaryregexp rsc.io/pdf:r=
sc.io/pdf rsc.io/quote/v3:github.com/rsc/quote/v3//v3 rsc.io/sampler:rsc.io=
/sampler sigs.k8s.io/apiserver-network-proxy/konnectivity-client:github.com=
/kubernetes-sigs/apiserver-network-proxy/konnectivity-client//konnectivity-=
client sigs.k8s.io/cli-utils:sigs.k8s.io/cli-utils sigs.k8s.io/controller-r=
untime:sigs.k8s.io/controller-runtime sigs.k8s.io/kustomize/api:github.com/=
kubernetes-sigs/kustomize/api//api sigs.k8s.io/kustomize/cmd/config:github.=
com/kubernetes-sigs/kustomize/api//cmd/config sigs.k8s.io/kustomize/kustomi=
ze/v4:github.com/kubernetes-sigs/kustomize/api//kustomize sigs.k8s.io/kusto=
mize/kyaml:github.com/kubernetes-sigs/kustomize/api//kyaml sigs.k8s.io/stru=
ctured-merge-diff/v4:github.com/kubernetes-sigs/structured-merge-diff/v4 si=
gs.k8s.io/testing_frameworks:sigs.k8s.io/testing_frameworks sigs.k8s.io/yam=
l:sigs.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.io/json"
> > > > >          for s in $sites; do
> > > > >              site_dest=3D$(echo $s | cut -d: -f1)
> > > > >              site_source=3D$(echo $s | cut -d: -f2)
> > > > > --
> > > > > 2.35.1
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
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
> View/Reply Online (#7386): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7386
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

