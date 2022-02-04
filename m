Return-Path: <mans.zigher@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507CDC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 08:53:54 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.6867.1643964833723255708
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 00:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mo/O3Kxe;
 spf=pass (domain: gmail.com, ip: 209.85.167.177,
 mailfrom: mans.zigher@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id u13so7750684oie.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 00:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PYakQxN5vxpGK/4Ft8R14TDhRPbWbQGtmg6a1rn4ApI=;
        b=Mo/O3KxexujzcTSJ1mZvWM7IwTt8WGyub0PEtRB7PxPpMPSeUOv9zboYQxEE+Ng/VZ
         CQeoMZaeHY+E+tvlE87Az5cfHoSybJsgNle4MQjKVl5qiemhBJlmE8BUqPNe3hkjURto
         rQTLEYHwZ3Iy8HRAlHFglzbKyhn7ezHyPuXEhpRwEqjCPgZUO3gV/duqrUOR6SknRPqs
         J+In1bKRbl4HwioNvuSIJQx9IgWyD96Wd8pG6L0PFV+Z46Pc5PHf49VZA06MnKSMU5+R
         ghjblvXUjpajHNGrs8dkBMqZ6Mp1kHXQb7LPzWhTEFTGaqIM+zxmxpa3GCf84KtvxrMs
         Or1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PYakQxN5vxpGK/4Ft8R14TDhRPbWbQGtmg6a1rn4ApI=;
        b=LtuERal6VOTbC2qPCCbeExAneu19bGTo75V4R5JkRwB8QNceCHthOUGE+9CC79CQGd
         U75HzW9gsA5HhB6zu90h90D/paAiRRE/ph67RAung23KAXoPsXNylZGjrHSENuIWcU8T
         +WVTyYpZhtVorvqgq52pEMX3F4pi06gaXQ2aI/9AUn08goQy7QriCoGU3S6OUa/1095i
         xXtRKXjM+eaEnJzdOWYjSiQbhU5HnyLlJ66rET/agXeOkMUBY6TWQATHHDZ/D76JfL6b
         j5bqKo3sXkGuyvfgkNHj/bPLsXaBmaSQBcZpEOvruvutQJF8GWsUDC9AJwRHqYwb49Qa
         Rn1A==
X-Gm-Message-State: AOAM530OG65taQ4VI77e+KD8IVr4VGA/+0DTr+COfgpv8bXQBBfEXPjC
	fJSAB36dS3HedTmna9yc4WMiNrz74USOp+Q3bQrwezh8A9c/PQ==
X-Google-Smtp-Source: 
 ABdhPJz5W9xVj0T0lAo0LgqM4/YUw758tJWeB75lwlO7iva6MYsXuKSes31KVA08xmo7M4Jre8rDjrQWcy3oN66F1qc=
X-Received: by 2002:aca:5e55:: with SMTP id s82mr777079oib.109.1643964832771;
 Fri, 04 Feb 2022 00:53:52 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?TcOlbnM=?= <mans.zigher@gmail.com>
Date: Fri, 4 Feb 2022 09:53:42 +0100
Message-ID: 
 <CAEhQi8=RL8Ngx3jH_qaPGQwpJ=vR8LD0D9vaT11-LN4dCcT-OA@mail.gmail.com>
Subject: Docker and GPLv3
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 08:53:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7040

Hi,

A client of mine wants to have docker on it's product and they are
having secure boot enabled which prevents us from having any GPLv3
licensed code on the target. We have successfully managed to add
docker to the target but we noticed that several packages have also
been added that is GPLv3

bash, gmp, gzip, libidn, libunistring, nettle, rsync, tar, wget

1. Does docker have a strict dependency to GPLv3 code?
2. For some reason that I don't understand, docker seems to pull in
LXC which in turn will pull in many of the packages. Is Docker using
LXC? I thought docker was replacing LXC doing the same thing as LXC.
3. Do you have any suggestions on how to have container support and
not pull in GPLv3 code? Is Docker moby an alternative?

BR
M=C3=A5ns Zigher

