Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC44DE00BC8; Sat, 14 Sep 2019 21:06:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.45 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB43EE0082E
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:06:16 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id d17so49382709ios.13
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=y5VpVqtvw8guWnPB1MyGlCPU07dtnkQ0KRwjVesG050=;
	b=mGMrbkNr1rUAVXxdvAd9lb9BO4n92aDJJOpIO5ydU2VPqVkm1Me1QxJz1AwQ3hpNKW
	coGeXpQ/QTPGFhXqnbf7gTPCzdjg5ykdRTszrX12zaGmbByC/xosuYrXMEdIXGAH9EIK
	KM73/xeNHoJiXVvTPVhJsAmGeHn2jQZILCd0WaBUEleM6zA+8Lz2JM+RgfvKj5jxKw/O
	RA8mXnKkKVus4Hr+NLw98rfLnKSA5ivvtJu0S3YebsjfKA7gSl1s8J2H9TNGVl9XZeBE
	Dbf6+tw2qOOsS1t+W4SyQFaOLcuzazJbrYfI4qmrXkNuV3x+AArOpqcxkBX85tEjHXV8
	Qrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=y5VpVqtvw8guWnPB1MyGlCPU07dtnkQ0KRwjVesG050=;
	b=BjwN0OFnNILG8emDanvQ3YQav0zU5Tsl5NUK7s9LVA1AhDM5CHr2SFfCmCp0g4aZZn
	4G3bmtQQboOCL8sZpjsuK7d1ChSdqn9GFuKUz/OS22KHeynvOCBtBrG9L0+ovVaquQij
	rp9gKDqTxi7xr+fq6Z5t3Qwtm6tMN8UU76bhbtaxbs1f8Ob1oRmJ/pLx1FeHGf8urqRA
	JEUXcMnLGM5yQil0vOFtZimnI5hF2Jm28+i/oEoVsmkjf3GYrFti3JGjWDuLMXdIKkA/
	Vbf1ZX2ARgi6qrQQzvY7f2Wj9N5KrerUNMk9X4lBq8rytqGLP0i/XsG2weOKaUSjJdq7
	mnEw==
X-Gm-Message-State: APjAAAUBK508GqESt3s28EJHeJzrfCMrXHgxxB44v4rI3abAT36B8g/W
	ai67jBPQf2TApqxSAu0Erfk=
X-Google-Smtp-Source: APXvYqxo+CJgJl2GpFj4k1MHg31FvugkbaCDUmFpBnYrc1eiLC533fQUpL+HfqHA0WB7rOBLdWDm2Q==
X-Received: by 2002:a02:634c:: with SMTP id j73mr13082863jac.99.1568520376186; 
	Sat, 14 Sep 2019 21:06:16 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	z20sm36731417iof.38.2019.09.14.21.06.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 21:06:15 -0700 (PDT)
Date: Sun, 15 Sep 2019 00:06:13 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190915040613.GF4367@gmail.com>
References: <20190912075718.1652-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190912075718.1652-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-simplegeneric: Add python3 version
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Sep 2019 04:06:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization] [PATCH] python-simplegeneric: Add python3 version
on 12/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-simplegeneric.inc       | 12 ++++++++++++
>  .../recipes-devtools/python/python-simplegeneric_0.8.1.bb  | 14 ++------------
>  .../recipes-devtools/python/python3-simplegeneric_0.8.1.bb |  2 ++
>  3 files changed, 16 insertions(+), 12 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-simplegeneric.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-simplegeneric.inc b/meta-openstack/recipes-devtools/python/python-simplegeneric.inc
> new file mode 100644
> index 0000000..2cd9fc0
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-simplegeneric.inc
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Simple generic functions"
> +HOMEPAGE = "https://pypi.python.org/pypi/simplegeneric/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://README.txt;md5=2085f2c228ed80422edf70e52e86c34b"
> +
> +PYPI_PACKAGE_EXT = "zip"
> +
> +SRC_URI[md5sum] = "f9c1fab00fd981be588fc32759f474e3"
> +SRC_URI[sha256sum] = "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb b/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb
> index 35c0555..5a1cc6a 100644
> --- a/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-simplegeneric_0.8.1.bb
> @@ -1,12 +1,2 @@
> -DESCRIPTION = "Simple generic functions"
> -HOMEPAGE = "https://pypi.python.org/pypi/simplegeneric/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.txt;md5=2085f2c228ed80422edf70e52e86c34b"
> -
> -PYPI_PACKAGE_EXT = "zip"
> -
> -SRC_URI[md5sum] = "f9c1fab00fd981be588fc32759f474e3"
> -SRC_URI[sha256sum] = "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
> -
> -inherit setuptools pypi
> +inherit setuptools
> +require python-simplegeneric.inc 
> diff --git a/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb b/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb
> new file mode 100644
> index 0000000..56ad221
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-simplegeneric_0.8.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-simplegeneric.inc 
> -- 
> 2.7.4
> 
> 
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

