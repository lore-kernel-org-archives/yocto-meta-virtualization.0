Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92F73E00D4F; Fri, 18 Oct 2019 21:35:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DC3FE0098A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:35:05 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id u16so6175032lfq.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m/UEwjhm81RBV9MFBkr95Y20CmN9QakPMwLuVniptco=;
	b=JojUI6F3hkna3yZywVsVyOmEMaGT7L4ulo9H3lbDqaxUUl9QjgnI4ZFeHhihoAGw3E
	9q0G5m3b5qchLzwXVkw0jpvlna6aIriR8470/b5CmiMD2O1dbZEkf5mgHlLEvn80+AZS
	JGnSbSEMbuS5w0q0SX9cHHn2ln9hVHplmLDQI3oW5oJzccx02FC/oUe9A44E2WHBStzM
	phnSmPgKtUQvXku60nGzzPHi+sV0/++K0L/Ad59s4TjfCMXYTnr6ViPXZVANKImLOMV+
	tVL/TuAWsVSVmCSovMt31oSlTRKoZO0JY0k/t+MMo5lVJw4vlO6524Vb0MnsxzeCsPBl
	NeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m/UEwjhm81RBV9MFBkr95Y20CmN9QakPMwLuVniptco=;
	b=AcjRfcxnlK7Dlx/uYsFNH9qV899a744DFFLUU0SnGNI6mYFu8mIZIr0hSUFUYJ0jlQ
	hcr8pNm0wNJdKFaZlt5AxZugHjBllBOGO+xagBRs3N5KIM2Rzy9IKgKMv0KRkciYTCAY
	q3RUn+41b0Tllwzb0erYR+qRPqfodlcWJ5qpTX5tOx+8qNfN/5YWT5NVNl4HKmaweo2W
	sqf/0QMsWAWvUyst10LD/4I1lFixIMFvVFTx6Y9GrSY2pFLgYHFX1YIXtHvBDmfrP8wU
	Iu0s3BZUmin/zW+uh160I8b4BDwjXexUpbRiatttDirOh66HCLfyyvh0DhpznyX1SB5Y
	599A==
X-Gm-Message-State: APjAAAUWRz0jRiB6KdrH2YUm2ONF0Zyo/yGz+z2SsMkqcS6vYAzc2TT0
	XyEgHmPgFBW6+cV6AEiTZ2VZ1bWyNZUL1AMF9ps=
X-Google-Smtp-Source: APXvYqxefuZb3OBhnGpGuQ+5ytScyYF04vh+f4E3OhWcsldJh2uBRmmf3R/v+lmPHRnBTqiaD5pqjD/wPYhZK/x/2mU=
X-Received: by 2002:ac2:5de1:: with SMTP id z1mr4139388lfq.36.1571459704054;
	Fri, 18 Oct 2019 21:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082959.7773-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191018082959.7773-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 19 Oct 2019 00:34:52 -0400
Message-ID: <CADkTA4O4Y1OeL9FHehCLwiRf1mSDR=7haWFUFF9GX_a4m3uJrQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-kombu: upgrade 4.6.4 -> 4.6.5
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
X-List-Received-Date: Sat, 19 Oct 2019 04:35:06 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Oct 18, 2019 at 4:29 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-kombu.inc               | 4 ++--
>  .../python/{python-kombu_4.6.4.bb => python-kombu_4.6.5.bb}           | 0
>  .../python/{python3-kombu_4.6.4.bb => python3-kombu_4.6.5.bb}         | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.6.4.bb => python-kombu_4.6.5.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-kombu_4.6.4.bb => python3-kombu_4.6.5.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta-openstack/recipes-devtools/python/python-kombu.inc
> index 9918281..923278a 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu.inc
> +++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>
> -SRC_URI[md5sum] = "4eb5f1e6f669e04f5bd0c627c7467156"
> -SRC_URI[sha256sum] = "e5f0312dfb9011bebbf528ccaf118a6c2b5c3b8244451f08381fb23e7715809b"
> +SRC_URI[md5sum] = "6279c780cfa64beda3a303f54cb19a7a"
> +SRC_URI[sha256sum] = "c9078124ce2616b29cf6607f0ac3db894c59154252dee6392cdbbe15e5c4b566"
>
>  inherit pypi
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.6.5.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.6.5.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.5.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb
> rename to meta-openstack/recipes-devtools/python/python3-kombu_4.6.5.bb
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

