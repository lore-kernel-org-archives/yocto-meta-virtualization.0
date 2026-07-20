Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12BCC44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:27:09 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8773.1784582822497161783
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LXBpdlto;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso3628838e0c.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784582821; x=1785187621; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=LXBpdltobTOlgrD8DclgwN5P92JDhw+BoJNCYrPfJW34sI1rUfkhY8tfHvq57Xh4M8
         5v1BFSyKRzeOWXSwNG5AgTxLfGTcHmFMfu7qwkeAtckXUYJB0jmEAZqXHfAgQZhxaqBy
         EIOiV6xTdBMRor6QG1B1TIuDdvpid8DK2iRLIh95hWgwT6FazalBcSiX7IwDVJ2GjXkp
         L0QD2Ukl8Jgn92ygvHTREvVb9l3oK2797Vme2Q57nXkQJ3LQoJ9kJQQMxasmCkegCwYu
         kzeWk/G+itpWf6xWA23nDN5IykSFxSfuqha2iWGgGjZ/c3nQGhGBc9okLQZtN1Bw4IRM
         JS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582821; x=1785187621;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=NaoFdP1GGDtaaPXm+Hgil8ff98U/X5Z8zIwWx8to3RgpKv43GGcWIH1sOw9K8O1SSF
         juCGBmnz+KMUlejPFtunbTfm2tN/axxU1DRbZuhtGGidfMFaPA+j+1Np+aNa+qGaXxxN
         dSOq4hQUtfpDfz4vs4Zp14iRtFGsHC2/k8DgamZ0ebkm66LH8+1j1ACQ3rCajX7HrzgB
         aoQlwPmpbU9yPncnLL7+ZONJAX/iByF8LM2y9n26bQIGBepuxxBbVpPci9XpTmdbnvJn
         JkRqwvTDg4BcwDYazKsewrjqQobBSbLNo9p39Zk52cOyBrMbO/52rLCSKWYtVG2/XrCo
         xx+A==
X-Forwarded-Encrypted: i=1; AHgh+RpF6POJFc0AJ3yb9/82D/b32AsOu/Mmdtx7Q24rZPURDxfrkBml5caIvNKjqIuqbryiV+b9u5lBHVjNEQqH8U2KVJeB@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yzqv5/+oyDhUM/fUt9K1ZAy+BeqabqY/MNVhPJhPvc7W1/zLfqU
	wXKOgCmO9sUgV3H243wiJ2A8JenD8PlKSX8lAxhvg8g4grLAunKI3OL1QZUEeKi+
X-Gm-Gg: AfdE7cnwexO9G7wzELTiNtX7lrHPO2ywhrp6Dx6RvFH919OA8AtGSyAjGV2NR6z2IYT
	+vPtt9lAkMoeJObxUsC7rMonDXNynV8NqXKAuaDx+Th+4BHh2Ju6vB5ay4pmiR22FCfsavCDqlJ
	duey6zAQj3st45BkPTLM78Ue4aAsk4OwJI0pQd0B8XVzA98YJoVhN9OD+cXBnTq1UyzY3GZDRaP
	MXHOKtYPmwuNvUkWE+/vmetigUyEGvTBoPaYs3OK2hk77OeH4bMtPPmlj7Tz/WwqvuP9RxQGQvG
	D64FkhLiIiMyOxi7qo5uNYKyTSAwstdSUcjeXeeq9gbIE9hoCE0uWpmFcBxtCYJ6HK6GgfklfZR
	MB6ai3dfT0mhPPJSkojhQvIOzteepcgiCabuv5wqzGkKJ/B9ePKgl6qOAKRVIZZIeZYA0K3P1hu
	m0vIIRbDpoY/iXnRq2ixFyVpcoW0gDiTTS0WRNB1H8Z0EY5LELmGY5m8bebjSnb5/+3hACgwu4s
	9dnOUWjq7BEc/z1EyLK+BcO4CpgWQW6LMrADM7MOzC1BBMrtoKV6ZKwdpk9GPf9NYBw2ecWk+gp
	r6e5/RBUr6BFUw==
X-Received: by 2002:a05:6102:560f:b0:740:2d81:c2a2 with SMTP id ada2fe7eead31-747534cc771mr4262772137.10.1784582821225;
        Mon, 20 Jul 2026 14:27:01 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74757f2e6f3sm9669986137.1.2026.07.20.14.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:27:00 -0700 (PDT)
Message-ID: <6a5e92a4.a622302b.29f0a8.3556@mx.google.com>
Date: Mon, 20 Jul 2026 14:27:00 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH 1/3] containerd: fix CVE-2026-46680
In-Reply-To: <20260710122652.3004381-1-deeratho@cisco.com>
References: <20260710122652.3004381-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9964

merged

Bruce

