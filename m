Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.1868.1586898486189537650
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 14:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mtmJvWHU;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id w29so11138278qtv.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2020 14:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=nM/8Vx4zvLfOFRA0W12NzEtNG2BinbvYB5hzgmkXwL4=;
        b=mtmJvWHUHHAfLpq5lN0F1jR6+fHxRJndSEQOus19ZNyec6834HfvKqamJVWEWKvBve
         vOqzrnYZI4EUkICwjJmdSV5j9qG4JVV9heLqphaOnkVJcqJa3WLV6Sgk96kLvTCHSvfi
         DhtvSCAV6SR1pUbqkVDiKENvh/wubwHWJk5YNH5AzW+14Uzlz2W9vqqkgoV/GQq5WFlb
         DwfpehWHzJd/aslpKenoGL0n2DhRq45OpBZqy64wNpLtLTVNFe0SH763m9gJJ+wb1Uni
         Tp67AC7RvueVqnCpDG7Wa7T8emHtpXuy6nch07v4HSdWU5NuLmWeVN44VwiO9j+rIY2c
         H00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nM/8Vx4zvLfOFRA0W12NzEtNG2BinbvYB5hzgmkXwL4=;
        b=niZeFDPEcQ29LaB+cYN9jQjId+bbqmaF/6dHPO+We99YihCmT30y7a7pkytQiPXmsP
         BCEdGNW3BUBWLZbmbBE5m3S3/0t7n2GW+tB0vu1kkyqiuZtZPDUr5y5U4M6hrMCDabvo
         /BI58IK6A1Pes9y0eWDbWjrwDIwII15s8Sw3DSJGEbOdEzZaBCinbzoSPQ+582pLFtIJ
         rzLP4f+3s0+PTh0mJV8H0cMuxtMrjvVmObCakiYUtS6HDVNCrvYFcKrZNqWA1diHRrGS
         jFD1aHA8xI0AYTy1y4waLRH/UC3Cj16VoLVfXwI/f7KdM+Y2PFPKh+vTuquou+VXTinc
         lR+A==
X-Gm-Message-State: AGi0Pub4m21KsSNzDoiNS7jZCO1o8s3DHvtymorG2Plhl6NcEK9P++eu
	ZTM4FbcAtgI5tk0/erpXwnU=
X-Google-Smtp-Source: APiQypI4LCC+uhGvJAoO0ZTXJZ7i6Ig2aYfSc6PEysgsUQ4djCP5HoQv3rzcrzQv1OSv4hap0nNSyw==
X-Received: by 2002:ac8:3403:: with SMTP id u3mr18677924qtb.274.1586898483893;
        Tue, 14 Apr 2020 14:08:03 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id o128sm10920052qkf.116.2020.04.14.14.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 14:08:03 -0700 (PDT)
Date: Tue, 14 Apr 2020 17:08:01 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] python3-websocket-client: Upgrade 0.44.0 to 0.57.0
Message-ID: <20200414210801.GC4489@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1586875066-2971-2-git-send-email-leon.anavi@konsulko.com>
 <1586875066-2971-1-git-send-email-leon.anavi@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH 1/2] python3-websocket-client: Upgrade 0.44.0 to 0.57.0
on 14/04/2020 Leon Anavi wrote:

> Upgrade websocket_client from 0.44.0 to 0.57.0.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  recipes-devtools/python/python-websocket-client.inc                 | 6 +++---
>  ...ebsocket-client_0.44.0.bb => python3-websocket-client_0.57.0.bb} | 0
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-devtools/python/{python3-websocket-client_0.44.0.bb => python3-websocket-client_0.57.0.bb} (100%)
> 
> diff --git a/recipes-devtools/python/python-websocket-client.inc b/recipes-devtools/python/python-websocket-client.inc
> index 31778c6..8604dcb 100644
> --- a/recipes-devtools/python/python-websocket-client.inc
> +++ b/recipes-devtools/python/python-websocket-client.inc
> @@ -1,11 +1,11 @@
>  SUMMARY = "WebSocket client for python. hybi13 is supported."
>  HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
>  LICENSE = "LGPL-3.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=18b09a20dd186af4fd60f1a08311628c"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
>  
>  inherit pypi
>  
>  PYPI_PACKAGE = "websocket_client"
>  
> -SRC_URI[md5sum] = "73d87aa16a2212da448b30aca9c5bf3b"
> -SRC_URI[sha256sum] = "15f585566e2ea7459136a632b9785aa081093064391878a448c382415e948d72"
> +SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
> +SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
> diff --git a/recipes-devtools/python/python3-websocket-client_0.44.0.bb b/recipes-devtools/python/python3-websocket-client_0.57.0.bb
> similarity index 100%
> rename from recipes-devtools/python/python3-websocket-client_0.44.0.bb
> rename to recipes-devtools/python/python3-websocket-client_0.57.0.bb
> -- 
> 2.7.4
> 

> 


