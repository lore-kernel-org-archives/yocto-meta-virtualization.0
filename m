Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3D67E00A85; Wed,  5 Sep 2018 13:40:57 -0700 (PDT)
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
	*      [209.85.167.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76C51E00A54
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Sep 2018 13:40:55 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id j8-v6so7144107lfb.4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 05 Sep 2018 13:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AL6SzlNQIDB/05axvD2L1Zk6bFUmzaOn+VZXRrenjC8=;
	b=X+qFiGFX2RL5tjiiMpWmcM3hBuIUOIGVLKDtxHMNZKw9SKwdiCSFQGXzsIcvDri4dp
	l4yLkFWzhRQxV7ggg4U5E56cQxXsocfVAiUPUMUuzcnj3hDcwph7RhOmCB9DBM5BBz3S
	AoOYwxbG8ngA+3R1on/+hBKd1jBangCtIu749HLTx3avMC9ElLq1eCXOlc65Qq0KTJ88
	NxV5t0/mKPAVGjHh+Xs4kkSEC08A1Fv5JCVYNNgf0nWIA7bNV9ZWN3WQfnTTaq3TaT/b
	LOboUe5/hKIDxNcrpjfy0kko7cNt4C6gxpZn3XsAo0bnGHSRZskCX9YnBGjGOxap9z/3
	xodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AL6SzlNQIDB/05axvD2L1Zk6bFUmzaOn+VZXRrenjC8=;
	b=bwKDcZ+WPsAoKzAaygC68I/I3PG7ynLkXLq+TtiZw8J+S1hqfJHOT1p+INkch/LLk2
	4HxL0UiVeOfKtJA6bwp4nJYpBfxmNU5UhvMUUaK98uz3SvB+0rQJzriUH2w1Gz5e4alc
	XWUGqbR5RnOwS3N9cBQbgK40JAw5ZUa89xHjaoF1Znz2+S1XTcpZ2ffUJzL4jvG/FhSn
	iiWRUrz+6/iTacbPUo6Me6OZWwJu3TpPk7e6TEcY3awhixaGVGkOhnAOPRg524U2/l03
	wG85tDNXQ0NwMAyuYUVnXWxARHFrNuB/Z8oAx8mKApBRn1cTA4BipKJfcsUm7gmgfvWk
	bjVg==
X-Gm-Message-State: APzg51AcTFUc8KTzj+rC5a+Vx65Vx7MpuSwi6KmeRo+dAXcgYwaSkwY4
	hFxmTb7etqrSoao2sqQmEXX9a1en4gG/Utp4YCA=
X-Google-Smtp-Source: ANB0Vdbi9pRpVfye68QTOHNfsp6fNsOhmbAz7nXvpNWrQcP5Pr1sVX7bbbTZWSQZUjcy7f/Zm3RJpjLjscHSJUC4Rko=
X-Received: by 2002:a19:7411:: with SMTP id
	v17-v6mr4177282lfe.49.1536180054265; 
	Wed, 05 Sep 2018 13:40:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 13:40:53 -0700 (PDT)
In-Reply-To: <20180904093420.30989-1-hongl.fnst@cn.fujitsu.com>
References: <20180904093420.30989-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Sep 2018 16:40:53 -0400
Message-ID: <CADkTA4OE=pGoW7pT-fMNfS9V25caaZgpVNrJCgt0u7_XLfrkXw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH]=[meta-cloud-services][patch][python-sphinx:1.7.6:1.7.8]
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
X-List-Received-Date: Wed, 05 Sep 2018 20:40:57 -0000
Content-Type: text/plain; charset="UTF-8"

the subject on these is invalid, they are in meta-virt, not meta-cloud-services.

I fixed things up manually, but have a look at your patch scripts to
see what went wrong.

Bruce

On Tue, Sep 4, 2018 at 5:34 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade python-sphinx from 1.7.6 to 1.7.8.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-sphinx_1.7.6.bb => python-sphinx_1.7.8.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-devtools/python/{python-sphinx_1.7.6.bb => python-sphinx_1.7.8.bb} (63%)
>
> diff --git a/recipes-devtools/python/python-sphinx_1.7.6.bb b/recipes-devtools/python/python-sphinx_1.7.8.bb
> similarity index 63%
> rename from recipes-devtools/python/python-sphinx_1.7.6.bb
> rename to recipes-devtools/python/python-sphinx_1.7.8.bb
> index 0200c9e..23fa3fe 100644
> --- a/recipes-devtools/python/python-sphinx_1.7.6.bb
> +++ b/recipes-devtools/python/python-sphinx_1.7.8.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=89cbefcd0a80481e8b26a9a7d25be749"
>
>  PYPI_PACKAGE = "Sphinx"
>
> -SRC_URI[md5sum] = "8fbd77d80c8e0966964751ab31a0204a"
> -SRC_URI[sha256sum] = "217ad9ece2156ed9f8af12b5d2c82a499ddf2c70a33c5f81864a08d8c67b9efc"
> +SRC_URI[md5sum] = "7dfb075d8bd6a53b652bce1e4394c6a1"
> +SRC_URI[sha256sum] = "a07050845cc9a2f4026a6035cc8ed795a5ce7be6528bbc82032385c10807dfe7"
>
>  inherit setuptools pypi
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

