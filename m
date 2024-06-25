Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE92C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 09:46:37 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.168085.1719308796525356700
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 02:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B1KPfpWz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so64389831fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jun 2024 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719308794; x=1719913594; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3qbvjlPCqkTNCNp8yhoXswgkHLMYXOJsi6dMyZL1kGg=;
        b=B1KPfpWzoFghnDGyAJ0BnYWgZm/pefU/RlSe68FNXsYV68oToX2s8EJDJvVSB6zeVu
         abxWni4Xi03wHnV+W/nSyrrU21bJoYKZW0a9lkT7AXXA1M4FHWo3lWWEz4cppe4Xn0qL
         Lgp7eqlaLt0oP4XaKAEZurKHIiWdM3tgFFibE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719308794; x=1719913594;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qbvjlPCqkTNCNp8yhoXswgkHLMYXOJsi6dMyZL1kGg=;
        b=ih/fM7svNukrpHrguknoko8Gas/KbLEGHpEftqSxZ9DJHp8UjOL30emwdTJSQkulDc
         rGAr7MGXk3ccfeYreuuFCvGiudcywZ6JghX6dFrCHux0IQlPoGJPlW77GPDfL498svX2
         vDzupMWmrQhzpobca1r1MFMH5Q9y+wc283EbRMVbN8RXr7CMbL1XdOPC94NWcV8yRmtc
         oEaghzE0OpL1G3+6wADBuGt12gpscKHn2FnrEEuwon0tpKDAqNFjuuY6+rUEzTJ9dmAE
         2mkvrw7YpCNoAdz/iWu3xMf5lCZp/9CFmxCYvX/mPMzlw54+6DgTNE9Aa66shZJyL76/
         hgTA==
X-Gm-Message-State: AOJu0Yxj6sSGgNHvUmCiok4e9fdfQw+pS6TGGIGj9UoJGjtHhlF07oPO
	GBV0hR5DJ7veoXU1rEsBms+QaV3f+pEYTcVDYoaOkdOAVMQVkqZbOPw8OTkpf9K6jkmGVu/m6PJ
	5
X-Google-Smtp-Source: AGHT+IEh9EdEayWg2A+mbp8VU0Wtg0Qo/boOeF1UP/RetkmRmkVNZw4cD3dkROoWOAv4CikOr+B+Ig==
X-Received: by 2002:a2e:b0f5:0:b0:2ec:5075:83d2 with SMTP id 38308e7fff4ca-2ec5b2a0dbcmr46865141fa.22.1719308794232;
        Tue, 25 Jun 2024 02:46:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e? ([2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42484fc0aecsm151681735e9.12.2024.06.25.02.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 02:46:33 -0700 (PDT)
Message-ID: <7f1b586e5defdfbd9b345d47e1a9300c99560df7.camel@linuxfoundation.org>
Subject: Intermittent failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization <meta-virtualization@lists.yoctoproject.org>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: swat <swat@lists.yoctoproject.org>
Date: Tue, 25 Jun 2024 10:46:33 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jun 2024 09:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8811

Hi,

In pre merge testing we saw:

https://valkyrie.yoctoproject.org/#/builders/89/builds/53/steps/12/logs/std=
io

but a fresh build of master-next with the same revision worked:

https://valkyrie.yoctoproject.org/#/builders/89/builds/55

which makes me wonder if there is some kind of race in there? Reporting
in case anyone else can see it.

FWIW master also build cleanly:

https://valkyrie.yoctoproject.org/#/builders/89/builds/54

Cheers,

Richard

