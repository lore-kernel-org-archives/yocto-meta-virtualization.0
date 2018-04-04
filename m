Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7AF57E00BA1; Tue,  3 Apr 2018 20:25:35 -0700 (PDT)
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
	*      [209.85.215.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04756E00938
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 20:25:33 -0700 (PDT)
Received: by mail-lf0-f52.google.com with SMTP id o102-v6so23141143lfg.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 20:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OUzhHz5kvQa57cIMbUZD4o1xi7U67RlKV41pfTO/7f4=;
	b=Kp2U8+2+3808RoQGqbFkuu/rfsfD0HCB0fB6pn2fNQo+QmX3jMY8cgYCiqxxD4dR4d
	fCfS6xEzZZo1nx7iYUPkrz2YRmxR58xVbvnq0pjT9xQhdyHSjPYRQhTvzQ0+QGBomzmD
	ne3dl1mFKmYYHZyB5+dAFyLSGzfGY93PhEemoFCKZtqWD5YYFV83wjAtZAFX9L8/DVav
	1v7PoqY8r28T2bgCEZzmPVOV6AiVBJYGIRTmYcuBkpwfcoXCv5m3pRaV/cFiDiVm+x+h
	svjivsOXSWXewB/R7vLYKp0Fw5yhiPND22zf/IohM64Allkn3z6ulzuLIv4UffVZowvP
	XmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OUzhHz5kvQa57cIMbUZD4o1xi7U67RlKV41pfTO/7f4=;
	b=gHHkAdJ5GDVpbTx3E5XatNCS2yZrcaS0u2VY3KUMZSJZDtMd+oX9yQUJl8SWFwZwKJ
	dbLYfFgRnQEshCvoVPvb7kb6OH7mV3lAnoSewHMBgn4m5Qfr0W/KQwi0Wkxw/67OJK79
	6VyhQ797u8AfbwQU1qVd7BmqhAXBOfDBWoDX2gc4nc2JXaDZNesbxinNIhLeTdhTFgSU
	DDxIDvPGiIKw8cluGbBYhKzzdt3oOUu2N8WxH0VM8SDpyNf0g6G8b6ADewUSiaaq766t
	07+6uX8JXdXWoY/HqwjIIv3WXfgryvCiDLC4RDV8/xjdA2IqaEpSQfSzwBu0KegweTYj
	RuHA==
X-Gm-Message-State: ALQs6tByeyZtMV7bSCmeVzE0o/PcmHdkFEIHIRe61TMetukMrqkcooNv
	8wyFpGzkfWpeCjSBAUOc8pj2+V1RFWJXqI4eTfA=
X-Google-Smtp-Source: AIpwx4+rSUOhvjd7UCnOVTsIP2SENJ1nMb72Qcq5JoMly8DLoSrPoz95PpdCG6vDgUEKHL2hhI8f77UgS/siYewxXkE=
X-Received: by 10.46.9.148 with SMTP id 142mr10347815ljj.129.1522812332860;
	Tue, 03 Apr 2018 20:25:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Tue, 3 Apr 2018 20:25:32 -0700 (PDT)
In-Reply-To: <1522402120-7482-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1522402120-7482-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Apr 2018 23:25:32 -0400
Message-ID: <CADkTA4MNSRYJ1zPx_FP0s3__ma9gtUT44jgAsR1rZjtMQAepnw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-webtest: 2.0.21 -> 2.0.29
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
X-List-Received-Date: Wed, 04 Apr 2018 03:25:35 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Mar 30, 2018 at 5:28 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-webtest from 2.0.21 to 2.0.29.
> 2.Update the checksum of LIC_FILES_CHKSUM, since the README.rst has been changed.
>   Changed from https://webtest.readthedocs.org/en/latest/ to https://webtest.readthedocs.io/en/latest/.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-webtest_2.0.21.bb => python-webtest_2.0.29.bb}   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-webtest_2.0.21.bb => python-webtest_2.0.29.bb} (52%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb b/meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
> similarity index 52%
> rename from meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
> rename to meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
> index c0f6c94..c075a55 100644
> --- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
> +++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
> @@ -2,13 +2,13 @@ DESCRIPTION = "Helper to test WSGI applications"
>  HOMEPAGE = "https://pypi.python.org/pypi/WebTest/"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=7ddcdd3b8e69edc8c5ae7e6bb64f0bc5"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=c7fb282fc7269ea1ef7dd689470b528b"
>
>  PYPI_PACKAGE = "WebTest"
>
>  RDEPENDS_${PN} += "python-beautifulsoup4"
>
> -SRC_URI[md5sum] = "98e8b59da3cc6c150cebca8c92b66041"
> -SRC_URI[sha256sum] = "3dc92ecd7604e21fc7c97578e4c43aff2a67cebdd4884a2aa804d85e85b34b55"
> +SRC_URI[md5sum] = "30b4cf0d340b9a5335fac4389e6f84fc"
> +SRC_URI[sha256sum] = "dbbccc15ac2465066c95dc3a7de0d30cde3791e886ccbd7e91d5d2a2580c922d"
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

