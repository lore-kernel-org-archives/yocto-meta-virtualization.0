Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6260AE00D44; Mon,  3 Jun 2019 13:03:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFB8AE00CAA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Jun 2019 13:03:56 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id i21so2903581ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Jun 2019 13:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1eoiLkJsyBqCK49I7uP1vz90b25xrEjMnXn1TpvtzCg=;
	b=ct5+3ZFOONoXFUcm/MdCCnzbtqGJbC0YL8T4J+R6HNasszf3sHFCSIZ+VfQMFbCbi1
	f/WetgsojEwucBUnXi8gRZB5oI08Y9MR0YHtBYgpCC21u/nkjcvo4+7W1l32TxDeH4+H
	n0AW2f9kMzXfI8txY1rPM/3ej9VNsks1i+JYM1fs9YI8pFFxe6bv1eZXXUTDLR9svWk/
	rx4TBvpovsV8eRDsKkbF9LVC+o1Q/erUueyKLeMK4TWNo2oMWfLEg1O7jPMoHqTRQRFn
	mdlPeFzXC+XOjcyVPgfsWJwCvKWYIRdidPpG/BMvUWkRwB0i5RaPJ38LsdLg2/u+0KPU
	mKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1eoiLkJsyBqCK49I7uP1vz90b25xrEjMnXn1TpvtzCg=;
	b=jfyg6v/77W8t4v4HD6+3ZK1bxOvefVB0agxFt+c4lkOqlCeCop+SXt+AkPB7WQpX21
	TPaTBjyE5dELjTQAkfZjJf1AWd7HA+JJMwUIFbwoMeHDAThgObjrKDgeIKgXdO9XsHMi
	GB5K29XrfFlZXLCgw9fq7bV2m2uJy41U5dYhU3NqoKJEqB93EHEWoJ/jOAm+zD4bCvS9
	aeN8FnogIJ4sugfWFz/ioeTunAZg5vb/Egs58Vws4aH465T0ol3osJuasQjGSI5tG4OT
	Jkj2VZ8TOnV+sGThLz5otHfIJjV5SvpREUGFQzElsF8QPb1XP9QQ7cI7+mUbmTISgkoG
	h2lQ==
X-Gm-Message-State: APjAAAXLoqODUCVG56xkJ4oY9osrXIAilS5W+OT9iljtVcl7hRLxswUx
	B5mIAgVr/y11T5bJYL85ZjQLt5Rweb69CyFznwVJH7wG
X-Google-Smtp-Source: APXvYqw5D0Hqq2xnzVv+ZA8bRlWQop8m1P/pc/ZbaVriOBOEMxThpTXVnvYgv0sCuhMUztJ+VU5JSS1p8GrrXiFBGXE=
X-Received: by 2002:a2e:9185:: with SMTP id f5mr11799352ljg.51.1559592235527; 
	Mon, 03 Jun 2019 13:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190530054251.14308-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190530054251.14308-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Jun 2019 16:03:44 -0400
Message-ID: <CADkTA4NQDc9KfQNbXpAKmJN14ynfEbcebj=mR6rq-QE8naHWdg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-positional: upgrade 1.1.1 -> 1.2.1
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
X-List-Received-Date: Mon, 03 Jun 2019 20:03:59 -0000
Content-Type: text/plain; charset="UTF-8"

I've merged your latest round of version bumps.

Bruce

On Thu, May 30, 2019 at 1:41 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from python-positional_1.1.1.bb to python-positional_1.2.1.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...{python-positional_1.1.1.bb => python-positional_1.2.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-positional_1.1.1.bb => python-positional_1.2.1.bb} (75%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb b/meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
> similarity index 75%
> rename from meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
> rename to meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
> index 144b2cc..93eb6e1 100644
> --- a/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
>
> -SRC_URI[md5sum] = "c82903c32c1aec1ac0f0f6e166ef4e2e"
> -SRC_URI[sha256sum] = "ef845fa46ee5a11564750aaa09dd7db059aaf39c44c901b37181e5ffa67034b0"
> +SRC_URI[md5sum] = "4afcffd8e2ba733fd7a50f137a2ee893"
> +SRC_URI[sha256sum] = "cf48ea169f6c39486d5efa0ce7126a97bed979a52af6261cf255a41f9a74453a"
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

