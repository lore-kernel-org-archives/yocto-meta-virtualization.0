Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FF8E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 22:18:16 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.5129.1736288293889653182
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 14:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c3eK7fDI;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6f7d7e128so23606085a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 14:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736288293; x=1736893093; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oX4hy6xkULBWhvLGOubi/hdAgFl3t4v/7aJCHjy127I=;
        b=c3eK7fDIIpHCS24UApCi3QItzN94c4gOt0vFo5X5pUFjyUiszda4bW35v7lXRzwe0P
         pa3FBbt9JvA4OoV8lk7/g7IQVBTKE+cQzV/4d8GuohynE85aQtPxb6SsKKcgmJjO9ON5
         vpLpvnGJcZ0ciNT0RKVhLLlrrYhkpd/uvjyrA03D1iIucU9zuKBUcNWf9+o66SmDysQi
         QinwRo6HetDIQyGIl3YemEbu1jPtcQnrPmvH+MfLjMJKZBDrWqsohodMMzBe0dSUa0FY
         Wmrfs4W8jVefON16X62TuaOjUs9yyAjUDeAsBJ6sN3kYZcnu87KLLyZBpDQUSw5skHub
         Ibqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736288293; x=1736893093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oX4hy6xkULBWhvLGOubi/hdAgFl3t4v/7aJCHjy127I=;
        b=nn9kFj+wusZLZ6tWs35dEQ764zJjbWFA3qbQCNQZLcA4uSAHm/j4cjnGdU5m28xYWo
         TFJXkArTvej3RVsuxhh/Mt56nfrkIduSkuhzGc0DVF8KVk2ghHODBtJ0VBJ/sCX2klSd
         xEanP4h/uKcsFAW6IK3mqRVaZFG0oeCb9gDq2CWD6WyOf03PQtUYqdQN8JeLe9hgQRhi
         hjO4lRDP79NiCyeQL8xvU5yDIClBqfMnfZkNqpUvhbH4TO4xjJjUv7mCkiBYexoFvgo6
         85jEWCC5S8D5AbwP02zjXykaxBkkxMsyNpLw+RtcxwdZ66a6vQl65P6ziBmeTTxlt3+G
         atyQ==
X-Gm-Message-State: AOJu0Yy/xi6fckWV8i6BGWRUVzdI0YGaHapAW46KxEI4gNy9rACauLHP
	oiaffZTXoQdHOwfZt0OzqWnYChi73Hm2U1tm2IQqC13p2CEXuyTz
X-Gm-Gg: ASbGnctm3A7QgjMVUFVNeNTgGwydEtOeKveIN/J3RrD0wdWuCcwdQHkCk534jq5y9OQ
	bzEaE4IqATWP/XsMQMJSaUdpePugq7KEzFbhHcNYlELwWxFmXrMe5dHHyx/ldkFmkz3lJOL3P/u
	77T60j5HKx2dI4UDDGKMuPTUU2kkdslUuzHYTzaPv1Fce+tO+rZxG8WEzU9zO3YtC7Jr06guKne
	iy/iOClZTd65BoPaKiJ3kilsde7f5PFmg5UUfJXcV2S0tqRYo2nT3XzK3jKdN+NFbK8WS703Ccf
	KaTA5J5kKFqC17hVKfXXbpd1C335ox/ZQ8Y=
X-Google-Smtp-Source: AGHT+IFiY04QnZXz55PBNDWh1QEEkMvhOw17Xj+GHHv2GLzOKPrdUjmC9k+NMtmAn/kqtCGeTy2Hmw==
X-Received: by 2002:a05:6214:cce:b0:6d8:8283:4466 with SMTP id 6a1803df08f44-6df8e8781d4mr83601986d6.18.1736288292922;
        Tue, 07 Jan 2025 14:18:12 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd180eacb8sm185423086d6.20.2025.01.07.14.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:18:12 -0800 (PST)
Date: Tue, 7 Jan 2025 22:18:10 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: FlorianWickert@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] image-oci-umoci: preserve file
 modes in rootfs
Message-ID: <Z32oImpdKNsHV77n@gmail.com>
References: <20250107084020.2361279-1-FlorianWickert@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107084020.2361279-1-FlorianWickert@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 22:18:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9077

In message: [meta-virtualization][PATCH] image-oci-umoci: preserve file modes in rootfs
on 07/01/2025 Florian Wickert via lists.yoctoproject.org wrote:

> cp does not preserve file modes by default.
> This will break sudo (among others) which needs the suid flag to do its
> work.
> 
> This patch adds the --preserve=mode flag to the cp call to fix this.
> 
> Signed-off-by: Florian Wickert <FlorianWickert@gmail.com>
> ---
>  classes/image-oci-umoci.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index c77750fb..bbea2add 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -49,8 +49,8 @@ IMAGE_CMD:oci() {
>      fi
>  
>      bbdebug 1 "OCI: populating rootfs"
> -    bbdebug 1 "OCI: cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs/"
> -    cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
> +    bbdebug 1 "OCI: cp -r --preserve=mode ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs/"
> +    cp -r --preserve=mode ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs

Is it just the mode that we are concerned with ? We could
either use install vs cp, or just use -a

I remember thinking that pseudo would fix this up when I
was writing the code, but clearly that is not the case.

Bruce

>  
>      bbdebug 1 "OCI: umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name"
>      umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9073): https://lists.yoctoproject.org/g/meta-virtualization/message/9073
> Mute This Topic: https://lists.yoctoproject.org/mt/110474242/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


