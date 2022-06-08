Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7052CCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 16:47:59 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.8945.1654706875021338460
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 09:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GE+qEqBi;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so18814986pjq.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lo1sueHpPm7Dm5RDvp05ITU3YE9iHegBVryoVOv6G0Q=;
        b=GE+qEqBiz+zBs8Fv57yI1VBgOmFuUfopyvc4wjknSBRYTf6GaHhZxijSl/bd2Ln1On
         RxeUK5rh2Uu+avArUWpoj1KoDU49Sg4FNqqR+3vvf+Sgra84V/ekGTIpAoF5y1KmfQqD
         ge0RIcYgOsyBUlEFTPSqmjx0uwv7ihTqXuq2stXZN+MPZxhaelRSqq/0zLgeYp9plXId
         YmWAKclxj5m8CjNasSpo8dhBW4KP0Gbj2+yBZr3QeIET8YJ7wluzKl0oHWhyKFmbeARv
         02JSeFLCRmwrqMshdvwcNXfuzYumW5DlmoVOev/C9B8jJOesFGqiSVLh6CLBtA3MaVIa
         uI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lo1sueHpPm7Dm5RDvp05ITU3YE9iHegBVryoVOv6G0Q=;
        b=EFT2uRhNozs2NBAxiyKrI/U7FlTGbDC9o6GE3oGjsdzbzFOSqNYYBMkFB/r+NtOGV+
         7KRLH9s2TxcvwlSCWOUKKbsVY3ZdyykASiCTpGG331Fipt2DjRmoJloSM4pCuLftERz3
         otGcR8lzx3AcpAZByA6hp5WOz+Dr9mATjWe9kh6Rw0E7f7Wz+A/hi/Dd7/kDBU/ZGCFd
         icmkbx1xaSHlUeJE8b5mH08wVGTEuPD5HE0o89+XEdF+hTvFoUSTQyaTjeV7OCPh47Bz
         C7Y25g2OmilEZsIvjblKKyO792qvEAPb2OlEYbM6Y0vBIqPrSeKbPSwgaFl6wT+ctonS
         0LnA==
X-Gm-Message-State: AOAM5316ZcqqhExy/GGO2G90BHsf+DSPiyyGKFcf5P7a4d+CGi2xYUlC
	nf5lnBIeCuQivBack1iI2F6Omsywb5+9bNVFvMiBsaIVAl0=
X-Google-Smtp-Source: 
 ABdhPJzK6FIWQICOpLBkZcZ4NcXMJLmrlDhob8BGvl0WRjGZEXoGhG9ndfAJEwIHFDggZ8KiOUnt48AOjl8OzREokwM=
X-Received: by 2002:a17:902:d5ce:b0:167:6c02:754c with SMTP id
 g14-20020a170902d5ce00b001676c02754cmr20453974plh.135.1654706873944; Wed, 08
 Jun 2022 09:47:53 -0700 (PDT)
MIME-Version: 1.0
References: 
 <956614aeb05d3f6377da58e713309ca12e2fffe9.1654704740.git.diego.sueiro@arm.com>
In-Reply-To: 
 <956614aeb05d3f6377da58e713309ca12e2fffe9.1654704740.git.diego.sueiro@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 8 Jun 2022 12:47:41 -0400
Message-ID: 
 <CADkTA4OSvLY2XXxBJepn=MPEXjFzWBjyHX85SrEvV6kZk+d7ug@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Fetch dependencies from github
 instead of googlesource to avoid rate-limit
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jun 2022 16:47:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7348

On Wed, Jun 8, 2022 at 12:21 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> All repositories under https://go.googlesource.com/ have a mirror in
> https://github.com.
>
> Fetching the dependencies from github is much faster and we avoid timeout=
s due
> to googlesource rate-limit.
>
> Reference: https://github.com/golang/go/issues/12933

I've been working on updating k3s to the same format as nerdctl (with
.inc files and better formatted dependencies), so let me finish that
update, and then we can get this applied.

I'll also need to teach my generation script to make that mapping, as
it would otherwise be lost on upgrades, as all of those locations are
discovered via the go infrastructure.

One more question, as the non-linebroken relocation sites is super
hard to read diffs (which is why I reformatted it), I assume you are
mapping those github sites back to the googlesource location in the
relocation step, so that go finds it, and doesn't fetch ?

Bruce

