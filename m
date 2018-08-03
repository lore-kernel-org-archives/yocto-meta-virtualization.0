Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C7E0E008E0; Thu,  2 Aug 2018 19:57:53 -0700 (PDT)
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
	*      [209.85.167.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54FDEE0073D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Aug 2018 19:57:52 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id u202-v6so2997012lff.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 02 Aug 2018 19:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FOq5x8A3J/IjmhW+kTUK8xVD3hSvrMJb/R7ebJ+v5Z0=;
	b=aOQBe34JSiyhfIG+lL5f7SGrcVGIEkMbp46dvPGC8/rWHd2Fu8LteiQ7eOwPPbrzOr
	4W7igCs4tqYbix1mvSlu2C1JEWWzXFd5JnixGV3UXHLLc0uZiUjllPW9RgB+qW1L/Q/u
	09ZpZmIzIetuEWBmdHe5DwgHQhxcI6xrPh5Bh2NcA4ye84bwGdz1I2my7DvoUY8gOmpr
	3BzpUtxSwPgkv4MsfeSOj0Y1LQMpbcvmkDVAEskA753wEfUQP9I2YgOV868w47rUsH/Z
	jQQDucVvrLbolezJNfl0fmhCctbR6hBZP3nuhFkNfasZC4gHImVYsOQC6zUzfjMu7iHA
	e+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FOq5x8A3J/IjmhW+kTUK8xVD3hSvrMJb/R7ebJ+v5Z0=;
	b=aWFZH2W1oie6RlPZT992v8F8HE+keW6a5xCeW8BCek/347g2HWeW83uPC9PmtzgAxy
	6Cjjw0KPIlmOh5LZISPeYl5Ih4LUw4V+Fq81RLIZDFp5/b7VyKPtJ0WwnJG3JpP5xwgN
	W1quyBVAiSxe28LAxsCiYL5ZJw1EDQf6LWY9lVmuVwVIBVEl9a4ZSCWMh5Rc0abrTjA3
	PIc+Wfb60w9b5pAmVn4xaLvoqeTiMb5wCDfeBHDi+ZG383a/sUguUj5QM1TBAZ+yhhRr
	lgaL8FwN0u7Z0sLqmzSKMrSLLErHok0z7WGYKUR4kxxelP+aMc5/CrwYptkkITYU+xLU
	GN9Q==
X-Gm-Message-State: AOUpUlFNApRFa1JJd041+tCQeyVa/6XLYqNwLlpi0EfNVZqPe87ZgsmH
	9ADraeA3bLkMwRqQmpI/vVe5XW1A4skydxV0TirMeA==
X-Google-Smtp-Source: AAOMgpcJcyjSTszeWMKpgVl1ZdzpEy591yHBryDlg4pU5/jHZCLHOsowmFhgGMZfXWkFp7wqGghDwWkcoBofztA9BhE=
X-Received: by 2002:a19:c403:: with SMTP id u3-v6mr3153323lff.87.1533265071140;
	Thu, 02 Aug 2018 19:57:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP;
	Thu, 2 Aug 2018 19:57:50 -0700 (PDT)
In-Reply-To: <20180727194539.88054-1-joe.slater@windriver.com>
References: <20180727194539.88054-1-joe.slater@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 2 Aug 2018 23:57:50 -0300
Message-ID: <CADkTA4NqFBYU4M92Bu4PHO9K_tdGrHzRtEz_OjDUQQ+ascyJXA@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virt][PATCH 1/1] libvirt: use relative path to local .m4 files
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
X-List-Received-Date: Fri, 03 Aug 2018 02:57:53 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jul 27, 2018 at 4:45 PM, Joe Slater <joe.slater@windriver.com> wrote:
> If our project is in a directory with a pathname of longer than
> about 125 characters, configuration will fail with an "Argument
> list too long" error.  This patch uses the technique that was applied
> to the coreutils recipe.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
> index e6dac5d..194f049 100644
> --- a/recipes-extended/libvirt/libvirt_4.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
> @@ -42,6 +42,12 @@ SRC_URI[libvirt.sha256sum] = "a531e22c8b985ecb2d1223b913fd6ec0f1800e3ebe02351924
>
>  inherit autotools gettext update-rc.d pkgconfig ptest systemd
>
> +# Override the default set in autotools.bbclass so that we will use relative pathnames
> +# to our local m4 files.  This prevents an "Argument list too long" error during configuration
> +# if our project is in a directory with an absolute pathname of more than about 125 characters.
> +#
> +acpaths = "-I ./m4"
> +
>  CACHED_CONFIGUREVARS += "\
>  ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
>  ac_cv_path_AUGPARSE=/usr/bin/augparse \
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

