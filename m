Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B49B8E00DFF; Thu, 29 Aug 2019 21:19:28 -0700 (PDT)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E99ADE00C4F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:27 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id n19so4218376lfe.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gADscre5rfNUWsxz8kwNQ0rtwE5HBuCvaiODr4v9uXs=;
	b=Sgm7i9MYKSTuwrWD3K2LMQtwq2/CsM79zBi44yWShcOH5nwtQRnOCundQPmlhGeexV
	eoIASWcDrtFn0jyFs2saQINOg24BR8PtW00q5I0jczgobC1PQKYKCl8quBRFaI4G1eIl
	T8bbQ2fp6HMdC5UZmbEXGu3FFHpkuSzpsGhRdwoKUmHv8zSCaj4mQUs3+vVbhlVKXKp4
	ZPokZ3wVm9HMZmVjRCHkCivdEejc3SnBFIcsNX9kMyyIhlEgQbL9SiZIT6bOL76kk7VY
	rVWdH4eDexhZYb+orBt/EVF5PvyXsE93J5ZlfhF1meKPn2JyWygMgO4FWzQMRd7z2Svm
	dubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gADscre5rfNUWsxz8kwNQ0rtwE5HBuCvaiODr4v9uXs=;
	b=UM22gVr6A29nsMe2MoIIaaPgKEQKH6P0oDhfXFwNFAPqYazo9i2YdsNOgPVUMmm/B3
	/rJIGrVVyxQZJysXYvUlxkJmME0EQaZDTQlOpu++abssLpRPWlRajU4R5vyOTJKCfZ7k
	gSsBbd5YlihgHmyXf9DAqlGJvk4ljzr0dEen3Sa52tNUDGlrsCXPBKIZC1HDa8cI2wN7
	UbDYVnYJdrhAy39NePQEtITKpMPftAiC0ylRbZ715o1GGAexz9GxKPtzLTFX3TKCIJ3L
	AatJp7TNf0+V6wDhlCJ2e8jM7mxaQUVJ0tdDh/WjFBcJPmrM2PbjRIspmFlDxsuf9GAN
	V0Iw==
X-Gm-Message-State: APjAAAXHpmzwH8/aQS7s1/md4CLMcFB4wdBtLnqzc23fAAOhpFHdAYHu
	hJ0hHzvuwJo4uNgKz7wYyAYjKFCD9kFjJhMl6RMCjrYS
X-Google-Smtp-Source: APXvYqxHthTsqOOjgIckPk51U0Rgmaaiz0rWvN7KuSfdPF6nIIKzKOgfzsCjJeLWLFn5ySrn+Dd32qqd7FQSNmzAFP4=
X-Received: by 2002:ac2:442d:: with SMTP id w13mr8723100lfl.184.1567138766779; 
	Thu, 29 Aug 2019 21:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <1566798664-114964-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1566798664-114964-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:19:15 -0400
Message-ID: <CADkTA4OC1vEFCQ+jiJmrWQ5+8LO+dg09C64xUsoFXcovZXCzQw@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-requestsexceptions: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 04:19:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 26, 2019 at 1:51 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Providing a python3 version of python-requestsexceptions.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-requestsexceptions.inc      | 23 +++++++++++++++++
>  .../python/python-requestsexceptions_1.4.0.bb | 25 ++-----------------
>  .../python3-requestsexceptions_1.4.0.bb       |  2 ++
>  3 files changed, 27 insertions(+), 23 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-requestsexceptions.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-requestsexceptions.inc b/meta-openstack/recipes-devtools/python/python-requestsexceptions.inc
> new file mode 100644
> index 0000000..bac99a3
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-requestsexceptions.inc
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "Import exceptions from potentially bundled packages in requests."
> +HOMEPAGE = "https://www.openstack.org/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
> +
> +SRC_URI[md5sum] = "f43b246ccd7d5b618e6f0dc946a6c3f3"
> +SRC_URI[sha256sum] = "b095cbc77618f066d459a02b137b020c37da9f46d9b057704019c9f77dba3065"
> +
> +inherit pypi
> +
> +# conflicting file prevention
> +do_install_append() {
> +       rm -f ${D}${libdir}/python*/site-packages/tests/*
> +}
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pbr-native \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-pbr \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb
> index 729e3d7..87b6ca9 100644
> --- a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb
> @@ -1,23 +1,2 @@
> -DESCRIPTION = "Import exceptions from potentially bundled packages in requests."
> -HOMEPAGE = "https://www.openstack.org/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
> -
> -SRC_URI[md5sum] = "f43b246ccd7d5b618e6f0dc946a6c3f3"
> -SRC_URI[sha256sum] = "b095cbc77618f066d459a02b137b020c37da9f46d9b057704019c9f77dba3065"
> -
> -inherit setuptools pypi
> -
> -# conflicting file prevention
> -do_install_append() {
> -       rm -f ${D}${libdir}/python*/site-packages/tests/*
> -}
> -
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        "
> +inherit setuptools
> +require python-requestsexceptions.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb b/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
> new file mode 100644
> index 0000000..1c049f3
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-requestsexceptions_1.4.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-requestsexceptions.inc
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

