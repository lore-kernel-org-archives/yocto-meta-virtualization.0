Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C14DC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 13:00:54 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.9706.1699362050223498912
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 05:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BUA1y6Ox;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7a93b7fedb8so212959539f.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 05:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699362049; x=1699966849; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQo8fjg+U4/IYHg5NwUPHneL4JOvlMvW0vaPSRXt5aI=;
        b=BUA1y6OxDnMHjOxioLKN+Fvi7yLRUBLKy9t8wQsBAc0QTg7mwCuqf1SsIkt8saBvJN
         nuU1ikV4RckoZb/DOFybp0YwmbhxhIeiRIWYfxwgF9UAw3kq2GfPF573UOSuDlt0NK54
         5yL3g9rEiql5kcrvJd3UHoNODjG5cANfcjvxTe3qSCIhr0aixeUwYrCJVTEq7S6NWQez
         RaPEjbMC8TJE9ofhxWNLz9S00hlyIuocgSJ9qIbaGLXzwoKICqgcFq6svmqRidzQnWc8
         nJuaYRJFgNpjV/B+n23hH2iGEkmVlu1Oa9KvGIDdqsQDdRgMqcQeB/WSRbx5t8U1UdNk
         D4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362049; x=1699966849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQo8fjg+U4/IYHg5NwUPHneL4JOvlMvW0vaPSRXt5aI=;
        b=KvpYXQvICUmNwVHQ6GMVgq6u3zbSJhFu9k+5Ku4O5aQzg4LTvPHLs07yjQGKLH6Ehe
         V36y9hwH7F+nF2MOBsFwe02XJQ6Fho/hy8Ul15f7qrBppE5Bfpo+grozJroOQ1crK0fs
         QV9pxcrZQraaWP71Hyw0Pd8+mKwohljca+oja71lP/rv6S9aXFD85h1c1DjkXl4mj4sL
         hzn/pK+M12PLvWediFNj3NWksSOOM88Jyz5ihQwStqlAyEkCXVF5jBjj7zYnrubjdJCD
         ZB6/FyiTh6TiE2nmzysUx/rqn5j6lBOxayCTSQUezghFLi+U5DjVyUHbLdSPRNaaWs/S
         dPVA==
X-Gm-Message-State: AOJu0YxPG7LSUSBh1luecXEVmLNyCFwlHpY68xNSoB/qqvz5q4l9EDEo
	S/sr7vkxvmbWTdDB4DC9pTBw3gk/GhM0QBRl2+E=
X-Google-Smtp-Source: AGHT+IGLvKeKjmw5MLrZ7hZEVNBvK6nbZEHetf/SVScQ4AZRejPwwRLbV2XramCc/P0KLVC0hRYTM4DqVKIMi2kH4LU=
X-Received: by 2002:a05:6602:3ca:b0:7a9:e197:376f with SMTP id
 g10-20020a05660203ca00b007a9e197376fmr38657269iov.16.1699362049411; Tue, 07
 Nov 2023 05:00:49 -0800 (PST)
MIME-Version: 1.0
References: <EA68EAA4-BD24-4273-8F76-0725EB0F2FDB@arm.com>
In-Reply-To: <EA68EAA4-BD24-4273-8F76-0725EB0F2FDB@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Nov 2023 08:00:38 -0500
Message-ID: <CADkTA4N=HDdetz=wMh80c9NSu5rNjThVVkGvi1HcDwit-cBN3A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci: Map image
 architecture correctly
To: Ross Burton <Ross.Burton@arm.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 13:00:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8437

I'll do both: branch and revert there.

But to anyone reading this .. the release of meta-virtualization
against nanbeild is still weeks away, there will be changes and a few
more upgrades in that branch yet.

I mistakenly assumed the mapping change had made it into nanbield.

Bruce

On Tue, Nov 7, 2023 at 5:37=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> This patch depends on changes in oe-core master, but as there is no nanbi=
eld branch of meta-virtualisation at present it=E2=80=99s not possible to u=
se meta-virt with nanbield anymore.
>
> Can this either be reverted, or a branch created?
>
> Ross



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

