Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280ADC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:59:30 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.708.1703181562867536715
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Dec 2023 09:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X7JZXOKf;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5c6ce4dffb5so539541a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Dec 2023 09:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703181562; x=1703786362; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXSl0Fxbym3hcwOCayGejANzlHAzUaZa4U8G22sHutI=;
        b=X7JZXOKfoyfu+Hzr7PJIV0HFP6hLSAYvURwrGjoafEKnWOv29q7HRJtCkamGzIEFxB
         6STTJo1lX9N6Ju1CfVzOk+KJEzc6OpY+xoDIUQp6tO0deeaOALqCBny2RIMNHDTfrSZx
         s/V6v0pz39DDN8/9FgIxSUHiKfoL/4U6xpF8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703181562; x=1703786362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXSl0Fxbym3hcwOCayGejANzlHAzUaZa4U8G22sHutI=;
        b=Wa1EvOzG96u0dsCo0WcB1lvx21hzmJjnHasoWAAtawQLHTMQr0hh37RdCar+GU+Sl/
         T2hupQpUzZ1cwIh9qTA73Tof8uhz3cHpHuTOQSaWWclxxpOnUUoN99YIVXjYTk0koPKX
         9Ghc44Vijm/q8Muy8N28SJlZPFxH/eEA3vQpt+GetGQEbfxUAP44Gq2Tu5detbSbrDQx
         FRI/6juS5zLHjJ07jH6Frx7NSfj6hrOO+Mf7/KomzMep/K9mr8llVPXIvwXB2Qp6qzQX
         FS7ORl4iCSiBuDFUJEUyYhMDXhSAB8jXxiHiofBS36ADomotTTNtEBqjIkH0h1QPpISy
         ZyxA==
X-Gm-Message-State: AOJu0YxcTGCN3pF4byoulhiKQXQoHHXQUZpDqCgJ0KNFMJPppZmgUHno
	7vAVx2R/Yih2NnP/SEKpsX7YB49O+Gzvjg==
X-Google-Smtp-Source: AGHT+IGExpoqol0af6a3FhyWd57EPR5JZSPat8Bj/D20bH9X4yvz6SI1VJ6GYB7C7sKecst0zlaljQ==
X-Received: by 2002:a05:6a20:7491:b0:18f:97c:4f46 with SMTP id p17-20020a056a20749100b0018f097c4f46mr41921pzd.82.1703181559245;
        Thu, 21 Dec 2023 09:59:19 -0800 (PST)
Received: from [192.168.1.9] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id pl18-20020a17090b269200b0028ae9a419f0sm5899777pjb.44.2023.12.21.09.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 09:59:18 -0800 (PST)
Message-ID: <3971afa3-b3c2-443d-a5e2-de4127c5ce8b@mvista.com>
Date: Thu, 21 Dec 2023 09:59:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] cloud-init: replace sysvinit/redhat
 with sysvinit/debian
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20231221173438.3684990-1-jpuhlman@mvista.com>
 <CADkTA4OFEAQMgv93n+h8aiTdiNNWxEG85bht-yv8F76iOQtLRA@mail.gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <CADkTA4OFEAQMgv93n+h8aiTdiNNWxEG85bht-yv8F76iOQtLRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Dec 2023 17:59:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8525

Ah great!

On 12/21/2023 9:57 AM, Bruce Ashfield wrote:
> I have this already staged on master-next:
>
> https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=dd8fa86c6a85b44d77ae9579453e57aebd7296db
>
> Bruce
>
> On Thu, Dec 21, 2023 at 12:34 PM Jeremy Puhlman via
> lists.yoctoproject.org <jpuhlman=mvista.com@lists.yoctoproject.org>
> wrote:
>> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>>
>> sysvinit/redhat no longer exists in the sources, move to using
>> debian sysvinit scripts if sysvinit is enabled in distro features.
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>> ---
>>   recipes-extended/cloud-init/cloud-init_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-extended/cloud-init/cloud-init_git.bb
>> index 9d84f47e..edc6372f 100644
>> --- a/recipes-extended/cloud-init/cloud-init_git.bb
>> +++ b/recipes-extended/cloud-init/cloud-init_git.bb
>> @@ -25,7 +25,7 @@ do_install:append() {
>>       ln -s ${libdir}/${BPN}/write-ssh-key-fingerprints ${D}${sysconfdir}/cloud/write-ssh-key-fingerprints
>>       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
>>          install -m 755 -d ${D}${sysconfdir}/init.d/
>> -       install -m 755 ${S}/sysvinit/redhat/* ${D}${sysconfdir}/init.d/
>> +       install -m 755 ${S}/sysvinit/debian/* ${D}${sysconfdir}/init.d/
>>       fi
>>
>>   }
>> --
>> 2.31.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8523): https://lists.yoctoproject.org/g/meta-virtualization/message/8523
>> Mute This Topic: https://lists.yoctoproject.org/mt/103304302/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

-- 
Jeremy Puhlman
jpuhlman@mvista.com


