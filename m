Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB1CF31E3D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:39:17 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.132684.1775742750719089740
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 06:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fGeZ3rH0;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c745e18a0so168089366b.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Apr 2026 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742749; x=1776347549; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Gsg8h9T6A18aIknxchT0fzXIhIq3bmIrYZRyU+WRp8=;
        b=fGeZ3rH0aX+gvlsLB46vku+5W1eOteMJs3G3qi7BfOIhZxlycGzk002vd8GuSzjQ1B
         fmx0/Z08LsxdIdDJKZ7K+aJ4oHNZVpoXxIJyMlgYexfdY8IWiYluJlbmlCWJBqdlmdvK
         HTJ03lTiy4db46HmR2qZhmDo486vTr7ifZ4Fmw7xgDiJz9hWdvCw03mwsjB6t7J1/pfn
         XsIgo4xpAgJt9GoWl+cpKm9Y6NqTfplrrgNH2JiDjKB/06MauLcor+mCUe3TAvFmeDpc
         1zJ9uJTSc3Ep+P+NyEg4K7LkcsniNpZOIKMgzkqBqf2qijTy8BQkMQnCTBGbr6ZW1NxU
         7pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742749; x=1776347549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gsg8h9T6A18aIknxchT0fzXIhIq3bmIrYZRyU+WRp8=;
        b=kH6/gOfNWni5oWtyx/yJUy3j7ox6RrseX2mCZBcxDx0xFQFh0hs23X9AkgxeHSlkun
         kptqIBJq9jNY4SNMxlZhG7NWYG0xqFynru9+Eswxf4unaLGVmRS74CM5a3RMvI3SYXS0
         FXNmFC9pXb4u6xYE0rEzVdkQ5xfhM0qfp9WfgWUsMtmr8MVOLFdlb7QwFg+i89HbkmRY
         GBpGuSHMIGyjo8WzcW9sz+Uma6F7dvyXPCx+LxarKilcpydwE+KK2qxQRjmZdUjLdGN9
         ZTSjJKCDpj3BKj0TIP2xrleNdadMZcLh2pjb9Nwc5B4OzdJ+7Penay4VBgZ7Dt1r8k/g
         qdsw==
X-Gm-Message-State: AOJu0YwwwJHvtA63iCd4dDYc46Vqd0BnZD3S62IKzLzgdSU1Ubv1BI2k
	wXmi4Ojq+kVtgVwhO/9/TNXZ71qCCk/HzgZDthU/VqMem2XqkXj0wPLSskfBiphl
X-Gm-Gg: AeBDiesU2byap9sjb9MjyyT+ieAy2+lO3KGNjwt/tFn1GMZzdwF+TiJS3wEC8rHycSr
	ZUDqnC2Bz069rHJxdTXEGQGzxjNRoJkuQSZ+2Gh40e4LHBzZQMhvcVf+E53aRjVCgODp1+k5jBs
	Sl01+KXWo+K3W0JEG7lp21z5ODB/VVZIv5hKiHkEWryhheVinapj0NvrsEFjq3D8W+BLTeZ9+Dt
	zbetjgL/F/OmY0QpeaoRxJTknR8zHZhNj/P0AiJfwcdDPBS8uWwSDrG+mxHCfOAapWIAVJXgLrW
	Vr//Ob/wKaiawafl8We7BYcdS7H3RQQbQnEA/AI8ZHDHaCQUtPs3yg9CuQBMH/2N3PYXwEmElR7
	EUaWZdbBFLA4BHRMa8O+xcBMd2HOMluAmXFnSrp0FusJCO0s3spqLkfN4pb2s9qPyPsxH4DXEKa
	ITHhxG8FERTEe7rcD7MBRgUBmaTKCza7mGAclq596NPUCdsGacTJA0IgbpnW5tW4L9P7UjqaJhp
	aakoBCzfhPMFNZ0XW9TWc0i7nJmvBwRlKo6ewSs8VIkzl4=
X-Received: by 2002:a17:907:26cb:b0:b9c:617b:4a36 with SMTP id a640c23a62f3a-b9d46227ffamr196695666b.21.1775742748730;
        Thu, 09 Apr 2026 06:52:28 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3a6a493dsm114487466b.62.2026.04.09.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:52:28 -0700 (PDT)
Date: Thu, 9 Apr 2026 13:52:25 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ricardo.salveti@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] wic: move files to files/wic
Message-ID: <adevGRwEYPoUWbfX@gmail.com>
References: <20260407224724.510758-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407224724.510758-1-ricardo.salveti@oss.qualcomm.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Apr 2026 15:39:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9691

merged.

Bruce

In message: [meta-virtualization] [PATCH] wic: move files to files/wic
on 07/04/2026 Ricardo Salveti via lists.yoctoproject.org wrote:

> Move local wic files to the new expected location files/wic, needed after
> the wic migration to a standalone project outside oe-core.
> 
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
>  {wic => files/wic}/directdisk-bootloader-xen.cfg | 0
>  {wic => files/wic}/directdisk-bootloader-xen.wks | 0
>  {wic => files/wic}/directdisk-xen.wks            | 0
>  {wic => files/wic}/qemuboot-xen-x86-64.cfg       | 0
>  {wic => files/wic}/qemuboot-xen-x86-64.wks       | 0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename {wic => files/wic}/directdisk-bootloader-xen.cfg (100%)
>  rename {wic => files/wic}/directdisk-bootloader-xen.wks (100%)
>  rename {wic => files/wic}/directdisk-xen.wks (100%)
>  rename {wic => files/wic}/qemuboot-xen-x86-64.cfg (100%)
>  rename {wic => files/wic}/qemuboot-xen-x86-64.wks (100%)
> 
> diff --git a/wic/directdisk-bootloader-xen.cfg b/files/wic/directdisk-bootloader-xen.cfg
> similarity index 100%
> rename from wic/directdisk-bootloader-xen.cfg
> rename to files/wic/directdisk-bootloader-xen.cfg
> diff --git a/wic/directdisk-bootloader-xen.wks b/files/wic/directdisk-bootloader-xen.wks
> similarity index 100%
> rename from wic/directdisk-bootloader-xen.wks
> rename to files/wic/directdisk-bootloader-xen.wks
> diff --git a/wic/directdisk-xen.wks b/files/wic/directdisk-xen.wks
> similarity index 100%
> rename from wic/directdisk-xen.wks
> rename to files/wic/directdisk-xen.wks
> diff --git a/wic/qemuboot-xen-x86-64.cfg b/files/wic/qemuboot-xen-x86-64.cfg
> similarity index 100%
> rename from wic/qemuboot-xen-x86-64.cfg
> rename to files/wic/qemuboot-xen-x86-64.cfg
> diff --git a/wic/qemuboot-xen-x86-64.wks b/files/wic/qemuboot-xen-x86-64.wks
> similarity index 100%
> rename from wic/qemuboot-xen-x86-64.wks
> rename to files/wic/qemuboot-xen-x86-64.wks
> -- 
> 2.53.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9687): https://lists.yoctoproject.org/g/meta-virtualization/message/9687
> Mute This Topic: https://lists.yoctoproject.org/mt/118716985/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


