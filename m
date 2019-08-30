Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E19EE00B7A; Thu, 29 Aug 2019 21:22:04 -0700 (PDT)
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
	*      [209.85.208.170 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B1B9E00E07
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:21:39 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id x4so5144647ljj.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=unT1c3OYG6X1lQkl2oNEl7Xhdy6VjNqk1v08sVLXhys=;
	b=tHDL87xNEPRzxjWu6Ww3t3lAqvejul4yPhF8MndlPwpmM8D0tRdICbDkO0nEH3Re9j
	cM3obQbbvlDgXt93KKJ19jJTc/z3Q/SbVUlL13Utmhxbpgf7/4V2GcXlCIBNJ3IJI2el
	ritkAGb6TZXJeCRWKRHmcRAwcTqeQbmTtgsZOSHEZZ5KwHX6800FgRaRHqRk8Q+9gVmg
	dtoFoYC+fFbD1yGsZ7Gg5Ra9JUQS/Fb+7CqKVTEYfLSBNY9wsKseasN/e4/V6/9jHRKg
	2qNjzwBkck77QyUXX1Xe3XybXh8FvNXDIozN6daRSABG+zPBEAuLPInRBPAhk/daqz45
	EUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=unT1c3OYG6X1lQkl2oNEl7Xhdy6VjNqk1v08sVLXhys=;
	b=P/fIFXbtH9xq06VzQJFq/MoMY51084hUMmUQdcZz7PfFdBk0Uemh2fLpIzwu7zxfEw
	dyF6JBSEUYaBRVA6rt2+eCami7ep7UbTnIlFpDhrU2Xc1AGpjwYnUk24gPCs9mPsHp3w
	6UJnGcUwY3KhhDB7w0eU+2M1Xm6cUXgFGMqVnWZjTHjWH3xo+PAM7ytXDIKGlFxKqaqq
	z5HYnCp8rWYw0Kh+S9bx8IVsybB6Lo4sDulb6lOkdSvgZl1xOznVWb1b2M16nHsflfkM
	34O9ROzw5Spg7A4wGwklYhnC+581bQyRcPBsqYSKhZ6YHATH96DTkWeHru/acbdKdSpE
	rYUA==
X-Gm-Message-State: APjAAAXYQJI2FBOkp5D3zMcz/Pm+WXM3Htra+u9YCZJVsYGrSLt8PNXs
	FCObh1SBd23nvUre4C9uDNHQ0THAveyyig4s+jw=
X-Google-Smtp-Source: APXvYqwOjXZq/3pOiLB+uSSWM0eSY1l0lC9nPacjtMhrlMDF+Okq3uEQP/DDF5Z2HGKsuH4svQhvJkLsmU/5y+5Y124=
X-Received: by 2002:a2e:96d3:: with SMTP id d19mr7441574ljj.185.1567138898922; 
	Thu, 29 Aug 2019 21:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190828015638.7929-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190828015638.7929-1-yuanc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:21:27 -0400
Message-ID: <CADkTA4PDhNfFit_Q+AJQd1Hadz2AYPPJ+xrVJ1hB-yLTvpntyw@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-tenacity: upgrade 5.0.4 -> 5.1.1
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
X-List-Received-Date: Fri, 30 Aug 2019 04:22:04 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 27, 2019 at 9:57 PM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote:
>
> Add dependency on setuptools-scm-native
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../{python-tenacity_5.0.4.bb => python-tenacity_5.1.1.bb}   | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-tenacity_5.0.4.bb => python-tenacity_5.1.1.bb} (71%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-tenacity_5.0.4.bb b/meta-openstack/recipes-devtools/python/python-tenacity_5.1.1.bb
> similarity index 71%
> rename from meta-openstack/recipes-devtools/python/python-tenacity_5.0.4.bb
> rename to meta-openstack/recipes-devtools/python/python-tenacity_5.1.1.bb
> index db435cb..5c43a47 100644
> --- a/meta-openstack/recipes-devtools/python/python-tenacity_5.0.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-tenacity_5.1.1.bb
> @@ -6,14 +6,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
>
>  inherit pypi
>
> -SRC_URI[md5sum] = "2c8333b9f06d5889ea70955a004ae525"
> -SRC_URI[sha256sum] = "a0c3c5f7ae0c33f5556c775ca059c12d6fd8ab7121613a713e8b7d649908571b"
> +SRC_URI[md5sum] = "c960e3f0c66207c85bbae72a8232278b"
> +SRC_URI[sha256sum] = "a4eb168dbf55ed2cae27e7c6b2bd48ab54dabaf294177d998330cf59f294c112"
>
>  inherit setuptools
>
>  # Satisfy setup.py 'setup_requires'
>  DEPENDS += " \
>          python-pbr-native \
> +        python-setuptools-scm-native \
>          "
>
>  RDEPENDS_${PN} += " \
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

