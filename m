Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.15918.1605413818830080065
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Nov 2020 20:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gkggJOCu;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	by mail.yoctoproject.org (Postfix) with ESMTPS id ABE8238C086C
	for <meta-virtualization@yoctoproject.org>; Sun, 15 Nov 2020 04:16:58 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r7so13635717qkf.3
        for <meta-virtualization@yoctoproject.org>; Sat, 14 Nov 2020 20:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=1tt4aRz2BwBxGe3qs/z+py4FB6bXPI4Qd/edBE8VMgM=;
        b=gkggJOCugkuW0F9Ubi24viZT8jCItHUT2i4GFzy6FnvORoEbscjUwC72WwfIajIEG3
         a76/X4p2zaGb+0zr4jgxx4aTTz2rINrkmHbmfK4AqdXAb30wqSbgaJpbbGYGVPqk3otQ
         sJOjuzu3ntePSGeQksj+F6bCiFRYRAhoNI3tPtlIIL1jqloVuZpBVb9ReWuAMSzGs8uf
         N84h+VvAqrcMP3pid6qie6WY8LfUTWU91BzsFCgHTiunP6276T39o+eQ3XDslohDezJE
         rt8UGvzb8wkKjbQsTaSm713r4SRS+HrG4mSUs2grwLOS8fAQTH6rpWMUluGt7Ns1lwl4
         j06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1tt4aRz2BwBxGe3qs/z+py4FB6bXPI4Qd/edBE8VMgM=;
        b=icWNqIdI02J+xEV1NnbTF4qEYARFHTk2GEehPk9wG9/vQe/+/iEc0qerH0iCePcyY3
         0rr10ivoikArzgRJ363CkR5Uiniufiprm+2NY1Ru7vkBXnGHC7OXI7EeZFPf9Bhvpchc
         Wa6ctotluOS4EnB7tz2ZYjj3Edp6uAOxuwHxzEyrfUujTbX84xhRItyG4XsBcYYIwpPs
         4IyM2I2c1iDpH969j7YO+AtPcWJAvT1iomO0+0CRGGjkvTR+JNS7VgkVhw/IkQWDg8pq
         YRz84aBF3blXYobEhWXNEDHat54UXDzjSTyzfJxPQqr3thYq52q+tnfI13Ei9x/16KrM
         xoUw==
X-Gm-Message-State: AOAM531tHHJ00b5vAgie8cCnLgYnR3Kz7vI4ZedKsq0avXQuPo+L9enb
	i75COwpHZWTXuTEvk5q+BDXsK/KV/JsLyanW
X-Google-Smtp-Source: ABdhPJyybbCoKU9oLziPk2Moc+AcPt5uSD4uG+Vc46HN5xXr7bmeL7oCKTeZ7o472PxNVF6ilv1INA==
X-Received: by 2002:a37:7903:: with SMTP id u3mr8954392qkc.226.1605413817789;
        Sat, 14 Nov 2020 20:16:57 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id o9sm9977007qko.53.2020.11.14.20.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 20:16:57 -0800 (PST)
Date: Sat, 14 Nov 2020 23:16:55 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-repoze.lru: Add RDEPENDS
Message-ID: <20201115041652.GA20764@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1604911566-65656-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1604911574-65708-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1604970476-79636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1604971334-79950-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-repoze.lru: Add RDEPENDS
on 10/11/2020 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python3-repoze.lru_0.7.bb         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
> index 323ad767..e709bd71 100644
> --- a/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-repoze.lru_0.7.bb
> @@ -12,3 +12,7 @@ SRC_URI[md5sum] = "c08cc030387e0b1fc53c5c7d964b35e2"
>  SRC_URI[sha256sum] = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"
>  
>  inherit setuptools3 pypi
> +
> +RDEPENDS_${PN} += " \
> +	python3-typing \
> +"
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


