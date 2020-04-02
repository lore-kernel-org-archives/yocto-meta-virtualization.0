Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.5953.1585794756068506782
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 19:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C1G/Hl0I;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id z24so2129071qtu.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Apr 2020 19:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6M54QR3FVwKHIM2pLxdY4AGeg+QyCFE3I8A8UXd3/A8=;
        b=C1G/Hl0ISqfKz0iJ+FLv9uJxFzCyXyCkyPF0wgPqeu00YfNXxz6I7Kk4VcSEOsfOt6
         tIvEox7J3vwz/YLkyrFJbYwr0H+PVecnqNauqei9OG9f0cKNOytuI2WXQgIXcQvCDCsK
         cjO8BcpFJr7ORrtw2StcPPAyUnLzf9bFcGOD+hC3CVuMhHccvUh6kVZ9z2o4rI4AayU8
         OxxJt+OV+McixxXhzRw6vDAE0RqQNAya/pDTyF6tq9OPWgXLdQuoTM6GGbQq4Nrrtz7d
         H5/+Au5R8i7m2r8OwgWQef2+gcHaV/k9zcfp8k6M0x8tpD79O3T7fJjKPd396ShlqoIK
         AIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6M54QR3FVwKHIM2pLxdY4AGeg+QyCFE3I8A8UXd3/A8=;
        b=ZknEMqnyifMf0ZLrFgXrYBoxFtz3/Bi80U+LROVJUfNGZ2MqU/sk2PctLrA+J5UobU
         jy0ZcP7FGwOBD6GWed5D8xngoVJMY39C237qB1y/V3blidqC06OlDcWx2hnTtfCO/PLu
         ggtbqGjafiXduyzhBtcAPcp0WYankgkil2lBPRIxdLXaCo0XTIaUGnx/3nVC5Tsq01au
         kYUhaGSXoPJooM8xthcLlwfvYDkzLG0kxXo8DKJnbj7NOLeyyBqtefRlPimvhrwRdcC5
         H6BQF8nVE5fPhQqJqv2vGUwxwOLvuAxU4V2IT9jc0mQxeaQqHC0qMAPRkCdJ5Dj2nQTz
         Rhug==
X-Gm-Message-State: AGi0PuYm6ko/KJaFoub9Lugy78uTXvQ6/b6FUcwLOfamQg5nOU9aLS6X
	n5RX5yHN3oYZngbp117Txh8=
X-Google-Smtp-Source: APiQypK5Ej2uS99GrLMcoPB/J6N3m4DZCnAJOjw/x7p4yzGVKjIMbr8bjm3H0zt8+J5cTWnCLzLTsg==
X-Received: by 2002:ac8:348f:: with SMTP id w15mr810884qtb.219.1585794755212;
        Wed, 01 Apr 2020 19:32:35 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id h27sm2953220qte.37.2020.04.01.19.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 19:32:32 -0700 (PDT)
Date: Wed, 1 Apr 2020 22:32:30 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: qiang.zhang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH] libvirt: change bbappend file version
Message-ID: <20200402023227.GA41445@gmail.com>
References: <20200331033003.12787-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200331033003.12787-1-qiang.zhang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Considering I'm the one that did the libvirt uprev, I should have
caugh that!

Thanks for the patch.

Merged.

Bruce

In message: [meta-virtualization] [meta-cloud-services] [PATCH] libvirt: change bbappend file version
on 31/03/2020 qiang.zhang@windriver.com wrote:

> From: Zhang Qiang <qiang.zhang@windriver.com>
> 
> Fix meta-cloud-services libvrit bbapend file form v5 to v6
> 
> Signed-off-by: Zhang Qiang <qiang.zhang@windriver.com>
> ---
>  .../libvirt/{libvirt_5.%.bbappend => libvirt_6.%.bbappend}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-extended/libvirt/{libvirt_5.%.bbappend => libvirt_6.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend
> rename to meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend
> -- 
> 2.24.1
> 

> 

