Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDC9C36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 02:23:01 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.4402.1743560575504553970
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 19:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FEihIIpv;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5aecec8f3so969591985a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Apr 2025 19:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743560574; x=1744165374; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rsSKSUpVd+bi+KSt5jKeu+0TlI38Jxy8qlLtmg7pA3Y=;
        b=FEihIIpvs9/E+08NTvSSvdBGSU0toythvRVOY+sojsJsq6Lw/tTsOriDRCE9pHSOAO
         JH6xd008ekYTFn2qAdWniaOVviTRSTISkhK4H64mT2OIlYb9JFXvMQakCoGvOxAYs3DV
         i0Him+9KJNw/axevSh+o8xm9EsHMCNP5ZORlyyDx1Zs/Nmh5LUDeHkH7caK1oZTyBjGp
         K0AfB1W6DtNxRYRIl6ego3OIOObB0bjyyB2bkUhBN/TBx2HI5YCujzlRqnk/nnswcQus
         q88z8o8/DbIB9b6cwdAv3DJA5LhJDuYEHtnVsjjCAiHUCReeZKlhlsb0zI9164wb3A7y
         80NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743560574; x=1744165374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsSKSUpVd+bi+KSt5jKeu+0TlI38Jxy8qlLtmg7pA3Y=;
        b=eVc7pRiNoc3ecg/6a1gZNPZmBw7La3eNghT/Z2w6HSSMS+FbFZBSvfbvZXMqkX5yMc
         B76gontKrwDV68ck0nNXDZNGnhVQEWLHzkzMjnhZhDQCXb3mVCU7dX/6zs+7EzkNmlUQ
         UPAIJiIiLzwp5XDuS/mjPCnTDdVaWwYxtfJa1boDqGWqp+G/uhWCcTPIfQrGNemeb8OL
         0n3/93Es4eJOkXHUVxPGBrMd6v0kjY0pcCT3xYruiV6qciq4l8Yt5w0tIp15XKbTDvH1
         PUYcMae5G30YwKmRXdkTOtJ68IkpIgoVGUHgHNvCUYqS682xQvKF1f2WT/rn2wLWL/Kv
         HC0g==
X-Gm-Message-State: AOJu0Yzk631PQNdEWd3HHK8U4gFCoOsl8PTq/jHfWuBaW3yleytAfgJw
	fjFJCexEkGWRn39FsvjnswJZsyC2ergo1nB3DAxTaYCtnD/hS1RatfMjyR5BAYU=
X-Gm-Gg: ASbGncsDpfmC+K17JgYQSmCvWzHqKEtzGCkmBIXKY1FGmcJ1R499aOCikoM6rtuWvxD
	TBhHmXOTFcptU4E0qj67sKMOPxpxvcCHK8mcMX1Ig1cpHoCvOm1gfAikei+ZAqTGxOvnOuZNLWD
	6zySJhNAJuT9qhQuwjyZDmZ0cqDyWzsCwYAYliHJCbLSq7WBWQFbZkVsCM41Cwcu64+fd/JE5J2
	FiyXPVUWaNnbhHci72JTbj5CRpI4RlYsyWyCfrhGWReg0wv8ngYtj7XG+eQiWODmi4XTCG/WuVO
	o9hvVoX5UVkSEBcy0KG9RiYq3PdEDz7y9wHCP7XlqeSt7foI16rxcv3BdIqJtmETLCmWKOIVGpv
	a7/F/BPsQFUD7ek/dDzboirQ=
X-Google-Smtp-Source: AGHT+IFw9vZZVIR2/OJT8EKlpHYC1pAmQgCmmEt4pBF+O1CYIWsgJ1tGcxlJjQSS0rkWw+QevomOAg==
X-Received: by 2002:a05:620a:c51:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7c68c17ab4bmr1829902285a.14.1743560574457;
        Tue, 01 Apr 2025 19:22:54 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f777ced1sm731893285a.100.2025.04.01.19.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:22:54 -0700 (PDT)
Date: Wed, 2 Apr 2025 02:22:52 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: praveen.kumar@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] buildah: upgrade
 1.26.8 -> 1.26.9
Message-ID: <Z-yffHK4WnqM0kC6@gmail.com>
References: <20250327073528.3203099-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327073528.3203099-1-praveen.kumar@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 02:23:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9186

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 1/1] buildah: upgrade 1.26.8 -> 1.26.9
on 27/03/2025 Praveen Kumar via lists.yoctoproject.org wrote:

> This upgrade fixes:
> CVE-2024-11218
> 
> Changes in this Upgrade:
> =========================
> This upgrade from Buildah 1.26.8 to 1.26.9 includes important security and stability fixes:
> - Fixes CVE-2024-11218
> - Resolves TOCTOU error when bind and cache mounts use "src" values
> - Fixes cache locks with multiple mounts
> - Enhances volume handling and mount label options
> 
> For full details, refer to:
> https://github.com/containers/buildah/releases/tag/v1.26.9
> 
> Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> index 45d7b31d..10597d8a 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV_buildah = "e2feca77516568553dc1318019cea90ae000e0f3"
> +SRCREV_buildah = "9aaa280f29910a9a0a13b83dd522508f1fa40a91"
>  
> -PV = "1.26.8"
> +PV = "1.26.9"
>  
>  inherit go
>  inherit goarch
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9178): https://lists.yoctoproject.org/g/meta-virtualization/message/9178
> Mute This Topic: https://lists.yoctoproject.org/mt/111932455/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


