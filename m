Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.1916.1594067313061040017
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 13:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XBxK8wXX;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 145so33652891qke.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2020 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wTgjdjVnoSVxouHPhGMAVF5epA9JJ7u1Yb2ToYjBzP0=;
        b=XBxK8wXXYizFveUTosIueIF4y4DZZgK/wOowOX02TJsY0iw3rGEpwx3FbMi/+q+qe5
         v2KDNREoVmItxaf6wbQXgXViaAofoo9EXo9U8yAuHvNa5LflzIeyUvzEmXV60Wvhrsxo
         z6TuU5YVE/Q8KmZDdkWHP2BEvNPH2YDtI5ME7xSjjrBbVu8QeQLdAMCACbk+Uvxmud03
         6LnuMb6rhDwSELCB4sJMyvP8zp49WqcQDve59gjpGf6rlm03pgiPcaIiVE8TdigQkVIc
         E0qJhwts4e3lYUr8yskW5P8HXdu/Dggw9qfJ/ZDYRF29bYqgxlLNW0AtPWUbLQRadLMC
         F56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wTgjdjVnoSVxouHPhGMAVF5epA9JJ7u1Yb2ToYjBzP0=;
        b=E9E/mUYnJAt4ZlG3laGRNAlOf1Yp70+mxGdzDHxBn7S+TcB/GtvwI4q9S7tAUQHw8g
         0bZSRIoXV7V/7gGTuC7vhMo5VVqHqd99iGcS8ySxEBDMHjQyl16iEliM6LPSMz9WeYzO
         ZepT0QCqTcFHlUsrsaIn/aMRm5VURApqcaiq3jDMgMBokbumkE6/2GZu3ueOGEs3rjhC
         XiaCuEzbgduV7AhvMaUWRx6Gbtt+FQ16/LGAsQdf7dkcGwlZ2UyMAJMOWcImfVqqtbzi
         UfIzGD0B4bHe0Je1np3HOsyh5kf7GPo17eUsn2COMqqO3oyHdNSq/TUiZo2L+LyEWmpM
         ZNaA==
X-Gm-Message-State: AOAM530gz02lxMnNVV4of9lFziG3rQKmzZZF2UTa5EqaKNOc3Xz2niUR
	1KleG7mgFW1J3qChDESBgdQ=
X-Google-Smtp-Source: ABdhPJxDYQfGD9o95sRs2ZIus2klak5615HqIfLZTraiLtcKpRuiTvwAgE5Jt9iuAnizxBWlpDAL0Q==
X-Received: by 2002:a05:620a:571:: with SMTP id p17mr34733798qkp.482.1594067312171;
        Mon, 06 Jul 2020 13:28:32 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l31sm17763984qtc.33.2020.07.06.13.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 13:28:31 -0700 (PDT)
Date: Mon, 6 Jul 2020 16:28:15 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: upgrade 4.0.2 > 4.0.3
Message-ID: <20200706202812.GA49840@gmail.com>
References: <1593586793-23074-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1593586793-23074-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization][PATCH] lxc: upgrade 4.0.2 > 4.0.3
on 01/07/2020 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  recipes-containers/lxc/{lxc_4.0.2.bb => lxc_4.0.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/lxc/{lxc_4.0.2.bb => lxc_4.0.3.bb} (97%)
> 
> diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.3.bb
> similarity index 97%
> rename from recipes-containers/lxc/lxc_4.0.2.bb
> rename to recipes-containers/lxc/lxc_4.0.3.bb
> index d0ead81..f0fd4b9 100644
> --- a/recipes-containers/lxc/lxc_4.0.2.bb
> +++ b/recipes-containers/lxc/lxc_4.0.3.bb
> @@ -51,8 +51,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>  	file://lxc-net \
>  	"
>  
> -SRC_URI[md5sum] = "cc62e734c900f39d770f0de51c868aac"
> -SRC_URI[sha256sum] = "ca336dcdf303fea5ff231d89a9b6278b061c4cffb14f0db0a71a15bdd95a5cb0"
> +SRC_URI[md5sum] = "7d86ddf9fcb5f78ac5ae0380fbbfb690"
> +SRC_URI[sha256sum] = "d56d91d772449c57e9a67b770dab8967e412051d8d6246ce56c63264671672e5"
>  
>  S = "${WORKDIR}/${BPN}-${PV}"
>  
> -- 
> 2.17.1
> 
> 
> 

> 

