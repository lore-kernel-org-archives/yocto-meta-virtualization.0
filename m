Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 423BCE00B1B; Sat, 14 Sep 2019 21:04:57 -0700 (PDT)
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
	*      [209.85.166.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3489CE007C2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:04:56 -0700 (PDT)
Received: by mail-io1-f68.google.com with SMTP id k5so46028094iol.5
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Tqmi8MDNqlk+YpmR1OybbiDA5MPi61xmBtjwSfmwaMM=;
	b=ffqLlOGWq0lN+3S9pZSEp87O6zsqt+5SE2rStgCzljxtXBh5xDcMIP494x3rucFexn
	J4Wr/K4TyQHl4osn5xXipU+HXSOQK588uWgwGSLQ2FpfxckSwjMCz2qevetTUB6KS4wY
	5b1XqKw3IPKCO8H0/9uAgpY3pNHd3E39haom/+zPl+nlawxxRpvDJQadjQhoFiGyFmV0
	ogguONqBfUZqoUwTxvOuz9byJZKWC3qUk/Hy6D/fRVq6Qz4W/2u3FsuRCR72eDkKlD7b
	PlNjsYlCE/crhHUMROjm/g0ASeqmzqLaOwFWVqGfffeXmEZunzANUlvFuDKiY2rQ8I9X
	KUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Tqmi8MDNqlk+YpmR1OybbiDA5MPi61xmBtjwSfmwaMM=;
	b=ZBIovYyWGMWjnhnUmpJsT1IP5feK4luCF3kRf29X4CQG28wdKx2EGc4/Xe2F1/3rDG
	li5vqY2bmSyfz/0BbEz5NFF+c5zgVbzpVp2JBq3MF6A+yP87IPg7lvrr4FIqn0KcZUy+
	H4W05Bdg39bLaL+ACE2g4TXO4T0FoiN0oYoqgIb5+5kDVcRCFpIX5X9XirGtUGmMpH6/
	wXDX1iUMAVkCN30qjWzkwQsMsp3p4Q11oydlFpmvBzEa/xiz3Lb/8WBAoOgTm57aU91x
	ASWJ5/0Z4q0P1GUwjhQGff69NAd28JcyZN4220iaMZSHOil/3S1ssiU3sdLSN8oAvPyo
	jjow==
X-Gm-Message-State: APjAAAUqCgeyuV4wGCCoY33aBI/ZDU0XL1kswcMVk93sRPuact2Phipp
	4CQJJIe5mnFlETG8b5Jbd3c=
X-Google-Smtp-Source: APXvYqyPvakoTMmOGWWKWA4YZT8nki2ufAWQK6IPRilKsvkK2l//Uxaw1FWdwx6OIsYTT5WzDvk7ww==
X-Received: by 2002:a6b:ec18:: with SMTP id c24mr9413702ioh.72.1568520294189; 
	Sat, 14 Sep 2019 21:04:54 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y17sm26171771ioa.52.2019.09.14.21.04.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 21:04:53 -0700 (PDT)
Date: Sun, 15 Sep 2019 00:04:49 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20190915040448.GD4367@gmail.com>
References: <1568255791-42428-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1568255791-42428-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-cliff: Add python3 version
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
X-List-Received-Date: Sun, 15 Sep 2019 04:04:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization]  [PATCH] python-cliff: Add python3 version
on 12/09/2019 Zheng Ruoqin wrote:

> Providing a python3 version of python-cliff.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-cliff.inc  | 31 +++++++++++++++++++
>  .../python/python-cliff_2.16.0.bb             | 31 ++-----------------
>  .../python/python3-cliff_2.16.0.bb            |  2 ++
>  3 files changed, 36 insertions(+), 28 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-cliff.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-cliff.inc b/meta-openstack/recipes-devtools/python/python-cliff.inc
> new file mode 100644
> index 0000000..cc66717
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-cliff.inc
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "Command Line Interface Formulation Framework"
> +HOMEPAGE = "https://github.com/dreamhost/cliff"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI[md5sum] = "89e96c6c8c5922832e124ed81c21a55b"
> +SRC_URI[sha256sum] = "622e777b8ac2eb479708fe53893c37b2fd5469ce2c6c5b794a658246f05c6b81"
> +
> +inherit pypi
> +
> +DEPENDS += "\
> +    ${PYTHON_PN}-pbr \
> +    "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +    ${PYTHON_PN}-pbr-native \
> +    "
> +
> +RDEPENDS_${PN} += " \
> +            ${PYTHON_PN}-cmd2 \
> +            ${PYTHON_PN}-pbr \
> +            ${PYTHON_PN}-pyparsing \
> +            ${PYTHON_PN}-prettytable \
> +            ${PYTHON_PN}-six \
> +            ${PYTHON_PN}-stevedore \
> +            ${PYTHON_PN}-pyyaml \
> +"
> +
> +CLEANBROKEN = "1"
> diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
> index 0d49f8c..6fadd5b 100644
> --- a/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
> @@ -1,32 +1,7 @@
> -DESCRIPTION = "Command Line Interface Formulation Framework"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -SRC_URI[md5sum] = "89e96c6c8c5922832e124ed81c21a55b"
> -SRC_URI[sha256sum] = "622e777b8ac2eb479708fe53893c37b2fd5469ce2c6c5b794a658246f05c6b81"
> -
> -inherit setuptools pypi
> -
> -DEPENDS += "\
> -    python-pbr \
> -    "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -    python-pbr-native \
> -    "
> +inherit setuptools
> +require python-cliff.inc
>  
> +# RDEPENDS only fot python2
>  RDEPENDS_${PN} += " \
> -            python-cmd2 \
> -            python-pbr \
> -            python-pyparsing \
> -            python-prettytable \
> -            python-six \
> -            python-stevedore \
>              python-unicodecsv \
> -            python-pyyaml \
>  "
> -
> -CLEANBROKEN = "1"
> diff --git a/meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.bb b/meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.bb
> new file mode 100644
> index 0000000..07923ca
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-cliff.inc
> -- 
> 2.17.1
> 
> 
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

