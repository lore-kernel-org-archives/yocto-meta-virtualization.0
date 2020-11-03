Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.4099.1604439309336603099
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 13:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aDY2aD41;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 33F2538C086B
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 13:35:09 -0800 (PST)
Received: by mail-qk1-f194.google.com with SMTP id x20so16721217qkn.1
        for <meta-virtualization@yoctoproject.org>; Tue, 03 Nov 2020 13:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=ArPzA9GVjjywWFWSdNyYyvlKMow0iHZd2F6aOTjBrKw=;
        b=aDY2aD415WOIXzHM1xb1k+wGKmPrCgtXJFEd7+wgPRLE5qT52wLOB/AoLcqzek64CR
         SeXMQZvJDYRmSJ2lTfzAitgCQOEZdYH+KeOfk1IDuTC28VKe4+lIiS9UsPmT49hq2aPA
         NvmU3gIPRFh7xcevnGuX0ggpgmvWZZ8hetO68oQFHBOYTQz8Ww0UCC2V0H+gSlM4vsoX
         ASWJs9KpZ81KDMJuq8l8iQsAokeooqcI2ntgfVTlcNaZw8lLYensqHeWpHL5V5GHOdxh
         cYPmydlvoDpBvO6areRMBwUpICmSkl8G+K0IdbKcT7p+qu7wGcGUsZKCNLFFiWP2eWuT
         SvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ArPzA9GVjjywWFWSdNyYyvlKMow0iHZd2F6aOTjBrKw=;
        b=V9f0gTCrVEUG++noaMqIZIxPiUdKSVol+JAobFFkb3B6jmJmzBTgYdte1dqGQDGYli
         4sJFo4OnBuUrnfWTNfD2SIjUsBJsBKYl9nsPqboL1rGz/ozPhRYG5e9eQJKtlNCtHLR5
         7HnAdMgLR7FgC9nYXZ9RZK+jKlNBCMcURC3d/BaRviie53BNGZQ9QrUqw15kKFlH1M+x
         wfFX3z29MDckUqvShYn8//clNAjh4Pm/b+1+WmjAdh8WP69+2+Vw5wqFwyP7EQrSyarp
         OXjxD+B5dcL8fnncGxkyNBKBFrJeCCEsqLbQYoeCELtxWs4YOWBQg7gP2cWXlqpksMYm
         ywPg==
X-Gm-Message-State: AOAM5301V0Na22htwUMPHUqDTVho536XvBrTR1aFlWKV633x+3/c0Xtf
	IXSZIFGm2X9/gxuZ/mFBk7g=
X-Google-Smtp-Source: ABdhPJwWdfZpr9EEb4Ps1telb5vqk8HQxrAmD+aYjVkheyrgKmVM1cc1pWSMC9nAtsJo5aDA55WT5w==
X-Received: by 2002:a05:620a:16a8:: with SMTP id s8mr12813799qkj.152.1604439308280;
        Tue, 03 Nov 2020 13:35:08 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id 82sm11372693qke.130.2020.11.03.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 13:35:07 -0800 (PST)
Date: Tue, 3 Nov 2020 16:35:05 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-futurist: upgrade 2.2.0 -> 2.3.0
Message-ID: <20201103213504.GD40946@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1604389440-98490-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604389475-98548-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604389482-98584-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604389493-98620-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604389535-98666-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1604389552-98703-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-futurist: upgrade 2.2.0 -> 2.3.0
on 03/11/2020 zhengruoqin wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../{python3-futurist_2.2.0.bb => python3-futurist_2.3.0.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python3-futurist_2.2.0.bb => python3-futurist_2.3.0.bb} (74%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb b/meta-openstack/recipes-devtools/python/python3-futurist_2.3.0.bb
> similarity index 74%
> rename from meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-futurist_2.3.0.bb
> index 4788fb2..2e63d90 100644
> --- a/meta-openstack/recipes-devtools/python/python3-futurist_2.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-futurist_2.3.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>  
> -SRC_URI[md5sum] = "708ae19b7e3bef70b47166da1e72392c"
> -SRC_URI[sha256sum] = "3601ea64e3423b169683cffff58939ecee5cd5268834b20bf2da071c2563a43c"
> +SRC_URI[md5sum] = "4d642f5825a516d676356094179c6d27"
> +SRC_URI[sha256sum] = "174ea146adf303d7e5d7d6d34e3a01f4abf0382b03a6f9309bac2e2d54ffbed6"
>  
>  inherit setuptools3 pypi
>  
> @@ -20,5 +20,6 @@ RDEPENDS_${PN} += " \
>          python3-monotonic \
>          python3-contextlib2 \
>          python3-prettytable \
> +        python3-multiprocessing \
>          "
>  
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


