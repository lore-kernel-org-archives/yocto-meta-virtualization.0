Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.9790.1576171781768675730
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Dec 2019 09:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BIWWIGxh;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6085AE01228; Thu, 12 Dec 2019 09:29:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5E68E01226
	for <meta-virtualization@yoctoproject.org>; Thu, 12 Dec 2019 09:29:35 -0800 (PST)
Received: by mail-qk1-f193.google.com with SMTP id x1so2236039qkl.12
        for <meta-virtualization@yoctoproject.org>; Thu, 12 Dec 2019 09:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=yeyf/oi06hJUfNQuczxAkRie+GQv6sWniDZct6zx2xs=;
        b=BIWWIGxh65wcjMKMBhEILYwlo/fpiOgdv8UTZmUpD6EFx0edHiv4CtdixvQRRWfTaK
         aZLNOqE9M85X8D+FulsTDwi5JtUeBwh7XIQ1u9FDNhey42/A/E7X4Nto5nNcWyLpxtDv
         7pUn/w+20dCj3y+0S86Fm+t5Vx9QVByfrC4d6Uss9L67ytjGU8+yseVvY9O2CToecFUv
         x37jX676LdvIXC4beCUEfTrXx6DYNPrv93JmWYNk3eHTdLYWDky0+f+Y6DHDvmbsHXZN
         gZJTi2sAxAN8fxWONEtrrewYcedHLsX3n0JeBNADarhxeNPoX6zQbL0R5el/39Qyxm6O
         AuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yeyf/oi06hJUfNQuczxAkRie+GQv6sWniDZct6zx2xs=;
        b=KeazoTaRhVDFAFL3VkVyLCb5HXGILTV/CJTiOaulIcai9OjnRmzYE+8j/CrEHhFQ6O
         zvU7OFzvSFrDhgeY+L9XsEcD4cF1K32KzXVcnyIbHJb7DNKT+yhkZ/mKLh/masgT0/ZN
         2zPsZiUpshe0eOhNwaCVAIYYfQyjfWt/DxDPhD5pYvWKLO6VqW0adKUn2ZjxDUhodIUN
         4KZzO8hrg06Tgq4veRY3kcGGhcEq5OVBga/tQNGIQkPgCFcBQX7TJA/bdMiD2YxvCZnG
         f+AC5+M7wcLExPx4oc1TfTen49p0oEPBRC973ZZB7URqbdumEoJz40zZMFDVvcONSsF9
         s9aw==
X-Gm-Message-State: APjAAAUFBaP2V3I3NYbleqYEb87y3gcsz+K8Rc0V07EbA5dWl+xgqrCV
	ZZVVfCswexWXeRpwGku3Rtc=
X-Google-Smtp-Source: APXvYqx4D1nullWBgiODQaxraf3ARf5J5oTIPc1jVnW/gYJPzwMLjjamk4O+jEsRT7mw1Ivn4yva4g==
X-Received: by 2002:ae9:ec0b:: with SMTP id h11mr3687466qkg.97.1576171774669;
        Thu, 12 Dec 2019 09:29:34 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id b3sm2360646qtr.86.2019.12.12.09.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 09:29:34 -0800 (PST)
