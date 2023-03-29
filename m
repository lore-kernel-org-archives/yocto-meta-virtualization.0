Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8716FC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 17:21:26 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.2517.1680110478639345973
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 10:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VrtQD2Zo;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id h14so7092377ilj.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680110478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ustXyGKwzuvlA23Jswlk8PXv3RJNjyXT1KPtogkVKe0=;
        b=VrtQD2ZoxGBAJo/yFhNPL3qQT00mrXONZEWX9rnddTGfUi/P8CXBNLWbuvr4CkcX1e
         4d/F5zi6nq84bFLkKMrwN/wiUDD93bd55vgBttjjEveu2BBkgx9deL3AkegOX0HW++BB
         6nwYj/3YOaA5WjiKuYFhvQcqzGSDhLm/ndti12/inEKpg2NhiXbxvW2PCxmIfmluYSw3
         /1BvwynR4DUMkmtRQQ5Y0RcaLQ1vb+jxe5NvSSIRENCYf6mhaoSdJr/9OpJQJrTyrRA0
         YL6hcMU4GJsVTs5hs2RuZ+kuRs4dRdhCOKiloQMH8/5K6HJ5umv1MLwLkqaXu15WpZIx
         8L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680110478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ustXyGKwzuvlA23Jswlk8PXv3RJNjyXT1KPtogkVKe0=;
        b=F77/38ag4ZRgU1E1f9QN2t9z9qGSOcmmKSFGHg98qVoDAAjTDwX1yU5YDFUqiwWDCA
         h23R91fsThcCqMxzmZBdM11zhHcXpDdrpK7cPr/CazDzzvEsVROImxa75MidYBidUg0k
         HzzHHf9rt++Rre/YDpfCudnwkOUrfDYV+XRqs+qQI6ta5MCc2YMp3nIRmTxQvZp0qpTg
         fUq2UEFyiwxjAjxUPVb6fuW+ZbhD5EUllpYMTaz9Kns7N97HypqPW+O2ycj17DEkLEYU
         7+fLSyo4Lg/wk1HngMFyVghtTTU3zjpxG/3xWXqtcV5nUaXNdxT3rOxvym4Rj87BbpAW
         0XrA==
X-Gm-Message-State: AAQBX9d7lf8Cr4PcOwjPbexyQ4unmZbdhboZjh7s00krHtcxOw0P2kx7
	MvCCjFP+MqAeSuJ9rmTSmZHF2AhZzP+AD6IzuJQ=
X-Google-Smtp-Source: AKy350Y5YhxH3i6jZwzWdjY/IMv8EDZ+soc0NY379qtNMYVtjX/6b+Qbl+bBAVPu//jRPfG8XsBaA7obcQIuYySd5RA=
X-Received: by 2002:a92:c264:0:b0:323:17d:1e42 with SMTP id
 h4-20020a92c264000000b00323017d1e42mr10481541ild.5.1680110477828; Wed, 29 Mar
 2023 10:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230329141847.337386-1-joakimr@axis.com> <CANPvuRnL62+UmHEBMkiSqadLD5HnoX=kiDkep-pXoxcox+KXgg@mail.gmail.com>
In-Reply-To: <CANPvuRnL62+UmHEBMkiSqadLD5HnoX=kiDkep-pXoxcox+KXgg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 Mar 2023 13:21:06 -0400
Message-ID: <CADkTA4Mugnpj6jFrmmF4hN6gv+oZ=3=bKMa6T=Mo_tssT6Q+ZQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] upx: Bump to v3.99
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, meta-virtualization@lists.yoctoproject.org, 
	Joakim Roubert <joakimr@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Mar 2023 17:21:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7965

On Wed, Mar 29, 2023 at 1:18=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
> Hi Joakim,
>
> Joakim Roubert <joakim.roubert@axis.com> escreveu no dia quarta, 29/03/20=
23 =C3=A0(s) 15:19:
>>
>> It seems there has been recent changes to the UPX repo that make the
>> current 3.96 setup here fail now. This patch mitigates that and also
>> bumps UPX to version 3.99.
>>
>> Change-Id: I9fb718c9e98340a85997fde6c9d7c3fa1472d263
>> Signed-off-by: Joakim Roubert <joakimr@axis.com>
>> ---
>>  recipes-extended/upx/upx_git.bb | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_=
git.bb
>> index bb8004c6..3cf82065 100644
>> --- a/recipes-extended/upx/upx_git.bb
>> +++ b/recipes-extended/upx/upx_git.bb
>> @@ -1,13 +1,13 @@
>>  HOMEPAGE =3D "http://upx.sourceforge.net"
>>  SUMMARY =3D "Ultimate executable compressor."
>>
>> -SRCREV_upx =3D "8d1a98e03bf281b2cee459b6c27347e56d13c6a8"
>> -SRCREV_vendor_doctest =3D "666e648b68fda2deb141a1fe93e3fd1e2795dd0f"
>> -SRCREV_vendor_lzma_sdk =3D "9ebf8f468c689d83504e6c08c6bc26c4a1cf180f"
>> -SRCREV_vendor_ucl =3D "4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf"
>> -SRCREV_vendor_zlib =3D "2a5b338eb173a701ed179e951d4c390e75e8d4c7"
>> +SRCREV_upx =3D "feef2e38cfe7660c6d9e22b36defad4cfbf563a9"
>> +SRCREV_vendor_doctest =3D "${AUTOREV}"
>> +SRCREV_vendor_lzma_sdk =3D "${AUTOREV}"
>> +SRCREV_vendor_ucl =3D "${AUTOREV}"
>> +SRCREV_vendor_zlib =3D "${AUTOREV}"
>
>
> The AUTOREV will break the reproducibility of this package.
>

Right, we can't have AUTOREV in non special "development" packages.

Bruce

> Jose
>
>>
>>  SRCREV_FORMAT =3D "upx"
>> -SRC_URI =3D "git://github.com/upx/upx;name=3Dupx;branch=3Ddevel;protoco=
l=3Dhttps \
>> +SRC_URI =3D "git://github.com/upx/upx;name=3Dupx;branch=3Dmaster;protoc=
ol=3Dhttps \
>>             git://github.com/upx/upx-vendor-doctest;name=3Dvendor_doctes=
t;subdir=3Dgit/vendor/doctest;branch=3Dupx-vendor;protocol=3Dhttps \
>>             git://github.com/upx/upx-vendor-lzma-sdk;name=3Dvendor_lzma_=
sdk;subdir=3Dgit/vendor/lzma-sdk;branch=3Dupx-vendor;protocol=3Dhttps \
>>             git://github.com/upx/upx-vendor-ucl;name=3Dvendor_ucl;subdir=
=3Dgit/vendor/ucl;branch=3Dupx-vendor;protocol=3Dhttps \
>> @@ -17,13 +17,13 @@ SRC_URI =3D "git://github.com/upx/upx;name=3Dupx;bra=
nch=3Ddevel;protocol=3Dhttps \
>>  LICENSE =3D "GPL-2.0-only"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded3508408c6=
374a"
>>
>> -DEPENDS =3D "zlib libucl xz cmake-native"
>> +DEPENDS =3D "cmake-native"
>>
>>  # inherit cmake
>>
>>  S =3D "${WORKDIR}/git"
>>
>> -PV =3D "3.96+${SRCPV}"
>> +PV =3D "3.99+${SRCPV}"
>>
>>  EXTRA_OEMAKE +=3D " \
>>      UPX_UCLDIR=3D${STAGING_DIR_TARGET} \
>> --
>> 2.30.2
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7964): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7964
> Mute This Topic: https://lists.yoctoproject.org/mt/97929374/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

