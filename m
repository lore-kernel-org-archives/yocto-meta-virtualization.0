Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADE5C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 22:08:39 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.6861.1678313313687241588
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Mar 2023 14:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SDSepKCd;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id l18so55601qtp.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Mar 2023 14:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678313313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SpfQ4JchOS+9sZsbdFfbh5+o9LSQBoLs1i0agQLtTHE=;
        b=SDSepKCdRq+zHKOO9r8cL2Ms1FIpG7B3sBSKSRpuUXUtU1uwar6kZFNyHiMWFOw6j6
         fqwSAOUKNXnW8oRnniW4eNy9CuXHEQSE3K6PIDveVtBmlIiaOnvnxoDIlW/5vM0Xt/dq
         FYxC166LoCyDSfoGLG0ALZ3xu+/I3SAtR4knd1RJb37n855d2NgFF4roNcYLt+pUDrOD
         XvUbpk1pYyOOB2oSVrEkKvyWLYwQ2QwlLnoIvTSuQRfd5NPfumhDNt2yXBUGrKlmvnZv
         0OX0YVsdiDhXQW4BI6kY8a1zOltIo17yjTryVwIufV4lVPiZ8hzxIIauiJ21ZTv6197k
         RrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678313313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SpfQ4JchOS+9sZsbdFfbh5+o9LSQBoLs1i0agQLtTHE=;
        b=vqJSnSGn0ryDUdm4h5cWoCZtB+o9rMivWot8B9rgwGY6EuuWxivqKKhupgt7K9756u
         zuD/LzFXYh0f0YYroHNXtpp1icbOoYjDDy6LxfYL4RK1PPDRMeUmPWYUo7ZdRjjtRfZ3
         ZJaTum6uVV+eb5mHg+K4NMf+hiUAgnkvXX9jSOh3hGnDuskS4DEcdhOimOMskNm/PTmI
         GCoJWxWRSh5HyfuJA4TgwgtYYzBFpPKnzC6Zluvd4nT69QgkKD3msAXbN2gupkeImZWl
         /1zHbXxZmkJ/7NvcPLTTE+5bBQzLju6tsZ6mqqAOmDZJEQ6zSXsl32ePzDYtBftR27Ly
         tBTA==
X-Gm-Message-State: AO0yUKUURFnH+k31ZAIiHHVd02BNuHezSZyLU0gv7lREHunYkWk52Myq
	UZIokNC8LCrDZmJ0ARSuR64BVn5Yybo1aw==
X-Google-Smtp-Source: AK7set8yMV3InwPYdMddY7p7c/ysSq570C5sE3Y+KI2q7P+rjs+4pQlbWfZNrTSxREi/8h/18mStKw==
X-Received: by 2002:a05:622a:314:b0:3b6:8bc3:a09c with SMTP id q20-20020a05622a031400b003b68bc3a09cmr30960111qtw.25.1678313312742;
        Wed, 08 Mar 2023 14:08:32 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id d8-20020a05622a05c800b003bfb845497dsm12548882qtb.97.2023.03.08.14.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 14:08:32 -0800 (PST)
Date: Wed, 8 Mar 2023 17:08:30 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2] yq: drop {LINKSHARED}
Message-ID: <ZAkHXq3nmhgBYeAJ@gmail.com>
References: <CADkTA4Ooi+Y0Nq=eJY+KwEDVe+jUTht_tpzFqF_wmrf4kj7gBQ@mail.gmail.com>
 <20230308034250.1882056-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230308034250.1882056-1-mingli.yu@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Mar 2023 22:08:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7936

v2 looks much better!

merged.

Bruce

In message: [meta-virtualization] [PATCH v2] yq: drop {LINKSHARED}
on 08/03/2023 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> Redefine do_compile logic to drop {LINKSHARED} to fix the
> below build failure.
>   WARNING: /build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3d=
f146f3e2c0f8c765a6ef9e35780ad8cc1-r0/temp/run.do_compile.923432:185 exit 1 =
=66rom 'aarch64-wrs-linux-go install -linkshared -p 48 -v -ldflags=3D"-r /u=
sr/lib64/go/pkg/linux_arm64_dynlink  -I /lib64/ld-linux-aarch64.so.1  -extl=
dflags ' -mcpu=3Dcortex-a53 -march=3Darmv8-a+crc -fstack-protector-strong  =
-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secur=
ity --sysroot=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6c=
f3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe-sysroot -Wl,-rpath-link=3D/b=
uild/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c76=
5a6ef9e35780ad8cc1-r0/recipe-sysroot/usr/lib64/go/pkg/linux_arm64_dynlink -=
Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/build/t=
mp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9=
e35780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1=3D/us=
r/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdeb=
ug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6c=
f3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/yq-4.30.8+gitdd6cf3df146f3e2c0f8c76=
5a6ef9e35780ad8cc1=3D/usr/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6e=
f9e35780ad8cc1-r0  -fmacro-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs=
-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/us=
r/src/debug/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdeb=
ug-prefix-map=3D/build/tmp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6c=
f3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/build=3D/usr/src/debug/yq/4.30.8+gi=
tdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0  -fdebug-prefix-map=3D/build/t=
mp-glibc/work/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9=
e35780ad8cc1-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/build/tmp-glibc/wo=
rk/cortexa53-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc=
1-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/build/tmp-glibc/work/cortexa5=
3-wrs-linux/yq/4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0/recipe=
-sysroot-native=3D  -Wl,-z,relro,-z,now'" -trimpath -buildmode=3Dpie `go_li=
st_packages`'
>=20
>  Before the patch:
>  # rpm -ql yq
>  /usr
>  /usr/bin
>  /usr/bin/yq
>=20
>  # du -sh /usr/bin/yq
>  5.2M	/usr/bin/yq
>=20
>  After the patch:
>  # rpm -ql yq
>  /usr
>  /usr/bin
>  /usr/bin/yq
>=20
>  # du -sh /usr/bin/yq
>  9.0M	/usr/bin/yq
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-devtools/yq/yq_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index 45f2f970..bd474a79 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -50,7 +50,7 @@ GO_IMPORT =3D "github.com/mikefarah/yq"
> =20
>  inherit go ptest
> =20
> -do_compile:prepend() {
> +do_compile() {
>      # arrange for some of the golang built ins to be found
>      (
>  	cd ${WORKDIR}/build/src/
> @@ -60,6 +60,7 @@ do_compile:prepend() {
>      # arrange for the fetched dependencies to be found
>      export GOPATH=3D"${GOPATH}:${WORKDIR}/build/vendor/"
>      export GO111MODULE=3Doff
> +    ${GO} install ${GOBUILDFLAGS} `go_list_packages`
>  }
> =20
>  do_install:append() {
> --=20
> 2.25.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7933): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7933
> Mute This Topic: https://lists.yoctoproject.org/mt/97466079/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


