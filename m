Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1E4CE00D81; Wed, 16 Sep 2015 13:08:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.171 listed in list.dnswl.org]
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50710E00BF9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:08:16 -0700 (PDT)
Received: by ykdt18 with SMTP id t18so210592010ykd.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iZ7GhcG2zorrxDR21Fm6TJDb3qvKt6ANqgt3liOySWE=;
	b=CJesA6zahOcKp9/avWP4pYbZ/IMpkNuiFeoAI/oiMC9zhAQ5jrcODsStYKdN3baBQb
	KgDfADtB46mWmjuzSVyqwmQauWIir6o42iqz7pCna6vO9zQQjI6PasdeeX5o7u5WGLfv
	Z5VPLE/quqiZnf1XjXOCggaOrwxZA41PVjTmdNJ2nUjfvvrDYpAk+6w4g3ZGmoKtQYyH
	nv6aAhpnOjbcR3kWmasilrQ4JoPPE0nEAeVH8livWFsygqADbYXXhXL1z4bzQPVjgNq4
	G37HLHDS37Hb4v0f6l7HGphAEeP2QlSqaatfIEa94BYKbmZATrjGFoeu/h+qhGMNDHOA
	q7TA==
MIME-Version: 1.0
X-Received: by 10.13.215.200 with SMTP id z191mr31086242ywd.123.1442434088178; 
	Wed, 16 Sep 2015 13:08:08 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Wed, 16 Sep 2015 13:08:08 -0700 (PDT)
In-Reply-To: <1442324859-17241-1-git-send-email-mark.asselstine@windriver.com>
References: <1442324859-17241-1-git-send-email-mark.asselstine@windriver.com>
Date: Wed, 16 Sep 2015 16:08:08 -0400
Message-ID: <CADkTA4PHOhQzbaqNHtEy04yOWP04mtcmBcJu-dcFmiXhc5-WUw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] python-oslo.i18n: Fix build error, missing pbr
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
X-List-Received-Date: Wed, 16 Sep 2015 20:08:16 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 15, 2015 at 9:47 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Depending on build order this package may fail to build and complain
> that no suitable pbr can be found. Add a dependency on pbr. This
> matches the dependencies called out by the package's setup.py.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
> index fee2948..575a8e5 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
> @@ -19,6 +19,7 @@ inherit setuptools
>
>  DEPENDS += " \
>          python-pip \
> +        python-pbr \
>          "
>
>  # RDEPENDS_default:
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

