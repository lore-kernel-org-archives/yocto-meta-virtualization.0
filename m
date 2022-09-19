Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC545C6FA94
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:31:58 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.20533.1663597909880078483
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Sep 2022 07:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Db4dot1S;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so7423761pjm.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Sep 2022 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bawynhUMcw1rusEN43rqweNVroJGlVB+cUFJtSDbpTU=;
        b=Db4dot1S8fLkCTqYXJ39fgLPVC2rdtEw6Db9HFhUpN6r+QP0/yJKmAiiqsgjrPOya6
         wpVIyEgsjIY9Yrz5Jn2av3jYON1xFswtK0HfqFPa8pznvMS7artjTZecUNTPTTrM3zzs
         8VCzevg9yDf1o7DVjnpxDvrRzjTCyYEgzln28w5kiWFfXfwLdsy8fsfZF46+0oCeCwLk
         1YHCN+oljXzc6fZYrUCRfRIfm/ps/X/kYS4D7YhksRkZtZE6r+47CIcgt/bZMGOr9I2L
         NR7xtzlBRkFK9awUp+/PZqbZdyERKA1FLRpe7qy7ey30vPkOVWp6NZZ1Skv1UeMwwJYk
         D/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bawynhUMcw1rusEN43rqweNVroJGlVB+cUFJtSDbpTU=;
        b=BB/xlrQXN+/0zV0T4m+RNXVNZVIJMzo+AmsWyjGuziMZs3oJjztyw+WX5x4isHpNgP
         M6BYq2TM+glrDuQNO1Hbgu5RrNzNss0u6+D7p4cuZ30KfK5e4MVMgbXczzX/zQ1Bmzfg
         Cw+Rs3m1juOjuHJhSDq5Qg+UA1GjKVFKmdEvpr9NifTP6uWjMg6RZoKT3xTaL+U6Ndh/
         2PfSZjodURnyRonn5Vb67GydOWzcmysSJkk6/tTEmtkPaj306RYYRjf9zvejq4VU5nDO
         Ztw0e7pIW+EnJ+yP/7SnVVDbbMsYaVK6bo2MwxOYMbJjOTss++riqFWsH153Hs7wrbpj
         4pvg==
X-Gm-Message-State: ACrzQf33qrWVLEOhGtLEqFmYdNjiVdqVJFcSpFsXmp0VuyEaKzAo5NKt
	X9LUTTp7eXB5Y7sBoJkCzta8nuSx3S7dGWEo1uE=
X-Google-Smtp-Source: 
 AMsMyM7aWMiLAckx7Gw9Vo63/PUcxpG8bs18LpBPxvADAN2Czqtr/geLxgC9EI/1Zf90npCVZz5LNl3o+n7wfLBOg0o=
X-Received: by 2002:a17:90b:35ca:b0:202:61d9:d2d5 with SMTP id
 nb10-20020a17090b35ca00b0020261d9d2d5mr31609973pjb.50.1663597909164; Mon, 19
 Sep 2022 07:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220916152356.GA33896@gmail.com>
 <ce799b82-dbcb-4247-b217-dc1929038386@www.fastmail.com>
 <CADkTA4Ma=LBNhQ=Eg7hRi_n5xx0kQMEkfdTcBW-g+H6iX+t53A@mail.gmail.com>
 <190a972b-ce8b-4ec1-b25f-b880b995ca9e@www.fastmail.com>
In-Reply-To: <190a972b-ce8b-4ec1-b25f-b880b995ca9e@www.fastmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Sep 2022 10:31:37 -0400
Message-ID: 
 <CADkTA4OUsRsDM-FuAJcnREkdfGeDsxOJ_xfznicuANOba7tSwA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH 1/2] catatonit: Integrate
 version 0.1.7
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 19 Sep 2022 14:31:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7619

On Sat, Sep 17, 2022 at 12:56 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Sat, 17 Sep 2022, at 00:46, Bruce Ashfield wrote:
> > On Fri, Sep 16, 2022 at 7:15 PM Andrei Gherzan <andrei@gherzan.com> wrote:
> >>
> >> Hi Bruce,
> >>
> >> On Fri, 16 Sep 2022, at 16:23, Bruce Ashfield wrote:
> >> > These two changes are merged to master.
> >> >
> >> > With respect to kirkstone, the issue is that by default the ptests
> >> > are built .. as such we are bringing in new dependencies to the
> >> > default build. That carries a bit of risk.
> >> >
> >> > If there was a way to make the ptest build and dependencies optional,
> >> > and disabled by default, I'd be willing to merge that to kirkstone.
> >>
> >> That is understandable and we will manage this for now as part of our layer(s). Thanks for looking into it.
> >>
> >
> > What about just the new packages ? (buildah and catatonit) ? Does
> > having just the packages but not the ptest change make things easier
> > on your end?
>
> Absolutely. That would be a step forward. Thanks.

Those two commits are now on kirkstone.

Bruce

>
> Andrei



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

