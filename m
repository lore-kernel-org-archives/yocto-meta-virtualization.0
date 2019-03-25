Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69709E00C93; Sun, 24 Mar 2019 20:15:01 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04B73E00798
	for <meta-virtualization@yoctoproject.org>;
	Sun, 24 Mar 2019 20:14:59 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id a6so4906971lfl.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 24 Mar 2019 20:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aTXz2HzQ9M+YIVSGN64ZKiLlG+u7bc0//M/3mH8J8VU=;
	b=to96boVEWvnvQlqv52UYol59PhSsBH+wFCmNze4FHkMD9gf8xi+pbhD4crKejm7Mpe
	aIFOO2xYTuACuI6wAXhfofds3gE6E5guiKnbthzKXAOXKsKFZUZMz0QO6pZT/Dq+rpqS
	ciwAMkYXSguqu/UaFp9FSGYumTOc7t+YVM+WKa+eLmNe8rTNHd7/MhW3e4B0/ygQCbc3
	qSfDX/7Qs285n5STeOWh3XDh7kwPlNPioCsv3GgUr6LFhJhRyI3oab/gq5E8VLMDpojo
	x8CozifK/QlflVG0DgIUfp+AexC+BV9MKNHN/z8sFrwp2OFxRNP8/divwPumWEcZFUqg
	C81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aTXz2HzQ9M+YIVSGN64ZKiLlG+u7bc0//M/3mH8J8VU=;
	b=mrVy7sBmtN7sURda4O6udpUOGl0o8XMU2493Hb1cTwT8T93xcXhCfNVw6twrdVcvUN
	8Hzetq4JXUZAapbIUa1xbF3lo/Jhkf5pHkZnH+0sf4w/RIjizkkSt1Ndxz4xB/zwF5lb
	cOTomCRgoXt4FNe5iHXIZj5j+czVs2+dlJR0jlSduGO0QJESAluXwyV2CvTAr80wabji
	8ZoeuZPja0txAag0Jy5SMT283D0egop7rE2FcF5tdvMo7uDdGSIUdZ9xAkT7zKlS5jJd
	FfSCo5g2BqPzdPJN/be/KNpTb1CpHyhwBut5Ld0qGbRlbf35xZcBTleyMyNi8dL3hEFS
	VfSQ==
X-Gm-Message-State: APjAAAUvKLUelsLiEUfgluNRgOdDo5MzWB51VQB/JMHM37av3bRsquca
	Hz029EG9S19waldpd8HChMd/gqykRWi6qobDTkA=
X-Google-Smtp-Source: APXvYqwYqPdsfCgXc6jXKKTp2XaxNGa3FyOUfA+vzaBSpkXKM0CsYE2UdpB7dpZteNhI2npuSFXLRUal/Gr5X0oh+C8=
X-Received: by 2002:ac2:5966:: with SMTP id h6mr8011407lfp.86.1553483698739;
	Sun, 24 Mar 2019 20:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <1553220833-33258-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1553220833-33258-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 24 Mar 2019 23:14:47 -0400
Message-ID: <CADkTA4NLE=F3CDhWHxaFa7oFeF8nNoLteaYy0hYr+mrKxU=u7g@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/2] libibverbs: upgrade to 1.2.1
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
X-List-Received-Date: Mon, 25 Mar 2019 03:15:01 -0000
Content-Type: text/plain; charset="UTF-8"

merged (both 1 and 2 in the series).

Bruce

On Thu, Mar 21, 2019 at 10:14 PM Dengke Du <dengke.du@windriver.com> wrote:
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  .../libibverbs/{libibverbs_1.1.7.bb => libibverbs_1.2.1.bb}          | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename recipes-extended/libibverbs/{libibverbs_1.1.7.bb => libibverbs_1.2.1.bb} (83%)
>
> diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> similarity index 83%
> rename from recipes-extended/libibverbs/libibverbs_1.1.7.bb
> rename to recipes-extended/libibverbs/libibverbs_1.2.1.bb
> index e7e8d65..dd74522 100644
> --- a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> +++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> @@ -9,11 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
>  # Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
>  SRC_URI = "https://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "5aea59e4766ae4548419010ac84032ff"
> -SRC_URI[sha256sum] = "31b4114bf32d41c9fc81a862ec5febed1e982975f21fa177ea9c7516c9064690"
> +SRC_URI[md5sum] = "1544ebb89d861ce84057ab43dfcd22a0"
> +SRC_URI[sha256sum] = "c352a7f24e9a9d30ea74faa35d1b721d78d770506a0c03732e3132b7c85ac330"
>
>  inherit autotools
>
> +DEPENDS = "libnl pkgconfig-native"
>  PACKAGES += "${PN}-utils"
>  FILES_${PN} = "${sysconfdir} ${libdir}/*.so.*"
>  FILES_${PN}-utils = "${bindir}"
> --
> 2.7.4
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