>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-containers/k3s/k3s_git.bb | 62 +++++++++++++++----------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k=
3s_git.bb
> index a20092c..4f109ad 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -2238,79 +2238,79 @@ SRCREV_zap=3D"2908d3000567b86f0b7f1e99cc6bc5c9f30=
d43a0"
>  SRC_URI +=3D "git://github.com/uber-go/zap;name=3Dzap;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.o=
rg/zap"
>
>  # golang.org/x/crypto v0.0.0-20210220033148-5ea612d1eb83
> -# [1] git ls-remote https://go.googlesource.com/crypto 5ea612d1eb830b38b=
c4e914e37f55311eb58adce
> +# [1] git ls-remote https://github.com/golang/crypto 5ea612d1eb830b38bc4=
e914e37f55311eb58adce
>  SRCREV_crypto=3D"5ea612d1eb830b38bc4e914e37f55311eb58adce"
> -SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/crypto"
> +SRC_URI +=3D "git://github.com/golang/crypto;name=3Dcrypto;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/crypto"
>
>  # golang.org/x/exp v0.0.0-20210220032938-85be41e4509f
> -# [1] git ls-remote https://go.googlesource.com/exp 85be41e4509f417cbf99=
006a027aef75deb8afd1
> +# [1] git ls-remote https://github.com/golang/exp 85be41e4509f417cbf9900=
6a027aef75deb8afd1
>  SRCREV_exp=3D"85be41e4509f417cbf99006a027aef75deb8afd1"
> -SRC_URI +=3D "git://go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/exp"
> +SRC_URI +=3D "git://github.com/golang/exp;name=3Dexp;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/golang/exp"
>
>  # golang.org/x/image v0.0.0-20190802002840-cff245a6509b
> -# [1] git ls-remote https://go.googlesource.com/image cff245a6509b8c4de0=
22d0d5b9037c503c5989d6
> +# [1] git ls-remote https://github.com/golang/image cff245a6509b8c4de022=
d0d5b9037c503c5989d6
>  SRCREV_image=3D"cff245a6509b8c4de022d0d5b9037c503c5989d6"
> -SRC_URI +=3D "git://go.googlesource.com/image;name=3Dimage;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/image"
> +SRC_URI +=3D "git://github.com/golang/image;name=3Dimage;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/image"
>
>  # golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
> -# [1] git ls-remote https://go.googlesource.com/lint 6edffad5e6160f5949c=
defc81710b2706fbcd4f6
> +# [1] git ls-remote https://github.com/golang/lint 6edffad5e6160f5949cde=
fc81710b2706fbcd4f6
>  SRCREV_lint=3D"6edffad5e6160f5949cdefc81710b2706fbcd4f6"
> -SRC_URI +=3D "git://go.googlesource.com/lint;name=3Dlint;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/lint"
> +SRC_URI +=3D "git://github.com/golang/lint;name=3Dlint;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/lint"
>
>  # golang.org/x/mobile v0.0.0-20201217150744-e6ae53a27f4f
> -# [1] git ls-remote https://go.googlesource.com/mobile e6ae53a27f4fd7cfa=
2943f2ae47b96cba8eb01c9
> +# [1] git ls-remote https://github.com/golang/mobile e6ae53a27f4fd7cfa29=
43f2ae47b96cba8eb01c9
>  SRCREV_mobile=3D"e6ae53a27f4fd7cfa2943f2ae47b96cba8eb01c9"
> -SRC_URI +=3D "git://go.googlesource.com/mobile;name=3Dmobile;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/mobile"
> +SRC_URI +=3D "git://github.com/golang/mobile;name=3Dmobile;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/mobile"
>
>  # golang.org/x/mod v0.5.1
> -# [1] git ls-remote https://go.googlesource.com/mod 49f84bccfd3469cb3095=
201f7855641bcc8eb49a
> +# [1] git ls-remote https://github.com/golang/mod 49f84bccfd3469cb309520=
1f7855641bcc8eb49a
>  SRCREV_mod=3D"49f84bccfd3469cb3095201f7855641bcc8eb49a"
> -SRC_URI +=3D "git://go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/mod"
> +SRC_URI +=3D "git://github.com/golang/mod;name=3Dmod;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/golang/mod"
>
>  # golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4
> -# [1] git ls-remote https://go.googlesource.com/net a5a99cb37ef4b6861777=
5ab669177656090ab396
> +# [1] git ls-remote https://github.com/golang/net a5a99cb37ef4b68617775a=
b669177656090ab396
>  SRCREV_net=3D"a5a99cb37ef4b68617775ab669177656090ab396"
> -SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/net"
> +SRC_URI +=3D "git://github.com/golang/net;name=3Dnet;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/golang/net"
>
>  # golang.org/x/oauth2 v0.0.0-20211104180415-d3ed0bb246c8
> -# [1] git ls-remote https://go.googlesource.com/oauth2 d3ed0bb246c8d3c75=
b63937d9a5eecff9c74d7fe
> +# [1] git ls-remote https://github.com/golang/oauth2 d3ed0bb246c8d3c75b6=
3937d9a5eecff9c74d7fe
>  SRCREV_oauth2=3D"d3ed0bb246c8d3c75b63937d9a5eecff9c74d7fe"
> -SRC_URI +=3D "git://go.googlesource.com/oauth2;name=3Doauth2;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/oauth2"
> +SRC_URI +=3D "git://github.com/golang/oauth2;name=3Doauth2;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/golang/oauth2"
>
>  # golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
> -# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0ddf193=
dd5a34e034151da389d09
> +# [1] git ls-remote https://github.com/golang/sync 036812b2e83c0ddf193dd=
5a34e034151da389d09
>  SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
> -SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/sync"
> +SRC_URI +=3D "git://github.com/golang/sync;name=3Dsync;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/sync"
>
>  # golang.org/x/sys v0.0.0-20210831042530-f4d43177bf5e
> -# [1] git ls-remote https://go.googlesource.com/sys f4d43177bf5e2ee98617=
956e417d0555d4b69c17
> +# [1] git ls-remote https://github.com/golang/sys f4d43177bf5e2ee9861795=
6e417d0555d4b69c17
>  SRCREV_sys=3D"f4d43177bf5e2ee98617956e417d0555d4b69c17"
> -SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/sys"
> +SRC_URI +=3D "git://github.com/golang/sys;name=3Dsys;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/golang/sys"
>
>  # golang.org/x/term v0.0.0-20210220032956-6a3ed077a48d
> -# [1] git ls-remote https://go.googlesource.com/term 6a3ed077a48de71621a=
d530f9078fffa0bc0ce32
> +# [1] git ls-remote https://github.com/golang/term 6a3ed077a48de71621ad5=
30f9078fffa0bc0ce32
>  SRCREV_term1=3D"6a3ed077a48de71621ad530f9078fffa0bc0ce32"
> -SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm1;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.go=
oglesource.com/term"
> +SRC_URI +=3D "git://github.com/golang/term;name=3Dterm1;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/golang/term"
>
>  # golang.org/x/text v0.3.7
> -# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f883d22=
9d707172ed356727aae99
> +# [1] git ls-remote https://github.com/golang/text 3cd4007149f3f883d229d=
707172ed356727aae99
>  SRCREV_text1=3D"3cd4007149f3f883d229d707172ed356727aae99"
> -SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext1;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.go=
oglesource.com/text"
> +SRC_URI +=3D "git://github.com/golang/text;name=3Dtext1;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/golang/text"
>
>  # golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac
> -# [1] git ls-remote https://go.googlesource.com/time 1f47c861a9ac5a6e764=
5609f91b895398ff31642
> +# [1] git ls-remote https://github.com/golang/time 1f47c861a9ac5a6e76456=
09f91b895398ff31642
>  SRCREV_time=3D"1f47c861a9ac5a6e7645609f91b895398ff31642"
> -SRC_URI +=3D "git://go.googlesource.com/time;name=3Dtime;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/time"
> +SRC_URI +=3D "git://github.com/golang/time;name=3Dtime;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/golang/time"
>
>  # golang.org/x/tools v0.1.8
> -# [1] git ls-remote https://go.googlesource.com/tools e212aff8fd146c44dd=
b0167c1dfbd5531d6c9213
> +# [1] git ls-remote https://github.com/golang/tools e212aff8fd146c44ddb0=
167c1dfbd5531d6c9213
>  SRCREV_tools=3D"e212aff8fd146c44ddb0167c1dfbd5531d6c9213"
> -SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/tools"
> +SRC_URI +=3D "git://github.com/golang/tools;name=3Dtools;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/golang/tools"
>
>  # golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
> -# [1] git ls-remote https://go.googlesource.com/xerrors 5ec99f83aff198f5=
fbd629d6c8d8eb38a04218ca
> +# [1] git ls-remote https://github.com/golang/xerrors 5ec99f83aff198f5fb=
d629d6c8d8eb38a04218ca
>  SRCREV_xerrors=3D"5ec99f83aff198f5fbd629d6c8d8eb38a04218ca"
> -SRC_URI +=3D "git://go.googlesource.com/xerrors;name=3Dxerrors;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.googlesource.com/xerrors"
> +SRC_URI +=3D "git://github.com/golang/xerrors;name=3Dxerrors;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/xerrors"
>
>  # golang.zx2c4.com/go118/netip v0.0.0-20211111135330-a4a02eeacf9d
>  # [1] git ls-remote https://git.zx2c4.com/go118-netip a4a02eeacf9d49566d=
f85e8cff878e5527e51779
> @@ -2633,7 +2633,7 @@ do_compile() {
>
>          cd ${S}/src/import
>
> -        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.org/bert=
imus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/go:git=
hub.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:github.com/=
googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/datastore=
:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.google.com=
/go/firestore:github.com/googleapis/google-cloud-go/bigquery//firestore clo=
ud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquery//pub=
sub cloud.google.com/go/storage:github.com/googleapis/google-cloud-go/bigqu=
ery//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mtl gith=
ub.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skylar/exce=
lize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for-go gi=
thub.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Azure/go=
-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/autores=
t:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go-autor=
est/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/adal gith=
ub.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/autores=
t//autorest/date github.com/Azure/go-autorest/autorest/mocks:github.com/Azu=
re/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/autore=
st/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/Azure/g=
o-autorest/autorest/validation:github.com/Azure/go-autorest/autorest//autor=
est/validation github.com/Azure/go-autorest/logger:github.com/Azure/go-auto=
rest/autorest//logger github.com/Azure/go-autorest/tracing:github.com/Azure=
/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/BurntS=
ushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.com/Go=
ogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k8s-clo=
ud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_pdh git=
hub.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com/Micro=
soft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcsshim:gi=
thub.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/NYTime=
s/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash github.=
com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/PuerkitoB=
io/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc:githu=
b.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/retry gi=
thub.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.com/aj=
starks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:github.=
com/alecthomas/template github.com/alecthomas/units:github.com/alecthomas/u=
nits github.com/alexflint/go-filemutex:github.com/alexflint/go-filemutex gi=
thub.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalholm/ca=
scadia:github.com/andybalholm/cascadia github.com/antihax/optional:github.c=
om/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf githu=
b.com/armon/consul-api:github.com/armon/consul-api github.com/armon/go-metr=
ics:github.com/armon/go-metrics github.com/armon/go-radix:github.com/armon/=
go-radix github.com/asaskevich/govalidator:github.com/asaskevich/govalidato=
r github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middleware git=
hub.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohnson/clo=
ck:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/beorn7/p=
erks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github.com/b=
its-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bketelse=
n/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com/blang=
/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bronze1man=
/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/buger/j=
sonparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:github=
.com/canonical/go-dqlite github.com/census-instrumentation/opencensus-proto=
:github.com/census-instrumentation/opencensus-proto github.com/certifi/goce=
rtifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.com/ces=
pare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 githu=
b.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/checkpo=
int-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 github.com/=
cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com/chzye=
r/logex github.com/chzyer/readline:github.com/chzyer/readline github.com/ch=
zyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/cilium/e=
bpf github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs/kube-=
router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-go gith=
ub.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachdb/data=
driven:github.com/cockroachdb/datadriven github.com/cockroachdb/errors:gith=
ub.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/cockroa=
chdb/logtags github.com/container-storage-interface/spec:github.com/contain=
er-storage-interface/spec github.com/containerd/aufs:github.com/containerd/=
aufs github.com/containerd/btrfs:github.com/containerd/btrfs github.com/con=
tainerd/cgroups:github.com/containerd/cgroups github.com/containerd/console=
:github.com/containerd/console github.com/containerd/containerd:github.com/=
containerd/containerd github.com/containerd/continuity:github.com/container=
d/continuity github.com/containerd/fifo:github.com/containerd/fifo github.c=
om/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-overlay=
fs-snapshotter github.com/containerd/go-cni:github.com/containerd/go-cni gi=
thub.com/containerd/go-runc:github.com/containerd/go-runc github.com/contai=
nerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nri:gith=
ub.com/containerd/nri github.com/containerd/stargz-snapshotter:github.com/c=
ontainerd/stargz-snapshotter github.com/containerd/stargz-snapshotter/estar=
gz:github.com/containerd/stargz-snapshotter//estargz github.com/containerd/=
ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:github.com/=
containerd/typeurl github.com/containerd/zfs:github.com/containerd/zfs gith=
ub.com/containernetworking/cni:github.com/containernetworking/cni github.co=
m/containernetworking/plugins:github.com/containernetworking/plugins github=
.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/coredns/=
caddy:github.com/coredns/caddy github.com/coredns/corefile-migration:github=
.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/coreos/b=
bolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/go-ipt=
ables:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.com/co=
reos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver github=
.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos/go-sy=
stemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:github.com=
/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-md2man/=
v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/filepath-s=
ecurejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:github=
.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client github=
.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardwareaddr=
:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com/danie=
ljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew github.=
com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext github.com=
/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrijalva/jw=
t-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.com/dgry=
ski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 github.=
com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:github.com=
/docker/cli github.com/docker/distribution:github.com/docker/distribution g=
ithub.com/docker/docker:github.com/docker/docker github.com/docker/docker-c=
redential-helpers:github.com/docker/docker-credential-helpers github.com/do=
cker/go-connections:github.com/docker/go-connections github.com/docker/go-e=
vents:github.com/docker/go-events github.com/docker/go-metrics:github.com/d=
ocker/go-metrics github.com/docker/go-units:github.com/docker/go-units gith=
ub.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin/go-hu=
manize:github.com/dustin/go-humanize github.com/dustmop/soup:github.com/dus=
tmop/soup github.com/eapache/channels:github.com/eapache/channels github.co=
m/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:github.=
com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emicklei/go-r=
estful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/go-cont=
rol-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoyproxy/p=
rotoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubbelboer=
/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser githu=
b.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/exponent-=
io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-promise:g=
ithub.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fatih/ca=
melcase github.com/fatih/color:github.com/fatih/color github.com/felixge/ht=
tpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:github.c=
om/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-shlex g=
ithub.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss/jwt-g=
o:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:github.com/=
frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/fsnotif=
y github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.com/ge=
tsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml:githu=
b.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo githu=
b.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.com/go-=
errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:github.com/=
go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3/glfw/=
/v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-kit/ki=
t:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log github.=
com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/logr:gi=
thub.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr githu=
b.com/go-openapi/analysis:github.com/go-openapi/analysis github.com/go-open=
api/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpointer:g=
ithub.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:github=
.com/go-openapi/jsonreference github.com/go-openapi/loads:github.com/go-ope=
napi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtime gith=
ub.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-openapi/str=
fmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.com/go-o=
penapi/swag github.com/go-openapi/validate:github.com/go-openapi/validate g=
ithub.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation github=
.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go-stack=
/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:github.com/g=
o-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep github.co=
m/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:github.com/=
godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.com/=
gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/gofrs/u=
uid github.com/gogo/googleapis:github.com/gogo/googleapis github.com/gogo/p=
rotobuf:github.com/gogo/protobuf github.com/golang/freetype:github.com/gola=
ng/freetype github.com/golang/glog:github.com/golang/glog github.com/golang=
/groupcache:github.com/golang/groupcache github.com/golang/mock:github.com/=
golang/mock github.com/golang/protobuf:github.com/golang/protobuf github.co=
m/golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:github=
.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus/fmt g=
ithub.com/golangplus/testing:github.com/golangplus/testing github.com/googl=
e/btree:github.com/google/btree github.com/google/cadvisor:github.com/googl=
e/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.com/goo=
gle/go-containerregistry:github.com/google/go-containerregistry github.com/=
google/gofuzz:github.com/google/gofuzz github.com/google/martian:github.com=
/google/martian github.com/google/martian/v3:github.com/google/martian/v3 g=
ithub.com/google/pprof:github.com/google/pprof github.com/google/renameio:g=
ithub.com/google/renameio github.com/google/shlex:github.com/google/shlex g=
ithub.com/google/uuid:github.com/google/uuid github.com/googleapis/gax-go/v=
2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:github.=
com/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/gopher=
cloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/gopherjs=
 github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/websocket=
:github.com/gorilla/websocket github.com/gregjones/httpcache:github.com/gre=
gjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.com/gr=
pc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-prometheu=
s:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosystem/gr=
pc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/go-fuse=
/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:github.com=
/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com/hashi=
corp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicorp/errw=
rap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp git=
hub.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/hashico=
rp/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.com/ha=
shicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashicorp/go-=
multierror:github.com/hashicorp/go-multierror github.com/hashicorp/go-retry=
ablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/go-root=
certs:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-sockaddr:gi=
thub.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.com/ha=
shicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/go-uuid=
 github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/hashico=
rp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hcl:gith=
ub.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashicorp/log=
utils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/hashic=
orp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/serf:gi=
thub.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/heketi g=
ithub.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tail:gith=
ub.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelgupf/so=
cketpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor/deman=
gle github.com/imdario/mergo:github.com/imdario/mergo github.com/inconshrev=
eable/mousetrap:github.com/inconshreveable/mousetrap github.com/insomniacsl=
k/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:github.com=
/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping github=
.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespath/go-=
jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmespath/in=
ternal/testify:github.com/jmespath/go-jmespath/internal/testify//internal/t=
estify github.com/joho/godotenv:github.com/joho/godotenv github.com/jonboul=
le/clockwork:github.com/jonboulle/clockwork github.com/josharian/intern:git=
hub.com/josharian/intern github.com/josharian/native:github.com/josharian/n=
ative github.com/jpillora/backoff:github.com/jpillora/backoff github.com/js=
imonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-iterator=
/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report:github.=
com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/gls gi=
thub.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter githu=
b.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/critbi=
tgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:github.co=
m/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kine gith=
ub.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisielk/er=
rcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.com/kis=
ielk/gotool github.com/klauspost/compress:github.com/klauspost/compress git=
hub.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsorten/go-=
windows-terminal-sequences:github.com/konsorten/go-windows-terminal-sequenc=
es github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/kr/log=
fmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:github.com/=
kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-sigs/cri=
-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/godebug:g=
ithub.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq github.com=
/libopenstorage/openstorage:github.com/libopenstorage/openstorage github.co=
m/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer/deden=
t:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpabon/god=
bc github.com/magiconair/properties:github.com/magiconair/properties github=
.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-colorab=
le:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.com/matt=
n/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewidth git=
hub.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com/mattn=
/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_protob=
uf_extensions:github.com/matttproud/golang_protobuf_extensions github.com/m=
dlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/ethtool:g=
ithub.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/mdlayhe=
r/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink github.=
com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:github.=
com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.com/mi=
ekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.com/miki=
oh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml github.=
com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-go/v7:g=
ithub.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/minio/s=
ha256-simd github.com/minio/sio:github.com/minio/sio github.com/mistifyio/g=
o-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com/mitch=
ellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir gi=
thub.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testing-int=
erface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordwrap gi=
thub.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/iochan=
:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:github.com/m=
itchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs github.com/=
moby/locker:github.com/moby/locker github.com/moby/spdystream:github.com/mo=
by/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo//=
mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//symlin=
k github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:github.c=
om/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/concurr=
ent github.com/modern-go/reflect2:github.com/modern-go/reflect2 github.com/=
mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go-gitig=
nore:github.com/monochromegane/go-gitignore github.com/morikuni/aec:github.=
com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fileutils =
github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/mvdan/=
xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.com/mwi=
tkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowrate git=
hub.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.com/nie=
meyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.com/nx=
adm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/olekukonko/=
tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:github=
.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github.com/o=
pencontainers/go-digest:github.com/opencontainers/go-digest github.com/open=
containers/image-spec:github.com/opencontainers/image-spec github.com/openc=
ontainers/runc:github.com/opencontainers/runc github.com/opencontainers/run=
time-spec:github.com/opencontainers/runtime-spec github.com/opencontainers/=
selinux:github.com/opencontainers/selinux github.com/opentracing/opentracin=
g-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:github.com=
/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.com/otia=
i10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/otiai10=
/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.com/pa=
ulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com/pborm=
an/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-buffrune=
io github.com/pelletier/go-toml:github.com/pelletier/go-toml github.com/pet=
erbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:github=
.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.com/pkg=
/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pmezard/=
go-difflib github.com/posener/complete:github.com/posener/complete github.c=
om/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/promethe=
us/client_golang:github.com/prometheus/client_golang github.com/prometheus/=
client_model:github.com/prometheus/client_model github.com/prometheus/commo=
n:github.com/prometheus/common github.com/prometheus/procfs:github.com/prom=
etheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb github.=
com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:github.=
com/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher/dynam=
iclistener github.com/rancher/lasso:github.com/rancher/lasso github.com/ran=
cher/remotedialer:github.com/rancher/remotedialer github.com/rancher/wharfi=
e:github.com/rancher/wharfie github.com/rancher/wrangler:github.com/rancher=
/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/bigfft=
 github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpeppe/fa=
stuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:github.=
com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:github.=
com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/xid git=
hub.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/blackf=
riday:github.com/russross/blackfriday github.com/russross/blackfriday/v2:gi=
thub.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github.com/r=
yanuber/columnize github.com/safchain/ethtool:github.com/safchain/ethtool g=
ithub.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/seed:gi=
thub.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/seccomp=
/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff github=
.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_anchor_na=
me github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/smartys=
treets/assertions:github.com/smartystreets/assertions github.com/smartystre=
ets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cmux:git=
hub.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/water git=
hub.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf13/afe=
ro:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast githu=
b.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweatherman=
:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com/spf13=
/pflag github.com/spf13/viper:github.com/spf13/viper github.com/stefanberge=
r/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewer/go-s=
trcase:github.com/stoewer/go-strcase github.com/storageos/go-api:github.com=
/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx github.=
com/stretchr/testify:github.com/stretchr/testify github.com/subosito/gotenv=
:github.com/subosito/gotenv github.com/syndtr/gocapability:github.com/syndt=
r/gocapability github.com/tchap/go-patricia:github.com/tchap/go-patricia gi=
thub.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/tencentcl=
oud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github.com/t=
mc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.com/u-ro=
ot/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ugorji/g=
o github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v2:gith=
ub.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negroni gi=
thub.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vektah/gql=
parser:github.com/vektah/gqlparser github.com/vishvananda/netlink:github.co=
m/vishvananda/netlink github.com/vishvananda/netns:github.com/vishvananda/n=
etns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/willf/b=
itset:github.com/willf/bitset github.com/xiang90/probing:github.com/xiang90=
/probing github.com/xlab/treeprint:github.com/xlab/treeprint github.com/xor=
dataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/goldmar=
k:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.io/etc=
d:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/cli=
ent/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/etcd/cl=
ient/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/client/pk=
g/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/v3//ra=
ft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.io/etc=
d/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/etcdut=
l/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3:githu=
b.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/pkcs7 =
go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.openteleme=
try.io/contrib go.opentelemetry.io/contrib/instrumentation/google.golang.or=
g/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.golang.=
org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/http/otel=
http:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp go.open=
telemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/exporte=
rs/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/otel/m=
etric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/oteltest:go=
.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.openteleme=
try.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.opentelemetr=
y.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.opentel=
emetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opentelemetry.=
io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemetry/ope=
ntelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/starlark-g=
o go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.org/gole=
ak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.org/za=
p golang.org/x/crypto:go.googlesource.com/crypto golang.org/x/exp:go.google=
source.com/exp golang.org/x/image:go.googlesource.com/image golang.org/x/li=
nt:go.googlesource.com/lint golang.org/x/mobile:go.googlesource.com/mobile =
golang.org/x/mod:go.googlesource.com/mod golang.org/x/net:go.googlesource.c=
om/net golang.org/x/oauth2:go.googlesource.com/oauth2 golang.org/x/sync:go.=
googlesource.com/sync golang.org/x/sys:go.googlesource.com/sys golang.org/x=
/term:go.googlesource.com/term golang.org/x/text:go.googlesource.com/text g=
olang.org/x/time:go.googlesource.com/time golang.org/x/tools:go.googlesourc=
e.com/tools golang.org/x/xerrors:go.googlesource.com/xerrors golang.zx2c4.c=
om/go118/netip:golang.zx2c4.com/go118/netip golang.zx2c4.com/wintun:golang.=
zx2c4.com/wintun golang.zx2c4.com/wireguard:golang.zx2c4.com/wireguard gola=
ng.zx2c4.com/wireguard/wgctrl:golang.zx2c4.com/wireguard/wgctrl gonum.org/v=
1/gonum:github.com/gonum/gonum gonum.org/v1/netlib:github.com/gonum/netlib =
gonum.org/v1/plot:github.com/gonum/plot google.golang.org/api:google.golang=
.org/api google.golang.org/appengine:google.golang.org/appengine google.gol=
ang.org/genproto:google.golang.org/genproto google.golang.org/grpc:google.g=
olang.org/grpc google.golang.org/grpc/cmd/protoc-gen-go-grpc:google.golang.=
org/grpc/cmd/protoc-gen-go-grpc google.golang.org/protobuf:google.golang.or=
g/protobuf gopkg.in/airbrake/gobrake.v2:gopkg.in/airbrake/gobrake.v2 gopkg.=
in/alecthomas/kingpin.v2:gopkg.in/alecthomas/kingpin.v2 gopkg.in/check.v1:g=
opkg.in/check.v1 gopkg.in/cheggaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.in/e=
rrgo.v2:gopkg.in/errgo.v2 gopkg.in/fsnotify.v1:gopkg.in/fsnotify.v1 gopkg.i=
n/gcfg.v1:gopkg.in/gcfg.v1 gopkg.in/gemnasium/logrus-airbrake-hook.v2:gopkg=
.in/gemnasium/logrus-airbrake-hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 gopkg=
.in/ini.v1:gopkg.in/ini.v1 gopkg.in/natefinch/lumberjack.v2:gopkg.in/natefi=
nch/lumberjack.v2 gopkg.in/resty.v1:gopkg.in/resty.v1 gopkg.in/square/go-jo=
se.v2:gopkg.in/square/go-jose.v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopkg.in=
/warnings.v0:gopkg.in/warnings.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gopkg.i=
n/yaml.v3:gopkg.in/yaml.v3 gotest.tools:gotest.tools gotest.tools/v3:github=
.com/gotestyourself/gotest.tools/v3 honnef.co/go/tools:honnef.co/go/tools i=
net.af/tcpproxy:inet.af/tcpproxy k8s.io/api:github.com/k3s-io/kubernetes/st=
aging/src/k8s.io/api//staging/src/k8s.io/api k8s.io/apiextensions-apiserver=
:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/ap=
iextensions-apiserver k8s.io/apimachinery:github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/api//staging/src/k8s.io/apimachinery k8s.io/apiserver:github=
.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/apiserver=
 k8s.io/cli-runtime:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//st=
aging/src/k8s.io/cli-runtime k8s.io/client-go:github.com/k3s-io/kubernetes/=
staging/src/k8s.io/api//staging/src/k8s.io/client-go k8s.io/cloud-provider:=
github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/clo=
ud-provider k8s.io/cluster-bootstrap:github.com/k3s-io/kubernetes/staging/s=
rc/k8s.io/api//staging/src/k8s.io/cluster-bootstrap k8s.io/code-generator:g=
ithub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/code=
-generator k8s.io/component-base:github.com/k3s-io/kubernetes/staging/src/k=
8s.io/api//staging/src/k8s.io/component-base k8s.io/component-helpers:githu=
b.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/componen=
t-helpers k8s.io/controller-manager:github.com/k3s-io/kubernetes/staging/sr=
c/k8s.io/api//staging/src/k8s.io/controller-manager k8s.io/cri-api:github.c=
om/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cri-api k8s=
.io/csi-translation-lib:github.com/k3s-io/kubernetes/staging/src/k8s.io/api=
//staging/src/k8s.io/csi-translation-lib k8s.io/kube-aggregator:github.com/=
k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-aggregato=
r k8s.io/kube-controller-manager:github.com/k3s-io/kubernetes/staging/src/k=
8s.io/api//staging/src/k8s.io/kube-controller-manager k8s.io/kube-proxy:git=
hub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-p=
roxy k8s.io/kube-scheduler:github.com/k3s-io/kubernetes/staging/src/k8s.io/=
api//staging/src/k8s.io/kube-scheduler k8s.io/kubectl:github.com/k3s-io/kub=
ernetes/staging/src/k8s.io/api//staging/src/k8s.io/kubectl k8s.io/kubelet:g=
ithub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube=
let k8s.io/kubernetes:github.com/k3s-io/kubernetes/staging/src/k8s.io/api k=
8s.io/legacy-cloud-providers:github.com/k3s-io/kubernetes/staging/src/k8s.i=
o/api//staging/src/k8s.io/legacy-cloud-providers k8s.io/metrics:github.com/=
k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/metrics k8s.io=
/mount-utils:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/s=
rc/k8s.io/mount-utils k8s.io/pod-security-admission:github.com/k3s-io/kuber=
netes/staging/src/k8s.io/api//staging/src/k8s.io/pod-security-admission k8s=
.io/sample-apiserver:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//s=
taging/src/k8s.io/sample-apiserver k8s.io/gengo:k8s.io/gengo k8s.io/klog:k8=
s.io/klog k8s.io/klog/v2:github.com/k3s-io/klog/v2 k8s.io/kube-openapi:k8s.=
io/kube-openapi k8s.io/system-validators:k8s.io/system-validators k8s.io/ut=
ils:k8s.io/utils modernc.org/cc:modernc.org/cc modernc.org/golex:modernc.or=
g/golex modernc.org/mathutil:modernc.org/mathutil modernc.org/strutil:moder=
nc.org/strutil modernc.org/xc:modernc.org/xc rsc.io/binaryregexp:rsc.io/bin=
aryregexp rsc.io/pdf:rsc.io/pdf rsc.io/quote/v3:github.com/rsc/quote/v3//v3=
 rsc.io/sampler:rsc.io/sampler sigs.k8s.io/apiserver-network-proxy/konnecti=
vity-client:github.com/kubernetes-sigs/apiserver-network-proxy/konnectivity=
-client//konnectivity-client sigs.k8s.io/cli-utils:sigs.k8s.io/cli-utils si=
gs.k8s.io/controller-runtime:sigs.k8s.io/controller-runtime sigs.k8s.io/kus=
tomize/api:github.com/kubernetes-sigs/kustomize/api//api sigs.k8s.io/kustom=
ize/cmd/config:github.com/kubernetes-sigs/kustomize/api//cmd/config sigs.k8=
s.io/kustomize/kustomize/v4:github.com/kubernetes-sigs/kustomize/api//kusto=
mize sigs.k8s.io/kustomize/kyaml:github.com/kubernetes-sigs/kustomize/api//=
kyaml sigs.k8s.io/structured-merge-diff/v4:github.com/kubernetes-sigs/struc=
tured-merge-diff/v4 sigs.k8s.io/testing_frameworks:sigs.k8s.io/testing_fram=
eworks sigs.k8s.io/yaml:sigs.k8s.io/yaml sigs.k8s.io/json:sigs.k8s.io/json"
> +        sites=3D"bazil.org/fuse:github.com/bazil/fuse bitbucket.org/bert=
imus9/systemstat:bitbucket.org/bertimus9/systemstat cloud.google.com/go:git=
hub.com/googleapis/google-cloud-go cloud.google.com/go/bigquery:github.com/=
googleapis/google-cloud-go/bigquery//bigquery cloud.google.com/go/datastore=
:github.com/googleapis/google-cloud-go/bigquery//datastore cloud.google.com=
/go/firestore:github.com/googleapis/google-cloud-go/bigquery//firestore clo=
ud.google.com/go/pubsub:github.com/googleapis/google-cloud-go/bigquery//pub=
sub cloud.google.com/go/storage:github.com/googleapis/google-cloud-go/bigqu=
ery//storage dmitri.shuralyov.com/gpu/mtl:dmitri.shuralyov.com/gpu/mtl gith=
ub.com/360EntSecGroup-Skylar/excelize:github.com/360EntSecGroup-Skylar/exce=
lize github.com/Azure/azure-sdk-for-go:github.com/Azure/azure-sdk-for-go gi=
thub.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm github.com/Azure/go=
-autorest:github.com/Azure/go-autorest github.com/Azure/go-autorest/autores=
t:github.com/Azure/go-autorest/autorest//autorest github.com/Azure/go-autor=
est/autorest/adal:github.com/Azure/go-autorest/autorest//autorest/adal gith=
ub.com/Azure/go-autorest/autorest/date:github.com/Azure/go-autorest/autores=
t//autorest/date github.com/Azure/go-autorest/autorest/mocks:github.com/Azu=
re/go-autorest/autorest//autorest/mocks github.com/Azure/go-autorest/autore=
st/to:github.com/Azure/go-autorest/autorest//autorest/to github.com/Azure/g=
o-autorest/autorest/validation:github.com/Azure/go-autorest/autorest//autor=
est/validation github.com/Azure/go-autorest/logger:github.com/Azure/go-auto=
rest/autorest//logger github.com/Azure/go-autorest/tracing:github.com/Azure=
/go-autorest/autorest//tracing github.com/BurntSushi/toml:github.com/BurntS=
ushi/toml github.com/BurntSushi/xgb:github.com/BurntSushi/xgb github.com/Go=
ogleCloudPlatform/k8s-cloud-provider:github.com/GoogleCloudPlatform/k8s-clo=
ud-provider github.com/JeffAshton/win_pdh:github.com/JeffAshton/win_pdh git=
hub.com/MakeNowJust/heredoc:github.com/MakeNowJust/heredoc github.com/Micro=
soft/go-winio:github.com/Microsoft/go-winio github.com/Microsoft/hcsshim:gi=
thub.com/Microsoft/hcsshim github.com/NYTimes/gziphandler:github.com/NYTime=
s/gziphandler github.com/OneOfOne/xxhash:github.com/OneOfOne/xxhash github.=
com/PuerkitoBio/goquery:github.com/PuerkitoBio/goquery github.com/PuerkitoB=
io/purell:github.com/PuerkitoBio/purell github.com/PuerkitoBio/urlesc:githu=
b.com/PuerkitoBio/urlesc github.com/Rican7/retry:github.com/Rican7/retry gi=
thub.com/agnivade/levenshtein:github.com/agnivade/levenshtein github.com/aj=
starks/svgo:github.com/ajstarks/svgo github.com/alecthomas/template:github.=
com/alecthomas/template github.com/alecthomas/units:github.com/alecthomas/u=
nits github.com/alexflint/go-filemutex:github.com/alexflint/go-filemutex gi=
thub.com/andreyvit/diff:github.com/andreyvit/diff github.com/andybalholm/ca=
scadia:github.com/andybalholm/cascadia github.com/antihax/optional:github.c=
om/antihax/optional github.com/armon/circbuf:github.com/armon/circbuf githu=
b.com/armon/consul-api:github.com/armon/consul-api github.com/armon/go-metr=
ics:github.com/armon/go-metrics github.com/armon/go-radix:github.com/armon/=
go-radix github.com/asaskevich/govalidator:github.com/asaskevich/govalidato=
r github.com/auth0/go-jwt-middleware:github.com/auth0/go-jwt-middleware git=
hub.com/aws/aws-sdk-go:github.com/aws/aws-sdk-go github.com/benbjohnson/clo=
ck:github.com/benbjohnson/clock github.com/beorn7/perks:github.com/beorn7/p=
erks github.com/bgentry/speakeasy:github.com/bgentry/speakeasy github.com/b=
its-and-blooms/bitset:github.com/bits-and-blooms/bitset github.com/bketelse=
n/crypt:github.com/bketelsen/crypt github.com/blang/semver:github.com/blang=
/semver github.com/boltdb/bolt:github.com/boltdb/bolt github.com/bronze1man=
/goStrongswanVici:github.com/bronze1man/goStrongswanVici github.com/buger/j=
sonparser:github.com/buger/jsonparser github.com/canonical/go-dqlite:github=
.com/canonical/go-dqlite github.com/census-instrumentation/opencensus-proto=
:github.com/census-instrumentation/opencensus-proto github.com/certifi/goce=
rtifi:github.com/certifi/gocertifi github.com/cespare/xxhash:github.com/ces=
pare/xxhash github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 githu=
b.com/chai2010/gettext-go:github.com/chai2010/gettext-go github.com/checkpo=
int-restore/go-criu/v5:github.com/checkpoint-restore/go-criu/v5 github.com/=
cheggaaa/pb:github.com/cheggaaa/pb github.com/chzyer/logex:github.com/chzye=
r/logex github.com/chzyer/readline:github.com/chzyer/readline github.com/ch=
zyer/test:github.com/chzyer/test github.com/cilium/ebpf:github.com/cilium/e=
bpf github.com/cloudnativelabs/kube-router:github.com/cloudnativelabs/kube-=
router github.com/clusterhq/flocker-go:github.com/clusterhq/flocker-go gith=
ub.com/cncf/udpa/go:github.com/cncf/udpa/go//go github.com/cockroachdb/data=
driven:github.com/cockroachdb/datadriven github.com/cockroachdb/errors:gith=
ub.com/cockroachdb/errors github.com/cockroachdb/logtags:github.com/cockroa=
chdb/logtags github.com/container-storage-interface/spec:github.com/contain=
er-storage-interface/spec github.com/containerd/aufs:github.com/containerd/=
aufs github.com/containerd/btrfs:github.com/containerd/btrfs github.com/con=
tainerd/cgroups:github.com/containerd/cgroups github.com/containerd/console=
:github.com/containerd/console github.com/containerd/containerd:github.com/=
containerd/containerd github.com/containerd/continuity:github.com/container=
d/continuity github.com/containerd/fifo:github.com/containerd/fifo github.c=
om/containerd/fuse-overlayfs-snapshotter:github.com/containerd/fuse-overlay=
fs-snapshotter github.com/containerd/go-cni:github.com/containerd/go-cni gi=
thub.com/containerd/go-runc:github.com/containerd/go-runc github.com/contai=
nerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd/nri:gith=
ub.com/containerd/nri github.com/containerd/stargz-snapshotter:github.com/c=
ontainerd/stargz-snapshotter github.com/containerd/stargz-snapshotter/estar=
gz:github.com/containerd/stargz-snapshotter//estargz github.com/containerd/=
ttrpc:github.com/containerd/ttrpc github.com/containerd/typeurl:github.com/=
containerd/typeurl github.com/containerd/zfs:github.com/containerd/zfs gith=
ub.com/containernetworking/cni:github.com/containernetworking/cni github.co=
m/containernetworking/plugins:github.com/containernetworking/plugins github=
.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/coredns/=
caddy:github.com/coredns/caddy github.com/coredns/corefile-migration:github=
.com/coredns/corefile-migration github.com/coreos/bbolt:github.com/coreos/b=
bolt github.com/coreos/etcd:github.com/coreos/etcd github.com/coreos/go-ipt=
ables:github.com/coreos/go-iptables github.com/coreos/go-oidc:github.com/co=
reos/go-oidc github.com/coreos/go-semver:github.com/coreos/go-semver github=
.com/coreos/go-systemd:github.com/coreos/go-systemd github.com/coreos/go-sy=
stemd/v22:github.com/coreos/go-systemd/v22 github.com/coreos/pkg:github.com=
/coreos/pkg github.com/cpuguy83/go-md2man/v2:github.com/cpuguy83/go-md2man/=
v2 github.com/creack/pty:github.com/creack/pty github.com/cyphar/filepath-s=
ecurejoin:github.com/cyphar/filepath-securejoin github.com/d2g/dhcp4:github=
.com/d2g/dhcp4 github.com/d2g/dhcp4client:github.com/d2g/dhcp4client github=
.com/d2g/dhcp4server:github.com/d2g/dhcp4server github.com/d2g/hardwareaddr=
:github.com/d2g/hardwareaddr github.com/danieljoos/wincred:github.com/danie=
ljoos/wincred github.com/davecgh/go-spew:github.com/davecgh/go-spew github.=
com/daviddengcn/go-colortext:github.com/daviddengcn/go-colortext github.com=
/denverdino/aliyungo:github.com/denverdino/aliyungo github.com/dgrijalva/jw=
t-go:github.com/dgrijalva/jwt-go github.com/dgryski/go-farm:github.com/dgry=
ski/go-farm github.com/dgryski/go-sip13:github.com/dgryski/go-sip13 github.=
com/dnaeon/go-vcr:github.com/dnaeon/go-vcr github.com/docker/cli:github.com=
/docker/cli github.com/docker/distribution:github.com/docker/distribution g=
ithub.com/docker/docker:github.com/docker/docker github.com/docker/docker-c=
redential-helpers:github.com/docker/docker-credential-helpers github.com/do=
cker/go-connections:github.com/docker/go-connections github.com/docker/go-e=
vents:github.com/docker/go-events github.com/docker/go-metrics:github.com/d=
ocker/go-metrics github.com/docker/go-units:github.com/docker/go-units gith=
ub.com/docopt/docopt-go:github.com/docopt/docopt-go github.com/dustin/go-hu=
manize:github.com/dustin/go-humanize github.com/dustmop/soup:github.com/dus=
tmop/soup github.com/eapache/channels:github.com/eapache/channels github.co=
m/eapache/queue:github.com/eapache/queue github.com/elazarl/goproxy:github.=
com/elazarl/goproxy github.com/emicklei/go-restful:github.com/emicklei/go-r=
estful github.com/envoyproxy/go-control-plane:github.com/envoyproxy/go-cont=
rol-plane github.com/envoyproxy/protoc-gen-validate:github.com/envoyproxy/p=
rotoc-gen-validate github.com/erikdubbelboer/gspt:github.com/erikdubbelboer=
/gspt github.com/euank/go-kmsg-parser:github.com/euank/go-kmsg-parser githu=
b.com/evanphx/json-patch:github.com/evanphx/json-patch github.com/exponent-=
io/jsonpath:github.com/exponent-io/jsonpath github.com/fanliao/go-promise:g=
ithub.com/fanliao/go-promise github.com/fatih/camelcase:github.com/fatih/ca=
melcase github.com/fatih/color:github.com/fatih/color github.com/felixge/ht=
tpsnoop:github.com/felixge/httpsnoop github.com/flannel-io/flannel:github.c=
om/flannel-io/flannel github.com/flynn/go-shlex:github.com/flynn/go-shlex g=
ithub.com/fogleman/gg:github.com/fogleman/gg github.com/form3tech-oss/jwt-g=
o:github.com/form3tech-oss/jwt-go github.com/frankban/quicktest:github.com/=
frankban/quicktest github.com/fsnotify/fsnotify:github.com/fsnotify/fsnotif=
y github.com/fvbommel/sortorder:github.com/fvbommel/sortorder github.com/ge=
tsentry/raven-go:github.com/getsentry/raven-go github.com/ghodss/yaml:githu=
b.com/ghodss/yaml github.com/globalsign/mgo:github.com/globalsign/mgo githu=
b.com/go-bindata/go-bindata:github.com/go-bindata/go-bindata github.com/go-=
errors/errors:github.com/go-errors/errors github.com/go-gl/glfw:github.com/=
go-gl/glfw github.com/go-gl/glfw/v3.3/glfw:github.com/go-gl/glfw/v3.3/glfw/=
/v3.3/glfw github.com/go-ini/ini:github.com/go-ini/ini github.com/go-kit/ki=
t:github.com/go-kit/kit github.com/go-kit/log:github.com/go-kit/log github.=
com/go-logfmt/logfmt:github.com/go-logfmt/logfmt github.com/go-logr/logr:gi=
thub.com/go-logr/logr github.com/go-logr/zapr:github.com/go-logr/zapr githu=
b.com/go-openapi/analysis:github.com/go-openapi/analysis github.com/go-open=
api/errors:github.com/go-openapi/errors github.com/go-openapi/jsonpointer:g=
ithub.com/go-openapi/jsonpointer github.com/go-openapi/jsonreference:github=
.com/go-openapi/jsonreference github.com/go-openapi/loads:github.com/go-ope=
napi/loads github.com/go-openapi/runtime:github.com/go-openapi/runtime gith=
ub.com/go-openapi/spec:github.com/go-openapi/spec github.com/go-openapi/str=
fmt:github.com/go-openapi/strfmt github.com/go-openapi/swag:github.com/go-o=
penapi/swag github.com/go-openapi/validate:github.com/go-openapi/validate g=
ithub.com/go-ozzo/ozzo-validation:github.com/go-ozzo/ozzo-validation github=
.com/go-sql-driver/mysql:github.com/go-sql-driver/mysql github.com/go-stack=
/stack:github.com/go-stack/stack github.com/go-task/slim-sprig:github.com/g=
o-task/slim-sprig github.com/go-test/deep:github.com/go-test/deep github.co=
m/goccy/go-json:github.com/goccy/go-json github.com/godbus/dbus:github.com/=
godbus/dbus github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.com/=
gofrs/flock:github.com/gofrs/flock github.com/gofrs/uuid:github.com/gofrs/u=
uid github.com/gogo/googleapis:github.com/gogo/googleapis github.com/gogo/p=
rotobuf:github.com/gogo/protobuf github.com/golang/freetype:github.com/gola=
ng/freetype github.com/golang/glog:github.com/golang/glog github.com/golang=
/groupcache:github.com/golang/groupcache github.com/golang/mock:github.com/=
golang/mock github.com/golang/protobuf:github.com/golang/protobuf github.co=
m/golang/snappy:github.com/golang/snappy github.com/golangplus/bytes:github=
.com/golangplus/bytes github.com/golangplus/fmt:github.com/golangplus/fmt g=
ithub.com/golangplus/testing:github.com/golangplus/testing github.com/googl=
e/btree:github.com/google/btree github.com/google/cadvisor:github.com/googl=
e/cadvisor github.com/google/go-cmp:github.com/google/go-cmp github.com/goo=
gle/go-containerregistry:github.com/google/go-containerregistry github.com/=
google/gofuzz:github.com/google/gofuzz github.com/google/martian:github.com=
/google/martian github.com/google/martian/v3:github.com/google/martian/v3 g=
ithub.com/google/pprof:github.com/google/pprof github.com/google/renameio:g=
ithub.com/google/renameio github.com/google/shlex:github.com/google/shlex g=
ithub.com/google/uuid:github.com/google/uuid github.com/googleapis/gax-go/v=
2:github.com/googleapis/gax-go/v2//v2 github.com/googleapis/gnostic:github.=
com/googleapis/gnostic github.com/gophercloud/gophercloud:github.com/gopher=
cloud/gophercloud github.com/gopherjs/gopherjs:github.com/gopherjs/gopherjs=
 github.com/gorilla/mux:github.com/gorilla/mux github.com/gorilla/websocket=
:github.com/gorilla/websocket github.com/gregjones/httpcache:github.com/gre=
gjones/httpcache github.com/grpc-ecosystem/go-grpc-middleware:github.com/gr=
pc-ecosystem/go-grpc-middleware github.com/grpc-ecosystem/go-grpc-prometheu=
s:github.com/grpc-ecosystem/go-grpc-prometheus github.com/grpc-ecosystem/gr=
pc-gateway:github.com/grpc-ecosystem/grpc-gateway github.com/hanwen/go-fuse=
/v2:github.com/hanwen/go-fuse/v2 github.com/hashicorp/consul/api:github.com=
/hashicorp/consul/api//api github.com/hashicorp/consul/sdk:github.com/hashi=
corp/consul/sdk//sdk github.com/hashicorp/errwrap:github.com/hashicorp/errw=
rap github.com/hashicorp/go-cleanhttp:github.com/hashicorp/go-cleanhttp git=
hub.com/hashicorp/go-hclog:github.com/hashicorp/go-hclog github.com/hashico=
rp/go-immutable-radix:github.com/hashicorp/go-immutable-radix github.com/ha=
shicorp/go-msgpack:github.com/hashicorp/go-msgpack github.com/hashicorp/go-=
multierror:github.com/hashicorp/go-multierror github.com/hashicorp/go-retry=
ablehttp:github.com/hashicorp/go-retryablehttp github.com/hashicorp/go-root=
certs:github.com/hashicorp/go-rootcerts github.com/hashicorp/go-sockaddr:gi=
thub.com/hashicorp/go-sockaddr github.com/hashicorp/go-syslog:github.com/ha=
shicorp/go-syslog github.com/hashicorp/go-uuid:github.com/hashicorp/go-uuid=
 github.com/hashicorp/go.net:github.com/hashicorp/go.net github.com/hashico=
rp/golang-lru:github.com/hashicorp/golang-lru github.com/hashicorp/hcl:gith=
ub.com/hashicorp/hcl github.com/hashicorp/logutils:github.com/hashicorp/log=
utils github.com/hashicorp/mdns:github.com/hashicorp/mdns github.com/hashic=
orp/memberlist:github.com/hashicorp/memberlist github.com/hashicorp/serf:gi=
thub.com/hashicorp/serf github.com/heketi/heketi:github.com/heketi/heketi g=
ithub.com/heketi/tests:github.com/heketi/tests github.com/hpcloud/tail:gith=
ub.com/hpcloud/tail github.com/hugelgupf/socketpair:github.com/hugelgupf/so=
cketpair github.com/ianlancetaylor/demangle:github.com/ianlancetaylor/deman=
gle github.com/imdario/mergo:github.com/imdario/mergo github.com/inconshrev=
eable/mousetrap:github.com/inconshreveable/mousetrap github.com/insomniacsl=
k/dhcp:github.com/insomniacslk/dhcp github.com/ishidawataru/sctp:github.com=
/ishidawataru/sctp github.com/j-keck/arping:github.com/j-keck/arping github=
.com/jessevdk/go-flags:github.com/jessevdk/go-flags github.com/jmespath/go-=
jmespath:github.com/jmespath/go-jmespath github.com/jmespath/go-jmespath/in=
ternal/testify:github.com/jmespath/go-jmespath/internal/testify//internal/t=
estify github.com/joho/godotenv:github.com/joho/godotenv github.com/jonboul=
le/clockwork:github.com/jonboulle/clockwork github.com/josharian/intern:git=
hub.com/josharian/intern github.com/josharian/native:github.com/josharian/n=
ative github.com/jpillora/backoff:github.com/jpillora/backoff github.com/js=
imonetti/rtnetlink:github.com/jsimonetti/rtnetlink github.com/json-iterator=
/go:github.com/json-iterator/go github.com/jstemmer/go-junit-report:github.=
com/jstemmer/go-junit-report github.com/jtolds/gls:github.com/jtolds/gls gi=
thub.com/julienschmidt/httprouter:github.com/julienschmidt/httprouter githu=
b.com/jung-kurt/gofpdf:github.com/jung-kurt/gofpdf github.com/k-sone/critbi=
tgo:github.com/k-sone/critbitgo github.com/k3s-io/helm-controller:github.co=
m/k3s-io/helm-controller github.com/k3s-io/kine:github.com/k3s-io/kine gith=
ub.com/karrick/godirwalk:github.com/karrick/godirwalk github.com/kisielk/er=
rcheck:github.com/kisielk/errcheck github.com/kisielk/gotool:github.com/kis=
ielk/gotool github.com/klauspost/compress:github.com/klauspost/compress git=
hub.com/klauspost/cpuid:github.com/klauspost/cpuid github.com/konsorten/go-=
windows-terminal-sequences:github.com/konsorten/go-windows-terminal-sequenc=
es github.com/kr/fs:github.com/kr/fs github.com/kr/logfmt:github.com/kr/log=
fmt github.com/kr/pretty:github.com/kr/pretty github.com/kr/pty:github.com/=
kr/pty github.com/kr/text:github.com/kr/text github.com/kubernetes-sigs/cri=
-tools:github.com/kubernetes-sigs/cri-tools github.com/kylelemons/godebug:g=
ithub.com/kylelemons/godebug github.com/lib/pq:github.com/lib/pq github.com=
/libopenstorage/openstorage:github.com/libopenstorage/openstorage github.co=
m/liggitt/tabwriter:github.com/liggitt/tabwriter github.com/lithammer/deden=
t:github.com/lithammer/dedent github.com/lpabon/godbc:github.com/lpabon/god=
bc github.com/magiconair/properties:github.com/magiconair/properties github=
.com/mailru/easyjson:github.com/mailru/easyjson github.com/mattn/go-colorab=
le:github.com/mattn/go-colorable github.com/mattn/go-isatty:github.com/matt=
n/go-isatty github.com/mattn/go-runewidth:github.com/mattn/go-runewidth git=
hub.com/mattn/go-shellwords:github.com/mattn/go-shellwords github.com/mattn=
/go-sqlite3:github.com/mattn/go-sqlite3 github.com/matttproud/golang_protob=
uf_extensions:github.com/matttproud/golang_protobuf_extensions github.com/m=
dlayher/ethernet:github.com/mdlayher/ethernet github.com/mdlayher/ethtool:g=
ithub.com/mdlayher/ethtool github.com/mdlayher/genetlink:github.com/mdlayhe=
r/genetlink github.com/mdlayher/netlink:github.com/mdlayher/netlink github.=
com/mdlayher/raw:github.com/mdlayher/raw github.com/mdlayher/socket:github.=
com/mdlayher/socket github.com/miekg/dns:github.com/miekg/dns github.com/mi=
ekg/pkcs11:github.com/miekg/pkcs11 github.com/mikioh/ipaddr:github.com/miki=
oh/ipaddr github.com/mindprince/gonvml:github.com/mindprince/gonvml github.=
com/minio/md5-simd:github.com/minio/md5-simd github.com/minio/minio-go/v7:g=
ithub.com/minio/minio-go/v7 github.com/minio/sha256-simd:github.com/minio/s=
ha256-simd github.com/minio/sio:github.com/minio/sio github.com/mistifyio/g=
o-zfs:github.com/mistifyio/go-zfs github.com/mitchellh/cli:github.com/mitch=
ellh/cli github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir gi=
thub.com/mitchellh/go-testing-interface:github.com/mitchellh/go-testing-int=
erface github.com/mitchellh/go-wordwrap:github.com/mitchellh/go-wordwrap gi=
thub.com/mitchellh/gox:github.com/mitchellh/gox github.com/mitchellh/iochan=
:github.com/mitchellh/iochan github.com/mitchellh/mapstructure:github.com/m=
itchellh/mapstructure github.com/moby/ipvs:github.com/moby/ipvs github.com/=
moby/locker:github.com/moby/locker github.com/moby/spdystream:github.com/mo=
by/spdystream github.com/moby/sys/mountinfo:github.com/moby/sys/mountinfo//=
mountinfo github.com/moby/sys/symlink:github.com/moby/sys/mountinfo//symlin=
k github.com/moby/term:github.com/moby/term github.com/moby/vpnkit:github.c=
om/moby/vpnkit github.com/modern-go/concurrent:github.com/modern-go/concurr=
ent github.com/modern-go/reflect2:github.com/modern-go/reflect2 github.com/=
mohae/deepcopy:github.com/mohae/deepcopy github.com/monochromegane/go-gitig=
nore:github.com/monochromegane/go-gitignore github.com/morikuni/aec:github.=
com/morikuni/aec github.com/mrunalp/fileutils:github.com/mrunalp/fileutils =
github.com/munnerz/goautoneg:github.com/munnerz/goautoneg github.com/mvdan/=
xurls:github.com/mvdan/xurls github.com/mwitkow/go-conntrack:github.com/mwi=
tkow/go-conntrack github.com/mxk/go-flowrate:github.com/mxk/go-flowrate git=
hub.com/natefinch/lumberjack:github.com/natefinch/lumberjack github.com/nie=
meyer/pretty:github.com/niemeyer/pretty github.com/nxadm/tail:github.com/nx=
adm/tail github.com/oklog/ulid:github.com/oklog/ulid github.com/olekukonko/=
tablewriter:github.com/olekukonko/tablewriter github.com/onsi/ginkgo:github=
.com/onsi/ginkgo github.com/onsi/gomega:github.com/onsi/gomega github.com/o=
pencontainers/go-digest:github.com/opencontainers/go-digest github.com/open=
containers/image-spec:github.com/opencontainers/image-spec github.com/openc=
ontainers/runc:github.com/opencontainers/runc github.com/opencontainers/run=
time-spec:github.com/opencontainers/runtime-spec github.com/opencontainers/=
selinux:github.com/opencontainers/selinux github.com/opentracing/opentracin=
g-go:github.com/opentracing/opentracing-go github.com/osrg/gobgp:github.com=
/osrg/gobgp github.com/otiai10/copy:github.com/otiai10/copy github.com/otia=
i10/curr:github.com/otiai10/curr github.com/otiai10/mint:github.com/otiai10=
/mint github.com/pascaldekloe/goe:github.com/pascaldekloe/goe github.com/pa=
ulmach/orb:github.com/paulmach/orb github.com/pborman/uuid:github.com/pborm=
an/uuid github.com/pelletier/go-buffruneio:github.com/pelletier/go-buffrune=
io github.com/pelletier/go-toml:github.com/pelletier/go-toml github.com/pet=
erbourgon/diskv:github.com/peterbourgon/diskv github.com/pierrec/lz4:github=
.com/pierrec/lz4 github.com/pkg/errors:github.com/pkg/errors github.com/pkg=
/sftp:github.com/pkg/sftp github.com/pmezard/go-difflib:github.com/pmezard/=
go-difflib github.com/posener/complete:github.com/posener/complete github.c=
om/pquerna/cachecontrol:github.com/pquerna/cachecontrol github.com/promethe=
us/client_golang:github.com/prometheus/client_golang github.com/prometheus/=
client_model:github.com/prometheus/client_model github.com/prometheus/commo=
n:github.com/prometheus/common github.com/prometheus/procfs:github.com/prom=
etheus/procfs github.com/prometheus/tsdb:github.com/prometheus/tsdb github.=
com/qri-io/starlib:github.com/qri-io/starlib github.com/quobyte/api:github.=
com/quobyte/api github.com/rancher/dynamiclistener:github.com/rancher/dynam=
iclistener github.com/rancher/lasso:github.com/rancher/lasso github.com/ran=
cher/remotedialer:github.com/rancher/remotedialer github.com/rancher/wharfi=
e:github.com/rancher/wharfie github.com/rancher/wrangler:github.com/rancher=
/wrangler github.com/remyoudompheng/bigfft:github.com/remyoudompheng/bigfft=
 github.com/robfig/cron/v3:github.com/robfig/cron/v3 github.com/rogpeppe/fa=
stuuid:github.com/rogpeppe/fastuuid github.com/rogpeppe/go-internal:github.=
com/rogpeppe/go-internal github.com/rootless-containers/rootlesskit:github.=
com/rootless-containers/rootlesskit github.com/rs/xid:github.com/rs/xid git=
hub.com/rubiojr/go-vhd:github.com/rubiojr/go-vhd github.com/russross/blackf=
riday:github.com/russross/blackfriday github.com/russross/blackfriday/v2:gi=
thub.com/russross/blackfriday/v2 github.com/ryanuber/columnize:github.com/r=
yanuber/columnize github.com/safchain/ethtool:github.com/safchain/ethtool g=
ithub.com/satori/go.uuid:github.com/satori/go.uuid github.com/sean-/seed:gi=
thub.com/sean-/seed github.com/seccomp/libseccomp-golang:github.com/seccomp=
/libseccomp-golang github.com/sergi/go-diff:github.com/sergi/go-diff github=
.com/shurcooL/sanitized_anchor_name:github.com/shurcooL/sanitized_anchor_na=
me github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/smartys=
treets/assertions:github.com/smartystreets/assertions github.com/smartystre=
ets/goconvey:github.com/smartystreets/goconvey github.com/soheilhy/cmux:git=
hub.com/soheilhy/cmux github.com/songgao/water:github.com/songgao/water git=
hub.com/spaolacci/murmur3:github.com/spaolacci/murmur3 github.com/spf13/afe=
ro:github.com/spf13/afero github.com/spf13/cast:github.com/spf13/cast githu=
b.com/spf13/cobra:github.com/spf13/cobra github.com/spf13/jwalterweatherman=
:github.com/spf13/jwalterweatherman github.com/spf13/pflag:github.com/spf13=
/pflag github.com/spf13/viper:github.com/spf13/viper github.com/stefanberge=
r/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/stoewer/go-s=
trcase:github.com/stoewer/go-strcase github.com/storageos/go-api:github.com=
/storageos/go-api github.com/stretchr/objx:github.com/stretchr/objx github.=
com/stretchr/testify:github.com/stretchr/testify github.com/subosito/gotenv=
:github.com/subosito/gotenv github.com/syndtr/gocapability:github.com/syndt=
r/gocapability github.com/tchap/go-patricia:github.com/tchap/go-patricia gi=
thub.com/tencentcloud/tencentcloud-sdk-go:github.com/tencentcloud/tencentcl=
oud-sdk-go github.com/tidwall/pretty:github.com/tidwall/pretty github.com/t=
mc/grpc-websocket-proxy:github.com/tmc/grpc-websocket-proxy github.com/u-ro=
ot/u-root:github.com/u-root/u-root github.com/ugorji/go:github.com/ugorji/g=
o github.com/urfave/cli:github.com/urfave/cli github.com/urfave/cli/v2:gith=
ub.com/urfave/cli/v2 github.com/urfave/negroni:github.com/urfave/negroni gi=
thub.com/vbatts/tar-split:github.com/vbatts/tar-split github.com/vektah/gql=
parser:github.com/vektah/gqlparser github.com/vishvananda/netlink:github.co=
m/vishvananda/netlink github.com/vishvananda/netns:github.com/vishvananda/n=
etns github.com/vmware/govmomi:github.com/vmware/govmomi github.com/willf/b=
itset:github.com/willf/bitset github.com/xiang90/probing:github.com/xiang90=
/probing github.com/xlab/treeprint:github.com/xlab/treeprint github.com/xor=
dataexchange/crypt:github.com/xordataexchange/crypt github.com/yuin/goldmar=
k:github.com/yuin/goldmark go.etcd.io/bbolt:go.etcd.io/bbolt go.etcd.io/etc=
d:go.etcd.io/etcd go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/cli=
ent/pkg/v3//client/pkg go.etcd.io/etcd/client/v2:github.com/etcd-io/etcd/cl=
ient/v2//client/v2 go.etcd.io/etcd/pkg/v3:github.com/etcd-io/etcd/client/pk=
g/v3//pkg go.etcd.io/etcd/raft/v3:github.com/etcd-io/etcd/client/pkg/v3//ra=
ft go.etcd.io/etcd/api/v3:github.com/k3s-io/etcd/api/v3//api go.etcd.io/etc=
d/client/v3:github.com/k3s-io/etcd/api/v3//client/v3 go.etcd.io/etcd/etcdut=
l/v3:github.com/k3s-io/etcd/api/v3//etcdutl go.etcd.io/etcd/server/v3:githu=
b.com/k3s-io/etcd/api/v3//server go.mozilla.org/pkcs7:go.mozilla.org/pkcs7 =
go.opencensus.io:go.opencensus.io go.opentelemetry.io/contrib:go.openteleme=
try.io/contrib go.opentelemetry.io/contrib/instrumentation/google.golang.or=
g/grpc/otelgrpc:go.opentelemetry.io/contrib//instrumentation/google.golang.=
org/grpc/otelgrpc go.opentelemetry.io/contrib/instrumentation/net/http/otel=
http:go.opentelemetry.io/contrib//instrumentation/net/http/otelhttp go.open=
telemetry.io/otel:go.opentelemetry.io/otel go.opentelemetry.io/otel/exporte=
rs/otlp:go.opentelemetry.io/otel//exporters/otlp go.opentelemetry.io/otel/m=
etric:go.opentelemetry.io/otel//metric go.opentelemetry.io/otel/oteltest:go=
.opentelemetry.io/otel//oteltest go.opentelemetry.io/otel/sdk:go.openteleme=
try.io/otel//sdk go.opentelemetry.io/otel/sdk/export/metric:go.opentelemetr=
y.io/otel//sdk/export/metric go.opentelemetry.io/otel/sdk/metric:go.opentel=
emetry.io/otel//sdk/metric go.opentelemetry.io/otel/trace:go.opentelemetry.=
io/otel//trace go.opentelemetry.io/proto/otlp:github.com/open-telemetry/ope=
ntelemetry-proto-go/otlp//otlp go.starlark.net:github.com/google/starlark-g=
o go.uber.org/atomic:go.uber.org/atomic go.uber.org/goleak:go.uber.org/gole=
ak go.uber.org/multierr:go.uber.org/multierr go.uber.org/zap:go.uber.org/za=
p golang.org/x/crypto:github.com/golang/crypto golang.org/x/exp:github.com/=
golang/exp golang.org/x/image:github.com/golang/image golang.org/x/lint:git=
hub.com/golang/lint golang.org/x/mobile:github.com/golang/mobile golang.org=
/x/mod:github.com/golang/mod golang.org/x/net:github.com/golang/net golang.=
org/x/oauth2:github.com/golang/oauth2 golang.org/x/sync:github.com/golang/s=
ync golang.org/x/sys:github.com/golang/sys golang.org/x/term:github.com/gol=
ang/term golang.org/x/text:github.com/golang/text golang.org/x/time:github.=
com/golang/time golang.org/x/tools:github.com/golang/tools golang.org/x/xer=
rors:github.com/golang/xerrors golang.zx2c4.com/go118/netip:golang.zx2c4.co=
m/go118/netip golang.zx2c4.com/wintun:golang.zx2c4.com/wintun golang.zx2c4.=
com/wireguard:golang.zx2c4.com/wireguard golang.zx2c4.com/wireguard/wgctrl:=
golang.zx2c4.com/wireguard/wgctrl gonum.org/v1/gonum:github.com/gonum/gonum=
 gonum.org/v1/netlib:github.com/gonum/netlib gonum.org/v1/plot:github.com/g=
onum/plot google.golang.org/api:google.golang.org/api google.golang.org/app=
engine:google.golang.org/appengine google.golang.org/genproto:google.golang=
.org/genproto google.golang.org/grpc:google.golang.org/grpc google.golang.o=
rg/grpc/cmd/protoc-gen-go-grpc:google.golang.org/grpc/cmd/protoc-gen-go-grp=
c google.golang.org/protobuf:google.golang.org/protobuf gopkg.in/airbrake/g=
obrake.v2:gopkg.in/airbrake/gobrake.v2 gopkg.in/alecthomas/kingpin.v2:gopkg=
.in/alecthomas/kingpin.v2 gopkg.in/check.v1:gopkg.in/check.v1 gopkg.in/cheg=
gaaa/pb.v1:gopkg.in/cheggaaa/pb.v1 gopkg.in/errgo.v2:gopkg.in/errgo.v2 gopk=
g.in/fsnotify.v1:gopkg.in/fsnotify.v1 gopkg.in/gcfg.v1:gopkg.in/gcfg.v1 gop=
kg.in/gemnasium/logrus-airbrake-hook.v2:gopkg.in/gemnasium/logrus-airbrake-=
hook.v2 gopkg.in/inf.v0:gopkg.in/inf.v0 gopkg.in/ini.v1:gopkg.in/ini.v1 gop=
kg.in/natefinch/lumberjack.v2:gopkg.in/natefinch/lumberjack.v2 gopkg.in/res=
ty.v1:gopkg.in/resty.v1 gopkg.in/square/go-jose.v2:gopkg.in/square/go-jose.=
v2 gopkg.in/tomb.v1:gopkg.in/tomb.v1 gopkg.in/warnings.v0:gopkg.in/warnings=
.v0 gopkg.in/yaml.v2:gopkg.in/yaml.v2 gopkg.in/yaml.v3:gopkg.in/yaml.v3 got=
est.tools:gotest.tools gotest.tools/v3:github.com/gotestyourself/gotest.too=
ls/v3 honnef.co/go/tools:honnef.co/go/tools inet.af/tcpproxy:inet.af/tcppro=
xy k8s.io/api:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/=
src/k8s.io/api k8s.io/apiextensions-apiserver:github.com/k3s-io/kubernetes/=
staging/src/k8s.io/api//staging/src/k8s.io/apiextensions-apiserver k8s.io/a=
pimachinery:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/sr=
c/k8s.io/apimachinery k8s.io/apiserver:github.com/k3s-io/kubernetes/staging=
/src/k8s.io/api//staging/src/k8s.io/apiserver k8s.io/cli-runtime:github.com=
/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/cli-runtime k=
8s.io/client-go:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//stagin=
g/src/k8s.io/client-go k8s.io/cloud-provider:github.com/k3s-io/kubernetes/s=
taging/src/k8s.io/api//staging/src/k8s.io/cloud-provider k8s.io/cluster-boo=
tstrap:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s=
.io/cluster-bootstrap k8s.io/code-generator:github.com/k3s-io/kubernetes/st=
aging/src/k8s.io/api//staging/src/k8s.io/code-generator k8s.io/component-ba=
se:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/=
component-base k8s.io/component-helpers:github.com/k3s-io/kubernetes/stagin=
g/src/k8s.io/api//staging/src/k8s.io/component-helpers k8s.io/controller-ma=
nager:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.=
io/controller-manager k8s.io/cri-api:github.com/k3s-io/kubernetes/staging/s=
rc/k8s.io/api//staging/src/k8s.io/cri-api k8s.io/csi-translation-lib:github=
.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/csi-trans=
lation-lib k8s.io/kube-aggregator:github.com/k3s-io/kubernetes/staging/src/=
k8s.io/api//staging/src/k8s.io/kube-aggregator k8s.io/kube-controller-manag=
er:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/=
kube-controller-manager k8s.io/kube-proxy:github.com/k3s-io/kubernetes/stag=
ing/src/k8s.io/api//staging/src/k8s.io/kube-proxy k8s.io/kube-scheduler:git=
hub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/kube-s=
cheduler k8s.io/kubectl:github.com/k3s-io/kubernetes/staging/src/k8s.io/api=
//staging/src/k8s.io/kubectl k8s.io/kubelet:github.com/k3s-io/kubernetes/st=
aging/src/k8s.io/api//staging/src/k8s.io/kubelet k8s.io/kubernetes:github.c=
om/k3s-io/kubernetes/staging/src/k8s.io/api k8s.io/legacy-cloud-providers:g=
ithub.com/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/lega=
cy-cloud-providers k8s.io/metrics:github.com/k3s-io/kubernetes/staging/src/=
k8s.io/api//staging/src/k8s.io/metrics k8s.io/mount-utils:github.com/k3s-io=
/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/mount-utils k8s.io/p=
od-security-admission:github.com/k3s-io/kubernetes/staging/src/k8s.io/api//=
staging/src/k8s.io/pod-security-admission k8s.io/sample-apiserver:github.co=
m/k3s-io/kubernetes/staging/src/k8s.io/api//staging/src/k8s.io/sample-apise=
rver k8s.io/gengo:k8s.io/gengo k8s.io/klog:k8s.io/klog k8s.io/klog/v2:githu=
b.com/k3s-io/klog/v2 k8s.io/kube-openapi:k8s.io/kube-openapi k8s.io/system-=
validators:k8s.io/system-validators k8s.io/utils:k8s.io/utils modernc.org/c=
c:modernc.org/cc modernc.org/golex:modernc.org/golex modernc.org/mathutil:m=
odernc.org/mathutil modernc.org/strutil:modernc.org/strutil modernc.org/xc:=
modernc.org/xc rsc.io/binaryregexp:rsc.io/binaryregexp rsc.io/pdf:rsc.io/pd=
f rsc.io/quote/v3:github.com/rsc/quote/v3//v3 rsc.io/sampler:rsc.io/sampler=
 sigs.k8s.io/apiserver-network-proxy/konnectivity-client:github.com/kuberne=
tes-sigs/apiserver-network-proxy/konnectivity-client//konnectivity-client s=
igs.k8s.io/cli-utils:sigs.k8s.io/cli-utils sigs.k8s.io/controller-runtime:s=
igs.k8s.io/controller-runtime sigs.k8s.io/kustomize/api:github.com/kubernet=
es-sigs/kustomize/api//api sigs.k8s.io/kustomize/cmd/config:github.com/kube=
rnetes-sigs/kustomize/api//cmd/config sigs.k8s.io/kustomize/kustomize/v4:gi=
thub.com/kubernetes-sigs/kustomize/api//kustomize sigs.k8s.io/kustomize/kya=
ml:github.com/kubernetes-sigs/kustomize/api//kyaml sigs.k8s.io/structured-m=
erge-diff/v4:github.com/kubernetes-sigs/structured-merge-diff/v4 sigs.k8s.i=
o/testing_frameworks:sigs.k8s.io/testing_frameworks sigs.k8s.io/yaml:sigs.k=
8s.io/yaml sigs.k8s.io/json:sigs.k8s.io/json"
>          for s in $sites; do
>              site_dest=3D$(echo $s | cut -d: -f1)
>              site_source=3D$(echo $s | cut -d: -f2)
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7347): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7347
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

