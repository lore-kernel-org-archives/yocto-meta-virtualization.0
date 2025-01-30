Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B0FC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 18:53:55 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.2031.1738263232004039345
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 10:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cepO4fuB;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e24859f0c5so9864086d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jan 2025 10:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738263231; x=1738868031; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SKbZZ9F+PHGL674IigXcpjGMi/cx2Ljcf2wo/YvZ2n8=;
        b=cepO4fuB6WcjS5+4q8i7OZ69NzHePwr9eXEsicAuF3bALJ9tuvJ0iXFZBOIAWXx/u2
         kFPDlhjKs3WtMAeOEbgmGJpIE/V9RVRbuAmYI8Vo5e92B+s0aCgrxE23pKwOm/Gvys5T
         EsQhjguoFYWMKYwQD40jyLoVscEtL4yORArD5GBTI8qUfPs+ZBtPc1ARAS3jBQN8aKjn
         ejVgPosYxi8qGAGe6s/WRX30OVVppxOEpzVf9zV47T/mtoGfGMZDmKw0mAIlNJDj0gmk
         MG9Itj6tWdGo6ggUWc9JX1AAHmXz6a/uPumgDtd5lVUVlQc5qPvIZE2Cu+/VEUru0PcL
         /PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738263231; x=1738868031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKbZZ9F+PHGL674IigXcpjGMi/cx2Ljcf2wo/YvZ2n8=;
        b=O4f9HbhZKdiHZPHiAnkZbKj7P5OCBMu7tRI2FxBcPWBHb8WjOGzPMEdmO//Q+cHUks
         65DBGFVVtOPSZpAvzFLYKRZ+DLLhjrNFKeyO68durt7gwkpopvqT9CcYKan3dCUBOmR9
         A78Gnw0rDHV4b7vVSj8W9NR4OlkC8zfzRMQK6AKaMR/gOyqUXrTefXKwEUwGBuS94Jun
         BbqCNndLpDpLjaS+HsViIYCIBQDMc7Jb/W1S43v0nWWxFbM1AOwL6gAtF5AkoKm0W1jd
         hVwhljb5Z1edOGIvX/36vZxPS6whD4ri/kwhYsl1OMn8I4ztypcR38KD53p4ZKeyS3sg
         VcFA==
X-Gm-Message-State: AOJu0YxGsc2QGAc0HEkmbQbfe/8ttA71UhMZ+WchwTZYCnAzeIdCV3+W
	VeC3NYgVaQTIhksk6Uyd0+pkuQnDsTztmEV7T9u8zauPd9x/eQwFEcGdlswbdNo=
X-Gm-Gg: ASbGncuNY4JpNo0+XV2Z20Iui7YGFWrT71ZbLRiLyFF/yY2IR9J7j4+ikr+jhO+ruS9
	NJg5kQ7ICHzSHHjPwFB1YZ0YwV1NOQ5/m5XF5awuSSfeR7tal78BjeIkISTVHn/kvItovEhlLzO
	5qHjgKCC5/yovGrsFpSgww62itW0Mzmw+ZgU/3inBTvVFh49ZKYJ2T60iDAn8ZSBrDVo36P248F
	yvesHMEzHOqiyIT0qFxY7AqM1Fe5/6Nx/uopQYYbc40ZesqYy3H0AgYYE94vDu250nzZGNzBVxz
	FWzxhfQ8JloFRjSQZ6g4LMCZKhV30SiG4guKK2LWzqKM58nxCvCsy6B67Fxo0F1LwxqD5w==
X-Google-Smtp-Source: AGHT+IE9elttR8yCddblSCFLpK5VQqr7f9PRoTXePmE6rfn/DycE7JGoxiXjGzU92SE1636XkSIn0g==
X-Received: by 2002:ad4:5de3:0:b0:6d8:aa04:9a60 with SMTP id 6a1803df08f44-6e243befce7mr128501576d6.7.1738263230973;
        Thu, 30 Jan 2025 10:53:50 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2549225e8sm8824826d6.88.2025.01.30.10.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:53:50 -0800 (PST)
Date: Thu, 30 Jan 2025 18:53:48 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/3] cri-o: update to
 1.30.8
Message-ID: <Z5vKvJRw0jkORaEV@gmail.com>
References: <20250122022714.1792229-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122022714.1792229-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jan 2025 18:53:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9113

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/3] cri-o: update to 1.30.8
on 21/01/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The following two patches are dropped as they are in 1.30.8:
> - CVE-2024-5154-0001.patch
> - CVE-2024-5154-0002.patch
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 4e17a7cd..1d0aa72e 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -14,7 +14,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
>   - Resource isolation as required by the CRI \
>   "
>  
> -SRCREV_cri-o = "5aff11c7c1afdc785adafd7da3c3f2a6ac51b88d"
> +SRCREV_cri-o = "359f960f46697517f048e6ff3caf728ae75cb384"
>  SRC_URI = "\
>  	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.30;name=cri-o;protocol=https \
>          file://crio.conf \
> @@ -26,7 +26,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
>  
>  GO_IMPORT = "import"
>  
> -PV = "1.30.0+git${SRCREV_cri-o}"
> +PV = "1.30.8+git${SRCREV_cri-o}"
>  
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES ?= "seccomp"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9103): https://lists.yoctoproject.org/g/meta-virtualization/message/9103
> Mute This Topic: https://lists.yoctoproject.org/mt/110746674/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


