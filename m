Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B52DE009D8; Thu, 29 Aug 2019 21:22:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2699E00E07
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:22:04 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id x4so5145357ljj.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aLL4+7wxOSAs0tcSNcb66oljrBUvNA4j/V/8CLGJzJk=;
	b=Pr/L5gRuk1G4znQ6M7GsK0AwOukx0QG398Uy0j6YX6wT9DDqi5/fHAt4LZNBK1/mEo
	EkQJg6wlO/JaVwRxpt/zHrbLLcKIGu215j5jQlNvTiHgf11oMCUAX9GsYNZYcaBxVGIC
	lQ+GOy2CTK2XhkUMNCandjTIFhJkTWROx/CjgzN8rV6Tu+9o/GJtAMeLATsxTP8s8vN4
	WGCC+HVcSk7UoFksZ4lfgIjEXK1F1SKlvOEQmCmi7S8SInf4WQPRRkVSrVwGHpzU8neR
	cou18I/ooPB7rdOCw+xLD/vs79Dpw/8BGW/xAu/sSXo3QMxD2oPYfs3Jyn1a4Ji2IVOo
	8dLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aLL4+7wxOSAs0tcSNcb66oljrBUvNA4j/V/8CLGJzJk=;
	b=K37SdmTF7rGuW5FPsOZqZ8zmywK/1yPuUOYQlns5R+v731WPNpvl4FdClaXJWBHn56
	bTB7NOiTnw6QQmhy4U8y6tNsabiO94QcAq5nJnSPOaP6Eff+RITu4ucf2bv6eNsKP0xH
	9+8PW8yUYrO9/2OnBBYxChWmDoyzQ/+u2Z0Nr+oMOMIBk+dCFcrrZE+yrXxHp+7kR5i4
	u8JEVzojZ+es+KHw4NUi48SbC3RzOjxcMcy5C/1dWTRo9BiGiJ3hFmPbiEq48pqPl/Ex
	9O9Y/OPYcpn0DNLQ+dPHHKqcIJ9mTnThusOWsltY5hxb4GU95S0Ha8hjIcscaeOp+cWg
	LWMg==
X-Gm-Message-State: APjAAAVJ6EZlTmVkFIga7QBvsyigckerh0wapwFl6pQvWsNlA//bVzhX
	Au7c42Nq3MEJNYf3wGnQ5U5tnlvqiQugqRB4dHA=
X-Google-Smtp-Source: APXvYqwJED9KAw91+7FJ8rS4ROsRkk+0Cj49S5Zubn+kazTBSD8WtgHrFqna5gw2xZPrOsVHeCfh6srzx5VwmfVmz9g=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr7420641ljg.78.1567138923669; 
	Thu, 29 Aug 2019 21:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190828032453.19882-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190828032453.19882-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:21:52 -0400
Message-ID: <CADkTA4NsoaWCnrVreOUQsXGe2G-aNCbWrgiJ1+cm6_Sa1Gcnew@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-dogpile: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 04:22:05 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 27, 2019 at 11:25 PM Zang Ruochen
<zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-dogpile.cache.inc         | 12 ++++++++++++
>  .../recipes-devtools/python/python-dogpile.cache_0.7.1.bb    | 12 ++----------
>  .../recipes-devtools/python/python3-dogpile.cache_0.7.1.bb   |  4 ++++
>  3 files changed, 18 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
> new file mode 100644
> index 0000000..13e4b03
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
> +HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9b4ca25e52ccc9b1601e8fe6d4fb4ba7"
> +
> +SRC_URI[md5sum] = "88043b337eb609214dbd8fa498300b38"
> +SRC_URI[sha256sum] = "691b7f199561c4bd6e7e96f164a43cc3781b0c87bea29b7d59d859f873fd4a31"
> +
> +inherit pypi
> +
> +
> diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
> index 74e6a74..6f531a0 100644
> --- a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.7.1.bb
> @@ -1,12 +1,4 @@
> -DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
> -HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9b4ca25e52ccc9b1601e8fe6d4fb4ba7"
> -
> -SRC_URI[md5sum] = "88043b337eb609214dbd8fa498300b38"
> -SRC_URI[sha256sum] = "691b7f199561c4bd6e7e96f164a43cc3781b0c87bea29b7d59d859f873fd4a31"
> -
> -inherit setuptools pypi
> +inherit setuptools
> +require python-dogpile.cache.inc
>
>
> diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb
> new file mode 100644
> index 0000000..ccfb292
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.7.1.bb
> @@ -0,0 +1,4 @@
> +inherit setuptools3
> +require python-dogpile.cache.inc
> +
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

