Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8239CC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 13:59:18 +0000 (UTC)
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15717.1789567154002628440
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 06:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jqSt7q+g;
 spf=pass (domain: gmail.com, ip: 74.125.228.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f55efe5so165119066b.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Sep 2026 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789567152; x=1790171952; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6Nb4mZOf0n5T+dybu4tAQN287QvcCal1/2Wjw7zeVM=;
        b=jqSt7q+gSmCNnliocHFefT/rDvf7nhmE+2czm+1diqCjVaslL51OxPhjGgxthQwUAS
         Tdbek/nmxfVHJz7qkCATnvlPRAj2WcjFqrykqlHfLokRqXnvPbJuQS9oqT/QVXoOnuSL
         S3YDXwGqolkbgNQQFQaixhDW80oHMI4v+4hix+na1VG4KHXXgGUBFj2QbTlxfpKilIbh
         sA2byCHfAqQ4kyN1WV6XWhWHLld85bHDKHAVQzdfA0h3oix05WkbFDbiubKgBR+3u9bl
         7WTFyvNZ41EYDxcZHcsfQLVldvYmSCQXiLbcA15E00k4inn+UAN37lbAACkuli+dLYgd
         TXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567152; x=1790171952;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6Nb4mZOf0n5T+dybu4tAQN287QvcCal1/2Wjw7zeVM=;
        b=QFruwe97Gb1PgovlhTDvB4tFz7MSYTXzNhXuOkNDogIfvhRuj/O4Pzagwgfme1OkmN
         TmkdUV204k6TEm+Ljd8t3DZ6/1B3P99p4ElMCfMQVUH188Ltrr5JsKUMRRwIuWvdU3BG
         +ViqXfI9mulI7ryh3LEGREpRXMzTKEYERIP1gt/JWCeGsBAHpwdIxf0lOIU6LsTXfcPO
         SDejF3ovkydjUDlxvoZWxzVSxzxxgwWNhH3m5kjxjNv3GJ73IkvwGzr/Pe3qF5V/Y1Wd
         RcTGNm58t7AESJEYWeZ3Tz/apWq2kEAdxee6bkbjTXpzt5BJdKzyKH9UH6QwHmoy4deq
         oHzA==
X-Gm-Message-State: AFuF++nug/HSLT7DXU/MSDbBH8afFsACVW5V1QAzlk5Cr2r932leNP07
	wX7NAIONS58yEiTrA7jXFsHIJ9x9InvxyFuwIP+qpvaQ9Rypz/n6Y0/kVbGU+PQS
X-Gm-Gg: AYBFou2xvshrfQkFCaN5BK5lEP7M5EE6AVu5CDn0OyuEbv++CU8sR16AWhUS0q38S0S
	qfdn6yOjYK24j4xXFv3rhn8qEl4uCtTgIZtpjPEMVTNDqWmHyL3p/btRA4IY4BmcWKCGdPhbFeJ
	cm0Lmc/6E6aNjpCKmhZKuYH5DwEO42mrE69ivtGoV14zCMQ8c6j/WyYJiF+mdBQeYgAPXOhumMN
	MGsF4aE6N8p1BbT7qggnYA4bhNtbfZMBTN1hR+pfs4jmHvJG13i5tjTMi1Z7oG+ASfg8d+g/hjL
	On5KFi0hQTNLByoWuLEVEJwBJjbWo6b/S8Q1g6LWjyus+RKgGA/L++5egxaIBIUHD3Ywz5oxH60
	kiLHjOMe3OEgDt9CBkX6JWs+pRXHNY+jQtgylz6VaIYAgU9L7boo7pOoG0lO/vglndsCzConbet
	pcIBZgMrN7e7ZiHk1tHFWLSr7idHLrfbSZkj7msbLOPbkXnueJtU13tqNZHccwLsRFvENZsQi1N
	K3j533Zgsxfw9T5vfZJ6VmetfqvPusOrrxP/P10llVjqFaFZHkDDwPcXrVjdCTEdyP0KQTBw9O+
	T2XFHhzF6R/qZam4jpJ8hbDzwFaaM5s7DuJc1dl8ECupYmUpicm85W7pCSniPsbHZQ4uLIFb
X-Received: by 2002:a17:907:97c5:b0:c26:1691:b364 with SMTP id a640c23a62f3a-c29e52b47d9mr178793866b.29.1789567151899;
        Wed, 16 Sep 2026 06:59:11 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de487581sm138241866b.27.2026.09.16.06.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:59:11 -0700 (PDT)
Message-ID: <6aaaa0af.6d64ab45.378b8a.460a@mx.google.com>
Date: Wed, 16 Sep 2026 06:59:11 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kaloyan.rusev@elektrobit.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] Update Ankaios to v1.0.3
In-Reply-To: <20260915095304.1339104-1-kaloyan.rusev@elektrobit.com>
References: <20260915095304.1339104-1-kaloyan.rusev@elektrobit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Sep 2026 13:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10081

Hi Kaloyan,

Held on this. The patch has no Signed-off-by trailer -- the body
ends with the CVE list, then jumps straight to the diff separator.
Every patch needs a Signed-off-by from the submitter.

Could you resend as v2 with:

    Signed-off-by: Kaloyan Rusev <kaloyan.rusev@elektrobit.com>

on the last line of the commit body? The change itself (v1.0.1 ->
v1.0.3 SRCREV bump + crates.inc regen) reads clean; just the trailer
is missing.

Bruce

