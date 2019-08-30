Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC086E00B7A; Thu, 29 Aug 2019 21:27:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7207E00B7A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:27:38 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id e24so5122735ljg.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Th7/O3XEL5QwQhwwjzkOsEcrQGvSxxLkMWgdS/1Jm0=;
	b=poiYMtd3Ib8aWWPAybT5eK5TBcdUppaI4fb/p37WFtcENk2dcOa2tBibjyH3vRnXfQ
	vEJXTm5PddQXbxHMXAxg/i8qM2sNrBXjrLvkCZOhnTFvSrkJAQpPcxj2KGkUL7EWlL9a
	VlVw9viM8+zUuQsmWBtbDBfmY96WuM9g1pcVG5TZ+5f+HkO8OEDRUsh1SlVAIX3bsitx
	/kGgdJo9l+88O5RWqCi8pO1LwxlTwRdd8w7t+oz5ASLaUvQhm7X01KKzlplfMqo66Nii
	qHqW1TzOXQvRleYDPAXLE3LRxn9f7JOjNUg9MzcrbHjyQ51H+olpRhm6/dApByJ0jciS
	NkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Th7/O3XEL5QwQhwwjzkOsEcrQGvSxxLkMWgdS/1Jm0=;
	b=SD4w5NKDYWbm1bkAPYZRNa7sTwPN3+fWs+b4cpBNVY/q//NI8QHjahqnc3/RA6q+3m
	SZI82s+FdJFFAXoyfPBBGoQ22IbsqWonHkVOpRCJpbeZzAHLpyZ8SrdV5Nkr+vJSKjnp
	l6Bsaa0ppuakIaDHVZcALOhGwq1xrtUKCPJeAqGnMeypepPWHcJbm0RbkgAL5oGgnlgx
	Lqe8gQELLSU4H4TO3RSHt3fI7tvbgCP4yLsPJOb+EYSSrASyR/8UQxn7+JUixdtJjSIs
	w68AD+3YrfPx7f0trkG/OSaobgEN7Gs9Nr68Y++k1C41Zwcti072jDSq23Ko03fRRKS1
	7kOw==
X-Gm-Message-State: APjAAAWTSLUBrsORjALruBO0X7hJJ7BKU8bK5Hk7o2dawieQKx0W0H1O
	jZY0ow9NuMV3kw6WmBUYGA8SxaR1YfaFw7Ti5owDre9m
X-Google-Smtp-Source: APXvYqyZFDMqMRhFySRyUSJLgcsEm8PYCrdVu0+GxWwWquVZuX2puc3xrfcZDjzW0zwq+yOWQH5Pr8GmlfBTvwHLAAg=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr617720lje.118.1567139257908; 
	Thu, 29 Aug 2019 21:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060023.3768-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190829060023.3768-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:27:26 -0400
Message-ID: <CADkTA4MJ4w90Dj0Y02KfeVJFmLrM8+Lp7oVwNvZpVnrcsYxPCg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-extras: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 04:27:46 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 29, 2019 at 2:01 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-extras.inc     | 10 ++++++++++
>  .../recipes-devtools/python/python-extras_1.0.0.bb           | 12 ++----------
>  .../recipes-devtools/python/python3-extras_1.0.0.bb          |  2 ++
>  3 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-extras.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-extras_1.0.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-extras.inc b/meta-openstack/recipes-devtools/python/python-extras.inc
> new file mode 100644
> index 0000000..45d57bb
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-extras.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Useful extra bits for Python - things that should be in the standard library"
> +HOMEPAGE = "https://pypi.python.org/pypi/extras/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6d108f338b2f68fe48ac366c4650bd8b"
> +
> +SRC_URI[md5sum] = "3a63ad60cf8f0186c9e3a02f55ec5b14"
> +SRC_URI[sha256sum] = "132e36de10b9c91d5d4cc620160a476e0468a88f16c9431817a6729611a81b4e"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb
> index 6d75324..953b9e2 100644
> --- a/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-extras_1.0.0.bb
> @@ -1,10 +1,2 @@
> -DESCRIPTION = "Useful extra bits for Python - things that should be in the standard library"
> -HOMEPAGE = "https://pypi.python.org/pypi/extras/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6d108f338b2f68fe48ac366c4650bd8b"
> -
> -SRC_URI[md5sum] = "3a63ad60cf8f0186c9e3a02f55ec5b14"
> -SRC_URI[sha256sum] = "132e36de10b9c91d5d4cc620160a476e0468a88f16c9431817a6729611a81b4e"
> -
> -inherit setuptools pypi
> +inherit setuptools
> +require python-extras.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-extras_1.0.0.bb b/meta-openstack/recipes-devtools/python/python3-extras_1.0.0.bb
> new file mode 100644
> index 0000000..76f87f2
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-extras_1.0.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-extras.inc
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

