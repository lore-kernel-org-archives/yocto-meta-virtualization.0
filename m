Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B34FECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 12:55:16 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web09.36711.1661518510218894512
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 05:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DrlPbxQd;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id s199so1873415oie.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 05:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=zthmF362cT4bJ+y3PY6kdHL0HYIaHAhBCFbhXDR05BQ=;
        b=DrlPbxQdE/ZscbFAA/Xc5rtEBXPnrf3FBf2kbbGfLT0jHOgjZm/5XTwoi/GAVqS5pN
         jyPbgd69ljzrE2i/ivbQaf+7zACl9TQVqAF163iNtzxtOPYrpAMmbNws6mHuEE94r+bx
         cQ/W7DDqQ4gTN2GWR2ex5GT3a6w47UqM09rfA+vNLiqEBtl36G3zm6FuOwJZGi3Gc9oA
         VxzfAEPBA4MrhIbzo4wNIhRBrczNst+TinfeYFkmYT9vM/ppeAgbjQA6Dj/Rf4S+8jwt
         0ukM2EVNZl/X+kYDAvZRIudObkALWmt0dvpQKXN4aMVArZMxM69QVxPUPWx+cmzJ8jZy
         EajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=zthmF362cT4bJ+y3PY6kdHL0HYIaHAhBCFbhXDR05BQ=;
        b=3j/dckbIj+/0N/dCfF/jhL9EtVuVuqR2k/dpAKAyTEsVh8uJsWbjc/GqiL7tlzvxEQ
         XLhpgq8ah0c2jitjDTY3PPsLlWdhzTtOP0bih7j3HUJhNIMdeqNf1LATYYXR2lP2OiZe
         KQvOlO12f0KDqbSlF3GUtbLxKhY+K4GUnrs432HLN19aJ+Mnzyfm3g01HPu57cRmyAxT
         gWKrH0Jo5OAEpTI/NaK+gwhXJXvVZ4zXryGGX0IR3qCZt9Rwm2epnTtMsQrVHT/4xSWO
         SgWdyJas07BvwR52z8WitTg78CYAzD3PxrsoglxJWHc1zwyZt9ehtIVdxNnjtczIAMsK
         lF6A==
X-Gm-Message-State: ACgBeo22T9wravUsz67ka/7L4DDdTEvFPk4O7RLcD/913BcV/e9UbuCm
	geMyfwffUcsdFsj2IQbrs9yBjoXaRGXFacCGML8=
X-Google-Smtp-Source: 
 AA6agR6sUFSUcFzFavF4YfLSOTcJDFcZdLmm/2TGFjoNII/6JthmS65qQuHOyd2W+yrEDZlknZWxqgs7NU05y7LszlE=
X-Received: by 2002:a05:6808:1313:b0:344:973a:3669 with SMTP id
 y19-20020a056808131300b00344973a3669mr1490905oiv.175.1661518509499; Fri, 26
 Aug 2022 05:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220825170933.1046874-1-andrei@gherzan.com>
 <20220826025610.GE23530@gmail.com>
 <70bdaadb-e6a2-47ad-aefd-5aee5ec35b0b@www.fastmail.com>
In-Reply-To: <70bdaadb-e6a2-47ad-aefd-5aee5ec35b0b@www.fastmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 26 Aug 2022 09:54:58 -0300
Message-ID: 
 <CADkTA4MmzFSEpta+mvqCai95-bO2g_PbMHQGknLqjz7d_Q2GeQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] podman: Patch for
 CVE-2022-27649
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Aug 2022 12:55:16 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7575

On Fri, Aug 26, 2022 at 8:38 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Fri, 26 Aug 2022, at 03:56, Bruce Ashfield wrote:
> > This doesn't apply to my kirkstone branches, can you double
> > check the patch ?
>
> Right. There was a conflict with the other commit I sent for podman (sysctl cfg ordering filename). Fixed and repushed as v2: https://lists.yoctoproject.org/g/meta-virtualization/message/7573

I'm out of the office and don't have my normal environment, or
otherwise I would have sorted it out and done the merge .. so thanks
for fixing it up for me!

Bruce

>
> Thanks,
> Andrei



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

