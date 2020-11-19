Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.11459.1605802216276828343
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 08:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hh7rqWS4;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 243FE38C08DD
	for <meta-virtualization@yoctoproject.org>; Thu, 19 Nov 2020 16:10:16 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id q22so5841022qkq.6
        for <meta-virtualization@yoctoproject.org>; Thu, 19 Nov 2020 08:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=c5kvcVMyo2JHcP+20YGRxrxK72FJ/w1iN3Su5+QDmyI=;
        b=hh7rqWS4YhmUbs6PRt5yFhUQ7DPx0phXd7sNeZBD94W6dx7uO59qSnCLTT6ASQy0sd
         7gYeSROcr614aPD5BSLdhK/hQrr0Un8yxmtx2j36TlKXeyOAlvVnZNIAkHi8jBQkqa6t
         1t8yvr7EB2ampjER8Ify3lZ1ZBc8lkNJyVBXy/BkHXrLwN7G7lofmmpSDFINKWTDVTBR
         e9tymB9iGBKc2WtcGmkoKWzDDypHve5xW7JONJW/fz0WD6lHanAxu03RXqCdQYdAKi9F
         V5XDC413nAlN4KOXhV3QtIPIdGNsZdgKn8qn6NZL/81NMYqWAv5c3oekRPML5K/oHAPW
         IOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c5kvcVMyo2JHcP+20YGRxrxK72FJ/w1iN3Su5+QDmyI=;
        b=YyC64YNUbT+yw9eP9MgejKd0zRYlhVsZxuOS4iyyqAa8GRAY3vHU58Oec+VCVa9lVE
         35K7vvnsn0nRRJW+6lkLyncoi4NriiYED4Nv3NDDDXXiH9wlCaoYRqwrPcxSU/XrPL+C
         PrGTnXNPcPD/HGrNmvXnO7MsN3UrWEWM1lhVGM4Limdpk9Ku8YvRMBqnXmiVCWk3V0vm
         7YW2Z45rM5nnT2sQr5VJvxl4id3W6BYcbypv4dp8CP+3WW4ZgCQf0GIEFbMBRHhLS81y
         8Qc8fqxgc88VBe0zDV8yF3k3vOlpa+rjH2IHH133zlrFuNPxWz+Cjn0kQ8A+ipVW8N6t
         8DmA==
X-Gm-Message-State: AOAM531uPK4dtUFO5tTKJMZcQMXaiTeW9zan5QLGe5KkU+tIJR0VGfxv
	pQOP7Cd9v9HqNgpueAS7vqaJotycMZdKffa3
X-Google-Smtp-Source: ABdhPJyInq4BbdFnOOo7I1fzaVvlGexo9ipGSNkTvUIzNjhNCy7i7KK5hVKDQotAhz5XiMs6iYdXYg==
X-Received: by 2002:a37:9cd6:: with SMTP id f205mr11431563qke.303.1605802214879;
        Thu, 19 Nov 2020 08:10:14 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id p127sm138408qkc.37.2020.11.19.08.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 08:10:14 -0800 (PST)
Date: Thu, 19 Nov 2020 11:10:12 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-pysqlite: Remove recipe
Message-ID: <20201119161009.GA26762@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1605629728-107698-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1605629721-107646-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1605629709-107584-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1605629657-107495-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-pysqlite: Remove recipe
on 18/11/2020 zangrc wrote:

> When I tried to change it to python3, it reported the following error:
> | pysqlite is not supported on Python 3. When using Python 3, use the sqlite3 module from the standard library.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-pysqlite_2.6.3.bb           | 22 -------------------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb b/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb
> deleted file mode 100644
> index 6b8de00e..00000000
> --- a/meta-openstack/recipes-devtools/python/python-pysqlite_2.6.3.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "DB-API 2.0 interface for SQLite 3.x"
> -HOMEPAGE = "http://github.com/ghaering/pysqlite"
> -SECTION = "devel/python"
> -LICENSE = "Zlib"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a85bd923e5c830f8eb89db354ff72f38"
> -
> -SRC_URI[md5sum] = "7ff1cedee74646b50117acff87aa1cfa"
> -SRC_URI[sha256sum] = "fe9c35216bf56c858b34c4b4c8be7e34566ddef29670e5a5b43f9cb8ecfbb28d"
> -
> -inherit setuptools3 pypi
> -
> -FILES_${PN} += "${datadir}/*"
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        "
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


