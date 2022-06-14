Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70648C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 19:49:56 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.1486.1655236193642002817
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 12:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WnguFPKk;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id z14so4593867pjb.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jtcNy2XHJL1YL/ah5/s2ntNtb5ROTsne0M8Bzdp4YTk=;
        b=WnguFPKkFJrDu/avwQu+19JgCtHKQLv2sw9xTlR33MXYA1k8vOe8ldKZ6Tx4RXdMle
         RW8bc6+l0fgXP60jFrP0g/3g90Q1o6xAEPwX3bOvFGD47kDi+1BIWLzZ6ceQu6fodfMR
         8IlMORSeOALsh6CO9qyuoMzfoavTfYP0v5+HxHmia6VTLI9RndMKwkOkiUJleJikdNGu
         a802WU/6fVX49F0ar2bkCyPYoe6wbX5aNuYj0U2PlVJbSKVxNoeSnh2Vb5m2+bM31Zwt
         ARSpo9Mxd7yK6vuJaCAa8QdsmQGZ27h+ysIttwc/q/3DAdK/HbnYhJlBPcF7/aG5IN7X
         06Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jtcNy2XHJL1YL/ah5/s2ntNtb5ROTsne0M8Bzdp4YTk=;
        b=ofWXvCO/9H5PHqEvOrHIpD8esGXgOAZKxnJphsrYN2xmnzo5OR56Y5JBub1SxCK2Zc
         SGFbqcNtOUXEGoYjXS0ksS4J5Xa5QaOA97E3SQrTDthIpyTmeVd1jc413Wv0GJuXLc8o
         v9lPIBt/y/FCQbbF6LoR7HjyexBjWXI0vV7nhFGe7BNR3oGcy02tIouKzRYW11Azj0VL
         pi9JSm3ajPi56SsI+mcM3KTQNer8Iwn7i4K05HSB8ICoG72KjWN4A0MqyL9IddbgfCbi
         XvKekpKyEl57jgldbUpMmwReCdvy7CSi8e8U9XvoVUKNRd8ayVyNnmDlBU+9cCDdnEvy
         +edg==
X-Gm-Message-State: AJIora+K+XXFJhmyOp8tN0afARD1bSXDDXuz35IAcswaRXWFgtTK74Jl
	3TDNNZc8nEuUkz0aM0Td9HseWRxvwuz7jUfxi6fss1+46dI=
X-Google-Smtp-Source: 
 AGRyM1s2Hl8zzPmcMKwEsOYm6I9+UI0OmbhP+liOm2z9bXb8/+S33x///TNojre80HGl0yLL80+3y8Aj+qoDDSfr7m8=
X-Received: by 2002:a17:90b:3ec3:b0:1e8:844f:6d43 with SMTP id
 rm3-20020a17090b3ec300b001e8844f6d43mr6234973pjb.112.1655236192741; Tue, 14
 Jun 2022 12:49:52 -0700 (PDT)
MIME-Version: 1.0
References: 
 <956614aeb05d3f6377da58e713309ca12e2fffe9.1654704740.git.diego.sueiro@arm.com>
 <CADkTA4OSvLY2XXxBJepn=MPEXjFzWBjyHX85SrEvV6kZk+d7ug@mail.gmail.com>
 <AM6PR08MB346165205ECFDCB2835D14FE92A79@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <16F74403FED38BBB.29749@lists.yoctoproject.org>
In-Reply-To: <16F74403FED38BBB.29749@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Jun 2022 15:49:40 -0400
Message-ID: 
 <CADkTA4NeRXJy+dzyayb=0oYr0+V1bdoaVQ_HvONJRgAPLhsweg@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Jun 2022 19:49:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7383

On Fri, Jun 10, 2022 at 9:02 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Thu, Jun 9, 2022 at 3:46 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
> >
> > Hi Bruce,
> >
> > ________________________________
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: 08 June 2022 17:47
> > To: Diego Sueiro <Diego.Sueiro@arm.com>
> > Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lis=
ts.yoctoproject.org>; nd <nd@arm.com>
> > Subject: Re: [meta-virtualization][PATCH] k3s: Fetch dependencies from =
github instead of googlesource to avoid rate-limit
> >
> > On Wed, Jun 8, 2022 at 12:21 PM Diego Sueiro <diego.sueiro@arm.com> wro=
te:
> > >
> > > All repositories under https://go.googlesource.com/ have a mirror in
> > > https://github.com.
> > >
> > > Fetching the dependencies from github is much faster and we avoid tim=
eouts due
> > > to googlesource rate-limit.
> > >
> > > Reference: https://github.com/golang/go/issues/12933
> >
> > I've been working on updating k3s to the same format as nerdctl (with
> > .inc files and better formatted dependencies), so let me finish that
> > update, and then we can get this applied.
> >
> >
> > Thanks. Do you have an ETA for it? Also, is it possible to have the sam=
e
> > on kirkstone branch as well?
> >
>
> I'm working through the change now. I expect to have everything done
> by next week.

FYI: I ran into some build/integration issues with the remapped
sources during my testing.

I'm working through the issues, but do expect to get it sorted in the
next day or so.

Bruce

