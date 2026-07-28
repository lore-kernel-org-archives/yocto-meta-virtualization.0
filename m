Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C242FC54F4D
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:47:09 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2138.1785260828583655991
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nDARHqqj;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c276bfce7eso40688e0c.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785260827; x=1785865627; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlq/vr6kSdCi9iN7PVNjXkq54Y1H85OwEwR4PJG5iHE=;
        b=nDARHqqj7MDtt3b5g0VUOV0ZnQ3Bl79MMdXxbXoUgKHytIWOT/GuWisTREUIy0kUta
         1OrM4IM/H34xBDdh67bJJOYILxsp79na3BaNCxF9hcu6GmBIm+nyxHSbsdZJDRJtJgcW
         M/84u6Xdncyb8AoowMUaKmgFJWtTCEJaUGh3FUn515gAkfBpj1UAR7aNS7CKZ0fjvT3H
         3HSBJmhuOqfoHiiJb77QajNaw9YHp1JyIUamYt/mgoGZrjCxoyrRcpjReMrnmmJ+VDiT
         z+XF2LJpPigiGsW082B4vvqfoqj3c+ipPDPjwhQ/21kfJ+S64P+Ebx3ys2Orb030PXSi
         vz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260827; x=1785865627;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlq/vr6kSdCi9iN7PVNjXkq54Y1H85OwEwR4PJG5iHE=;
        b=WvE9EPCwhSG5CgxkYTBhQEP2wuqAcURlbFppMnLsVwuuLlQ43XctIM51POU5y/MuUz
         5kU4//WsGfn1+XeU/R6D9IrcI90EiiUtp7prbIbJc0B01J6wDr+ZoQiSXyA+adlWdRi3
         OLVzkS5psinV+RZpZsw+ACGhtEkBJIjZC5/lQqOzoXctxOyaTUy1XzmLsIyc5L2UUbIQ
         Fw45FWjCsnrFSZm4+680lZ5Cw4NGgMb46UkZAk1u2Y0yxQ8rcxXe9IVEZDA9/OOvDX3K
         GoqpLif7qyOBEJjfHz4pVybUhpgkPWtXqRn1NEOcHpNOs2bAo5mK/5hDGModPoQoo4tN
         KUfw==
X-Gm-Message-State: AOJu0YxIX2LbgOnnvtx3m9yDnRkZduaHuwRfSzWgxMvi7h7eZsBGdioQ
	HVyYu9TxP74WglPGZHwL2Djnl2aqfqT4HqlQDQXtlG6/zZQ+e0oXBsX258Z+cTg9
X-Gm-Gg: AR+sD11nckmhJXTLvEcwkAru/V8obLJ9yYV47j+KxnW7jbyK8hEg8bdlfS1yWmtQRmd
	+pIFTEWsazwr0IPcV86UF9X/nuRys6EIqQ3U7gbBvvb4ZnQvyl3DjlkbaNx3GFrWv/Xa0XVN0j+
	34WBzt7VO4iypzItaJ+iLxQCUQgzB4k8g6Hkct29rUleBq6o3DPxve8lmePBk20XcPb7rd0YqnD
	67/sihkj2pFYLbwJV0DspyWxhwFFfYTkr0r97s33GnmsI3WticyqNaxPpLK+mWVg0G4fAqjWyQ6
	AtJMuFv4r7R1naJm5+4gTQwRpgXgpHUAy1hwcc0uj/sIO5fU4JfFaHMqgVtwxpI1fHpaQB47Glt
	/B/0/UCfwUN9g27xZkubl00Glnl7Oq8TaqcTzgvgZxW3Rb78hFUI6WgMVaAynQCrETxFO596Y5T
	yVca44jVNgPIPRvwHuWZsLTTP3fk19q3ORESdVdAHqq+KzNaU4hRMHfyRCl5NJmettL6e/za5m3
	bL20KzyUnYTageI10n2gVo0XvQkWFjhCDEtmTNhknRRHlV/2XWPUhO6QP6ec7jJTHMxvIMcJBPg
	Ki4=
X-Received: by 2002:a05:6122:3291:b0:5bd:fb8c:5db1 with SMTP id 71dfb90a1353d-5c33fa8155dmr1879124e0c.10.1785260827443;
        Tue, 28 Jul 2026 10:47:07 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c34eeff656sm74457e0c.3.2026.07.28.10.47.05
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:47:06 -0700 (PDT)
Message-ID: <6a68eb1a.2bc1d9cf.30de46.0eda@mx.google.com>
Date: Tue, 28 Jul 2026 10:47:06 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][RFC][PATCH 3/5] packagegroup-yocto-builder:
 add additional dependencies
In-Reply-To: <20260727000247.1623785-7-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
 <20260727000247.1623785-7-tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10004

ack'd, staging on master-next.

Bruce

