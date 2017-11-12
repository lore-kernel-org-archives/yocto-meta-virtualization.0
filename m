Return-Path: <paul.eggleton@linux.intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C87EE00C35; Sun, 12 Nov 2017 12:01:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [134.134.136.31 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1376FE00BEA
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Nov 2017 12:01:09 -0800 (PST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Nov 2017 12:01:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,385,1505804400"; d="scan'208";a="148846451"
Received: from mintingh-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.199])
	by orsmga004.jf.intel.com with ESMTP; 12 Nov 2017 12:01:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 13 Nov 2017 09:01:03 +1300
Message-ID: <1576630.ONkWi2uVLd@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20171030225413.938-1-paul.eggleton@linux.intel.com>
References: <20171030225413.938-1-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] python-*: use https for pypi URLs
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
X-List-Received-Date: Sun, 12 Nov 2017 20:01:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 31 October 2017 11:54:13 AM NZDT Paul Eggleton wrote:
> Several of the recipes here were using http URLs for source hosted on
> pypi - pypi apparently no longer supports http so switch to https
> instead.
> 
> Fixes [YOCTO #12286].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  recipes-devtools/python/python-gevent_1.0.1.bb    | 2 +-
>  recipes-devtools/python/python-m2crypto_0.22.3.bb | 2 +-
>  recipes-devtools/python/python-sphinx_1.4.1.bb    | 2 +-
>  recipes-devtools/python/python-webob_1.6.0.bb     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
> index 47f1267..8ac1295 100644
> --- a/recipes-devtools/python/python-gevent_1.0.1.bb
> +++ b/recipes-devtools/python/python-gevent_1.0.1.bb
> @@ -13,7 +13,7 @@ RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
>  
>  SRCNAME = "gevent"
>  
> -SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
>  SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
>  SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
>  
> diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> index 95d6eec..9814d3d 100644
> --- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
> +++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> @@ -14,7 +14,7 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
>  
>  SRCNAME = "M2Crypto"
> -SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
> +SRC_URI = "https://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
>             file://m2crypto-Fix-build-with-SWIG-3.0.5.patch \
>  "
>  
> diff --git a/recipes-devtools/python/python-sphinx_1.4.1.bb b/recipes-devtools/python/python-sphinx_1.4.1.bb
> index 835b369..b4ae86b 100644
> --- a/recipes-devtools/python/python-sphinx_1.4.1.bb
> +++ b/recipes-devtools/python/python-sphinx_1.4.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
>  PR = "r0"
>  SRCNAME = "Sphinx"
>  
> -SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>  
>  SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
>  SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537a57e2fcf4d7c799410eba18236bc76d6bc"
> diff --git a/recipes-devtools/python/python-webob_1.6.0.bb b/recipes-devtools/python/python-webob_1.6.0.bb
> index 71c74ff..93f2acf 100644
> --- a/recipes-devtools/python/python-webob_1.6.0.bb
> +++ b/recipes-devtools/python/python-webob_1.6.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
>  PR = "r0"
>  SRCNAME = "WebOb"
>  
> -SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>  
>  SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
>  SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277fa2209f7f57eb47b537eeecfea383d55b7"
> 

ping ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

