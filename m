Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 177B7E00869; Mon, 29 Sep 2014 07:27:14 -0700 (PDT)
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
	*      [209.85.217.182 listed in list.dnswl.org]
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B324E0080A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Sep 2014 07:27:06 -0700 (PDT)
Received: by mail-lb0-f182.google.com with SMTP id z11so6323935lbi.27
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Sep 2014 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TJxawc+9YyX9FzgQoGQJVwHKkSDJwnw9TSutK3vXM5s=;
	b=lA2Tk9jmvpb81afaz6nrqPBDafwEfO8YwlIEYhctmGFmFwsSRxrXJTEnHrl9t4ONvW
	u4ItXydtGwJvo8o83Teg/ia1F9NpJzMSuuJInF12RXKx0tgs7rtALPtRTbCRjbq58RZ7
	4fIjyMx5WOppJ9HsNncOtaB+kqSHfeoewrRFV1kWuxJW+jgDBwtP5ovJ4ShHDnyPDWcU
	9UE3nBciseviYs2CN3Wwtj+weCv9NXB8s8gvz5CYqOHtPaNIpF14DJyJz8Fx/0YsDuns
	EKknOnhig1R+92ePDHyYf5L6i5mohUc894NW42PmPqel9pPbjGDE/sBFT3DLusbvEYm0
	1NUQ==
MIME-Version: 1.0
X-Received: by 10.152.36.37 with SMTP id n5mr3873997laj.93.1412000824714; Mon,
	29 Sep 2014 07:27:04 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Mon, 29 Sep 2014 07:27:04 -0700 (PDT)
In-Reply-To: <1411694772-46081-1-git-send-email-r63875@freescale.com>
References: <1411694772-46081-1-git-send-email-r63875@freescale.com>
Date: Mon, 29 Sep 2014 10:27:04 -0400
Message-ID: <CADkTA4NccaWeVu++o7fWyYtZLMN5S564BVccVFsjC6mmW6+YQg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Olivia Yin <r63875@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] libvirt: uprev to v1.2.8
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
X-List-Received-Date: Mon, 29 Sep 2014 14:27:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 25, 2014 at 9:26 PM, Olivia Yin <r63875@freescale.com> wrote:
> Signed-off-by: Olivia Yin <r63875@freescale.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
>  recipes-extended/libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb} | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb} (98%)

A much smaller patch :)

I've merged this version.

Bruce

>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 1c95b07..f81d364 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>  SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
>
> -SRC_URI[libvirt_python.md5sum] = "fbcb68f898390b321cbfcbdaa8d0c1ba"
> -SRC_URI[libvirt_python.sha256sum] = "a2f30059b8870b3808b2bd2f19210422a348649a8f53523c2cbfa5cd64af217e"
> +SRC_URI[libvirt_python.md5sum] = "fd31751932c96895c2f69c12532d8ec3"
> +SRC_URI[libvirt_python.sha256sum] = "0f3709680b6e054253bf81ebc535f1bf5da648f8cd55167578a2dacd3eebb9d8"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_1.2.4.bb b/recipes-extended/libvirt/libvirt_1.2.8.bb
> similarity index 98%
> rename from recipes-extended/libvirt/libvirt_1.2.4.bb
> rename to recipes-extended/libvirt/libvirt_1.2.8.bb
> index 56b4d4b..57ae613 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.4.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.8.bb
> @@ -32,8 +32,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://tests-allow-separated-src-and-build-dirs.patch \
>            "
>
> -SRC_URI[libvirt.md5sum] = "da7a9ca519df45a460659189fe0024e6"
> -SRC_URI[libvirt.sha256sum] = "e43ac5f6b2baeafcd01777be03a897e636f8d48c0cdfb4c4cbb80d45faa9e875"
> +SRC_URI[libvirt.md5sum] = "75114991290f7c8f01dd5223431b9c00"
> +SRC_URI[libvirt.sha256sum] = "0049940b013ea5858b53d9b540c9df9cc3c8cb08750acfd96e9991a1f709e100"
>
>  inherit autotools gettext update-rc.d pkgconfig ptest
>
> --
> 2.1.0.27.g96db324
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

