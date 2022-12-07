Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C88C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 17:01:22 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.21165.1670432480862518227
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 09:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JMEb9SVO;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id d123so6697445iof.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 09:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLvfsGN2fC+p3YYFC7Zb4qdPh/zMsuvsrMC86CjP1Ik=;
        b=JMEb9SVODK3XP3hzNo/4q/nKgwLoUEdz2YnoiTl1YfVIdLhi7YxLcMqUygl/oEmOtP
         Hi6n9qfGptoDpcJOsJSHTpRF9w/WiE5ZV4E1MeZvsVm+dxAUDB3IoVDcnVpWxZz3E5Ev
         nwAJ6JVgb1LzYUSAeqC7d2N7KO7TIUw031iJG2POaF1f8HI4x+y0W7aq9XSfQiJ44pmf
         /dXj1Yz5Uo5baRdHR/rwz47pWZUuSEDPGbkj4IFt887dInENtuOSLli5jdek6Ug5yAy2
         tg5WtJ1/Ujh6GESy4p6EXriiOSn05igTL90CrQW8/q48H8QqnfeY9aLukOxolLVUDq6K
         4BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLvfsGN2fC+p3YYFC7Zb4qdPh/zMsuvsrMC86CjP1Ik=;
        b=T//UAZSDTMFP9qURjo4FpqmMUfvQU+tEl/O4P+sCYp1m8xzfcI88pyNWJ5Dm/WxYsR
         h7DA4GJQtwacVyRbiQoyD9DWQK9stmL5miAZ8DfpYOEJ2Io5CZWBhX4zWbSjaOjfJubb
         Ezx3kGWyNmG4BogHVMPY/zK0BceHkVj21kINuXRT6/g463KgAkb4i+X53eWAJ8+1zyoH
         pINZtFycLevslu0DzwP+m6CTg/Py6Zkww5DXmqfa20n5vPG2uqro5Q617cxj2aU+vWh+
         WElCC4Mlt9zx2/Nyqx6RG7WNT8D45eYGEY0DkSHpORbEy7ixByyvgSfHfFzzhNjnzZcL
         SDiA==
X-Gm-Message-State: ANoB5pkdPGsqKHQSq1PApj46mZ9o/TcUfTJxTWiINdin7KxpKegaOjKv
	Bye13UxtVy7i6ayV2Q74t+zUotDyhY4oueFiMgQ=
X-Google-Smtp-Source: AA0mqf7SzWu7MjkbgI8n7p79wF5v1SBSMPhQLMeMGiQU0lrzUTBL/IXRsrIfKHpQmmFDcx1zDGMRvgZwIxm3zp4HgIs=
X-Received: by 2002:a5d:8902:0:b0:6bc:711:821 with SMTP id b2-20020a5d8902000000b006bc07110821mr42552734ion.192.1670432480071;
 Wed, 07 Dec 2022 09:01:20 -0800 (PST)
MIME-Version: 1.0
References: <BN2P110MB1623E90E409FF6ED3CDE17F9B41A9@BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM>
 <172E9131448E8B3C.29158@lists.yoctoproject.org>
In-Reply-To: <172E9131448E8B3C.29158@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Dec 2022 12:01:09 -0500
Message-ID: <CADkTA4MN2zsffiyVtYx_DLDutMW-cHon3LbKASbOdCs22wwauQ@mail.gmail.com>
Subject: Re: [meta-virtualization] kvmtool patch error
To: bruce.ashfield@gmail.com
Cc: nathan.fisher@gd-ms.com, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 17:01:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7740

It does look like a refreshed patch was missed.

Can you try master-next and confirm that it works for you.

I've only test built on x86, and need to confirm arm64 before I can
push it to master.

Bruce

On Wed, Dec 7, 2022 at 11:55 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Wed, Dec 7, 2022 at 11:46 AM Nathan.Fisher@gd-ms.com via
> lists.yoctoproject.org
> <nathan.fisher=3Dgd-ms.com@lists.yoctoproject.org> wrote:
> >
> > To the maintainers:
> >
> >
> >
> > I=E2=80=99ve been trying to use meta-virtualization to include kvm in a=
 build I=E2=80=99m working on. In my local.conf file I have added the lines=
:
> >
> > DISTRO_FEATURES:append =3D " virtualization"
> > IMAGE_INSTALL:append =3D " dtc libaio zlib kvmtool" (upon initially get=
ting the error below, I explicitly included the stated dependencies listed =
in the kvmtool recipe in hopes that would change things. It did not).
> >
> >
> >
> > However, whenever I run bitbake core-image-base, I get a build error. T=
he following is the output:
> >
> >
> >
> >
> >
> > ERROR: kvmtool-5.10.0+gitAUTOINC+336751fb10-r0 do_patch: Applying patch=
 'external-crosscompiler.patch' on target directory '[path to work director=
y]/core2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb10-r0/git'
> >
> > CmdError('quilt --quiltrc [path to work directory]/core2-64-amd-linux/k=
vmtool/5.10.0+gitAUTOINC+336751fb10-r0/recipe-sysroot-native/etc/quiltrc pu=
sh', 0, 'stdout: Applying patch external-crosscompiler.patch
> >
> > patching file Makefile
> >
> > Hunk #2 FAILED at 337.
> >
> > 1 out of 2 hunks FAILED -- rejects in file Makefile
> >
> > Patch external-crosscompiler.patch does not apply (enforce with -f)
> >
> >
> >
> > stderr: ')
> >
> > ERROR: Logfile of failure stored in: /home/yocto/bmc3_os/build/tmp/work=
/core2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb10-r0/temp/log.do_pat=
ch.15225
> >
> > ERROR: Task ([path to meta-virtualization]/recipes-extended/kvmtool/kvm=
tool.bb:do_patch) failed with exit code '1'
> >
> >
> >
> >
> >
> > I took the liberty of looking at the patch file and the makefile. The 2=
nd hunk in the patch appears to be trying to replace a line that no longer =
exists. I have tried not only your latest master branch, but also the Kirks=
tone, Langdale, and Dunfell releases in case any of them had a working stat=
e for the recipe (I also tried other releases but started running into synt=
ax errors due to those versions of the recipe using the old bitbake syntax =
instead of the current grammar).
> >
> >
> >
> > I was wondering if this was a known issue with a fix available, or if t=
here were plans to update the patch files.
> >
> >
>
> When I updated it on Sept 22nd, it worked here.
>
> But I can double check my builders and see if something was missed.
>
> Bruce
>
> >
> > Thank you for your time,
> >
> > Nathan Fisher
> >
> > Nathan.Fisher@gd-ms.com
> >
> >
> >
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
> View/Reply Online (#7739): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7739
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

