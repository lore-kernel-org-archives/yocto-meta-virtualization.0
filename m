Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE2CC43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 13:02:59 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.26599.1654866171661147260
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 06:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KXO8F0SJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id g205so23795696pfb.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YHCBrgmE6OTkpHgPsboXvppaJFrQWpIe8ucxCdp9W0I=;
        b=KXO8F0SJmzWFJiJK9//v2M/UpbInhlV9xky0A8SsE4kxTmOP8kkKj38DBjJ40NGeG0
         HE6nHeZ6UI2zkTcgCHXdzy2agkYy6vK2Om2SdRdSG14i8wFrvQ1VnJ8rS8V/amhHHiRE
         YqEr1oT7GdgzJIhovzckl3e4DGmSK8RzbDfTPxjF8ys0UaBoQdpIljUbfBZufPdymYFt
         0aBEODyvdnzoaPhhB3Ch1RzVHBkFq1OvBqIwT3+cfpJJUUJmD60gn9f/s4xe3G1fDRT/
         jxZ89Q4GiiqQV6nGnNn2B6BFShl5qfKjDvYV7OV/k5ZJ/ib28su9rvHTTIWlGLRhYR6R
         dTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YHCBrgmE6OTkpHgPsboXvppaJFrQWpIe8ucxCdp9W0I=;
        b=M5N78GyS1eSdHt/5EHpDxbPXNAuqZPUWLLxQ736/eSNi+K1/Aswn/9BsJRAcDopTfn
         EjnDQ+jdyZ+M/HiSjmjynnX442r0/QCYChFTqEXnlIhEPMnSDakdPIOmI/HWfxqoXD0i
         PtHZZvU0E8t8gMVgVTzxmu4tQk0jv4S7TrmkLvqTj0FelANHR7zuI+76/xCCrDN9mzjD
         ejGERCRww7mFnSf/2IX51Z47P7ApEnCeKdXaWymOX4Nh7R/kzrpxP7XoEuF5h5hBwBwr
         n79jSGB5H3IBKkYIusKhmIzA67Jr9vJkiEbR+CluMJ00LmCZoOsTCGh2+yxyGzhLSlHh
         x2ZA==
X-Gm-Message-State: AOAM531mwAyEPrp3lX9DwqkoB1JF22jEjP0WfpNgIReO8QaY/Qo91XMJ
	tU8K1T/Is1cMKufcGOudPN1a0LtKlfZSVAmx0FM=
X-Google-Smtp-Source: 
 ABdhPJxNG6XQ90KPWpqa9HjhFqeffgdh9q7h8E8D7Oj42cRKx1PyEzsVOOwtUHrAUOaK44/NG0Q3pFJd/LxdqZGiVDk=
X-Received: by 2002:a63:4a4d:0:b0:401:9f40:26a7 with SMTP id
 j13-20020a634a4d000000b004019f4026a7mr6643951pgl.282.1654866170638; Fri, 10
 Jun 2022 06:02:50 -0700 (PDT)
MIME-Version: 1.0
References: 
 <956614aeb05d3f6377da58e713309ca12e2fffe9.1654704740.git.diego.sueiro@arm.com>
 <CADkTA4OSvLY2XXxBJepn=MPEXjFzWBjyHX85SrEvV6kZk+d7ug@mail.gmail.com>
 <AM6PR08MB346165205ECFDCB2835D14FE92A79@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB346165205ECFDCB2835D14FE92A79@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 Jun 2022 09:02:38 -0400
Message-ID: 
 <CADkTA4ModMHxtDWF=HJvwBr5dZ=w5pcw0C7DFQKD=Yt-f0B9BA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Fetch dependencies from github
 instead of googlesource to avoid rate-limit
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 13:02:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7367

On Thu, Jun 9, 2022 at 3:46 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> Hi Bruce,
>
> ________________________________
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: 08 June 2022 17:47
> To: Diego Sueiro <Diego.Sueiro@arm.com>
> Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org>; nd <nd@arm.com>
> Subject: Re: [meta-virtualization][PATCH] k3s: Fetch dependencies from gi=
thub instead of googlesource to avoid rate-limit
>
> On Wed, Jun 8, 2022 at 12:21 PM Diego Sueiro <diego.sueiro@arm.com> wrote=
:
> >
> > All repositories under https://go.googlesource.com/ have a mirror in
> > https://github.com.
> >
> > Fetching the dependencies from github is much faster and we avoid timeo=
uts due
> > to googlesource rate-limit.
> >
> > Reference: https://github.com/golang/go/issues/12933
>
> I've been working on updating k3s to the same format as nerdctl (with
> .inc files and better formatted dependencies), so let me finish that
> update, and then we can get this applied.
>
>
> Thanks. Do you have an ETA for it? Also, is it possible to have the same
> on kirkstone branch as well?
>

I'm working through the change now. I expect to have everything done
by next week.

Since it isn't a functional change or new features, I can definitely
put it on kirkstone at the same time as master.

Bruce

