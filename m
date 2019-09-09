Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD47DE00D1C; Mon,  9 Sep 2019 10:35:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.222.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F4E5E00C81
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:35:33 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id o11so13885436qkg.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9QlNn18AuFeqcN1/dxJ3wfEFxeFxwN3fgOjj6QLJgM0=;
	b=jWLiOm9G/8xDIWyMg8WOaYOfzNotR/ZAmNbbag6PYT8SvwA7E6PKCJERq4+eme3Wlf
	21xPjMul9a03pnjwqH71PgOyoco7NrEGuZKsJFB5vbCsWpqIsSRgr67Y3F1X8Vt19r+O
	TtM1sxQhi/OUg+rb74M4+jgNGk4R5Dy0qKYnAF5E9s+w0ebDEDLZkcm0sfECIHVwc48E
	ak3GfTaeJTVFP9mCbQMZcFmKV/BnkjP5v0Bd20onliA4KB1xVK8K6ExyYz+hOEulcumP
	5xsB2m6q2d0VtPLS15QKB30NSJgVUdlTusKFMXLhzapWwi1gPu8Khh6JI00zN728gvPy
	W7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9QlNn18AuFeqcN1/dxJ3wfEFxeFxwN3fgOjj6QLJgM0=;
	b=Hg8mqiAM+giSNWyA0oZHvYqzlDCkbO8N0BAdtRF2+VtP8k5ZXkGj9aywpix0zRoaOY
	fMVLRdno5xRZ4u/hh7odZwX/qyI2ZcRxC3y5XeR+R93RnduzDwu/DXbU2HFrP1Oq2OAK
	fn0o4NRuO0F66p0k7B2lo/XbkOMRCYqaokyLEDLFPCWVqKVTgbEGtcfhb6Y2R908WcdY
	Rb1Y6VXaVwB9OkWVE4me7f+dn/TxPnRNtfQr457LsDVsY6Hx5dSjryIk9GPdNgRxX0sl
	+t/OkBBtEqCsN5je4XtusEMtDM3k78QvYzyP889gkg+7nDNR2XpJHOndqXRBtUcfeRmr
	fdyw==
X-Gm-Message-State: APjAAAVvQlR89cPBjsZ2jJvEAO/pLjii4XEzy3zU472U7ebJ6YCUuJgV
	SzH5YqJ22zt1ArX6nmED5vo=
X-Google-Smtp-Source: APXvYqwhW1B56KLANtzQeCf0eyPJy94o/LdytywG3aeDmplnV0C9YOscQyuF8jkb6+LajR5Gx6R6Xw==
X-Received: by 2002:ae9:e40c:: with SMTP id q12mr24613987qkc.455.1568050532283;
	Mon, 09 Sep 2019 10:35:32 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	v5sm10007863qtk.66.2019.09.09.10.35.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 10:35:32 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:35:27 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190909173524.GA27188@gmail.com>
References: <20190906054344.19107-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190906054344.19107-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-waitress: Add python3 version
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
X-List-Received-Date: Mon, 09 Sep 2019 17:35:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged

Bruce

In message: [meta-virtualization] [PATCH] python-waitress: Add python3 version
on 06/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-waitress.inc   | 10 ++++++++++
>  .../recipes-devtools/python/python-waitress_1.3.1.bb         | 12 ++----------
>  .../recipes-devtools/python/python3-waitress_1.3.1.bb        |  2 ++
>  3 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-waitress.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress.inc b/meta-openstack/recipes-devtools/python/python-waitress.inc
> new file mode 100644
> index 0000000..1053983
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-waitress.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Waitress WSGI server"
> +HOMEPAGE = "https://pypi.python.org/pypi/waitress/"
> +SECTION = "devel/python"
> +LICENSE = "ZPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
> +
> +SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
> +SRC_URI[sha256sum] = "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
> index 78af225..ecce64c 100644
> --- a/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
> @@ -1,10 +1,2 @@
> -DESCRIPTION = "Waitress WSGI server"
> -HOMEPAGE = "https://pypi.python.org/pypi/waitress/"
> -SECTION = "devel/python"
> -LICENSE = "ZPL-2.1"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
> -
> -SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
> -SRC_URI[sha256sum] = "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
> -
> -inherit setuptools pypi
> +inherit setuptools
> +require python-waitress.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb b/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
> new file mode 100644
> index 0000000..89e8208
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-waitress_1.3.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-waitress.inc
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

