Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A68EE00D48; Wed, 29 May 2019 20:59:37 -0700 (PDT)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43AD9E00D45
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 20:59:36 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id y13so3818160lfh.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 20:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M5lGkR7cJB2W2olrSgYmS17SzuEuFBSXVYh+BIlVa5M=;
	b=un/dCEJATA3HRBZO59oVWo2GdAwcLweqNa2zSucnTAAWO2CLk6xi99SOMp/awh02FR
	benZaq8JTtqg5bfX5QJ0E6fwTMQllG2UX8SSJGZzwur/c9aCOHLfQiQqEtBjg4ODk9Tp
	MQKaZc04x0QgLdQFlARNXu3DrpBtCoJ8V1rLb5xJh2apSEGkZgSNbXwYtfbgge3j8gfZ
	+fYIgWfyhP85m/sFIoGhv98BrMJAvNea4f34f/Wrbq1/pfK3HsYIGSu9kMNP8gK54omS
	AuPc8AsQ4VCniEKPwcszgIsMdW6o9A76Rm4v96krVDV0Bo4+7sBnv2OaFSVzD9uXed90
	4zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M5lGkR7cJB2W2olrSgYmS17SzuEuFBSXVYh+BIlVa5M=;
	b=r1cwyn0IJbCj0u0/mL+QWpxsTuOaZcGHSCpagr9mHOAH5O727haoPJZX9jcp8NCMhM
	bk0w+/3y0HMO8cCL/uE8ANDPzRnx2aFThN4JIlB1XK1w7PF3R8H3H/tOdkcv5K7vNNj5
	FdMJ9GTIUcnTwW7kmROkZy1rUgq3PxlFSLAT86GomyOX2O1oppxydWD/asvrzeO49Ot4
	UUpKkT+0IhFCLqTS5Sg6RWqXAU1u9U5DDNUwtPRydiCwZdz0zABQoouwWQcAhvNqY8wB
	vNz4o4/TuHNPqA3okRc6njfbvXvzj94B64V85XNnxAJ1bUK8DnvRdiyB+Krj4sWIURdB
	UdWw==
X-Gm-Message-State: APjAAAXPv+YgdW1bFyeZJFf9fXKbDKeVIJc+t41B57T2HlXptrdQKCVY
	0zOAzu55SwE5x1P5vCzuwkNPwnm5oyPRai+1dJA=
X-Google-Smtp-Source: APXvYqyIK9rIsgoJ32hV4gqBfEpPe6xGWPCSz/7jjZaZXLfxRB1KvDzkI6VtwbSJiYERt26DgTnwrPDEf+5lIGCZR6g=
X-Received: by 2002:ac2:599b:: with SMTP id w27mr816886lfn.184.1559188775226; 
	Wed, 29 May 2019 20:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190527012551.19048-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190527012551.19048-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 May 2019 23:59:23 -0400
Message-ID: <CADkTA4OwcKMJ2xOiqVBPfZxO=JQi-TPX=5anKyqLiH_B6LeQmw@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-happybase:upgrade 1.1.0 -> 1.2.0
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
X-List-Received-Date: Thu, 30 May 2019 03:59:37 -0000
Content-Type: text/plain; charset="UTF-8"

All version bumps are now merged.

Bruce

On Sun, May 26, 2019 at 9:25 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from python-happybase_1.1.0.bb to python-happybase_1.2.0.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../{python-happybase_1.1.0.bb => python-happybase_1.2.0.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-happybase_1.1.0.bb => python-happybase_1.2.0.bb} (78%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
> similarity index 78%
> rename from meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
> rename to meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
> index 0981c27..a8066b6 100644
> --- a/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
>
> -SRC_URI[md5sum] = "62a09c784a65161e9f5f01129d115457"
> -SRC_URI[sha256sum] = "e20376e2e32291798d2226502994134c1c4e175136d8375b3c517a234fa22481"
> +SRC_URI[md5sum] = "96cb7ea8163f531907fabd0dddc8b87e"
> +SRC_URI[sha256sum] = "850b4ee651128588a57e1e152dd1252e5ec39776a5d3d14ee892b8bac0fa9e1a"
>
>  inherit setuptools pypi
>
> --
> 2.20.1
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

