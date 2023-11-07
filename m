Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77EBC4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:31:44 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.13880.1699371103468297492
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 07:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P25JC91m;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-79f82b26abfso179411539f.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 07:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699371103; x=1699975903; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2b/mEELEQphHBaR5oB0wk4TloAl/z6knnQgrOVABHU=;
        b=P25JC91m6ZGpZ1e+Z5C4F/Olibfwid3pO3OX/2PgWQGWlE1GfaOtqeJSfxvtOCCrtR
         sOTVG/a9R8DdNMdSSh+LLBlWUB54VvbBxXdkPHEIYD1WJg0rBywis46FuKnUw9SwMIeF
         5fP0lNm2wWG/07v6hWE7w3oBeZ6Wf/fYWMHEazOfcVox5XVVS1rmjgeVyFhVLOCYR+UY
         UK19+DhbQLdBMVnT7K1vFKF1msgpPPhC6c7CQtcZrX17qIP4f4MdtEAXCIYZE16r37Bi
         2zOpz9l6lvwewczO3BAIruu9GJx7WbTAqtqA5/Hz0lV8/c0nPqdvwa6vyY8um6lrvYBw
         bjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699371103; x=1699975903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2b/mEELEQphHBaR5oB0wk4TloAl/z6knnQgrOVABHU=;
        b=VzkQ5faQ9ipdkKLLXg36OUoCAumVfzEqgidFig7a04OEzrIBxqCRteUDtbRrhIV1/1
         teUz223qn+3PzJfObufzijX7IA5NuMSEd8Li2FmGE1vpbv5YaLhDtT/hMTrJyjLAcR9G
         ivwK+L87W3kMOyzIktjpUwTP6njs9m2MJedTm/Btlhifn9ZTguYYWgClnq/9l4790CWQ
         02C0b1swQ4IutdDq2Eknh6GwdPQid/udtbuAPmen4l4JDwGyFZhk67H+wcpYt5/ai6Xw
         zWb/Tbe4Sb3Fs2+HxZRcfi93S5ENB/U0hPhrZIwlIX1hH7GT7uenfchws/v5SBMF8eX1
         koLg==
X-Gm-Message-State: AOJu0YyRUpJcWhSbu6GkySVAjLFwKQWHZLdqT2wUNQw40RXABbC2Anzc
	vE2jmPgabrpYHw3AQKfJ+5ow4weUk46uQJ1tVKk=
X-Google-Smtp-Source: AGHT+IGbC10+X541Vnv0E+Pk0n4w9eROUXASHxfJ7/fZsdzQ232wqPBF0FrCXrqjdFj3E9nD/x2Gu2qzt2I/Cxw4D78=
X-Received: by 2002:a05:6602:1586:b0:7a9:529d:4b79 with SMTP id
 e6-20020a056602158600b007a9529d4b79mr36346347iow.21.1699371102686; Tue, 07
 Nov 2023 07:31:42 -0800 (PST)
MIME-Version: 1.0
References: <EA68EAA4-BD24-4273-8F76-0725EB0F2FDB@arm.com> <CADkTA4N=HDdetz=wMh80c9NSu5rNjThVVkGvi1HcDwit-cBN3A@mail.gmail.com>
 <75A405BB-43B0-4AE2-AFF6-C87429EC29F0@arm.com>
In-Reply-To: <75A405BB-43B0-4AE2-AFF6-C87429EC29F0@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Nov 2023 10:31:31 -0500
Message-ID: <CADkTA4N5ZDEqt1FnpEE4A+JGBvG4NMqyPNMU6V6=qn66GNT7AA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci: Map image
 architecture correctly
To: Ross Burton <Ross.Burton@arm.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 15:31:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8445

On Tue, Nov 7, 2023 at 9:51=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 7 Nov 2023, at 13:00, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > I'll do both: branch and revert there.
>
> Sounds sensible, thanks.
>

As it turned out, reverting would of course leave the issue unfixed
that Joshua was addressing.

So I copied the mapping routine into the class and did a nanbield
specific commit.

Bruce

> Ross



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

