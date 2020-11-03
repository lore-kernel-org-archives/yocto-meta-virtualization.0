Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4375.1604439236836456784
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 13:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yoq+bHtl;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A0BC838C086B
	for <meta-virtualization@yoctoproject.org>; Tue,  3 Nov 2020 13:33:56 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id ed14so5137536qvb.4
        for <meta-virtualization@yoctoproject.org>; Tue, 03 Nov 2020 13:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=NKOsRBOdrkA2mEuC8uu9bBemc/URjqd77PZvY8xy7d4=;
        b=Yoq+bHtltKMaxXfhPl1qb5FfGEW/J9nqL0TT7gpw5Dmo/4iuVVCNa8+V+fo6v3FnL1
         XQyrsD0ryndAbFKhSuKtphJOiAKET6mvsqpJlxO5Hsg32/hz/fplBK0Azypujy7d/FPX
         vBZ2KxhqQYgXl2uG0wuV30vcixyEt0JxSgeCneIdYq6zryOxDFC7s8BjltGV8mdzbzZg
         5P+7gZW8XpaGAQaVJ3nX60TjeOkeo424EGBCemLcGMOpaGjBoYgrwbg/aEw5NYTObbCm
         EWj8xQVUAB+JJHMWO38i/ulEQDcWyM+iBoFUIb+mSGx/gM4vQu9V+/sqr2Y1c4ewdZCW
         HxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NKOsRBOdrkA2mEuC8uu9bBemc/URjqd77PZvY8xy7d4=;
        b=FwFH/8ueYdtyNs9wPwOqZc38JZZZUcifypdXnu/UpfCWftYOkLTMikybV5jTZQQTIw
         8fEeLLZPSp5lOyOzocYUoYVlA8nk1+F2MwcVCg6MuZGEnP+fxMfhJg27E29DLeKKM1Cz
         COiieNfiAkDABJ3kOhI2yzL+i6BRtUyhEvIAy81y3h4Aqaou1owrH7uhRhHlYhfwn0z9
         bRPWFujlFF/jACAbnl+IfO7MWRGlg8gWndTh5aZ/fFwhyjNaw626IwUisaDOK2m1Hafl
         DQFmQLY6o0jwNCuh+uXYFXlXrxNG/AA1nkKI32O/cZ/8Omk7X2C8Wr8TeLr5Oyoce9Nr
         9vCQ==
X-Gm-Message-State: AOAM532dJjlUWFZ50TEFjRSYTLn35ywMF6G9jKisJQlfcjyintThCV30
	Sy49g2BrzvIw5Eu9KQysV1p3TaHxLi497smU
X-Google-Smtp-Source: ABdhPJwtfF6Ter+rdkMX87BLbRZs8ANdqjT1ejWRLVAKZmiSTFAfMcnzmDuFx/Mwi3JbpE1JcA0rhg==
X-Received: by 2002:a0c:8143:: with SMTP id 61mr28694143qvc.6.1604439235606;
        Tue, 03 Nov 2020 13:33:55 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id g78sm5518797qke.88.2020.11.03.13.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 13:33:54 -0800 (PST)
Date: Tue, 3 Nov 2020 16:33:53 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-rjsmin: upgrade 1.0.12 -> 1.1.0
Message-ID: <20201103213352.GB40946@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1603776480-96550-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603776527-96590-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603776543-96637-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603776596-96676-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603776602-96732-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1603776611-96772-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-rjsmin: upgrade 1.0.12 -> 1.1.0
on 27/10/2020 zhengruoqin wrote:

> Consolidate inc and bb files into a single bb file.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python3-rjsmin_1.0.12.bb        | 2 --
>  .../python/{python-rjsmin.inc => python3-rjsmin_1.1.0.bb}   | 6 +++---
>  2 files changed, 3 insertions(+), 5 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
>  rename meta-openstack/recipes-devtools/python/{python-rjsmin.inc => python3-rjsmin_1.1.0.bb} (63%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
> deleted file mode 100644
> index 9890e14..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-rjsmin.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python-rjsmin.inc b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.1.0.bb
> similarity index 63%
> rename from meta-openstack/recipes-devtools/python/python-rjsmin.inc
> rename to meta-openstack/recipes-devtools/python/python3-rjsmin_1.1.0.bb
> index 0305a33..6c3b55b 100644
> --- a/meta-openstack/recipes-devtools/python/python-rjsmin.inc
> +++ b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.1.0.bb
> @@ -4,10 +4,10 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>  
> -SRC_URI[md5sum] = "9f67e133c88df5497d3da847603da9bf"
> -SRC_URI[sha256sum] = "dd9591aa73500b08b7db24367f8d32c6470021f39d5ab4e50c7c02e4401386f1"
> +SRC_URI[md5sum] = "ff73482370832bcc8e75571c35b7a79b"
> +SRC_URI[sha256sum] = "b15dc75c71f65d9493a8c7fa233fdcec823e3f1b88ad84a843ffef49b338ac32"
>  
> -inherit pypi
> +inherit setuptools3 pypi
>  
>  RDEPENDS_${PN} += " \
>          "
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


