Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D87BE00A57
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Mar 2014 19:34:18 -0700 (PDT)
Received: by mail-la0-f52.google.com with SMTP id ec20so249760lab.11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Mar 2014 19:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eUtD7uVzyf0UjFA1RQRvmmIGwuD4nQNlu1wc5fXfxN0=;
	b=nDKUAlxoYsKWLKflfd5HOWqkcHQpmm+fl/Bj1UlMuGiEmuquXuO8K89hm5Rny/zgsO
	96ThiC9bBiuWsEIb3AkPjBAXTIEXSX0s4yVG8GGdh9Y8dYw52v8DzdWJlOODn8jELt/o
	qP8W4bck/tfTxGdry9eNuOjJQitNBJ7r2IdbfC339CaeiPKo90J87Ymrk9J0EIXpFXW2
	K15jEBw6gYTDtoQD9CbEJfN4yTtsQIn4MuWXfobIXdJ1K/hwC/Wr/iDrpVq7stlvczAn
	hXdO8MAN6p4KnM0faztv/GoLB9k9EbVKuWKg+wyYxSTkK4sA9m8vVZe6fQK0bKJXBpk4
	zfEw==
MIME-Version: 1.0
X-Received: by 10.152.18.229 with SMTP id z5mr567898lad.27.1394678057390; Wed,
	12 Mar 2014 19:34:17 -0700 (PDT)
Received: by 10.112.170.166 with HTTP; Wed, 12 Mar 2014 19:34:17 -0700 (PDT)
In-Reply-To: <1394668571-8545-1-git-send-email-hong-hua.yin@freescale.com>
References: <1394668571-8545-1-git-send-email-hong-hua.yin@freescale.com>
Date: Wed, 12 Mar 2014 22:34:17 -0400
Message-ID: <CADkTA4PhC82S2KgfFJ5cYQb_mUq2V-PFSWGL++WEXuS84KPMVA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Olivia Yin <hong-hua.yin@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: uprev to v1.2.2
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
X-List-Received-Date: Thu, 13 Mar 2014 02:34:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

We need to hear about some testing .. what exactly did you do to sanity test the
update ?

I have the same update locally, but was taking it through some tests
to make sure
it was sane. I'm happy to take this change instead, but want to know
what was done.

Cheers,

Bruce

On Wed, Mar 12, 2014 at 7:56 PM, Olivia Yin <hong-hua.yin@freescale.com> wrote:
> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
>  recipes-extended/libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} (97%)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 2144a56..195a9de 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>  SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
>
> -SRC_URI[libvirt_python.md5sum] = "e1effd6007b2ebd5d024c6c3838456fb"
> -SRC_URI[libvirt_python.sha256sum] = "bce558606b157d0717ee7bd6537d85dd4c0321c59b4235c967db7a3aad80e246"
> +SRC_URI[libvirt_python.md5sum] = "cd3b75c0eb64e933f0b648fbdca6e868"
> +SRC_URI[libvirt_python.sha256sum] = "94d79d662b6010f6c688b8856b2d95077736d48ffa35feed5a339d7fafbf8c39"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.2.bb
> similarity index 97%
> rename from recipes-extended/libvirt/libvirt_1.2.1.bb
> rename to recipes-extended/libvirt/libvirt_1.2.2.bb
> index 4c9cf36..18a6df5 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.1.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.2.bb
> @@ -25,8 +25,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>            file://libvirtd.sh \
>            file://libvirtd.conf"
>
> -SRC_URI[libvirt.md5sum] = "cce374220f67895afb6331bd2ddedbfd"
> -SRC_URI[libvirt.sha256sum] = "bc29b5751bf36753c17e2fdbb75e70c7b07df3d9527586d3426e90f5f4abb898"
> +SRC_URI[libvirt.md5sum] = "592958ad1ddce7574d8cb0a31e635acd"
> +SRC_URI[libvirt.sha256sum] = "a48377e307c5c21b67e43db99af909a23c33aff8cbbaa3361fd389eb047cbbc3"
>
>  inherit autotools gettext update-rc.d pkgconfig
>
> --
> 1.8.4.1
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

