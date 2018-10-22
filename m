Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B610AE00B9D; Mon, 22 Oct 2018 01:41:28 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82B6DE00872
	for <meta-virtualization@yoctoproject.org>;
	Mon, 22 Oct 2018 01:41:27 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id x3-v6so36142109lji.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 22 Oct 2018 01:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8jZyn10clK5lrQFwWBcpxU52/zbkS5zJPNcfLJJKbOg=;
	b=uRorj99QnLn2z2C4ZHc3yR9yAekFTYVR4rFyeacmlYKO10U5PZD+Cs1yxEGdPMGBs6
	8xNqdiv6Od0X7MiY6Wc5VwpCru9hg/6iuKOjrPWTFyIbGGoX3V2o5/+uljSnkOdWN2sl
	Rx2TqXxiH65LcCAIznLHGQnlUGXqHVP41YkOCd+0gDEWEohuTBW7cwLpLdz0mY++4kBe
	oYUJGH636peWs4VkbZcjL9iWHOgGJvibxy+RbPmzVqtjcNFMcaaqkptuwrrpqfndOByV
	xCPD0hGpAKWMkZiE7G6TWe2rgRD4Tce7ElhN99hvRTQoSQJ6MU89nX4I0xX+ZJDocs2d
	W4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8jZyn10clK5lrQFwWBcpxU52/zbkS5zJPNcfLJJKbOg=;
	b=RhbOBHpI+sIoW8XCEpGIGXHXsR3T5k95IMmrih+QYDfUVbQlcuZwhtekQkRK2mRPib
	4NswiaZbTLyCQe42OPNYQ2ftUpNasBJO0q5Wmku9ed0LKmHVHlik8CkWNJ+/tdxGNrzv
	mZY09ZGr+RIfgBZLGQ3JQMRcbyxdF758pwo5Lf9C/nNnhayFHIyYoy5IqsEXPQ2C9a2G
	U4c6lwesIU7+Mw76025fNgf7EDFF1ll8pd0t4v79p2WL8f0dRzGwVARhDic3t99XSnfH
	KEiG4Y4V1kJzc5f/TU4OkxE2q1UK1GR6AdqC5iDBo7PUsWvqZU1mzEbeap6RqR4ir8Ha
	oAig==
X-Gm-Message-State: AGRZ1gKApoZXi72sOldCouBpcYRwQ66r9k8hQsezxZ9mPB/Y1ym0eD+w
	5yp5NbsYmyqYPLErpqhHH626KI68n/p2ah+a3QSEgY3C
X-Google-Smtp-Source: AJdET5dCBof1AtMzv+MXiURwyjjFbXmhzTrl1wITZtUcrELpjk/gr2HxvskhWOgXHpZOQsAVHhrh2BapTQSjL6shyjg=
X-Received: by 2002:a2e:501c:: with SMTP id
	e28-v6mr10594147ljb.45.1540197686262; 
	Mon, 22 Oct 2018 01:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <1539941281-29043-1-git-send-email-maciej.pijanowski@3mdeb.com>
