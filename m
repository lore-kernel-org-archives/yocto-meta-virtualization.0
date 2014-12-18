Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F3F0E00930; Thu, 18 Dec 2014 07:02:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73821E00837
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Dec 2014 07:02:32 -0800 (PST)
Received: by mail-la0-f43.google.com with SMTP id s18so1153030lam.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Dec 2014 07:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LQGj/J7/1eoUjjvv+6vl9cIfiYhvuCs0yyrVazAWz1Y=;
	b=In4j1jyQNC/wIJ6tcQTfdILQzeD6iaJqe7cSheS9pkEHmv/O6Wl/i/J8e9tsR1ZGMi
	WUZLsV046fhflnm4nqQQpJBXdQumPUUpPKzdIEBFhpIDFont2B3C8yUo7W/1hD1TPUHx
	b0H5B+9kgMxQdhNMTiRb/srqSZPKxgozxSh64BpPrOWzTmHfvx15jwqd2+9flYyyBeEg
	lmBeNlAuYijMqSp2f+0TA74oqQbyTdVoXINM9T/8vbC1nXWUlDYLKnffHiXhwT//ZCuF
	q9My+aztHeN4T0YCQzpDqt5MPpYCEJhNKy7an5u4Mo+7+cioDVmf71cKjrOvbt28S1wc
	Akqg==
MIME-Version: 1.0
X-Received: by 10.112.167.228 with SMTP id zr4mr2792163lbb.20.1418914950777;
	Thu, 18 Dec 2014 07:02:30 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 18 Dec 2014 07:02:30 -0800 (PST)
In-Reply-To: <1418905372-9361-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418905372-9361-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 18 Dec 2014 10:02:30 -0500
Message-ID: <CADkTA4PL1+_E+XEhtuBRgCm2FXeVf6JXo7aWa5e2ZMFJKgQbYg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python: remove modules moved to meta-python
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
X-List-Received-Date: Thu, 18 Dec 2014 15:02:43 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 18, 2014 at 7:22 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * apply only after
>   http://lists.openembedded.org/pipermail/openembedded-devel/2014-December/099382.html
>   is merged in meta-python
> * only small changes were applied (as they were in meta-webos)
>   DESCRIPTION -> SUMMARY
>   drop PR = r0
>   4 space indentation

Thanks, but as I've mentioned to everyone, these are incredibly
version sensitive. So
I won't be moving the patches out of meta-openstack.

I'm actually in favour of grouping supporting packages, versus
grouping them by type.

Cheers,

Bruce

>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-devtools/python/python-cmd2_0.6.7.bb   | 19 -----------------
>  .../recipes-devtools/python/python-mccabe_0.2.1.bb | 21 -------------------
>  .../recipes-devtools/python/python-mock_1.0.1.bb   | 24 ----------------------
>  .../recipes-devtools/python/python-pep8_1.4.6.bb   | 21 -------------------
>  .../python/python-prettytable_0.7.2.bb             | 24 ----------------------
>  .../python/python-pyflakes_0.7.3.bb                | 21 -------------------
>  .../python/python-pyparsing_2.0.1.bb               | 17 ---------------
>  7 files changed, 147 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-cmd2_0.6.7.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pep8_1.4.6.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.7.bb b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.7.bb
> deleted file mode 100644
> index 9558cc6..0000000
> --- a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.7.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "Extra features for standard library's cmd module"
> -HOMEPAGE = "http://packages.python.org/cmd2/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
> -
> -PR = "r0"
> -SRCNAME = "cmd2"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "842df29ff2f72d64d7f0d917039c0e51"
> -SRC_URI[sha256sum] = "8e98c7a1cfd106183559240b269e7cd9fe97e8342b5c05295f591aab6fd2f4f0"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} += "python-pyparsing"
> diff --git a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> deleted file mode 100644
> index 30c47e8..0000000
> --- a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "McCabe checker, plugin for flake8"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
> -
> -PR = "r0"
> -SRCNAME = "mccabe"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
> -SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} += "python-prettytable \
> -            python-cmd2 \
> -            python-pyparsing"
> \ No newline at end of file
> diff --git a/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
> deleted file mode 100644
> index b17b3f0..0000000
> --- a/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION = "A Python Mocking and Patching Library for Testing"
> -HOMEPAGE = "https://pypi.python.org/pypi/mock"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e5ba73891255687dff3bee2b4cbb16"
> -
> -PR = "r0"
> -SRCNAME = "mock"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "c3971991738caa55ec7c356bbc154ee2"
> -SRC_URI[sha256sum] = "b839dd2d9c117c701430c149956918a423a9863b48b09c90e30a6013e7d2f44f"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} += "python-prettytable \
> -            python-cmd2 \
> -            python-pyparsing \
> -            python-mccabe \
> -            python-pep8 \
> -            python-pyflakes"
> diff --git a/meta-openstack/recipes-devtools/python/python-pep8_1.4.6.bb b/meta-openstack/recipes-devtools/python/python-pep8_1.4.6.bb
> deleted file mode 100644
> index 723bec3..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pep8_1.4.6.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "Python style guide checker"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=b0d37793ab91ca25ad5c200e9ea22331"
> -
> -PR = "r0"
> -SRCNAME = "pep8"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
> -SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} += "python-prettytable \
> -            python-cmd2 \
> -            python-pyparsing"
> \ No newline at end of file
> diff --git a/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> deleted file mode 100644
> index 5242bfc..0000000
> --- a/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION = "Python library for displaying tabular data in a ASCII table format"
> -HOMEPAGE = "http://code.google.com/p/prettytable"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
> -
> -PR = "r0"
> -SRCNAME = "prettytable"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/P/PrettyTable/prettytable-0.7.2.zip"
> -
> -SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
> -SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -do_install_append() {
> -       perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
> -       for f in $perm_files; do
> -               chmod 644 "${f}"
> -       done
> -}
> \ No newline at end of file
> diff --git a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb b/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> deleted file mode 100644
> index af7a7f3..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "passive checker of Python programs"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=1815018ebbbfc8659a9df33681a0936e"
> -
> -PR = "r0"
> -SRCNAME = "pyflakes"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "ec94ac11cb110e6e72cca23c104b66b1"
> -SRC_URI[sha256sum] = "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b66aa624097d9b5e3"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} += "python-prettytable \
> -            python-cmd2 \
> -            python-pyparsing"
> \ No newline at end of file
> diff --git a/meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb b/meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb
> deleted file mode 100644
> index 32d9ebb..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "Python parsing module"
> -HOMEPAGE = "http://pyparsing.wikispaces.com/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
> -
> -PR = "r0"
> -SRCNAME = "pyparsing"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.zip"
> -
> -SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
> -SRC_URI[sha256sum] = "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit distutils
> --
> 2.2.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

