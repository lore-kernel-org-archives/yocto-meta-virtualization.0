Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410CFC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 21:07:50 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.16475.1664917658616007136
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 14:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o5HURbx8;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id hh9so541097qtb.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=jJtbO9yDwlCddbAS0GQ4Z0bF2IGZiWykfemvW6MKY3Y=;
        b=o5HURbx8DnQscuC+PTAVHdtvRDF4dleg/tVJLlieLwBryj8MwtZ3xfQG/4OilRqhIV
         CKTPEKo0vkwhJqmLY7gav4dwgeHYQQJt1ToVPCeG0hBiZs5TdaCVpus0HfA7a/5eMuJP
         BVyq/fFT53zioKA9L0sbna3rAdNbRCxaumDJBgl1aww1/9RtAGPSaIyc2U4WxZJLrX2T
         6Xi/3BFfMn8l+kPT6Oof8Lf4StUKHjM7pitur2ZopnO2cn80jNndtYjEHQUGtKvgEaKR
         GhrllaZefhSIC128srRxBCLxsSu59fZNAijT/c3QM5rdYvQTPFnbVb4Spf8+3PjG8Huk
         qVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jJtbO9yDwlCddbAS0GQ4Z0bF2IGZiWykfemvW6MKY3Y=;
        b=NMWehylbM4S+QgLQ9v1LvShzWUco70Mo/DHtVbOsSkdj+eHze8f0DjvPraoKV6pf8C
         vS+Sn7FuTtJBTjpDfreeVI4bVlw1mq2ELVepfC+TIX/A0cDHdt3snGaZb+tz+yutJ9kH
         p25yHKgpR0ZgV5rSrm90Vr2X6YFsy7uNZfL074nVnLqUfum5/m++M4QQtA7QeWg9TkBu
         El/JxgTYxugJzJylAcHxy4wGpvW1Qu/U2zh/MdEzoQoxU2h0evvZfHGUZajRj9VVLrO0
         lAY9AwZm5ojnP1khpcv4f9lb1Bbh2NA29l1H3kvlGPe+vFwHu9GLrjHL+TxMNoNtZXkV
         BO5Q==
X-Gm-Message-State: ACrzQf3n8oBszTYneYhD1Qcf9As1EHCTs5W9vRipD2FgnSs575XY6OrD
	i5BZyOuuVg01/MJOyhbe3QbCmCdHiWk9xrTc
X-Google-Smtp-Source: 
 AMsMyM4862bHa/zkAB+kTAQK0gm2EEH5a8gZSc6/mn7e6UPdMuJc32NX241yJSiOKxWRpn93Nb1sLw==
X-Received: by 2002:a05:622a:15c1:b0:35c:db1e:cdef with SMTP id
 d1-20020a05622a15c100b0035cdb1ecdefmr21144300qty.104.1664917657477;
        Tue, 04 Oct 2022 14:07:37 -0700 (PDT)
Received: from gmail.com
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 t14-20020ac8760e000000b003437a694049sm12507513qtq.96.2022.10.04.14.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 14:07:36 -0700 (PDT)
Date: Tue, 4 Oct 2022 17:07:35 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kai.kang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH 0/1] Update criu to 3.17.1
Message-ID: <20221004210734.GB60875@gmail.com>
References: <20220929085141.19781-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929085141.19781-1-kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Oct 2022 21:07:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7641

In message: [PATCH 0/1] Update criu to 3.17.1
on 29/09/2022 kai.kang@windriver.com wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> Hi Bruce,
> 
> The latest release is 3.17.1 but not include commits to fix for glibc
> 2.36. So backport them at same time.
> 

merged.

Bruce

> 
> 
> Kai Kang (1):
>   criu: 3.17 -> 3.17.1
> 
>  recipes-containers/criu/criu_git.bb           |  12 +-
>  ...u-Change-libraries-install-directory.patch |   6 +-
>  .../0004-criu-fix-conflicting-headers.patch   | 288 ++++++++++++++++++
>  ...nt-add-definition-for-FSOPEN_CLOEXEC.patch | 110 +++++++
>  4 files changed, 411 insertions(+), 5 deletions(-)
>  create mode 100644 recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
>  create mode 100644 recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
> 
> -- 
> 2.17.1
> 

