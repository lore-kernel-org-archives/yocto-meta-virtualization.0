Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4F2C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 14:30:24 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.9569.1702305014219537576
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 06:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LADLLWoI;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7b701b75f36so174276239f.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702305013; x=1702909813; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xbLBzM7+j7vXe1EqxhJd2tcwU7OWVmaVSHTNRcGFPo=;
        b=LADLLWoI4m4fm/Sr6I1Zaqx+d8SQ9n8Sqd9aSU9N8lRDP7jLKauFamd07aFOCycBkE
         6h9QbTbnlr83Z4VNLem2GcP9OD407dQo1YMJWhdHIUaSMLT2FEU9N9EbC/lq9qG4ioEQ
         XNlV6t97RsUpX4RGjU6lixVtqA5KLQkAl5VSrdZLGI3hcJHQE3oQU2ebNsjePXkka9kG
         9AfX6YCwoT3G3SwT6uO76CSaZtX3JR05ve/gRLzydDaygzkNfRr1HoWXZTHZRgSxUdkR
         N/w6x9u+ZrKgN9hF392KwJvO/pF8qoBZyQxNDsjRr3GtuhnSH1KHZjhNJIdIW4i+LelT
         2XvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305013; x=1702909813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xbLBzM7+j7vXe1EqxhJd2tcwU7OWVmaVSHTNRcGFPo=;
        b=b3ubiYxwNEPaYt9FcNc1fbp6bU0G3YNj1eK/yLxEoHYUrt32jI+2MeYJgvDv/nLZYM
         K8OeofsXbQlvFDqJESD3DM7m44lwP7cor6+Z1P4WuHC5B2S6EHBC2TJqQlgosnzIqMtQ
         GQ982xhDeyNEz1M/LhdSxJTVaapnQ4ieu44RQcIKJef9ddBv2wFt2Qyp3crV5hz6Cs3A
         yi4NKGrQrlOV7kwpXuy+9fRKlU4dvjVBtwhqz4EmjcpCOEgboq3fYy/RskQXyrvcxDit
         L9dPEntX41nPND+THhCRy1+M7CyixqDQ8ANakrSEXbquGCeBNYDseHnW/HeCtffUjKEE
         78YQ==
X-Gm-Message-State: AOJu0YwBXdHubRjW90feeP8CAIIDjmRTWNfQfP3y+7WOiZTNiBzsDovN
	XcksUtmkTanE6eHiJsmnvE5UjiHmcG8Jj+I2Fdg=
X-Google-Smtp-Source: AGHT+IFInA7KWokijaS5qRTyGkSew7DisbZ//mudNoUsHQEQWBYwzQkfalnP5n1SSsqBdjOi43z2KR8B6yNHFuAdgRs=
X-Received: by 2002:a6b:a0a:0:b0:7b3:9256:628f with SMTP id
 z10-20020a6b0a0a000000b007b39256628fmr4913253ioi.15.1702305012993; Mon, 11
 Dec 2023 06:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20231211120914.1631095-1-liu.ming50@gmail.com>
 <20231211120914.1631095-3-liu.ming50@gmail.com> <CADkTA4N3qHZAULhP_=C7LhBnnYpTBCF7PctQdDRq4SKqxVR_MQ@mail.gmail.com>
 <CALatG=6B+J9KehOEH9CJWSxRdkbEO1tbUJUU_xp4f5uebZ+akg@mail.gmail.com>
In-Reply-To: <CALatG=6B+J9KehOEH9CJWSxRdkbEO1tbUJUU_xp4f5uebZ+akg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Dec 2023 09:30:01 -0500
Message-ID: <CADkTA4Mr8Y=h+vT2849n9d+RWGjCscDh4EL62gk53FgqCYzG=A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] podman: add alternative link
 for docker
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 14:30:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8504

On Mon, Dec 11, 2023 at 9:20=E2=80=AFAM Ming Liu <liu.ming50@gmail.com> wro=
te:
>
> Hi, Bruce:
>
> They are both being added in packagegroup-container? If I install that pa=
ckagegroup from the current code base, I will get a conflict error?

That packagegroup is used as a build test, versus something that is
installed (and that distinction isn't clear, I've been meaning to
improve it for quite some time).

We can split the packagegroup to make it more useful, that's
definitely a patch that I would accept.

Bruce

>
> the best,
> thank you



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

