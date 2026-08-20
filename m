Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EDFC5DF86
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 21:13:10 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3858.1787260386724738867
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 14:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GeCXrz3m;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c149c5722so2130751cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260386; x=1787865186; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=GeCXrz3mHngKAlAMCx1RwYbSIO8IdYcmeIiW0zru1DMsTLTCOZ1QVv8jstaqppHbXu
         vsjixQyWUC68fRxscqZuRuVXtYQ0Cmwfcnr660Tpsz+PcM9Ld62uJfOrFE7oSZ4Lydsb
         oyDKGrH0G//llrkGva8SBl3DDtCQJK2bs5/a1C2rqYNS9fuM09zK2ZnS8qxTgEQdBb1s
         o3Mj3OxBbmtybTjfT/neeK0P2JxRhRMb3mXGWCumbPztf70TqVJzh7bds7liz7vMlaQ+
         k8gVX2mKS5ZhU3m2iyPSv+8ouM8fBLjvS5RgJRhVePhZCoWvIFxr+jZ9IFcButEnWCWh
         dFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260386; x=1787865186;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Zi+zJBwDR4963LjQbWtPR4pJHo4MthfoTNuy13VNbfoK5nsq+IrnjCne0+i109tsH5
         EqJLSQkuOthRxocf3PCR7QG/kFPyO2Zo4Ibyt6n+Cu5MraQEV+pFET1XuF2X2psSwct6
         Gmnmre5hfWnxXk/1OkrB/rwlIEVoBnZuRhgcx+vTLMk6fdMh2rEGsbeZwyKUR4nM1Sb6
         v6NGy1z3KLcwhodJRBJGqDyDNzYvMXSbTWIROdwLxgmEbBNHiKnC3xuDW0Fw6vXiBpUw
         mDyYm1koscKZYJTDyQjHYBYXNwaxuFphmuSKo0Fg5rDpPDK7VO4I3F7VcI6xLiOZTfoi
         7e1A==
X-Gm-Message-State: AOJu0Yxmfo2kLcfUC/7VU2cu8GCZsPiPvr796pEfbEffV7+CkSk3w8j1
	sUB4D5lxqvLgFkhbTR27PKUNj2NPECKS3qboU9DB1pmuVioPS+rcjXgY
X-Gm-Gg: AR+sD12teAFIxXKa7YtcWcuhhEWq4uK5pYmp6lCHYhUpPaasxu3rAwN4wfD9i/Y28aw
	uXojDCD/reipAKAm5po7XsYPJoySBEOqob6O0RyOIKxH1BfZXhpqRWTCeJn/SCaeT3VMUAKKz5w
	vI9/d0VhUysFehdahOrCoXVykf6nVuyVPQQzGHKwtziDYMY0fRNH7YU3q6FJPXRddQCM7CViFR0
	0T5dFiOULK9Y8BC07pOY2aV2ldT96Qpxx7vtj8o8U8DvGN06uaHY6Ge3Rsw0nTiP/Daotym+YKA
	bHMZPw1EL2vldsbvY0/0PTDPDhui2xef1/zxV3kAbpDgLm1uVzIwViWn2wLmx8ZdZnHXZXnyxk7
	Y6Z/2l0u99IXqctR8Q8XO4uD/nuHaT35eaoMJAM4ePq9svalC6gX3vZM5RZak9NKI+DLO9fdZnh
	y6b9yB6uitLJvKuIJ/BZTUUlImiCOaaNttr5ZDeH/GbCT/EvECAIBlmR5zXfYZZJqrSKxui+Xsc
	pzNQFgfYIZbX3l6OxMlLbXdIsBvR6p1WxJ9EcPrJTwXXzWICclDZUH0OD4GsNzL+LPapliLkeLm
	9N03xldTG/38ckY+s1qy4F3d68iXCEBG54OGAFCeWeZ9SmyEKz2ZnghtrZbJtDm7gv1sitc=
X-Received: by 2002:a05:622a:2618:b0:52d:d12c:3ee0 with SMTP id d75a77b69052e-52de307be73mr99705791cf.11.1787260385490;
        Thu, 20 Aug 2026 14:13:05 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5edb45casm47144846d6.5.2026.08.20.14.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:13:03 -0700 (PDT)
Message-ID: <6a876ddf.c2d14791.1d1dad.6243@mx.google.com>
Date: Thu, 20 Aug 2026 14:13:03 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hthakar@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][scarthgap][PATCH] go-logrus: Fix CVE-2025-65637
In-Reply-To: <20260820064033.13677-1-hthakar@cisco.com>
References: <20260820064033.13677-1-hthakar@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 21:13:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10056

merged

Bruce

