Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 662BDE0053F; Tue, 28 Aug 2018 05:22:35 -0700 (PDT)
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
	*      [209.85.167.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16626E0043F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Aug 2018 05:22:33 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id g9-v6so1217694lfh.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Aug 2018 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2NIH1JMwxB6h9YY88CjiBY/9SrZzDCOMNmhJYvIY5uY=;
	b=aMZeV09Cj8enOeSQbc7tCHrUtRgQ2ddkxN1pxMUwsCq5k5hZXU6bEOdJ5Pr9V3gm8D
	21yY5ehOmi240BnxoyI4CetKFtrtm2LC5KJ5JrRBR0GLV4RainKnuCrm3D0KnP9fA7b4
	May76Nw9+vMnDxcTn1MChEnGzxovH1hOvkliFed1VPwzLTJCfDqsk/fG6m3CtPUATDwg
	wLcfiCnvCwFW9sOW2Sh31MClNbt1t4cjd2IIXpwS8dVuD+I7m/p38rWevKrvzR1fQkfW
	sHNucPe+KQPjqWrMVSNaB+43OqHg7t8HDl9jllBZ5dOkGvNW0FjUSC6us281+/9Lmv9f
	4q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2NIH1JMwxB6h9YY88CjiBY/9SrZzDCOMNmhJYvIY5uY=;
	b=gjspMrKOS4AaCWw+cqoMLcUQpJAEA8+uCsp0wZ46PqoLWZ7uXiEd3UaA7plyWxNAJE
	I5bqYun3f62S1nSBZn/0AyuKnyRFUXicmYKlaRqFQjVsUuJMi3BAAj1unoQVTf0jbDUA
	u0Ta/cbh4i+vr1rUVk1GeQZrL7Kirfomt/Lzf7lUJ7oYOYQgWmAQwSYr+9866r8CvazI
	s3+WJerFaK0dXxIenBtfvSx2tAeMj04rxzAu6wFbKNIfXHdqrmU1wd7DFFl4WjJWnDjb
	thIA7GwlpAO2lRmFLqEQWhmnGgJSxwbG9W9QNKS6d4wuHkNm6Cjz7EWtp/E2IXIJJjCC
	Q4RA==
X-Gm-Message-State: APzg51BktUw0SzOgdkmwJahg6UHB4FS5Jz2cdyg1GlzUpGOkAUum+glO
	AtIzIgLMp+6j8fdPccKX3bcy3WVcRV2b/3A0IFQ=
X-Google-Smtp-Source: ANB0VdZ183mBeFNaCq6VXfK954UUjIduVCc6lt/lOpFIMmr+CdNyKT2zLk20I02UHqq3+IcyxglEoAWhdXAdEWfnKAE=
X-Received: by 2002:a19:7411:: with SMTP id
	v17-v6mr1152823lfe.49.1535458952962; 
	Tue, 28 Aug 2018 05:22:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 05:22:32
	-0700 (PDT)
In-Reply-To: <20180827121227.6950-2-adrian.ratiu@ni.com>
References: <20180827121227.6950-1-adrian.ratiu@ni.com>
	<20180827121227.6950-2-adrian.ratiu@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Aug 2018 08:22:32 -0400
Message-ID: <CADkTA4P_vn6Ez9B-Oqv1r4GKdE_3Y+H2jQRC1AHv7_XZYrrOOw@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][PATCH 2/2] python3-pika: add recipe
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
X-List-Received-Date: Tue, 28 Aug 2018 12:22:35 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Aug 27, 2018 at 8:12 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../recipes-devtools/python/python-pika.inc        | 13 +++++++++++++
>  .../recipes-devtools/python/python-pika_git.bb     | 14 +-------------
>  .../recipes-devtools/python/python3-pika_git.bb    |  3 +++
>  3 files changed, 17 insertions(+), 13 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pika.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-pika_git.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-pika.inc b/meta-openstack/recipes-devtools/python/python-pika.inc
> new file mode 100644
> index 0000000..d33979d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pika.inc
> @@ -0,0 +1,13 @@
> +SUMMARY = "Pure Python RabbitMQ/AMQP 0-9-1 client library"
> +HOMEPAGE = "https://github.com/pika/pika"
> +SECTION = "devel/python"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fb26c37045f9e0d2c5e24b711bd7f01c"
> +
> +PV = "0.10.0+git${SRCPV}"
> +SRCREV = "b907f91415169b7f590174ab5d228e75a1b273e6"
> +
> +SRC_URI = "git://github.com/pika/pika"
> +
> +S = "${WORKDIR}/git"
> diff --git a/meta-openstack/recipes-devtools/python/python-pika_git.bb b/meta-openstack/recipes-devtools/python/python-pika_git.bb
> index 6d2e55a..9d58184 100644
> --- a/meta-openstack/recipes-devtools/python/python-pika_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pika_git.bb
> @@ -1,15 +1,3 @@
> -SUMMARY = "Pure Python RabbitMQ/AMQP 0-9-1 client library"
> -HOMEPAGE = "https://github.com/pika/pika"
> -SECTION = "devel/python"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fb26c37045f9e0d2c5e24b711bd7f01c"
> -
> -PV = "0.10.0+git${SRCPV}"
> -SRCREV = "b907f91415169b7f590174ab5d228e75a1b273e6"
> -
> -SRC_URI = "git://github.com/pika/pika"
> -
> -S = "${WORKDIR}/git"
> +require python-pika.inc
>
>  inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-pika_git.bb b/meta-openstack/recipes-devtools/python/python3-pika_git.bb
> new file mode 100644
> index 0000000..93f50b4
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-pika_git.bb
> @@ -0,0 +1,3 @@
> +require python-pika.inc
> +
> +inherit setuptools3
> --
> 2.18.0
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

