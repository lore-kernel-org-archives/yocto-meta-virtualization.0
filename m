Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A847EE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 06:27:26 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.2666.1692685645804819739
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 23:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Px1NbAez;
 spf=pass (domain: linaro.org, ip: 209.85.218.46, mailfrom: erik.schilling@linaro.org)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9a1869f2c06so477947866b.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Aug 2023 23:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692685644; x=1693290444;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9OcTI1EcMDhGVBJlw+mTrNJpZiZ9M58N2XZn5ktKVk=;
        b=Px1NbAeznVTXKwORrOn7I7fPN5QyiO31+nVoEvI4YewjRQOD3BOwXfXJHFGL+1FG0x
         O5H4TC3rRt0VwoENXiMaizUg7mgjmez6oU/ptGIvwf6lO0JGvArK9T0dDRutmT9NkizL
         ZfeXGpl7PLeXRFck+mrHnqPFGzZGSs055u4TJLHOjpfFXpn/DWDfnwFIXnLrF3Jw+IjI
         EMZVU16k7EMii3R2oqFABZa0QEPu9sTf2vhEigH4WClHn/LeuC9LcLOFFYOJqt+P9Rpx
         4CaBQw0vnFfucEyMXsJciVdwPMxytEetzR0ouOTpz4wIfeL3uFF7wQE3CLZiVao8+RHr
         UIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692685644; x=1693290444;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R9OcTI1EcMDhGVBJlw+mTrNJpZiZ9M58N2XZn5ktKVk=;
        b=EwRl/PHw3hM5ngKDKIhzYffIw3cNI9d9L3t8aSzVi7Z3uSXMbku9GUTNopuVhbMFv6
         BeI0IUKmgDDE/bQHqkg0UMC5pjQibu5uafkt1RFqH12x0Sw/rF2+LfuWaQwnL9zu/5lk
         OjL0/4KTmFK82mUAGEkcLJeVYy9aYosuSLo8B4D1gyKkdYGXJ5sUDJHnL7P2AqFA55wr
         ph3ryf+XvKN+Wi+sa4ku8LPkBbUXY3MqwLp1YYyL9IW8p9GWK+NgVDOqO14G2S9fT9cV
         DoKRCduzYUHzXHPLJy7vGBAK+VvONrc4pYnI2VfLhhFMF9yEOJJJyVPO6K3aD/JLzZwp
         ObAQ==
X-Gm-Message-State: AOJu0YwZI7DQydPZv+UfFoG6kLDRSC1wlLJ8BQEWcUD0PPmr+EFFXgGa
	r2YNg0YsdldaXg+7fyDjxhTn4A==
X-Google-Smtp-Source: AGHT+IFvA0Gr7zm0CDn9Oh8TbkvEzu5rvZvqU7wIKsoXet4JQl1M/Iii2pKy76f6aNUyVy90Hn9qBg==
X-Received: by 2002:a17:907:7804:b0:9a1:914e:491a with SMTP id la4-20020a170907780400b009a1914e491amr6402804ejc.3.1692685644153;
        Mon, 21 Aug 2023 23:27:24 -0700 (PDT)
Received: from localhost (i5387884C.versanet.de. [83.135.136.76])
        by smtp.gmail.com with ESMTPSA id p9-20020a170906140900b0099bca8b9a31sm7651470ejc.100.2023.08.21.23.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:27:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Aug 2023 08:27:23 +0200
Message-Id: <CUYUZDJ2043Y.H79H7Q9WWOHT@fedora>
Cc: "meta-virtualization" <meta-virtualization@lists.yoctoproject.org>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [meta-virtualization][PATCH] virtiofsd: add recipe
X-Mailer: aerc 0.15.2
References: <20230817-virtiofsd-v1-1-85fc942973b8@linaro.org>
 <ZOQvUN+4mwbmPYZK@gmail.com>
In-Reply-To: <ZOQvUN+4mwbmPYZK@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Aug 2023 06:27:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8217

On Tue Aug 22, 2023 at 5:45 AM CEST, Bruce Ashfield wrote:
> merged to master-next.
>
> I'm on holidays for the next week and a half, so it will take
> longer for me to test and get this merged.

Thanks. Have a nice vacation!

- Erik

