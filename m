Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B17ADE00C78; Thu, 29 Aug 2019 21:30:26 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E79A7E009EA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:30:25 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id e24so5127014ljg.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Doe9L5z9mkUQCXgEhhWKoHMY1ixThzY4bDvivj1Z4aA=;
	b=gXD1ggHBl1AwClFJ6wmqiAlVFOgQv1zXAuq5pAFPo3ENChO8wxKWoOQkqxMUAO2/lj
	4j9F6FoDWL1pga/LamUX6vmKCInSrtnhrnka00jWf44UU58ok5Lc1peh6SQJDc388gF4
	utfdX8rk6YFYsUGgeHUb91n7QeOMfYcqArTbnWTz5uTURYmPo/yC7ZFUMVVxIwoDEka+
	xEk2Ckdy0aIMOXDF2CH7OElVzq5fUuqUTXjCefSPqSqjZZPHh0pGPI8yrMRPmN6ejnAW
	H0TvuNwemfErBxfOWrBwIZjh6rQ+6hWEg9bUKc5yoUcHPUcFZMeugQRwtqprPdMojx4+
	0QfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Doe9L5z9mkUQCXgEhhWKoHMY1ixThzY4bDvivj1Z4aA=;
	b=NVeC04AvVYBXbxmdFoI1RWQZYP7AWr9/omeSXpV50YlNAI9lCE+diEEWeQ//bxM85I
	yLLKUBnmVhueIAHWSiBdxBzvyvB0NqUXTFAl0XgCwIhIYNv+pZOs7Qo5AHiec4OrdLCn
	2MaUFhKUFzN8/eQK9ZU5zD5bbOmzXbVkWFrvhX2lWb/nSEd8mVoc1xddXdIZX/+iDTWg
	c9jSD8bNoao8a0XTipnCqyr5Unr2IKauMWkcJTWSY+WzZpQEHCj1NYCAdmy7iuUq1q6c
	CYFhevk5bNzI1FPYSER8afrUoyuWTvYG651u5VJv5n+txFdRqxV7ObFwDg9mPhhpDVGn
	JBZg==
X-Gm-Message-State: APjAAAVsfLaJEQw9yPymTkXdaU/BP3hE3dxPwbc+id1bhLrjEc9jjMv2
	XGUqTpxjtlJvUr8W/EW8RITISLC1DjvEmY1x77UcafFR
X-Google-Smtp-Source: APXvYqxi4XiQAGbGnd6DNqls1VR0C/SWn4gSBhnb31uPqrO9H8GgdU0mzfuAqGZ21vnGxP4VFcA9KQ92mSSo3CpoQ7w=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr623124lje.118.1567139424238; 
	Thu, 29 Aug 2019 21:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190829072507.15367-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190829072507.15367-1-yuanc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:30:13 -0400
Message-ID: <CADkTA4NmYSHBjHdouRO39eS=6mX_3c=956fc2kp7oV+HOtvvTQ@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python3-sphinx: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 04:30:26 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 29, 2019 at 3:25 AM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  recipes-devtools/python/python3-sphinx_2.2.0.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 recipes-devtools/python/python3-sphinx_2.2.0.bb
>
> diff --git a/recipes-devtools/python/python3-sphinx_2.2.0.bb b/recipes-devtools/python/python3-sphinx_2.2.0.bb
> new file mode 100644
> index 0000000..5ea408f
> --- /dev/null
> +++ b/recipes-devtools/python/python3-sphinx_2.2.0.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "Python documentation generator"
> +HOMEPAGE = "http://sphinx-doc.org/"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=cc3ed00294f08c93200bc064c73c9d40"
> +
> +PYPI_PACKAGE = "Sphinx"
> +
> +SRC_URI[md5sum] = "ca64efdbb4d3a0a78398dbcf9f78971d"
> +SRC_URI[sha256sum] = "0d586b0f8c2fc3cc6559c5e8fd6124628110514fda0e5d7c82e682d749d2e845"
> +inherit setuptools3 pypi
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

