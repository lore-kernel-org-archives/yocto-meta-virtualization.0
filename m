Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B03C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 14:59:35 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web08.29896.1660748374072932144
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 07:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TmuqgS5i;
 spf=pass (domain: gmail.com, ip: 209.85.128.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-333b049f231so126448567b3.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Zv+17bn7bhuHvVz2czCsR8NXCcHMpqX/tipGBTdhi+c=;
        b=TmuqgS5iDzghHpA41cskvjLjLmezsqPWGbHnC1eBPyPZxpfBhCEkGklPuajGIH61P+
         us9MWBfSM9pPS7HBqFdZ5SiCO4NpX+tr2qLx2Cnu5iivXe6vHA4iD5bAeGdBOnyowzuj
         gE0WMwwI3Fy1n7av0INnCUROeTITHQ6zQJtRKS4SXZWzdHy2fzRVblsOXGxTc9F73zGa
         9YKu/69x6oYDX7FW51LVW4fgW83xkgWz6S9wLMwkYF2r5EwTHBerUqas8ITolOC5s3UX
         bTCEwHPdQmN+RcvuHP7psRxPr//zi7O+x2KiuqUaCamycNXYywBGrKsJMQdpYL1yZx4X
         CBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Zv+17bn7bhuHvVz2czCsR8NXCcHMpqX/tipGBTdhi+c=;
        b=4h7t7jPl825WfhyK4dFghRDbg/pHysaz3WO2QGuvkSIOEphZGFSBIkHuW1QV3W3MOH
         kowm1IBa7BSUILe6E41Iekc8ZxGVXrpfJMXAMQHEVvIdydnMtUKM9oMjxj2ypHSHz2Uf
         7Rfo+jga7pCotxaxKz8TVKjXX+kDI+otQUfGe4D4W5Rx0486qQZlhf3Zar56pJvgZr4x
         4U0RDgeM5C1Id/fETgQr7mLfXQYFmXx4IyVLK8p8TyZOdAZLkbVJF+DltU9J2IvpFqPm
         BSlyT4LOTCwgUi+MFigOZTjenyAqEXwYKabxImyMQAl3Yq45jeBAvzQpLGTKCbXvwGlF
         eFcA==
X-Gm-Message-State: ACgBeo3CIbH9C1s1wr46eOLgu122LuQKYeS4i8K2+yIMfnqz3hd6mYcP
	OK1tUqvB7te8+a+s5fUlEFe4XUMU9nTk2L113ws=
X-Google-Smtp-Source: 
 AA6agR4EhQnYu8nopqideACtxlriYA/4X/Bbpa91546d91ogNPEQM5NsV/pmCKsVmjbFY6TfB0+WqZ/A9MqmNeeBy9E=
X-Received: by 2002:a5b:107:0:b0:67c:4077:17f0 with SMTP id
 7-20020a5b0107000000b0067c407717f0mr18435284ybx.363.1660748373019; Wed, 17
 Aug 2022 07:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220817115051.353409-1-andrei@gherzan.com>
 <CAMKF1sp61KuH21-T=Oqdq52DDAP6-uOjPbXZJQ1K-EGUL0Y0Aw@mail.gmail.com>
 <1a401d8a-cd6d-4948-ae9d-5baba6deca52@www.fastmail.com>
In-Reply-To: <1a401d8a-cd6d-4948-ae9d-5baba6deca52@www.fastmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Aug 2022 07:59:06 -0700
Message-ID: 
 <CAMKF1sr2EN_iZRKV6jpmR03Pvqs1=PNYR_1238xiOQWhErE-5A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] singularity: Skip recipe on musl
 builds
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 14:59:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7533

On Wed, Aug 17, 2022 at 7:15 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Wed, 17 Aug 2022, at 15:09, Khem Raj wrote:
> > On Wed, Aug 17, 2022 at 4:51 AM Andrei Gherzan <andrei@gherzan.com> wrote:
> >>
> >> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >>
> >> This recipe explicitely rdepends on glibc so trying to build this with
> >> musl will break world builds.
> >>
> >
> > do you know why is it marked as glibc only.
>
> I've tried to figure it out but I couldn't find anything obvious.
>
> https://git.yoctoproject.org/meta-virtualization/commit/recipes-containers/singularity/singularity_git.bb?id=06bc17d1f0650ad2cb134b09b25133bcd641d473
>

maybe that rdep on glibc is bogus. Its not normal to depends on glibc
like that, in some cases e.g. locales etc it maybe that we need them
but thats usually for ptests etc.
can you try to remove the rdep and see if it builds ok with musl too ?

> Andrei