Date: Thu, 12 Dec 2019 12:29:32 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-netifaces: Remove the recipe
Message-ID: <20191212172931.GB29298@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191211013543.21608-1-zangrc.fnst@cn.fujitsu.com>
 <20191211014300.21887-1-zangrc.fnst@cn.fujitsu.com>
 <20191211014731.22128-1-zangrc.fnst@cn.fujitsu.com>
 <20191211015123.22351-1-zangrc.fnst@cn.fujitsu.com>
 <20191211015405.22539-1-zangrc.fnst@cn.fujitsu.com>
 <20191211031511.23509-1-zangrc.fnst@cn.fujitsu.com>
 <20191211031657.23664-1-zangrc.fnst@cn.fujitsu.com>
 <20191211032031.23845-1-zangrc.fnst@cn.fujitsu.com>
 <20191211032239.24015-1-zangrc.fnst@cn.fujitsu.com>
 <20191211032551.24188-1-zangrc.fnst@cn.fujitsu.com>
 <20191211032820.24358-1-zangrc.fnst@cn.fujitsu.com>
 <20191211033001.24525-1-zangrc.fnst@cn.fujitsu.com>
 <20191211033146.24683-1-zangrc.fnst@cn.fujitsu.com>
 <20191211033326.24835-1-zangrc.fnst@cn.fujitsu.com>
 <20191211034800.25085-1-zangrc.fnst@cn.fujitsu.com>
 <20191211035046.25261-1-zangrc.fnst@cn.fujitsu.com>
 <20191211035447.25435-1-zangrc.fnst@cn.fujitsu.com>
 <20191211035936.25648-1-zangrc.fnst@cn.fujitsu.com>
 <20191211040217.25804-1-zangrc.fnst@cn.fujitsu.com>
 <20191211040705.26318-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks,

The series is now merged .. a good start on cleanup and removing maintenance
burden!

Bruce

