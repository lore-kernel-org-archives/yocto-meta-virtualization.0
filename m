Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0398E009D4; Sat, 14 Sep 2019 21:04:42 -0700 (PDT)
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
	*      [209.85.166.43 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E08FE00C11
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:04:40 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id m11so71313914ioo.0
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JXl8t40zWd1vXyrEMDQT/Sz1Z3C/VUZlr98sEsAAM/Q=;
	b=fKBm5Sze3Pmag/WTXXCJ75fs9RzBAFzjv19W8GExnAFQcZnUftgUMapsl0UiKE9Hj8
	q/KJEC57TFFqbR8UlGbJWopBMVgZA8ae0tlv2fUGDW89wukMjJIhbdsXQMyDeEPAv4hJ
	YYtcYZ2KCSVEIVAaPDvkey8xJZUhWx9lqrMeo3EF5uqN2qxCpy9J4lAoFtjulh04Gpic
	N4oULZV9XYfgt6TxptOAQjSWuyk4NIC8cy6+c7zVsRERXJkKr3BuPoebb7TcawxPtQV1
	pF7TxRJNxKuU5A6ShdZPS9AbcaOg+kG2YhGl5DXYSxOCmAQpFKwYSMX3rPFsWsqt9Tv/
	cMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JXl8t40zWd1vXyrEMDQT/Sz1Z3C/VUZlr98sEsAAM/Q=;
	b=N/tYf+gUJ635DWQCPzD//3lf2Q501nn3k0/ySDO25H8cEy5oBYPpYcNoxRhPmaPP5s
	KsaoMeZBD7cqx9CXgfTfoQtDXVYW7JAzmxsFW7WetnB4Il36Zmdh0aLwYeb9wRA3Tv+1
	GrNtscTfWwiNc5m9p7T0h0Ozm5sYVu7amhjl+V3vudQViwitT/WS7S7soHr2aHwcKyWJ
	iVJGHPdu7S9O3FOV3ztc8ua2XULUHWYCiTeHVTvQLRqzw83adm/hfmSZK3Zkz9DHw9ni
	u6cl7bKD30/PgZIlkWLwXr/GRx66wTsTNX5IMly7ZGTziiQa0jTCa8w7AIQ00o48foOJ
	R/zQ==
X-Gm-Message-State: APjAAAVbPWMoDROQ+FURLffCvZto61WPEZ3dqgf3kTBrjk6XoG8Y0/E3
	Cx+ftzDC8i/vDRYwZLRNiIQ=
X-Google-Smtp-Source: APXvYqyzHf7/PdPvIUg/zRw3IFqqqPD6YSqSjzfqCYMHjiLcDnKKY5mVgN/22R1TWpzIqD6A16siww==
X-Received: by 2002:a02:55c4:: with SMTP id e187mr54150147jab.32.1568520280168;
	Sat, 14 Sep 2019 21:04:40 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	l186sm60438724ioa.54.2019.09.14.21.04.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 21:04:39 -0700 (PDT)
Date: Sun, 15 Sep 2019 00:04:37 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190915040437.GC4367@gmail.com>
References: <20190910023538.23354-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190910023538.23354-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-sqlparse: Add python3 version
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
X-List-Received-Date: Sun, 15 Sep 2019 04:04:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python-sqlparse: Add python3 version
on 10/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-sqlparse.inc    | 22 ++++++++++++++++++++
>  .../python/python-sqlparse_0.3.0.bb                | 24 ++--------------------
>  .../python/python3-sqlparse_0.3.0.bb               |  2 ++
>  3 files changed, 26 insertions(+), 22 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse.inc b/meta-openstack/recipes-devtools/python/python-sqlparse.inc
> new file mode 100644
> index 0000000..cc55ff7
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-sqlparse.inc
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Non-validating SQL parser module"
> +HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
> +
> +SRC_URI[md5sum] = "2ce34181d6b7b234c9f3c0ecd1ffb93e"
> +SRC_URI[sha256sum] = "7c3dca29c022744e95b547e867cee89f4fce4373f3549ccd8797d8eb52cdb873"
> +
> +export BUILD_SYS
> +export HOST_SYS
> +
> +inherit pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
> index 88a0e8c..2b7773f 100644
> --- a/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-sqlparse_0.3.0.bb
> @@ -1,22 +1,2 @@
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
> -inherit setuptools pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        "
> +inherit setuptools
> +require python-sqlparse.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb b/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
> new file mode 100644
> index 0000000..7b3bcf6
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-sqlparse_0.3.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-sqlparse.inc
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

