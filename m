Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.3646.1623382236798905183
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 20:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ofVcSH/V;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6356238C0872
	for <meta-virtualization@yoctoproject.org>; Fri, 11 Jun 2021 03:30:35 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id x2so15192013qvo.8
        for <meta-virtualization@yoctoproject.org>; Thu, 10 Jun 2021 20:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p9eF0xwiOVA9AnZOUd9El1vhF8fz30ERmgTFOca3geo=;
        b=ofVcSH/VRTQVDDh1HLi9YnkWEbPhfb0SMpVIZksqVr08L0myw4BOf1rRP2zhNuw1n2
         +w3h4xLvJMYiS3hpVYcfHAapiDu3Po/bZz9mkBkGVG3UYikur1GXUcR1TxXNt92BP2QS
         5COmD2geVUjEcu5sFM/COCKfUIFkCxTAcuCaplOhn8KqhuU1rh6HEn4VNL7SEfBfhzSs
         r+kUGlGyz63DLK7GtrIBkKP9rCaI4IdS84I9LXllzQUeVG8rwYu1wCFothI2HcBs9SK+
         gsGosJeE1M+V5MSBXOZGyWEUuRomDiH8fUgX9IKNkU+/eY3pwbK0Y58g5CD+j+5mlf2E
         nnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p9eF0xwiOVA9AnZOUd9El1vhF8fz30ERmgTFOca3geo=;
        b=jVyimWg6uaEkZ3fDwevQAN4NEwhAuMJEQ0qOjuU5sN+eSa++JhPzd7O245Nj/wN2T8
         VMexK3v8PYmVHVsXKkgfIx+KqwBnjHu/AzPS7kjl/oHUCln4MF4g8y6BIpmg20wAw0oN
         x4/wZC7ZEClza0BXjU63ojrxl5ioizMT4UcvCbUllWeBI3RaW+lacENwd8BQlGnNZBLr
         nQnQ5z/zO2XO5Lmya6gnNxzlDfNK9RtegCD+rvPng+0/tdSYU9BPjXJnBflZpIfWGD/Z
         4pqEAn2oP1tYqYtOqP5+8MDKHIep6dnsR1I8h1XLzCfNXdA32dWWDDYp8iuWcomXHnOO
         DleA==
X-Gm-Message-State: AOAM531ak1pQb2pRhc3X+7RD4aqjfBd3Q7/SO/6O4gpSNCLA1I8inBu0
	hsn7oPTyUTto2b7a764TJhE=
X-Google-Smtp-Source: ABdhPJxDW55RKONk1zexIn9/9G2CUdCtVK85fi9iuv3W/VmzpxzQ4K6LMiKM+GC081PdlfpE7OgN3Q==
X-Received: by 2002:a05:6214:1551:: with SMTP id t17mr2869280qvw.50.1623382234309;
        Thu, 10 Jun 2021 20:30:34 -0700 (PDT)
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id m199sm3663058qke.71.2021.06.10.20.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:30:33 -0700 (PDT)
Date: Thu, 10 Jun 2021 23:30:32 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] novnc: Correct permission error
Message-ID: <20210611033029.GA4918@gmail.com>
References: <1623057402-21919-1-git-send-email-zangrc.fnst@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1623057402-21919-1-git-send-email-zangrc.fnst@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] novnc: Correct permission error
on 07/06/2021 zangrc wrote:

> The permission of novnc-server was set incorrectly when copying.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  meta-openstack/recipes-extended/novnc/novnc_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-extended/novnc/novnc_git.bb b/meta-openstack/recipes-extended/novnc/novnc_git.bb
> index 53a7056..9032a62 100644
> --- a/meta-openstack/recipes-extended/novnc/novnc_git.bb
> +++ b/meta-openstack/recipes-extended/novnc/novnc_git.bb
> @@ -23,11 +23,11 @@ do_install() {
>      install -m 755 -d ${D}${datadir}/novnc
>     
>      cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/novnc
> -    
> + 
>      install -m 444 ${S}/vnc.html ${D}${datadir}/novnc/index.html
>      install -m 444 ${S}/vnc_lite.html ${D}${datadir}/novnc/vnc_auto.html
>  
>      install -m 755 -d ${D}${bindir}
> -    install -m 644 ${S}/utils/launch.sh ${D}${bindir}/novnc_server
> +    install ${S}/utils/launch.sh ${D}${bindir}/novnc_server
>  }
>  
> -- 
> 2.25.1
> 

> 
> 
> 

