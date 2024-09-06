Return-Path: <persaur@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41826E6FE48
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.7952.1725652732418196945
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Sep 2024 12:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hXUyjAAt;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: persaur@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1d22ecf2a6so2701372276.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 12:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725652731; x=1726257531; darn=lists.yoctoproject.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZrw/LCaDB+J6BpEI3a8gr7L4QF1vIg5exm9fDK42VU=;
        b=hXUyjAAtk3o/rQlZJwDtXu9Tov15LauV6j/XPvF5wx95Q3vV67Cu7xOfAgSbiaTV+9
         uKXmUQ9XFIG4gHN/H7Tk1GqOTgb5n9AKPZjJBeNrukaYPhjDdW6uCZIIX14S+WuS0h1k
         Fzdoek6vOI6ijIFk+ch36u3sWgnpn/pdDIRjaT4BkWHD9Q/ip7EUFtkwSuBBpCP4Dyfh
         1Q2P6FqnaP+bCOh+xAdfDssXCTI+ifbI6LJZWq88det4KwffwSo/HL4rMbK3sYNYlOzo
         5xmHA3gwFHocEEUDjIG0+NtWONjl0pIpaXlU0gTwK+o8mW6xCwrvdjPFz9WQuJEdy02S
         QuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725652731; x=1726257531;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZrw/LCaDB+J6BpEI3a8gr7L4QF1vIg5exm9fDK42VU=;
        b=H2HhiVI7UGSbjnYRcMebjlmelL7n+1Qn29Mn4DRiTA929De725K+rX08YSf5pIIgwk
         YnBFBu0rLHDPqtnehquIeSctAR52jAZM8UwGQZmSw7/PFtD8nkJ3xJhUkIZKQ4fWiQFE
         jelmrQYL0rgn3iipGxFUAkqMKT4yt7Cr+Q1u6O9qcFq2CTbaxekEEy9fG0OAn/JDv66r
         VSCnC/+hvTEyLqOgKRnFzrF0bnKeiuMNczeKTYVXQul8QMld7R1QaH7sYNmP4HPxUxpb
         JQOji02IC0iCIl3cwRprg0ycLsArdPxRDoiFNLqi2wY4QaaI/4c0YizZ5wYOKMin/uIV
         bcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq1OB/F82joyzCv06WLLcs/7vDMCjcjXj1Z8fqPfNEv/KPjVAJq/EflFRnmgzhsFKnl0+06aUnfhF2aQze7VlwWpb5@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz6BilLtCWMEnO6bUg4b13ZcNTbC6BIXmLZ76y4sOlQP5hIP+7H
	JJE2cHmscE87oJpPCmzeupTelI+3/I5L/Rn9Bi5sPEZAEWBUwwoQ
X-Google-Smtp-Source: AGHT+IFHW3JO3jgOhOtlwELLVhJMgLFYHvclPJOXzSiAsCfvaLiV7YAuVGF0X1bcogFFIEDO3YV6pA==
X-Received: by 2002:a05:6902:2b8d:b0:e1a:a665:1d9d with SMTP id 3f1490d57ef6-e1d348983b0mr4234713276.33.1725652731422;
        Fri, 06 Sep 2024 12:58:51 -0700 (PDT)
Received: from smtpclient.apple ([207.204.229.121])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d4402bd35sm108483276.40.2024.09.06.12.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 12:58:50 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-virtualization] Backporting Xen 4.19 to scarthgap
Date: Fri, 6 Sep 2024 15:58:33 -0400
Message-Id: <0478095F-53AD-4209-9F3F-8A3740755CD0@gmail.com>
References: <xgoj4nxhjxlk7xsmaq3yd7w5t5wwbhrgcjhtqziiwuzr3hue26@2oefjdiwaw4k>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
In-Reply-To: <xgoj4nxhjxlk7xsmaq3yd7w5t5wwbhrgcjhtqziiwuzr3hue26@2oefjdiwaw4k>
To: a-singh21@ti.com
X-Mailer: iPad Mail (21G93)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 19:58:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8876

On Sep 6, 2024, at 09:55, Amneesh Singh via lists.yoctoproject.org <a-singh2=
1=3Dti.com@lists.yoctoproject.org> wrote:
>=20
>> Xen does fall into that category, if there's a compelling reason (i.e. a
>> feature we can't backport that is required), then 4.19 could be added, bu=
t
>> not made the default version (that would break policy).
>=20
> I am mostly interested in dynamic node programming using overlay dtbo.
> Although, I have not tried it with dom0less domains yet.
>=20
> Other than that, I have a patchset which I'll have to rewrite to make it
> work with 4.18 :p, so I was trying to avoid that.
>=20
> What do you think? Is it possible to make this work?

Xen should be flexible on the build environment.=20

OpenXT has used multiple versions (4.13 to 4.18) of Xen with the older LTS d=
unfell.

Rich=

