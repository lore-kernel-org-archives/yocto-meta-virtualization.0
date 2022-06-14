Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF0FC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 19:47:26 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.1384.1655236042537529769
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 12:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f6xWWojO;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 31so7773722pgv.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 12:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sfqYoYcXaJw3xu/lZHWMTbx7s8+baM7HYXO0KHiGL5s=;
        b=f6xWWojO09KHrfcXc8xjkUrhLV+X2NtKscQPaZGxQ2LEFdb1F9bCJY8lCIDrxvTkb+
         vE3NnwZHLBNV/TEN4eIOKq0iggG0UOFqNhdjcJMJ7NUQNrjLoj5DPWVKDWNL1iyHTTIw
         Xwwpz6mG4Y4LKlJH74OjCuJVED4EbvYYKiNibBVS2K84drXHvTTT/w0xnEOeMcoMwgb7
         KeL6SQ/z9GF+TQDO21HmRvp5WG0ciCXW4GsYxicT+CRWmAjmImmXkL96ZNox43L6x9Tn
         stS2SSdC8cd+ug1thjBo4CAW2OPExmII+dYEJMD6Kcadkt2cgqt/C5KM5+PJWqXsv9sX
         fqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sfqYoYcXaJw3xu/lZHWMTbx7s8+baM7HYXO0KHiGL5s=;
        b=Y9Gz7QBJ83pX80MgxIIOINcTC0pTyc7pdsPAQR2kcqJGzgrW/cKnW5w/lbc/Sy3sxH
         NR6njfqhrhxIgAJIbYTdVf9zk4Ou8AhB6Ds4vZ0Njl6YYm+OHIIDxYUcK0K3aGNkZ4nf
         nV9TbLok/jzuYFnAPf4wHHM82CS4RuGn/2IrdgEXrLgCl0H47qNpSMxLKw2ff7xfFeml
         QlFDrnqu2GBLaRDdDLIK+OyvgBGo1/ba9ArkBmGrLv+1RVp1rAv++T0FmOoxzwaGTDvX
         tvFOYCWLN3QBnBceQP+0giA6hmFAnFyqA6NczwOwuRdWW0JTamwdmuEwzW0mQZaePzIR
         +EXg==
X-Gm-Message-State: AOAM533+gbEuiQYM3iGcxoxREMb07ufhjvHqNf9/vz/+YpWXlnQ0BQQJ
	R+hMSxh/muZokPFetn13uMl+0zL5LQSRweol7Dw=
X-Google-Smtp-Source: 
 ABdhPJxSkQbRNJRLyCtB8aOhZfr4GPN94px5TOhlZgInc34B6Wei250ePWNsqX6o/1KYBeECT+e+Xgmsz4CU5gvlXcs=
X-Received: by 2002:a63:3193:0:b0:3fe:3f57:35fd with SMTP id
 x141-20020a633193000000b003fe3f5735fdmr5918785pgx.232.1655236041900; Tue, 14
 Jun 2022 12:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220609095748.176486-1-michal.orzel@arm.com>
In-Reply-To: <20220609095748.176486-1-michal.orzel@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Jun 2022 15:47:10 -0400
Message-ID: 
 <CADkTA4M_sMQd5v00NzmOas+j7HX0GopE6KRZZLV+TJmDr62fpg@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen: PCI runqemu issue follow-up
To: Michal Orzel <michal.orzel@arm.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
	meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Jun 2022 19:47:26 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7381

I was waiting to hear from Christopher on this one, so I'll let it
soak a few more days before staging.

Bruce

On Thu, Jun 9, 2022 at 5:58 AM Michal Orzel <michal.orzel@arm.com> wrote:
>
> This series acts as a follow-up to the commit:
> fb0a7b97db4f ("xen: Disable PCI on qemuarm with Xen")
>
> This wants to be backported to kirkstone.
>
> Michal Orzel (2):
>   Revert "xen: Disable PCI on qemuarm with Xen"
>   xen: Disable highmem on qemuarm
>
>  classes/qemuboot-xen-defaults.bbclass |  6 ++++--
>  classes/qemuboot-xen-dtb.bbclass      | 22 ----------------------
>  2 files changed, 4 insertions(+), 24 deletions(-)
>
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

