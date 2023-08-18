Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB35FC7113B
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 06:18:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.5820.1692339526377332312
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 23:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V55Y/ptm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe4ad22e36so5532425e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 23:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692339525; x=1692944325;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g0UU5Q7xoDDDedFfp45J75njSg0fzxge1RaRpwtX5Yo=;
        b=V55Y/ptmsrkdCJfDbApi9E1RsdkB0ibNfVCnfsC0Y1qzDGYPgZwt/zjn5r5NzGf0nM
         ykNYP4PnbZc0a4dDUxAs0Slcn9MfuIiYLj7njwdzMTkevgj06l7BDlSpx+hSC0/hHSa3
         imIEKLQa/FwA2+DPw7qBiRlwvg1advTR54PQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692339525; x=1692944325;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0UU5Q7xoDDDedFfp45J75njSg0fzxge1RaRpwtX5Yo=;
        b=iFlju/+F3F1q3WBHHqOxIp6yKxwodqBwjPFVum3/ZW+BHqio59kXYk3q80oLCpbbhr
         gv30dB+giIEVUvhoTouaZPw2R5txMvcg9ZbswEYwcZwflASJTC6evcqYUrPzbwNkjSeE
         H6dxfygBmIGXvFOBCc9aODqhDvB5UEzfrmPYKHg2EZswlU8VAHwXv7XjdyaEXbDOHztS
         5qnybrxBbKvysFXIY2eb9qrSPR7oO0/IzzinPOQcEPO2TppfyIE+7T+iXvUbLs/B63Fy
         iAlkkQCEUpSDdiw8+qFCAzannEXquJ7rNFOK5mSgpWFDSnmIKHLa7AiEgCguKXnULTe5
         4WxA==
X-Gm-Message-State: AOJu0Yx40IgpdaPcvi2lhkflDJMStusy19HfSPHvAIGDN+y0lRIjryxW
	PyVZSs5R3/iPW2g7KlA+YXkIcg==
X-Google-Smtp-Source: AGHT+IH75E7gcMfXydcP1dKdvcYYTdFfJzA5Vl1vo0nQjPnyetBUfgDeyMAlGJ+7QO8Yh2NBMV4vtQ==
X-Received: by 2002:adf:e648:0:b0:314:a3f:9c08 with SMTP id b8-20020adfe648000000b003140a3f9c08mr1203195wrn.39.1692339524581;
        Thu, 17 Aug 2023 23:18:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8a:199f:e210:2fe8? ([2001:8b0:aba:5f3c:b8a:199f:e210:2fe8])
        by smtp.gmail.com with ESMTPSA id m7-20020a5d6247000000b00317f29ad113sm1625403wrv.32.2023.08.17.23.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 23:18:43 -0700 (PDT)
Message-ID: <bbd7772a5eaefa0f0c6d66c1181f94df0112278a.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization][PATCH] vhost-device-gpio: only enable if
 meta-clang exists
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Erik Schilling <erik.schilling@linaro.org>, meta-virtualization
	 <meta-virtualization@lists.yoctoproject.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Fri, 18 Aug 2023 07:18:43 +0100
In-Reply-To: <20230816-vhost-device-clang-fix-v1-1-bbbd47b13e5b@linaro.org>
References: <20230816-vhost-device-clang-fix-v1-1-bbbd47b13e5b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Aug 2023 06:18:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8213

On Wed, 2023-08-16 at 21:03 +0200, Erik Schilling wrote:
> This disables the recipe - which depends on clang-native - if meta-clang
> is not active.
>=20
> Link: https://lore.kernel.org/yocto-meta-virtualization/ZNyErpfW8p2lX81Z@=
nuoska/
> Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> As discussed in the linked thread.
>=20
> Sorry for the inconveniences!

Thanks, I'm happy to see this quickly fixed! :)

Cheers,

Richard

