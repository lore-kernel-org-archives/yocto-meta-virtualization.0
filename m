Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37B1C83F12
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 18:05:50 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.4002.1693332341454029096
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 11:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ns6g0Mob;
 spf=pass (domain: linaro.org, ip: 209.85.128.179, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59209b12c50so56871857b3.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 11:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693332340; x=1693937140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bWdwUO2xRwKSWd4qORO0a8CKFBNE8whtZHfoRs4J0P8=;
        b=ns6g0MobTVjbhwhKTbMos9uuMiG+UFhlPYMY5fPcxt2AvO90fzEics0lI9z35qsZIK
         dGaB5CEHcacwuWycWvAbcge3I6RpcPqwkjhlyD6R7PrMLuRWuQQDxxXRr5G61rw/05k+
         vdPviBAlS6l5SQoeXYIhmmhOJD0Va/Ce3NZKTtYgtqXYHVDRUmgQyXvv3Xf7EoOeBIze
         ydFPV81RSxrLM4Qu43QVr9c1cZbpxjwrjxo0aWwmCw5DiOFNYgXE0ft9kLTPkrqK2tBB
         fhRg+nXnJNcH1M77WL11JeHZCCv0Ex6d6J2us0v6LsLfS0sd5KNQpY7rgeWSwDofhf6+
         5dxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693332340; x=1693937140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWdwUO2xRwKSWd4qORO0a8CKFBNE8whtZHfoRs4J0P8=;
        b=ENy00kV4YeEkocQzsBaEZJsg9RDxa4b47xkvaeacCYPbOc9QkuDTrQV3zIIzfcNh7A
         qEIh1b8ge3TAyj5p9mQoQaeybqjcWYjw2/aJhIe5yStLimETPoU+B5o3Mb9kkhvMZfiH
         9i/j4VW/e/PEIAhbB8LdF702z4/orMs6GG/Gue1NMjro/PbzVx/6OdWkRTGHpT47QivX
         tLqoMomSXpSuxR8M987Hb7hZI+fcYIZ2ALs9ypQjmFvdoddQLmblaWVRS1GLIxmP1J8s
         Bbc4/ElxleUjwIEw4adJJ0WWRqTw5iRqnwrzdXGf6kC4dlg7QfXHEKAcrJ8Kk2OcbZEl
         TlSw==
X-Gm-Message-State: AOJu0Yx0ivDkDbWnRBG6Vf/pwYhJkmhsEH8U3qzmtcDOMOdzFJiDwj9j
	nN6tgMqhK6Ex0uo//ZbwhDv0NQ==
X-Google-Smtp-Source: AGHT+IF3ogMLtcfZR+fPaQ6RfcUo/8rah+AFQYrAI97o4Grpqwr4C4Mtn+ssj2uiZwjOwRyb0nu0Nw==
X-Received: by 2002:a81:a883:0:b0:595:640d:9f61 with SMTP id f125-20020a81a883000000b00595640d9f61mr3815873ywh.6.1693332340646;
        Tue, 29 Aug 2023 11:05:40 -0700 (PDT)
Received: from [10.59.32.33] ([190.171.102.33])
        by smtp.gmail.com with ESMTPSA id v184-20020a8185c1000000b005837fe8dbe8sm2883841ywf.8.2023.08.29.11.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 11:05:40 -0700 (PDT)
Message-ID: <d94c5a56-8d48-4083-8d97-3c9721304f37@linaro.org>
Date: Tue, 29 Aug 2023 12:05:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization] [PATCH] go-build: add SRCREV_FORMAT
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230828202834.2981605-1-javier.tia@linaro.org>
 <CADkTA4PcfD4PzoFpncuOfo7zCptnXKKSxQTyk-ngG76cvQbgfw@mail.gmail.com>
Content-Language: en-US-large, es
From: Javier Tia <javier.tia@linaro.org>
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <CADkTA4PcfD4PzoFpncuOfo7zCptnXKKSxQTyk-ngG76cvQbgfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 18:05:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8262

On 8/28/23 20:20, Bruce Ashfield wrote:
> There's some extra whitespace and formatting changes in the patch, it's 
> a good policy to not mix them in with a fix. In a scenario like this, I 
> tend to use the representative SCMs in the format. So in this case it 
> should be runx_runc. There are some exceptions to this in the tree, and 
> I need to fix them. I've spun a patch with just that for master-next.

Thank you, Bruce, for taking care of that.

Regards,
» Javier Tia 🖋