> I'll also need to teach my generation script to make that mapping, as
> it would otherwise be lost on upgrades, as all of those locations are
> discovered via the go infrastructure.
>
> One more question, as the non-linebroken relocation sites is super
> hard to read diffs (which is why I reformatted it), I assume you are
> mapping those github sites back to the googlesource location in the
> relocation step, so that go finds it, and doesn't fetch ?
>
> Yes, I've replaced in there as well (using sed and checking with grep).
> I have tested this change on both master and kikstone branches from a cle=
anall.
>
> There is a k3s runtime issue in master (which predates this proposed chan=
ge) which
> we will look in the upcoming days.
>
> --
> Diego Sueiro
>
>
> >
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > ---
> >  recipes-containers/k3s/k3s_git.bb | 62 +++++++++++++++----------------
> >  1 file changed, 31 insertions(+), 31 deletions(-)
> >
> > diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s=
/k3s_git.bb
> > index a20092c..4f109ad 100644
> > --- a/recipes-containers/k3s/k3s_git.bb
> > +++ b/recipes-containers/k3s/k3s_git.bb
> > @@ -2238,79 +2238,79 @@ SRCREV_zap=3D"2908d3000567b86f0b7f1e99cc6bc5c9f=
30d43a0"
> >  SRC_URI +=3D "git://github.com/uber-go/zap;name=3Dzap;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber=
.org/zap"
> >
> >  # golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
> > -# [1] git ls-remote https://go.googlesource.com/crypto 5ea612d1eb830b3=
8bc4e914e37f55311eb58adce
> > +# [1] git ls-remote https://github.com/golang/crypto 5ea612d1eb830b38b=
c4e914e37f55311eb58adce
> >  SRCREV_crypto=3D"5ea612d1eb830b38bc4e914e37f55311eb58adce"
> > -SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/crypto"
> > +SRC_URI +=3D "git://github.com/golang/crypto;name=3Dcrypto;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/crypto"
> >
> >  # golang.org/x/exp v0.0.0-20210220032938-85be41e4509f
> > -# [1] git ls-remote https://go.googlesource.com/exp 85be41e4509f417cbf=
99006a027aef75deb8afd1
> > +# [1] git ls-remote https://github.com/golang/exp 85be41e4509f417cbf99=
006a027aef75deb8afd1
> >  SRCREV_exp=3D"85be41e4509f417cbf99006a027aef75deb8afd1"
> > -SRC_URI +=3D "git://go.googlesource.com/exp;name=3Dexp;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/exp"
> > +SRC_URI +=3D "git://github.com/golang/exp;name=3Dexp;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/exp"
> >
> >  # golang.org/x/image v0.0.0-20190802002840-cff245a6509b
> > -# [1] git ls-remote https://go.googlesource.com/image cff245a6509b8c4d=
e022d0d5b9037c503c5989d6
> > +# [1] git ls-remote https://github.com/golang/image cff245a6509b8c4de0=
22d0d5b9037c503c5989d6
> >  SRCREV_image=3D"cff245a6509b8c4de022d0d5b9037c503c5989d6"
> > -SRC_URI +=3D "git://go.googlesource.com/image;name=3Dimage;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/image"
> > +SRC_URI +=3D "git://github.com/golang/image;name=3Dimage;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/image"
> >
> >  # golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
> > -# [1] git ls-remote https://go.googlesource.com/lint 6edffad5e6160f594=
9cdefc81710b2706fbcd4f6
> > +# [1] git ls-remote https://github.com/golang/lint 6edffad5e6160f5949c=
defc81710b2706fbcd4f6
> >  SRCREV_lint=3D"6edffad5e6160f5949cdefc81710b2706fbcd4f6"
> > -SRC_URI +=3D "git://go.googlesource.com/lint;name=3Dlint;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/lint"
> > +SRC_URI +=3D "git://github.com/golang/lint;name=3Dlint;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/lint"
> >
> >  # golang.org/x/mobile v0.0.0-20201217150744-e6ae53a27f4f
> > -# [1] git ls-remote https://go.googlesource.com/mobile e6ae53a27f4fd7c=
fa2943f2ae47b96cba8eb01c9
> > +# [1] git ls-remote https://github.com/golang/mobile e6ae53a27f4fd7cfa=
2943f2ae47b96cba8eb01c9
> >  SRCREV_mobile=3D"e6ae53a27f4fd7cfa2943f2ae47b96cba8eb01c9"
> > -SRC_URI +=3D "git://go.googlesource.com/mobile;name=3Dmobile;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/mobile"
> > +SRC_URI +=3D "git://github.com/golang/mobile;name=3Dmobile;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/mobile"
> >
> >  # golang.org/x/mod v0.5.1
> > -# [1] git ls-remote https://go.googlesource.com/mod 49f84bccfd3469cb30=
95201f7855641bcc8eb49a
> > +# [1] git ls-remote https://github.com/golang/mod 49f84bccfd3469cb3095=
201f7855641bcc8eb49a
> >  SRCREV_mod=3D"49f84bccfd3469cb3095201f7855641bcc8eb49a"
> > -SRC_URI +=3D "git://go.googlesource.com/mod;name=3Dmod;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/mod"
> > +SRC_URI +=3D "git://github.com/golang/mod;name=3Dmod;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/mod"
> >
> >  # golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4
> > -# [1] git ls-remote https://go.googlesource.com/net a5a99cb37ef4b68617=
775ab669177656090ab396
> > +# [1] git ls-remote https://github.com/golang/net a5a99cb37ef4b6861777=
5ab669177656090ab396
> >  SRCREV_net=3D"a5a99cb37ef4b68617775ab669177656090ab396"
> > -SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/net"
> > +SRC_URI +=3D "git://github.com/golang/net;name=3Dnet;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/net"
> >
> >  # golang.org/x/oauth2 v0.0.0-20211104180415-d3ed0bb246c8
> > -# [1] git ls-remote https://go.googlesource.com/oauth2 d3ed0bb246c8d3c=
75b63937d9a5eecff9c74d7fe
> > +# [1] git ls-remote https://github.com/golang/oauth2 d3ed0bb246c8d3c75=
b63937d9a5eecff9c74d7fe
> >  SRCREV_oauth2=3D"d3ed0bb246c8d3c75b63937d9a5eecff9c74d7fe"
> > -SRC_URI +=3D "git://go.googlesource.com/oauth2;name=3Doauth2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/oauth2"
> > +SRC_URI +=3D "git://github.com/golang/oauth2;name=3Doauth2;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/oauth2"
> >
> >  # golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
> > -# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0ddf1=
93dd5a34e034151da389d09
> > +# [1] git ls-remote https://github.com/golang/sync 036812b2e83c0ddf193=
dd5a34e034151da389d09
> >  SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
> > -SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/sync"
> > +SRC_URI +=3D "git://github.com/golang/sync;name=3Dsync;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/sync"
> >
> >  # golang.org/x/sys v0.0.0-20210831042530-f4d43177bf5e
> > -# [1] git ls-remote https://go.googlesource.com/sys f4d43177bf5e2ee986=
17956e417d0555d4b69c17
> > +# [1] git ls-remote https://github.com/golang/sys f4d43177bf5e2ee98617=
956e417d0555d4b69c17
> >  SRCREV_sys=3D"f4d43177bf5e2ee98617956e417d0555d4b69c17"
> > -SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/sys"
> > +SRC_URI +=3D "git://github.com/golang/sys;name=3Dsys;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/sys"
> >
> >  # golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d
> > -# [1] git ls-remote https://go.googlesource.com/term 6a3ed077a48de7162=
1ad530f9078fffa0bc0ce32
> > +# [1] git ls-remote https://github.com/golang/term 6a3ed077a48de71621a=
d530f9078fffa0bc0ce32
> >  SRCREV_term1=3D"6a3ed077a48de71621ad530f9078fffa0bc0ce32"
> > -SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm1;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.=
googlesource.com/term"
> > +SRC_URI +=3D "git://github.com/golang/term;name=3Dterm1;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/golang/term"
> >
> >  # golang.org/x/text v0.3.7
> > -# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f883d=
229d707172ed356727aae99
> > +# [1] git ls-remote https://github.com/golang/text 3cd4007149f3f883d22=
9d707172ed356727aae99
> >  SRCREV_text1=3D"3cd4007149f3f883d229d707172ed356727aae99"
> > -SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext1;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.=
googlesource.com/text"
> > +SRC_URI +=3D "git://github.com/golang/text;name=3Dtext1;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/golang/text"
> >
> >  # golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac
> > -# [1] git ls-remote https://go.googlesource.com/time 1f47c861a9ac5a6e7=
645609f91b895398ff31642
> > +# [1] git ls-remote https://github.com/golang/time 1f47c861a9ac5a6e764=
5609f91b895398ff31642
> >  SRCREV_time=3D"1f47c861a9ac5a6e7645609f91b895398ff31642"
> > -SRC_URI +=3D "git://go.googlesource.com/time;name=3Dtime;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/time"
> > +SRC_URI +=3D "git://github.com/golang/time;name=3Dtime;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/time"
> >
> >  # golang.org/x/tools v0.1.8
> > -# [1] git ls-remote https://go.googlesource.com/tools e212aff8fd146c44=
ddb0167c1dfbd5531d6c9213
> > +# [1] git ls-remote https://github.com/golang/tools e212aff8fd146c44dd=
b0167c1dfbd5531d6c9213
> >  SRCREV_tools=3D"e212aff8fd146c44ddb0167c1dfbd5531d6c9213"
> > -SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/tools"
> > +SRC_URI +=3D "git://github.com/golang/tools;name=3Dtools;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/tools"
> >
> >  # golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
> > -# [1] git ls-remote https://go.googlesource.com/xerrors 5ec99f83aff198=
f5fbd629d6c8d8eb38a04218ca
> > +# [1] git ls-remote https://github.com/golang/xerrors 5ec99f83aff198f5=
fbd629d6c8d8eb38a04218ca
> >  SRCREV_xerrors=3D"5ec99f83aff198f5fbd629d6c8d8eb38a04218ca"
> > -SRC_URI +=3D "git://go.googlesource.com/xerrors;name=3Dxerrors;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/go.googlesource.com/xerrors"
> > +SRC_URI +=3D "git://github.com/golang/xerrors;name=3Dxerrors;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/xerrors"
> >
> >  # golang.zx2c4.com/go118/netip v0.0.0-20211111135330-a4a02eeacf9d
> >  # [1] git ls-remote https://git.zx2c4.com/go118-netip a4a02eeacf9d4956=
6df85e8cff878e5527e51779
> > @@ -2633,7 +2633,7 @@ do_compile() {
> >
> >          cd ${S}/src/import
> >
> > -        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.org/be=
rtimus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/go:g=
ithub.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:github.co=
m/googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/datasto=
re:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.google.c=
om/go/firestore:github.com/googleapis/google-cloud-go/bigquery//firestore c=
loud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquery//p=
ubsub cloud.google.com/go/storage:github.com/googleapis/google-cloud-go/big=
query//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mtl gi=
thub.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skylar/ex=
celize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for-go =
github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Azure/=
go-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/autor=
est:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go-aut=
orest/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/adal gi=
thub.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/autor=
est//autorest/date github.com/Azure/go-autorest/autorest/mocks:github.com/A=
zure/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/auto=
rest/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/Azure=
/go-autorest/autorest/validation:github.com/Azure/go-autorest/autorest//aut=
orest/validation github.com/Azure/go-autorest/logger:github.com/Azure/go-au=
torest/autorest//logger github.com/Azure/go-autorest/tracing:github.com/Azu=
re/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/Burn=
tSushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.com/=
GoogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k8s-c=
loud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_pdh g=
ithub.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com/Mic=
rosoft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcsshim:=
github.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/NYTi=
mes/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash githu=
b.com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/Puerkit=
oBio/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc:git=
hub.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/retry =
github.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.com/=
ajstarks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:githu=
b.com/alecthomas/template github.com/alecthomas/units:github.com/alecthomas=
/units github.com/alexflint/go-filemutex:github.com/alexflint/go-filemutex =
github.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalholm/=
cascadia:github.com/andybalholm/cascadia github.com/antihax/optional:github=
.com/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf git=
hub.com/armon/consul-api:github.com/armon/consul-api github.com/armon/go-me=
trics:github.com/armon/go-metrics github.com/armon/go-radix:github.com/armo=
n/go-radix github.com/asaskevich/govalidator:github.com/asaskevich/govalida=
tor github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middleware g=
ithub.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohnson/c=
lock:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/beorn7=
/perks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github.com=
/bits-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bketel=
sen/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com/bla=
ng/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bronze1m=
an/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/buger=
/jsonparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:gith=
ub.com/canonical/go-dqlite github.com/census-instrumentation/opencensus-pro=
to:github.com/census-instrumentation/opencensus-proto github.com/certifi/go=
certifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.com/c=
espare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 git=
hub.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/check=
point-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 github.co=
m/cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com/chz=
yer/logex github.com/chzyer/readline:github.com/chzyer/readline github.com/=
chzyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/cilium=
/ebpf github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs/kub=
e-router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-go gi=
thub.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachdb/da=
tadriven:github.com/cockroachdb/datadriven github.com/cockroachdb/errors:gi=
thub.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/cockr=
oachdb/logtags github.com/container-storage-interface/spec:github.com/conta=
iner-storage-interface/spec github.com/containerd/aufs:github.com/container=
d/aufs github.com/containerd/btrfs:github.com/containerd/btrfs github.com/c=
ontainerd/cgroups:github.com/containerd/cgroups github.com/containerd/conso=
le:github.com/containerd/console github.com/containerd/containerd:github.co=
m/containerd/containerd github.com/containerd/continuity:github.com/contain=
erd/continuity github.com/containerd/fifo:github.com/containerd/fifo github=
.com/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-overl=
ayfs-snapshotter github.com/containerd/go-cni:github.com/containerd/go-cni =
github.com/containerd/go-runc:github.com/containerd/go-runc github.com/cont=
ainerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nri:gi=
thub.com/containerd/nri github.com/containerd/stargz-snapshotter:github.com=
/containerd/stargz-snapshotter github.com/containerd/stargz-snapshotter/est=
argz:github.com/containerd/stargz-snapshotter//estargz github.com/container=
d/ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:github.co=
m/containerd/typeurl github.com/containerd/zfs:github.com/containerd/zfs gi=
thub.com/containernetworking/cni:github.com/containernetworking/cni github.=
com/containernetworking/plugins:github.com/containernetworking/plugins gith=
ub.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/coredn=
s/caddy:github.com/coredns/caddy github.com/coredns/corefile-migration:gith=
ub.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/coreos=
/bbolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/go-i=
ptables:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.com/=
coreos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver gith=
ub.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos/go-=
systemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:github.c=
om/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-md2ma=
n/v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/filepath=
-securejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:gith=
ub.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client gith=
ub.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardwaread=
dr:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com/dan=
ieljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew githu=
b.com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext github.c=
om/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrijalva/=
jwt-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.com/dg=
ryski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 githu=
b.com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:github.c=
om/docker/cli github.com/docker/distribution:github.com/docker/distribution=
 github.com/docker/docker:github.com/docker/docker github.com/docker/docker=
-credential-helpers:github.com/docker/docker-credential-helpers github.com/=
docker/go-connections:github.com/docker/go-connections github.com/docker/go=
-events:github.com/docker/go-events github.com/docker/go-metrics:github.com=
/docker/go-metrics github.com/docker/go-units:github.com/docker/go-units gi=
thub.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin/go-=
humanize:github.com/dustin/go-humanize github.com/dustmop/soup:github.com/d=
ustmop/soup github.com/eapache/channels:github.com/eapache/channels github.=
com/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:githu=
b.com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emicklei/go=
-restful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/go-co=
ntrol-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoyproxy=
/protoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubbelbo=
er/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser git=
hub.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/exponen=
t-io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-promise=
:github.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fatih/=
camelcase github.com/fatih/color:github.com/fatih/color github.com/felixge/=
httpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:github=
.com/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-shlex=
 github.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss/jwt=
-go:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:github.co=
m/frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/fsnot=
ify github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.com/=
getsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml:git=
hub.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo git=
hub.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.com/g=
o-errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:github.co=
m/go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3/glf=
w//v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-kit/=
kit:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log githu=
b.com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/logr:=
github.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr git=
hub.com/go-openapi/analysis:github.com/go-openapi/analysis github.com/go-op=
enapi/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpointer=
:github.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:gith=
ub.com/go-openapi/jsonreference github.com/go-openapi/loads:github.com/go-o=
penapi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtime gi=
thub.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-openapi/s=
trfmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.com/go=
-openapi/swag github.com/go-openapi/validate:github.com/go-openapi/validate=
 github.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation gith=
ub.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go-sta=
ck/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:github.com=
/go-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep github.=
com/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:github.co=
m/godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.co=
m/gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/gofrs=
/uuid github.com/gogo/googleapis:github.com/gogo/googleapis github.com/gogo=
/protobuf:github.com/gogo/protobuf github.com/golang/freetype:github.com/go=
lang/freetype github.com/golang/glog:github.com/golang/glog github.com/gola=
ng/groupcache:github.com/golang/groupcache github.com/golang/mock:github.co=
m/golang/mock github.com/golang/protobuf:github.com/golang/protobuf github.=
com/golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:gith=
ub.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus/fmt=
 github.com/golangplus/testing:github.com/golangplus/testing github.com/goo=
gle/btree:github.com/google/btree github.com/google/cadvisor:github.com/goo=
gle/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.com/g=
oogle/go-containerregistry:github.com/google/go-containerregistry github.co=
m/google/gofuzz:github.com/google/gofuzz github.com/google/martian:github.c=
om/google/martian github.com/google/martian/v3:github.com/google/martian/v3=
 github.com/google/pprof:github.com/google/pprof github.com/google/renameio=
:github.com/google/renameio github.com/google/shlex:github.com/google/shlex=
 github.com/google/uuid:github.com/google/uuid github.com/googleapis/gax-go=
/v2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:githu=
b.com/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/goph=
ercloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/gopher=
js github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/websock=
et:github.com/gorilla/websocket github.com/gregjones/httpcache:github.com/g=
regjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.com/=
grpc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-prometh=
eus:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosystem/=
grpc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/go-fu=
se/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:github.c=
om/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com/has=
hicorp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicorp/er=
rwrap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp g=
ithub.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/hashi=
corp/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.com/=
hashicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashicorp/g=
o-multierror:github.com/hashicorp/go-multierror github.com/hashicorp/go-ret=
ryablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/go-ro=
otcerts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-sockaddr:=
github.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.com/=
hashicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/go-uu=
id github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/hashi=
corp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hcl:gi=
thub.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashicorp/l=
ogutils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/hash=
icorp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/serf:=
github.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/heketi=
 github.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tail:gi=
thub.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelgupf/=
socketpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor/dem=
angle github.com/imdario/mergo:github.com/imdario/mergo github.com/inconshr=
eveable/mousetrap:github.com/inconshreveable/mousetrap github.com/insomniac=
slk/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:github.c=
om/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping gith=
ub.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespath/g=
o-jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmespath/=
internal/testify:github.com/jmespath/go-jmespath/internal/testify//internal=
/testify github.com/joho/godotenv:github.com/joho/godotenv github.com/jonbo=
ulle/clockwork:github.com/jonboulle/clockwork github.com/josharian/intern:g=
ithub.com/josharian/intern github.com/josharian/native:github.com/josharian=
/native github.com/jpillora/backoff:github.com/jpillora/backoff github.com/=
jsimonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-iterat=
or/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report:githu=
b.com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/gls =
github.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter git=
hub.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/crit=
bitgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:github.=
com/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kine gi=
thub.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisielk/=
errcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.com/k=
isielk/gotool github.com/klauspost/compress:github.com/klauspost/compress g=
ithub.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsorten/g=
o-windows-terminal-sequences:github.com/konsorten/go-windows-terminal-seque=
nces github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/kr/l=
ogfmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:github.co=
m/kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-sigs/c=
ri-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/godebug=
:github.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq github.c=
om/libopenstorage/openstorage:github.com/libopenstorage/openstorage github.=
com/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer/ded=
ent:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpabon/g=
odbc github.com/magiconair/properties:github.com/magiconair/properties gith=
ub.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-color=
able:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.com/ma=
ttn/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewidth g=
ithub.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com/mat=
tn/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_prot=
obuf_extensions:github.com/matttproud/golang_protobuf_extensions github.com=
/mdlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/ethtool=
:github.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/mdlay=
her/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink githu=
b.com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:githu=
b.com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.com/=
miekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.com/mi=
kioh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml githu=
b.com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-go/v7=
:github.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/minio=
/sha256-simd github.com/minio/sio:github.com/minio/sio github.com/mistifyio=
/go-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com/mit=
chellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir =
github.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testing-i=
nterface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordwrap =
github.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/ioch=
an:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:github.com=
/mitchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs github.co=
m/moby/locker:github.com/moby/locker github.com/moby/spdystream:github.com/=
moby/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo=
//mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//syml=
ink github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:github=
.com/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/concu=
rrent github.com/modern-go/reflect2:github.com/modern-go/reflect2 github.co=
m/mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go-git=
ignore:github.com/monochromegane/go-gitignore github.com/morikuni/aec:githu=
b.com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fileutil=
s github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/mvda=
n/xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.com/m=
witkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowrate g=
ithub.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.com/n=
iemeyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.com/=
nxadm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/olekukonk=
o/tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:gith=
ub.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github.com=
/opencontainers/go-digest:github.com/opencontainers/go-digest github.com/op=
encontainers/image-spec:github.com/opencontainers/image-spec github.com/ope=
ncontainers/runc:github.com/opencontainers/runc github.com/opencontainers/r=
untime-spec:github.com/opencontainers/runtime-spec github.com/opencontainer=
s/selinux:github.com/opencontainers/selinux github.com/opentracing/opentrac=
ing-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:github.c=
om/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.com/ot=
iai10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/otiai=
10/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.com/=
paulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com/pbo=
rman/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-buffru=
neio github.com/pelletier/go-toml:github.com/pelletier/go-toml github.com/p=
eterbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:gith=
ub.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.com/p=
kg/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pmezar=
d/go-difflib github.com/posener/complete:github.com/posener/complete github=
.com/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/promet=
heus/client_golang:github.com/prometheus/client_golang github.com/prometheu=
s/client_model:github.com/prometheus/client_model github.com/prometheus/com=
mon:github.com/prometheus/common github.com/prometheus/procfs:github.com/pr=
ometheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb githu=
b.com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:githu=
b.com/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher/dyn=
amiclistener github.com/rancher/lasso:github.com/rancher/lasso github.com/r=
ancher/remotedialer:github.com/rancher/remotedialer github.com/rancher/whar=
fie:github.com/rancher/wharfie github.com/rancher/wrangler:github.com/ranch=
er/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/bigf=
ft github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpeppe/=
fastuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:githu=
b.com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:githu=
b.com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/xid g=
ithub.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/blac=
kfriday:github.com/russross/blackfriday github.com/russross/blackfriday/v2:=
github.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github.com=
/ryanuber/columnize github.com/safchain/ethtool:github.com/safchain/ethtool=
 github.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/seed:=
github.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/secco=
mp/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff gith=
ub.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_anchor_=
name github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/smart=
ystreets/assertions:github.com/smartystreets/assertions github.com/smartyst=
reets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cmux:g=
ithub.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/water g=
ithub.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf13/a=
fero:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast git=
hub.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweatherm=
an:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com/spf=
13/pflag github.com/spf13/viper:github.com/spf13/viper github.com/stefanber=
ger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewer/go=
-strcase:github.com/stoewer/go-strcase github.com/storageos/go-api:github.c=
om/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx githu=
b.com/stretchr/testify:github.com/stretchr/testify github.com/subosito/gote=
nv:github.com/subosito/gotenv github.com/syndtr/gocapability:github.com/syn=
dtr/gocapability github.com/tchap/go-patricia:github.com/tchap/go-patricia =
github.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/tencent=
cloud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github.com=
/tmc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.com/u-=
root/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ugorji=
/go github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v2:gi=
thub.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negroni =
github.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vektah/g=
qlparser:github.com/vektah/gqlparser github.com/vishvananda/netlink:github.=
com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishvananda=
/netns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/willf=
/bitset:github.com/willf/bitset github.com/xiang90/probing:github.com/xiang=
90/probing github.com/xlab/treeprint:github.com/xlab/treeprint github.com/x=
ordataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/goldm=
ark:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.io/e=
tcd:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/c=
lient/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/etcd/=
client/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/client/=
pkg/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/v3//=
raft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.io/e=
tcd/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/etcd=
utl/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3:git=
hub.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/pkcs=
7 go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.opentele=
metry.io/contrib go.opentelemetry.io/contrib/instrumentation/google.golang.=
org/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.golan=
g.org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/http/ot=
elhttp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp go.op=
entelemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/expor=
ters/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/otel=
/metric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/oteltest:=
go.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.opentele=
metry.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.openteleme=
try.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.opent=
elemetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opentelemetr=
y.io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemetry/o=
pentelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/starlark=
-go go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.org/go=
leak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.org/=
zap golang.org/x/crypto:go.googlesource.com/crypto golang.org/x/exp:go.goog=
lesource.com/exp golang.org/x/image:go.googlesource.com/image golang.org/x/=
lint:go.googlesource.com/lint golang.org/x/mobile:go.googlesource.com/mobil=
e golang.org/x/mod:go.googlesource.com/mod golang.org/x/net:go.googlesource=
.com/net golang.org/x/oauth2:go.googlesource.com/oauth2 golang.org/x/sync:g=
o.googlesource.com/sync golang.org/x/sys:go.googlesource.com/sys golang.org=
/x/term:go.googlesource.com/term golang.org/x/text:go.googlesource.com/text=
 golang.org/x/time:go.googlesource.com/time golang.org/x/tools:go.googlesou=
rce.com/tools golang.org/x/xerrors:go.googlesource.com/xerrors golang.zx2c4=
.com/go118/netip:golang.zx2c4.com/go118/netip golang.zx2c4.com/wintun:golan=
g.zx2c4.com/wintun golang.zx2c4.com/wireguard:golang.zx2c4.com/wireguard go=
lang.zx2c4.com/wireguard/wgctrl:golang.zx2c4.com/wireguard/wgctrl gonum.org=
/v1/gonum:github.com/gonum/gonum gonum.org/v1/netlib:github.com/gonum/netli=
b gonum.org/v1/plot:github.com/gonum/plot google.golang.org/api:google.gola=
ng.org/api google.golang.org/appengine:google.golang.org/appengine google.g=
olang.org/genproto:google.golang.org/genproto google.golang.org/grpc:google=
.golang.org/grpc google.golang.org/grpc/cmd/protoc-gen-go-grpc:google.golan=
g.org/grpc/cmd/protoc-gen-go-grpc google.golang.org/protobuf:google.golang.=
org/protobuf gopkg.in/airbrake/gobrake.v2:gopkg.in/airbrake/gobrake.v2 gopk=
g.in/alecthomas/kingpin.v2:gopkg.in/alecthomas/kingpin.v2 gopkg.in/check.v1=
:gopkg.in/check.v1 gopkg.in/cheggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.in=
/errgo.v2:gopkg.in/errgo.v2 gopkg.in/fsnotify.v1:gopkg.in/fsnotify.v1 gopkg=
.in/gcfg.v1:gopkg.in/gcfg.v1 gopkg.in/gemnasium/logrus-airbrake-hook.v2:gop=
kg.in/gemnasium/logrus-airbrake-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 gop=
kg.in/ini.v1:gopkg.in/ini.v1 gopkg.in/natefinch/lumberjack.v2:gopkg.in/nate=
finch/lumberjack.v2 gopkg.in/resty.v1:gopkg.in/resty.v1 gopkg.in/square/go-=
jose.v2:gopkg.in/square/go-jose.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopkg.=
in/warnings.v0:gopkg.in/warnings.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gopkg=
.in/yaml.v3:gopkg.in/yaml.v3 gotest.tools:gotest.tools gotest.tools/v3:gith=
ub.com/gotestyourself/gotest.tools/v3 honnef.co/go/tools:honnef.co/go/tools=
 inet.af/tcpproxy:inet.af/tcpproxy k8s.io/api:github.com/k3s-io/kubernetes/=
staging/src/k8s.io/api//staging/src/k8s.io/api k8s.io/apiextensions-apiserv=
er:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/=
apiextensions-apiserver k8s.io/apimachinery:github.com/k3s-io/kubernetes/st=
aging/src/k8s.io/api//staging/src/k8s.io/apimachinery k8s.io/apiserver:gith=
ub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/apiserv=
er k8s.io/cli-runtime:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//=
staging/src/k8s.io/cli-runtime k8s.io/client-go:github.com/k3s-io/kubernete=
s/staging/src/k8s.io/api//staging/src/k8s.io/client-go k8s.io/cloud-provide=
r:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/c=
loud-provider k8s.io/cluster-bootstrap:github.com/k3s-io/kubernetes/staging=
/src/k8s.io/api//staging/src/k8s.io/cluster-bootstrap k8s.io/code-generator=
:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/co=
de-generator k8s.io/component-base:github.com/k3s-io/kubernetes/staging/src=
/k8s.io/api//staging/src/k8s.io/component-base k8s.io/component-helpers:git=
hub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/compon=
ent-helpers k8s.io/controller-manager:github.com/k3s-io/kubernetes/staging/=
src/k8s.io/api//staging/src/k8s.io/controller-manager k8s.io/cri-api:github=
.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cri-api k=
8s.io/csi-translation-lib:github.com/k3s-io/kubernetes/staging/src/k8s.io/a=
pi//staging/src/k8s.io/csi-translation-lib k8s.io/kube-aggregator:github.co=
m/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-aggrega=
tor k8s.io/kube-controller-manager:github.com/k3s-io/kubernetes/staging/src=
/k8s.io/api//staging/src/k8s.io/kube-controller-manager k8s.io/kube-proxy:g=
ithub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube=
-proxy k8s.io/kube-scheduler:github.com/k3s-io/kubernetes/staging/src/k8s.i=
o/api//staging/src/k8s.io/kube-scheduler k8s.io/kubectl:github.com/k3s-io/k=
ubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kubectl k8s.io/kubelet=
:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/ku=
belet k8s.io/kubernetes:github.com/k3s-io/kubernetes/staging/src/k8s.io/api=
 k8s.io/legacy-cloud-providers:github.com/k3s-io/kubernetes/staging/src/k8s=
.io/api//staging/src/k8s.io/legacy-cloud-providers k8s.io/metrics:github.co=
m/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/metrics k8s.=
io/mount-utils:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging=
/src/k8s.io/mount-utils k8s.io/pod-security-admission:github.com/k3s-io/kub=
ernetes/staging/src/k8s.io/api//staging/src/k8s.io/pod-security-admission k=
8s.io/sample-apiserver:github.com/k3s-io/kubernetes/staging/src/k8s.io/api/=
/staging/src/k8s.io/sample-apiserver k8s.io/gengo:k8s.io/gengo k8s.io/klog:=
k8s.io/klog k8s.io/klog/v2:github.com/k3s-io/klog/v2 k8s.io/kube-openapi:k8=
s.io/kube-openapi k8s.io/system-validators:k8s.io/system-validators k8s.io/=
utils:k8s.io/utils modernc.org/cc:modernc.org/cc modernc.org/golex:modernc.=
org/golex modernc.org/mathutil:modernc.org/mathutil modernc.org/strutil:mod=
ernc.org/strutil modernc.org/xc:modernc.org/xc rsc.io/binaryregexp:rsc.io/b=
inaryregexp rsc.io/pdf:rsc.io/pdf rsc.io/quote/v3:github.com/rsc/quote/v3//=
v3 rsc.io/sampler:rsc.io/sampler sigs.k8s.io/apiserver-network-proxy/konnec=
tivity-client:github.com/kubernetes-sigs/apiserver-network-proxy/konnectivi=
ty-client//konnectivity-client sigs.k8s.io/cli-utils:sigs.k8s.io/cli-utils =
sigs.k8s.io/controller-runtime:sigs.k8s.io/controller-runtime sigs.k8s.io/k=
ustomize/api:github.com/kubernetes-sigs/kustomize/api//api sigs.k8s.io/kust=
omize/cmd/config:github.com/kubernetes-sigs/kustomize/api//cmd/config sigs.=
k8s.io/kustomize/kustomize/v4:github.com/kubernetes-sigs/kustomize/api//kus=
tomize sigs.k8s.io/kustomize/kyaml:github.com/kubernetes-sigs/kustomize/api=
//kyaml sigs.k8s.io/structured-merge-diff/v4:github.com/kubernetes-sigs/str=
uctured-merge-diff/v4 sigs.k8s.io/testing_frameworks:sigs.k8s.io/testing_fr=
ameworks sigs.k8s.io/yaml:sigs.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.io/jso=
n"
> > +        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.org/be=
rtimus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/go:g=
ithub.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:github.co=
m/googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/datasto=
re:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.google.c=
om/go/firestore:github.com/googleapis/google-cloud-go/bigquery//firestore c=
loud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquery//p=
ubsub cloud.google.com/go/storage:github.com/googleapis/google-cloud-go/big=
query//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mtl gi=
thub.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skylar/ex=
celize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for-go =
github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Azure/=
go-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/autor=
est:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go-aut=
orest/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/adal gi=
thub.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/autor=
est//autorest/date github.com/Azure/go-autorest/autorest/mocks:github.com/A=
zure/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/auto=
rest/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/Azure=
/go-autorest/autorest/validation:github.com/Azure/go-autorest/autorest//aut=
orest/validation github.com/Azure/go-autorest/logger:github.com/Azure/go-au=
torest/autorest//logger github.com/Azure/go-autorest/tracing:github.com/Azu=
re/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/Burn=
tSushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.com/=
GoogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k8s-c=
loud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_pdh g=
ithub.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com/Mic=
rosoft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcsshim:=
github.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/NYTi=
mes/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash githu=
b.com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/Puerkit=
oBio/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc:git=
hub.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/retry =
github.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.com/=
ajstarks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:githu=
b.com/alecthomas/template github.com/alecthomas/units:github.com/alecthomas=
/units github.com/alexflint/go-filemutex:github.com/alexflint/go-filemutex =
github.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalholm/=
cascadia:github.com/andybalholm/cascadia github.com/antihax/optional:github=
.com/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf git=
hub.com/armon/consul-api:github.com/armon/consul-api github.com/armon/go-me=
trics:github.com/armon/go-metrics github.com/armon/go-radix:github.com/armo=
n/go-radix github.com/asaskevich/govalidator:github.com/asaskevich/govalida=
tor github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middleware g=
ithub.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohnson/c=
lock:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/beorn7=
/perks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github.com=
/bits-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bketel=
sen/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com/bla=
ng/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bronze1m=
an/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/buger=
/jsonparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:gith=
ub.com/canonical/go-dqlite github.com/census-instrumentation/opencensus-pro=
to:github.com/census-instrumentation/opencensus-proto github.com/certifi/go=
certifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.com/c=
espare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 git=
hub.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/check=
point-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 github.co=
m/cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com/chz=
yer/logex github.com/chzyer/readline:github.com/chzyer/readline github.com/=
chzyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/cilium=
/ebpf github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs/kub=
e-router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-go gi=
thub.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachdb/da=
tadriven:github.com/cockroachdb/datadriven github.com/cockroachdb/errors:gi=
thub.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/cockr=
oachdb/logtags github.com/container-storage-interface/spec:github.com/conta=
iner-storage-interface/spec github.com/containerd/aufs:github.com/container=
d/aufs github.com/containerd/btrfs:github.com/containerd/btrfs github.com/c=
ontainerd/cgroups:github.com/containerd/cgroups github.com/containerd/conso=
le:github.com/containerd/console github.com/containerd/containerd:github.co=
m/containerd/containerd github.com/containerd/continuity:github.com/contain=
erd/continuity github.com/containerd/fifo:github.com/containerd/fifo github=
.com/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-overl=
ayfs-snapshotter github.com/containerd/go-cni:github.com/containerd/go-cni =
github.com/containerd/go-runc:github.com/containerd/go-runc github.com/cont=
ainerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nri:gi=
thub.com/containerd/nri github.com/containerd/stargz-snapshotter:github.com=
/containerd/stargz-snapshotter github.com/containerd/stargz-snapshotter/est=
argz:github.com/containerd/stargz-snapshotter//estargz github.com/container=
d/ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:github.co=
m/containerd/typeurl github.com/containerd/zfs:github.com/containerd/zfs gi=
thub.com/containernetworking/cni:github.com/containernetworking/cni github.=
com/containernetworking/plugins:github.com/containernetworking/plugins gith=
ub.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/coredn=
s/caddy:github.com/coredns/caddy github.com/coredns/corefile-migration:gith=
ub.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/coreos=
/bbolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/go-i=
ptables:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.com/=
coreos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver gith=
ub.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos/go-=
systemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:github.c=
om/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-md2ma=
n/v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/filepath=
-securejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:gith=
ub.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client gith=
ub.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardwaread=
dr:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com/dan=
ieljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew githu=
b.com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext github.c=
om/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrijalva/=
jwt-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.com/dg=
ryski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 githu=
b.com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:github.c=
om/docker/cli github.com/docker/distribution:github.com/docker/distribution=
 github.com/docker/docker:github.com/docker/docker github.com/docker/docker=
-credential-helpers:github.com/docker/docker-credential-helpers github.com/=
docker/go-connections:github.com/docker/go-connections github.com/docker/go=
-events:github.com/docker/go-events github.com/docker/go-metrics:github.com=
/docker/go-metrics github.com/docker/go-units:github.com/docker/go-units gi=
thub.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin/go-=
humanize:github.com/dustin/go-humanize github.com/dustmop/soup:github.com/d=
ustmop/soup github.com/eapache/channels:github.com/eapache/channels github.=
com/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:githu=
b.com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emicklei/go=
-restful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/go-co=
ntrol-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoyproxy=
/protoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubbelbo=
er/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser git=
hub.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/exponen=
t-io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-promise=
:github.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fatih/=
camelcase github.com/fatih/color:github.com/fatih/color github.com/felixge/=
httpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:github=
.com/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-shlex=
 github.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss/jwt=
-go:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:github.co=
m/frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/fsnot=
ify github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.com/=
getsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml:git=
hub.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo git=
hub.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.com/g=
o-errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:github.co=
m/go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3/glf=
w//v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-kit/=
kit:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log githu=
b.com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/logr:=
github.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr git=
hub.com/go-openapi/analysis:github.com/go-openapi/analysis github.com/go-op=
enapi/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpointer=
:github.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:gith=
ub.com/go-openapi/jsonreference github.com/go-openapi/loads:github.com/go-o=
penapi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtime gi=
thub.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-openapi/s=
trfmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.com/go=
-openapi/swag github.com/go-openapi/validate:github.com/go-openapi/validate=
 github.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation gith=
ub.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go-sta=
ck/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:github.com=
/go-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep github.=
com/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:github.co=
m/godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.co=
m/gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/gofrs=
/uuid github.com/gogo/googleapis:github.com/gogo/googleapis github.com/gogo=
/protobuf:github.com/gogo/protobuf github.com/golang/freetype:github.com/go=
lang/freetype github.com/golang/glog:github.com/golang/glog github.com/gola=
ng/groupcache:github.com/golang/groupcache github.com/golang/mock:github.co=
m/golang/mock github.com/golang/protobuf:github.com/golang/protobuf github.=
com/golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:gith=
ub.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus/fmt=
 github.com/golangplus/testing:github.com/golangplus/testing github.com/goo=
gle/btree:github.com/google/btree github.com/google/cadvisor:github.com/goo=
gle/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.com/g=
oogle/go-containerregistry:github.com/google/go-containerregistry github.co=
m/google/gofuzz:github.com/google/gofuzz github.com/google/martian:github.c=
om/google/martian github.com/google/martian/v3:github.com/google/martian/v3=
 github.com/google/pprof:github.com/google/pprof github.com/google/renameio=
:github.com/google/renameio github.com/google/shlex:github.com/google/shlex=
 github.com/google/uuid:github.com/google/uuid github.com/googleapis/gax-go=
/v2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:githu=
b.com/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/goph=
ercloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/gopher=
js github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/websock=
et:github.com/gorilla/websocket github.com/gregjones/httpcache:github.com/g=
regjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.com/=
grpc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-prometh=
eus:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosystem/=
grpc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/go-fu=
se/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:github.c=
om/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com/has=
hicorp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicorp/er=
rwrap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp g=
ithub.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/hashi=
corp/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.com/=
hashicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashicorp/g=
o-multierror:github.com/hashicorp/go-multierror github.com/hashicorp/go-ret=
ryablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/go-ro=
otcerts:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-sockaddr:=
github.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.com/=
hashicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/go-uu=
id github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/hashi=
corp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hcl:gi=
thub.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashicorp/l=
ogutils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/hash=
icorp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/serf:=
github.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/heketi=
 github.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tail:gi=
thub.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelgupf/=
socketpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor/dem=
angle github.com/imdario/mergo:github.com/imdario/mergo github.com/inconshr=
eveable/mousetrap:github.com/inconshreveable/mousetrap github.com/insomniac=
slk/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:github.c=
om/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping gith=
ub.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespath/g=
o-jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmespath/=
internal/testify:github.com/jmespath/go-jmespath/internal/testify//internal=
/testify github.com/joho/godotenv:github.com/joho/godotenv github.com/jonbo=
ulle/clockwork:github.com/jonboulle/clockwork github.com/josharian/intern:g=
ithub.com/josharian/intern github.com/josharian/native:github.com/josharian=
/native github.com/jpillora/backoff:github.com/jpillora/backoff github.com/=
jsimonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-iterat=
or/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report:githu=
b.com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/gls =
github.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter git=
hub.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/crit=
bitgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:github.=
com/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kine gi=
thub.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisielk/=
errcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.com/k=
isielk/gotool github.com/klauspost/compress:github.com/klauspost/compress g=
ithub.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsorten/g=
o-windows-terminal-sequences:github.com/konsorten/go-windows-terminal-seque=
nces github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/kr/l=
ogfmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:github.co=
m/kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-sigs/c=
ri-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/godebug=
:github.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq github.c=
om/libopenstorage/openstorage:github.com/libopenstorage/openstorage github.=
com/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer/ded=
ent:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpabon/g=
odbc github.com/magiconair/properties:github.com/magiconair/properties gith=
ub.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-color=
able:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.com/ma=
ttn/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewidth g=
ithub.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com/mat=
tn/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_prot=
obuf_extensions:github.com/matttproud/golang_protobuf_extensions github.com=
/mdlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/ethtool=
:github.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/mdlay=
her/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink githu=
b.com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:githu=
b.com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.com/=
miekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.com/mi=
kioh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml githu=
b.com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-go/v7=
:github.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/minio=
/sha256-simd github.com/minio/sio:github.com/minio/sio github.com/mistifyio=
/go-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com/mit=
chellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir =
github.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testing-i=
nterface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordwrap =
github.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/ioch=
an:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:github.com=
/mitchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs github.co=
m/moby/locker:github.com/moby/locker github.com/moby/spdystream:github.com/=
moby/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo=
//mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//syml=
ink github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:github=
.com/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/concu=
rrent github.com/modern-go/reflect2:github.com/modern-go/reflect2 github.co=
m/mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go-git=
ignore:github.com/monochromegane/go-gitignore github.com/morikuni/aec:githu=
b.com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fileutil=
s github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/mvda=
n/xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.com/m=
witkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowrate g=
ithub.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.com/n=
iemeyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.com/=
nxadm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/olekukonk=
o/tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:gith=
ub.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github.com=
/opencontainers/go-digest:github.com/opencontainers/go-digest github.com/op=
encontainers/image-spec:github.com/opencontainers/image-spec github.com/ope=
ncontainers/runc:github.com/opencontainers/runc github.com/opencontainers/r=
untime-spec:github.com/opencontainers/runtime-spec github.com/opencontainer=
s/selinux:github.com/opencontainers/selinux github.com/opentracing/opentrac=
ing-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:github.c=
om/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.com/ot=
iai10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/otiai=
10/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.com/=
paulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com/pbo=
rman/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-buffru=
neio github.com/pelletier/go-toml:github.com/pelletier/go-toml github.com/p=
eterbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:gith=
ub.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.com/p=
kg/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pmezar=
d/go-difflib github.com/posener/complete:github.com/posener/complete github=
.com/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/promet=
heus/client_golang:github.com/prometheus/client_golang github.com/prometheu=
s/client_model:github.com/prometheus/client_model github.com/prometheus/com=
mon:github.com/prometheus/common github.com/prometheus/procfs:github.com/pr=
ometheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb githu=
b.com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:githu=
b.com/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher/dyn=
amiclistener github.com/rancher/lasso:github.com/rancher/lasso github.com/r=
ancher/remotedialer:github.com/rancher/remotedialer github.com/rancher/whar=
fie:github.com/rancher/wharfie github.com/rancher/wrangler:github.com/ranch=
er/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/bigf=
ft github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpeppe/=
fastuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:githu=
b.com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:githu=
b.com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/xid g=
ithub.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/blac=
kfriday:github.com/russross/blackfriday github.com/russross/blackfriday/v2:=
github.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github.com=
/ryanuber/columnize github.com/safchain/ethtool:github.com/safchain/ethtool=
 github.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/seed:=
github.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/secco=
mp/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff gith=
ub.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_anchor_=
name github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/smart=
ystreets/assertions:github.com/smartystreets/assertions github.com/smartyst=
reets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cmux:g=
ithub.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/water g=
ithub.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf13/a=
fero:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast git=
hub.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweatherm=
an:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com/spf=
13/pflag github.com/spf13/viper:github.com/spf13/viper github.com/stefanber=
ger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewer/go=
-strcase:github.com/stoewer/go-strcase github.com/storageos/go-api:github.c=
om/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx githu=
b.com/stretchr/testify:github.com/stretchr/testify github.com/subosito/gote=
nv:github.com/subosito/gotenv github.com/syndtr/gocapability:github.com/syn=
dtr/gocapability github.com/tchap/go-patricia:github.com/tchap/go-patricia =
github.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/tencent=
cloud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github.com=
/tmc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.com/u-=
root/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ugorji=
/go github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v2:gi=
thub.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negroni =
github.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vektah/g=
qlparser:github.com/vektah/gqlparser github.com/vishvananda/netlink:github.=
com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishvananda=
/netns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/willf=
/bitset:github.com/willf/bitset github.com/xiang90/probing:github.com/xiang=
90/probing github.com/xlab/treeprint:github.com/xlab/treeprint github.com/x=
ordataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/goldm=
ark:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.io/e=
tcd:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/c=
lient/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/etcd/=
client/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/client/=
pkg/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/v3//=
raft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.io/e=
tcd/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/etcd=
utl/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3:git=
hub.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/pkcs=
7 go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.opentele=
metry.io/contrib go.opentelemetry.io/contrib/instrumentation/google.golang.=
org/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.golan=
g.org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/http/ot=
elhttp:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp go.op=
entelemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/expor=
ters/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/otel=
/metric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/oteltest:=
go.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.opentele=
metry.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.openteleme=
try.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.opent=
elemetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opentelemetr=
y.io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemetry/o=
pentelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/starlark=
-go go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.org/go=
leak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.org/=
zap golang.org/x/crypto:github.com/golang/crypto golang.org/x/exp:github.co=
m/golang/exp golang.org/x/image:github.com/golang/image golang.org/x/lint:g=
ithub.com/golang/lint golang.org/x/mobile:github.com/golang/mobile golang.o=
rg/x/mod:github.com/golang/mod golang.org/x/net:github.com/golang/net golan=
g.org/x/oauth2:github.com/golang/oauth2 golang.org/x/sync:github.com/golang=
/sync golang.org/x/sys:github.com/golang/sys golang.org/x/term:github.com/g=
olang/term golang.org/x/text:github.com/golang/text golang.org/x/time:githu=
b.com/golang/time golang.org/x/tools:github.com/golang/tools golang.org/x/x=
errors:github.com/golang/xerrors golang.zx2c4.com/go118/netip:golang.zx2c4.=
com/go118/netip golang.zx2c4.com/wintun:golang.zx2c4.com/wintun golang.zx2c=
4.com/wireguard:golang.zx2c4.com/wireguard golang.zx2c4.com/wireguard/wgctr=
l:golang.zx2c4.com/wireguard/wgctrl gonum.org/v1/gonum:github.com/gonum/gon=
um gonum.org/v1/netlib:github.com/gonum/netlib gonum.org/v1/plot:github.com=
/gonum/plot google.golang.org/api:google.golang.org/api google.golang.org/a=
ppengine:google.golang.org/appengine google.golang.org/genproto:google.gola=
ng.org/genproto google.golang.org/grpc:google.golang.org/grpc google.golang=
.org/grpc/cmd/protoc-gen-go-grpc:google.golang.org/grpc/cmd/protoc-gen-go-g=
rpc google.golang.org/protobuf:google.golang.org/protobuf gopkg.in/airbrake=
/gobrake.v2:gopkg.in/airbrake/gobrake.v2 gopkg.in/alecthomas/kingpin.v2:gop=
kg.in/alecthomas/kingpin.v2 gopkg.in/check.v1:gopkg.in/check.v1 gopkg.in/ch=
eggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.in/errgo.v2:gopkg.in/errgo.v2 go=
pkg.in/fsnotify.v1:gopkg.in/fsnotify.v1 gopkg.in/gcfg.v1:gopkg.in/gcfg.v1 g=
opkg.in/gemnasium/logrus-airbrake-hook.v2:gopkg.in/gemnasium/logrus-airbrak=
e-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 gopkg.in/ini.v1:gopkg.in/ini.v1 g=
opkg.in/natefinch/lumberjack.v2:gopkg.in/natefinch/lumberjack.v2 gopkg.in/r=
esty.v1:gopkg.in/resty.v1 gopkg.in/square/go-jose.v2:gopkg.in/square/go-jos=
e.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopkg.in/warnings.v0:gopkg.in/warnin=
gs.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gopkg.in/yaml.v3:gopkg.in/yaml.v3 g=
otest.tools:gotest.tools gotest.tools/v3:github.com/gotestyourself/gotest.t=
ools/v3 honnef.co/go/tools:honnef.co/go/tools inet.af/tcpproxy:inet.af/tcpp=
roxy k8s.io/api:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//stagin=
g/src/k8s.io/api k8s.io/apiextensions-apiserver:github.com/k3s-io/kubernete=
s/staging/src/k8s.io/api//staging/src/k8s.io/apiextensions-apiserver k8s.io=
/apimachinery:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/=
src/k8s.io/apimachinery k8s.io/apiserver:github.com/k3s-io/kubernetes/stagi=
ng/src/k8s.io/api//staging/src/k8s.io/apiserver k8s.io/cli-runtime:github.c=
om/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cli-runtime=
 k8s.io/client-go:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//stag=
ing/src/k8s.io/client-go k8s.io/cloud-provider:github.com/k3s-io/kubernetes=
/staging/src/k8s.io/api//staging/src/k8s.io/cloud-provider k8s.io/cluster-b=
ootstrap:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k=
8s.io/cluster-bootstrap k8s.io/code-generator:github.com/k3s-io/kubernetes/=
staging/src/k8s.io/api//staging/src/k8s.io/code-generator k8s.io/component-=
base:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.i=
o/component-base k8s.io/component-helpers:github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/api//staging/src/k8s.io/component-helpers k8s.io/controller-=
manager:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8=
s.io/controller-manager k8s.io/cri-api:github.com/k3s-io/kubernetes/staging=
/src/k8s.io/api//staging/src/k8s.io/cri-api k8s.io/csi-translation-lib:gith=
ub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/csi-tra=
nslation-lib k8s.io/kube-aggregator:github.com/k3s-io/kubernetes/staging/sr=
c/k8s.io/api//staging/src/k8s.io/kube-aggregator k8s.io/kube-controller-man=
ager:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.i=
o/kube-controller-manager k8s.io/kube-proxy:github.com/k3s-io/kubernetes/st=
aging/src/k8s.io/api//staging/src/k8s.io/kube-proxy k8s.io/kube-scheduler:g=
ithub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube=
-scheduler k8s.io/kubectl:github.com/k3s-io/kubernetes/staging/src/k8s.io/a=
pi//staging/src/k8s.io/kubectl k8s.io/kubelet:github.com/k3s-io/kubernetes/=
staging/src/k8s.io/api//staging/src/k8s.io/kubelet k8s.io/kubernetes:github=
.com/k3s-io/kubernetes/staging/src/k8s.io/api k8s.io/legacy-cloud-providers=
:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/le=
gacy-cloud-providers k8s.io/metrics:github.com/k3s-io/kubernetes/staging/sr=
c/k8s.io/api//staging/src/k8s.io/metrics k8s.io/mount-utils:github.com/k3s-=
io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/mount-utils k8s.io=
/pod-security-admission:github.com/k3s-io/kubernetes/staging/src/k8s.io/api=
//staging/src/k8s.io/pod-security-admission k8s.io/sample-apiserver:github.=
com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/sample-api=
server k8s.io/gengo:k8s.io/gengo k8s.io/klog:k8s.io/klog k8s.io/klog/v2:git=
hub.com/k3s-io/klog/v2 k8s.io/kube-openapi:k8s.io/kube-openapi k8s.io/syste=
m-validators:k8s.io/system-validators k8s.io/utils:k8s.io/utils modernc.org=
/cc:modernc.org/cc modernc.org/golex:modernc.org/golex modernc.org/mathutil=
:modernc.org/mathutil modernc.org/strutil:modernc.org/strutil modernc.org/x=
c:modernc.org/xc rsc.io/binaryregexp:rsc.io/binaryregexp rsc.io/pdf:rsc.io/=
pdf rsc.io/quote/v3:github.com/rsc/quote/v3//v3 rsc.io/sampler:rsc.io/sampl=
er sigs.k8s.io/apiserver-network-proxy/konnectivity-client:github.com/kuber=
netes-sigs/apiserver-network-proxy/konnectivity-client//konnectivity-client=
 sigs.k8s.io/cli-utils:sigs.k8s.io/cli-utils sigs.k8s.io/controller-runtime=
:sigs.k8s.io/controller-runtime sigs.k8s.io/kustomize/api:github.com/kubern=
etes-sigs/kustomize/api//api sigs.k8s.io/kustomize/cmd/config:github.com/ku=
bernetes-sigs/kustomize/api//cmd/config sigs.k8s.io/kustomize/kustomize/v4:=
github.com/kubernetes-sigs/kustomize/api//kustomize sigs.k8s.io/kustomize/k=
yaml:github.com/kubernetes-sigs/kustomize/api//kyaml sigs.k8s.io/structured=
-merge-diff/v4:github.com/kubernetes-sigs/structured-merge-diff/v4 sigs.k8s=
.io/testing_frameworks:sigs.k8s.io/testing_frameworks sigs.k8s.io/yaml:sigs=
.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.io/json"
> >          for s in $sites; do
> >              site_dest=3D$(echo $s | cut -d: -f1)
> >              site_source=3D$(echo $s | cut -d: -f2)
> > --
> > 2.35.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7347): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7347
> > Mute This Topic: https://lists.yoctoproject.org/mt/91626824/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

