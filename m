Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32267E00D94; Thu, 28 Dec 2017 08:18:24 -0800 (PST)
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
	*      [209.85.216.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D57DBE00D7B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:18:22 -0800 (PST)
Received: by mail-qt0-f193.google.com with SMTP id e2so51662933qti.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ES4C1fRMZlajuZMkqvbfRCERyTcDhsOkffKPd9Q1GtU=;
	b=tK9Bf7G9ch1Qloy6iMiGl1M4r6rQuxHAbluC3ytXXIo5HDgZK4wDgVUKqkdDxIKLP7
	FffZKHTPh0r5cLLi9BojL0t/fYpdSaVhVGAqlGbE+2E+r6fAPKJmQIQ7DW9Xa1CyABJD
	IYMTKuPHA5SDlD1tUeVtDf0VwSYeaOZgO0uwpubhjCSTw99teqoceOwlxF/Oakg9Bs6L
	I+4woLEQobHlSSJ4AUrGJpiLs2oDhQqssxr8zLSwq5O/VpOY6vmsHKVG7mWbP/9oKBAE
	pOZH/0/4hrLyl4YBExf4nH9HxwVsIw5sPbQjGpfUyqvaw4x9145RnsmlH8e9RlLBEgn7
	Cipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ES4C1fRMZlajuZMkqvbfRCERyTcDhsOkffKPd9Q1GtU=;
	b=HfsnCFl7R/6ssfC5jETNgSFl9nPV8GLR/OjPPASiQDzExdcNpKX2jZuM/skpGpSOtN
	k2WkUWt6cC8M9PyywSLWO+TuqoHsd5gSmVb83jf3kw6lMByd8RZzbVRgpvzZQUPk15Nm
	rIfyyqTGPDdMio/KcuxTpiCsqhh0+WhePANy3PZH7IXHMcEdfLEyOuQrIt+55UKyyTio
	IGK1j0hqj8c9Au7GuvDKbAQmh59y0EvDaUWHK979IPESYj6mGeXHhBXT0V4aQ467RWNb
	sQYSp60pw1sV56kQzWN0LG4vZTGqrtSa2gEQoieNeo+zaQDAx1raAeb689IAfxUZPAbo
	25dA==
X-Gm-Message-State: AKGB3mLET9VfVoTcU2mwfzehn1rfoMYbQIuRB3eoLBauccr1/n+thilG
	k3JA4vx6lQjLXcQ9+Whzx/F9+nvkU1inxv8IQ5w=
X-Google-Smtp-Source: ACJfBouqf3HArLKIJuxzz2Yg4rqt3pKPUyScqbnXPmTPUk6qxlNI60/jAm9g/b1QXRkuUFL3z1Ib2NMtkqv983bfjRE=
X-Received: by 10.237.55.74 with SMTP id i68mr8951571qtb.237.1514477901875;
	Thu, 28 Dec 2017 08:18:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Thu, 28 Dec 2017 08:18:21 -0800 (PST)
In-Reply-To: <20171226012050.23647-1-Qi.Chen@windriver.com>
References: <20171226012050.23647-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Dec 2017 12:18:21 -0400
Message-ID: <CADkTA4MkYEDgxxZs-bvHGtOA84JaP-7ntbgZrQ1d4iLO_hFmQA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/3] libibverbs: provide virtual/libibverbs
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
X-List-Received-Date: Thu, 28 Dec 2017 16:18:24 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Dec 25, 2017 at 9:20 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> dpdk-dev-libibverbs recipe provides the same library as what libibverbs
> provides. To avoid building these two recipes at the same time at one
> single build, we use the technique of 'virtual/libibverbs'.
>
> Make libibverbs provide 'virtual/libibverbs' so that other recipes could
> use 'virtual/libibverbs' as their dependencies. In this way, potential
> conflicts are avoided.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/libibverbs/libibverbs_1.1.7.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> index 9fc0d6e..b3cd73f 100644
> --- a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> +++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> @@ -26,4 +26,5 @@ do_install_append() {
>          rm -f ${D}${libdir}/libibverbs.la
>  }
>
> -RCONFLICTS_${PN} = "dpdk-dev-libibverbs"
> +PROVIDES = "virtual/libibverbs"
> +RPROVIDES_${PN} = "virtual/libibverbs"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

