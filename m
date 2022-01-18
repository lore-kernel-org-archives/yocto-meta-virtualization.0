Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31FFC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 13:52:18 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.12730.1642513937756780789
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 05:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XqwzWYF/;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id m10so1310451edq.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 05:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KEndIGWNC1JG0TWU+Tvnn0vDELMZ9uVWccY+eados4I=;
        b=XqwzWYF/sdVh63s9NPGOp7la/q1N75cBqVKub6K15NQDjw/lAu2JmPEaj5XJVfbvQ3
         rrpVn16WY2NrEECu5Eowi4uGkgeUIHYyILFX1VvZYCyo33+0dw+1GmteAsLNQCkq9PKC
         zvjXbcgXSrK7JoyM3ztZv+AYe2dnL5F5B18/8McvefRsA5dL42bu08b6HFvK60t0jEN7
         EqYeLUA5dXM23alRVDNEwwzzTThsth+nO/lOYLMxrWnYJtK5PM/EsRfNPkrKmtEBeTfd
         RlDjsQyc0XkOvcfsw/BFsMtDKuqZbUM1aajtwjvTnPsjEUAcpBWTi+KHwxQ8PH+64DVn
         W39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KEndIGWNC1JG0TWU+Tvnn0vDELMZ9uVWccY+eados4I=;
        b=XA91K8RWTbA3VtXQEe9rGzJ5VHgO4mWtP8k4cg1WUgHcwnZD8Mjt1SZ+QgeKDVXQcw
         qyQ6k7pFWPvK+o3DbXJR22cusnyRXhBMvDjeAX01Zj7gDCUJuSCSMSlf32Z+cm1K/TLS
         uA/pITQWx8GBPuQthsaGNMec8edaUJdO6JZznkhi6PaBjtPvADSNyM83F6EwYiZVTD+4
         Hwz7TBep5RigoDY1z3PtLMmKjMrqPs55CIDXccEX4oHtwm1ysdmbwXeyhXU2QBP6v8wO
         m5wqVakjDngjsa6E4LxPrU+lRQyQuAkNNS5q3ViUPn6Arhjd6BuxCVvHrLezcQpG1Nba
         C90A==
X-Gm-Message-State: AOAM532VlptN3/7i8pDrQFsItz1Tb36IDZH25MaEG2mjj1WZATPkDYo4
	YXmg0wAeUYE9dWO/WvR0PaaxBI3jBi/dLg3SoEM=
X-Google-Smtp-Source: 
 ABdhPJxFkmnZGxPIuwh4pYO1gEIoY9pzDRQIUdMu/OkxX1jITY527Eh39tX+C3a4Mxcv61pjc0gVkGYFY6zFYKguHek=
X-Received: by 2002:a50:f086:: with SMTP id v6mr26107007edl.94.1642513936196;
 Tue, 18 Jan 2022 05:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20220117125827.464599-1-ross.burton@arm.com>
 <16CB123A6CD49E87.30851@lists.yoctoproject.org>
 <CADkTA4MR63ejM49VXLaBz_AeK60Xk0kEJ8E1dQ7CPSTAvOkQVg@mail.gmail.com>
 <CAAnfSTtTQNQmY5DZSeZ=KRQ=F5-BGkdK=OswPHfyG7OAxJnuMQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtTQNQmY5DZSeZ=KRQ=F5-BGkdK=OswPHfyG7OAxJnuMQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Jan 2022 08:52:05 -0500
Message-ID: 
 <CADkTA4NKiE208nqVhX2pbZvdvr5QREBKYZGrd3-DXz9h+HsMhg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-dtc: fix packaging by using
 setuptools
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Jan 2022 13:52:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7013

On Tue, Jan 18, 2022 at 6:18 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Mon, 17 Jan 2022 at 18:07, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > Your change + my update are now queued:
> >
> > https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=ed4bd1de0d2e040c303a8497ac0cd961aa8b8a7b
> >
> > If you have any cycles for test build, that would be great .. since
> > somehow my own build didn't notice the empty package, so I can't say I
> > fully trust it.
>
> SETUPTOOLS_SETUP_PATH defaults to S, so you can remove the assignment entirely.
>

done. And pushed to master.

Bruce

> Ross



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

