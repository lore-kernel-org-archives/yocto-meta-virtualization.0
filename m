Return-Path: <danwalkes@trellis-logic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775D3C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 01:37:08 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.132478.1698629826358251482
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 29 Oct 2023 18:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@trellis-logic-com.20230601.gappssmtp.com header.s=20230601 header.b=iAogT7sh;
 spf=none, err=SPF record not found (domain: trellis-logic.com, ip: 209.85.218.46, mailfrom: danwalkes@trellis-logic.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9be02fcf268so585847166b.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 29 Oct 2023 18:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trellis-logic-com.20230601.gappssmtp.com; s=20230601; t=1698629810; x=1699234610; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3goarkb0n1y9DqlQlYfdsGOov0/4fEbZAHPYBnlqwr0=;
        b=iAogT7shCIMHTmsuApy1oiKKlpq83SZMG+RaRt3kKbORfxfAXmGg7TNDiuqK9Ajc54
         AhUQm/fD1yXjxFl4CP2yZN91sT/4UPmcmc4xFfNMBMYOZDFQERbBmAq258WvVXgAIqE6
         yz7kLMV/xb5WIlOu4mU4eFU95hl3xh9mOrXr9COva5W5N2hOG0N2qFZZ9KTEW4QT62Zp
         w6xzXXDVaNf7HmS/g7Xts2flGzlaGegGypM2+6D/3rdW4MU5AG8y/buTdMspSkfA1zAi
         lGTLiG7s57ubXQC+F4ot2++dt3tAEUiC0WEuyhVYHIi8X3gToobN1Dq1Q9wclz5FXvNO
         TUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698629810; x=1699234610;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3goarkb0n1y9DqlQlYfdsGOov0/4fEbZAHPYBnlqwr0=;
        b=PGe6qnBS0yU8ed8a6T3FS/K1yqskBTElzLpGA/9EeStQMU6tDvA7P05OPDCT3nlCcc
         jVjJk89a6C5HiW89cX9h4I9m6LOe9UTlt59MZ1Kqz6BIWPneTPT39uNfNeJ8qqqTsAIN
         gs3QcTxqFNfIGyCC8VjmeCFQuhNXVetuAFxOMXuvc+sty1lQYkeCtk2WGNx8X7XZ0oUb
         dtZSjfCY11dW+LwHgKfo9kHwjafU9K425w8tixwhfwWKaYC96+FL66ni1yXFXFr3kKgT
         qi8ie0wIz9yVt7scbRyEL/XYc4G5dF3V/8ziB3NAP35HA9GVodHDZpxwstT4DfuijfhC
         jS1Q==
X-Gm-Message-State: AOJu0YzGHQNdvHqTWNCi7Fd1y6kXz3GQDLkJdQPqkBWH20UyKKCKh87k
	teT/UkaDRfU13XxukT/ksLz5vWYiWprfajmySWSMxisCc+omJc71S6w=
X-Google-Smtp-Source: AGHT+IEBmrwte5PiV/K5Wq9lM3LXso/fvHFuEGHKbrB+cjQUBeJylijn2D8fylNzehJwLVgqDV78UDn7w20fhlCehiQ=
X-Received: by 2002:a17:907:7fa5:b0:9bf:5df1:38cc with SMTP id
 qk37-20020a1709077fa500b009bf5df138ccmr8698930ejc.4.1698629809876; Sun, 29
 Oct 2023 18:36:49 -0700 (PDT)
MIME-Version: 1.0
From: Dan Walkes <danwalkes@trellis-logic.com>
Date: Sun, 29 Oct 2023 19:36:38 -0600
Message-ID: <CAAhKrJ3FEs2Fo0D0gY3UNRMZ4tm3gR5L2-7jMtckWgoviJCwSg@mail.gmail.com>
Subject: dunfell docker builds broken after go CVE-2023-29406
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Oct 2023 01:37:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8406

Hi Everyone,

I've noticed that dunfell docker-ce builds are broken with the latest
poky dunfell branch when testing with tegra.  Full details at [1].

Attempts to start any container fail with `http:invalid Host header`

I see a relevant discussion at [2] which mentions docker 19.03 from
the dunfell branch no longer being maintained, so it seems unlikely
the fix at [3] will be backported.

I have a workaround for the time being to revert the patch at [4] in
poky but I'm wondering if there's any better suggestion/option for
dealing with this on the dunfell branch.

Thank you,
Dan Walkes

1: https://github.com/OE4T/tegra-demo-distro/issues/277
2: https://lists.yoctoproject.org/g/meta-virtualization/message/8184
3: https://github.com/docker/cli/issues/4437#issuecomment-1637715017
4: https://github.com/yoctoproject/poky/commit/f7f7d5514cf0f63a34d1c75efb031829808ddf2e

