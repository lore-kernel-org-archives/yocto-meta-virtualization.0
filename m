Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860BCC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 14:18:55 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web08.29381.1660745931619659732
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 07:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=adbj88L0;
 spf=pass (domain: gmail.com, ip: 209.85.167.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id o184so15492246oif.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ddWTF1Yb5vIp0Z2ZnkOo74olLVOxR0uS/X3prDCro9Q=;
        b=adbj88L0VdQ7UO0ekFYAijGbxf1CuLGfUnmI93IIl+YIA6qZKfHyaojxHd3ncA0PUf
         oB4Qudl+LNMv7uSdGgVWKoqljH+P5yCRLO4MkuMUBaI742ntSscRFwLvloosUZkY/+RQ
         Q6vC1zA9ouMQACl+ujYzJZqg/D/mybGjY6mdI7u+luYMxnZZiwL4LwVBDkDKZMM5ozxX
         WS6SufSLYSj6A96VuTOyO6LUuNWVQAr/K9Sz6tQIEpAlxZ6lcEO+RYQeAh9Eo1ea68vj
         EWy3PWiTe4CPg1pGq836yAvRBdpDkibLwLYTGbfDtuCF7Bn71KfLvlxBW5K4xKUDzZa2
         UoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ddWTF1Yb5vIp0Z2ZnkOo74olLVOxR0uS/X3prDCro9Q=;
        b=nczmLyQst97mabDcQYNdi8rbANmLGahOrNd9ew8xYqaHuUdVg4gZ0v1XnS26VmP1j1
         RpqTDQIi0PqFHmdSuo1/InAi08Az3WLe8pgPppDAPcEqUnAaP/a/NXfSYSUuh7L58T69
         1vDY8JPUrI/21YqGsXFqhgyKqImQWZOM0iiXIwToY9/HhxLLCCX9crJivf/rF1nHny5J
         w97zP6SzgAVFIIsqwVpMVHZlDNc8+8wkE3eH3QNJqxNSWA367y39MB5u0TlUnMR22Cjy
         yZjCFDalKOBvOqk+8HiZ+s8719WOM6Psw3yyTO3wM/x+a2W+baiVk/FhMaR4sqwIjrjM
         qj4Q==
X-Gm-Message-State: ACgBeo2t8eQSc1yH/fOV2YLKBCjAXNqzkm0cBDWgDB4XzP0jjSejJoAK
	VzHSc10aAk3TVJZ6aap9BQ6GlcxCm2S9fP0QNfE=
X-Google-Smtp-Source: 
 AA6agR531OyJhOPy0pRoZjTddmki8H+L4sGEm8+/t9IzJ6CVr/wibpF9V23ozUa5oudJx51XoSXDOvQ4f5G2GpHsyV8=
X-Received: by 2002:a05:6808:199d:b0:343:290a:9f4c with SMTP id
 bj29-20020a056808199d00b00343290a9f4cmr1597567oib.6.1660745930720; Wed, 17
 Aug 2022 07:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220815210243.25546-1-sakib.sajal@windriver.com>
In-Reply-To: <20220815210243.25546-1-sakib.sajal@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 17 Aug 2022 10:18:38 -0400
Message-ID: 
 <CADkTA4MX053i=kVX2xDjKVNS-6tELBoopEYLABxFPazzyTULdA@mail.gmail.com>
Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
 v15.2.17
To: sakib.sajal@windriver.com, "Slater, Joseph" <joe.slater@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 14:18:55 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7532

I also have a pending patch from Joe Slater that addresses a different
CVE on kirkstone.

Can someone look and check if it is also covered by this uprev ? Ceph
takes an incredibly long time to build on my servers, so I'd like to
avoid as many builds as possible.

Bruce


On Mon, Aug 15, 2022 at 5:03 PM <sakib.sajal@windriver.com> wrote:
>
> Upgrade ceph to latest v15.x.
> Minor upgrade containing fix for CVE-2022-0670.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} (98%)
>
> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.17.bb
> similarity index 98%
> rename from recipes-extended/ceph/ceph_15.2.15.bb
> rename to recipes-extended/ceph/ceph_15.2.17.bb
> index 17dbcf3..9fb2e72 100644
> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> +++ b/recipes-extended/ceph/ceph_15.2.17.bb
> @@ -16,7 +16,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
>  "
>
> -SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
> +SRC_URI[sha256sum] = "d8efe4996aeb01dd2f1cc939c5e434e5a7e2aeaf3f659c0510ffd550477a32e2"
>
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7523): https://lists.yoctoproject.org/g/meta-virtualization/message/7523
> Mute This Topic: https://lists.yoctoproject.org/mt/93046468/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

