Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7853C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:42:20 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.28676.1657546939336461333
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kkealXXK;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id o18so4748239pgu.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tuTp+eNc/GBu8NUCMIUOIZrVg2DWZWwE3bZW6PrKa0=;
        b=kkealXXKWDhIhBpWufWIv+wt/qynx91v8e8FlYeRP0pdzEc91aQCiQalPyZw9LP+9K
         YiqoWZtTD2P2YUAKcU751vGscaeYUEdkCseOYwP4f4h3dvDZceHi68bQxlh8yPhq1UN3
         JQMInYa7npUFwPpwupyeIM2wsdrL+BrANb4C//gNiRH2C08Fq7cMbDzbNaSgO8UIz8eo
         mkv4iJjH8XZsXHncUhvDedQFoVCLq/80wv2ujJpqvYIet3GN0qDw0qBkegWoLUXjwy2D
         AJ1wCfMzz8yeetk05AXQWG8aWiQhMK2x37PL7UlvJzl47lXAdJP2bPSQn8ixbG5brXw6
         xL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tuTp+eNc/GBu8NUCMIUOIZrVg2DWZWwE3bZW6PrKa0=;
        b=FuOvRhVzPzWZ55gAf1ryOUMc8vCSvX0QAzCHO0+4RWvi1r0JTvioUJa52/dJuoz18e
         PCVmfd4sx5FOD5urHSS3hxCLLgndcyzwd27GLku7z+zEVqLpjASNiR2SoFrMaKQ3n1D0
         ZMUnypC+NTe818/+VBqFyVBxwaVslEj+E1tNwxuPr6jefa1zNa+rJmgDXUaAO+fsY6cj
         bcwFrg6YyAH8nrOxXEumcbQQU43BHVdOMipXuKWLCg1ozfSnmUhkYRG3qCuDM8lzRbbS
         Jye0ngWE1R0b5+li6mAW7CLW8Wv3RWUjFJeLMhQDbbbhvz0iGVrjHfKBc8mpFgoHuj8b
         mItQ==
X-Gm-Message-State: AJIora+1QBmu/NC1UAgtTY48ARW21Fa4eZMisfphXfMTrvzbEKD32V3n
	LUpw4BHcHeKqnlVKC6T5bRxhrgtl/idPU+7BPK0=
X-Google-Smtp-Source: 
 AGRyM1tuK4NH16x/ZTGZIGKvoNt0iCueAktX8p+ne6uehDNgDlfgv4T2Gu5IkCMALj0I9jxHPf/V1jMz7G578rFFKAg=
X-Received: by 2002:a63:9041:0:b0:415:c0e8:c588 with SMTP id
 a62-20020a639041000000b00415c0e8c588mr13682813pge.282.1657546938783; Mon, 11
 Jul 2022 06:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220711130110.3264816-1-andrei@gherzan.com>
 <20220711130110.3264816-3-andrei@gherzan.com>
 <CADkTA4PMRv54fcxXz_+NtzJrbH6wf9XMA=0nzQaRSmLX8YCGDA@mail.gmail.com>
 <45eee3f1-8e1e-4606-94ae-08c9001381a7@www.fastmail.com>
In-Reply-To: <45eee3f1-8e1e-4606-94ae-08c9001381a7@www.fastmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Jul 2022 09:42:06 -0400
Message-ID: 
 <CADkTA4Ok1GrK3hRD7dzA+G_-U5Dvu7bhj_eGm8ajx8kBBUjeEg@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 3/3] podman: Add support
 for rootless mode
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:42:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7432

On Mon, Jul 11, 2022 at 9:39 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Mon, 11 Jul 2022, at 14:31, Bruce Ashfield wrote:
> > This is new functionality ... and while we don't have a strict rule
> > about not adding new features to existing releases, this is stretching
> > the definition, since it does have the potential to cause issues.
> >
> > It is definitely fine for master, but I'm not particularly keen to
> > start adding new features to kirkstone.
>
> That makes sense. Would you accept it with a disabled default in kirkstone?

I think that's ok .. it's a balance between keeping kirkstone useful,
and not requiring folks to carry too many changes in their layers.
It's easy enough by inspection to show that the disabled feature won't
impact existing functionality or break anything.

On further thought, we should keep it disabled by default even in
master, so from that point of view, we can keep them in alignment.

Bruce

>
> --
> Andrei Gherzan
> gpg: rsa4096/D4D94F67AD0E9640



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

