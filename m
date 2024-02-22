Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706F4C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 17:37:29 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.18978.1708623446456563403
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 09:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IUaqNqMM;
 spf=pass (domain: linaro.org, ip: 209.85.208.50, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-565468bec51so48962a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 09:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708623445; x=1709228245; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49RukZTzu4skNzUTNOTcx3uCJnB33syeToFNxoW6h2A=;
        b=IUaqNqMM/puRYJd4Jo/M+EOzEwAHMnBpAVA36u/aXy/Fc2afjvTDW7h+7p51RO/3TZ
         f8c4J8nhww01RH7mpM1wUuZdz/8LnMHouYyhIJFByNLotFjar1z5in00jO3DwXNk7q2/
         2xu3wHcczjMI04WJJZ8l2E43X8zrUIFZZTWc25JJFzg9d6tEmjTTRuKQF1AqkZigLwZW
         VBwl2D4d5f0nkp5tIOZJc0ELMISy+z+UhtGY2p9yE5IJP5urIKT24CvvviGVpCL4faMf
         liEqHYgTtRBrrYSG8GnAuQDYlnxAPP+Yb+97g07Ky+YSEYB+vIwYmXbz5pr6UW1STKMq
         zhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708623445; x=1709228245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49RukZTzu4skNzUTNOTcx3uCJnB33syeToFNxoW6h2A=;
        b=GHUi9pw5vNBui2NDGfr3kPlTdnY0f4oX5Va5pNafWD+JtOGJYFz6Myjjf5UhbXeqNO
         sABlX67QkKsfIjJfUsF4DKdlKWXLpyQIV4OOmf4vtFCa42Wg8n2ae9PJXIE7VDDbIWlR
         vYxBVvLI6sVzcpsJrnSfeut86/O/9sDKzxUu3rFHu1hSh+vi3tdFPyEPWOPtM3z2QOSK
         K1B9MqOeSQAIu8QybheNUN7EdV3jbSLLnFYavwLqZRt2zQS6DcYA+/MUZqAScP0tmSQJ
         4nhkKbbYASODqFXV8ATFthOQvJG2fZwMJudaSLtOQ9MDV/20spMccRWbuUuA5ILzHfdR
         UqNw==
X-Gm-Message-State: AOJu0YzGkMMoESylQrL/M/+7/5fhFeaRVhLa25DadQ50cr4xBh7UmcH/
	szviu9eFjH7TaFwhxoPzdQG4UFI3C3FJorWFXLQfYWD7hVNFmbpXIrnpeVjUUF/MJY0Qm0hpO8C
	5TbDMBrskA0SfQDhlhi7TlPwxHSyo+HeZX09FAg==
X-Google-Smtp-Source: AGHT+IG1En2pmoJh64a19Ou5P767SJpvZjEP/1FCkOVFSGAbuUx0n3Y9MprW00+F39jYvz+gYBu8Lk8bb5jMcGBWqcQ=
X-Received: by 2002:a05:6402:528a:b0:564:4211:faa3 with SMTP id
 en10-20020a056402528a00b005644211faa3mr2858209edb.1.1708623444847; Thu, 22
 Feb 2024 09:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20240222162019.3154833-1-fathi.boudra@linaro.org>
 <CADkTA4Ovz6SpRXopnfUxq8cMFXzCoG=hLZ3cA5vG3VNx=Pneww@mail.gmail.com>
 <CAGNsrLChN5LWNPR7OGLHZ5305fH8Xpw91RQggV9Wrt-ek4aZzw@mail.gmail.com> <CADkTA4N5NUoGGrxAKsSceeKUSyc+65eDHhrJqjHbm0NXLS7tNg@mail.gmail.com>
In-Reply-To: <CADkTA4N5NUoGGrxAKsSceeKUSyc+65eDHhrJqjHbm0NXLS7tNg@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 22 Feb 2024 18:37:13 +0100
Message-ID: <CAGNsrLA9tUtxLRo6ezA1zxtwL6L3OParW3eOg9n5qRS_b1WGLw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-yocto: include: relax the
 versioned linux-yocto_*_virtualization.inc
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 17:37:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8578

On Thu, 22 Feb 2024 at 18:19, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>
> On Thu, Feb 22, 2024 at 12:16=E2=80=AFPM Fathi Boudra <fathi.boudra@linar=
o.org> wrote:
> >
> > On Thu, 22 Feb 2024 at 18:10, Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
> > >
> > > Unfortunately, no. I've already rejected similar patches in the past.
> > >
> > > The specific versioning is intentional and is going to stay. It track=
s
> > > what is supported and tested in a given branch.
> > >
> > > If someone needs to deviate from what I'm marking as tested, they can
> > > carry a file in their layers.
> >
> > That's unfortunate. Let's all carry a workaround for this one-liner
> > that hasn't changed in 4 years.
> >
>
> I'm not sure what you are implying, but I am constantly changing the
> versioned linux-yocto .inc file to match the upstream file.
>
> Which is exactly the point of that file, not the contents within the
> file.

Let's be clear, as you mentioned, you've rejected similar patches in the pa=
st.
There's real users affected by this strict versioning and causing
unnecessary breakage.
Hence, I'm assuming that other users are or have been impacted and
carry a workaround.
Relaxing the versioned include doesn't change what you've been
testing, as it's pretty
clear it is whatever is supported by oe-core. It's unfortunate because the
linux-%.bbappend is relaxed.

