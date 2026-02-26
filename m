Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8252FD8FF6
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 18:21:12 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76822.1772130068884157383
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 10:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BPIwUFwN;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-506aa68065eso12893471cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Feb 2026 10:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772130068; x=1772734868; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cP43S2UhoBunJgAW0z4yMQu9xgchzzU3BgUeAQb9PLE=;
        b=BPIwUFwNuRUD/eWjUsd1cW7M/otaQ87NDOpoUmUkeXMdY48KN07O9FjLbEzd2FbjlT
         ixPkOEtJgZnTUKOIfVONGVR9ZUGxq7lyxZkDiI4ucTrjSkLYy+AJmyfByBlR+15/PLHz
         KV+nw3NcUixlMu+q+MdXbWkGdM5rMwJMGOX0OT7gOyF1y75IXro9ADX8kJLXFuFh6Jyd
         hzekD+VyIIH52/n+QDkd7p8zXfoKpFlZq3vtHoCSGupQjtaOjW6h0ef172QD5aAGliO3
         eErjwadQmloHpQbmiwlt6ZWf2GMp5JQd3ZlOiH0FR8DjY4cWbsAyjy2PLjXP4+013sSS
         Eqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772130068; x=1772734868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cP43S2UhoBunJgAW0z4yMQu9xgchzzU3BgUeAQb9PLE=;
        b=f6ZdNYjMgzSev5hfhArWFH1bUQfdEaJILci0zwTOUNs8JFw742FyVpXYGvdN/UBH/K
         4s0bWXp1J4/yp6VPyld/Kk9B4nDs9TxgCak7onoIJ7mi8KT6ni8fqtxsKUPpo90PTP9Q
         hTBI1uKguhwrPjb1z3vHntQqfyTvYhWU+SU3s0gpWhHmAeVLdjA1dxZfkYl6dwt1E+W/
         DqMctSLVm9VMtV8AELsaVKjgXHBlVogAlg+oAWJkARZnRu520AI4LS+8cczeytIbtd0y
         PIXxE3aKlYtb3DH+OETaLy/zSBptE4iyalW5gSQ2z5ibc/wvF6ct3GdNDGrBn1kcP4Qa
         1F5w==
X-Gm-Message-State: AOJu0YzfuamhMD/0gxGBjkf59hVYonpAhHZhsPq9whDS2FVayIqyS9Dt
	ZotmkikhCBDFK9ksrX1a9MqP8pF9YxamlBL7yiOz5q7IADMffHo7dlmu
X-Gm-Gg: ATEYQzxC85UiVxTswEyHthLJcFmWiY1CCsY5pUUnnkK34RS0qL6vVE38LYch/3pCCA1
	3lkeaNwXQonaoP4QstUQWafRjtI1+aqJ0ICXJgn+e14KhXBwlLHrwKVtwiyjm8lswWiX17UxUZT
	q0TV8JHusIRBhrRgcoHiAjpR342ePRSRQNQOjWE0nan+AnF0nav2+1FCgdgfoYoizuU2MihhOzS
	8G7LC7KLP8LA1RonhhtQ5QEl6wDC7psEO6VA5IKcaJfHNxbmz+tbe9KuLDw8dL66Onz99BJPK41
	o8Id4AFxotLBuBsO3LGw0MolrdCmaz/SnmEPh8SbR2uCxvRf9gfWLNe2Qr9tawSHzCkIBQldbd5
	LXBTiT4Yik+b/lfWBRqJkTi6l2Rjy4CN0BG7rkX4oZwHvX/lrmghV07P4Ynulpyr9LLK1wn4siY
	nhyI3WdQGYheoORxqF50/wbU2izbnSZVkINsI5qlRkkdEf5WSKI4U4+dYD4I81rV3TE2YcUthsh
	XP6B/PsmCdZ7flAHdQxUh4CmFxCfkPOt0xx
X-Received: by 2002:ac8:7d09:0:b0:506:2116:4b86 with SMTP id d75a77b69052e-50745be36dfmr38048871cf.0.1772130067715;
        Thu, 26 Feb 2026 10:21:07 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73789efsm22623036d6.34.2026.02.26.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:21:07 -0800 (PST)
Date: Thu, 26 Feb 2026 13:21:05 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: felix@piedallu.me
Cc: meta-virtualization@lists.yoctoproject.org,
	=?iso-8859-1?Q?F=E9lix_Pi=E9dallu?= <felix.piedallu@non.se.com>,
	pascal.eberhard@se.com
Subject: Re: [meta-virtualization] [PATCH v2 0/4] Update docker-moby to
 v25.0.9
Message-ID: <aaCPESlDm0dhwBUy@gmail.com>
References: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Feb 2026 18:21:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9612

merged.

Bruce

In message: [meta-virtualization] [PATCH v2 0/4] Update docker-moby to v25.0.9
on 23/02/2026 felix via lists.yoctoproject.org wrote:

> This patch suite updates docker-moby to version v25.0.9 and
> removes the patches that were backported upstream for this release.
> 
> Note: This is not the latest release of the v25.0 branch but the
> latest supporting Go 1.22, provided in oe-core scarthgap.
> Updating to newer releases will require updating go to 1.23.
> 
> Signed-off-by: F�lix Pi�dallu <felix.piedallu@non.se.com>
> ---
> Changes in v2:
> - Revert ec01a803 adding CVE patches backported upstream
> - Link to v1: https://lists.yoctoproject.org/g/meta-virtualization/message/9591
> 
> ---
> F�lix Pi�dallu (4):
>       Revert "docker-moby: Security fix for CVE-2024-41110"
>       docker-moby: Update libnetwork
>       docker-moby: Update docker cli
>       docker-moby: Update to v25.0.9
> 
>  recipes-containers/docker/docker-moby_git.bb       |  13 +-
>  .../docker/files/CVE-2024-29018.patch              | 344 ---------------------
>  .../docker/files/CVE-2024-36620.patch              |  39 ---
>  .../docker/files/CVE-2024-36621.patch              |  82 -----
>  .../docker/files/CVE-2024-41110_1.patch            | 177 -----------
>  .../docker/files/CVE-2024-41110_2.patch            |  99 ------
>  6 files changed, 4 insertions(+), 750 deletions(-)
> ---
> base-commit: 78abd77b8695705e6e55266745c838bb665486de
> change-id: 20260216-upstream-update-docker-moby-d0826db5916b
> 
> Best regards,
> -- 
> F�lix Pi�dallu <felix.piedallu@non.se.com>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9606): https://lists.yoctoproject.org/g/meta-virtualization/message/9606
> Mute This Topic: https://lists.yoctoproject.org/mt/117959928/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


