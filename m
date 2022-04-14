Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01275C433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 20:57:03 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.5.1649968641410975473
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 13:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pihhx5w2;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id bq30so11091162lfb.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 13:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dkRVKxWf6IWpCpGldIVtqhIiIRyAhjedScTIW6kW+Uc=;
        b=pihhx5w2Mu34r8UUHPtRslA4mQjix+vjxtkPpLnt8vzESvmR0dd5vNv2Xs3Byg3TJm
         eieoVyahkanPBirIeLkeiuqNlUp0Cv6L06z8lGzBohe5kbtGU0QXkSPZn/8PsCbPjbfE
         NCc5rmHD8zF8L/V5BX43vlal6+lghMg6LrSVztlCWcovHtZUL5ylrYMtQfdKuHliwb3H
         Rdr2MA+OZ5HfLQMmYRmCZsIkf8BxO5hzPY5YBAAX+WO5miK/SboPX4UDESabB6S5n+A8
         tw9cJl2gUcZK830onAOe9BUCEgWO66Ilu9Q2vFUk2MQ/xg0yotdxSEz89L334TwtilGo
         xAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkRVKxWf6IWpCpGldIVtqhIiIRyAhjedScTIW6kW+Uc=;
        b=UMigMDLeALnRoWPtK17ClH3jsOuECHhzx3hn8LZE7quf1fDiAFCKQJEEqQzQe2rrIm
         7Cy1f3qZojF8qpqo9Ny7yKMnmoCArE5csv8GyPNJSpiM9gFSVnlIHs8jwKN3k4WHWWQ2
         5NiXYNKuF11oJZ4qbGq8BAW5dZKLRJq9Hb7cakgjpNBgaw9XQK7FHfInfXA1KYu/x4Xi
         UH59Gmnd2n4ynuBEILmYx/bO0jSSgwQGsm58Ze1GQiAD2XUJAkSQRRbtbmTkjGgbmNG+
         cKPs8a0eIccEQ0huNI2g6tOsNTuN771JQhuOlWbDhfuusLF2VpObvzc6KWDCn+1aCPlh
         rQqQ==
X-Gm-Message-State: AOAM531lKhZGe95k4gmEZjtzVraHIgZaZHSH2vEjdGX3yFjwnsu/DBbx
	pgPloigeeYnbgVg5tZqXpGXEo0wEKYgeWRAuLHU=
X-Google-Smtp-Source: 
 ABdhPJzVnZd5N8G490TvaLT26tU1e7Wd7lATDH7A6LqgbMX2a3QZjhvCaZu1TCABKfphL3b2aKUMZU3JUdElQj/nFZY=
X-Received: by 2002:ac2:5fa6:0:b0:46e:cbb1:4d14 with SMTP id
 s6-20020ac25fa6000000b0046ecbb14d14mr278450lfe.249.1649968639579; Thu, 14 Apr
 2022 13:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220408084420.102085-1-michal.orzel@arm.com>
 <CADkTA4MxDwunJex7NnjFpLs2k0sUo354XUysH0PeYww+gYxA_A@mail.gmail.com>
 <A524ADAA-241A-4206-AA65-6B2778D5FE01@arm.com>
 <68B08222-1DB9-436E-897C-7A19C030776C@arm.com>
In-Reply-To: <68B08222-1DB9-436E-897C-7A19C030776C@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Apr 2022 16:37:08 -0400
Message-ID: 
 <CADkTA4PY-LcY5V=BnBG6ZhTDccukKidUzc4ZicBSWJNiowXP9w@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen and
 xen-tools
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Michal Orzel <Michal.Orzel@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
 Doug Goldstein <cardoe@gentoo.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Apr 2022 20:57:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7176

On Thu, Apr 14, 2022 at 11:22 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Bruce,
>
> > On 14 Apr 2022, at 09:01, Bertrand Marquis <bertrand.marquis@arm.com> wrote:
> >
> > Hi Bruce,
> >
> >> On 14 Apr 2022, at 04:13, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>
> >> On Fri, Apr 8, 2022 at 4:44 AM Michal Orzel <michal.orzel@arm.com> wrote:
> >>>
> >>> Before the next Yocto release, Xen recipes need to be updated.
> >>> This patch series:
> >>> - updates 4.15 recipes
> >>> - introduces 4.16 recipes
> >>> - removes 4.14 recipes
>
> In the meantime 4.16.1 was released.
> SHA is f26544492298cb82d66f9bf36e29d2f75b3133f2
>
> We can send an updated patch if you want.

An updated patch makes sense to me.

Bruce

>
> Cheers
> Bertrand
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

