Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5E0C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:58:14 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.18531.1690909091499705843
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Aug 2023 09:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DMow5/rs;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-790b95beeedso44156239f.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690909091; x=1691513891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eQL9KFwG52K4VVuEUtD3pKZfAdC6RYNUj/G3uwHOi0=;
        b=DMow5/rsrFqYnDfDiHjnQsSztPGPzpjZ50eEUQxBUyYCdfK485JaRT+MrqgGBulwuf
         WCfceL11JtK/4FpsoHyzJM/b+crSWsFJ64wN1EtvlbdaEsPZonTVmjXMbMfxFn8pPWR5
         qHzlSnQmnNSi4tLD98ftsWFAeoLHCblwAheZo+1o0TFNbqnDRAr3YCVOmm3/JbjJOTJw
         iXl0ftJZuSmwtN1RnuKu3bHgnDBOTWGc49kvthBV21VsySmNuLzHjLjopHGAO9Zv8d0Z
         iM41jU6O0Vo5iolT1yXSC5cPyPE6d/X4jzUoOPNV5UEuqwMM+Wp7Gex8f5ADYTDXiJS+
         lP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690909091; x=1691513891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eQL9KFwG52K4VVuEUtD3pKZfAdC6RYNUj/G3uwHOi0=;
        b=jt2sFD6DIYO4myvCDCRZmyX5zsw+cALEG/C0xkRqaShv+cPB/KefY8Y4sx+Kw0hHnu
         vEg7WXaP/CkuY0hnery4hB4UH9sznyokmEVnUqvW4wvOR2ZQCXfHkP7VZSo9oX2+6LzY
         Ah8A/VWNkwFJ0nEX4tsWGDxJzYK4GGlFMmvhtPM9z61dhhFZJpxvzCJ4UYio0jx1dQ1a
         9luhuxa0ginRQIE65TkdfNsD+0YIXADQCgqy34VyxlvE+bZTq8uwGpqaL/v8pAwmuavZ
         i4iYQ6ypyMTh2s849K0koZKpW3Buc8wJlnXqIoJILY0nQAPrZ0tdGRue6fP7Z3bvDqil
         BbGQ==
X-Gm-Message-State: ABy/qLa5xWIscx64M8xy05ordDzsTfHshC6gktY2dILmqZnv07OkZBhy
	rBBMUiuwM8s2lMbp0w+P+QsjMnPCoadGVnqWmDg=
X-Google-Smtp-Source: APBJJlHtwrKpVXDKwzvkHsvH5hySbKeBkUXSdGg5lTRRuVSymuykvqzXCJAfgwGkgTXaqd6bGfd6U0Xq0DThWtb1b2o=
X-Received: by 2002:a5e:a90f:0:b0:790:a23b:1dfc with SMTP id
 c15-20020a5ea90f000000b00790a23b1dfcmr7652814iod.9.1690909090685; Tue, 01 Aug
 2023 09:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230731211217.2154738-1-joe.slater@windriver.com>
 <3c950663-dae3-9043-e999-b3209cbf8ad7@windriver.com> <DM6PR11MB3993DB0E0253481B0E1A9B20880AA@DM6PR11MB3993.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3993DB0E0253481B0E1A9B20880AA@DM6PR11MB3993.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Aug 2023 12:58:09 -0400
Message-ID: <CADkTA4M33G-if1siCGYLcMP7hb5xEN7a_VwoApnM19_L6go_JA@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] python3-nacl: add RCONFLICTS
To: joe.slater@windriver.com
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 16:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8157

On Tue, Aug 1, 2023 at 10:49=E2=80=AFAM Joe Slater via lists.yoctoproject.o=
rg
<joe.slater=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
>
>
>
>
> From: MacLeod, Randy <Randy.MacLeod@windriver.com>
> Sent: Monday, July 31, 2023 5:47 PM
> To: Slater, Joseph <joe.slater@windriver.com>; meta-virtualization@lists.=
yoctoproject.org
> Subject: Re: [meta-virt][PATCH 1/1] python3-nacl: add RCONFLICTS
>
>
>
> On 2023-07-31 17:12, joe.slater@windriver.com wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
>
>
> We conflict with python3-pynacl in the meta-python layer.
>
>
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>
> ---
>
>  recipes-devtools/python/python3-nacl_1.3.0.bb | 4 ++++
>
>  1 file changed, 4 insertions(+)
>
>
>
> diff --git a/recipes-devtools/python/python3-nacl_1.3.0.bb b/recipes-devt=
ools/python/python3-nacl_1.3.0.bb
>
> index 42a3cd9d..e6a844bc 100644
>
> --- a/recipes-devtools/python/python3-nacl_1.3.0.bb
>
> +++ b/recipes-devtools/python/python3-nacl_1.3.0.bb
>
> @@ -21,6 +21,10 @@ RDEPENDS:${PN}:class-target +=3D " \
>
>      python3-pycparser \
>
>  "
>
>
>
> +# We conflict with a package in meta-python.
>
> +#
>
> +RCONFLICTS:${PN} +=3D "python3-pynacl"
>
> +
>
> Having one version of a package conflict with itself or another version i=
n another layer seems wrong...
>
> Usually, if there are two versions we add PREFERRED_VERSION in say this f=
ile or in a conf file.
>
> Since this is for the master development branch, why not update whatever =
package is
> encountering a problem? What is the issue that you're trying to solve?
>
> [Slater, Joseph]
>
> The problem is that one cannot put both python3-nacl and python3-pynacl i=
nto an image, so at least one of them should point that out.  Since meta-vi=
rt depends on meta-python, python3-nacl should probably disappear, but I th=
ink that=E2=80=99s a call for the layer maintainers.


Even if you are using outlook, it is possible to configure it for
easier to read replies ... I suggest having a look at the settings!

That being said, we've been testing against that module, so I'm
inclined to leave it as-is.

I'll take the RCONFLICTS patch, since it is non invasive and can
prevent some misconfigurations.

Bruce

>
> Joe
>
>
>
>  export SODIUM_INSTALL =3D "system"
>
>
>
>  BBCLASSEXTEND =3D "native"
>
>
>
> --
>
> # Randy MacLeod
>
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8156): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8156
> Mute This Topic: https://lists.yoctoproject.org/mt/100471112/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

