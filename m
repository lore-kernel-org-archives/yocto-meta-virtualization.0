Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3101.1578518781100750547
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jan 2020 13:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iZSiaS60;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B19C6E01405; Wed,  8 Jan 2020 13:26:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,FSL_HELO_FAKE,PDS_BTC_ID,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.194 listed in list.dnswl.org]
	*  0.5 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.5 PDS_BTC_ID FP reduced Bitcoin ID
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F171E01406
	for <meta-virtualization@yoctoproject.org>; Wed,  8 Jan 2020 13:26:15 -0800 (PST)
Received: by mail-qk1-f194.google.com with SMTP id z14so4055763qkg.9
        for <meta-virtualization@yoctoproject.org>; Wed, 08 Jan 2020 13:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=PNGfV9D+XMNUxx6WPVo1+y7riuQbCIMivqQs7iBpVXI=;
        b=iZSiaS60GohF3fstYBJewkQv30aCRX2nUtp8FmyxMs+YO6fR8cO9ZvU9dOwvk+3SeQ
         YeT64E5O6q3locapG1UPsl3NdkalaB3v+OHQnan0KVU7rYVzGsBGXBud2cDYkWYpeawr
         5srRk/KU8wO2qr2COeeCI/cwtVcRtY2No5wAWWoTQg0nFC+3x5Fzg0capmin/8E0g6c1
         9ad2GUPtJmijN7Vug31T48xUApyw0DSUEXt6CMPgo4eQgrQr6b2wbJwVnrXbP5FYoYcM
         6utAGWCKyzr1rmX3LlOdVz8XaMFok/7+shQuTZOPvqFl8m/qTcmWJqMksvGJ9NWFOXn5
         CO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PNGfV9D+XMNUxx6WPVo1+y7riuQbCIMivqQs7iBpVXI=;
        b=gKnjeHidaigEeqAwGGtTbjVmwBtlQrV2FLE1TkESZdXf9W1MwA/fpv3qHW5Qqr5iaw
         zuTGbv5pL470L87CwUSiMWveHr+HRM19JgN89QYP5A1nc//qXCS2Muv/nG5nXkRy5rQv
         da7WTl/p0sQgE3nPl8+ynU7heDrRN6+I/+rjnUjWC+TPkFw7v5q7qmBnkdFfH+7BMWL7
         du9ZSzb4g+MMMQqPIJuvgop9YskVXpErVie/C8sAksd4m5pDEj9yWbnavspzL9kzKpXe
         3vHeSMkViwxtQhdzvlgBHVQRDGzfrYbnz4NWywxPMBIaQ/s+lmEZxRCkPTMgZscRKV0k
         IZyg==
X-Gm-Message-State: APjAAAXOSfhLmucA6qBQzUiY8m5isKscRCKOJVdJ5ULm8zjQDv76fTfk
	WP+8V0f3l6FS3NqN4sc5J0S7f/a+o+Q=
X-Google-Smtp-Source: APXvYqytryRnau81yu+FPrJ4ImKyzhNKlAYv5kklZX9v1I52X9gwaEU0DGp+/bkP+ccDmKhbIfAArQ==
X-Received: by 2002:ae9:f442:: with SMTP id z2mr6611376qkl.130.1578518773805;
        Wed, 08 Jan 2020 13:26:13 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id v2sm2023648qkj.29.2020.01.08.13.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 13:26:13 -0800 (PST)
Date: Wed, 8 Jan 2020 16:26:11 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-xstatic-jquery-migrate: Add python3 version
Message-ID: <20200108212607.GA12587@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200102080913.31226-1-zangrc.fnst@cn.fujitsu.com>
 <20200106031500.3460-1-zangrc.fnst@cn.fujitsu.com>
 <20200106032434.11848-1-zangrc.fnst@cn.fujitsu.com>
 <20200106051250.13469-1-zangrc.fnst@cn.fujitsu.com>
 <20200106052333.14816-1-zangrc.fnst@cn.fujitsu.com>
 <20200106053852.16311-1-zangrc.fnst@cn.fujitsu.com>
 <20200106054550.20464-1-zangrc.fnst@cn.fujitsu.com>
 <20200106062225.28704-1-zangrc.fnst@cn.fujitsu.com>
 <20200106063001.31826-1-zangrc.fnst@cn.fujitsu.com>
 <20200106064033.706-1-zangrc.fnst@cn.fujitsu.com>
 <20200106064702.2620-1-zangrc.fnst@cn.fujitsu.com>
 <20200106065535.4105-1-zangrc.fnst@cn.fujitsu.com>
 <20200106073228.9459-1-zangrc.fnst@cn.fujitsu.com>
 <20200106074017.10862-1-zangrc.fnst@cn.fujitsu.com>
 <20200106074920.12441-1-zangrc.fnst@cn.fujitsu.com>
 <20200106075557.13902-1-zangrc.fnst@cn.fujitsu.com>
 <20200106080217.15273-1-zangrc.fnst@cn.fujitsu.com>
 <20200106083040.17250-1-zangrc.fnst@cn.fujitsu.com>
 <20200106083736.18910-1-zangrc.fnst@cn.fujitsu.com>
 <20200106085110.21099-1-zangrc.fnst@cn.fujitsu.com>
 <20200106085520.22334-1-zangrc.fnst@cn.fujitsu.com>
 <20200106090153.23602-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-xstatic-jquery-migrate: Add python3 version
on 06/01/2020 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-xstatic-jquery-migrate.inc  | 22 +++++++++++++++++
>  .../python-xstatic-jquery-migrate_1.2.1.1.bb  | 24 ++-----------------
>  .../python3-xstatic-jquery-migrate_1.2.1.1.bb |  2 ++
>  3 files changed, 26 insertions(+), 22 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate.inc b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate.inc
> new file mode 100644
> index 0000000..b5c1332
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate.inc
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "JQuery-Migrate JavaScript library packaged for setuptools"
> +HOMEPAGE = "https://pypi.python.org/pypi/XStatic-JQuery-Migrate"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2bbd78dd61f7b4f2fb6b3e31e4d7a26b"
> +
> +PYPI_PACKAGE = "XStatic-JQuery-Migrate"
> +
> +SRC_URI[md5sum] = "2dd39f9d6351aeaf129b33d4134ac6a7"
> +SRC_URI[sha256sum] = "e2959b3df49afdddb00d36b74cca727a91b994b9f4edb993d7264731a750900e"
> +
> +inherit pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb
> index 432b11e..f3a6146 100644
> --- a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-xstatic-jquery-migrate_1.2.1.1.bb
> @@ -1,22 +1,2 @@
> -DESCRIPTION = "JQuery-Migrate JavaScript library packaged for setuptools"
> -HOMEPAGE = "https://pypi.python.org/pypi/XStatic-JQuery-Migrate"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2bbd78dd61f7b4f2fb6b3e31e4d7a26b"
> -
> -PYPI_PACKAGE = "XStatic-JQuery-Migrate"
> -
> -SRC_URI[md5sum] = "2dd39f9d6351aeaf129b33d4134ac6a7"
> -SRC_URI[sha256sum] = "e2959b3df49afdddb00d36b74cca727a91b994b9f4edb993d7264731a750900e"
> -
> -inherit setuptools pypi
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
> +require python-xstatic-jquery-migrate.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.1.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.1.bb
> new file mode 100644
> index 0000000..2dab32f
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-xstatic-jquery-migrate_1.2.1.1.bb
> @@ -0,0 +1,2 @@
> +require python-xstatic-jquery-migrate.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> 


