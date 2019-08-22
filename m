Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CC08E00DD5; Thu, 22 Aug 2019 06:22:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (asselsm[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 212EDE00D33
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Aug 2019 06:22:20 -0700 (PDT)
Received: by mail-ot1-f65.google.com with SMTP id z17so5365707otk.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Aug 2019 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LG+sk8ttGhbsHOgN0gN5EN3WL0gh/oa/LwtP1Rjkk8g=;
	b=SME7bN1TE+ZkHjAD7i7Kqkhn3YG5fJlbl74zpelYfhOjjtFGTg95BT9e54NbPTn1pc
	YfUgDyrMGTVkmKy768skZUUiuQA8mtwpgn2Ildby6UZd0KYAOTmyfVh3m/NvWxadqhnP
	PwFbnPE607Wc/qThaVeHqSQfZkbo8DWsE3TkLiWCL7AM/7MjMl/F5ixFNBCanVKQvil4
	gVkVwhSULGMdKqrPrAT8EaZtv3hAaRYT0DrwfuhK7iZeziPgXYbEqv2sgk4goR573JBt
	a3JVeKWmmRoF0ksjDQDFygPKIQL90fpJFRIA8GRccgWXZixUuAYHr5/4TWWAxynQOzxp
	e0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LG+sk8ttGhbsHOgN0gN5EN3WL0gh/oa/LwtP1Rjkk8g=;
	b=e5XoRuhVcPYNj/2hI7Uz7q0QViDWp1kRv1Ul1X/yqJBzk4HzUK9w/gSJmYgXS24h6e
	Kz9giz71DaMludCEut7yeFft8POobNfYqHS9EG1DcLEk6SQFxA0NyY6TJpZ/0nYX4H7n
	oIx/6aE3TfkrzyGGr1ePXZ1ISETKPxBf18uWyuioDF8vzQgLizG7Roc/jYf5P2nFsoec
	/1j43tJ0Uw50esour+AoINfrKDuZIkChL4w/1pgr5lSh4HkYbCRuON/Azd/1RYtV5o6j
	P7V/B8pA24BgrPDPV9AWCO0NHD9YrJvVBLM4Cp5G1eD6yeoIajFsmOf3qAp+JNLViE1M
	NeTQ==
X-Gm-Message-State: APjAAAWYzE5YoK3/fj5EILT8ygsDBkSBqDDBU8SZ3WnCophUJFMAIG/e
	fpoL7zzt2wPPaoDH8JqkouVORtI8yZLERBofuqg=
X-Google-Smtp-Source: APXvYqyO67BpXoHWn2aozpc7C/wjlp/Z+ouzuPggCQPp5rHEdjZVpj1/1YUWhK8VL8+jm33awiyA/+uKPnK5jg9HtmA=
X-Received: by 2002:a05:6830:1a:: with SMTP id
	c26mr30036662otp.360.1566480140048; 
	Thu, 22 Aug 2019 06:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190822052550.19674-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190822052550.19674-1-zangrc.fnst@cn.fujitsu.com>
From: Mark Asselstine <asselsm@gmail.com>
Date: Thu, 22 Aug 2019 09:22:09 -0400
Message-ID: <CAPuovELxTcPAUPOhohAmtUKT6q2J69t3knOzGM_+HMG7FxHJMA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: upgrade 5.5.0 -> 5.6.0
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
X-List-Received-Date: Thu, 22 Aug 2019 13:22:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 22, 2019 at 1:26 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>

I know it doesn't always happen but it would be nice to see test
results like I had
done in commit 9ad042c295179a99f2f774cc42faea6fd42badcd. Everything is
ready to do this and we can ensure we aren't introducing issues, along with
recording a record of how things are in case issues do happen later on.

Mark


> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
>  recipes-extended/libvirt/{libvirt_5.5.0.bb => libvirt_5.6.0.bb} | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_5.5.0.bb => libvirt_5.6.0.bb} (98%)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 796d6dd..ffbaa41 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>  SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
>
> -SRC_URI[libvirt_python.md5sum] = "4c8c38c409f967b8b47e0d7c6df050a4"
> -SRC_URI[libvirt_python.sha256sum] = "561cafedb83e41880405905f6309f4a86981cfe05edbbc83c839f7c47d8ba603"
> +SRC_URI[libvirt_python.md5sum] = "143f83a2f89b6523a1b1c51be6a316b4"
> +SRC_URI[libvirt_python.sha256sum] = "4df13fed9528a7eec153ab70196dcd481f6377ae5bf9ef84e07dfa1515202486"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.6.0.bb
> similarity index 98%
> rename from recipes-extended/libvirt/libvirt_5.5.0.bb
> rename to recipes-extended/libvirt/libvirt_5.6.0.bb
> index de936c4..643c49e 100644
> --- a/recipes-extended/libvirt/libvirt_5.5.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.6.0.bb
> @@ -40,8 +40,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://gnutls-helper.py \
>            "
>
> -SRC_URI[libvirt.md5sum] = "27c5fb6c8d2d46eb9e8165aeb3b499b0"
> -SRC_URI[libvirt.sha256sum] = "2306ef0947a594f91ec9da4b8b0307bdb54b897f17de19f48e8ecdca08ff35e8"
> +SRC_URI[libvirt.md5sum] = "e818bb25ead24119925781b7519a8401"
> +SRC_URI[libvirt.sha256sum] = "65f4f9924e10135aa694ca8bcb0b55725883d08e0b32c42111603d573aabb9b4"
>
>  inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd
>  USERADD_PACKAGES = "${PN}"
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

