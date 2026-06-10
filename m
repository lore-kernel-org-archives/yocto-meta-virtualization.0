Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CCBCD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 18:58:24 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28606.1781117900108658225
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 11:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o7ZklJrR;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-517b1f2c668so43366871cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 11:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781117899; x=1781722699; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xmb7k5wqKwpF9CVvX4Tzqs32L9vFJhAiy6kYMBObmmE=;
        b=o7ZklJrR4GlSNxkwtVXNI8ebOiwHGK/QCox7tBEMRixdOeBG8cKK3/d1WFMYDeMf6M
         1XWdxMQ/L8tffVPScESJO5vY4W66IIRebsKebSLIovqWX/MQlJAlmBflmEwQrzrkoeAk
         WB5YL5VtDRq4Ez4Z/M2FDUZSJxF0nSN/vQUwfW9cWzTjeM+N5jhSX14JR62BWJr1mI71
         JgD3c0uOFafWPotj1uDz+NNB21ueP8yUI5q56AR4XVrX/b3FTaZLQWqbH0+zJukKS9+w
         elmVVLmV0D7cVw38P28ZHtdsC/+LUZaGmNfOQkVCpUSIod3sDBSGoAEXGD+XGypvCocv
         7A+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781117899; x=1781722699;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xmb7k5wqKwpF9CVvX4Tzqs32L9vFJhAiy6kYMBObmmE=;
        b=CRHXUIg8+NnKijpkDv5EiwXek3svMjlG/bdLcJ4dSlyZSuUZRDy9ljYOBZ/ahzQCbb
         hwYQLtA6JPkA4oJ8B+gJXF6jnmZZO/WtIMXZ4qAkKY37T5pgHK5JDTEILUwoWgLGtwEX
         IPSiUX2RVKR1TkDkPSWl5yw1YYqhfIv+bNtLLIn4cuwwRYTak4enUeWFIc0lSTb76gUG
         ZUH/c7+Acj0V0V8XLt7sxYnd8E8QvWl1XQ26o0oQ0ssJrf2pg/HGwa2aWrUN0NUQte6W
         MUcSEUJzGPZ1lNIV+ttCMbTBxqirQF7XUWOeSTdnFuHP/Z5en2F65knsgxQsnasmStw8
         FSDA==
X-Gm-Message-State: AOJu0YwA8ZN8t8ZGRIByjse5wEE0RhQFDDbJdkInRoV67Ou3Fhhk8nyh
	rDUwXAn6+x9vHos/KvFTrJJ+ekxHltBaroVeA/ULpWNU+ykCTnAdn6yF
X-Gm-Gg: Acq92OFqVzPjhqInbxVvMJSDf2aRajH9Zlidm1Y2GrlZjH+DuNNGErIyVEyzpDWSUiN
	UzExN+WsDcsOd/VJDGO0pmghau7rroG4xuRFEKfxkQfc+k9XpeeOl0iEWF18UCaMKwkpR2q3emS
	Jg4DC6S1F1lWj+fwQmwWnKblXeBrh1TPF7s05202Q5TZdBfUpR5X709NXAXQmmKnknXwjB0Cw/8
	Qx4L/aob61S7phV2C9CLoP39ARJjRyoBeroDQA98NJANl+SB7/voMgrzIxPPjupj2V0eNzUpgM+
	9g2OhRJsxUHqeK2WOPDVlJ0QBwML05LHTrFz+ewyMYMNtyLnlSWgfTyrzYzw6FTSzWZSkQEv5bU
	i9VXphqVpoMpE8hG3G0VKYPEKU5slK0xRDeITC2hmXDQw5M/nufubEYp6A/cFYNNqiPvz+Fd9GW
	lyLm/W3+CpLYIvrjq6ik2cs1HdnTnU8iQ7Eh6WXkScHqCaSPHbskAAqwi16D7hVinet9GUvrdYa
	2M+7Q5DCFuQohoqZ61llzwrn3UjJ1W/+nyXuSLJOho5ZVV64G9rMEHYJuz9T5jq1kYFVtTpuuCp
	6qDFb1tw5qZTP6jfRR1Jnwd8far9vLB8Oww=
X-Received: by 2002:a05:622a:1355:b0:517:6b31:8058 with SMTP id d75a77b69052e-517ca5eff1dmr129528161cf.40.1781117899034;
        Wed, 10 Jun 2026 11:58:19 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775da6f41sm216659511cf.22.2026.06.10.11.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:58:18 -0700 (PDT)
Message-ID: <6a29b3ca.be2ac057.5e7b4.387f@mx.google.com>
Date: Wed, 10 Jun 2026 11:58:18 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: haiqing.bai@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [wrynose][PATCH] buildah: upgrade v1.43.0
 -> v1.43.1
In-Reply-To: <20260602085816.1182516-1-haiqing.bai@windriver.com>
References: <20260602085816.1182516-1-haiqing.bai@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 18:58:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9865

Merged into wrynose as d805e74d.

Cherry-picked the master commit since the SRCREV there was slightly
newer than what you sent (v1.43.1-tip vs the v1.43.1 tag itself).
The extra commits are post-tag cleanups (test infra, go module
annotation, doc) — no functional delta beyond v1.43.1.

Thanks.

Bruce

