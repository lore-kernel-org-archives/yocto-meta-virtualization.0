Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 183A3E00DEF; Sun, 25 Aug 2019 19:15:48 -0700 (PDT)
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
	*      [209.85.167.46 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22171E00E00
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:15:46 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id x3so11075598lfc.0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/VN72xb66cJ+8Q5SLMP1ROptdQGQJWP+tglDtoZWiuo=;
	b=O8LNebi+m0H3De3mpOenCehciJ8V3P0EKo//4oYUXat2RvxPWzrgZfgI1wKVaAQcC7
	MuRJfngoBrLQr5A7JIksK9kG9nvaLqsV1noER3nsaCxxEMTHJ49wXOmcWDd5WR4xyGIh
	6caYCSXCMr2/oanNWhPKWQcyH4z486/+SpnmtDUZXoUjeFfVexonAOM1MCbwuZ3goqRp
	VnzGS0F2ALzucw5Nkh5vgHnZpe12hafKCv6qgklg5ggEJbyJs83pQEBbMjRrrx94HvVO
	dUfhAhI3rVe0qiGf01bipy+dyyoRslhuE8g/BKKwtUVKPMT2meVC+pnjrHMI5q+7zGYN
	8wHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/VN72xb66cJ+8Q5SLMP1ROptdQGQJWP+tglDtoZWiuo=;
	b=Zclqwd9huGGlff+5Y38947Bl1MIjz0JTosf1q9zXOheuQNlGq3gEul10neMXCOGzQu
	4gUIpoab4826erbJ1ddImVpRCGFbqxj0p2GjkiO4hcuqC19o4IDcBqcqcnrY1jnpC7Jl
	VteWERmyGDg3isCi8p+1TLBhLL5//o33lZC9px2bs9NFUG0MKF1EffhoTMrzMEZCtrHF
	wHgu6jUG9qowwupsdnaJKRXzxwz4CSllWDIuNgjFwJvib1dxYkEGjabCQdzChjcWLjWx
	y1YeovY6Agq6gozhpM5kiKHjeW7bz0NZy+vLJ/0AfjWjlLW4D7v+Xob2aIsWji+P/5cy
	c5YQ==
X-Gm-Message-State: APjAAAV0Q4/MNmUTKppZjgGwbkzYScy0k2/DOOOeEgbS9Z4I9wUrAqMr
	6tghOXxPAH6n/7nllsHjsxcyRW5hf7a3rH5Oohnn8YN0
X-Google-Smtp-Source: APXvYqzrvczmldYE4EvGUfl/EAoeSm/3fFkw4PTaRRih0gHMtdmlNyKXTqRaEn/MZ3TEQ19r/y0xGITIxmgEzZVjBv4=
X-Received: by 2002:a19:428f:: with SMTP id p137mr4426488lfa.149.1566785745776;
	Sun, 25 Aug 2019 19:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <1566193554-76760-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1566193554-76760-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 25 Aug 2019 22:15:34 -0400
Message-ID: <CADkTA4PiO+Rh6Mw_ZGgH0voEfwEBNK=Yq1p_q0GOkFSKqFsP1w@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-oslo.i18n: Add python3 version
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
X-List-Received-Date: Mon, 26 Aug 2019 02:15:48 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 19, 2019 at 1:46 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Providing a python3 version of python-oslo.i18n.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-oslo.i18n.inc               | 32 +++++++++++++++++
>  .../python/python-oslo.i18n_git.bb            | 34 +------------------
>  .../python/python3-oslo.i18n_git.bb           |  2 ++
>  3 files changed, 35 insertions(+), 33 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.i18n.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n.inc b/meta-openstack/recipes-devtools/python/python-oslo.i18n.inc
> new file mode 100644
> index 0000000..3c0e74c
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n.inc
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "oslo.i18n library"
> +HOMEPAGE = "http://launchpad.net/oslo"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> +
> +PV = "3.17.0+git${SRCPV}"
> +SRCREV = "f2729cd36f8694a6ec53a0e700599ddf4427440d"
> +
> +SRCNAME = "oslo.i18n"
> +SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
> +
> +S = "${WORKDIR}/git"
> +
> +# DEPENDS_default: python-pip
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
> +        ${PYTHON_PN}-babel \
> +        ${PYTHON_PN}-pbr \
> +        ${PYTHON_PN}-six \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
> index 9f7ddc5..b990e67 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
> @@ -1,34 +1,2 @@
> -DESCRIPTION = "oslo.i18n library"
> -HOMEPAGE = "http://launchpad.net/oslo"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> -
> -PV = "3.17.0+git${SRCPV}"
> -SRCREV = "f2729cd36f8694a6ec53a0e700599ddf4427440d"
> -
> -SRCNAME = "oslo.i18n"
> -SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
> -
> -S = "${WORKDIR}/git"
> -
>  inherit setuptools
> -
> -# DEPENDS_default: python-pip
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
> -RDEPENDS_${PN} += " \
> -        python-babel \
> -        python-pbr \
> -        python-six \
> -        "
> +require python-oslo.i18n.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb
> new file mode 100644
> index 0000000..5a06622
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-oslo.i18n_git.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-oslo.i18n.inc
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

