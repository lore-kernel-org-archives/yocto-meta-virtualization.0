Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AAEC04A6A
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 13:12:30 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.6945.1690463548198595221
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 06:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AzaI0fXK;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7835e5fa459so33305239f.2;
        Thu, 27 Jul 2023 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690463547; x=1691068347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGJR00qiW9UI+8buvyX4vLp68jyqzY7Y2TFUhBN5YEA=;
        b=AzaI0fXKYBx5CkIT9nX2fQ5vBqgbDRxDzSJY0NyT6kXDw1ORAsslWiVZ6m/VTGA+IY
         9eNLX7Vpn1ftfMFPflyRs1yJwCsO+IgweRGx8VAhferZ8k8PlFEAPxh5u62Pl0FXw2Oh
         eIFVdzMYi+w7UI7f8FB/JIaiUhN8zmz/YQ3kLAbGxVO0ITSUJBTa9xyLyOjK3iy/pULo
         jHU06nGqvwpfA3WCpHRHhXsvMv6kWvjVpHXZ66sMai0VnG036tMyxGJtyfu/h0F4c5/+
         cWBPFPaTOKjaBoexrgzwFblU2JfVjy3yoGZzLG7vb/78uGV8CYkrE3QJCh0BI46FGzSV
         +0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690463547; x=1691068347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGJR00qiW9UI+8buvyX4vLp68jyqzY7Y2TFUhBN5YEA=;
        b=NObpK0aEIllBX/pBS7uugP+SeYqZrwgGziNUyf1jdUDzRKPhLqIfrER5bvBW8pQg7r
         vAm4WsvyHA19DucNHDU/22NzkXgAeyTdJTKCltk5ZTp1+N4kJpWrkwvUkdKtrmhxcEV0
         dprl2sBjGoIRxDwYm75d4gSVJ1N7NPPT2ZK2epxJrLHHK6krFJdsMyj6FBxFrp/oNYv0
         LXhS29KpQSWjVRjvl/8HmwcfkfuzIIRltTPHNaTAbwnN9KdWRwaHCgA58ma4px1GkyJO
         DOtIgIUdWnSwvI0D/LNsArsk+zmDu2rKhGOQU1HiBgpicZnk2ZGcm5M5ulcWlFV6GuvU
         J+tQ==
X-Gm-Message-State: ABy/qLYHwvndluDhCDjTQhI3WErYlu1hWGt7VNA50Vk9mIG+1JQKcJX5
	dUDhCJt3K2+c3V/zeEWY0mXy0CJPiU0cOvVic90=
X-Google-Smtp-Source: APBJJlEun5bnNe8bdoS5fXfLEfWpcVMl9kX+VDoeEdqGaClrbGDNFV4mf7sRgJv3npYsox8qjerHkScGz97gYuVv4q8=
X-Received: by 2002:a5d:93da:0:b0:787:4b5f:b6cf with SMTP id
 j26-20020a5d93da000000b007874b5fb6cfmr5136132ioo.5.1690463547286; Thu, 27 Jul
 2023 06:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230727091819043ca8d3@mail.local>
In-Reply-To: <20230727091819043ca8d3@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 27 Jul 2023 09:12:17 -0400
Message-ID: <CADkTA4Po1gZaKpCyXcSqUxWvNHiVvo0SMtWDHKBw2YoisAidzQ@mail.gmail.com>
Subject: Re: meta-virt fails check-layer-nightly
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Jul 2023 13:12:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8141

The removal is already queued in master-next, but needs a bit more testing =
yet.

Bruce

On Thu, Jul 27, 2023 at 5:18=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Bruce,
>
> check-layer-nightly is failing for meta-virt now that python3-dtc is in
> oe-core:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1489/s=
teps/23/logs/stdio
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