In message: [meta-virtualization] [PATCH] python-netifaces: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because they already exist in meta-openembedded, remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-netifaces.inc       | 10 ----------
>  .../recipes-devtools/python/python-netifaces_0.10.9.bb |  2 --
>  .../python/python3-netifaces_0.10.9.bb                 |  2 --
>  3 files changed, 14 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-netifaces.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-netifaces.inc b/meta-openstack/recipes-devtools/python/python-netifaces.inc
> deleted file mode 100644
> index b1b1ed5..0000000
> --- a/meta-openstack/recipes-devtools/python/python-netifaces.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Portable network interface information."
> -HOMEPAGE = "http://alastairs-place.net/netifaces"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> -
> -SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
> -SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
> -
> -inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb b/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
> deleted file mode 100644
> index aa9760b..0000000
> --- a/meta-openstack/recipes-devtools/python/python-netifaces_0.10.9.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools
> -require python-netifaces.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
> deleted file mode 100644
> index a46326f..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-netifaces_0.10.9.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-netifaces.inc
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4873): https://lists.yoctoproject.org/g/meta-virtualization/message/4873
> Mute This Topic: https://lists.yoctoproject.org/mt/68101076/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-netaddr: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-netaddr_0.7.19.bb   | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
> deleted file mode 100644
> index 1b50587..0000000
> --- a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "A library for network address representation and manipulation"
> -HOMEPAGE = "https://github.com/drkjam/netaddr"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
> -
> -SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
> -SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
> -
> -inherit setuptools pypi
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4872): https://lists.yoctoproject.org/g/meta-virtualization/message/4872
> Mute This Topic: https://lists.yoctoproject.org/mt/68098319/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-monotonic: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-monotonic_git.bb            | 31 -------------------
>  1 file changed, 31 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-monotonic_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-monotonic_git.bb b/meta-openstack/recipes-devtools/python/python-monotonic_git.bb
> deleted file mode 100644
> index 2552409..0000000
> --- a/meta-openstack/recipes-devtools/python/python-monotonic_git.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -DESCRIPTION = "An implementation of time.monotonic()"
> -HOMEPAGE = "https://github.com/atdt/monotonic"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> -
> -PV = "0.4"
> -SRCREV = "93b3d3ba63597e57b20333db4e33ca0f48debf2a"
> -
> -SRCNAME = "monotonic"
> -SRC_URI = "git://github.com/atdt/${SRCNAME}.git"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit distutils
> -
> -DEPENDS += " \
> -        python-pbr \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        "
> -
> -do_install_append() {
> -    # Using these "longest" paths will ensure needed shorter paths will be created
> -    install -d ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-info
> -
> -    install -m 644 ${S}/${SRCNAME}.py ${D}/${libdir}/python2.7/site-packages/
> -    install -m 644 ${S}/${SRCNAME}.egg-info/* ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-info/
> -}
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4871): https://lists.yoctoproject.org/g/meta-virtualization/message/4871
> Mute This Topic: https://lists.yoctoproject.org/mt/68096568/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-markupsafe: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-markupsafe_0.18.bb              | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb b/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
> deleted file mode 100644
> index 4551d46..0000000
> --- a/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
> -HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
> -SECTION = "devel/python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
> -
> -PYPI_PACKAGE = "MarkupSafe"
> -
> -SRC_URI[md5sum] = "f8d252fd05371e51dec2fe9a36890687"
> -SRC_URI[sha256sum] = "b7d5d688bdd345bfa897777d297756688cf02e1b3742c56885e2e5c2b996ff82"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += "python-re"
> -
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4870): https://lists.yoctoproject.org/g/meta-virtualization/message/4870
> Mute This Topic: https://lists.yoctoproject.org/mt/68094279/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-lxml: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-lxml_3.3.5.bb               | 22 -------------------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb b/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb
> deleted file mode 100644
> index 0e7dde4..0000000
> --- a/meta-openstack/recipes-devtools/python/python-lxml_3.3.5.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
> -HOMEPAGE = "http://lxml.de/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f9f1dc24f720c143c2240df41fe5073b"
> -
> -SRC_URI[md5sum] = "88c75f4c73fc8f59c9ebb17495044f2f"
> -SRC_URI[sha256sum] = "6ad6949dc7eea744a30fba77a968dd5910f545220e58bcc813b9df5c793e318a"
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
> -        python-beautifulsoup4 \
> -        python-cssselect \
> -        "
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4869): https://lists.yoctoproject.org/g/meta-virtualization/message/4869
> Mute This Topic: https://lists.yoctoproject.org/mt/68092053/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-jsonpointer: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-jsonpointer_1.9.bb  | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
> deleted file mode 100644
> index 12b5e89..0000000
> --- a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Identify specific nodes in a JSON document"
> -HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://jsonpointer.py;beginline=3;endline=31;md5=5e663c88967b53590856107a043d605c"
> -
> -SRC_URI[md5sum] = "c4d3f28e72ba77062538d1c0864c40a9"
> -SRC_URI[sha256sum] = "39403b47a71aa782de6d80db3b78f8a5f68ad8dfc9e674ca3bb5b32c15ec7308"
> -
> -inherit setuptools pypi
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4868): https://lists.yoctoproject.org/g/meta-virtualization/message/4868
> Mute This Topic: https://lists.yoctoproject.org/mt/68090364/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-jsonpatch: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-jsonpatch_1.11.bb | 12 ------------
>  1 file changed, 12 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb b/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
> deleted file mode 100644
> index 8971c96..0000000
> --- a/meta-openstack/recipes-devtools/python/python-jsonpatch_1.11.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION = "An implementation of the JSON Patch format"
> -HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
> -SECTION = "devel/python"
> -LICENSE = "BSD+"
> -LIC_FILES_CHKSUM = "file://jsonpatch.py;beginline=3;endline=30;md5=5cd7d1fbd6b236ed142e4285624f58fe"
> -
> -SRC_URI[md5sum] = "9f2d0aa31f99cc97089a203c5bed3924"
> -SRC_URI[sha256sum] = "22d0bc0f5522a4a03dd9fb4c4cdf7c1f03256546c88be4c61e5ceabd22280e47"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += "python-jsonpointer"
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4867): https://lists.yoctoproject.org/g/meta-virtualization/message/4867
> Mute This Topic: https://lists.yoctoproject.org/mt/68080079/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-jinja2: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-jinja2_2.7.3.bb             | 26 -------------------
>  1 file changed, 26 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb b/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
> deleted file mode 100644
> index 4ffa968..0000000
> --- a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
> -HOMEPAGE = "https://pypi.python.org/pypi/Jinja2"
> -SECTION = "devel/python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
> -
> -PYPI_PACKAGE = "Jinja2"
> -
> -SRC_URI[md5sum] = "b9dffd2f3b43d673802fe857c8445b1a"
> -SRC_URI[sha256sum] = "2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += "python-io \
> -                   python-pickle \
> -                   python-crypt \
> -                   python-math \
> -                   python-netclient \
> -                   python-re \
> -                   python-textutils \
> -                   python-lang \
> -                   python-pprint \
> -                   python-shell \
> -                   python-markupsafe"
> -
> -CLEANBROKEN = "1"
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4866): https://lists.yoctoproject.org/g/meta-virtualization/message/4866
> Mute This Topic: https://lists.yoctoproject.org/mt/68078877/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-iso8601: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-iso8601_0.1.10.bb   | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-iso8601_0.1.10.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-iso8601_0.1.10.bb b/meta-openstack/recipes-devtools/python/python-iso8601_0.1.10.bb
> deleted file mode 100644
> index 1db7543..0000000
> --- a/meta-openstack/recipes-devtools/python/python-iso8601_0.1.10.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Simple module to parse ISO 8601 dates"
> -HOMEPAGE = "http://code.google.com/p/pyiso8601/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ffb8415711cf5d3b081b87c3d0aff737"
> -
> -SRC_URI[md5sum] = "23acb1029acfef9c32069c6c851c3a41"
> -SRC_URI[sha256sum] = "e712ff3a18604833f5073e836aad795b21170b19bbef70947c441ed89d0ac0e1"
> -
> -inherit setuptools pypi
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4865): https://lists.yoctoproject.org/g/meta-virtualization/message/4865
> Mute This Topic: https://lists.yoctoproject.org/mt/68077597/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-html5lib: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-html5lib_0.999.bb           | 20 -------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-html5lib_0.999.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-html5lib_0.999.bb b/meta-openstack/recipes-devtools/python/python-html5lib_0.999.bb
> deleted file mode 100644
> index dd8b1d6..0000000
> --- a/meta-openstack/recipes-devtools/python/python-html5lib_0.999.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "HTML parser based on the WHATWG HTML specifcation"
> -HOMEPAGE = "https://github.com/html5lib/html5lib-python"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
> -
> -SRC_URI[md5sum] = "acb8ba4d6db5637360a07859192eb7f8"
> -SRC_URI[sha256sum] = "c3887f7e2875d7666107fa8bee761ff95b9391acdcc7cd1b5fd57a23b5fbc49e"
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
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4864): https://lists.yoctoproject.org/g/meta-virtualization/message/4864
> Mute This Topic: https://lists.yoctoproject.org/mt/68076599/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-dnspython: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-dnspython_1.12.0.bb         | 22 -------------------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-dnspython_1.12.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-dnspython_1.12.0.bb b/meta-openstack/recipes-devtools/python/python-dnspython_1.12.0.bb
> deleted file mode 100644
> index 36a1d12..0000000
> --- a/meta-openstack/recipes-devtools/python/python-dnspython_1.12.0.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "DNS toolkit for Python"
> -HOMEPAGE = "http://www.dnspython.org/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=397eddfcb4bc7e2ece2fc79724a7cca2"
> -
> -PR = "r0"
> -SRCNAME = "dnspython"
> -SRC_URI = "http://www.dnspython.org/kits/${PV}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "3f2601ef3c8b77fc6d21a9c77a81efeb"
> -SRC_URI[sha256sum] = "03fb82af866001c4afa58c48027bcc4b80bbf0a7f27e1d861cf06393eea4724f"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -# avoid "error: option --single-version-externally-managed not recognized"
> -DISTUTILS_INSTALL_ARGS = "--root=${D} \
> -    --prefix=${prefix} \
> -    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> -    --install-data=${datadir}"
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4863): https://lists.yoctoproject.org/g/meta-virtualization/message/4863
> Mute This Topic: https://lists.yoctoproject.org/mt/68075367/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-decorator: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-decorator_3.4.0.bb  | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb b/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
> deleted file mode 100644
> index 73111f6..0000000
> --- a/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Better living through Python with decorators"
> -HOMEPAGE = "http://pypi.python.org/pypi/decorator"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://setup.py;beginline=8;endline=8;md5=08a46ecda64aec8026447390e764b86e"
> -
> -SRC_URI[md5sum] = "1e8756f719d746e2fc0dd28b41251356"
> -SRC_URI[sha256sum] = "c20b404cbb7ee5cebd506688e0114e3cd76f5ce233805a51f36e1a7988d9d783"
> -
> -inherit setuptools  pypi
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4862): https://lists.yoctoproject.org/g/meta-virtualization/message/4862
> Mute This Topic: https://lists.yoctoproject.org/mt/68073681/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-contextlib2: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because they already exist in meta-openembedded, remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-contextlib2.inc                | 16 ----------------
>  .../python/python-contextlib2_0.6.0.bb           |  3 ---
>  .../python/python3-contextlib2_0.6.0.bb          |  3 ---
>  3 files changed, 22 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-contextlib2.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2.inc b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
> deleted file mode 100644
> index d409034..0000000
> --- a/meta-openstack/recipes-devtools/python/python-contextlib2.inc
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION = "Backports and enhancements for the contextlib module"
> -HOMEPAGE = "http://contextlib2.readthedocs.org/"
> -SECTION = "devel/python"
> -LICENSE = "PSF"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
> -
> -SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
> -SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277077ed3"
> -
> -DEPENDS += " \
> -        ${PYTHON_PN}-pip \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        "
> -
> diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.bb b/meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.bb
> deleted file mode 100644
> index c6a5c9b..0000000
> --- a/meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -inherit setuptools pypi
> -require python-contextlib2.inc
> -
> diff --git a/meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.0.bb b/meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.0.bb
> deleted file mode 100644
> index db5fa53..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.0.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -inherit setuptools3 pypi
> -require python-contextlib2.inc
> -
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4861): https://lists.yoctoproject.org/g/meta-virtualization/message/4861
> Mute This Topic: https://lists.yoctoproject.org/mt/68072339/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-cmd2: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-cmd2_0.6.8.bb     | 12 ------------
>  1 file changed, 12 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
> deleted file mode 100644
> index 6e8949d..0000000
> --- a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION = "Extra features for standard library's cmd module"
> -HOMEPAGE = "http://packages.python.org/cmd2/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
> -
> -SRC_URI[md5sum] = "c32c9a897e010c977b50c1ddc13f09fe"
> -SRC_URI[sha256sum] = "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8"
> -
> -inherit setuptools  pypi
> -
> -RDEPENDS_${PN} += "python-pyparsing"
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4860): https://lists.yoctoproject.org/g/meta-virtualization/message/4860
> Mute This Topic: https://lists.yoctoproject.org/mt/68069851/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-cachetools: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-cachetools.inc  | 14 --------------
>  .../python/python-cachetools_git.bb                |  2 --
>  .../python/python3-cachetools_git.bb               |  2 --
>  3 files changed, 18 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-cachetools.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-cachetools_git.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-cachetools_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-cachetools.inc b/meta-openstack/recipes-devtools/python/python-cachetools.inc
> deleted file mode 100644
> index a67794f..0000000
> --- a/meta-openstack/recipes-devtools/python/python-cachetools.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "Extensible memoizing collections and decorators"
> -HOMEPAGE = "https://github.com/tkem/cachetools"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=96c958336b659af4dad628356c5e43b6"
> -
> -SRCNAME = "cachetools"
> -
> -PV = "1.1.5+git${SRCPV}"
> -SRCREV = "42853733d0caf68ef5bf5933a377572b05437e2c"
> -
> -SRC_URI = "git://github.com/tkem/${SRCNAME}.git"
> -
> -S = "${WORKDIR}/git"
> diff --git a/meta-openstack/recipes-devtools/python/python-cachetools_git.bb b/meta-openstack/recipes-devtools/python/python-cachetools_git.bb
> deleted file mode 100644
> index ff0049f..0000000
> --- a/meta-openstack/recipes-devtools/python/python-cachetools_git.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-cachetools.inc
> -inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-cachetools_git.bb b/meta-openstack/recipes-devtools/python/python3-cachetools_git.bb
> deleted file mode 100644
> index 14e8b8c..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-cachetools_git.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-cachetools.inc
> -inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4859): https://lists.yoctoproject.org/g/meta-virtualization/message/4859
> Mute This Topic: https://lists.yoctoproject.org/mt/68068798/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-beautifulsoup4: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-beautifulsoup4.inc             | 16 ----------------
>  .../python/python-beautifulsoup4_4.4.1.bb        |  2 --
>  .../python/python3-beautifulsoup4_4.4.1.bb       |  2 --
>  3 files changed, 20 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-beautifulsoup4.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-beautifulsoup4_4.4.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4.inc b/meta-openstack/recipes-devtools/python/python-beautifulsoup4.inc
> deleted file mode 100644
> index 4ff500b..0000000
> --- a/meta-openstack/recipes-devtools/python/python-beautifulsoup4.inc
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION = "Screen-scraping library"
> -HOMEPAGE = "https://pypi.python.org/pypi/beautifulsoup4/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=39dacabe5494f61c8680f6fa7323b596"
> -
> -SRC_URI[md5sum] = "8fbd9a7cac0704645fa20d1419036815"
> -SRC_URI[sha256sum] = "87d4013d0625d4789a4f56b8d79a04d5ce6db1152bb65f1d39744f7709a366b4"
> -
> -inherit pypi
> -
> -# avoid "error: option --single-version-externally-managed not recognized"
> -DISTUTILS_INSTALL_ARGS = "--root=${D} \
> -    --prefix=${prefix} \
> -    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> -    --install-data=${datadir}"
> diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb
> deleted file mode 100644
> index 595fe5f..0000000
> --- a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-beautifulsoup4.inc
> -inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-beautifulsoup4_4.4.1.bb b/meta-openstack/recipes-devtools/python/python3-beautifulsoup4_4.4.1.bb
> deleted file mode 100644
> index 3bc9066..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-beautifulsoup4_4.4.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-beautifulsoup4.inc
> -inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4857): https://lists.yoctoproject.org/g/meta-virtualization/message/4857
> Mute This Topic: https://lists.yoctoproject.org/mt/68011295/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-babel: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-babel.inc   | 18 ------------------
>  .../python/python-babel_2.3.4.bb               |  2 --
>  .../python/python3-babel_2.3.4.bb              |  2 --
>  3 files changed, 22 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-babel.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-babel_2.3.4.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-babel.inc b/meta-openstack/recipes-devtools/python/python-babel.inc
> deleted file mode 100644
> index 5e133a1..0000000
> --- a/meta-openstack/recipes-devtools/python/python-babel.inc
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION = "A collection of tools for internationalizing Python applications"
> -HOMEPAGE = "http://babel.edgewall.org/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
> -
> -PYPI_PACKAGE = "Babel"
> -
> -SRC_URI[md5sum] = "afa20bc55b0e991833030129ad498f35"
> -SRC_URI[sha256sum] = "c535c4403802f6eb38173cd4863e419e2274921a01a8aad8a5b497c131c62875"
> -
> -inherit pypi
> -
> -CLEANBROKEN = "1"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-pytz \
> -"
> diff --git a/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb b/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
> deleted file mode 100644
> index 74952d1..0000000
> --- a/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-babel.inc
> -inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-babel_2.3.4.bb b/meta-openstack/recipes-devtools/python/python3-babel_2.3.4.bb
> deleted file mode 100644
> index 42b0008..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-babel_2.3.4.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-babel.inc
> -inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4856): https://lists.yoctoproject.org/g/meta-virtualization/message/4856
> Mute This Topic: https://lists.yoctoproject.org/mt/68010574/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-appdirs: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-appdirs_git.bb              | 34 -------------------
>  1 file changed, 34 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-appdirs_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb b/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
> deleted file mode 100644
> index 2482871..0000000
> --- a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -DESCRIPTION = "A small Python module for determining appropriate platform-specific dirs, e.g. a user data dir."
> -HOMEPAGE = "http://github.com/ActiveState/appdirs"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
> -
> -PV = "1.4.0"
> -SRCREV = "57f2bc44a8bca99bac6c57496c8b3fdea26f94d5"
> -
> -SRCNAME = "appdirs"
> -SRC_URI = "git://github.com/ActiveState/${SRCNAME}.git"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-pip \
> -        "
> -
> -do_install_append() {
> -    # Using these "longest" paths will ensure needed shorter paths will be created
> -    install -d ${D}/${libdir}/python2.7/site-packages/${SRCNAME}/test
> -    install -d ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-info
> -    
> -    install -m 644 ${S}/${SRCNAME}.py ${D}/${libdir}/python2.7/site-packages/${SRCNAME}/__init__.py
> -    install -m 644 ${S}/${SRCNAME}.pyc ${D}/${libdir}/python2.7/site-packages/${SRCNAME}/__init__.pyc
> -    install -m 644 ${S}/test/* ${D}/${libdir}/python2.7/site-packages/${SRCNAME}/test/
> -    install -m 644 ${S}/${SRCNAME}.egg-info/* ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-info/
> -}
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4855): https://lists.yoctoproject.org/g/meta-virtualization/message/4855
> Mute This Topic: https://lists.yoctoproject.org/mt/68010522/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-anyjson: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because they already exist in meta-openembedded, remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-anyjson.inc       | 12 ------------
>  .../recipes-devtools/python/python-anyjson_0.3.3.bb  |  2 --
>  .../recipes-devtools/python/python3-anyjson_0.3.3.bb |  2 --
>  3 files changed, 16 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-anyjson.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-anyjson.inc b/meta-openstack/recipes-devtools/python/python-anyjson.inc
> deleted file mode 100644
> index 19e03e9..0000000
> --- a/meta-openstack/recipes-devtools/python/python-anyjson.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -DESCRIPTION = "Loads the best available JSON implementation available in a common interface"
> -HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
> -
> -inherit pypi
> -
> -SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
> -SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-simplejson"
> diff --git a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb b/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> deleted file mode 100644
> index 2b90a2a..0000000
> --- a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-anyjson.inc
> -inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
> deleted file mode 100644
> index d4d13ac..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-anyjson.inc
> -inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4854): https://lists.yoctoproject.org/g/meta-virtualization/message/4854
> Mute This Topic: https://lists.yoctoproject.org/mt/68010446/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-alembic: Remove the recipe
on 11/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-alembic_0.8.10.bb             | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb b/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
> deleted file mode 100644
> index 5a377d6..0000000
> --- a/meta-openstack/recipes-devtools/python/python-alembic_0.8.10.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "A database migration tool for SQLAlchemy."
> -HOMEPAGE = "http://bitbucket.org/zzzeek/alembic"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d07407716fd24408b5747b0fa2262775"
> -
> -SRC_URI[md5sum] = "21b344a70ce637699c18bf074a080649"
> -SRC_URI[sha256sum] = "0e3b50e96218283ec7443fb661199f5a81f5879f766967a8a2d25e8f9d4e7919"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += " \
> -    python-sqlalchemy \
> -    python-mako \
> -    python-python-editor \
> -    "
> -
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4853): https://lists.yoctoproject.org/g/meta-virtualization/message/4853
> Mute This Topic: https://lists.yoctoproject.org/mt/68010346/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


