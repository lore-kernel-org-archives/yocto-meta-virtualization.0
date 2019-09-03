Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4FD7FE00D67; Tue,  3 Sep 2019 12:53:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 117A2E00BF8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 12:53:36 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id j16so11129031ljg.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 12:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Tm0rSsnSbQTmRn7SXTyQtg5aZloK3O+A5aLLhZi8Dyw=;
	b=vD2zLvrQj0yKWFcmuIeiZHuZLeyLP72M1ELYAkAkIsAx6v/ztosmKzTV4wPu0yZbk2
	8XS4ragtLCbdiZKwVI1dfv3pctEhra5B6ueoYtOLYnm2e9Rb/tmMWuqRl43EqKJzD9Oz
	Y9rFcArFH5Tg5vTptCyxXJqeOGayzkhR9xuUAMjSitPG3va4a63SDidZ4oBm4GzGora8
	v9HpN0pDpnOgO+9kY/StHaSx+AVC5pxUyO4+U40OdJbyJwP0d0v/3WLu6XD3c9zpcdwp
	W8aYYi0aEdvA7YenO0h5MrlkyjJYJRMsILZX9HrrQES5x6NYO/3uTMVdcCBkC5aiQxvP
	nggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tm0rSsnSbQTmRn7SXTyQtg5aZloK3O+A5aLLhZi8Dyw=;
	b=Wupdv5UBvMSh7HwniQ2EFJ2NB7X4fUEKsEdBXbN5buVC40kGfoDWzb8+r4fj4yENCS
	esLXRexdZ3808sBjTeIwR5rmo9JpbthOSvtSwLYYhH5avpTLmKUNXUsXe1fPO8DvRNIM
	w5JqoI4WKi7Uf1puBmXbLDsX1B0PDLYCWCby+imX99wIrRMzB0vWDlHMYGwPKp1kycIT
	4SDxlQbW62sbEwmtgoSm8qmeUUCG/w1jzmalMSazHy8Qi7vZW5qUreED8wPpqti+FpIn
	AKYRd2Kt6fdIEkZkHOWPNHggECzax2CEPfgmL48qe+AMOf4WfYCi0q2nvbeLCy660QxM
	GRQw==
X-Gm-Message-State: APjAAAX5Pfb8jhMbEixPmWQLGT1bvBO8Jcq03Ei3+n9kNIb8QxhKJw79
	Sa8Xw18rUn5YQo7GNbjmKlcMbxqSK5HIPjbyGps=
X-Google-Smtp-Source: APXvYqws5W0wdsAcwoKRTYSJiKbr6V5EZc8wjaCjGtLh2ID148PhspwitJJnN6IjRNULGrpXxYauKzhfuuQGYnU0Tb8=
X-Received: by 2002:a2e:6596:: with SMTP id e22mr5787386ljf.87.1567540414962; 
	Tue, 03 Sep 2019 12:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190830054627.18366-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190830054627.18366-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 15:53:23 -0400
Message-ID: <CADkTA4MCbiYH-C2ZDLRtxHmtQZqvLCDGvOZ=3iPDQazi0_OyAA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-happybase: Add python3 version
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
X-List-Received-Date: Tue, 03 Sep 2019 19:53:38 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Aug 30, 2019 at 1:50 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-happybase.inc     | 18 ++++++++++++++++++
>  .../python/python-happybase_1.2.0.bb                 | 20 ++------------------
>  .../python/python3-happybase_1.2.0.bb                |  2 ++
>  3 files changed, 22 insertions(+), 18 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-happybase.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-happybase.inc b/meta-openstack/recipes-devtools/python/python-happybase.inc
> new file mode 100644
> index 0000000..325b2d1
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-happybase.inc
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Python library to interact with Apache HBase"
> +HOMEPAGE = "https://pypi.python.org/pypi/happybase/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
> +
> +SRC_URI[md5sum] = "96cb7ea8163f531907fabd0dddc8b87e"
> +SRC_URI[sha256sum] = "850b4ee651128588a57e1e152dd1252e5ec39776a5d3d14ee892b8bac0fa9e1a"
> +
> +inherit pypi
> +
> +do_install_append() {
> +       perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt")
> +       perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
> +       for f in $perm_files; do
> +               chmod 644 "${f}"
> +       done
> +}
> diff --git a/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb b/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
> index a8066b6..26e39a8 100644
> --- a/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-happybase_1.2.0.bb
> @@ -1,18 +1,2 @@
> -DESCRIPTION = "Python library to interact with Apache HBase"
> -HOMEPAGE = "https://pypi.python.org/pypi/happybase/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
> -
> -SRC_URI[md5sum] = "96cb7ea8163f531907fabd0dddc8b87e"
> -SRC_URI[sha256sum] = "850b4ee651128588a57e1e152dd1252e5ec39776a5d3d14ee892b8bac0fa9e1a"
> -
> -inherit setuptools pypi
> -
> -do_install_append() {
> -       perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt")
> -       perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
> -       for f in $perm_files; do
> -               chmod 644 "${f}"
> -       done
> -}
> +inherit setuptools
> +require python-happybase.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb b/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
> new file mode 100644
> index 0000000..8b5571b
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-happybase_1.2.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-happybase.inc
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

