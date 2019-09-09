Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7BF80E00DB1; Mon,  9 Sep 2019 10:36:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9039E00D4E
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:36:31 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id d10so11196616lfi.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vGvqqZYu55XhcnC+v0chJJUFMY+OJ+Ufap68nGvzHtc=;
	b=YKnx5+U8kAgLVhKHmy6YZLyPKvSNNSVxg5e8FTFo7p+XYkyyOAH+ai0TGkrfyxKsny
	JjtAVANXGNZVMp/NoE/A1SXSyKqHDAbGITsESQiPYlE6mPEab+9uhyX4cTlBUMU/FL7f
	jDiGRtSiWhXcHVipP4YTRUd9bxc4TANAWBy0s2fyIJuAAN7jpOz+0bUoZJnJkME6FdKC
	rzdslBUrZoiWw4inRk1UPKyll5VWsTRCUHbk7KaAn9QfAA8sGkKGFl5IbOrR2R8TYpzW
	KPbWPd3e1TNegFDXKuhO+r8jaqf51p3mjiCrj0Mx1uOamjerik2T7pf5ut3aAw7DxwL3
	ihIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vGvqqZYu55XhcnC+v0chJJUFMY+OJ+Ufap68nGvzHtc=;
	b=c9ejqOebOMG8a+OdKZA03YdCFQvjs2StxEY6j8/XP3t8hqb+7sVnXlSY/IGrwUEsWO
	i9W7FPBpBApe60sYE3r/Ti8sTVsDl2V27lhGRBxvoHDcBPcO1Y8LPVXu3Cd59mwNQbd+
	x9slmq8xnqgCMkDZ1tOqDrf3gYMcDrJD60EN4XVZHHwvAp7WapUmmsBzou7USdpTedY8
	idY089/yiZg0LF+HHHIiQ9S0kubzl8WqZik4fQyx72jjhEMDNPPYTJAtnuYuK7qMPY+x
	MZX1+4D9CutJdJuczezllmOrLHu1/P1rouaYk+KTiCZe8ArjDCw54F00xPCvCoO0nLHa
	5zvA==
X-Gm-Message-State: APjAAAVEmbXjWemGC1N9Jrn/QqOLityydJQNOkYX4PJOJKqpphuaz41C
	KbO2AcWzGuKtJKnixHefdEDf3ZoD5irfGZFPZU/oTQE3
X-Google-Smtp-Source: APXvYqye1BsKwkcQjgteMikpmORj+eFobPZ81DeSeUNjxl2Oc1UtB1D3Tcev1+rt3+VAMbrcLqGqU6qav7d5B2rjC3k=
X-Received: by 2002:a19:428f:: with SMTP id
	p137mr17606635lfa.149.1568050589603; 
	Mon, 09 Sep 2019 10:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190909070730.12568-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190909070730.12568-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Sep 2019 13:36:18 -0400
Message-ID: <CADkTA4PUX24xHQ618eiyNMcMYLT-6Wc8NUGwx7CmzwGkM6Cj5Q@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-testtools: Add python3 version
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
X-List-Received-Date: Mon, 09 Sep 2019 17:36:40 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Sep 9, 2019 at 3:09 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-testtools.inc   | 23 ++++++++++++++++++++
>  .../python/python-testtools_2.3.0.bb               | 25 ++--------------------
>  .../python/python3-testtools_2.3.0.bb              |  2 ++
>  3 files changed, 27 insertions(+), 23 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-testtools.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-testtools.inc b/meta-openstack/recipes-devtools/python/python-testtools.inc
> new file mode 100644
> index 0000000..7cc63f4
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-testtools.inc
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "Extensions to the Python standard library unit testing framework"
> +HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
> +
> +SRC_URI[md5sum] = "0f0feb915497816cb99e39437494217e"
> +SRC_URI[sha256sum] = "5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559"
> +
> +inherit pypi
> +DEPENDS += " \
> +    ${PYTHON_PN}-pbr \
> +    "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +    ${PYTHON_PN}-pbr-native \
> +    "
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-extras \
> +    ${PYTHON_PN}-pbr \
> +    "
> diff --git a/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
> index bbf1d01..56ff9de 100644
> --- a/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testtools_2.3.0.bb
> @@ -1,23 +1,2 @@
> -DESCRIPTION = "Extensions to the Python standard library unit testing framework"
> -HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
> -
> -SRC_URI[md5sum] = "0f0feb915497816cb99e39437494217e"
> -SRC_URI[sha256sum] = "5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559"
> -
> -inherit setuptools pypi
> -DEPENDS += " \
> -    python-pbr \
> -    "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -    python-pbr-native \
> -    "
> -
> -RDEPENDS_${PN} += "\
> -    python-extras \
> -    python-pbr \
> -    "
> +inherit setuptools
> +require python-testtools.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb b/meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb
> new file mode 100644
> index 0000000..896ecee
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-testtools_2.3.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-testtools.inc
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

