Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76E6C001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 03:57:49 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.4820.1692331062726136532
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 20:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=a5kP7k0a;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-34bae88001dso1701375ab.2;
        Thu, 17 Aug 2023 20:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692331062; x=1692935862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2i//S8QGckK9VNn0Q3AIHfrqHN6L+JWht6dhpP0AiHM=;
        b=a5kP7k0awNirQIrOzBqDrPC2raxT6jYup2dI/G3lMxGSehY9Rjfp1AWxlXEcY5J8kL
         l1BjFn1RA9fHlDZBLV/jPC9H0XojbwzLDAO01IXlf7z7wKpk6WKO43r5PLpNnzyLeWlz
         wsSn2TZSsaNvhd5E7AHPFQkm4vGq2sn1BRS1XHlh12smnGKWPEChPnIKzjKBC56hlosB
         tybG/3oC6dpfy/5pIQDrMW25sTegO70DsMl2CON4aEY4Z544leikSF37lvd6Qq02lf8Q
         kAQpxSuo29JsTEazJbdwMSdzydaX4M7W7nZfO6DUIQ+omwBhu38XIMir2cd+fl7Jrzlm
         s8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692331062; x=1692935862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2i//S8QGckK9VNn0Q3AIHfrqHN6L+JWht6dhpP0AiHM=;
        b=ciuKiNsTpjaRHW0mZNj8g49ovTB7i+vS3wPSw4m2RZ2eho3IywaIeJy0OtMIqNh/Yz
         qmIQ9bbxhQ/Fd5IAaJzRPfrQTd5WjvJm2l4gXg4jrjOTfm9Y8p2W3o6mD0YJHpBXjgYp
         rPJ1YaeJ2/FFXl2RvnWlS3uMYnNORjL7ZzHp7JlFTZY1Pl79vr521FmFde2AXSjxMBOe
         Iy854DbLlljK5OmfU+wjBREpxrrp/YjmbRH319kHojc93nkjgruXj/RjA/zhdjWhhPff
         uN0ZtUbs2IMtt8YQSd2QYy3w0wDUAlR3c07tGAtORav5ZkTy2Fu1N9XSmJPWvFTT1yXF
         giDg==
X-Gm-Message-State: AOJu0Yy0i3s6z7UfptxdNHnxyEXJ0WXyJMrgFayb20jGo9yS7z3wapkS
	f7u7HSBppR1SCqQil2NdF3Cwvz6kI4OSpoMNaus=
X-Google-Smtp-Source: AGHT+IEaJSaeGf44kF2blSAZDzw/VIeh/Pnge8aNsaFghMLmCnu/V4KOSUhG6vY7XPQt1++UkaMwDNdcTzJVayn7HG8=
X-Received: by 2002:a92:cb44:0:b0:34a:a4a5:3f93 with SMTP id
 f4-20020a92cb44000000b0034aa4a53f93mr1729969ilq.5.1692331061778; Thu, 17 Aug
 2023 20:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230817205239263dcbeb@mail.local>
In-Reply-To: <20230817205239263dcbeb@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Aug 2023 23:57:30 -0400
Message-ID: <CADkTA4P8UVP4kVXNAoV2rG+KrA2QZEKh_FTYr3psi9ASeveKOg@mail.gmail.com>
Subject: Re: meta-virt fails check-layer-nightly
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Aug 2023 03:57:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8212

Richard reported this to us, and there's a thread on the list about it.

I just merged a skip_recipe change that in theory,  should solve it.

Bruce

On Thu, Aug 17, 2023 at 4:52=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Bruce,
>
> check-layer-nightly is failing for meta-virt:
>
> ERROR: Nothing PROVIDES 'clang-native' (but /home/pokybuild/yocto-worker/=
check-layer-nightly/build/meta-virtualization/recipes-extended/vhost-device=
/vhost-device-gpio_0.1.0.bb DEPENDS on or otherwise requires it). Close mat=
ches:
>   glslang-native
>   slang-native
>   tclap-native
> ERROR: Required build target 'meta-world-pkgdata' has no buildable provid=
ers.
> oe-core:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1528/s=
teps/23/logs/stdio
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

