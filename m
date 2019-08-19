Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE6B2E00C7D; Sun, 18 Aug 2019 19:30:13 -0700 (PDT)
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
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EA8DE00A93
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:30:13 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id b17so216291lff.7
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2UYtTaxyYF2nXBKcUbzvKQ0vTWQOSYPbofFftBKxL9U=;
	b=FW2zUazZ57uREuRUcOJnxtmbqSQA3ObpF3h+5vu12s4Us/VPTfNqyfUkbDKhINN/eH
	S8EsaFZNJFO/9IT5Gikmc3KvqKv/+5jTHfLzJByoIjP4DjZk+7Qi27hUp5L82xx6EKFp
	tSr0hC1ifVqdMrX9JQ3NqM2gVcGSkI/lluLA58akgdx2gMgPTTQOwdP4F0lwAVijDjKj
	igTaIZqcvOY0nro1tmItzBtLO6aMwpm3BUUbGUGvTAtSjj1W2tnW4S4kcha38ihaf9sE
	l8yAzDEbuBrq9uHtQm9hf1PGygMLirCL9m3mfBS3I9A6oV7fo0JnrgA23vb5qUTQ4yPh
	0uAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2UYtTaxyYF2nXBKcUbzvKQ0vTWQOSYPbofFftBKxL9U=;
	b=XDNNGcYf/nWYI0AuPwuiGtxrIXgjb+7mLbQspP4+ulWvYyagQ/IAzgpUokB7mrpBYW
	IB7mKCKMXP567rPSFrc6mjs8nYtZZaG/Bg2ajBrvJJAJ4UxcNcyXCUtVm4MUn9lYxhKe
	6A0JD9aONK2sr3BzXFq4JiX2qYR6NzeWbD05F+WAaHroCkZl7RcCAOgkEbotqWcUz/we
	rT3WuUjINrac/dQ+2K4AREMNOxHVjeimD661Nt7uaDS0ixg2rmPI0A5qRFryWOII5TAU
	hGVFDrT4QTpom0tQZXrRJkXMvCn09u+9umDUMJCUJuFDfGs36RvjqCVKVqBHhx5DDqX6
	CZuA==
X-Gm-Message-State: APjAAAX9Tu/CGlVA3ONrCmLTly4zKpGoJmdr7B48CmVvhhjmB7NCCV/3
	VUbaWOdSq3s+kKxjaRGa39kBpgmegvBTCmd9/rzdvMdK
X-Google-Smtp-Source: APXvYqyu4B0Fxl32x8TOZ+8NOCULLvFriHjIND/6wvoW/XSTRP7c2CNLDYVfXmI18a3giTYFYkN/t9/TTz8F+6vkoCk=
X-Received: by 2002:a19:110:: with SMTP id 16mr11025100lfb.63.1566181811958;
	Sun, 18 Aug 2019 19:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <1565951293-24335-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565951293-24335-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 18 Aug 2019 22:30:01 -0400
Message-ID: <CADkTA4PKA_oegLR+W7jvPmuKfMTASJaJZcH5+K9Ug=crSnSC_Q@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-vine: Add python3 version
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
X-List-Received-Date: Mon, 19 Aug 2019 02:30:13 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Aug 16, 2019 at 6:31 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Providing a python3 version of python-vine.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-vine.inc        | 13 +++++++++++++
>  .../recipes-devtools/python/python-vine_1.1.4.bb   | 14 ++------------
>  .../recipes-devtools/python/python3-vine_1.1.4.bb  |  3 +++
>  3 files changed, 18 insertions(+), 12 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-vine.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-vine.inc b/meta-openstack/recipes-devtools/python/python-vine.inc
> new file mode 100644
> index 0000000..f098a9d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-vine.inc
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Python promises"
> +HOMEPAGE = "https://pypi.python.org/pypi/vine"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6fadb0e48ceb84b571372dd706ed76a0"
> +
> +SRC_URI[md5sum] = "9fdb971e7fd15b181b84f3bfcf20d11c"
> +SRC_URI[sha256sum] = "52116d59bc45392af9fdd3b75ed98ae48a93e822cee21e5fda249105c59a7a72"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += " \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-vine_1.1.4.bb b/meta-openstack/recipes-devtools/python/python-vine_1.1.4.bb
> index 268675d..01c2a95 100644
> --- a/meta-openstack/recipes-devtools/python/python-vine_1.1.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-vine_1.1.4.bb
> @@ -1,13 +1,3 @@
> -DESCRIPTION = "Python promises"
> -HOMEPAGE = "https://pypi.python.org/pypi/vine"
> -SECTION = "devel/python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6fadb0e48ceb84b571372dd706ed76a0"
> +inherit setuptools
> +require python-vine.inc
>
> -SRC_URI[md5sum] = "9fdb971e7fd15b181b84f3bfcf20d11c"
> -SRC_URI[sha256sum] = "52116d59bc45392af9fdd3b75ed98ae48a93e822cee21e5fda249105c59a7a72"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += " \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb b/meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb
> new file mode 100644
> index 0000000..5926702
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-vine_1.1.4.bb
> @@ -0,0 +1,3 @@
> +inherit setuptools3
> +require python-vine.inc
> +
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

