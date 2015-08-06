Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F07B5E00A73; Wed,  5 Aug 2015 19:45:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AD73E00A53
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 19:45:41 -0700 (PDT)
Received: by ykeo23 with SMTP id o23so51823233yke.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 05 Aug 2015 19:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7pipLl0gBq/qGLOlJlsL3rOCGxlEIqQ9EezUV+jFF2Q=;
	b=PjYKnxUxdMD5XZib1/nQHBLHh+XSI797dxaz28xoucYQK7sdmIOqR98MCFKE9ABYTM
	D3XG3GdJGhqxCXSBxQ6UeTS8BYiQsWWFm6yxous3ubD3RCKxaFCXmbCsmB3+JypUUP2x
	78+RH4zh2D88b+Ao++osJf1dJ5oWDvvPOdTsSkv64txrWb2PsgSB3YA/hSM6zkxFfZAf
	74TOy4KwCNyKQXLAHv9hAo7CwN554Hd8PrepLt9KKMwCt8fQdVqS/bVQoM58NrciZpSc
	0XyAUSCp/rJO/8Qln7aL1W34lLkTVMxC7LkHPODbtNzKkwuZznBxeTUDoQtj/PYuoysq
	cCnQ==
MIME-Version: 1.0
X-Received: by 10.13.198.2 with SMTP id i2mr12977174ywd.123.1438829140664;
	Wed, 05 Aug 2015 19:45:40 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Wed, 5 Aug 2015 19:45:40 -0700 (PDT)
In-Reply-To: <1438595880-47411-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1438595880-47411-1-git-send-email-leimaohui@cn.fujitsu.com>
Date: Wed, 5 Aug 2015 22:45:40 -0400
Message-ID: <CADkTA4Ph5AHd4uiY10D=BZyWFTYGjPywB0UOULsi1xcRbOuhKg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-sphinx: upgrade 1.2b1 -> 1.3.1
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
X-List-Received-Date: Thu, 06 Aug 2015 02:45:46 -0000
Content-Type: text/plain; charset=UTF-8

Thanks. I've merged your changes.

Bruce

On Mon, Aug 3, 2015 at 5:58 AM, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../python/{python-sphinx_1.2b1.bb => python-sphinx_1.3.1.bb}       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-devtools/python/{python-sphinx_1.2b1.bb => python-sphinx_1.3.1.bb} (58%)
>
> diff --git a/recipes-devtools/python/python-sphinx_1.2b1.bb b/recipes-devtools/python/python-sphinx_1.3.1.bb
> similarity index 58%
> rename from recipes-devtools/python/python-sphinx_1.2b1.bb
> rename to recipes-devtools/python/python-sphinx_1.3.1.bb
> index acdba56..fe8ad94 100644
> --- a/recipes-devtools/python/python-sphinx_1.2b1.bb
> +++ b/recipes-devtools/python/python-sphinx_1.3.1.bb
> @@ -2,15 +2,15 @@ DESCRIPTION = "Python documentation generator"
>  HOMEPAGE = "http://sphinx-doc.org/"
>  SECTION = "devel/python"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=da9cf9fa4e0d0076dd4d116777ad401e"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6dd095eaa1e7a662b279daf80ecad7e6"
>
>  PR = "r0"
>  SRCNAME = "Sphinx"
>
>  SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "67bea6df63be8e2a76ebedc76d8f71a3"
> -SRC_URI[sha256sum] = "16102b69e939d9ee60b05d694a804a83e3ce047c283f6b981a83573a75ea718d"
> +SRC_URI[md5sum] = "8786a194acf9673464c5455b11fd4332"
> +SRC_URI[sha256sum] = "1a6e5130c2b42d2de301693c299f78cc4bd3501e78b610c08e45efc70e2b5114"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