>
> Since it isn't a functional change or new features, I can definitely
> put it on kirkstone at the same time as master.
>
> Bruce
>
> > I'll also need to teach my generation script to make that mapping, as
> > it would otherwise be lost on upgrades, as all of those locations are
> > discovered via the go infrastructure.
> >
> > One more question, as the non-linebroken relocation sites is super
> > hard to read diffs (which is why I reformatted it), I assume you are
> > mapping those github sites back to the googlesource location in the
> > relocation step, so that go finds it, and doesn't fetch ?
> >
> > Yes, I've replaced in there as well (using sed and checking with grep).
> > I have tested this change on both master and kikstone branches from a c=
leanall.
> >
> > There is a k3s runtime issue in master (which predates this proposed ch=
ange) which
> > we will look in the upcoming days.
> >
> > --
> > Diego Sueiro
> >
> >
> > >
> > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > > ---
> > >  recipes-containers/k3s/k3s_git.bb | 62 +++++++++++++++--------------=
--
> > >  1 file changed, 31 insertions(+), 31 deletions(-)
> > >
> > > diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k=
3s/k3s_git.bb
> > > index a20092c..4f109ad 100644
> > > --- a/recipes-containers/k3s/k3s_git.bb
> > > +++ b/recipes-containers/k3s/k3s_git.bb
> > > @@ -2238,79 +2238,79 @@ SRCREV_zap=3D"2908d3000567b86f0b7f1e99cc6bc5c=
9f30d43a0"
> > >  SRC_URI +=3D "git://github.com/uber-go/zap;name=3Dzap;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.ub=
er.org/zap"
> > >
> > >  # golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
> > > -# [1] git ls-remote https://go.googlesource.com/crypto 5ea612d1eb830=
b38bc4e914e37f55311eb58adce
> > > +# [1] git ls-remote https://github.com/golang/crypto 5ea612d1eb830b3=
8bc4e914e37f55311eb58adce
> > >  SRCREV_crypto=3D"5ea612d1eb830b38bc4e914e37f55311eb58adce"
> > > -SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/go.googlesource.com/crypto"
> > > +SRC_URI +=3D "git://github.com/golang/crypto;name=3Dcrypto;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/crypto"
> > >
> > >  # golang.org/x/exp v0.0.0-20210220032938-85be41e4509f
> > > -# [1] git ls-remote https://go.googlesource.com/exp 85be41e4509f417c=
bf99006a027aef75deb8afd1
> > > +# [1] git ls-remote https://github.com/golang/exp 85be41e4509f417cbf=
99006a027aef75deb8afd1
> > >  SRCREV_exp=3D"85be41e4509f417cbf99006a027aef75deb8afd1"
> > > -SRC_URI +=3D "git://go.googlesource.com/exp;name=3Dexp;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/exp"
> > > +SRC_URI +=3D "git://github.com/golang/exp;name=3Dexp;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/exp"
> > >
> > >  # golang.org/x/image v0.0.0-20190802002840-cff245a6509b
> > > -# [1] git ls-remote https://go.googlesource.com/image cff245a6509b8c=
4de022d0d5b9037c503c5989d6
> > > +# [1] git ls-remote https://github.com/golang/image cff245a6509b8c4d=
e022d0d5b9037c503c5989d6
> > >  SRCREV_image=3D"cff245a6509b8c4de022d0d5b9037c503c5989d6"
> > > -SRC_URI +=3D "git://go.googlesource.com/image;name=3Dimage;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/image"
> > > +SRC_URI +=3D "git://github.com/golang/image;name=3Dimage;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/image"
> > >
> > >  # golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
> > > -# [1] git ls-remote https://go.googlesource.com/lint 6edffad5e6160f5=
949cdefc81710b2706fbcd4f6
> > > +# [1] git ls-remote https://github.com/golang/lint 6edffad5e6160f594=
9cdefc81710b2706fbcd4f6
> > >  SRCREV_lint=3D"6edffad5e6160f5949cdefc81710b2706fbcd4f6"
> > > -SRC_URI +=3D "git://go.googlesource.com/lint;name=3Dlint;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/lint"
> > > +SRC_URI +=3D "git://github.com/golang/lint;name=3Dlint;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/lint"
> > >
> > >  # golang.org/x/mobile v0.0.0-20201217150744-e6ae53a27f4f
> > > -# [1] git ls-remote https://go.googlesource.com/mobile e6ae53a27f4fd=
7cfa2943f2ae47b96cba8eb01c9
> > > +# [1] git ls-remote https://github.com/golang/mobile e6ae53a27f4fd7c=
fa2943f2ae47b96cba8eb01c9
> > >  SRCREV_mobile=3D"e6ae53a27f4fd7cfa2943f2ae47b96cba8eb01c9"
> > > -SRC_URI +=3D "git://go.googlesource.com/mobile;name=3Dmobile;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/go.googlesource.com/mobile"
> > > +SRC_URI +=3D "git://github.com/golang/mobile;name=3Dmobile;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/mobile"
> > >
> > >  # golang.org/x/mod v0.5.1
> > > -# [1] git ls-remote https://go.googlesource.com/mod 49f84bccfd3469cb=
3095201f7855641bcc8eb49a
> > > +# [1] git ls-remote https://github.com/golang/mod 49f84bccfd3469cb30=
95201f7855641bcc8eb49a
> > >  SRCREV_mod=3D"49f84bccfd3469cb3095201f7855641bcc8eb49a"
> > > -SRC_URI +=3D "git://go.googlesource.com/mod;name=3Dmod;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/mod"
> > > +SRC_URI +=3D "git://github.com/golang/mod;name=3Dmod;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/mod"
> > >
> > >  # golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4
> > > -# [1] git ls-remote https://go.googlesource.com/net a5a99cb37ef4b686=
17775ab669177656090ab396
> > > +# [1] git ls-remote https://github.com/golang/net a5a99cb37ef4b68617=
775ab669177656090ab396
> > >  SRCREV_net=3D"a5a99cb37ef4b68617775ab669177656090ab396"
> > > -SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/net"
> > > +SRC_URI +=3D "git://github.com/golang/net;name=3Dnet;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/net"
> > >
> > >  # golang.org/x/oauth2 v0.0.0-20211104180415-d3ed0bb246c8
> > > -# [1] git ls-remote https://go.googlesource.com/oauth2 d3ed0bb246c8d=
3c75b63937d9a5eecff9c74d7fe
> > > +# [1] git ls-remote https://github.com/golang/oauth2 d3ed0bb246c8d3c=
75b63937d9a5eecff9c74d7fe
> > >  SRCREV_oauth2=3D"d3ed0bb246c8d3c75b63937d9a5eecff9c74d7fe"
> > > -SRC_URI +=3D "git://go.googlesource.com/oauth2;name=3Doauth2;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/go.googlesource.com/oauth2"
> > > +SRC_URI +=3D "git://github.com/golang/oauth2;name=3Doauth2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/oauth2"
> > >
> > >  # golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
> > > -# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0dd=
f193dd5a34e034151da389d09
> > > +# [1] git ls-remote https://github.com/golang/sync 036812b2e83c0ddf1=
93dd5a34e034151da389d09
> > >  SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
> > > -SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/sync"
> > > +SRC_URI +=3D "git://github.com/golang/sync;name=3Dsync;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/sync"
> > >
> > >  # golang.org/x/sys v0.0.0-20210831042530-f4d43177bf5e
> > > -# [1] git ls-remote https://go.googlesource.com/sys f4d43177bf5e2ee9=
8617956e417d0555d4b69c17
> > > +# [1] git ls-remote https://github.com/golang/sys f4d43177bf5e2ee986=
17956e417d0555d4b69c17
> > >  SRCREV_sys=3D"f4d43177bf5e2ee98617956e417d0555d4b69c17"
> > > -SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/sys"
> > > +SRC_URI +=3D "git://github.com/golang/sys;name=3Dsys;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/sys"
> > >
> > >  # golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d
> > > -# [1] git ls-remote https://go.googlesource.com/term 6a3ed077a48de71=
621ad530f9078fffa0bc0ce32
> > > +# [1] git ls-remote https://github.com/golang/term 6a3ed077a48de7162=
1ad530f9078fffa0bc0ce32
> > >  SRCREV_term1=3D"6a3ed077a48de71621ad530f9078fffa0bc0ce32"
> > > -SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/term"
> > > +SRC_URI +=3D "git://github.com/golang/term;name=3Dterm1;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/golang/term"
> > >
> > >  # golang.org/x/text v0.3.7
> > > -# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f88=
3d229d707172ed356727aae99
> > > +# [1] git ls-remote https://github.com/golang/text 3cd4007149f3f883d=
229d707172ed356727aae99
> > >  SRCREV_text1=3D"3cd4007149f3f883d229d707172ed356727aae99"
> > > -SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/text"
> > > +SRC_URI +=3D "git://github.com/golang/text;name=3Dtext1;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/golang/text"
> > >
> > >  # golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac
> > > -# [1] git ls-remote https://go.googlesource.com/time 1f47c861a9ac5a6=
e7645609f91b895398ff31642
> > > +# [1] git ls-remote https://github.com/golang/time 1f47c861a9ac5a6e7=
645609f91b895398ff31642
> > >  SRCREV_time=3D"1f47c861a9ac5a6e7645609f91b895398ff31642"
> > > -SRC_URI +=3D "git://go.googlesource.com/time;name=3Dtime;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/time"
> > > +SRC_URI +=3D "git://github.com/golang/time;name=3Dtime;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/time"
> > >
> > >  # golang.org/x/tools v0.1.8
> > > -# [1] git ls-remote https://go.googlesource.com/tools e212aff8fd146c=
44ddb0167c1dfbd5531d6c9213
> > > +# [1] git ls-remote https://github.com/golang/tools e212aff8fd146c44=
ddb0167c1dfbd5531d6c9213
> > >  SRCREV_tools=3D"e212aff8fd146c44ddb0167c1dfbd5531d6c9213"
> > > -SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/tools"
> > > +SRC_URI +=3D "git://github.com/golang/tools;name=3Dtools;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/tools"
> > >
> > >  # golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
> > > -# [1] git ls-remote https://go.googlesource.com/xerrors 5ec99f83aff1=
98f5fbd629d6c8d8eb38a04218ca
> > > +# [1] git ls-remote https://github.com/golang/xerrors 5ec99f83aff198=
f5fbd629d6c8d8eb38a04218ca
> > >  SRCREV_xerrors=3D"5ec99f83aff198f5fbd629d6c8d8eb38a04218ca"
> > > -SRC_URI +=3D "git://go.googlesource.com/xerrors;name=3Dxerrors;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/go.googlesource.com/xerrors"
> > > +SRC_URI +=3D "git://github.com/golang/xerrors;name=3Dxerrors;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/golang/xerrors"
> > >
> > >  # golang.zx2c4.com/go118/netip v0.0.0-20211111135330-a4a02eeacf9d
> > >  # [1] git ls-remote https://git.zx2c4.com/go118-netip a4a02eeacf9d49=
566df85e8cff878e5527e51779
> > > @@ -2633,7 +2633,7 @@ do_compile() {
> > >
> > >          cd ${S}/src/import
> > >
> > > -        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.org/=
bertimus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/go=
:github.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:github.=
com/googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/datas=
tore:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.google=
.com/go/firestore:github.com/googleapis/google-cloud-go/bigquery//firestore=
 cloud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquery/=
/pubsub cloud.google.com/go/storage:github.com/googleapis/google-cloud-go/b=
igquery//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mtl =
github.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skylar/=
excelize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for-g=
o github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Azur=
e/go-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/aut=
orest:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go-a=
utorest/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/adal =
github.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/aut=
orest//autorest/date github.com/Azure/go-autorest/autorest/mocks:github.com=
/Azure/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/au=
torest/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/Azu=
re/go-autorest/autorest/validation:github.com/Azure/go-autorest/autorest//a=
utorest/validation github.com/Azure/go-autorest/logger:github.com/Azure/go-=
autorest/autorest//logger github.com/Azure/go-autorest/tracing:github.com/A=
zure/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/Bu=
rntSushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.co=
m/GoogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k8s=
-cloud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_pdh=
 github.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com/M=
icrosoft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcsshi=
m:github.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/NY=
Times/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash git=
hub.com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/Puerk=
itoBio/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc:g=
ithub.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/retr=
y github.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.co=
m/ajstarks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:git=
hub.com/alecthomas/template github.com/alecthomas/units:github.com/alecthom=
as/units github.com/alexflint/go-filemutex:github.com/alexflint/go-filemute=
x github.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalhol=
m/cascadia:github.com/andybalholm/cascadia github.com/antihax/optional:gith=
ub.com/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf g=
ithub.com/armon/consul-api:github.com/armon/consul-api github.com/armon/go-=
metrics:github.com/armon/go-metrics github.com/armon/go-radix:github.com/ar=
mon/go-radix github.com/asaskevich/govalidator:github.com/asaskevich/govali=
dator github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middleware=
 github.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohnson=
/clock:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/beor=
n7/perks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github.c=
om/bits-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bket=
elsen/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com/b=
lang/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bronze=
1man/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/bug=
er/jsonparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:gi=
thub.com/canonical/go-dqlite github.com/census-instrumentation/opencensus-p=
roto:github.com/census-instrumentation/opencensus-proto github.com/certifi/=
gocertifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.com=
/cespare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 g=
ithub.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/che=
ckpoint-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 github.=
com/cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com/c=
hzyer/logex github.com/chzyer/readline:github.com/chzyer/readline github.co=
m/chzyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/cili=
um/ebpf github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs/k=
ube-router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-go =
github.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachdb/=
datadriven:github.com/cockroachdb/datadriven github.com/cockroachdb/errors:=
github.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/coc=
kroachdb/logtags github.com/container-storage-interface/spec:github.com/con=
tainer-storage-interface/spec github.com/containerd/aufs:github.com/contain=
erd/aufs github.com/containerd/btrfs:github.com/containerd/btrfs github.com=
/containerd/cgroups:github.com/containerd/cgroups github.com/containerd/con=
sole:github.com/containerd/console github.com/containerd/containerd:github.=
com/containerd/containerd github.com/containerd/continuity:github.com/conta=
inerd/continuity github.com/containerd/fifo:github.com/containerd/fifo gith=
ub.com/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-ove=
rlayfs-snapshotter github.com/containerd/go-cni:github.com/containerd/go-cn=
i github.com/containerd/go-runc:github.com/containerd/go-runc github.com/co=
ntainerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nri:=
github.com/containerd/nri github.com/containerd/stargz-snapshotter:github.c=
om/containerd/stargz-snapshotter github.com/containerd/stargz-snapshotter/e=
stargz:github.com/containerd/stargz-snapshotter//estargz github.com/contain=
erd/ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:github.=
com/containerd/typeurl github.com/containerd/zfs:github.com/containerd/zfs =
github.com/containernetworking/cni:github.com/containernetworking/cni githu=
b.com/containernetworking/plugins:github.com/containernetworking/plugins gi=
thub.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/core=
dns/caddy:github.com/coredns/caddy github.com/coredns/corefile-migration:gi=
thub.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/core=
os/bbolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/go=
-iptables:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.co=
m/coreos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver gi=
thub.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos/g=
o-systemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:github=
.com/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-md2=
man/v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/filepa=
th-securejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:gi=
thub.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client gi=
thub.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardware=
addr:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com/d=
anieljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew git=
hub.com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext github=
.com/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrijalv=
a/jwt-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.com/=
dgryski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 git=
hub.com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:github=
.com/docker/cli github.com/docker/distribution:github.com/docker/distributi=
on github.com/docker/docker:github.com/docker/docker github.com/docker/dock=
er-credential-helpers:github.com/docker/docker-credential-helpers github.co=
m/docker/go-connections:github.com/docker/go-connections github.com/docker/=
go-events:github.com/docker/go-events github.com/docker/go-metrics:github.c=
om/docker/go-metrics github.com/docker/go-units:github.com/docker/go-units =
github.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin/g=
o-humanize:github.com/dustin/go-humanize github.com/dustmop/soup:github.com=
/dustmop/soup github.com/eapache/channels:github.com/eapache/channels githu=
b.com/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:git=
hub.com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emicklei/=
go-restful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/go-=
control-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoypro=
xy/protoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubbel=
boer/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser g=
ithub.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/expon=
ent-io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-promi=
se:github.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fati=
h/camelcase github.com/fatih/color:github.com/fatih/color github.com/felixg=
e/httpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:gith=
ub.com/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-shl=
ex github.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss/j=
wt-go:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:github.=
com/frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/fsn=
otify github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.co=
m/getsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml:g=
ithub.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo g=
ithub.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.com=
/go-errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:github.=
com/go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3/g=
lfw//v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-ki=
t/kit:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log git=
hub.com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/log=
r:github.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr g=
ithub.com/go-openapi/analysis:github.com/go-openapi/analysis github.com/go-=
openapi/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpoint=
er:github.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:gi=
thub.com/go-openapi/jsonreference github.com/go-openapi/loads:github.com/go=
-openapi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtime =
github.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-openapi=
/strfmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.com/=
go-openapi/swag github.com/go-openapi/validate:github.com/go-openapi/valida=
te github.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation gi=
thub.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go-s=
tack/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:github.c=
om/go-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep githu=
b.com/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:github.=
com/godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.=
com/gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/gof=
rs/uuid github.com/gogo/googleapis:github.com/gogo/googleapis github.com/go=
go/protobuf:github.com/gogo/protobuf github.com/golang/freetype:github.com/=
golang/freetype github.com/golang/glog:github.com/golang/glog github.com/go=
lang/groupcache:github.com/golang/groupcache github.com/golang/mock:github.=
com/golang/mock github.com/golang/protobuf:github.com/golang/protobuf githu=
b.com/golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:gi=
thub.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus/f=
mt github.com/golangplus/testing:github.com/golangplus/testing github.com/g=
oogle/btree:github.com/google/btree github.com/google/cadvisor:github.com/g=
oogle/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.com=
/google/go-containerregistry:github.com/google/go-containerregistry github.=
com/google/gofuzz:github.com/google/gofuzz github.com/google/martian:github=
.com/google/martian github.com/google/martian/v3:github.com/google/martian/=
v3 github.com/google/pprof:github.com/google/pprof github.com/google/rename=
io:github.com/google/renameio github.com/google/shlex:github.com/google/shl=
ex github.com/google/uuid:github.com/google/uuid github.com/googleapis/gax-=
go/v2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:git=
hub.com/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/go=
phercloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/goph=
erjs github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/webso=
cket:github.com/gorilla/websocket github.com/gregjones/httpcache:github.com=
/gregjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.co=
m/grpc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-prome=
theus:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosyste=
m/grpc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/go-=
fuse/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:github=
.com/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com/h=
ashicorp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicorp/=
errwrap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp=
 github.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/has=
hicorp/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.co=
m/hashicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashicorp=
/go-multierror:github.com/hashicorp/go-multierror github.com/hashicorp/go-r=
etryablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/go-=
rootcerts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-sockadd=
r:github.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.co=
m/hashicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/go-=
uuid github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/has=
hicorp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hcl:=
github.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashicorp=
/logutils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/ha=
shicorp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/ser=
f:github.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/heke=
ti github.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tail:=
github.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelgup=
f/socketpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor/d=
emangle github.com/imdario/mergo:github.com/imdario/mergo github.com/incons=
hreveable/mousetrap:github.com/inconshreveable/mousetrap github.com/insomni=
acslk/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:github=
.com/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping gi=
thub.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespath=
/go-jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmespat=
h/internal/testify:github.com/jmespath/go-jmespath/internal/testify//intern=
al/testify github.com/joho/godotenv:github.com/joho/godotenv github.com/jon=
boulle/clockwork:github.com/jonboulle/clockwork github.com/josharian/intern=
:github.com/josharian/intern github.com/josharian/native:github.com/joshari=
an/native github.com/jpillora/backoff:github.com/jpillora/backoff github.co=
m/jsimonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-iter=
ator/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report:git=
hub.com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/gl=
s github.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter g=
ithub.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/cr=
itbitgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:githu=
b.com/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kine =
github.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisiel=
k/errcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.com=
/kisielk/gotool github.com/klauspost/compress:github.com/klauspost/compress=
 github.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsorten=
/go-windows-terminal-sequences:github.com/konsorten/go-windows-terminal-seq=
uences github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/kr=
/logfmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:github.=
com/kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-sigs=
/cri-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/godeb=
ug:github.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq github=
.com/libopenstorage/openstorage:github.com/libopenstorage/openstorage githu=
b.com/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer/d=
edent:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpabon=
/godbc github.com/magiconair/properties:github.com/magiconair/properties gi=
thub.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-col=
orable:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.com/=
mattn/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewidth=
 github.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com/m=
attn/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_pr=
otobuf_extensions:github.com/matttproud/golang_protobuf_extensions github.c=
om/mdlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/ethto=
ol:github.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/mdl=
ayher/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink git=
hub.com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:git=
hub.com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.co=
m/miekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.com/=
mikioh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml git=
hub.com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-go/=
v7:github.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/min=
io/sha256-simd github.com/minio/sio:github.com/minio/sio github.com/mistify=
io/go-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com/m=
itchellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedi=
r github.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testing=
-interface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordwra=
p github.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/io=
chan:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:github.c=
om/mitchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs github.=
com/moby/locker:github.com/moby/locker github.com/moby/spdystream:github.co=
m/moby/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mountin=
fo//mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//sy=
mlink github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:gith=
ub.com/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/con=
current github.com/modern-go/reflect2:github.com/modern-go/reflect2 github.=
com/mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go-g=
itignore:github.com/monochromegane/go-gitignore github.com/morikuni/aec:git=
hub.com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fileut=
ils github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/mv=
dan/xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.com=
/mwitkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowrate=
 github.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.com=
/niemeyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.co=
m/nxadm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/olekuko=
nko/tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:gi=
thub.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github.c=
om/opencontainers/go-digest:github.com/opencontainers/go-digest github.com/=
opencontainers/image-spec:github.com/opencontainers/image-spec github.com/o=
pencontainers/runc:github.com/opencontainers/runc github.com/opencontainers=
/runtime-spec:github.com/opencontainers/runtime-spec github.com/opencontain=
ers/selinux:github.com/opencontainers/selinux github.com/opentracing/opentr=
acing-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:github=
.com/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.com/=
otiai10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/oti=
ai10/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.co=
m/paulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com/p=
borman/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-buff=
runeio github.com/pelletier/go-toml:github.com/pelletier/go-toml github.com=
/peterbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:gi=
thub.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.com=
/pkg/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pmez=
ard/go-difflib github.com/posener/complete:github.com/posener/complete gith=
ub.com/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/prom=
etheus/client_golang:github.com/prometheus/client_golang github.com/prometh=
eus/client_model:github.com/prometheus/client_model github.com/prometheus/c=
ommon:github.com/prometheus/common github.com/prometheus/procfs:github.com/=
prometheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb git=
hub.com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:git=
hub.com/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher/d=
ynamiclistener github.com/rancher/lasso:github.com/rancher/lasso github.com=
/rancher/remotedialer:github.com/rancher/remotedialer github.com/rancher/wh=
arfie:github.com/rancher/wharfie github.com/rancher/wrangler:github.com/ran=
cher/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/bi=
gfft github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpepp=
e/fastuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:git=
hub.com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:git=
hub.com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/xid=
 github.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/bl=
ackfriday:github.com/russross/blackfriday github.com/russross/blackfriday/v=
2:github.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github.c=
om/ryanuber/columnize github.com/safchain/ethtool:github.com/safchain/ethto=
ol github.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/see=
d:github.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/sec=
comp/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff gi=
thub.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_ancho=
r_name github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/sma=
rtystreets/assertions:github.com/smartystreets/assertions github.com/smarty=
streets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cmux=
:github.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/water=
 github.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf13=
/afero:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast g=
ithub.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweathe=
rman:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com/s=
pf13/pflag github.com/spf13/viper:github.com/spf13/viper github.com/stefanb=
erger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewer/=
go-strcase:github.com/stoewer/go-strcase github.com/storageos/go-api:github=
.com/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx git=
hub.com/stretchr/testify:github.com/stretchr/testify github.com/subosito/go=
tenv:github.com/subosito/gotenv github.com/syndtr/gocapability:github.com/s=
yndtr/gocapability github.com/tchap/go-patricia:github.com/tchap/go-patrici=
a github.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/tence=
ntcloud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github.c=
om/tmc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.com/=
u-root/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ugor=
ji/go github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v2:=
github.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negron=
i github.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vektah=
/gqlparser:github.com/vektah/gqlparser github.com/vishvananda/netlink:githu=
b.com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishvanan=
da/netns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/wil=
lf/bitset:github.com/willf/bitset github.com/xiang90/probing:github.com/xia=
ng90/probing github.com/xlab/treeprint:github.com/xlab/treeprint github.com=
/xordataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/gol=
dmark:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.io=
/etcd:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd=
/client/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/etc=
d/client/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/clien=
t/pkg/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/v3=
//raft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.io=
/etcd/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/et=
cdutl/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3:g=
ithub.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/pk=
cs7 go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.opente=
lemetry.io/contrib go.opentelemetry.io/contrib/instrumentation/google.golan=
g.org/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.gol=
ang.org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/http/=
otelhttp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp go.=
opentelemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/exp=
orters/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/ot=
el/metric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/oteltes=
t:go.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.opente=
lemetry.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.opentele=
metry.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.ope=
ntelemetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.openteleme=
try.io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemetry=
/opentelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/starla=
rk-go go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.org/=
goleak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.or=
g/zap golang.org/x/crypto:go.googlesource.com/crypto golang.org/x/exp:go.go=
oglesource.com/exp golang.org/x/image:go.googlesource.com/image golang.org/=
x/lint:go.googlesource.com/lint golang.org/x/mobile:go.googlesource.com/mob=
ile golang.org/x/mod:go.googlesource.com/mod golang.org/x/net:go.googlesour=
ce.com/net golang.org/x/oauth2:go.googlesource.com/oauth2 golang.org/x/sync=
:go.googlesource.com/sync golang.org/x/sys:go.googlesource.com/sys golang.o=
rg/x/term:go.googlesource.com/term golang.org/x/text:go.googlesource.com/te=
xt golang.org/x/time:go.googlesource.com/time golang.org/x/tools:go.googles=
ource.com/tools golang.org/x/xerrors:go.googlesource.com/xerrors golang.zx2=
c4.com/go118/netip:golang.zx2c4.com/go118/netip golang.zx2c4.com/wintun:gol=
ang.zx2c4.com/wintun golang.zx2c4.com/wireguard:golang.zx2c4.com/wireguard =
golang.zx2c4.com/wireguard/wgctrl:golang.zx2c4.com/wireguard/wgctrl gonum.o=
rg/v1/gonum:github.com/gonum/gonum gonum.org/v1/netlib:github.com/gonum/net=
lib gonum.org/v1/plot:github.com/gonum/plot google.golang.org/api:google.go=
lang.org/api google.golang.org/appengine:google.golang.org/appengine google=
.golang.org/genproto:google.golang.org/genproto google.golang.org/grpc:goog=
le.golang.org/grpc google.golang.org/grpc/cmd/protoc-gen-go-grpc:google.gol=
ang.org/grpc/cmd/protoc-gen-go-grpc google.golang.org/protobuf:google.golan=
g.org/protobuf gopkg.in/airbrake/gobrake.v2:gopkg.in/airbrake/gobrake.v2 go=
pkg.in/alecthomas/kingpin.v2:gopkg.in/alecthomas/kingpin.v2 gopkg.in/check.=
v1:gopkg.in/check.v1 gopkg.in/cheggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.=
in/errgo.v2:gopkg.in/errgo.v2 gopkg.in/fsnotify.v1:gopkg.in/fsnotify.v1 gop=
kg.in/gcfg.v1:gopkg.in/gcfg.v1 gopkg.in/gemnasium/logrus-airbrake-hook.v2:g=
opkg.in/gemnasium/logrus-airbrake-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 g=
opkg.in/ini.v1:gopkg.in/ini.v1 gopkg.in/natefinch/lumberjack.v2:gopkg.in/na=
tefinch/lumberjack.v2 gopkg.in/resty.v1:gopkg.in/resty.v1 gopkg.in/square/g=
o-jose.v2:gopkg.in/square/go-jose.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopk=
g.in/warnings.v0:gopkg.in/warnings.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gop=
kg.in/yaml.v3:gopkg.in/yaml.v3 gotest.tools:gotest.tools gotest.tools/v3:gi=
thub.com/gotestyourself/gotest.tools/v3 honnef.co/go/tools:honnef.co/go/too=
ls inet.af/tcpproxy:inet.af/tcpproxy k8s.io/api:github.com/k3s-io/kubernete=
s/staging/src/k8s.io/api//staging/src/k8s.io/api k8s.io/apiextensions-apise=
rver:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.i=
o/apiextensions-apiserver k8s.io/apimachinery:github.com/k3s-io/kubernetes/=
staging/src/k8s.io/api//staging/src/k8s.io/apimachinery k8s.io/apiserver:gi=
thub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/apise=
rver k8s.io/cli-runtime:github.com/k3s-io/kubernetes/staging/src/k8s.io/api=
//staging/src/k8s.io/cli-runtime k8s.io/client-go:github.com/k3s-io/kuberne=
tes/staging/src/k8s.io/api//staging/src/k8s.io/client-go k8s.io/cloud-provi=
der:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io=
/cloud-provider k8s.io/cluster-bootstrap:github.com/k3s-io/kubernetes/stagi=
ng/src/k8s.io/api//staging/src/k8s.io/cluster-bootstrap k8s.io/code-generat=
or:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/=
code-generator k8s.io/component-base:github.com/k3s-io/kubernetes/staging/s=
rc/k8s.io/api//staging/src/k8s.io/component-base k8s.io/component-helpers:g=
ithub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/comp=
onent-helpers k8s.io/controller-manager:github.com/k3s-io/kubernetes/stagin=
g/src/k8s.io/api//staging/src/k8s.io/controller-manager k8s.io/cri-api:gith=
ub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cri-api=
 k8s.io/csi-translation-lib:github.com/k3s-io/kubernetes/staging/src/k8s.io=
/api//staging/src/k8s.io/csi-translation-lib k8s.io/kube-aggregator:github.=
com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-aggre=
gator k8s.io/kube-controller-manager:github.com/k3s-io/kubernetes/staging/s=
rc/k8s.io/api//staging/src/k8s.io/kube-controller-manager k8s.io/kube-proxy=
:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/ku=
be-proxy k8s.io/kube-scheduler:github.com/k3s-io/kubernetes/staging/src/k8s=
.io/api//staging/src/k8s.io/kube-scheduler k8s.io/kubectl:github.com/k3s-io=
/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kubectl k8s.io/kubel=
et:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/=
kubelet k8s.io/kubernetes:github.com/k3s-io/kubernetes/staging/src/k8s.io/a=
pi k8s.io/legacy-cloud-providers:github.com/k3s-io/kubernetes/staging/src/k=
8s.io/api//staging/src/k8s.io/legacy-cloud-providers k8s.io/metrics:github.=
com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/metrics k8=
s.io/mount-utils:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//stagi=
ng/src/k8s.io/mount-utils k8s.io/pod-security-admission:github.com/k3s-io/k=
ubernetes/staging/src/k8s.io/api//staging/src/k8s.io/pod-security-admission=
 k8s.io/sample-apiserver:github.com/k3s-io/kubernetes/staging/src/k8s.io/ap=
i//staging/src/k8s.io/sample-apiserver k8s.io/gengo:k8s.io/gengo k8s.io/klo=
g:k8s.io/klog k8s.io/klog/v2:github.com/k3s-io/klog/v2 k8s.io/kube-openapi:=
k8s.io/kube-openapi k8s.io/system-validators:k8s.io/system-validators k8s.i=
o/utils:k8s.io/utils modernc.org/cc:modernc.org/cc modernc.org/golex:modern=
c.org/golex modernc.org/mathutil:modernc.org/mathutil modernc.org/strutil:m=
odernc.org/strutil modernc.org/xc:modernc.org/xc rsc.io/binaryregexp:rsc.io=
/binaryregexp rsc.io/pdf:rsc.io/pdf rsc.io/quote/v3:github.com/rsc/quote/v3=
//v3 rsc.io/sampler:rsc.io/sampler sigs.k8s.io/apiserver-network-proxy/konn=
ectivity-client:github.com/kubernetes-sigs/apiserver-network-proxy/konnecti=
vity-client//konnectivity-client sigs.k8s.io/cli-utils:sigs.k8s.io/cli-util=
s sigs.k8s.io/controller-runtime:sigs.k8s.io/controller-runtime sigs.k8s.io=
/kustomize/api:github.com/kubernetes-sigs/kustomize/api//api sigs.k8s.io/ku=
stomize/cmd/config:github.com/kubernetes-sigs/kustomize/api//cmd/config sig=
s.k8s.io/kustomize/kustomize/v4:github.com/kubernetes-sigs/kustomize/api//k=
ustomize sigs.k8s.io/kustomize/kyaml:github.com/kubernetes-sigs/kustomize/a=
pi//kyaml sigs.k8s.io/structured-merge-diff/v4:github.com/kubernetes-sigs/s=
tructured-merge-diff/v4 sigs.k8s.io/testing_frameworks:sigs.k8s.io/testing_=
frameworks sigs.k8s.io/yaml:sigs.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.io/j=
son"
> > > +        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.org/=
bertimus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/go=
:github.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:github.=
com/googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/datas=
tore:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.google=
.com/go/firestore:github.com/googleapis/google-cloud-go/bigquery//firestore=
 cloud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquery/=
/pubsub cloud.google.com/go/storage:github.com/googleapis/google-cloud-go/b=
igquery//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mtl =
github.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skylar/=
excelize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for-g=
o github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Azur=
e/go-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/aut=
orest:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go-a=
utorest/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/adal =
github.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/aut=
orest//autorest/date github.com/Azure/go-autorest/autorest/mocks:github.com=
/Azure/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/au=
torest/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/Azu=
re/go-autorest/autorest/validation:github.com/Azure/go-autorest/autorest//a=
utorest/validation github.com/Azure/go-autorest/logger:github.com/Azure/go-=
autorest/autorest//logger github.com/Azure/go-autorest/tracing:github.com/A=
zure/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/Bu=
rntSushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.co=
m/GoogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k8s=
-cloud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_pdh=
 github.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com/M=
icrosoft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcsshi=
m:github.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/NY=
Times/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash git=
hub.com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/Puerk=
itoBio/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc:g=
ithub.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/retr=
y github.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.co=
m/ajstarks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:git=
hub.com/alecthomas/template github.com/alecthomas/units:github.com/alecthom=
as/units github.com/alexflint/go-filemutex:github.com/alexflint/go-filemute=
x github.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalhol=
m/cascadia:github.com/andybalholm/cascadia github.com/antihax/optional:gith=
ub.com/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf g=
ithub.com/armon/consul-api:github.com/armon/consul-api github.com/armon/go-=
metrics:github.com/armon/go-metrics github.com/armon/go-radix:github.com/ar=
mon/go-radix github.com/asaskevich/govalidator:github.com/asaskevich/govali=
dator github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middleware=
 github.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohnson=
/clock:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/beor=
n7/perks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github.c=
om/bits-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bket=
elsen/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com/b=
lang/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bronze=
1man/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/bug=
er/jsonparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:gi=
thub.com/canonical/go-dqlite github.com/census-instrumentation/opencensus-p=
roto:github.com/census-instrumentation/opencensus-proto github.com/certifi/=
gocertifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.com=
/cespare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 g=
ithub.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/che=
ckpoint-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 github.=
com/cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com/c=
hzyer/logex github.com/chzyer/readline:github.com/chzyer/readline github.co=
m/chzyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/cili=
um/ebpf github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs/k=
ube-router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-go =
github.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachdb/=
datadriven:github.com/cockroachdb/datadriven github.com/cockroachdb/errors:=
github.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/coc=
kroachdb/logtags github.com/container-storage-interface/spec:github.com/con=
tainer-storage-interface/spec github.com/containerd/aufs:github.com/contain=
erd/aufs github.com/containerd/btrfs:github.com/containerd/btrfs github.com=
/containerd/cgroups:github.com/containerd/cgroups github.com/containerd/con=
sole:github.com/containerd/console github.com/containerd/containerd:github.=
com/containerd/containerd github.com/containerd/continuity:github.com/conta=
inerd/continuity github.com/containerd/fifo:github.com/containerd/fifo gith=
ub.com/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-ove=
rlayfs-snapshotter github.com/containerd/go-cni:github.com/containerd/go-cn=
i github.com/containerd/go-runc:github.com/containerd/go-runc github.com/co=
ntainerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nri:=
github.com/containerd/nri github.com/containerd/stargz-snapshotter:github.c=
om/containerd/stargz-snapshotter github.com/containerd/stargz-snapshotter/e=
stargz:github.com/containerd/stargz-snapshotter//estargz github.com/contain=
erd/ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:github.=
com/containerd/typeurl github.com/containerd/zfs:github.com/containerd/zfs =
github.com/containernetworking/cni:github.com/containernetworking/cni githu=
b.com/containernetworking/plugins:github.com/containernetworking/plugins gi=
thub.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/core=
dns/caddy:github.com/coredns/caddy github.com/coredns/corefile-migration:gi=
thub.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/core=
os/bbolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/go=
-iptables:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.co=
m/coreos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver gi=
thub.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos/g=
o-systemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:github=
.com/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-md2=
man/v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/filepa=
th-securejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:gi=
thub.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client gi=
thub.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardware=
addr:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com/d=
anieljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew git=
hub.com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext github=
.com/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrijalv=
a/jwt-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.com/=
dgryski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 git=
hub.com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:github=
.com/docker/cli github.com/docker/distribution:github.com/docker/distributi=
on github.com/docker/docker:github.com/docker/docker github.com/docker/dock=
er-credential-helpers:github.com/docker/docker-credential-helpers github.co=
m/docker/go-connections:github.com/docker/go-connections github.com/docker/=
go-events:github.com/docker/go-events github.com/docker/go-metrics:github.c=
om/docker/go-metrics github.com/docker/go-units:github.com/docker/go-units =
github.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin/g=
o-humanize:github.com/dustin/go-humanize github.com/dustmop/soup:github.com=
/dustmop/soup github.com/eapache/channels:github.com/eapache/channels githu=
b.com/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:git=
hub.com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emicklei/=
go-restful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/go-=
control-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoypro=
xy/protoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubbel=
boer/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser g=
ithub.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/expon=
ent-io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-promi=
se:github.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fati=
h/camelcase github.com/fatih/color:github.com/fatih/color github.com/felixg=
e/httpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:gith=
ub.com/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-shl=
ex github.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss/j=
wt-go:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:github.=
com/frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/fsn=
otify github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.co=
m/getsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml:g=
ithub.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo g=
ithub.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.com=
/go-errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:github.=
com/go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3/g=
lfw//v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-ki=
t/kit:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log git=
hub.com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/log=
r:github.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr g=
ithub.com/go-openapi/analysis:github.com/go-openapi/analysis github.com/go-=
openapi/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpoint=
er:github.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:gi=
thub.com/go-openapi/jsonreference github.com/go-openapi/loads:github.com/go=
-openapi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtime =
github.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-openapi=
/strfmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.com/=
go-openapi/swag github.com/go-openapi/validate:github.com/go-openapi/valida=
te github.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation gi=
thub.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go-s=
tack/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:github.c=
om/go-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep githu=
b.com/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:github.=
com/godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.=
com/gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/gof=
rs/uuid github.com/gogo/googleapis:github.com/gogo/googleapis github.com/go=
go/protobuf:github.com/gogo/protobuf github.com/golang/freetype:github.com/=
golang/freetype github.com/golang/glog:github.com/golang/glog github.com/go=
lang/groupcache:github.com/golang/groupcache github.com/golang/mock:github.=
com/golang/mock github.com/golang/protobuf:github.com/golang/protobuf githu=
b.com/golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:gi=
thub.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus/f=
mt github.com/golangplus/testing:github.com/golangplus/testing github.com/g=
oogle/btree:github.com/google/btree github.com/google/cadvisor:github.com/g=
oogle/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.com=
/google/go-containerregistry:github.com/google/go-containerregistry github.=
com/google/gofuzz:github.com/google/gofuzz github.com/google/martian:github=
.com/google/martian github.com/google/martian/v3:github.com/google/martian/=
v3 github.com/google/pprof:github.com/google/pprof github.com/google/rename=
io:github.com/google/renameio github.com/google/shlex:github.com/google/shl=
ex github.com/google/uuid:github.com/google/uuid github.com/googleapis/gax-=
go/v2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:git=
hub.com/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/go=
phercloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/goph=
erjs github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/webso=
cket:github.com/gorilla/websocket github.com/gregjones/httpcache:github.com=
/gregjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.co=
m/grpc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-prome=
theus:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosyste=
m/grpc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/go-=
fuse/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:github=
.com/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com/h=
ashicorp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicorp/=
errwrap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp=
 github.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/has=
hicorp/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.co=
m/hashicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashicorp=
/go-multierror:github.com/hashicorp/go-multierror github.com/hashicorp/go-r=
etryablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/go-=
rootcerts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-sockadd=
r:github.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.co=
m/hashicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/go-=
uuid github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/has=
hicorp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hcl:=
github.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashicorp=
/logutils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/ha=
shicorp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/ser=
f:github.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/heke=
ti github.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tail:=
github.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelgup=
f/socketpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor/d=
emangle github.com/imdario/mergo:github.com/imdario/mergo github.com/incons=
hreveable/mousetrap:github.com/inconshreveable/mousetrap github.com/insomni=
acslk/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:github=
.com/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping gi=
thub.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespath=
/go-jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmespat=
h/internal/testify:github.com/jmespath/go-jmespath/internal/testify//intern=
al/testify github.com/joho/godotenv:github.com/joho/godotenv github.com/jon=
boulle/clockwork:github.com/jonboulle/clockwork github.com/josharian/intern=
:github.com/josharian/intern github.com/josharian/native:github.com/joshari=
an/native github.com/jpillora/backoff:github.com/jpillora/backoff github.co=
m/jsimonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-iter=
ator/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report:git=
hub.com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/gl=
s github.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter g=
ithub.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/cr=
itbitgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:githu=
b.com/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kine =
github.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisiel=
k/errcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.com=
/kisielk/gotool github.com/klauspost/compress:github.com/klauspost/compress=
 github.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsorten=
/go-windows-terminal-sequences:github.com/konsorten/go-windows-terminal-seq=
uences github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/kr=
/logfmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:github.=
com/kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-sigs=
/cri-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/godeb=
ug:github.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq github=
.com/libopenstorage/openstorage:github.com/libopenstorage/openstorage githu=
b.com/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer/d=
edent:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpabon=
/godbc github.com/magiconair/properties:github.com/magiconair/properties gi=
thub.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-col=
orable:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.com/=
mattn/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewidth=
 github.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com/m=
attn/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_pr=
otobuf_extensions:github.com/matttproud/golang_protobuf_extensions github.c=
om/mdlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/ethto=
ol:github.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/mdl=
ayher/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink git=
hub.com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:git=
hub.com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.co=
m/miekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.com/=
mikioh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml git=
hub.com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-go/=
v7:github.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/min=
io/sha256-simd github.com/minio/sio:github.com/minio/sio github.com/mistify=
io/go-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com/m=
itchellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedi=
r github.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testing=
-interface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordwra=
p github.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/io=
chan:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:github.c=
om/mitchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs github.=
com/moby/locker:github.com/moby/locker github.com/moby/spdystream:github.co=
m/moby/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mountin=
fo//mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//sy=
mlink github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:gith=
ub.com/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/con=
current github.com/modern-go/reflect2:github.com/modern-go/reflect2 github.=
com/mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go-g=
itignore:github.com/monochromegane/go-gitignore github.com/morikuni/aec:git=
hub.com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fileut=
ils github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/mv=
dan/xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.com=
/mwitkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowrate=
 github.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.com=
/niemeyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.co=
m/nxadm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/olekuko=
nko/tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:gi=
thub.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github.c=
om/opencontainers/go-digest:github.com/opencontainers/go-digest github.com/=
opencontainers/image-spec:github.com/opencontainers/image-spec github.com/o=
pencontainers/runc:github.com/opencontainers/runc github.com/opencontainers=
/runtime-spec:github.com/opencontainers/runtime-spec github.com/opencontain=
ers/selinux:github.com/opencontainers/selinux github.com/opentracing/opentr=
acing-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:github=
.com/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.com/=
otiai10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/oti=
ai10/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.co=
m/paulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com/p=
borman/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-buff=
runeio github.com/pelletier/go-toml:github.com/pelletier/go-toml github.com=
/peterbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:gi=
thub.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.com=
/pkg/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pmez=
ard/go-difflib github.com/posener/complete:github.com/posener/complete gith=
ub.com/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/prom=
etheus/client_golang:github.com/prometheus/client_golang github.com/prometh=
eus/client_model:github.com/prometheus/client_model github.com/prometheus/c=
ommon:github.com/prometheus/common github.com/prometheus/procfs:github.com/=
prometheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb git=
hub.com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:git=
hub.com/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher/d=
ynamiclistener github.com/rancher/lasso:github.com/rancher/lasso github.com=
/rancher/remotedialer:github.com/rancher/remotedialer github.com/rancher/wh=
arfie:github.com/rancher/wharfie github.com/rancher/wrangler:github.com/ran=
cher/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/bi=
gfft github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpepp=
e/fastuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:git=
hub.com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:git=
hub.com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/xid=
 github.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/bl=
ackfriday:github.com/russross/blackfriday github.com/russross/blackfriday/v=
2:github.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github.c=
om/ryanuber/columnize github.com/safchain/ethtool:github.com/safchain/ethto=
ol github.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/see=
d:github.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/sec=
comp/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff gi=
thub.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_ancho=
r_name github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/sma=
rtystreets/assertions:github.com/smartystreets/assertions github.com/smarty=
streets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cmux=
:github.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/water=
 github.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf13=
/afero:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast g=
ithub.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweathe=
rman:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com/s=
pf13/pflag github.com/spf13/viper:github.com/spf13/viper github.com/stefanb=
erger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewer/=
go-strcase:github.com/stoewer/go-strcase github.com/storageos/go-api:github=
.com/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx git=
hub.com/stretchr/testify:github.com/stretchr/testify github.com/subosito/go=
tenv:github.com/subosito/gotenv github.com/syndtr/gocapability:github.com/s=
yndtr/gocapability github.com/tchap/go-patricia:github.com/tchap/go-patrici=
a github.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/tence=
ntcloud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github.c=
om/tmc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.com/=
u-root/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ugor=
ji/go github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v2:=
github.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negron=
i github.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vektah=
/gqlparser:github.com/vektah/gqlparser github.com/vishvananda/netlink:githu=
b.com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishvanan=
da/netns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/wil=
lf/bitset:github.com/willf/bitset github.com/xiang90/probing:github.com/xia=
ng90/probing github.com/xlab/treeprint:github.com/xlab/treeprint github.com=
/xordataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/gol=
dmark:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.io=
/etcd:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd=
/client/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/etc=
d/client/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/clien=
t/pkg/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/v3=
//raft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.io=
/etcd/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/et=
cdutl/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3:g=
ithub.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/pk=
cs7 go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.opente=
lemetry.io/contrib go.opentelemetry.io/contrib/instrumentation/google.golan=
g.org/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.gol=
ang.org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/http/=
otelhttp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp go.=
opentelemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/exp=
orters/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/ot=
el/metric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/oteltes=
t:go.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.opente=
lemetry.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.opentele=
metry.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.ope=
ntelemetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.openteleme=
try.io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemetry=
/opentelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/starla=
rk-go go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.org/=
goleak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.or=
g/zap golang.org/x/crypto:github.com/golang/crypto golang.org/x/exp:github.=
com/golang/exp golang.org/x/image:github.com/golang/image golang.org/x/lint=
:github.com/golang/lint golang.org/x/mobile:github.com/golang/mobile golang=
.org/x/mod:github.com/golang/mod golang.org/x/net:github.com/golang/net gol=
ang.org/x/oauth2:github.com/golang/oauth2 golang.org/x/sync:github.com/gola=
ng/sync golang.org/x/sys:github.com/golang/sys golang.org/x/term:github.com=
/golang/term golang.org/x/text:github.com/golang/text golang.org/x/time:git=
hub.com/golang/time golang.org/x/tools:github.com/golang/tools golang.org/x=
/xerrors:github.com/golang/xerrors golang.zx2c4.com/go118/netip:golang.zx2c=
4.com/go118/netip golang.zx2c4.com/wintun:golang.zx2c4.com/wintun golang.zx=
2c4.com/wireguard:golang.zx2c4.com/wireguard golang.zx2c4.com/wireguard/wgc=
trl:golang.zx2c4.com/wireguard/wgctrl gonum.org/v1/gonum:github.com/gonum/g=
onum gonum.org/v1/netlib:github.com/gonum/netlib gonum.org/v1/plot:github.c=
om/gonum/plot google.golang.org/api:google.golang.org/api google.golang.org=
/appengine:google.golang.org/appengine google.golang.org/genproto:google.go=
lang.org/genproto google.golang.org/grpc:google.golang.org/grpc google.gola=
ng.org/grpc/cmd/protoc-gen-go-grpc:google.golang.org/grpc/cmd/protoc-gen-go=
-grpc google.golang.org/protobuf:google.golang.org/protobuf gopkg.in/airbra=
ke/gobrake.v2:gopkg.in/airbrake/gobrake.v2 gopkg.in/alecthomas/kingpin.v2:g=
opkg.in/alecthomas/kingpin.v2 gopkg.in/check.v1:gopkg.in/check.v1 gopkg.in/=
cheggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.in/errgo.v2:gopkg.in/errgo.v2 =
gopkg.in/fsnotify.v1:gopkg.in/fsnotify.v1 gopkg.in/gcfg.v1:gopkg.in/gcfg.v1=
 gopkg.in/gemnasium/logrus-airbrake-hook.v2:gopkg.in/gemnasium/logrus-airbr=
ake-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 gopkg.in/ini.v1:gopkg.in/ini.v1=
 gopkg.in/natefinch/lumberjack.v2:gopkg.in/natefinch/lumberjack.v2 gopkg.in=
/resty.v1:gopkg.in/resty.v1 gopkg.in/square/go-jose.v2:gopkg.in/square/go-j=
ose.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopkg.in/warnings.v0:gopkg.in/warn=
ings.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gopkg.in/yaml.v3:gopkg.in/yaml.v3=
 gotest.tools:gotest.tools gotest.tools/v3:github.com/gotestyourself/gotest=
.tools/v3 honnef.co/go/tools:honnef.co/go/tools inet.af/tcpproxy:inet.af/tc=
pproxy k8s.io/api:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//stag=
ing/src/k8s.io/api k8s.io/apiextensions-apiserver:github.com/k3s-io/kuberne=
tes/staging/src/k8s.io/api//staging/src/k8s.io/apiextensions-apiserver k8s.=
io/apimachinery:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//stagin=
g/src/k8s.io/apimachinery k8s.io/apiserver:github.com/k3s-io/kubernetes/sta=
ging/src/k8s.io/api//staging/src/k8s.io/apiserver k8s.io/cli-runtime:github=
.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cli-runti=
me k8s.io/client-go:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//st=
aging/src/k8s.io/client-go k8s.io/cloud-provider:github.com/k3s-io/kubernet=
es/staging/src/k8s.io/api//staging/src/k8s.io/cloud-provider k8s.io/cluster=
-bootstrap:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src=
/k8s.io/cluster-bootstrap k8s.io/code-generator:github.com/k3s-io/kubernete=
s/staging/src/k8s.io/api//staging/src/k8s.io/code-generator k8s.io/componen=
t-base:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s=
.io/component-base k8s.io/component-helpers:github.com/k3s-io/kubernetes/st=
aging/src/k8s.io/api//staging/src/k8s.io/component-helpers k8s.io/controlle=
r-manager:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/=
k8s.io/controller-manager k8s.io/cri-api:github.com/k3s-io/kubernetes/stagi=
ng/src/k8s.io/api//staging/src/k8s.io/cri-api k8s.io/csi-translation-lib:gi=
thub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/csi-t=
ranslation-lib k8s.io/kube-aggregator:github.com/k3s-io/kubernetes/staging/=
src/k8s.io/api//staging/src/k8s.io/kube-aggregator k8s.io/kube-controller-m=
anager:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s=
.io/kube-controller-manager k8s.io/kube-proxy:github.com/k3s-io/kubernetes/=
staging/src/k8s.io/api//staging/src/k8s.io/kube-proxy k8s.io/kube-scheduler=
:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/ku=
be-scheduler k8s.io/kubectl:github.com/k3s-io/kubernetes/staging/src/k8s.io=
/api//staging/src/k8s.io/kubectl k8s.io/kubelet:github.com/k3s-io/kubernete=
s/staging/src/k8s.io/api//staging/src/k8s.io/kubelet k8s.io/kubernetes:gith=
ub.com/k3s-io/kubernetes/staging/src/k8s.io/api k8s.io/legacy-cloud-provide=
rs:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/=
legacy-cloud-providers k8s.io/metrics:github.com/k3s-io/kubernetes/staging/=
src/k8s.io/api//staging/src/k8s.io/metrics k8s.io/mount-utils:github.com/k3=
s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/mount-utils k8s.=
io/pod-security-admission:github.com/k3s-io/kubernetes/staging/src/k8s.io/a=
pi//staging/src/k8s.io/pod-security-admission k8s.io/sample-apiserver:githu=
b.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/sample-a=
piserver k8s.io/gengo:k8s.io/gengo k8s.io/klog:k8s.io/klog k8s.io/klog/v2:g=
ithub.com/k3s-io/klog/v2 k8s.io/kube-openapi:k8s.io/kube-openapi k8s.io/sys=
tem-validators:k8s.io/system-validators k8s.io/utils:k8s.io/utils modernc.o=
rg/cc:modernc.org/cc modernc.org/golex:modernc.org/golex modernc.org/mathut=
il:modernc.org/mathutil modernc.org/strutil:modernc.org/strutil modernc.org=
/xc:modernc.org/xc rsc.io/binaryregexp:rsc.io/binaryregexp rsc.io/pdf:rsc.i=
o/pdf rsc.io/quote/v3:github.com/rsc/quote/v3//v3 rsc.io/sampler:rsc.io/sam=
pler sigs.k8s.io/apiserver-network-proxy/konnectivity-client:github.com/kub=
ernetes-sigs/apiserver-network-proxy/konnectivity-client//konnectivity-clie=
nt sigs.k8s.io/cli-utils:sigs.k8s.io/cli-utils sigs.k8s.io/controller-runti=
me:sigs.k8s.io/controller-runtime sigs.k8s.io/kustomize/api:github.com/kube=
rnetes-sigs/kustomize/api//api sigs.k8s.io/kustomize/cmd/config:github.com/=
kubernetes-sigs/kustomize/api//cmd/config sigs.k8s.io/kustomize/kustomize/v=
4:github.com/kubernetes-sigs/kustomize/api//kustomize sigs.k8s.io/kustomize=
/kyaml:github.com/kubernetes-sigs/kustomize/api//kyaml sigs.k8s.io/structur=
ed-merge-diff/v4:github.com/kubernetes-sigs/structured-merge-diff/v4 sigs.k=
8s.io/testing_frameworks:sigs.k8s.io/testing_frameworks sigs.k8s.io/yaml:si=
gs.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.io/json"
> > >          for s in $sites; do
> > >              site_dest=3D$(echo $s | cut -d: -f1)
> > >              site_source=3D$(echo $s | cut -d: -f2)
> > > --
> > > 2.35.1
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
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7367): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7367
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

