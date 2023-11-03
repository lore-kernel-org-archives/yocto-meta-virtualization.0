Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C427CC4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:40:46 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.53114.1699022439658729188
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 07:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0v1rllB;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-35950f04d98so8161945ab.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699022439; x=1699627239; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qRKawrA5sxNO4ftUWA7GeIchvatyoSn2hTEccnPX3Y=;
        b=I0v1rllBTwsxPH66ULZx8uLg6kvKgZ6fCTxLwwQcamMD2c95V9KvEcGV5xfKppwjgg
         1fBFwRlKCL710YteYWilDDgyD4FR6XCsR3+zpPBDkCUDjpo5eFzrfiTGPL/9MgI6b6Y0
         JdhF+aELt4Os7lq0OrEoPp1xdS2FCgZFVJe/5mtklzDSY4OFHvLCp64Mhjp/PM2IL1fF
         woDbIDs5JIjMSAUuYSusqEe8NSUBfYYe3DefDp8QK4zV8ZPseqSSkz1r/VWsgIXbM5Fx
         cjFtYjpPoh+d2EmYbcU3abvS0vScHGn2E0AwT5bcQnZboeqmoWS/Slhn1D3a0Fmo2uSf
         YD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699022439; x=1699627239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qRKawrA5sxNO4ftUWA7GeIchvatyoSn2hTEccnPX3Y=;
        b=xSdyYh9t6IcGL+H2qaMz2bY3QTAPS3NcdBm0h7ZUbT6bCfFlWTGPhdK3s6jNy1Q+Kv
         /g2sdXlRpGFWx58LipPLMiZshpCf5R9Z5F750bqJNJNnz0vmzJTJdznVnl8dIR6ieqqY
         JTIrKGMFFUTyGDwNaJ1iRjmR/1SORxA0wfLr7aVQ//9LLXsxA61g24GcxLDB4oj+sZdU
         YSKmFiIEtbp1h/Hjr+5ETLpRJLTBMVkwwR87Nu9ZOlULGVBJ1coOzTNZnKcxasPWiTBf
         WR0ZJhNofE7eH1DMGxcWd4F6kq8RCVN4kVQ6WJv80pH+ylVtTRsS1TFIuDK8rwWltuFG
         k7Eg==
X-Gm-Message-State: AOJu0YxH5ZlhStjKNovs/rGru2HO4LnjyALZPkf6DKfocHwtKYB0rihy
	zcQFPpldsD9DMIkDyLAlNnFxGSgzsZcmXbayCuI=
X-Google-Smtp-Source: AGHT+IFq0kTu0FqSMGzWArvEOZBLQf/5Fzyk8qnwh8mqAlQYgVoQrOGWjX6EgAlm/L6KET5inPmO/G0Tke1w52zFxU0=
X-Received: by 2002:a05:6e02:1c07:b0:359:6e32:7097 with SMTP id
 l7-20020a056e021c0700b003596e327097mr386075ilh.23.1699022438808; Fri, 03 Nov
 2023 07:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
 <CADkTA4Mgak8=Hg1eFjUfXiskt5=QO0-cGyOA6zLn4Ck9EUn3GA@mail.gmail.com>
 <e109a5972f41d6410f9680765fb2c5dd53fc8c4e.camel@siemens.com>
 <17941DFC88BEAF3E.3650@lists.yoctoproject.org> <CADkTA4OcA=z3xwb4rCigLF331oiWyEEOgJoU07OpUpn9y8qKxQ@mail.gmail.com>
 <632b380ea47e25224c67e6c7358ae5ea25a27663.camel@siemens.com>
 <CADkTA4PffsPrmCrHeAM9A5zivxPeuHJk497mEyY2Uf=Za3NRUw@mail.gmail.com> <c3b717c980568fb8d6d82fdd778cf3715d107ade.camel@siemens.com>
In-Reply-To: <c3b717c980568fb8d6d82fdd778cf3715d107ade.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 Nov 2023 10:40:27 -0400
Message-ID: <CADkTA4ORrENvzkPYG_1EnDca-BQjhm4L3nj9e+ZfNer4wcd0Yw@mail.gmail.com>
Subject: Re: [meta-virtualization] use of yocto-cfg-fragments
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 14:40:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8421

On Fri, Nov 3, 2023 at 10:21=E2=80=AFAM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hello Bruce,
>
> On Fri, 2023-11-03 at 09:59 -0400, Bruce Ashfield wrote:
> > In theory, I created the type=3Dkmeta for just that purpose, kernel-cac=
he and
> > fragment extensions, so keying on it is at least consistent :)
>
> I had this feeling regarding type=3Dkmeta, trying to understand the limit=
ed
> documentation and how to use it with file:// and nested directories.
>
> However, I find it extremely useful to have custom .scc files with
> the whole verification machinery in kernel-yocto.bbclass.
>
> I doubt that each and every use case must be upstreamed and go
> via yocto-kernel-cache, I believe users may have valid but very
> specific .scc tailored for their use cases.

Right. I want to support your use case, and encourage the sharing of
useful fragments.  Definitely not a requirement to upstream everything.

But I did make the shared fragments a requirement for meta-virt with
the intention of deleting the local ones. That's why you see that
dependency kick in.

Having the concepts and tools used and being useful is a good first step
and I'm good with that, and like I said, I do want to support it.

>
> > > I can also try and think up another variable or a way to exclude that
> > > dependency
>
> So maybe another variable could be an answer.
> Because it's hard to distinguish real type-kmeta yocto-kernel-cache
> (especially if people would have their local, maybe partial mirrors)
> from just couple of .scc files.

Very likely this is the solution, have a way to opt-out. Knowing that
you can possibly run into issues with KERNEL_FEATURE validation
or with runtime if you do opt out. I'll probably emit a similar warning
to the one you get if you include meta-virt but don't enable the
virtualization distro feature.

Bruce

>
> > But I do agree that it is pulling in (potential) support for ALL of the=
 features
> > in meta-virt. That's a balance between having too many fine grained
> > distro features, versus the one big switch "virtualization".
> >
> > It could be finer grained, let me see what I can come up with to slim t=
hings
> > down a bit .. but as it relates to the kernel-cache, even a more fine g=
rained
> > trigger will want the kernel-cache for either virtualization,
> > containers, xen, etc.
> >
> > I'll follow up later today, once I've thought about this a bit more.
>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

