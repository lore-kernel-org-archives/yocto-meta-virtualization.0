Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.2137.1592354104895304813
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 17:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m70OF8x2;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id l17so472174qki.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jun 2020 17:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=yEFbS/7ZVYG71vYbbJBu7uZc7j93W0/CKOPCRCerzV8=;
        b=m70OF8x2CI47FGZfNUWI9tAqWIMRr8QtkgUj2qRx7LYTboP6waZsh/iu1FUOej33M4
         +bq6ZAf2OoHRFzx1JdU+LskAC7joOxdTapRmCmqbLYGdl0EYK4c9jngfVaGVRH861Esg
         0+gJ6aB3OfMZgAsxueczaMSfNmrjsg7A8N3/ek9NcMWOP683okDpLvG/VhdJdZp9jkQx
         Uz/5HhpCCGuOwGqPRDkCpVZiG1bWUw8XNtN7McWGnC7C1Po88noY/ypmYPVPYZ+k3O2Y
         LbkHeayMKPTVePTitB/QRctpAFnRBskw77MspyXlRK4Z90mQDuyQcN+Qm4APm8pL3qfF
         sTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yEFbS/7ZVYG71vYbbJBu7uZc7j93W0/CKOPCRCerzV8=;
        b=j+hZM89aLxGCSvWzJ1KFLxDY5gRWD95PeDQEFwrzqyVFC0SgcTQcsCOdInDCUToELF
         M1ktFXsWAqIsKcxTi5R/vggwkCHInTGcIRIXJuVFLfMEvOi7TNm0wEKT6al9iLkdLCGX
         IK8GQeJW7fyfYlqJwkTc5mBJEXH9M827BMKp5k9NFgChKMNkk2NUtwitaiqMhkqDMjQF
         UOiQDidl358C5VV9jLc+NyjPCQX27gcnjvavVOF1ULMimaKQ2wqCNMwWI8x3QA4V9ot4
         rcCzXqyHpCKOYV+aLX3/viIafr8M3UHCUk309HdIFk9ahk4T6IoH7y7tZm12xVC158vK
         iyWw==
X-Gm-Message-State: AOAM532CPYRV9qWK1Yolj+OtanMcXVGmkZdQNugYE1spYiplYAHyJCy7
	giqgrIeUpz/D5JpiO9iHAvU=
X-Google-Smtp-Source: ABdhPJwpUayxhsCkcCtWR8t6KQA9JV7bnv7OOn6KjUSZwALRCZ/Q60gXXM4AtiEdAjo0WZewzc+Xdw==
X-Received: by 2002:a37:6813:: with SMTP id d19mr521574qkc.11.1592354103937;
        Tue, 16 Jun 2020 17:35:03 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id g64sm16276287qtd.39.2020.06.16.17.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 17:35:03 -0700 (PDT)
Date: Tue, 16 Jun 2020 20:35:01 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][meta-cloud-services][PATCH] python3-osc-lib: upgrade 1.13.0 -> 2.1.0
Message-ID: <20200617003501.GC5232@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1592209781-47932-2-git-send-email-wangmy@cn.fujitsu.com>
 <1592209781-47932-3-git-send-email-wangmy@cn.fujitsu.com>
 <1592209781-47932-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization][meta-cloud-services][PATCH] python3-osc-lib: upgrade 1.13.0 -> 2.1.0
on 15/06/2020 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-osc-lib_1.14.1.bb        | 2 --
>  .../recipes-devtools/python/python3-osc-lib_1.13.0.bb       | 2 --
>  .../python/{python-osc-lib.inc => python3-osc-lib_2.1.0.bb} | 6 +++---
>  3 files changed, 3 insertions(+), 7 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-osc-lib_1.14.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
>  rename meta-openstack/recipes-devtools/python/{python-osc-lib.inc => python3-osc-lib_2.1.0.bb} (80%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib_1.14.1.bb b/meta-openstack/recipes-devtools/python/python-osc-lib_1.14.1.bb
> deleted file mode 100644
> index 256c286..0000000
> --- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.14.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-osc-lib.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
> deleted file mode 100644
> index 256c286..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-osc-lib.inc
> diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib.inc b/meta-openstack/recipes-devtools/python/python3-osc-lib_2.1.0.bb
> similarity index 80%
> rename from meta-openstack/recipes-devtools/python/python-osc-lib.inc
> rename to meta-openstack/recipes-devtools/python/python3-osc-lib_2.1.0.bb
> index 1767b43..db1ba03 100644
> --- a/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> +++ b/meta-openstack/recipes-devtools/python/python3-osc-lib_2.1.0.bb
> @@ -4,10 +4,10 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>  
> -SRC_URI[md5sum] = "240d3debc1b6eaadf5e8838f5f2d06fb"
> -SRC_URI[sha256sum] = "3467a1edf62946f1b67724fa7f9c699b5e31d80b111ed9e4c7aec21633a3e30d"
> +SRC_URI[md5sum] = "62d32a59bf4447191b957c6a65eff47f"
> +SRC_URI[sha256sum] = "697d08204a59933035ac246fbc8c8e5453b846b4a8875ed7a9e9caba769b1b57"
>  
> -inherit pypi
> +inherit setuptools3 pypi
>  
>  # Satisfy setup.py 'setup_requires'
>  DEPENDS += " \
> -- 
> 2.17.1
> 
> 
> 

> 


