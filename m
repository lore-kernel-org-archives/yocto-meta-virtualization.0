Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F00C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 19:56:57 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.1316.1657915010611499498
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Jul 2022 12:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XOUQxGrR;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id e132so5309034pgc.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Jul 2022 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=2/KxbO0rkpnYtc/2xgDM751UuDKX6Gj2XgDWKkskJBw=;
        b=XOUQxGrRV3pd+/IufP8FrykhH2ua4QOu0CRKd1cdCCZUfnJJm3csZo7rS0S38itSHV
         dBpWUf4LlkRo7V5QhVQ24YsdGM3ioCFyM+3lgsF/98HNShGscHqeH4PEDVr8lpwZgkBz
         RCk0Q+n/cVAZ9lucHhpanFgAe784zlnERf3ChweMq9ekhJZ8AoB4EmMfIir0bGUZDtqc
         UeZFEQhLHc51zTQXDK9rHBn+8vdRN+ky+ZHV3WDYfBBAGJSj0kcyhZee31psVnr0IwBP
         fnD8vHAb236DwMnl1vogeaxKM/C3xmAm8ZYlVMWfKvxOw8AW7gdU7INdnGt3+EtIl+l0
         Uz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2/KxbO0rkpnYtc/2xgDM751UuDKX6Gj2XgDWKkskJBw=;
        b=grZmmecV6H5NyqGegoecihMZrxJKkSgAPFk4cmdOFMA8qUloxpDHTVFIi5p3sIMubB
         cQ5nL9Ic9P30WkpSXZBfXKebmk5D1uy/3k+gfdmUGE82oXtBTvxcV0wpd5r/UWrEcKFx
         AWkH5i2lXKOU3WXzszW/iJ47gTawYg+RToVjeetaMwH7Pi6w6Nb5kijISZM07JUhrHZR
         EN70JgVP0OBr83BdriJhKkXISsYaU4dc/nk5/z+GEPn2FND997eeIJ0UT8rVEh9oUEHh
         cXvBcrEeuBFkwwHoNVl1xgxex5JTGnTgSYo7gly7YR5+3KPVoOQi7qdLchO63jwo79kl
         SXSg==
X-Gm-Message-State: AJIora8yXTdZSOBb7ZWgsBQaC1lOzNjB8nHptBaRZoxcVsK/xoIesdNe
	EpHTZgBiLEFtzxJnZQl9uT4WTD+NpIjt/AgnI5s8uAwMBd8=
X-Google-Smtp-Source: 
 AGRyM1s2orU8TCymzbLM+4en0ar4DTiKDhY2pB1KYM0Vud3pF1EEwGA/5QvSuV+GAhcsLSRjZA6YQ4bINCxha4dEtQE=
X-Received: by 2002:aa7:888a:0:b0:52b:17e8:fd1 with SMTP id
 z10-20020aa7888a000000b0052b17e80fd1mr12257877pfe.46.1657915009112; Fri, 15
 Jul 2022 12:56:49 -0700 (PDT)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 15 Jul 2022 15:56:37 -0400
Message-ID: 
 <CADkTA4NX=kJN1wctFV4azVNQBkUXQd-XGFJJDUbmq-yTqwZXnA@mail.gmail.com>
Subject: buildpaths warnings
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Jul 2022 19:56:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7462

Just letting everyone know that I am aware of the buildpaths warnings
with the latest master, and I'm addressing them with some upcoming
package version bumps.

Cheers,

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

