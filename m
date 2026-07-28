Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F58C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:47:19 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2208.1785260834076422551
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PHJy/Rvm;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-495c49f8eccso28667b6e.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785260833; x=1785865633; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlq/vr6kSdCi9iN7PVNjXkq54Y1H85OwEwR4PJG5iHE=;
        b=PHJy/RvmH18d/BMv7ynEgqbhjwKnUxA4Wkh7CtaoXED54iqhAZEVJ+d+rLSD/cQbiR
         ak3NuzTD0z0iEuZGpsB0Jt4Uqt0TG+9Cxa3WXSnuLYU9h7EeZU9sBvOxnPQELpccCKTN
         EF0dYAZP1kEKVuk6V+uqiidZ3wijNNHY6Ce3h2AeUxliOJSdfwCpH7v697yKC/DDw2wM
         XHv45rTXiJvNOu67ZypYWFIJgEq4beOgushfA9CG/jtzn1GElbBrFLCTDukmn+yG9gvR
         BaI1RuqBfiRxGRrKw0bLdfZprTaCAl93Y3qN3NrKiJJ/Y96UBd3ggnIE3OIGP1FYd4PY
         UdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260833; x=1785865633;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlq/vr6kSdCi9iN7PVNjXkq54Y1H85OwEwR4PJG5iHE=;
        b=FcXtTGYFOd2wKKJOSLIVcIzKdMYf7al7DTmmLIYjBonn6t5a2B+ZuTjgSad2n9mQZ6
         rDvKPuDKNVmUaBsj05v+LaRYm4I+2EhhiSS37+CfgS1Hlbibv6FxYT4mb8zgFgw8OX+z
         FgFk/EOX4CR7fAJZMfUAdLGFhsWrZ9IFdmM+0yMNlIvLGpXT2e1lMFzRUsLYURJUHjTZ
         HcHnc1ub6JoxBWJzR8+pF8yv75zncdgvHe8aJV7rw5P3OYFwlzGNMqeRCF9y4mKViKRf
         DeggbscXhtwg5UnznG4hnDhZJ1MgRH6Bx90M748lGQy+ToXwF52W7fwgxsXjhgGUGfoZ
         W/nQ==
X-Gm-Message-State: AOJu0YzIiYJDIwxSB5X1SrZwIGHGGzALjN+Sxapv4dvj6urmemow5as8
	g4f7MlZPTeIdOd9ja0oNjyLrGnX2JbDuWuXFPOJ7vWyHBnTIOPdQistOWu53aqYj
X-Gm-Gg: AR+sD12qYY8Jcu6DrZvFKZZ+h4iySVuOSt/hb02nlmYx07AnkQYH0qJje5+5xX8KcDZ
	y/rnzbSOyE5nEWy+R9Y6lUez3WSxvK4u0AUC1Z6Qd/SVu4NwSiBtwYZOSPP5KF9KQ52tIS3FMnm
	Z2ypNrriyu8P0SDLL6mJLjf+WUinfsn/Sh2lDQvKa/u0ZINMq3DfxMEM2GwshvmfqI7hXSCOP/S
	fnvnROGcunOLpWXGUE4UyZfPgRWckQAETNInIB9Dc72SJ6b7mc0oVGPlpPsUbjLRlQfpbdopmTa
	5YsDRfzaPEm5YyVOufSTkMYt/Xjfv78rfHjxTmzhKYxfzl85N/QAdYly4nCWPjpPIv/E6J1scSB
	bN4uKS/40beao1QU2FgYpQmJEMrtsZRhkmpxGM1hIb4L1r6OM+zDt4LMnMdeV8uvQ+JEaBwbDyt
	zbftNhqeTMmfLDnvvEXEZLXFPpv9RGSVpSDczI///dHgQC5SmqTenkV7+u7Gop47eTvSKyJIdsN
	8fmchoFR7Yt6JRAeU+MjsLbaI550IKgxxlM2ZdmfLGpyIl44xTmTdtq/WnQVctQMTdwCchEWGyR
	rs8Tk36OFNuuug==
X-Received: by 2002:a05:6808:c3ee:b0:495:db98:cd70 with SMTP id 5614622812f47-4ad5bbbac45mr2626112b6e.35.1785260833143;
        Tue, 28 Jul 2026 10:47:13 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6b3ec5d5sm281113b6e.1.2026.07.28.10.47.11
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:47:11 -0700 (PDT)
Message-ID: <6a68eb1f.4705fa9e.c3f3.ea9b@mx.google.com>
Date: Tue, 28 Jul 2026 10:47:11 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][RFC][PATCH 5/5] docs: add
 container-yocto-builder.md
In-Reply-To: <20260727000247.1623785-11-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
 <20260727000247.1623785-11-tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10006

ack'd, staging on master-next.

Bruce

