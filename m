Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959A4C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 16:56:02 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.20971.1670432152432975298
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 08:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CyHUg065;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id 3so5876887iou.12
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 08:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1N3ZhEKrtjv2A0VV+qIyOpTRSbQAnApP6jYOlHS0wnI=;
        b=CyHUg0653RPjuJpERAE05cguiYbxuB4LTmmT8M6zwGVw0sxMdxfKFqd2eK2iylEIBK
         xqQQheCQLJR3MguOGzksDhpoU06Sj/YGr0cMJX5PD+5E/8u4WhnRxVWBNP+4BZYTDNh/
         n1LK5ER0rBz/u5qaIrkAqZycZOHGjEbcktJFzFSs19gJp9vFkgXjSYlz4O0n0yJg0c7p
         5uCIwPDQoQGNSJ9JT3kLo9jSkgwUtatWz0LNMMN+S1yjCnju9XluURqZDFFdHoRtMd34
         NWo6AQCyXGj5vvK8HMJFErs3RNFNam9iwDAkw7Zz3iX6Fo4WBsD1lcll2zST0JDtYCT4
         O6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1N3ZhEKrtjv2A0VV+qIyOpTRSbQAnApP6jYOlHS0wnI=;
        b=DbD1j4fflzgWlWjAHN+71jViwwnSC+Zc8HJqUrAoDOK4dKcv4J3rIEYtBlT8wJ6ptd
         B/4ebWPaAK2xyafvlLwuZbfEfJ28+I1Ii2FIT/pXp6oxOhhFBYF+1YtLt98R8fz7ujxc
         3jIeGOr60e18mAhcBb9gqoSFUO5s327GmivXhnuzVQiwk3dgvhWMU3bEjNIogMnd6Mc7
         cgcOYSlSPGiwQXkGzTplXJ9Tz9Auv7hXhDWHpNFyl/7R3sc37+Vyd2qs3eFs9WcSDjUZ
         w4PATX5FvLGOFbpWs8fDLijSYO3FRuuI4Eh5zkJk7T2zmErjkFMkQ83v13yAYuG5MWWL
         zNGg==
X-Gm-Message-State: ANoB5pnm1VqRA5Cvt210w22mprhKqXHu5ZgTiAjWRnp7GN7L4IEy+keL
	+CHrVuRslUwUdrL/bjix4gNFvxfrnOvA5c0V+PQ=
X-Google-Smtp-Source: AA0mqf7opXicLZ6HtF0yTqRhmm1jFEQS140LvEQTkGFD99gLlP3A8+3DLrJ3uocCvQRFBkHQQxDu3mkbwvdGWNmAyyg=
X-Received: by 2002:a05:6638:33a0:b0:38a:5876:4ff with SMTP id
 h32-20020a05663833a000b0038a587604ffmr4748037jav.178.1670432151708; Wed, 07
 Dec 2022 08:55:51 -0800 (PST)
MIME-Version: 1.0
References: <BN2P110MB1623E90E409FF6ED3CDE17F9B41A9@BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN2P110MB1623E90E409FF6ED3CDE17F9B41A9@BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Dec 2022 11:55:40 -0500
Message-ID: <CADkTA4PsrSnAgsVkcdS7xKbeMPfZaVxdoYOJB=+yNGu3TxY9=Q@mail.gmail.com>
Subject: Re: [meta-virtualization] kvmtool patch error
To: nathan.fisher@gd-ms.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 16:56:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7739

On Wed, Dec 7, 2022 at 11:46 AM Nathan.Fisher@gd-ms.com via
lists.yoctoproject.org
<nathan.fisher=3Dgd-ms.com@lists.yoctoproject.org> wrote:
>
> To the maintainers:
>
>
>
> I=E2=80=99ve been trying to use meta-virtualization to include kvm in a b=
uild I=E2=80=99m working on. In my local.conf file I have added the lines:
>
> DISTRO_FEATURES:append =3D " virtualization"
> IMAGE_INSTALL:append =3D " dtc libaio zlib kvmtool" (upon initially getti=
ng the error below, I explicitly included the stated dependencies listed in=
 the kvmtool recipe in hopes that would change things. It did not).
>
>
>
> However, whenever I run bitbake core-image-base, I get a build error. The=
 following is the output:
>
>
>
>
>
> ERROR: kvmtool-5.10.0+gitAUTOINC+336751fb10-r0 do_patch: Applying patch '=
external-crosscompiler.patch' on target directory '[path to work directory]=
/core2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb10-r0/git'
>
> CmdError('quilt --quiltrc [path to work directory]/core2-64-amd-linux/kvm=
tool/5.10.0+gitAUTOINC+336751fb10-r0/recipe-sysroot-native/etc/quiltrc push=
', 0, 'stdout: Applying patch external-crosscompiler.patch
>
> patching file Makefile
>
> Hunk #2 FAILED at 337.
>
> 1 out of 2 hunks FAILED -- rejects in file Makefile
>
> Patch external-crosscompiler.patch does not apply (enforce with -f)
>
>
>
> stderr: ')
>
> ERROR: Logfile of failure stored in: /home/yocto/bmc3_os/build/tmp/work/c=
ore2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb10-r0/temp/log.do_patch=
.15225
>
> ERROR: Task ([path to meta-virtualization]/recipes-extended/kvmtool/kvmto=
ol.bb:do_patch) failed with exit code '1'
>
>
>
>
>
> I took the liberty of looking at the patch file and the makefile. The 2nd=
 hunk in the patch appears to be trying to replace a line that no longer ex=
ists. I have tried not only your latest master branch, but also the Kirksto=
ne, Langdale, and Dunfell releases in case any of them had a working state =
for the recipe (I also tried other releases but started running into syntax=
 errors due to those versions of the recipe using the old bitbake syntax in=
stead of the current grammar).
>
>
>
> I was wondering if this was a known issue with a fix available, or if the=
re were plans to update the patch files.
>
>

When I updated it on Sept 22nd, it worked here.

But I can double check my builders and see if something was missed.

Bruce

>
> Thank you for your time,
>
> Nathan Fisher
>
> Nathan.Fisher@gd-ms.com
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7738): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7738
> Mute This Topic: https://lists.yoctoproject.org/mt/95519084/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