In-Reply-To: <1539941281-29043-1-git-send-email-maciej.pijanowski@3mdeb.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Oct 2018 04:41:15 -0400
Message-ID: <CADkTA4P2NfBsgN679jKBMCox+g=kcvob6ws1XK0_PmHWuNw72Q@mail.gmail.com>
To: maciej.pijanowski@3mdeb.com
Cc: meta-virtualization@yoctoproject.org, piotr.krol@3mdeb.com
Subject: Re: [PATCH] xen: fix building with BASELIB=lib64
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
X-List-Received-Date: Mon, 22 Oct 2018 08:41:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Fri, Oct 19, 2018 at 6:07 AM Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
> Many "real" (other then genericx86-64) x86-64 target machine configurations
> set BASELIB to lib64. For example the intel-corei7-64 or the AMD
> machines.
>
> In such case packaging xen-python fails because items are
> installed to /usr/lib/, but FILES_xen-python points to package
> /usr/lib64/ items. Exposing the DISTUTILS variables from OE build makes
> the python installation somewhat similar to what happens in the distutils
> class and python items are installed to the /usr/lib64 as expected.
>
> Another issue was that the xen-efi package was picking up too much stuff
> from the /usr/lib64 path on such machines. Being more explicit at least
> allows to package things correctly.
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  ...ub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch | 63 ++++++++++++++++++++++
>  recipes-extended/xen/xen.inc                       |  9 ++--
>  recipes-extended/xen/xen_4.11.0.bb                 |  1 +
>  recipes-extended/xen/xen_git.bb                    |  1 +
>  4 files changed, 70 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch
>
> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch
> new file mode 100644
> index 000000000000..03c39fe7525b
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch
> @@ -0,0 +1,63 @@
> +From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 2001
> +From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> +Date: Fri, 19 Oct 2018 11:01:37 +0200
> +Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py args
> +
> +Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
> +as well as other parameters set by the OpenEmbedded build system.
> +This is especially useful when the target libdir is not the default one
> +(/usr/lib), but for example /usr/lib64.
> +
> +Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> +---
> + tools/pygrub/Makefile | 5 +++--
> + tools/python/Makefile | 4 ++--
> + 2 files changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> +index 536af07932b4..e1c773101412 100644
> +--- a/tools/pygrub/Makefile
> ++++ b/tools/pygrub/Makefile
> +@@ -10,14 +10,15 @@ INSTALL_LOG = build/installed_files.txt
> + all: build
> + .PHONY: build
> + build:
> +-      CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build
> ++      CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
> +
> + .PHONY: install
> + install: all
> +       $(INSTALL_DIR) $(DESTDIR)/$(bindir)
> +       CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
> +               setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> +-               --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
> ++               --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force \
> ++               $(DISTUTILS_INSTALL_ARGS)
> +       set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
> +                    "`readlink -f $(DESTDIR)/$(bindir)`" != \
> +                    "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> +diff --git a/tools/python/Makefile b/tools/python/Makefile
> +index 541858e2f886..4d4a344f1d33 100644
> +--- a/tools/python/Makefile
> ++++ b/tools/python/Makefile
> +@@ -10,7 +10,7 @@ INSTALL_LOG = build/installed_files.txt
> +
> + .PHONY: build
> + build:
> +-      CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build
> ++      CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
> +
> + .PHONY: install
> + install:
> +@@ -18,7 +18,7 @@ install:
> +
> +       CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
> +               setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> +-              --root="$(DESTDIR)" --force
> ++              --root="$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
> +
> +       $(INSTALL_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
> +       $(INSTALL_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 7efc8df14ada..265041385ba9 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -402,8 +402,7 @@ FILES_${PN}-hypervisor = "\
>  FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
>
>  FILES_${PN}-efi = "\
> -    ${exec_prefix}/lib64 \
> -    ${exec_prefix}/lib64/xen* \
> +    ${exec_prefix}/lib64/efi/xen* \
>      "
>
>  FILES_${PN}-base = "\
> @@ -826,6 +825,8 @@ export XEN_OS = "Linux"
>  # this is used for the header (#!${bindir}/python) of the install python scripts
>  export PYTHONPATH="${bindir}/python"
>  export ac_cv_path_PYTHONPATH="${bindir}/python"
> +export DISTUTILS_BUILD_ARGS
> +export DISTUTILS_INSTALL_ARGS
>
>  # xen and seabios require HOSTCC and HOSTCXX set to cross-compile
>  export HOSTCC="${BUILD_CC}"
> @@ -849,8 +850,8 @@ CPP_append = " ${CPPFLAGS}"
>  CXX_append = " ${CXXFLAGS}"
>
>  EXTRA_OECONF += " \
> -    --exec-prefix=/usr \
> -    --prefix=/usr \
> +    --exec-prefix=${prefix} \
> +    --prefix=${prefix} \
>      --host=${HOST_SYS} \
>      --with-systemd=${systemd_unitdir}/system \
>      --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
> diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xen_4.11.0.bb
> index b27506677471..870caa72373e 100644
> --- a/recipes-extended/xen/xen_4.11.0.bb
> +++ b/recipes-extended/xen/xen_4.11.0.bb
> @@ -7,6 +7,7 @@ SRC_URI = " \
>      file://xen-4.11-arm-acpi-fix-string-lengths.patch \
>      file://xen-tools-xenpmd-snprintf.patch \
>      file://xen-disable-sse-before-inlines.patch \
> +    file://0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch \
>      "
>
>  SRC_URI[md5sum] = "cbec0600284921744bc14119f4ed3fff"
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index 81ee1002c69f..0ebd81ce4a7f 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -13,6 +13,7 @@ S = "${WORKDIR}/git"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://xen-disable-sse-before-inlines.patch \
> +    file://0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch \
>      "
>
>  DEFAULT_PREFERENCE = "-1"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

