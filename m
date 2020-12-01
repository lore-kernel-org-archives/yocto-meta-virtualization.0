Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.426.1606858192499521256
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 13:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KldrkT0b;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 242B938C1107
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Dec 2020 21:29:51 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id z3so2318185qtw.9
        for <meta-virtualization@yoctoproject.org>; Tue, 01 Dec 2020 13:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=w+/N2mm4cZ/I3kISYkHF7UhuRZyf6C2UqPBaaIAT5IA=;
        b=KldrkT0bKCPLDRtUYpOq/dBJ7OL5pu/b+UGCMPjmAXFYViknMaH82OCvniuetMMPci
         mhw9YZxT7VgkGiEdZfy4Tlw6fZh87QQSP3b5/H6K9R4UlT2Q+KIHvR2SZBr+nRu0CKQM
         tDMlCQeAZAqt/rXCiQ+IiiEvSqadwVGX+XG8vV8oIZHAeO8SXLEQ+TMciIsGhETTrxAk
         JdCBDPk0iKVbfOcAs8+H825hBlsjeAZFzfrUKX1X2pVdjWLYlO+YF4T/jysyX0QIt/7o
         IQsf+hppIkL2BxDJMtkf5KDsHVp7LBzXwVpWz4z0+HBsO6oMt/bPQ29b6DI+oPMf7b/Z
         bf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w+/N2mm4cZ/I3kISYkHF7UhuRZyf6C2UqPBaaIAT5IA=;
        b=jMUn2r8C9vVEyHU66ezjWqI8EmFrqxJWWnVS1SLhFdjGoeojVhYw6XDw5THApn1mdl
         GQFN69iFfPDpH48IbaWoaYE4LMZeSBEkk4g7tbZgy9J0dGZB6RFlNs/YAAy/SILTXP5Q
         JwgeaffgT3IDwMudA79LR/LcrozeSoFvQFQMSxzhqYErpxKQDBhUGzAyXfPbtIYBwVFZ
         7hf9MF5yS2+u7DavwX6TyQnGU97d9+cEF4Imm6mhX0hEh88ksIuA1AR49XMfyS9KXClg
         2jxQbWpOj6Z0cKyoxOKQ8rZKbD1Ajo+TXVHAiTUPt9AV3RmrTEm/UwkEwq0wrBPo8ygc
         PzfQ==
X-Gm-Message-State: AOAM532iJUH0gZq+92DEIAeOIxO+m7QivQ6Ri8G3+1wuTUY2ZJIaskUJ
	T0qmLNG21nv2QNWXOcA/N/k=
X-Google-Smtp-Source: ABdhPJzh/BJh1BNqe7XaCfyYdiKjsoLGEMvyhyjQTYiVRlTHPigjso+YnVWFC4FAHazcAH2CQQ3zjw==
X-Received: by 2002:ac8:a01:: with SMTP id b1mr4994295qti.217.1606858190016;
        Tue, 01 Dec 2020 13:29:50 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id x124sm795702qkc.25.2020.12.01.13.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 13:29:49 -0800 (PST)
Date: Tue, 1 Dec 2020 16:29:47 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-mox: Remove recipe
Message-ID: <20201201212944.GA1140@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1606143063-96608-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1606143101-96777-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1606143217-97140-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1606143293-97302-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1606143300-97349-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1606143619-97481-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1606143643-97548-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-mox: Remove recipe
on 23/11/2020 zangrc wrote:

> This package only supports python2.
> 
> New uses of this library are discouraged.
> 
> People are encouraged to use https://pypi.python.org/pypi/mock instead which matches the unittest.mock library available in Python 3.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-mox_0.5.3.bb   | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb b/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb
> deleted file mode 100644
> index bdd5fbee..00000000
> --- a/meta-openstack/recipes-devtools/python/python-mox_0.5.3.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION = "Mock object framework"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -SRC_URI[md5sum] = "6de7371e7e8bd9e2dad3fef2646f4a43"
> -SRC_URI[sha256sum] = "424ee725ee12652802b4e86571f816059b0d392401ceae70bf6487d65602cba9"
> -
> -inherit distutils3 pypi
> -
> -DISTUTILS_INSTALL_ARGS = "--root=${D} \
> -    --prefix=${prefix} \
> -    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> -    --install-data=${datadir}"
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


