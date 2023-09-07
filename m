Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BD8EC8732
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 14:34:11 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.14574.1694097245637922023
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 07:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DwooViAQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-794d98181f0so43725639f.2;
        Thu, 07 Sep 2023 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694097245; x=1694702045; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWnvmhyvNHF0OMbQjTqfMxtlYjaUFksLzBJ74HZTmWs=;
        b=DwooViAQIeHKb4+y7FDpDK9oEQ7G0ALRm3bOmwcRETMDvWeZd9/emCacxeH16icFJP
         /zv+mghFL3CbFSTweuu8FCDbhZwDM8QmH7sMnqNnZPiw4v+5aFNcmbuT9MdXkzrxKPBC
         VIN0BkqV5UPHjm/WrTtl8aKADw7P6YJ2gPmIvfuzK3roVm5nyQZl1eooF9+88MG5NSzZ
         ufa/2m+H7hr+ZhAm0kZhcM3d1WS68zHwnlntK/p3Ysje1+W7t19wcmmcBilFThnKWdS8
         F4zcXjKRoKKxU+wgfMxA3V2/oIpThZ85cVhtqN+x9i0i2P6q5a4485l291BftwR1/LwB
         Uh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694097245; x=1694702045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWnvmhyvNHF0OMbQjTqfMxtlYjaUFksLzBJ74HZTmWs=;
        b=PLD6RbI9Bjq6Nyg6Icu9tgmT70YKdisJ/YymozwcO7hoiHTmP3rbshmtZV/sDkNBZ8
         /9LzWPBHHgspeE7RN/OmRIEc48pFklK6/Qcw/Km1KZ21k68vBO1sFimDDV519aOaPeNJ
         pPo/cJm1xQvqHKM88IlXoYExUVX8EHc9GpBjrah8nttGi3QtHTjXaGMxcTCwsz5b101I
         zhwYAWeRtSKtoIsmN6OofvfVwkoo5kB+jzyihF4PbzzrYrMMgM97NT/scwArKjqCoVJD
         NyrovE4gMn1W+mxrdFx8Gk+ADFoKFsWX+pzu+BN1xVm5v1vEvcBcDOTpSOCg/HYDxknj
         XFLg==
X-Gm-Message-State: AOJu0YwpGCbOhGs0WuTey6OPApuRW6/NhH+UabyICTYKH/H3gZNssVIb
	QVD8ZqoOBQuXyI0vY+LB/hNE4rMlPgP+MZ+0r2U=
X-Google-Smtp-Source: AGHT+IEoHzddt21GOZ0PWUK3zE+6/G1gEQsFSJYfZ8fj0GInWzgMWij/2xL7HwizixpdnsaVzNn25cSIC/SxzuBVJgY=
X-Received: by 2002:a5d:9cd3:0:b0:787:8fc:75d8 with SMTP id
 w19-20020a5d9cd3000000b0078708fc75d8mr20783047iow.9.1694097244824; Thu, 07
 Sep 2023 07:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <2023090714014176d47e81@mail.local>
In-Reply-To: <2023090714014176d47e81@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Sep 2023 10:33:53 -0400
Message-ID: <CADkTA4N_Z6k2uMAhWH_vOR5+oNmgDVXFpfoJsOdeTaiz1zwXpQ@mail.gmail.com>
Subject: Re: meta-virt fails check-layer-nightly
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Sep 2023 14:34:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8283

On Thu, Sep 7, 2023 at 10:01=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Bruce,
>
> check-layer-nightly is failing for meta-virt:
>
> ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/check=
-layer-nightly/build/meta-virtualization/recipes-containers/lxcfs/lxcfs_5.0=
.4.bb DEPENDS on or otherwise requires it)
> systemd was skipped: missing required distro features 'systemd usrmerge' =
(not in DISTRO_FEATURES)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable provid=
ers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'lxcf=
s', 'systemd']
>

Aha. It is missing a distro feature check on systemd.

I've added that, and will push it to master later.

Bruce

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1571/s=
teps/23/logs/stdio
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

