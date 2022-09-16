Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671B2ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 23:46:16 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.955.1663371973185638594
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Sep 2022 16:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nT8S6AXx;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id x1so22830763plv.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Sep 2022 16:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ktz8qUM4wzUTU9hQXt7rCN1NuBbYP5LQVz7CkTra+cA=;
        b=nT8S6AXxPTrmelXLCWwf9UXDU1VDIobH0fCgf1p4uDjUjffOCqYd0JDg16lETvAEz9
         noZq717CE5HC9+wm95ptHWUjpaV2DcLE46NMlnBfeykD9qyovf9HMzF+F5NhKTWunVFE
         gN8WOenB2AFT6X0myEi4Ozbr8IG4YHz1NzB9YYkJJkfMb0+2OwVkdnkYoGT4ggKONLVI
         3BfihrrYOyF3KmRGKxrv2i9Vu5d8vmxZMMvBKDtCqNfCaTuG2b3Bz1q9CrtQqjs2Gl1Y
         57yIpj1A4sOR45h5/m45oh/3OQwhX/RfO7+o2vurSekkQq2OjbdWoFMkqVvqGJLQlCqG
         psgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ktz8qUM4wzUTU9hQXt7rCN1NuBbYP5LQVz7CkTra+cA=;
        b=H9y1v8FXn3dCQR35YVYYoNOUqTD03L7DgpchWsED/MK68C0YIn1Ym38Crc1f025gNG
         AQd72CTccX0QTEV3xnJhof0pQebtb9zS21U3/3ZI0m8INlma5hoTkBsUQhV0gl5aOZwB
         /aQuKCLiw7g6O63pPRhmRPdlA+kwf+dykg98vr2gGHXfIl/WBLSXI1jdNJRZBA0nRO02
         jzeRPHa+AI7F67V4YIsTDvkK0D3PURxkNvWrKIdmNX5GFdtOC/TUTVHZI3AwgwtDaX+m
         doe/+RUikPj+FcGFwbUwD2aAAMXKOJSbho73/fBvHvlR+5PvTqvp/j3X2t7jZpJx8BwP
         3dOg==
X-Gm-Message-State: ACrzQf1qWPIVOC7wTxD+FGsTo8ODqMkiXdfWD0+KKgjka4hP2uwVyPW6
	yODHivmaRtMqiP2+D3G82dnlo9Uvm6UbdAQNO2A=
X-Google-Smtp-Source: 
 AMsMyM5wMZ1hwhP7oTO98/i2Vvk8wAgOQBE/9SDPCyECaLTHXTdOFmfElq7aS72zf1TcAzLRwO3+MuC8c5PY/SNJ7VI=
X-Received: by 2002:a17:902:ccd1:b0:176:6eb8:37b2 with SMTP id
 z17-20020a170902ccd100b001766eb837b2mr2225345ple.69.1663371972310; Fri, 16
 Sep 2022 16:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220916152356.GA33896@gmail.com>
 <ce799b82-dbcb-4247-b217-dc1929038386@www.fastmail.com>
In-Reply-To: <ce799b82-dbcb-4247-b217-dc1929038386@www.fastmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 16 Sep 2022 19:46:01 -0400
Message-ID: 
 <CADkTA4Ma=LBNhQ=Eg7hRi_n5xx0kQMEkfdTcBW-g+H6iX+t53A@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH 1/2] catatonit: Integrate
 version 0.1.7
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Sep 2022 23:46:16 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7617

On Fri, Sep 16, 2022 at 7:15 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> Hi Bruce,
>
> On Fri, 16 Sep 2022, at 16:23, Bruce Ashfield wrote:
> > These two changes are merged to master.
> >
> > With respect to kirkstone, the issue is that by default the ptests
> > are built .. as such we are bringing in new dependencies to the
> > default build. That carries a bit of risk.
> >
> > If there was a way to make the ptest build and dependencies optional,
> > and disabled by default, I'd be willing to merge that to kirkstone.
>
> That is understandable and we will manage this for now as part of our layer(s). Thanks for looking into it.
>

What about just the new packages ? (buildah and catatonit) ? Does
having just the packages but not the ptest change make things easier
on your end?

Bruce

> Regards,
> Andrei



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

