Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FA0C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 18:43:44 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.21164.1690915414706241919
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Aug 2023 11:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sdsqT45t;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7658752ce2fso377052185a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 11:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690915414; x=1691520214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YkTMJhddeXphXEdOmQN/YdWPwodGhiBH5oUofo/bFeo=;
        b=sdsqT45t2lIKXnG92kaLbPJG1XdtTnJsj1fUn9PmC9DwvpX0NGslMq1Z0uJ6CePoUy
         XLvazj6IG1pZ9OSD5nwhy7eJLGcT77l3IMbh7SNl7J412WbeGunvFhPZZjkPUyduLbHg
         n0rtcsgk8n+TOUecucMW9Sfga7hcUxsZ0G932u9C563wpbNbqHoLOdg89v2E3fYOpRK8
         DEPWHJlA7Z2B98IJ0syvmXSxtE83OLwWfEBoBM/P/jIMNo/bMSJ40UmBCcBy593FRfh4
         lDXnzype6QKKbE/dQQFe6SCyP2kLv+c67ssWE7yLzCm3huMHunDi8u9iHuaPu9lG+/y+
         NsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690915414; x=1691520214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkTMJhddeXphXEdOmQN/YdWPwodGhiBH5oUofo/bFeo=;
        b=ejGubztPyFxqNUaO2S465y+tWcLTx2y6I0KA1yrx4xD+q7ZiKjEdWVWgb5jALaGuPk
         kPGQZVzwVCKl5Q28pubvfME7ZSV8k/OOdQYn0D8cq1DAYyt1t18/q/RNddF4UsvPYyCA
         A4qXnKreWlDpV4o7LkDsMtFJASnOFCBhkBFEL7mbYSoz/he0bXcTeBX1GpBJPV7xjIVJ
         FHddj7TQGtP/55hgjzeVjEM54z9e7XbQCKe2CSNDayKHhrcXM05JG4AWemyOHt/ZmAxi
         Pm+eDohHdl/YG0tqATFjxqYo6Lp8iJnIJ9fRsT0UsOCl6ERorxA8r1fiUqid13nSzVSv
         vL9A==
X-Gm-Message-State: ABy/qLY5IOX5Z7tTkI9L8axdsSC0mEw4vVgfDn3BjwfIpHHyzaNfDZSC
	LKWtEERTR7e+ixYYs9Hhv3w=
X-Google-Smtp-Source: APBJJlGh3Wz+bb+5IeG4Y5TOudSidaP9nrNajrBzAivdszVartuIRYXeLNC4Hoj7hC9Vo9McxRYNqQ==
X-Received: by 2002:a05:620a:258a:b0:768:43df:529e with SMTP id x10-20020a05620a258a00b0076843df529emr13896076qko.58.1690915413510;
        Tue, 01 Aug 2023 11:43:33 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id z8-20020a05620a100800b0076c70eccd05sm2595309qkj.108.2023.08.01.11.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 11:43:32 -0700 (PDT)
Date: Tue, 1 Aug 2023 14:43:30 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peter.marko@siemens.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] skopeo: convert CVE_CHECK_IGNORE to
 new CVE_STATUS format
Message-ID: <ZMlSUrOIF9CaJnfa@gmail.com>
References: <20230729212513.1528311-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230729212513.1528311-1-peter.marko@siemens.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 18:43:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8161

merged.

Bruce

In message: [meta-virtualization][PATCH] skopeo: convert CVE_CHECK_IGNORE to new CVE_STATUS format
on 29/07/2023 Peter Marko via lists.yoctoproject.org wrote:

> From: Peter Marko <peter.marko@siemens.com>
> 
> See https://git.openembedded.org/openembedded-core/commit/?id=34f682a24b7075b12ec308154b937ad118d69fe5
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  recipes-containers/skopeo/skopeo_git.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index e00fcc7..feff9df 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -35,11 +35,9 @@ inherit pkgconfig
>  
>  inherit container-host
>  
> -# This CVE was fixed in the container image go library skopeo is using.
> -# See:
>  # https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10214
>  # https://github.com/containers/image/issues/654
> -CVE_CHECK_IGNORE += "CVE-2019-10214"
> +CVE_STATUS[CVE-2019-10214] = "fixed-version: This CVE was fixed in the container image go library skopeo is using."
>  
>  # This disables seccomp and apparmor, which are on by default in the
>  # go package. 
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8151): https://lists.yoctoproject.org/g/meta-virtualization/message/8151
> Mute This Topic: https://lists.yoctoproject.org/mt/100434760/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


