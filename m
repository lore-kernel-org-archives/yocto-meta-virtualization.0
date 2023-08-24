Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CDFC3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 01:42:42 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.1694.1692841357709333715
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Aug 2023 18:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JVAEALNB;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-34cafafa50eso11432015ab.3;
        Wed, 23 Aug 2023 18:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692841357; x=1693446157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Tmugbu8Q+t6DXmASnUkjHKgWUQ7pL0CJPRksggHAt4=;
        b=JVAEALNBmWi2ZcgHVhfWuwUzV3Mfd7rM/UToGGTkSLGJVdc1H/hvISAqZ9ypYm2F7Y
         ujRIqzKdTUWECfK6gPyio/JYLiS8dG+4lNuoBzSvymh+ho/FJYCLa8M5ATD77r5co29s
         ZnWV/grJj5z5YFWozhisySp7QxF+t4Jnm5vus5Ym7UzAMvrP85LcNb9fizBrjbnNCQpb
         5ajvNnnHwifFlG5d6sekZhlcZyUkrdKsIGMreLlC2cX7bl/8oYqsffmP3W8xD4YV8+++
         KVWhoX36RpF34ZRVgZS6biy0uz20iUjZm2hvYd52SPKNoK5WF+ZNY/TydNtIQNagIiij
         YMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692841357; x=1693446157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Tmugbu8Q+t6DXmASnUkjHKgWUQ7pL0CJPRksggHAt4=;
        b=k6V67zGqCuBfQ+4D1+BdyRUTXRRGphYQIC0dk8RloSDjOAzHw24e+SReYNnjwphprm
         vYnSTsQ9jwwzBDPYIcu7pnZTYEQJBRzBNfRzed94AoaTvQ6fR1tiNktkLr0sgZVwDJwu
         uayBMl0dC1cdYpS/5+LjvfjJop4bg3QWv1IHhrc46UsfbelrQWZGgy/l7h+Ndpg9yxKp
         /KiebnyFKisuCUttcSkqGuQxHwcuvTBgfhXY6D5PhRT8rpcdZPm/nJk7t3laAOpD4sVO
         ErMQXSMyn9b0UHHXDqcgxikj4XMN2ex9+xOA+wkO0GnjKrTcVkizTm7BDNuEMg4as+6h
         O+Rg==
X-Gm-Message-State: AOJu0YwuaAmMCo0pM458I/meVqXxAtshCq1h9FvWMPV0QKTmmXbNnHG4
	dbafn0e+XIZaS7YyV1PhYEmQs60ysJAvgQaWjhg=
X-Google-Smtp-Source: AGHT+IGxaLrVZIzvVTcehJdtZV2uGNwUVatKnq2eW6eCMUW51rFB2gIhtN0PPnw0xzwpJpqJoKUp85LMUih+Ei0kyMg=
X-Received: by 2002:a05:6e02:2199:b0:349:9956:e22b with SMTP id
 j25-20020a056e02219900b003499956e22bmr5443543ila.20.1692841356788; Wed, 23
 Aug 2023 18:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230817205239263dcbeb@mail.local> <CADkTA4P8UVP4kVXNAoV2rG+KrA2QZEKh_FTYr3psi9ASeveKOg@mail.gmail.com>
 <20230823212318b673a862@mail.local>
In-Reply-To: <20230823212318b673a862@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Aug 2023 21:42:21 -0400
Message-ID: <CADkTA4Nmv92Ems9TH2aY_=kZgiPT_=byc59zPe9WzA3-_J2JNw@mail.gmail.com>
Subject: Re: meta-virt fails check-layer-nightly
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 01:42:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8223

On Wed, Aug 23, 2023 at 5:23=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Bruce,
>
> On 17/08/2023 23:57:30-0400, Bruce Ashfield wrote:
> > Richard reported this to us, and there's a thread on the list about it.
> >
> > I just merged a skip_recipe change that in theory,  should solve it.
> >
>
> Just a quick note to let you know this is still happening:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1543/s=
teps/23/logs/stdio
>

Hmm. I'm not sure what happened, I was absolutely sure that I had pushed
the SKIP_RECIPE fix after letting it soak in master-next for a bit .. and y=
et,
now I don't see it.

I've cherry-picked it from my test branch and pushed it to master.

Bruce

> > Bruce
> >
> > On Thu, Aug 17, 2023 at 4:52=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hi Bruce,
> > >
> > > check-layer-nightly is failing for meta-virt:
> > >
> > > ERROR: Nothing PROVIDES 'clang-native' (but /home/pokybuild/yocto-wor=
ker/check-layer-nightly/build/meta-virtualization/recipes-extended/vhost-de=
vice/vhost-device-gpio_0.1.0.bb DEPENDS on or otherwise requires it). Close=
 matches:
> > >   glslang-native
> > >   slang-native
> > >   tclap-native
> > > ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
> > > oe-core:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/15=
28/steps/23/logs/stdio
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

