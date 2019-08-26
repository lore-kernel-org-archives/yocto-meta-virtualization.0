Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA695E00CDF; Sun, 25 Aug 2019 19:15:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3507E008E3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:15:35 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id m24so13558104ljg.8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nq0xnB1PeQW/Q/sSeLUiYpKy8wp+jYiAu5S9ZwxJbtY=;
	b=PXXHL2uo904JFDSQ5fAp9NNxa2iKZcP6H1qERUMSLiIX/hgLrKz9n/RE26Y4dVhYJu
	fdVwRjKzNwEH15ySS9GMi/FSDbfTd1Vh8GjADXY/TDQE4vcLP3rsJ3l/0dsdev3Nwq50
	469uXYr1XWaU/sd7cUotgUDsIZ4MhBDIaha/RuWWYAkn1eu/0r+SK7Na1JZCH9ABLSHD
	96yG2hECU+zwFVwi4wFWyL2wEldmnxf/vkj354j/aER4v+Aef17ktjJKGBZyxLP74Hx/
	dtZWM7pIqlpdoaCao/LVQ8DowYzAAInWulL6sQXZwAc7r1oGrmE/yzPSvFFpUjahoP15
	HWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nq0xnB1PeQW/Q/sSeLUiYpKy8wp+jYiAu5S9ZwxJbtY=;
	b=cIFADGgZnjeqJewqynJL68CgKjAQnmG2LAsO0751Yx8uM99yYuxI/4C74BB+/vjRqG
	Pg6zUyqsJRMNjzJeX29kDUQdVpF1ZkcGtEzwA7nXIAMxZ3uo642kf1nDIRgMt+AGq/Fl
	d0TSa1APLnZU2GrUL6yuaVxyiknOSAbZuq0nIsIj//lC1Z4NyL/BZY4bosMmY0i5eo8i
	VJClH2rkrUGdM8IjjyiSgj4itVzqTM6ygOoSR4Ll02+ebUcdEf9d4eoWenLYsZvlnELf
	gxJs0P97OijC+moH0sCMC683yyzN2IR8RWOUehMjbtlGrHYE1iN8qaBHPQJUErsC52mP
	nHnw==
X-Gm-Message-State: APjAAAX2EcjWI7KqauetCLlB0Dk1kZzLa03Wx4sZBgYP2IbvF2/gvleT
	/5yD3zGKLWVVGHa7d8PsvagRoU+AruZX6V6GEPdfBEtN
X-Google-Smtp-Source: APXvYqzfre+0/jEIb94rGUEnJmPNTtMDaEDP57KNjs9gBiNb44K5A1olkjbQAXL/ObrFZrNmfjjo5ICelC1bsSV/gVc=
X-Received: by 2002:a05:651c:1036:: with SMTP id
	w22mr8752734ljm.79.1566785734546; 
	Sun, 25 Aug 2019 19:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <1566189334-75782-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1566189334-75782-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 25 Aug 2019 22:15:23 -0400
Message-ID: <CADkTA4MDo0MDSsOcPi4cTa6DxY0W368fP+tpNvHMw6RBaTLv+A@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-amqp: Add python3 version
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
X-List-Received-Date: Mon, 26 Aug 2019 02:15:36 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 19, 2019 at 12:38 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Providing a python3 version of python-amqp.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-amqp.inc      | 14 ++++++++++++++
>  .../recipes-devtools/python/python-amqp_2.4.1.bb | 16 ++--------------
>  .../python/python3-amqp_2.4.1.bb                 |  2 ++
>  3 files changed, 18 insertions(+), 14 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-amqp.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-amqp.inc b/meta-openstack/recipes-devtools/python/python-amqp.inc
> new file mode 100644
> index 0000000..8863ac2
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-amqp.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Low-level AMQP client for Python"
> +HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
> +
> +SRC_URI[md5sum] = "9e3d5f1f69d2106c2b3f77d275a79924"
> +SRC_URI[sha256sum] = "6816eed27521293ee03aa9ace300a07215b11fee4e845588a9b863a7ba30addb"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-vine \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb b/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
> index dee95db..9d52062 100644
> --- a/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-amqp_2.4.1.bb
> @@ -1,14 +1,2 @@
> -DESCRIPTION = "Low-level AMQP client for Python"
> -HOMEPAGE = "https://pypi.python.org/pypi/amqp/"
> -SECTION = "devel/python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
> -
> -SRC_URI[md5sum] = "9e3d5f1f69d2106c2b3f77d275a79924"
> -SRC_URI[sha256sum] = "6816eed27521293ee03aa9ace300a07215b11fee4e845588a9b863a7ba30addb"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += " \
> -        python-vine \
> -        "
> +inherit setuptools
> +require python-amqp.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb b/meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb
> new file mode 100644
> index 0000000..c2710da
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-amqp.inc
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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

