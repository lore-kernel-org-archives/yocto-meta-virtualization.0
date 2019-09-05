Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06DFAE00D77; Thu,  5 Sep 2019 06:58:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  3.5 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 676B9E00C4F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 06:58:03 -0700 (PDT)
Received: by mail-io1-f66.google.com with SMTP id f4so4331771ion.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Sep 2019 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ca9E3a6gJBRhCWpqv6riy+mwiZqaQC/r+cOtfjd1lc0=;
	b=gw3PqgmWjgJzlNw82bYZr7h7I58DDcomq63UT5nfE2CzoENvFnbWbCnL0Q0SlrP06v
	SgpLeL2omaw02OR+Ml9P95rBiBVgwmAK87weO6YsOSD2TY8nmk+rVLfyTl1WWa21SRWj
	De2HBrc3b6xHKXL6Pr7a7g7J1B/kNJb5GFvGlnwu7FwY2N8UYBK0zmFWohcM0rgK5Uj2
	5RD5ge9SCSQx+AeqOa57tjP6kjj3xwEGuNuHeHTAuQ3F0uthnQD0z89rRaduMt0p0T2e
	3EfUun+4Xh6OWv65D/+N9Y1/RAGG896n8i8j9mfA5B3C4vNy6KbAT5/uS8U8aRLam39i
	VQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ca9E3a6gJBRhCWpqv6riy+mwiZqaQC/r+cOtfjd1lc0=;
	b=GGu06VzpxHGhc4oIuPtMF81QJ8OShTHkWEg7Wee4DpsHbeII4cy+l8ckngqdVjSrIP
	BnYU8TiAfl2T/bD5DqqKNilmzSPw5Y3q0iqFe0bjZWHwB5Zsv64K+owomnIwj+ynGacn
	yT5q5ithilvlLs9yc05Z2WsEggIMvHNEfU7f6MP0WIyCd6e+y7gwyQPztzW+VucNJpDM
	pnG2Nf0BU24xG93mmIXg13wVhf04tCoPj5zsmCaffJMsyxzvofOsQyM96NaYcUFkCD9J
	x80tINS7X01oijRGr/r8SIdtifJIpm+O/Ke32ce/pfqLK3TdoaaE8/uhrpfOT1eYVpEZ
	wQbQ==
X-Gm-Message-State: APjAAAXTVZFkEtRjEXi/Wuibh4slrTVYLDRzO+H60Oo7NKI4AdJWwM0y
	xRhjyBoHP9QeBCQaVWE+U5c=
X-Google-Smtp-Source: APXvYqwANihcAMPGubIPH/zBOobPsF4yHqDliQbI2L1rB4QigE6g9INn7Na0QK8RzELY0N4JLtePdQ==
X-Received: by 2002:a5e:c301:: with SMTP id a1mr4315509iok.1.1567691882424;
	Thu, 05 Sep 2019 06:58:02 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	m11sm1040401iok.39.2019.09.05.06.58.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 06:58:01 -0700 (PDT)
Date: Thu, 5 Sep 2019 09:57:59 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190905135756.GA46415@gmail.com>
References: <20190904022318.615-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190904022318.615-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-logutils: Add python3 version
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
X-List-Received-Date: Thu, 05 Sep 2019 13:58:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-logutils: Add python3 version
on 04/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-logutils.inc        | 16 ++++++++++++++++
>  .../recipes-devtools/python/python-logutils_0.3.5.bb   | 18 ++----------------
>  .../recipes-devtools/python/python3-logutils_0.3.5.bb  |  2 ++
>  3 files changed, 20 insertions(+), 16 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-logutils.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-logutils.inc b/meta-openstack/recipes-devtools/python/python-logutils.inc
> new file mode 100644
> index 0000000..87ab631
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-logutils.inc
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Set of handlers for the Python standard library's logging package"
> +HOMEPAGE = "https://pypi.python.org/pypi/logutils"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
> +
> +SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
> +SRC_URI[sha256sum] = "bc058a25d5c209461f134e1f03cab637d66a7a5ccc12e593db56fbb279899a82"
> +
> +inherit pypi
> +
> +# avoid "error: option --single-version-externally-managed not recognized"
> +DISTUTILS_INSTALL_ARGS = "--root=${D} \
> +    --prefix=${prefix} \
> +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> +    --install-data=${datadir}"
> diff --git a/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
> index 51177b3..9331a16 100644
> --- a/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-logutils_0.3.5.bb
> @@ -1,16 +1,2 @@
> -DESCRIPTION = "Set of handlers for the Python standard library's logging package"
> -HOMEPAGE = "https://pypi.python.org/pypi/logutils"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44c35f0b8e2a27a2f33a4e4a5c65d014"
> -
> -SRC_URI[md5sum] = "fcd2f8e9217bfa0b580f253b35a9d954"
> -SRC_URI[sha256sum] = "bc058a25d5c209461f134e1f03cab637d66a7a5ccc12e593db56fbb279899a82"
> -
> -inherit setuptools pypi
> -
> -# avoid "error: option --single-version-externally-managed not recognized"
> -DISTUTILS_INSTALL_ARGS = "--root=${D} \
> -    --prefix=${prefix} \
> -    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> -    --install-data=${datadir}"
> +inherit setuptools
> +require python-logutils.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb b/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
> new file mode 100644
> index 0000000..4d760e0
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-logutils_0.3.5.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-logutils.inc
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

