Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82625D75BB8
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:35:50 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.3823.1732163745198314804
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 20:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bqdrRk3W;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d41864d745so3278446d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 20:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732163744; x=1732768544; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mOl5VjI4H9iegtSjXfusNU9zd1XM3Bh2c9lsfIHI6VU=;
        b=bqdrRk3WHiqkVZdtD5u6KxusEbC7/HY/jvt9D0NWjrkOGGA0VzFfWs8AiNWvvblCIB
         msTJjgHs7osZApsvD8xu8hcsECyNLvcjhe9ZTv4w9JrqeeZtOrrNoLLjByaeHa09QmbN
         TQkKBnRmysWYE24sCDxpKfyy+d7wWcNANGTVoXHpA9FgIKHtUuv68r+7D2dDkKy8KGAG
         WGJb6ruB3VTrAQAVHffVDNfKF2bk5lkCWK00gKgRUzmtwMdwPRHa8KJr/LuPSr+MtlVX
         49r09YK+RTosyX3cr6JdCVfLdLNRkltW/QJzr4jKW/GZY7xkZItsTwyRZixttjE52vNe
         ifeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732163744; x=1732768544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOl5VjI4H9iegtSjXfusNU9zd1XM3Bh2c9lsfIHI6VU=;
        b=oHluaX8zLMSW2wsTOqSwxSd675DZ3jgugOLyZGWDtOHnwyNVKkd3KyOe+4MO5rSnh+
         BazLn4Opyq9p9cjxOKnkJQqSdrgNdcHbyTOG1QMQr0GLIgUsopDkek4KjxgGq7DswNwv
         nK5TBWdbzAsZR7BTypb4Lr8GvyqW0ZGpJGjbl2Yw4r+7ewmnl6v3FJfdqLAWsnEB/ijE
         Q5zNy7e5pDPJkg0bZ+ia2/gbsb6hJ2SfnWF5n9uu2icJTFMbM4iQn5tdM5HYQzCFhxNC
         /TqKI40K/647eHp8R6GDPaMOSrznM2teyu33iUx6rkdXQi78B+EE8bWGIp8n/coEeR6a
         Vj+Q==
X-Gm-Message-State: AOJu0Yx57VmlHV6qUz2R6qYVS8xn71+rMFxPFo6rxV/KAYNBWU6pczRR
	+zxX/2BJQeHPT6E3DWSV21tpKg7DCBKoGwQUg8WMGj1CMQg9gWOvd9RzJXVQ
X-Gm-Gg: ASbGnct4mXtK5n4xbh9q7UzmdXCS8FzmY9GIj18I0bCOei7LH5EJggLaQhYw13yTTw3
	8abGeEo9HSEhS7lxTZTcCvjegjuhlgDa0/TlhchhB247gA5f1ytIS1+MnEmq8/EclCzdFC09WN5
	6LkDC4kRM+zLrrXJMtygm7NTXd292IWMzp5o4BVqG/esxMcPICsQILHbtTCh1P3PTUizkVWID6Y
	O3+l1y+++DY0DqXx5tqp/JCOZRuqKwCP52Eiedtvnv+YIetTiyvLNq3dK2zlJFZ9KXRFa58Mziz
	Gj0EQqFz/NiSeVIM0JYVGwxqFgmd
X-Google-Smtp-Source: AGHT+IGsdF3fKX3cJ2KRuitaJlgpR+UnDzlc2h1mXbSHGHSb/DjtM3rjsSLg+gI1yivd8VZj1+76iQ==
X-Received: by 2002:ad4:5f0e:0:b0:6d4:1ea3:981f with SMTP id 6a1803df08f44-6d43785dbb8mr84314036d6.40.1732163744186;
        Wed, 20 Nov 2024 20:35:44 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4381377cbsm18364116d6.122.2024.11.20.20.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:35:43 -0800 (PST)
Date: Thu, 21 Nov 2024 04:35:40 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: simon.kaiser@phoenixcontact.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] classes/image-oci-sloci-image: Allow
 labels to have spaces
Message-ID: <Zz64nDxGQh9gbya9@gmail.com>
References: <GV1PR05MB9724DECE44E633581768ED6BE7592@GV1PR05MB9724.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV1PR05MB9724DECE44E633581768ED6BE7592@GV1PR05MB9724.eurprd05.prod.outlook.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 04:35:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8990

I haven't forgotten about this. I've just been tied
up with some other issues, and will get a test setup
for this and see what I can find.

Bruce

In message: [meta-virtualization] classes/image-oci-sloci-image: Allow labels to have spaces
on 12/11/2024 Simon Kaiser via lists.yoctoproject.org wrote:

