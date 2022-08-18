Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E47C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 13:46:22 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web09.42359.1660830354510054374
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 06:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d/k2yW5F;
 spf=pass (domain: gmail.com, ip: 209.85.160.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-11c4d7d4683so1806623fac.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 06:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HlkTzdAeiK5Fa7KBIYI1Kw4hcMoHBRJMdhm9iDKDxm8=;
        b=d/k2yW5FkkmuRyIF4oY4Ggll1zvy5ZXJQs8ntWB+73yXzxgsWVMHH/BKHzAXxIf+rT
         FHBmt049/T0g3Bu6g2pQxbkHf9G6S4G62vBcuAHRZlG9jEz+ADFPJSh1c8RucRYXko4x
         bnIXssx5OIi2qNSurct/0HLBtAJzqqHUfwnmLsWbcxsMsl0Quj8KMOWCOBm0nFOcb0T0
         9bYMtkq4f0zYfVU5Y9apn4Fd9DD8BP8tCn3dezijWHAqd7l6FAZ9iSFWVo6Tw3GCni6X
         9tVeLfQje8fdRhRYUoYuQjPqJrsV0JzSdR4vraE/+w97jCqFkrHhizMLLT+wRGxwjLT8
         yahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HlkTzdAeiK5Fa7KBIYI1Kw4hcMoHBRJMdhm9iDKDxm8=;
        b=DPnNSFm6nN+kDMsaUyyX57qbCpRB+mZ2hhm26W7NqlxvNPBt8zmd1vn1jU6hvor3pk
         pmfKB+tiSdybOmrbZus4vutlTB8Q2cwEl2yBRw4AHJ1VbJSx0u2f4iV+GkogyGRqkoPi
         J+h2CEqzBk0RcDzroFwnO6RedbQOXagg2XUN1o15llDSGD22dk3CfKTAibAuGe56g1SA
         M4THxO9jZ+1M2lW97FK2CGU7lK4IZCGaOuFyd/OyJnCZiY+MeBNRocr5qAFxSdfK+JTt
         xvJSD3D7EP2CFVbotK7s2pW4wXzq6s76VQs7gsDrXD9QvB5FnTdC14kTjHEtUmwLhspG
         w3Ag==
X-Gm-Message-State: ACgBeo15GYxAWtFi3pdyzlfsd4JCh55uXX/85kQJ3YCgAZbwNOQfKfmN
	Tstt5D53X41cBLe4jB4YlbpwqAtPTSrE0qgu5Cc=
X-Google-Smtp-Source: 
 AA6agR6klgmGp9FdA7G+bTvYGWIbI10G/XTBn87312dt4zsvvFWRLq+xo/9FjuepRp0TqnM6Vlo75gK3rQgIc/frcKI=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr4192152oae.6.1660830353866; Thu, 18 Aug
 2022 06:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220818094304.1773112-1-pascal.bach@siemens.com>
 <CADkTA4OGNgpUpfaLhk8-AdOXtzGoHt6dSqJQrZfeR0nO_4H-Cw@mail.gmail.com>
 <DU0PR10MB53618F27B7137D6F0F308791F56D9@DU0PR10MB5361.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <DU0PR10MB53618F27B7137D6F0F308791F56D9@DU0PR10MB5361.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Aug 2022 09:45:42 -0400
Message-ID: 
 <CADkTA4Nt767FgFh_m--XtdgwTo4m6Uf7y_3Q-hBt_K4Vztt0iA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] netavark: init at 1.1.0
To: "Bach, Pascal" <pascal.bach@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Aug 2022 13:46:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7544

On Thu, Aug 18, 2022 at 9:17 AM Bach, Pascal <pascal.bach@siemens.com> wrote:
>
> > >
> > > Netavark is replaces cni for podman.
> > >
> >
> > s/is replaces/is a replacement/
> >
> > Since this can replace CNI, can they co-exist at the same time ? We should
> > mention that in the commit message. If they both can't be active on the
> > target at the same time, then we should have a RCONFLICTS in the recipe to
> > make sure they aren't both installed.
> >
>
> Both can be installed in parallel. And from what I have seen if both are installed
> podman seems to prefer netavark.

likewise, that is what I was seeing as well. But I've been avoiding it
(netavark) for CNI so far :)

> The backend can be mahually selected in the podman config
>  https://github.com/containers/common/blob/main/docs/containers.conf.5.md#network-table
> but only one can be used at a time.

I can run my multi-container, multi-runtime tests against it at some
point (I put all the runtimes, all the frameworks and all the
networking on a single image to see what breaks), and then document
the results.

Bruce

>
> Pascal



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

