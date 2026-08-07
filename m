Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7091C2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 18:05:10 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48665.1786125902885925489
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 11:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dzXf+3UQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c05dcdf49so34865151cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 11:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786125902; x=1786730702; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=dzXf+3UQ7gyHzr2gnnnT0jwfBcqIv5rfNJohQqFwow9mAsiNaxyeI9wb+JPOgwtWuP
         mo7MIfdRGQR+FrX+PuNMveHO3CZLXEpbGjWvS+4rH4Sp0H0tinlOaXiWhH6jdqKOaOpG
         8oPITmMtAAZZ+HyAlrlnNImOP7X7QthObQ9gRLfEvZiwXn49YpZwQJAR4O3gVBEXpAHF
         I78phgdU2EczWYATpOfZZrXCbR8VxuvtJcfWDvyEpvTcK3HOIaxkHdDwnm+jarvcSVaE
         j5gvpvMf2S8Bd2CrX6XG/Og9+z/+n/uUYA75zpr/fJ5jHSjIEXQYIRA7+kVrvPB8kYos
         LKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786125902; x=1786730702;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=COwgkV9rtLuOooK4gr11B1FEiDUQUs5ehrAr/kfwGUzaYAvTOJrV6uJTltVXxYRDsR
         T1ZPlKPg2f5eYqWNFq6VcYAmLyelVwfyJDFD80m6fEPEvm6iO09lyXQJsyv+1mQxU7j7
         tAt5zguQL7nSv5GLGsnZ92Ezqbpn1PcE7JvvjZC6IJuMcp45n+xoZty+UUPnactv5u4h
         ZyMqKB8Ng2wcGGOCftVEHhxNfjniatT5Obxo7MWtPTDb9Pput914cjUX/o8ouUsQyijl
         AKC49zVQT8k+iT8L5VLuDsHzA3zcAVMU6Hpj6LkDTzQ5pZt9VLeCnrRGg6Ncvb5z56k4
         EcCw==
X-Gm-Message-State: AOJu0YxqIYDkvUQAMqu3Y0w9sdNtn9gnrirtCF3zJ5w8HoHcS34cBTwN
	emOVbHn4EarcXRk6FNNt+/36EAxcUIm7VwRa4BSdqoqBaKisULS4i4YjKOnP2Nuk
X-Gm-Gg: AR+sD12ys90s9wQzhgNNnK4q1ILgV4taU+Mf9+EwwSKkw59UJcnzWt5Q+LJ1dUClnDg
	oOTSrppBd5w5pFttcvQuHS/zPPxc4jHyoQJj34V6LS+bwT6MQ9f8LfeAwRA1SBI8LJK8Aj5vbGb
	7/YuELbh8iWmQb3T0ImXd9e3NVfSHtA+SdxL5CetOvdu8MaafuvBTK5AgXk8qkwVYAFLjNwdBHh
	94u+xufuGRu1Q8Wf6Z5LvkRwmOiik/mrm+hM1bv7Lp08lngI0luNOiIluag1OVmmRW8rcBrkYFq
	h2Y6sXvNUeSg5PTNKRLg/UqLwwAR0Q8beyAwfsWMqs/AD6FfPRq3QB7tOyuxbaKgFAE3QV5yoVg
	qWzNVdV5um2nnuLt4/MavfJIpx+8FONAaxocFfKkZsH6GnZKyk1YYn3leeCnuLhUmdeMsaQ8nSO
	IgM+m0KoNWk7M7ABsWib5/6LfOFJTZ7gKYkksd7XkQCW8S9YYaxd+l7CtH5aVit+2LOqPUotrOR
	fSR/aSAkA/IB6VK1P/i6j5Kgcb+UizcYzf34idCcYT07INbgbb2DSoPiCoedKWVk4IjVonN7rrH
	+t3XgdP0FI91tjJa72+OwCXTBrJUH9LHYqmy9yluxfMQBxyLyPoqFj9N6DxhDQ==
X-Received: by 2002:ac8:7d48:0:b0:52c:cc14:ff63 with SMTP id d75a77b69052e-52ce61dc797mr244875261cf.37.1786125901576;
        Fri, 07 Aug 2026 11:05:01 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d1659c1e4sm17066681cf.19.2026.08.07.11.05.00
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:05:00 -0700 (PDT)
Message-ID: <6a761e4c.e721e611.3844d6.e643@mx.google.com>
Date: Fri, 07 Aug 2026 11:05:00 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/2] python3-webob: fix
 CVE-2024-42353
In-Reply-To: <20260806055455.3114166-1-dkelaiya@cisco.com>
References: <20260806055455.3114166-1-dkelaiya@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 18:05:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10036

merged

Bruce

