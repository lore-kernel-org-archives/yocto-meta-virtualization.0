Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C487C36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 02:22:01 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.4178.1743560519116586612
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 19:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A74maOlo;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6df83fd01cbso31029486d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Apr 2025 19:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743560518; x=1744165318; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=984uOAeKgL3BGIuvE/akU/4yL5s/2sMz0j9rT9w1ZGY=;
        b=A74maOloo8pnl3Xa5DkV3MJRv7MFHMekcNCBTO/qYLnqfx6PaQ2+ngWykirpmbJbKl
         EIAExHbZeID9cOl5gySNPfEYsX0zjsh2wL2xUSSoWMbVrbfMEUTZInagYleiT2CciFqz
         fK67T7kEI1B8IqbuYd4BuNO7ehkZzO+Xl0UwNSS21bF8Jd6kvxEawkWJGDtMPNr5vUrv
         du7rjXc/hkznLxNrW9JmduRArR8/NYzx1RoD6TJmtlGYI+drd/JeA6Hyn/Rb7A+K0WET
         qomMSUt3tVlCmt1DJ/XFOzoYNVdotvosXBSYkR5VPKE2ccx3ylCS8zZTXbWtP6REjmq1
         U9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743560518; x=1744165318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=984uOAeKgL3BGIuvE/akU/4yL5s/2sMz0j9rT9w1ZGY=;
        b=Yz4nJGe36onfbmmmcvIksPUAGpmarmpHaOcT3Ca804B4OwcWwGVcmn7KYHHRz2CbyZ
         VYqVjtIXAK9bUub/+Xyhskx5i27JLP6DDlpBTt2AKVdDTJ6RaBqZ30nyvh0USd+hYVDb
         SSMovgexftEk4Hsdv4ax61P5rqgF4QMxK5/Q2Zf/s8MZe+YiTkTZGXxWszjD2pAXAROf
         6nxj2eZs7HhfjTMcnStfL3DlrQP3rPWaxB08NeCcViDAjdGCEzYaUQkgT0EBjaeemD8x
         CjG4M2msRvTkqTWYrfNaRDKP2wOFYe0O5YY2mOSgE/OZrhWj1mLgbizrfXsEPfXkN41S
         g65Q==
X-Gm-Message-State: AOJu0Yw3qLnvDZljexUMMnZzqvVeQFu11UVGu4kEuTaURQgNDH9rsrmi
	sM5BVTsZixqgubB33DJPwZ3NX9vOBgSA+AmSHAFQyAvPOGzdhCIHLkpQT6g96iI=
X-Gm-Gg: ASbGncu6qBr51t7p8DhNGbkj0h6rvYa0tSu7wzKGHqsl9ipEKMnxoyqL5dFtCKqxpfe
	+7hysHbS8MerwhlZ3T1LY8sEL9klmld40l1jN+XwIb0BsCNrRBvnd+/KSjlGjqe/h2AGtea20zp
	76gdm7VeKHTOC272pNdI2fdCEOH85TEOFw+eZQ9eZixswp512IV+tBTp5NAUcYRoqOQceZ8DYmq
	7X5fO4PYR6Ca9RmNCHjitIbzwJwVbCQsM8NZcAW3AauDvRku+nZMYwPtyS7JiUf/Qk6rzXCjXsb
	8LVM5tdPs9bNHaBNDWDvlcXBcnJyCiyo8BZly+Tzfi66as/V/yj2Rx1TurB/duerv+TWE8+NbMj
	EZxxHqFtxeF1SmYioWHM1Q2w=
X-Google-Smtp-Source: AGHT+IEYFqP3LV7QaqwT8pREvSfP/RlRx07wuh9MdLNPqrPLXSI8Sp30kkt9VjPLd5ucg17AAdGUrA==
X-Received: by 2002:ad4:4ea8:0:b0:6e8:9a55:824f with SMTP id 6a1803df08f44-6eed5f60fddmr195586296d6.6.1743560518054;
        Tue, 01 Apr 2025 19:21:58 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7659ad8sm733543885a.22.2025.04.01.19.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:21:57 -0700 (PDT)
Date: Wed, 2 Apr 2025 02:21:55 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: praveen.kumar@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/3] docker-moby: Fix
 CVE-2024-36620
Message-ID: <Z-yfQ5kffuhkv696@gmail.com>
References: <20250326195009.757247-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326195009.757247-1-praveen.kumar@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 02:22:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9184


merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/3] docker-moby: Fix CVE-2024-36620
on 26/03/2025 Praveen Kumar via lists.yoctoproject.org wrote:

> moby v25.0.0 - v26.0.2 is vulnerable to NULL Pointer Dereference
> via daemon/images/image_history.go.
> 
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-36620
> 
> Upstream-patch:
> https://github.com/moby/moby/commit/ab570ab3d62038b3d26f96a9bb585d0b6095b9b4
> 
> Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |  1 +
>  .../docker/files/CVE-2024-36620.patch         | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2024-36620.patch
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index 0abb0b3f..a1879ed2 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -56,6 +56,7 @@ SRC_URI = "\
>  	file://0001-libnetwork-use-GO-instead-of-go.patch \
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
> +        file://CVE-2024-36620.patch;patchdir=src/import \
>  	"
>  
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2024-36620.patch b/recipes-containers/docker/files/CVE-2024-36620.patch
> new file mode 100644
> index 00000000..7bce4137
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-36620.patch
> @@ -0,0 +1,40 @@
> +From ab570ab3d62038b3d26f96a9bb585d0b6095b9b4 Mon Sep 17 00:00:00 2001
> +From: Christopher Petito <47751006+krissetto@users.noreply.github.com>
> +Date: Fri, 19 Apr 2024 10:44:30 +0000
> +Subject: [PATCH] nil dereference fix on image history Created value
> +
> +Issue was caused by the changes here https://github.com/moby/moby/pull/45504
> +First released in v25.0.0-beta.1
> +
> +CVE: CVE-2024-36620
> +
> +Upstream-Status:
> +Backport [https://github.com/moby/moby/commit/ab570ab3d62038b3d26f96a9bb585d0b6095b9b4]
> +
> +Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> +---
> + daemon/images/image_history.go | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/daemon/images/image_history.go b/daemon/images/image_history.go
> +index dcf7a906aa..e5adda8639 100644
> +--- a/daemon/images/image_history.go
> ++++ b/daemon/images/image_history.go
> +@@ -41,10 +41,14 @@ func (i *ImageService) ImageHistory(ctx context.Context, name string) ([]*image.
> +			layer.ReleaseAndLog(i.layerStore, l)
> +			layerCounter++
> +		}
> ++		var created int64
> ++		if h.Created != nil {
> ++			created = h.Created.Unix()
> ++		}
> +
> +		history = append([]*image.HistoryResponseItem{{
> +			ID:        "<missing>",
> +-			Created:   h.Created.Unix(),
> ++			Created:   created,
> +			CreatedBy: h.CreatedBy,
> +			Comment:   h.Comment,
> +			Size:      layerSize,
> +--
> +2.40.0
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9174): https://lists.yoctoproject.org/g/meta-virtualization/message/9174
> Mute This Topic: https://lists.yoctoproject.org/mt/111924192/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


