Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A21AC001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 08:09:12 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.102905.1692000542733019097
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 01:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LySsmwNj;
 spf=pass (domain: linaro.org, ip: 209.85.208.51, mailfrom: erik.schilling@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5236a9788a7so5481857a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 01:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692000541; x=1692605341;
        h=in-reply-to:references:message-id:from:to:cc:subject:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26ZcJDsEjdoife284kKTfNuP95pN2agxcSUhjNqN4G4=;
        b=LySsmwNjIu1A9hf9sZ7CmxRrqovUcvYZJitPicpcK66wF9Cwi6+Ng/RoT4BHV25N/p
         4bM55BGi3hMaIaRa3ptdOHr58X+kqVCmcPU1ahSZ7oFhhismyjfG9yOKo8r4Ay78jbPJ
         eMN4u8qoAWW21i6Ksv/mauBgyOlELjereONgYjOaWeKeke1I11WkE6JI7f/z5tir85F0
         ZaUlJjLCdUSXWPMUjxCoqU/rXPGMwjTbp9dc3ZypFYYUecWSxgOMXCZTrftlHSnYCqhv
         tjla2DGElNBQdBzaMCy418iwTfpU5bi/Vjw3OOAwMx3Ws5dGahwIUrFDjuWEU50IHzpP
         p32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000541; x=1692605341;
        h=in-reply-to:references:message-id:from:to:cc:subject:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=26ZcJDsEjdoife284kKTfNuP95pN2agxcSUhjNqN4G4=;
        b=O5w8o+5MyaKABlBCukku6SZuL5BdK3coW1XQ9OFbMWvXDucE/0VL3gB7xrju+OJbhb
         XCwlghJTTOqmpvCYZ9Pru4mk52aabsuRquzjs3k7chuNsZWdnSJVM1DnBbamx/otSvHB
         FTM2XbAv0BqMD1/TxJ8N+rL3X2Mrbfh5U9wsGjgWrAUuMWIx5ihqet475OlU6jATlIRs
         XdzRkaHZtqMgkPlMRSDpTyp72n5x+G/13geklGbAwMMqD14Oj5wBlia+bdyuIgD/uUyJ
         5mC5Ljpd96nU2FqyL0q5RRFfdGsQbISBP2D8F+h8QhFruBnFvbyC8ZVhRqpHSFmx6p1m
         zk5w==
X-Gm-Message-State: AOJu0YyDTc94XxzSB8Iyt/90w2CaaFs7/NgACbNX7NFzcxWRpI/DPFnJ
	Jrt9ZV8EquCGBNFufp0IDn6QMQ==
X-Google-Smtp-Source: AGHT+IFCpN9Ukqic9oLSJvGEplFJuG6Ew4QZWg9a7uI7ZTdu9BdSaulh4Dwgf21CJlcB++2UZWXzyA==
X-Received: by 2002:aa7:d914:0:b0:523:2919:635e with SMTP id a20-20020aa7d914000000b005232919635emr6974986edr.14.1692000541021;
        Mon, 14 Aug 2023 01:09:01 -0700 (PDT)
Received: from localhost (i5387890C.versanet.de. [83.135.137.12])
        by smtp.gmail.com with ESMTPSA id i17-20020aa7c711000000b0052307566ed2sm5261591edq.14.2023.08.14.01.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:09:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Aug 2023 10:08:50 +0200
Subject: Re: [meta-virtualization][PATCH] vhost-device: add recipes for
 vhost-device daemons
Cc: "meta-virtualization" <meta-virtualization@lists.yoctoproject.org>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
Message-Id: <CUS44P1QSMPE.1ECWF8S2MARHL@fedora>
X-Mailer: aerc 0.15.2
References: <20230728-vhost-device-v1-1-d9f81124b66a@linaro.org>
 <CADkTA4P7UOKSbocKWrQBGJTyHgDANXuatZs=17g9956Cs0ZaVQ@mail.gmail.com>
In-Reply-To: <CADkTA4P7UOKSbocKWrQBGJTyHgDANXuatZs=17g9956Cs0ZaVQ@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 08:09:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8179

On Tue Aug 1, 2023 at 8:35 PM CEST, Bruce Ashfield wrote:
> I'm aware of the intricacies of rust support, and do watch the OE core
> discussions closely, but that being said, the commands to both
> generate and update these recipes are not something that I frequently
> (ever) do, which leaves me trolling through old email and threads.
>
> Would it be possible to document how they were generated in the commit
> message, and also create a README in the recipes root directory for
> how they should be updated ?

The generation and update process are identical :). The files are
completely regenerated. I added a README.md to describe the process:

https://lore.kernel.org/r/20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.or=
g

- Erik

