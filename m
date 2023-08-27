Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7147EC83F29
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 13:27:03 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.27028.1693142819792738130
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Aug 2023 06:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JCXX9AOm;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-64a5bc52b0aso16679606d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693142819; x=1693747619;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=axAOubsMdzbk1u17jruomDOek3Q11NiJ4feP4oyaWH4=;
        b=JCXX9AOmLN3bRVNEgshaTiYBrQy1wbp5QxBvxoXWutDedHPcsG9zyidncENHVrkCY7
         avq9tr+5wd7K2ENRMgl8Fn6Dkp5VNe064JiJPWGI1lMXwvCcEaVwZIsqyBkTs1yrMfJE
         DmhginqARi7/dtKstiYwcuDZXH3g/ZcD891VE9b3e28Z0IYPlQTtKkjggB6lxdUK7f6v
         bpGa209p4TVUp/BDDgZ+CVk7W37Fckqm1NbZ7fdf5kg4n/PZ+b+gmWqktcS1ngICLyPP
         uUx8X6EXRyI/8uyyAr1Nv0Ehm+LbxjCyluVv2vtbPP+uwVsoVgFKqTZL+yydWM6zVcB5
         UtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142819; x=1693747619;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axAOubsMdzbk1u17jruomDOek3Q11NiJ4feP4oyaWH4=;
        b=Gu1eP5YT8wxBjxNLCmWLAj9w5rwIyLTfA03fXMATHExLKnnCPqQ/U9mF+sLjScrasd
         DVGKKrkt8cQkwgoTsYcIT8GqB83HFF1RQK/hlkyJhOSR129J9KcsOQ4HaMN2rxfJBr6W
         hB7gGNN2ek1PlT8DEIxdJYVL3GN6kB/1mU7dWNq5tcgfjvf+ForfVO6xpLfHqbrFsNek
         0Z5/fS2GqRaufzBlMtzTsQ3lK4LyOLxToSdac/ls2ZPqCGVB3VtS7YNjX+0BbKYtkTHP
         n7K3b4mE3IaF4uN0QlqLIhHOz1s2TvieG3NevwXqKfBpBdmqvh59trJSLrYT4Zdwpn94
         YrHQ==
X-Gm-Message-State: AOJu0YzhzKKdk/OtFnum4wVadap7F0Uf2J6glDg/hh336ya4Xmzli+Ha
	NfYURgD/zcl9m3dDF//BG7M=
X-Google-Smtp-Source: AGHT+IG2DESO2vluBhZ09zeFfdppPGcZEU2L01LAm6yZ8dsxCR4YOzZV+MYW7bqAKtR1DsrlnTa22A==
X-Received: by 2002:a0c:cb8a:0:b0:64b:997f:5a73 with SMTP id p10-20020a0ccb8a000000b0064b997f5a73mr23708348qvk.0.1693142818842;
        Sun, 27 Aug 2023 06:26:58 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id h3-20020a0cf203000000b0062ffbf23c22sm1891364qvk.131.2023.08.27.06.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:26:56 -0700 (PDT)
Date: Sun, 27 Aug 2023 13:26:54 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick@subset.ch
Cc: meta-virtualization@lists.yoctoproject.org,
	Patrick Wicki <patrick.wicki@siemens.com>
Subject: Re: [meta-virtualization][PATCH 1/2] netavark: require iputils for
 ptest
Message-ID: <ZOtPHp6uyMENtHyd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825145148.234559-2-patrick@subset.ch>
 <20230825145148.234559-1-patrick@subset.ch>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 13:27:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8238

Thanks for doing this against master-next!

I'm out of the office for another week, but have put
this onto master-next and will complete the merges
once I'm fully back to the office.

Bruce

In message: [meta-virtualization][PATCH 1/2] netavark: require iputils for ptest
on 25/08/2023 patrick@subset.ch wrote:

> From: Patrick Wicki <patrick.wicki@siemens.com>
> 
> Fixes ptest not working on systems using busybox ping.
> 
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  recipes-containers/netavark/netavark_1.7.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/netavark/netavark_1.7.0.bb b/recipes-containers/netavark/netavark_1.7.0.bb
> index 43c3ee5f..490d8762 100644
> --- a/recipes-containers/netavark/netavark_1.7.0.bb
> +++ b/recipes-containers/netavark/netavark_1.7.0.bb
> @@ -44,6 +44,7 @@ DEPENDS += "protobuf-c-native protobuf-c"
>  # bind-utils is used to install dig
>  # procps-ps is necessary because the ps from busybox is
>  # not having the same behavior
> +# iputils is used because busybox ping behaves differently
>  RDEPENDS:${PN}-ptest += " \
>      bash \
>      bats \
> @@ -51,6 +52,7 @@ RDEPENDS:${PN}-ptest += " \
>      coreutils \
>      dbus-daemon-proxy \
>      iproute2 \
> +    iputils \
>      jq \
>      nmap \
>      procps-ps \
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8231): https://lists.yoctoproject.org/g/meta-virtualization/message/8231
> Mute This Topic: https://lists.yoctoproject.org/mt/100956964/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][PATCH 2/2] netavark: skip plugins in ptest
on 25/08/2023 patrick@subset.ch wrote:

> From: Patrick Wicki <patrick.wicki@siemens.com>
> 
> Skip the plugin tests that were introduced in 1.6.0 and lead to ptest
> failure.
> 
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  recipes-containers/netavark/files/run-ptest | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/netavark/files/run-ptest b/recipes-containers/netavark/files/run-ptest
> index 41a37dce..7e017ae2 100644
> --- a/recipes-containers/netavark/files/run-ptest
> +++ b/recipes-containers/netavark/files/run-ptest
> @@ -1,3 +1,8 @@
>  #!/bin/bash
>  
> -NETAVARK=/usr/libexec/podman/netavark bats ./test/
> +shopt -s extglob
> +
> +# Skip the plugin tests because those example plugins are built only while
> +# running cargo test and for this to work as a ptest they would need to be cross
> +# compiled and installed as part of the ptest.
> +NETAVARK=/usr/libexec/podman/netavark bats test/!(*-plugin.bats)
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8232): https://lists.yoctoproject.org/g/meta-virtualization/message/8232
> Mute This Topic: https://lists.yoctoproject.org/mt/100956965/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