> Hi all,
> 
> I tried to use the sloci-image as backend for the container-base.bb recipe.
> Everything works fine until I want to use spaces in the labels.
> 
> My setup is only using the poky(Tag: yocto-5.0.4), meta-virtualization(Branch: scarthgap) and my meta-custom with a single bbappend of container-base to reproduce this behaviour.
> 
> meta-custom/recipes-extended/images/container-base.bbapend:
> OCI_IMAGE_BACKEND = "sloci-image"
> OCI_IMAGE_LABELS = "key=value key1=value1 key2='value 2'"
> 
> I quoted the space in the variable like described by this patch for the umoci backend:
> https://lists.yoctoproject.org/g/meta-virtualization/topic/102005707#msg8391
> 
> The variable oci_image_label_options contains corretly 3 --label with the expected key-value pair.
> https://git.yoctoproject.org/meta-virtualization/tree/classes/image-oci-sloci-image.inc#n25
> 
> So I decided to add double quotes to the variable to keep the space inside the variable:
> diff --git a/classes/image-oci-sloci-image.inc b/classes/image-oci-sloci-image.inc
> index 9248489f..ec98e462 100644
> --- a/classes/image-oci-sloci-image.inc
> +++ b/classes/image-oci-sloci-image.inc
> @@ -22,7 +22,7 @@ IMAGE_CMD:oci() {
>      oci_image_label_options=""
>      if [ -n "${OCI_IMAGE_LABELS}" ]; then
>         for l in ${OCI_IMAGE_LABELS}; do
> -           oci_image_label_options="${oci_image_label_options} --label ${l}"
> +           oci_image_label_options="${oci_image_label_options} --label \"${l}\""
>         done
>      fi
>      oci_image_env_options=""
> 
> For debugging purpose I printed the whole command from classes/image-oci-sloci-image.inc and printed the incoming parameters from the sloci-image script.
> 
> First I run my changes with the bitbake command:
> build$ bitbake container-base -k
> ...
> sloci-image  --tar --arch amd64 --arch-variant "" --entrypoint sh --cmd "" --author oe.patch@oe   --label "key=value" --label "key1=value1" --label "key2=value 2"    ${TOPDIR}/tmp/work/qemux86_64-poky-linux/container-base/1.0/rootfs container-base-qemux86-64.rootfs-20241104125622.rootfs-oci:latest
> Amount: 20
> Value: --tar - --arch
> Value: --arch - amd64
> Value: --arch-variant -
> Value: --entrypoint - sh
> Value: --cmd -
> Value: --author - oe.patch@oe
> Value: --label - "key=value"
> Value: --label - "key1=value1"
> Value: --label - "key2=value
> Value: 2" - ${TOPDIR}/build/tmp/work/qemux86_64-poky-linux/container-base/1.0/rootfs
> Usage:
>   sloci-image [options] ROOTFS NAME[:TAG]
>   sloci-image [-h -V]
> 
> Create a single-layer OCI image with the given rootfs.
> ...
> 
> The space by "key2=value 2" causes an line break after the space so the key-value pair is splitted and 2 will be misinterpreted as ROOTFS from the script sloci-image.
> 
> For further investigation I used the devtool to call that script manually.
> build$ devtool modify sloci-image-native
> ...
> build/workspace/sources/sloci-image-native$ ./sloci-image  --tar --arch amd64 --arch-variant "" --entrypoint sh --cmd "" --author oe.patch@oe   --label "key=value" --label "key1=value1" --label "key2=value 2"    ${TOPDIR}/build/tmp/work/qemux86_64-poky-linux/container-base/1.0/rootfs container-base-qemux86-64.rootfs-20241104125622.rootfs-oci:latest
> Amount: 19
> Value: --tar - --arch
> Value: --arch - amd64
> Value: --arch-variant - 
> Value: --entrypoint - sh
> Value: --cmd - 
> Value: --author - oe.patch@oe
> Value: --label - key=value
> Value: --label - key1=value1
> Value: --label - key2=value 2
> Value: ${TOPDIR}/build/tmp/work/qemux86_64-poky-linux/container-base/1.0/rootfs - container-base-qemux86-64.rootfs-20241104125622.rootfs-oci:latest
> 
> The manual call of sloci-image works fine, so the issue must be in meta-virtualization/classes/image-oci-sloci-image.inc.
> Can anybody help me with this issue?
> 
> 
> ﻿Best regards
> Simon Kaiser
> PLCnext System Functions
> Business Area Industry Management and Automation
> 
> Phone: +49 5281 946-1517
> mailto: simon.kaiser@phoenixcontact.com
> 
> PHOENIX CONTACT ELECTRONICS GmbH
> Dringenauer Straße 30
> 31812 Bad Pyrmont, Germany
> www.phoenixcontact.com
> 
> 
> 
> ..................................................................
> PHOENIX CONTACT ELECTRONICS GmbH
> 
> Sitz der Gesellschaft / registered office of the company: 31812 Bad Pyrmont
> USt-Id-Nr.: DE811742156
> Amtsgericht Hannover HRB 100528 / district court Hannover HRB 100528
> Geschäftsführer / Executive Board: Hans-Jürgen Koch, Dr. Martin Wetter 
> __________________________________________________________________
> Diese E-Mail enthält vertrauliche und/oder rechtlich geschützte Informationen. Wenn Sie nicht der richtige Adressat sind oder diese E-Mail irrtümlich erhalten haben, informieren Sie bitte sofort den Absender und vernichten Sie diese Mail. Das unerlaubte Kopieren, jegliche anderweitige Verwendung sowie die unbefugte Weitergabe dieser Mail ist nicht gestattet.
> ----------------------------------------------------------------------------------------------------
> This e-mail may contain confidential and/or privileged information. If you are not the intended recipient (or have received this e-mail in error) please notify the sender immediately and destroy this e-mail. Any unauthorized copying, disclosure, distribution or other use of the material or parts thereof is strictly forbidden.
> ___________________________________________________________________
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8963): https://lists.yoctoproject.org/g/meta-virtualization/message/8963
> Mute This Topic: https://lists.yoctoproject.org/mt/109535848/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


