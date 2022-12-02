Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F094AC4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 13:12:01 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.74462.1669986721298245027
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gxFVSmxg;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id g7so2069152ile.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Dec 2022 05:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XgMPH8g4a6JMeqSkIJlenBfwMH0o46dW9oSrCtNJQl8=;
        b=gxFVSmxgU7mMR7VVFlhZcJxyE5uBey5GMyP/u3iasX6ENlwCDYEPafThFjlqvnu7oB
         oPPup35xwJ1QjkfScCEXmGQBdwlautHxqRSjZmGRurtzhbEEzicLn2QD90UQytAuSFME
         4vpiII4gvykm69VFlFKy1Apx2HprQ9dXg95isJ/dSsknWor5VvbvjRwSgCKUlVCTlYl7
         SSp/c483AtmlFbIwmbLnet1QZaUUwNO1aWGyh19yqobFWSUclPeYyrdKFNQyawqx6/2j
         aTeWkOIru5r221f904GjVOKg93ZuTBse0sn6lw3jNatsn4CS3yzsFtPNWJSh1kCSrSoD
         SRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgMPH8g4a6JMeqSkIJlenBfwMH0o46dW9oSrCtNJQl8=;
        b=P+2i0HCOXQBaUC8KtWd4Tt/u+pWl+2I6VLKGcvca3G0iINlcH0D1RN8kmZBu7kOvl8
         923WhhYyWggQ2nWNDjhiGLmpxE6xUEXF2r/jfaKBG88SsgoGhI1KNljTt1MyB9YSTqeA
         m9iO/5pCMWjbv2Lj7jCrqBU9MLdUlD4JJx3Scs4ZBXSbdaYy4mXJRl2xdiuetqSeiq5h
         Wcp4BW/oDWz052e9vtPEX2pmOkGr6vrXJzcB13RnbG1FvaPPi9gBh8GMx9gbIUturJnG
         LRkJ7lPWKnZaGUsucUjPVKrKCPmiSW2Gj041Ygo0HEXycavsFqYZeAHARczF9SjYFWkr
         X6ZA==
X-Gm-Message-State: ANoB5pln7XfT43uMjf6PvbxYulFrJtMcfywgbG789QnYP5DBslLQJH87
	NPUrKQ1pyTfoQmuYlnOzzyjkWQGLt7/nXZUoOBc=
X-Google-Smtp-Source: AA0mqf52OIh/cTXCFICA8QWU7dxn8gqKfkv0wh1HKTZMRgLyRD9J/cZN3g+OBe2sPpFLaNSOHuyHjrdzztK8slDvZh4=
X-Received: by 2002:a05:6e02:d92:b0:302:74a8:c234 with SMTP id
 i18-20020a056e020d9200b0030274a8c234mr22223290ilj.55.1669986720497; Fri, 02
 Dec 2022 05:12:00 -0800 (PST)
MIME-Version: 1.0
References: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
 <172CB2E0F08C4564.1705@lists.yoctoproject.org> <CADkTA4M=vRTm4Ty1Y1y_5Ehjb94Omk-MNeEFPtGZUsoS6xGsOw@mail.gmail.com>
 <75e9b925-a236-0809-49f1-f2f3cca0e263@axis.com>
In-Reply-To: <75e9b925-a236-0809-49f1-f2f3cca0e263@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Dec 2022 08:11:49 -0500
Message-ID: <CADkTA4PB0ntC1xpOnEgHK7eFiuyDEvvx9MpM=y=T2dBDd6s7Sw@mail.gmail.com>
Subject: Re: [meta-virtualization] [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Dec 2022 13:12:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7731

On Fri, Dec 2, 2022 at 3:46 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> On 2022-12-01 16:08, Bruce Ashfield wrote:
> >
> > I did have some luck, and I pushed a proposed fix to master-next.
> >
> > Have a look, and see if it fixes the build for you.
>
> Thanks a lot; I tried it out immediately.
> It will, however, give me the same gitsm error:
>
> ERROR: upx-3.96+AUTOINC+8d1a98e03b-r0 do_fetch: Fetcher failure:
> Submodule refers to the parent repository. This will cause deadlock
> situation in current version of Bitbake.Consider using git fetcher instead.
>

I don't see this on my up to date master build (I'm always following tip).

Let me dig in a bit more.

That being said, I've written multiple recipes like your follow up
patch, and I do prefer the clarity of everything being directly in the
SRC_URI.

Bruce

> BR,
>
> /Joakim
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

