Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.408.1577124902380803898
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Dec 2019 10:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PFiRkK+t;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E641FE0130D; Mon, 23 Dec 2019 10:15:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,FSL_HELO_FAKE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.8 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4AC4E00839
	for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 10:14:57 -0800 (PST)
Received: by mail-qk1-f194.google.com with SMTP id x129so14187875qke.8
        for <meta-virtualization@yoctoproject.org>; Mon, 23 Dec 2019 10:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=WpcnyUzLJ//rUPciKBS99Mjp8OznkOECNZhI3t67+fc=;
        b=PFiRkK+tkG/OZq6gEiJlSLllDwEffR4EmPdS9n7Bwmbgjs+0Js2Fwz9Ban1S6OBJ1B
         Xw6yWUgermzEFVtuWwgb2hI5GyFTMUu76Te9Qwp8r4ogXzmXj6UwugYhvzk1NWnCp3Do
         t5Ywmmh0QFb2HNE3460017gFTv03QVrd8CCxpDCHn0jb2/PI9k6rqeoFCWaetDEcRZi2
         SUlOOjA4NVm8FfbOmqqr83FOE0nuvoXBr3P/dXq0isXD2jCtPD2HHGda/dIr2OjjELUc
         tNzYiYmENz7bKj4RXHuOauMw0ZtmJBVjmh/ZXqq4CIpvuVtiFhbzEq327XkxBI5FX7TP
         mdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WpcnyUzLJ//rUPciKBS99Mjp8OznkOECNZhI3t67+fc=;
        b=iqVM/+r2UrFjmllqxuWeHz1nGS3BRFqKrge0X2k6/KUGT+8xjVdUrIW5ylSgEJ9zCy
         myicudOslWV4C8Dnv2yd9HPmHFqiHIRYW0HckD/SqBGWPZ/Pq+Xs8H3mgKkx+sPGudsn
         XtjxhWLVd3JSpUT9FMwO8xVxtppGrQHaTYUs5nvypL4ZMXkJ2sgPi30UFrrHQAZBH8y8
         gSPYoiBmKzVDyv7cVbZ6sko8di5VR8Zqw5Znl1mAj4sGd3rgyI7fR3Nl4k6y7NRFQQYb
         5xIq4m5TZz/WFaCLNUlesWWggvgelnUzWfhbmAw/m9yuXaF8ohCENy+EiFbE493e4T9t
         jLGQ==
X-Gm-Message-State: APjAAAX0keqtr3GnLnZiDuAylzlFVgVI8dhxykcALij9f2Pvw0wffLPp
	n7Z77FAAJaf30L1zs5wfL1wVmbLG8k4E+Q==
X-Google-Smtp-Source: APXvYqx1hNFRWRD83nOp7l6mx+9s6cwCtFWm4/IMjlJ8tRLTidR79lxAn6vmW31s+V1aVDCs3G62eA==
X-Received: by 2002:a37:9a46:: with SMTP id c67mr27184499qke.308.1577124896420;
        Mon, 23 Dec 2019 10:14:56 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id u52sm6607113qta.23.2019.12.23.10.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 10:14:55 -0800 (PST)
Date: Mon, 23 Dec 2019 13:14:53 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-wrapt: Remove the recipe
Message-ID: <20191223181452.GA5430@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191220015014.5719-1-zangrc.fnst@cn.fujitsu.com>
 <20191220015256.5888-1-zangrc.fnst@cn.fujitsu.com>
 <20191220015655.6078-1-zangrc.fnst@cn.fujitsu.com>
 <20191220020009.6314-1-zangrc.fnst@cn.fujitsu.com>
 <20191220020218.6514-1-zangrc.fnst@cn.fujitsu.com>
 <20191220020520.6674-1-zangrc.fnst@cn.fujitsu.com>
 <20191220021010.7027-1-zangrc.fnst@cn.fujitsu.com>
 <20191220021235.7246-1-zangrc.fnst@cn.fujitsu.com>
 <20191220021456.7410-1-zangrc.fnst@cn.fujitsu.com>
 <20191220023652.7733-1-zangrc.fnst@cn.fujitsu.com>
 <20191223012126.31689-1-zangrc.fnst@cn.fujitsu.com>
 <20191223012347.31854-1-zangrc.fnst@cn.fujitsu.com>
 <20191223013451.32146-1-zangrc.fnst@cn.fujitsu.com>
 <20191223013647.32312-1-zangrc.fnst@cn.fujitsu.com>
 <20191223013858.32459-1-zangrc.fnst@cn.fujitsu.com>
 <20191223014849.361-1-zangrc.fnst@cn.fujitsu.com>
 <20191223015040.530-1-zangrc.fnst@cn.fujitsu.com>
 <20191223015258.701-1-zangrc.fnst@cn.fujitsu.com>
 <20191223015457.969-1-zangrc.fnst@cn.fujitsu.com>
 <20191223015701.1160-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-wrapt: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-wrapt_git.bb   | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-wrapt_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-wrapt_git.bb b/meta-openstack/recipes-devtools/python/python-wrapt_git.bb
