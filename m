Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E891FE00D68; Tue,  3 Sep 2019 12:53:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84830E00BF8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 12:53:53 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id l20so2837388ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QxU/gL8G3AQo3p9pnznYHaQBExI7p08sHqI0F2xHJr8=;
	b=pQM4cEhMZWIaqdDc6Wd9Nm9ZshOrVc69Pu8NDt9WrWLt8HzrJ2kYYoOb2P8O+08WGU
	0jZAdaR4Sx5KVVpzVze7GQLwNeYWHBV8zO4mFLMOFSqqvwpVH2O8DNgTzygH4fL3f56O
	+23wW1XL8Iem2xm1hiHpmJLBAJDG0iQT0uTf3H6hrGj2/CXeloWSff9QBAORNUP2co66
	Fgrz+HLqI54YxpGiNIKLM04cGrfAS6mLLcs0UNH/L0y4mMtWEHbLdU+QvjiNnOWNSwaL
	MW6INUzoYdegjtAbmwAsQUSsjX2yxkBA0B350VL7pZswNugp9b5YmtxdkucfQoHyQZqA
	+pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QxU/gL8G3AQo3p9pnznYHaQBExI7p08sHqI0F2xHJr8=;
	b=CmUGFhaLTFWuwiTXy1i+G/XGa/tVjoo2bFJvCDsTh0OF59XX93lK+s5L9UJ+rLZbly
	K8CNrygYh3mOnl3Hf8wQ4XIHt8Z72HnrV6ikd11BDz2XrGdAd6gmcteg/S6NXMgYRMDW
	rkS/x8N3cN9ZXH5E5ye672QgbQH+aAczDrq/fR4Hk5Us//fX34wY3kiCi5cZk4MPPI/E
	sQkTxS63RNQFwKT3Y+AEl/M8EkSU5rqd91LwF8nIrTj88BXh1OBRkB+khruB4tGDdjBp
	PExEAwne7KY91XRT7pX8a5AUU+PtGj0W+d3js6+NzMNcAACLFml6ORJWJaVksuNaLmcb
	6nIA==
X-Gm-Message-State: APjAAAU/7dtSLNHiu4h0XBsNxmzt96+yG00Y4CeJviZQMSi9LgUAcmns
	qsPnU1t6M2t0j5SK6ILDwOggQAz3sLnoCQSx275GHY1r
X-Google-Smtp-Source: APXvYqxUwJBXFGqKpzsj5tBBqUxtchwkv+ce2QkNJ603wQKuY8YyQtZ22E1gbYrmb7uwZ2+IdE2FuVGoEfHOF/+Zgf0=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr4548136ljg.232.1567540432530; 
	Tue, 03 Sep 2019 12:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190830055805.18650-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190830055805.18650-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 15:53:41 -0400
Message-ID: <CADkTA4O6Nm_U-XHUhuA2Mq6P0d=9VtAfray+7QuZDrd30=0Okg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-httpretty: Add python3 version
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
X-List-Received-Date: Tue, 03 Sep 2019 19:53:55 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Aug 30, 2019 at 1:58 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-httpretty.inc      | 18 ++++++++++++++++++
>  .../recipes-devtools/python/python-httpretty_0.9.6.bb | 19 ++-----------------
>  .../python/python3-httpretty_0.9.6.bb                 |  3 +++
>  3 files changed, 23 insertions(+), 17 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-httpretty.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httpretty.inc b/meta-openstack/recipes-devtools/python/python-httpretty.inc
> new file mode 100644
> index 0000000..f39e283
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-httpretty.inc
> @@ -0,0 +1,18 @@
> +#
> +# Copyright (C) 2014 Wind River Systems, Inc.
> +#
> +DESCRIPTION = "HTTP client mock for Python"
> +HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
> +
> +SRC_URI[md5sum] = "3b881b519e0f405caaf8aaa63f3508c0"
> +SRC_URI[sha256sum] = "01b52d45077e702eda491f4fe75328d3468fd886aed5dcc530003e7b2b5939dc"
> +
> +inherit pypi
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
> index 68d79f3..8993807 100644
> --- a/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
> @@ -1,18 +1,3 @@
> -#
> -# Copyright (C) 2014 Wind River Systems, Inc.
> -#
> -DESCRIPTION = "HTTP client mock for Python"
> -HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
> -
> -SRC_URI[md5sum] = "3b881b519e0f405caaf8aaa63f3508c0"
> -SRC_URI[sha256sum] = "01b52d45077e702eda491f4fe75328d3468fd886aed5dcc530003e7b2b5939dc"
> -
> -inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> +inherit setuptools
> +require python-httpretty.inc
>
> diff --git a/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb b/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb
> new file mode 100644
> index 0000000..b9f7699
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb
> @@ -0,0 +1,3 @@
> +inherit setuptools3
> +require python-httpretty.inc
> +
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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

