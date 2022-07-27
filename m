Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF34C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 18:19:32 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web09.23275.1658945968689942868
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 11:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oewr4Gf1;
 spf=pass (domain: gmail.com, ip: 209.85.160.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so23558380fac.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FxSDcD3g2Ax69Hd0K7/VxAVuNElOmcP6tfdzosdN3Ms=;
        b=oewr4Gf1AxOivJ/tjieH6bAEoaUY6oIjGfCd78HFHsJqrBgdSGIIOgXxNPjKJp0L6z
         XoxjidZ+cz9F+C/Hr8/eRRoEKIvWBdeNA1vhytZuEabyT7AlNw25/KxQgDPCbRnqAQdW
         MVddeb5bDhASKXFjkD+AtNuyqu0OU5hGlxnhEB7qicpXwqFC1PI8STqHrixEhCLwbp5W
         IbtrOkf5t0cc6ZZp9tdmWL5n0+3RIhIUifCjQzbj+VL1VCY4/qLP2moL4GYMyPK4ulDd
         AUINUV2wDTukWuEA9+KAPK/dFTKC1Jlr/Gy+QMErjkydHztV39bBBGRbhnl1YGmy+Ozd
         hSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FxSDcD3g2Ax69Hd0K7/VxAVuNElOmcP6tfdzosdN3Ms=;
        b=69SCseD6vn6wwAeH61Tz8ttXgRxbvk89bJxp5sase2hTeF/PPjf7OdEfK1G8QTYmmk
         QmCAIjEaFO4YHRHufnWhElxaJJPTKA9TBebGMm4JgoOWodjKu5ynzvaruNL1j5CnDX9J
         VLxVdbySg1NddKdCBfJTDRiBiU+/UKTjdP78fjCaOa//ZbgUPS7UjjK+nZd1A9IygEVE
         OHYQXZpl7sosK9yTc1t7YPVTKmgzyf5gD7Axyzq/2HhZ1SqKEvelLbffJ2ybT6mGd4is
         k9JbzjV2Oh2vpZ5ox4ZAth92ZzZxCV/Ti9qG/DDlcnQ8UAFNr99wMBCXnTPlxs2fLZ8O
         r0Fw==
X-Gm-Message-State: AJIora/qBTqXDoNZHGnrWuV2O4vePFtr2Bd4zTRfKam4dPUYbwqXg+Oc
	kuTyPbrucxwGM/bgEhtn6GNukk5YPBsVd82IUMM=
X-Google-Smtp-Source: 
 AGRyM1ukY4W3IYGVnCdrcpa8uN7dYk6ScKn71KU1UIi7cis4j48k22UnT9CgP+DwHlkIQWcyWDkgeKQtI7nXuBJK7m4=
X-Received: by 2002:a05:6870:d611:b0:10d:b8a2:98c5 with SMTP id
 a17-20020a056870d61100b0010db8a298c5mr2665469oaq.175.1658945967902; Wed, 27
 Jul 2022 11:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <BF86DE9A-16AF-4423-95B0-3FFF3ED5A9CD@ieee.org>
 <49660EA1-CD22-40DB-98C7-C43F38A72CCA@ieee.org>
In-Reply-To: <49660EA1-CD22-40DB-98C7-C43F38A72CCA@ieee.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 27 Jul 2022 14:19:15 -0400
Message-ID: 
 <CADkTA4MrnrWbWfJNFNdSqDcXOfN=VS11SGy_zrS2+z0Da4p4+w@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker Compose issue regarding the
 deprecation of Python3 distutils on Kirkstone
To: ierturk@ieee.org
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Jul 2022 18:19:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7479

On Wed, Jul 27, 2022 at 3:24 AM Ibrahim Erturk via
lists.yoctoproject.org <ierturk=3Dieee.org@lists.yoctoproject.org>
wrote:
>
> Hello,
>
> I added the following line into local.conf to get the packages docker and=
 docker-compose on Rapberry Pi (meta-raspberrypi) with the branch kirkstone=
.
>
> # Virtualization
> DISTRO_FEATURES:append =3D " virtualization"
> IMAGE_INSTALL:append =3D " docker-ce"
> IMAGE_INSTALL:append =3D " python3-docker-compose=E2=80=9D
> # IMAGE_INSTALL:append =3D " python3-distutils"
>
> However, due to python3-distutils deprecated as of Python3.10, I got the =
following error.
>
> raspberrypi3:~$ docker-compose
> Traceback (most recent call last):
>  File "/usr/bin/docker-compose", line 5, in <module>
>    from compose.cli.main import main
>  File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 9, in=
 <module>
>    from distutils.spawn import find_executable
> ModuleNotFoundError: No module named =E2=80=98distutils=E2=80=99
>
> Is there any workaround regarding this issue or am I missing some configu=
ration?

I'm not sure I'm following.

docker-compose has been on the same version for quite some time (mid
2021) on pypi (the source repo does have newer versions, so we could
consider switching to source vs pypi).

and yes, that version is still using distutils. So either you need to
install the depreciated module, or do an uprev to a newer version
using the github repo.

Bruce

>
> Thanks in advance.
>
> Regards,
> Ibrahim ERTURK
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7476): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7476
> Mute This Topic: https://lists.yoctoproject.org/mt/92644827/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

