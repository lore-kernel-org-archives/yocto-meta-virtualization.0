Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56086CCA473
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 12:51:38 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.41215.1656334294096423878
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 05:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eBHPTeim;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 23so9017868pgc.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HX79n7jJZQYs/nbaxdYOAztoySHqedlCULq+XIt6LDE=;
        b=eBHPTeimB6fEj1QRlXzFxJ86WIBBrovxCVa8QYlc7MNALeJy2sHFe3jd9tHgHCSQXl
         6gARhTF8EHMcYZtGq0cd4Ea05vSHhwS5ocUWGGmT9MucebcZAAQMU2dcJlnJl4sG0D5p
         Ne/Av2hO2pLLR/Q8w5kEP65wXwXpfgB3AxvmevYRqDbYMEATwZzg9gSQke+6+f4+2YcR
         V0w8vhKoSMqlFVK7HTqoMR7UXN9EurfeUwlYbNBpY9XuH3AZ0inBtEvbc+9G9f1jgCIJ
         ntq1M5dN/A2/oVpK3JLPh10A+d1AEMvSNaToSVzc7rKom1oyjo1DyirIECynw3lD1BJy
         1GkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HX79n7jJZQYs/nbaxdYOAztoySHqedlCULq+XIt6LDE=;
        b=R6BHRMm8OmBSLpodfAIWZ+et3QInc1/Y+rhk2/wvF3IHo5uK1eDNTGBrWrHLWXJ5B6
         hFEV1Ig5tmsds4n2me9vgtCfjUzFJwZs2Y4DG08BxcSG3jTZ7Q5zO5jIBLnT8okoZFWH
         YBrtWFfL/6zbVTA4CZwNVsLuDoz68h2+FHZT2GWM8CkosD3kgEThjPiwgQ6zpE6dUOiR
         SMFggW3JuwqSeBacivImiCxuRK0vbk1CpM2fTO3BxD5Pa0QvJDrh9CXmOJghnhV+qkNP
         UpbduxCne1P/9XVF2qaZr14QPZO0sn/DwwHtMy3M4D2XQKZNMIUYheaKij4q2m0tLxO3
         Muog==
X-Gm-Message-State: AJIora+Eyz40UNKCDKEQl2teZfI9b6FEqK5fQ/NAvzbmDrXa7sMhkUhL
	FaS4tkjCwOWSIVWSmMBfBxVLi4I2P1hiVvzBtR3Sf4H5
X-Google-Smtp-Source: 
 AGRyM1t6JMSwt//7a2SlohR6e8FrTMgURQI770PFnpUG7+gk6qVQ+gpWiLoWJmkQiidGx08tqhVXRLUxaQulJkCP4Os=
X-Received: by 2002:a05:6a00:cce:b0:525:79b5:588c with SMTP id
 b14-20020a056a000cce00b0052579b5588cmr14837817pfv.19.1656334293285; Mon, 27
 Jun 2022 05:51:33 -0700 (PDT)
MIME-Version: 1.0
References: 
 <DBBPR08MB469695119DAF4FC29F66BAC1FDB49@DBBPR08MB4696.eurprd08.prod.outlook.com>
 <DBBPR08MB46968C1581734B64AAB82D32FDB99@DBBPR08MB4696.eurprd08.prod.outlook.com>
In-Reply-To: 
 <DBBPR08MB46968C1581734B64AAB82D32FDB99@DBBPR08MB4696.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Jun 2022 08:51:21 -0400
Message-ID: 
 <CADkTA4OwycAA=stusCGHrEjRga+JP3vjm+U5anU50y-D-0o8kA@mail.gmail.com>
Subject: Re: K3s service not starting after go-lang version update in poky
To: =?UTF-8?Q?Kamil_Dzie=C5=BCyk?= <Kamil.Dziezyk@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jun 2022 12:51:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7396

On Mon, Jun 27, 2022 at 6:00 AM Kamil Dzie=C5=BCyk <Kamil.Dziezyk@arm.com> =
wrote:
>
> Hello Bruce,
>
> There is a problem with the k3s service starting when the Yocto image is =
built with the meta-virtualization master branch.
>
> This issue might be related to the go-lang version(1.18) used to build th=
e k3s.
> After this patch was merged: https://git.yoctoproject.org/poky/commit/?id=
=3D8dc1f28aa10c775e64b5275679b1f8142e8cd038
> a warning pops up during the k3s build:
> ```
> WARNING: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0 =
do_package_qa: QA Issue: k3s: ELF binary /usr/local/bin/k3s has relocations=
 in .text [textrel]

That warning has actually been around for a while.

> ```
> See k3s service start logs here: https://pastebin.com/uXvsjPFu
> I have tried a more recent version of k3s 1.22.8 with a small change and =
this version of the k3s starts successfully.
> However, I did not manage to update all k3s build dependency sources from=
 the recipes-container/k3s/src_uri.inc.
> I have built the k3s with this change: https://pastebin.com/3QGvcqta
>
> Could you update the k3s recipe on the master branch, to build a more rec=
ent version 1.23 or 1.24?

I have a 1.24 update already underway. So hopefully things will be
sorted out shortly.

Bruce

>
> Thanks,
>
> Kamil Dzie=C5=BCyk
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

