Return-Path: <flo.ortner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104DCC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:25:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.8092.1646407512701747013
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 07:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rv9y8OcG;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: flo.ortner@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso4159317wms.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 07:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to
         :content-language:content-transfer-encoding;
        bh=nYQQ/MMhKKaENdNqj3Fq9F3WBl7N9rKqFvX+D+PuRGo=;
        b=Rv9y8OcGJNxp7MLBCWccPS6J91lKUJlzhBVK61/o7P5z0t9wM2fp0gY3lkD8la3qcx
         iVFtzQmerG6SputT4gLrTlOZpQwSbd+HyBhV2ccJBcwM8Q1+v/q5Otmrs4OZyDle3IGE
         uA3Pb+59Ti83NnFYU2uwzWyL6B5XvmM3bW5Teia0cOetNJDFw2mM7zdqPwMt3wyKLpAa
         Kw+QjGlHZcqjmCdOasPjbZdW/U+KHmTrrfWtRlsIfeEpaaXXc1TQZpgF1kx5QSkXXGrb
         TurD/P/h+38udvdKimyAB3nyIPcM0Gz4mfM5lJJ9GLpK6zh5vjRorxkzJtNDB1WI5VAx
         Rn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:content-language:content-transfer-encoding;
        bh=nYQQ/MMhKKaENdNqj3Fq9F3WBl7N9rKqFvX+D+PuRGo=;
        b=W8icq6cYkg7MiXVCl3xAh89jQ+w0Fx5xaWB5mn0zHp5mgLDLKd/0UzZR1m/p4Lxc6S
         RzVeAM/OJJYfE4xkQh8xb2cx0JpWng2/vVrLOjGfbDgO2PIbVvIf6+n63yXX2v9pnrAd
         ZzXZwaoFTaiffMSmPude5oLikcBv085W2ZkKIg8SGTFBU/lFF2pAJm6QXt1/3jZEFj3w
         APMF891OuFFOgVyLWOgblEXl25VCgVGJUaNYdpnDk45QNQDTRdC/DxQU9lQBv8aWi1au
         erFpexidBg97az4xzsMvw/bta+7ZWvap//1BxL+EmuUcL/TDQEj0P4cISs8J0XVvhAMK
         5uVg==
X-Gm-Message-State: AOAM532xH8WqCmJVIezrJdKjYfnZNRGZTf+YNLqBdHp2nbdj8vA0gNku
	Y8g0YuSDQaDCOB7t9Y3cmu9RLgZw0BBpLQ==
X-Google-Smtp-Source: 
 ABdhPJx9e47cufCtHk0EQR8oZF0w+sVnp0IjQ4ur2AviHDdY/6jls4pV0me6m7rlLRaJToEVUk3Bvw==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr8301754wmq.139.1646407510628;
        Fri, 04 Mar 2022 07:25:10 -0800 (PST)
Received: from [10.10.12.22] (host-88-217-192-11.customer.m-online.net.
 [88.217.192.11])
        by smtp.gmail.com with ESMTPSA id
 h9-20020adff189000000b001ea913352c9sm4774765wro.100.2022.03.04.07.25.09
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 07:25:10 -0800 (PST)
Message-ID: <fac5e519-ca70-817e-7492-42bf643e344f@gmail.com>
Date: Fri, 4 Mar 2022 16:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Florian Ortner <flo.ortner@gmail.com>
Subject: Docker-Compose
To: meta-virtualization@lists.yoctoproject.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Mar 2022 15:25:14 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7075

Hello,
I have a question about how to integrate docker-compose into my build.
I already activated 'virtualization' and added IMAGE_INSTALL_append = " 
docker" to local.conf. Docker is working on target.
If I add IMAGE_INSTALL_append " python3-docker-compose" nothing really 
happens after bitbake at least on my target. I guess something in 
receipe 
recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb is 
missing like doInstall() method. I'm using dunfell branch.
How can I add docker-compose to my build?
Regards,
Florian