> deleted file mode 100644
> index a2def9a..0000000
> --- a/meta-openstack/recipes-devtools/python/python-wrapt_git.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION = "A Python module for decorators, wrappers and monkey patching."
> -HOMEPAGE = "https://github.com/GrahamDumpleton/wrapt"
> -SECTION = "devel/python"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=848d45ec255e411c0ff82b034a49d8a0"
> -
> -PV = "1.10.5"
> -SRCREV = "42af0563bf88e84d215dea9ea6f989cb867e930e"
> -
> -SRCNAME = "wrapt"
> -SRC_URI = "git://github.com/GrahamDumpleton/${SRCNAME}.git"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4903): https://lists.yoctoproject.org/g/meta-virtualization/message/4903
> Mute This Topic: https://lists.yoctoproject.org/mt/69220453/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-waitress: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because they already exist in meta-openembedded, remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-waitress.inc        | 10 ----------
>  .../recipes-devtools/python/python-waitress_1.3.1.bb   |  2 --
>  .../recipes-devtools/python/python3-waitress_1.3.1.bb  |  2 --
>  3 files changed, 14 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-waitress.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress.inc b/meta-openstack/recipes-devtools/python/python-waitress.inc
> deleted file mode 100644
> index 1053983..0000000
> --- a/meta-openstack/recipes-devtools/python/python-waitress.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Waitress WSGI server"
> -HOMEPAGE = "https://pypi.python.org/pypi/waitress/"
> -SECTION = "devel/python"
> -LICENSE = "ZPL-2.1"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
> -
> -SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
> -SRC_URI[sha256sum] = "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
> -
> -inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
> deleted file mode 100644
> index ecce64c..0000000
> --- a/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools
> -require python-waitress.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb b/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
> deleted file mode 100644
> index 89e8208..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-waitress.inc
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4902): https://lists.yoctoproject.org/g/meta-virtualization/message/4902
> Mute This Topic: https://lists.yoctoproject.org/mt/69220439/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-vcversioner: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-vcversioner_2.14.0.0.bb      | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> deleted file mode 100644
> index 7811b69..0000000
> --- a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION = "An implementation of JSON Schema validation for Python"
> -HOMEPAGE = "http://github.com/Julian/jsonschema"
> -SECTION = "devel/python"
> -LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://vcversioner.py;beginline=1;endline=13;md5=b20bc154910c13368ad5ba54560f0b0c"
> -
> -SRC_URI[md5sum] = "7848a365ced9941053bc25d9a9f8f4b4"
> -SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357c03b86"
> -
> -inherit setuptools pypi
> -
> -
> -DEPENDS_class-native += " \
> -        python \
> -        python-setuptools \
> -        "
> -
> -BBCLASSEXTEND = "native"
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4901): https://lists.yoctoproject.org/g/meta-virtualization/message/4901
> Mute This Topic: https://lists.yoctoproject.org/mt/69220422/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-stevedore: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-stevedore_1.29.0.bb         | 20 -------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-stevedore_1.29.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.29.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.29.0.bb
> deleted file mode 100644
> index 4b02f03..0000000
> --- a/meta-openstack/recipes-devtools/python/python-stevedore_1.29.0.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "Manage dynamic plugins for Python applications"
> -HOMEPAGE = "https://github.com/dreamhost/stevedore"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -SRC_URI[md5sum] = "525186cba577852e0408c92c3f8fac65"
> -SRC_URI[sha256sum] = "1e153545aca7a6a49d8337acca4f41c212fbfa60bf864ecd056df0cafb9627e8"
> -
> -inherit setuptools rmargparse pypi
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-six \
> -        "
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4900): https://lists.yoctoproject.org/g/meta-virtualization/message/4900
> Mute This Topic: https://lists.yoctoproject.org/mt/69220403/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-sqlparse: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because they already exist in meta-openembedded, remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-sqlparse.inc                | 22 -------------------
>  .../python/python-sqlparse_0.3.0.bb           |  2 --
>  .../python/python3-sqlparse_0.3.0.bb          |  2 --
>  3 files changed, 26 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse.inc b/meta-openstack/recipes-devtools/python/python-sqlparse.inc
> deleted file mode 100644
> index cc55ff7..0000000
> --- a/meta-openstack/recipes-devtools/python/python-sqlparse.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "Non-validating SQL parser module"
> -HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
> -
> -SRC_URI[md5sum] = "2ce34181d6b7b234c9f3c0ecd1ffb93e"
> -SRC_URI[sha256sum] = "7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873"
> -
> -export BUILD_SYS
> -export HOST_SYS
> -
> -inherit pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
> deleted file mode 100644
> index 2b7773f..0000000
> --- a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools
> -require python-sqlparse.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb b/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
> deleted file mode 100644
> index 7b3bcf6..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-sqlparse.inc
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4899): https://lists.yoctoproject.org/g/meta-virtualization/message/4899
> Mute This Topic: https://lists.yoctoproject.org/mt/69220391/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pyudev: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pyudev_0.16.1.bb    | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb b/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
> deleted file mode 100644
> index 39f725d..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "A libudev binding"
> -HOMEPAGE = "http://pyudev.readthedocs.org/"
> -SECTION = "devel/python"
> -LICENSE = "LGPL-2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
> -
> -SRC_URI[md5sum] = "4034de584b6d9efcbfc590a047c63285"
> -SRC_URI[sha256sum] = "765d1c14bd9bd031f64e2612225621984cb2bbb8cbc0c03538bcc4c735ff1c95"
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
> View/Reply Online (#4898): https://lists.yoctoproject.org/g/meta-virtualization/message/4898
> Mute This Topic: https://lists.yoctoproject.org/mt/69220307/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pytz: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pytz_2013.8.bb      | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb b/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
> deleted file mode 100644
> index 485c4ff..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "World timezone definitions, modern and historical"
> -HOMEPAGE = "http://pytz.sourceforge.net"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
> -
> -SRC_URI[md5sum] = "37750ca749ed3a52523b9682b0b7e381"
> -SRC_URI[sha256sum] = "58552e870aa2c0a1fa3b4ef923f00fbf3e55afaa87f8d31244d44f188de4793a"
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
> View/Reply Online (#4897): https://lists.yoctoproject.org/g/meta-virtualization/message/4897
> Mute This Topic: https://lists.yoctoproject.org/mt/69220294/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pytest: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-pytest_2.7.0.bb               | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb b/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb
> deleted file mode 100644
> index 55c784b..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pytest_2.7.0.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "pytest: simple powerful testing with Python"
> -HOMEPAGE = " http://pytest.org"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
> -
> -SRC_URI[md5sum] = "14cde91b1106c937c48497728ea37dc6"
> -SRC_URI[sha256sum] = "91dc842785417208d57e5e8dc8bb40f57316c45da24a50c53b49cb8d045519d6"
> -
> -inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
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
> View/Reply Online (#4896): https://lists.yoctoproject.org/g/meta-virtualization/message/4896
> Mute This Topic: https://lists.yoctoproject.org/mt/69220280/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pymongo: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pymongo_3.4.0.bb    | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb b/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb
> deleted file mode 100644
> index 34dc076..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pymongo_3.4.0.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Python driver for MongoDB"
> -HOMEPAGE = "https://pypi.python.org/pypi/pymongo/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
> - 
> -SRC_URI[md5sum] = "aa77f88e51e281c9f328cea701bb6f3e"
> -SRC_URI[sha256sum] = "d359349c6c9ff9f482805f89e66e476846317dc7b1eea979d7da9c0857ee2721"
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
> View/Reply Online (#4895): https://lists.yoctoproject.org/g/meta-virtualization/message/4895
> Mute This Topic: https://lists.yoctoproject.org/mt/69220158/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pycrypto: Remove the recipe
on 23/12/2019 zangrc wrote:

> Because this already exists in meta-openembedded and there is python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python-pycrypto/cross-compiling.patch     | 23 --------------
>  .../python/python-pycrypto_2.6.1.bb           | 30 -------------------
>  2 files changed, 53 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pycrypto/cross-compiling.patch
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pycrypto/cross-compiling.patch b/meta-openstack/recipes-devtools/python/python-pycrypto/cross-compiling.patch
> deleted file mode 100644
> index 712f3e8..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pycrypto/cross-compiling.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Index: pycrypto-2.6/setup.py
> -===================================================================
> ---- pycrypto-2.6.orig/setup.py
> -+++ pycrypto-2.6/setup.py
> -@@ -271,7 +271,8 @@ class PCTBuildConfigure(Command):
> -         if not os.path.exists("config.status"):
> -             if os.system("chmod 0755 configure") != 0:
> -                 raise RuntimeError("chmod error")
> --            cmd = "sh configure"    # we use "sh" here so that it'll work on mingw32 with standard python.org binaries
> -+            host = os.environ.get("HOST_SYS")
> -+            cmd = "ac_cv_func_malloc_0_nonnull=yes sh configure --host " + host   # we use "sh" here so that it'll work on mingw32 with standard python.org binaries
> -             if self.verbose < 1:
> -                 cmd += " -q"
> -             if os.system(cmd) != 0:
> -@@ -370,7 +371,7 @@ kw = {'name':"pycrypto",
> -       'ext_modules': plat_ext + [
> -             # _fastmath (uses GNU mp library)
> -             Extension("Crypto.PublicKey._fastmath",
> --                      include_dirs=['src/','/usr/include/'],
> -+                      include_dirs=['src/'],
> -                       libraries=['gmp'],
> -                       sources=["src/_fastmath.c"]),
> - 
> diff --git a/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb b/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
> deleted file mode 100644
> index fc91074..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pycrypto_2.6.1.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -DESCRIPTION = "Cryptographic modules for Python."
> -HOMEPAGE = "http://www.pycrypto.org/"
> -SECTION = "devel/python"
> -LICENSE = "PSFv2"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
> -
> -SRC_URI += " \
> -    file://cross-compiling.patch \
> -"
> -
> -SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
> -SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
> -
> -export STAGING_INCDIR
> -export STAGING_LIBDIR
> -export BUILD_SYS
> -export HOST_SYS
> -
> -inherit autotools autotools-brokensep distutils pypi
> -
> -DEPENDS += " gmp"
> -
> -do_compile[noexec] = "1"
> -
> -# We explicitly call distutils_do_install, since we want it to run, but
> -# *don't* want the autotools install to run, since this package doesn't
> -# provide a "make install" target.
> -do_install() {
> -	distutils_do_install
> -}
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4894): https://lists.yoctoproject.org/g/meta-virtualization/message/4894
> Mute This Topic: https://lists.yoctoproject.org/mt/69220144/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pyasn1-modules: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-pyasn1-modules_0.2.1.bb         | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb
> deleted file mode 100644
> index c812fe6..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pyasn1-modules_0.2.1.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION = "A collection of ASN.1-based protocols modules."
> -HOMEPAGE = "https://pypi.python.org/pypi/pyasn1-modules/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=280606d9c18f200e03e0c247ac61475a"
> -
> -SRC_URI[md5sum] = "ff938698590f314ff9b3d5c48737d899"
> -SRC_URI[sha256sum] = "af00ea8f2022b6287dc375b2c70f31ab5af83989fc6fe9eacd4976ce26cd7ccc"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += " \
> -        python-pyasn1 \
> -        "
> -	
> \ No newline at end of file
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4893): https://lists.yoctoproject.org/g/meta-virtualization/message/4893
> Mute This Topic: https://lists.yoctoproject.org/mt/68843539/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pyasn1: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pyasn1_0.1.7.bb     | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb b/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb
> deleted file mode 100644
> index 972290d..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pyasn1_0.1.7.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "ASN.1 types and codecs"
> -HOMEPAGE = "http://sourceforge.net/projects/pyasn1/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ae098273b2cf8b4af164ac20e32bddf7"
> -
> -SRC_URI[md5sum] = "2cbd80fcd4c7b1c82180d3d76fee18c8"
> -SRC_URI[sha256sum] = "e4f81d53c533f6bd9526b047f047f7b101c24ab17339c1a7ad8f98b25c101eab"
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
> View/Reply Online (#4892): https://lists.yoctoproject.org/g/meta-virtualization/message/4892
> Mute This Topic: https://lists.yoctoproject.org/mt/68843224/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-py: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-py_1.4.26.bb                 | 18 ------------------
>  1 file changed, 18 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-py_1.4.26.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb b/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb
> deleted file mode 100644
> index 1ecc092..0000000
> --- a/meta-openstack/recipes-devtools/python/python-py_1.4.26.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION = "library with cross-python path, ini-parsing, io, code, log facilities"
> -HOMEPAGE = " http://pylib.org"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
> -
> -SRC_URI[md5sum] = "30c3fd92a53f1a5ed6f3591c1fe75c0e"
> -SRC_URI[sha256sum] = "28dd0b90d29b386afb552efc4e355c889f4639ce93658a7872a2150ece28bb89"
> -
> -inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-virtualenv \
> -        "
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4891): https://lists.yoctoproject.org/g/meta-virtualization/message/4891
> Mute This Topic: https://lists.yoctoproject.org/mt/68843194/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-prettytable: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because this already exists in meta-openembedded and there is python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-prettytable_0.7.2.bb          | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> deleted file mode 100644
> index 8e09f02..0000000
> --- a/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "Python library for displaying tabular data in a ASCII table format"
> -HOMEPAGE = "http://code.google.com/p/prettytable"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
> -
> -SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
> -SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
> -
> -inherit setuptools pypi
> -
> -do_install_append() {
> -	perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
> -	for f in $perm_files; do
> -		chmod 644 "${f}"
> -	done
> -}
> \ No newline at end of file
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4890): https://lists.yoctoproject.org/g/meta-virtualization/message/4890
> Mute This Topic: https://lists.yoctoproject.org/mt/68843159/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-ply: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-ply_3.4.bb          | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-ply_3.4.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-ply_3.4.bb b/meta-openstack/recipes-devtools/python/python-ply_3.4.bb
> deleted file mode 100644
> index a73e6c3..0000000
> --- a/meta-openstack/recipes-devtools/python/python-ply_3.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
> -HOMEPAGE = "https://pypi.python.org/pypi/ply"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README;beginline=3;endline=30;md5=36197c7ddf450a50a52cf6e743196b1d"
> -
> -SRC_URI[md5sum] = "ffdc95858819347bf92d7c2acc074894"
> -SRC_URI[sha256sum] = "af435f11b7bdd69da5ffbc3fecb8d70a7073ec952e101764c88720cdefb2546b"
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
> View/Reply Online (#4889): https://lists.yoctoproject.org/g/meta-virtualization/message/4889
> Mute This Topic: https://lists.yoctoproject.org/mt/68843101/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pint: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-pint_0.6.bb                 | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pint_0.6.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pint_0.6.bb b/meta-openstack/recipes-devtools/python/python-pint_0.6.bb
> deleted file mode 100644
> index 0e987b5..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pint_0.6.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "Physical quantities module"
> -HOMEPAGE = "https://pypi.python.org/pypi/Pint"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
> -
> -PYPI_PACKAGE = "Pint"
> -
> -# Archived version so we have to overwrite what the pypi class will derive
> -PYPI_SRC_URI = "https://pypi.python.org/packages/source/P/${PYPI_PACKAGE}/${PYPI_PACKAGE}-${PV}.zip"
> -
> -SRC_URI[md5sum] = "88aa0918019071546b10c5fbdc91ae5e"
> -SRC_URI[sha256sum] = "b1ab3b589ca4d78689233a007abd5a7eec4ea65302cabaed06932d20f2a9e748"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += "gmp"
> -
> -FILES_${PN} += "${datadir}/*"
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4888): https://lists.yoctoproject.org/g/meta-virtualization/message/4888
> Mute This Topic: https://lists.yoctoproject.org/mt/68843066/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pika: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because there are higher versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pika.inc         | 13 -------------
>  .../recipes-devtools/python/python-pika_git.bb      |  3 ---
>  .../recipes-devtools/python/python3-pika_git.bb     |  3 ---
>  3 files changed, 19 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pika.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pika_git.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-pika_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pika.inc b/meta-openstack/recipes-devtools/python/python-pika.inc
> deleted file mode 100644
> index d33979d..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pika.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "Pure Python RabbitMQ/AMQP 0-9-1 client library"
> -HOMEPAGE = "https://github.com/pika/pika"
> -SECTION = "devel/python"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fb26c37045f9e0d2c5e24b711bd7f01c"
> -
> -PV = "0.10.0+git${SRCPV}"
> -SRCREV = "b907f91415169b7f590174ab5d228e75a1b273e6"
> -
> -SRC_URI = "git://github.com/pika/pika"
> -
> -S = "${WORKDIR}/git"
> diff --git a/meta-openstack/recipes-devtools/python/python-pika_git.bb b/meta-openstack/recipes-devtools/python/python-pika_git.bb
> deleted file mode 100644
> index 9d58184..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pika_git.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require python-pika.inc
> -
> -inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-pika_git.bb b/meta-openstack/recipes-devtools/python/python3-pika_git.bb
> deleted file mode 100644
> index 93f50b4..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-pika_git.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require python-pika.inc
> -
> -inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4887): https://lists.yoctoproject.org/g/meta-virtualization/message/4887
> Mute This Topic: https://lists.yoctoproject.org/mt/68843026/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pexpect: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-pexpect_3.3.bb                | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb b/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb
> deleted file mode 100644
> index 8b93fdf..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pexpect_3.3.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY = "A Pure Python Expect like Module for Python"
> -SECTION = "devel/python"
> -LICENSE = "PSF"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c25d9a0770ba69a9965acc894e9f3644"
> -
> -inherit distutils pypi
> -
> -RDEPENDS_${PN} = "\
> -    python-core \
> -    python-io \
> -    python-terminal \
> -    python-resource \
> -    python-fcntl \
> -"
> -
> -SRC_URI[md5sum] = "0de72541d3f1374b795472fed841dce8"
> -SRC_URI[sha256sum] = "dfea618d43e83cfff21504f18f98019ba520f330e4142e5185ef7c73527de5ba"
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4886): https://lists.yoctoproject.org/g/meta-virtualization/message/4886
> Mute This Topic: https://lists.yoctoproject.org/mt/68842993/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-passlib: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-passlib_1.6.2.bb    | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb b/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb
> deleted file mode 100644
> index 78f9b01..0000000
> --- a/meta-openstack/recipes-devtools/python/python-passlib_1.6.2.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "comprehensive password hashing framework supporting over 30 schemes"
> -HOMEPAGE = "http://passlib.googlecode.com"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ec76a9db3f987418e132c0f0210e5ab1"
> -
> -SRC_URI[md5sum] = "2f872ae7c72ca338634c618f2cff5863"
> -SRC_URI[sha256sum] = "e987f6000d16272f75314c7147eb015727e8532a3b747b1a8fb58e154c68392d"
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
> View/Reply Online (#4885): https://lists.yoctoproject.org/g/meta-virtualization/message/4885
> Mute This Topic: https://lists.yoctoproject.org/mt/68842945/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-networkx: Remove the recipe
on 20/12/2019 zangrc wrote:

> Because there are higher versions and python3 versions in meta-openembedded, Remove the recipe.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-networkx_1.11.bb            | 20 -------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-networkx_1.11.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-networkx_1.11.bb b/meta-openstack/recipes-devtools/python/python-networkx_1.11.bb
> deleted file mode 100644
> index f187663..0000000
> --- a/meta-openstack/recipes-devtools/python/python-networkx_1.11.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "Python package for creating and manipulating graphs and networks"
> -HOMEPAGE = "http://networkx.lanl.gov/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=925586ea588eb990de840dc71ea3752f"
> -
> -SRC_URI[md5sum] = "6ef584a879e9163013e9a762e1cf7cd1"
> -SRC_URI[sha256sum] = "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8"
> -
> -inherit setuptools pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-decorator \
> -        "
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4884): https://lists.yoctoproject.org/g/meta-virtualization/message/4884
> Mute This Topic: https://lists.yoctoproject.org/mt/68842904/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


