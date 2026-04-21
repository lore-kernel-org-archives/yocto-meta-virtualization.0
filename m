Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F34FF5A8D7
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 02:36:54 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4867.1776739006509708009
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 19:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iqM9p9zJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb5c9ba82bso653816885a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Apr 2026 19:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776739005; x=1777343805; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PXpJqRDL+rcXn9/xSFz6kknPt8s7FIBAOl0scBhDO2E=;
        b=iqM9p9zJvShqiXf5RR0cEKAOD6mFho/Ff/zFXDm+mxlMOyAuK6f3WyYaFEs8lgozNw
         +jM2LKaEkdED1ZwE1kLtJyBRwkm9uHwa6CmMAPhJWYA/Abe31RZtIWVaHukp27ki0+1A
         UwXkWbNt/e/uKXh/apBlATRxJXY8DknACWKk5mSmG+CmlER/FYZ75Pb2JWplebz7ewcL
         wgsfhNENnM5LjYtnrMHtTJY3ELHANoA80nBieBOQP/slzm481idJ7KP8lLli6Ff+JqXF
         CNJSYsUjf0VmsBeWM/tL0EN0G8MYKrKKHPfUtyljjmJkuirfhelhUoAO6Oxa4Zf3T7de
         v49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776739005; x=1777343805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXpJqRDL+rcXn9/xSFz6kknPt8s7FIBAOl0scBhDO2E=;
        b=hqti3kA3LDet2NOXUHA1xWECLRWVLzAN3FSA0MGazbaNjWOZG1bjdOXgO6J0mfQQUm
         If2471CrjG5O1i6irA0zkQn3HgbF0IJxdSDbx+Vn32AJhbkacxWUnPB59JLVps61brWd
         CTpYsdq7StMFCPzJN0WcCZroow9Xn8QlIyyL9laCzBCjgW6R3INFhNT64nYY22ntnrdw
         imabGh27BfMjMRvd/y3fff/En6u8zirNd6fZFkhBPBuJNF0CpEUj7gglGfRdtU2+BZ9c
         PZss8KCz7MkmaWAgYSunNFlJY5I0XONweRMdMJAdc48/cnMpRfb6c+LPmcp0DgIIep3I
         QBKg==
X-Gm-Message-State: AOJu0YwVprxVpylxLTrUIQrbtkWcRZ9UnT7+4v731XnC99Ed9Ucquq67
	SZj8CmClBVNNNOhBmaswLZFWmd4ocNJ+NNa3qQhLIeEzhp6KgWvAf/ec
X-Gm-Gg: AeBDieuNskx6RqVa82ztuoEYQlp/x1DwfVWn7dNSw/wNTsb4rKiQrJswmkgu6HOUsZn
	p6RbNMF0lBDhhLck76Dz/h/o3pFtr74cBljMt/RrOzEGMbbVpDsB4cU8yk2AUqt5NT80BdWD30O
	SkHuX/FPD7rOlti96VK7iQpF6GoC2gsutRm/lH4xlFHk2oZPFbLOlz82v4NNSRTJBU5crt88R1y
	7kaPeCBCG6QXkGZS3kg2uXGZT0soaaL0f8KF83sUcQUMwWiCL6xrroCstut12hN8zyA7Ri7q2vm
	AE89ch8JtoEqfnbgHb1h4TLKWQqIJVrFAEelTRJPbz8XdjnrwwOWz3SfYM8ZISTky4lvEli9LjS
	2EYBMaqczlesR5keacphC9XokACfOqi8jTGVNUBExxmnbIfp9ID6qreLYcPzVIKBjPOQUiIZ+i0
	awGyoJVVxC53b4eMCeFDvSQ8TjogtqaO/CgHp7gdvJ0xaTySIjlIck1CJoOQm1EK83BmWvwaGiq
	S9bjpQuScXkc44GQNUCJ+98rAv6N3YUPRYVNlJmTdGCWCU=
X-Received: by 2002:a05:620a:3720:b0:8da:358a:c480 with SMTP id af79cd13be357-8e78f253e32mr2347476385a.4.1776739005454;
        Mon, 20 Apr 2026 19:36:45 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d64cc559sm965087285a.13.2026.04.20.19.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:36:44 -0700 (PDT)
Date: Tue, 21 Apr 2026 02:36:42 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hjadon@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization] [master] [PATCH] cni: Add CVE_PRODUCT to
 align with NVD CPE
Message-ID: <aebiund0DzpSIVQ3@gmail.com>
References: <20260417033700.2011573-1-hjadon@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417033700.2011573-1-hjadon@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 02:36:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9715

merged.

Bruce

In message: [meta-virtualization] [master] [PATCH] cni: Add CVE_PRODUCT to align with NVD CPE
on 16/04/2026 Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.yoctoproject.org wrote:

> From: Himanshu Jadon <hjadon@cisco.com>
> 
> `CVE_PRODUCT` has been set to `linuxfoundation:container_network_interface linuxfoundation:cni_network_plugins`
> to align with the product naming defined in the NVD CPE database for `cni`.
> 
> The NVD CPE database contains product variants for this project under:
>  `cpe:2.3:a:linuxfoundation:container_network_interface`
>  `cpe:2.3:a:linuxfoundation:cni_network_plugins`
> 
> The NVD references for these CPEs confirm that they correspond to the
> source code used in our recipe.
> 
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  recipes-networking/cni/cni_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> index f6617c1f..727a9799 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -139,3 +139,6 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
>  
>  deltask compile_ptest_base
>  RRECOMMENDS:${PN} += "iptables iproute2"
> +
> +# Add CVE_PRODUCT to match the NVD CPE product names
> +CVE_PRODUCT = "linuxfoundation:container_network_interface linuxfoundation:cni_network_plugins"
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9707): https://lists.yoctoproject.org/g/meta-virtualization/message/9707
> Mute This Topic: https://lists.yoctoproject.org/mt/118870668/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


