Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A13F5E00A4C; Sun, 22 Jul 2018 20:21:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED075E00874
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:21:23 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id u202-v6so5336640lff.9
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2DN+OEB3WQoHCTZoH6oc2/NmCHd1wQu1v4TxcSJM8G8=;
	b=gn/YJ59G6tINM539bRMGf+A13K5Jn0vlTWeVcXutFenRc9zbcUJO9WYR7qc2UbbRvz
	NusgEQlGfJo0b2iAj+P4Tkmw2TATUCDtzCLiBwBadHDSUadiuSwQBnY8IhEvVC/ddhl4
	PwNHrBCJ0IlMzDwlNX89YDfwdSF8xEiY8XkqqnQNUitray40wQvSNCWaOp8J5XDMLAir
	MZbcIau7pJKqBxfqT/utcgM28h9QqF3cXbCNTVjnhDqOQUQBRPR71S2KGzMrcBP0BrzV
	e+N9JmJBfGqr1GK83gqCgaJ2obV3SN+VVjm4OUfQoGSwMBBnn5NT4f7BQWcBIdkWjj1V
	LB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2DN+OEB3WQoHCTZoH6oc2/NmCHd1wQu1v4TxcSJM8G8=;
	b=sKexk8+4PFkdpWA+qCS6QGZYkNBfza/90VOeuNtIDW3Sbi2euj1V6oUtfsq3aUrXuP
	8hexeAOkOyGJhMJr4tV9ujgcXJIwG+8VG6y+7iSvOtG66cZpetXdVDPyWLeZSH3G1zyP
	uYDrTjx5e0vb8K/1K0qUhSoTJ5lXgng64WTwQf0r6oCzARs8ewBAWQzz9wt6TMPEHUHR
	7FcYeDVaqBOWFsN+rULsfcYQT3KqVUXIg8pAukEOUDoYvZwdvlX9aVPIn5vrf2+sTB+j
	EGcb/Lly+n1Qf5g8jcTMrXSiMY8cwU1lCraAxyJZ83LJZCo/0dlq30m22tEifRN6UIdh
	eIFw==
X-Gm-Message-State: AOUpUlG3rdNf2i4UCwCiOe6lW39zcmsm93jJvO5LmceR5MxkkAeQMc9a
	iJPlsGNrKwQf/QONYUJV+Xaso5EJFZf0Dwf4ZNm8YA==
X-Google-Smtp-Source: AAOMgpd//7EEKvO/HGd/R2iabc5wsbFqO35w6q8fEyxCuEYvPuS4eHFdC+86XEYJjAftoBC7S+NlEYkTtYz3iZJuywc=
X-Received: by 2002:a19:5509:: with SMTP id
	n9-v6mr6498224lfe.133.1532316082836; 
	Sun, 22 Jul 2018 20:21:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Sun, 22 Jul 2018 20:21:22
	-0700 (PDT)
In-Reply-To: <20180716093631.27024-3-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
	<20180716093631.27024-3-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 22 Jul 2018 23:21:22 -0400
Message-ID: <CADkTA4My733Ob+SEhUY4rJOtmfy_inPMPZN+1NXf89gwviOptA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-httpretty:0.8.14 -> 0.9.5
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
X-List-Received-Date: Mon, 23 Jul 2018 03:21:24 -0000
Content-Type: text/plain; charset="UTF-8"

Merged.

Bruce

On Mon, Jul 16, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-httpretty from 0.8.14 to 0.9.5.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../{python-httpretty_0.8.14.bb => python-httpretty_0.9.5.bb}       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-httpretty_0.8.14.bb => python-httpretty_0.9.5.bb} (54%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
> similarity index 54%
> rename from meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
> rename to meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
> index a315fff..e39ad05 100644
> --- a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
> +++ b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
> @@ -5,10 +5,10 @@ DESCRIPTION = "HTTP client mock for Python"
>  HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=88d874c445b42d9bcea5d211bbc6b8bd"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
>
> -SRC_URI[md5sum] = "2a6bbf270fafc77647b0479d95d0544c"
> -SRC_URI[sha256sum] = "83c176bbac9d68a45a5cca54f2d5be7e6b16a063adf6f334e7fd0eee272e976e"
> +SRC_URI[md5sum] = "e0e4294987c02181b1141c9ceb81783f"
> +SRC_URI[sha256sum] = "543fa2bd9c319bfa1e1de9e37d7c9c08fa926a692b65b0be5df4b2f069fd0ad7"
>
>  inherit setuptools pypi
>
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
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

