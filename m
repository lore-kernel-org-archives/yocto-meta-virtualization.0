Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F3CC5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 19:30:38 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20670.1786735835783699943
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Aug 2026 12:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b3HaMrdF;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-529a1ee0e62so10789541cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Aug 2026 12:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786735835; x=1787340635; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=b3HaMrdFDX8WsRc4GWP1asTqqThASnd8v0rb0Q8L10t8WJTQk+jzeqRf5gqjaGp5+p
         2JftHamSI1FPaP2OHirj8Kl+3QmI1t6WKJeeg+85oApVQ3jDex0gjF4RLgJPTT5ihWrF
         5c3keHddDbzdly1U7Qp8b5y7GCK8vUYCegZaSwfzlgwdx9rRXa2CuxEenPkpxf3qUPL2
         NRG41bFbvGWIx4auxgDsJa5zoLOw8AqdOh0KmqWCemowj2SuDs+HmGIhLtST+O9G9bQJ
         7EsuUYC7XTlOYRtM5dKuSNDxyFupOEdYXEVbmc4T2gpESp9PB5rckfAQpeCJeK0egAJ4
         vaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786735835; x=1787340635;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=lXU8RX1KUfzY1GvoWbNxYYFl+Qre8RxrxjiXrWeWDa60Pg5s7yrpxra0Fvx6rg9BSz
         MVHCXAM/JMpnW+yhJD0jDYBNW+Khz8DgxqnfCdsAR94YY+TPXxzXaiZHPpAJtcKHdCh1
         9oIlgxVpz7bzkD3jkheyU0ksTG6RQAljh7mEc+C7UGkPySbdFo64eErQkiAeFgazZpwO
         B09sqpRaHzN+bL43A8leUJUiaa6EtcqhGGuRulzYZ2keRDdyE9J6IjKRKBHuzBISrEzF
         2Xj/kVhNfXlD8nG2MioEbnx27+z5JIabRymjm1FykUmS4WmOI4D2vWRlKt9o+OYdPw5U
         j2Bg==
X-Gm-Message-State: AOJu0YxSZxCiqeZDihBeKJNR6BgTm6zKRT1Sj2uD2Q+QbpDWFVi1DX4/
	rCNVGRe+2OahvPVDThBA/eqwneScfzJMoYY8NvZwCufeMUkHCRoyspEPO2WARqZB
X-Gm-Gg: AR+sD11GyNYHcXq07o7ANM8bAUl3Ruam4kVdj/nJjUINA/9xjld3KMo/qNWrn4Athsj
	i2nvxTHGWkX/q+QWpM3a2xgb5xI1NlO8V+K3ywXNhYM2LDoRB/g15o51CfXmUeeKsrbyM/UeAUZ
	ejNX21nvsehebVXsD3wHsVDnshuR650KL7Tto++VbbvivsoAP7unke1RMu40YaQlOCUnDf0TLK1
	SYPp3WwDqxaYgNINxL77geGZsJR9px32pAir3FY2q2fBpVOdo5cqxgNSGeqUqKAKgBcf8VHaDG2
	QnPERNDrZaH1FiZA2u1Ah4EakYQOOkxnSnC3+F24BtIMmByFqzAT9+0SuiXnmuytNchcZ32LkFu
	23UNooHdKkud9zrp5vBqtgcGgELfHfnpIeSY2hBP7GGjp4NVNURO06gevmO+R0utDYSk2fPEH9r
	pxAaECaRgzWukwEMc3Os3Otn9dxZ/txGzUIAIuWLc7thWMSqU+4FSD/mcrcR6N86GTkdU2qpsQz
	fr/lRLD0vi1zoZduvjAb0/I1bItRdddtcL+BfKQbrUq7WPhrCh7BK159VVSZNLDJwm+kcxRuBjJ
	4CDLL7epxLqvze3QzRmsnlOxNwHoMzmIa/56Lt2hIPZOAAw37+GlAn/HAWnP
X-Received: by 2002:a05:622a:6816:10b0:52d:94c5:2212 with SMTP id d75a77b69052e-52d94c5234fmr7529741cf.3.1786735834264;
        Fri, 14 Aug 2026 12:30:34 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a93584343sm24082646d6.41.2026.08.14.12.30.33
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:30:33 -0700 (PDT)
Message-ID: <6a7f6cd9.b9bfd787.1a6e7e.8314@mx.google.com>
Date: Fri, 14 Aug 2026 12:30:33 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][scarthgap][PATCH] libvirt: fix for CVE-2026-63622
In-Reply-To: <20260814083211.590990-1-hprajapati@mvista.com>
References: <20260814083211.590990-1-hprajapati@mvista.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Aug 2026 19:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10042

merged

Bruce

