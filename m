Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E29ECF11F1
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 13:08:00 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.42955.1728565674737149246
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 06:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UI4Jx7sz;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2887c3c50so719485a91.0;
        Thu, 10 Oct 2024 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728565674; x=1729170474; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxqaQC7y+3l53G+74m+K8lV2BGHTBzttJlPG2bnbR/U=;
        b=UI4Jx7szAWW5YvN9w8IfyfIE7cvpkwZ+7OcUEE4xhFBTOKnNxvwRLjjYDZgBsB70Mi
         PZ0X3PsNF0HDkDzcc+4izWGIJK3IIoz48kyFPbIA6IJwvlNZuGoNK2SG+Y1vobqpWvBo
         w7mE0epT/2nYsfBduiU48TwhNVHJEoWYP77SzPI3hz6KzYbJ9lL3DXru5f1+ZezC18WA
         zKsB3qF4JAv6JkyZWdPtKoGJYOrxTipo8YYSphi+/wiGm8dOP8hNWGJ3k2xUwNv/zZI6
         z7VhWgd3QEPdlp+JtEVjnAS0jVzUNOO0aFHkXxOvwDc8/l9OxUKykzmflwGNimGofAjg
         iCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565674; x=1729170474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxqaQC7y+3l53G+74m+K8lV2BGHTBzttJlPG2bnbR/U=;
        b=KHns7sOr1pN7jCds3T+dOm5LcMSir2C9VmdNzX1GLqVxx3obWTyK8BCVwN0uc3fyLl
         D2Wwhpb+Iebekx2i7swy70fAG2F8t73WFWbfK6rrMaQrlMPpTq10z+LGTDpamYAWgVXu
         RyquDMKQmdaxmlnW05M7ZlBMIOvDciqXTqKEA3YNM6BLVJe+QorPihk20dqm/FrORYNL
         +rRrCLsGc9poz1dmkLeP2HkDGWf29ABUDj66wFW6C/IPwC7K7QGY62AeBspP+ENqPBEw
         LBV3ssSs1bTm5AwJoNQG6BGDrQKHY73JgSjmVpdporLw4ozghmMtOOtlegkZc/27WyVB
         CzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIRtJ+Kl5lNago3vLFe4aU6iWwKVX7SLammqiXZQ47jdy1YdoCGSX+KojV8qY+VxpitGlOmzDZYap6GYAVyKRWRxdU@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz4apAZ+ww2UazNqZFIIK1d30iB68zOL8FfbHitrQQQkYHWH1+/
	2Cb5tcZkDMHjkKRsaIUQ+8UwtzL45bYMSch0nAlU7PE9Dtqjh/m4q7D6cFq26rqmrYZcQgRSbtF
	yqrw6SuVA2v80UAZnJqqDWD9T8CVMzw==
X-Google-Smtp-Source: AGHT+IEHAbVa1OaK3/oMTpXbKB3OvBvlFakdMElITRTTSol7Cx3HMqP8M0Tb9EB6QW0/tks90Njqs7O37afmMESqZ2A=
X-Received: by 2002:a17:90b:a16:b0:2e2:c15f:1ffe with SMTP id
 98e67ed59e1d1-2e2c15f20abmr4377704a91.0.1728565674160; Thu, 10 Oct 2024
 06:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <17F8C1F31315C292.31778@lists.yoctoproject.org> <ZwfBKi4w0sQxrh1N@bootlin-mathieu>
In-Reply-To: <ZwfBKi4w0sQxrh1N@bootlin-mathieu>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Oct 2024 09:07:42 -0400
Message-ID: <CADkTA4OKsh+8=gLBhKNBHEnpsgpPB7G3e2+3=uaXRTAcUeu_NQ@mail.gmail.com>
Subject: Re: [swat] meta-virt fails check-layer-nightly
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: swat@lists.yoctoproject.org, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 13:08:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8923

Fixed.

I just dropped the recipe as I did in the fix for master.

Bruce

On Thu, Oct 10, 2024 at 7:58=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu, Sep 26, 2024 at 11:41:42AM +0200, Mathieu Dubois-Briand via lists=
.yoctoproject.org wrote:
> Hi Bruce,
>
> > meta-virtualization fails the check-layer-nightly test on the scarthgap
> > branch.
> >
> > Fails are related to the python3-colorama copied recipe, as the licence
> > was changed in the original recipe. I saw you made changes on the maste=
r
> > branch to fix the same issue, could you fix the scarthgap branch as wel=
l
> > ?
>
> Sorry, same issue, once again, now on the kirstone branch:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/2314/s=
teps/23/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/85/builds/14/steps/23/logs/s=
tdio
> https://valkyrie.yoctoproject.org/#/builders/85/builds/12/steps/23/logs/s=
tdio
>
> Can you fix it ?
>
> --
> Mathieu Dubois-briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

