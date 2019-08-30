Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9FE9E00E00; Thu, 29 Aug 2019 21:20:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17675E00D89
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:20:02 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id g9so4286549lfb.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8faLl1T0UbMq/HfAhavUh9JeanDMVhMwD3V0g0UfEBE=;
	b=oOmJd82LTYJaRYMivHT5T3bWdEJmAefOMh7Vi+0TRGv83EciFZCbVonAR7wdZpDvbs
	g3hhblLhL19uYz2Vgw1K98y3Jiv+ybgapRXxvi6O4D+8GPaoa8S3L/DhxzZfb3PE29Ha
	meE6V38ggkv1jaKHg8zQC5IeEUYZJ6rtTHTPWAQhVEmGc/bKzPEoSEMRQqK3yBim/lHM
	nH7CTM5Kfu7otlhS6p6NWVpXL6Qb0k47hwyeLBk/NixrYcIwkEMShpb6QWa/LhwRJ/cX
	nj9/7/rwznjjbjDsF7hD9eJ7JIlalSSeswXcmqEmKmrq/4+uMUZVL7bgSaGXZ+VQr/2g
	HLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8faLl1T0UbMq/HfAhavUh9JeanDMVhMwD3V0g0UfEBE=;
	b=Pkd0lnz1ite7zeDSfO2AsiWv3lFT4DRm+Jk9MYUakJruQea/GR7jGl8zJm40muipd6
	qVgMiQU1bTmVUDIgubVRrIk2TXGKyoX7Y3Bkvw912wrmM1KkJ7V5bUmf+yAcWz5tPm/N
	4i8PINiOOIJH2bxTAU1l0FPayoUuiVIv90cg1+ZmYi83vEPAQ0Ll+2vwfucLLuixEEtR
	XEJqFlmyD02o1Uub1CQFlkbuNf8n0+yrWWifMVHQyJC3e+k+awLVVMOQyUJYe2hyRrte
	4q+llL3aDk6vXWg0KRzL21PEnQeVo6seNWW838+Itlm6foFe0Rw5Y8jgvo5gfSmLoQCD
	kzDw==
X-Gm-Message-State: APjAAAUq8AnGg8Zvm5vB7R5oAFoY76T5M/16UP06MPf8A18ayT4j2IlB
	83BDa0nIYcsDZtCyIcWW8fvWRoTb4Ap2+dhFeqA=
X-Google-Smtp-Source: APXvYqyh+ERSRwgoysHjI+oNZ7xhEEK/9cdYlbsfJSJT/d14cTk7pR27PaTWprL1ATEQqFEi1p9fBhTfat5eeAvd1OI=
X-Received: by 2002:a19:428f:: with SMTP id p137mr8386927lfa.149.1567138801783;
	Thu, 29 Aug 2019 21:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <1566805183-116675-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1566805183-116675-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:19:50 -0400
Message-ID: <CADkTA4ME-Y3amc+cgmd7yt-o9HFR6OtyB9UdY3e6hLNd6Az_tQ@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-debtcollector: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 04:20:05 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 26, 2019 at 3:40 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Providing a python3 version of python-debtcollector.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-debtcollector.inc           | 25 +++++++++++++++++++
>  .../python/python-debtcollector_1.21.0.bb     | 25 +++----------------
>  .../python/python3-debtcollector_1.21.0.bb    |  2 ++
>  3 files changed, 30 insertions(+), 22 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-debtcollector.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector.inc b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> new file mode 100644
> index 0000000..629a059
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner."
> +HOMEPAGE = "http://docs.openstack.org/developer/debtcollector/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI[md5sum] = "ec899623b37fdee65b888243f0a46735"
> +SRC_URI[sha256sum] = "f6ce5a383ad73c23e1138dbb69bf45d33f4a4bdec38f02dbf2b89477ec5e55bc"
> +
> +inherit pypi
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        ${PYTHON_PN}-pbr \
> +        "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        ${PYTHON_PN}-pbr-native \
> +        "
> +
> +# RDEPENDS_default:
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-pbr \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb b/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
> index 18b910b..1cdfc3a 100644
> --- a/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
> @@ -1,26 +1,7 @@
> -DESCRIPTION = "A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner."
> -HOMEPAGE = "http://docs.openstack.org/developer/debtcollector/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +inherit setuptools
> +require python-debtcollector.inc
>
> -SRC_URI[md5sum] = "ec899623b37fdee65b888243f0a46735"
> -SRC_URI[sha256sum] = "f6ce5a383ad73c23e1138dbb69bf45d33f4a4bdec38f02dbf2b89477ec5e55bc"
> -
> -inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -# RDEPENDS_default:
> +# Only for Python2 depends on funcsigs
>  RDEPENDS_${PN} += " \
> -        python-pbr \
>          python-funcsigs \
>          "
> diff --git a/meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb b/meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb
> new file mode 100644
> index 0000000..7947185
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-debtcollector.inc
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

