Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AFF7E00CA6; Tue,  8 Sep 2015 07:04:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.178 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82F69E00B5A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:04:23 -0700 (PDT)
Received: by ykdu9 with SMTP id u9so44238631ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SNNwinJ5/uewC1DC0gGXG4/jnlNcLVwZnKGoXNEanZw=;
	b=aBHnI2wkb47LxKeoTUkMMMXBz9khF4NRDV1II0zQIW0g5JYMzGlSfm/3u3qJDCCJRl
	VwYalqpcYxSQH/k9/gWvccXS+pBi+2MyRXX1FOVKcg0YKsLcBCUrumYsKJT4K4Hkm+tT
	Q6aFWmPCNwxCul6QHXWGxy2dLqbAvXdztIW4nd747XKo4lhpl8eNo4BfPhA/tzBss0tE
	TFJi3HNX+Ugm0b6JtuYLsNhcOg21qB+GX2gHVe83ZMJTQAQqfu01zSFMN8EL+wt8OaBK
	3t2FRfG12uCl4TW0nnW5bOkqClC8ax/YTBP19Uy4ctiLRVX699SxyPMI/bNfM5xQp3Li
	PdcA==
MIME-Version: 1.0
X-Received: by 10.13.193.67 with SMTP id c64mr28454065ywd.68.1441721062556;
	Tue, 08 Sep 2015 07:04:22 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:04:22 -0700 (PDT)
In-Reply-To: <1441603797-10160-1-git-send-email-jianchuan.wang@windriver.com>
References: <1441603797-10160-1-git-send-email-jianchuan.wang@windriver.com>
Date: Tue, 8 Sep 2015 10:04:22 -0400
Message-ID: <CADkTA4NNLEq9rqQGjM3+QZ-mBqWuC=mjOGc0ZOuvVrw0VVjm+Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jianchuan.wang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] protobuf: upgrade 2.5.0 -> 2.6.1
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
X-List-Received-Date: Tue, 08 Sep 2015 14:04:25 -0000
Content-Type: text/plain; charset=UTF-8

All three patches from this series have been merged.

Bruce

On Mon, Sep 7, 2015 at 1:29 AM,  <jianchuan.wang@windriver.com> wrote:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  .../files/Omit-google-apputils-dependency.patch    | 25 ++++++
>  recipes-containers/criu/protobuf-native_2.5.0.bb   | 21 -----
>  recipes-containers/criu/protobuf-native_2.6.1.bb   | 21 +++++
>  recipes-containers/criu/protobuf_2.5.0.bb          | 96 ---------------------
>  recipes-containers/criu/protobuf_2.6.1.bb          | 97 ++++++++++++++++++++++
>  5 files changed, 143 insertions(+), 117 deletions(-)
>  create mode 100644 recipes-containers/criu/files/Omit-google-apputils-dependency.patch
>  delete mode 100644 recipes-containers/criu/protobuf-native_2.5.0.bb
>  create mode 100644 recipes-containers/criu/protobuf-native_2.6.1.bb
>  delete mode 100644 recipes-containers/criu/protobuf_2.5.0.bb
>  create mode 100644 recipes-containers/criu/protobuf_2.6.1.bb
>
> diff --git a/recipes-containers/criu/files/Omit-google-apputils-dependency.patch b/recipes-containers/criu/files/Omit-google-apputils-dependency.patch
> new file mode 100644
> index 0000000..ef60fc0
> --- /dev/null
> +++ b/recipes-containers/criu/files/Omit-google-apputils-dependency.patch
> @@ -0,0 +1,25 @@
> +From f8b7c90f6da90b67bdd7d5301894c5c28bd9d076 Mon Sep 17 00:00:00 2001
> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
> +Date: Mon, 10 Aug 2015 11:23:31 +0800
> +Subject: [PATCH] Omit google-apputils dependency
> +
> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> +---
> + python/setup.py | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/python/setup.py b/python/setup.py
> +index 2450a77..6f6bffb 100755
> +--- a/python/setup.py
> ++++ b/python/setup.py
> +@@ -189,7 +189,6 @@ if __name__ == '__main__':
> +           'google.protobuf.text_format'],
> +         cmdclass = { 'clean': clean, 'build_py': build_py },
> +         install_requires = ['setuptools'],
> +-        setup_requires = ['google-apputils'],
> +         ext_modules = ext_module_list,
> +         url = 'https://developers.google.com/protocol-buffers/',
> +         maintainer = maintainer_email,
> +--
> +1.9.1
> +
> diff --git a/recipes-containers/criu/protobuf-native_2.5.0.bb b/recipes-containers/criu/protobuf-native_2.5.0.bb
> deleted file mode 100644
> index b3f00dd..0000000
> --- a/recipes-containers/criu/protobuf-native_2.5.0.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY = "protobuf"
> -DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> -an efficient yet extensible format. Google uses Protocol Buffers for \
> -almost all of its internal RPC protocols and file formats."
> -HOMEPAGE = "http://code.google.com/p/protobuf/"
> -SECTION = "console/tools"
> -LICENSE = "BSD-3-Clause"
> -
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
> -
> -PR = "r0"
> -
> -SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
> -SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
> -SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
> -       "
> -
> -EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> -
> -inherit native autotools
> -
> diff --git a/recipes-containers/criu/protobuf-native_2.6.1.bb b/recipes-containers/criu/protobuf-native_2.6.1.bb
> new file mode 100644
> index 0000000..e88c9e7
> --- /dev/null
> +++ b/recipes-containers/criu/protobuf-native_2.6.1.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "protobuf"
> +DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> +an efficient yet extensible format. Google uses Protocol Buffers for \
> +almost all of its internal RPC protocols and file formats."
> +HOMEPAGE = "http://code.google.com/p/protobuf/"
> +SECTION = "console/tools"
> +LICENSE = "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
> +
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "af05b2cca289f7b86eef2734a0cdc8b9"
> +SRC_URI[sha256sum] = "2667b7cda4a6bc8a09e5463adf3b5984e08d94e72338277affa8594d8b6e5cd1"
> +SRC_URI = "https://github.com/google/protobuf/archive/v2.6.1.tar.gz;downloadfilename=protobuf-2.6.1.tar.gz \
> +       "
> +
> +EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> +
> +inherit native autotools
> +
> diff --git a/recipes-containers/criu/protobuf_2.5.0.bb b/recipes-containers/criu/protobuf_2.5.0.bb
> deleted file mode 100644
> index b19e906..0000000
> --- a/recipes-containers/criu/protobuf_2.5.0.bb
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -SUMMARY = "protobuf"
> -DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> -an efficient yet extensible format. Google uses Protocol Buffers for \
> -almost all of its internal RPC protocols and file formats."
> -HOMEPAGE = "http://code.google.com/p/protobuf/"
> -SECTION = "console/tools"
> -LICENSE = "BSD-3-Clause"
> -
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
> -
> -PR = "r0"
> -EXCLUDE_FROM_WORLD = "1"
> -
> -SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
> -SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98bdcb7cedb5b91d3b5bdcf29c98c293f58e"
> -SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
> -       file://protobuf-allow-running-python-scripts-from-anywhere.patch \
> -       file://run-ptest"
> -
> -COMPATIBLE_HOST = "(x86_64|arm).*-linux"
> -
> -EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
> -inherit autotools setuptools ptest
> -
> -DEPENDS += "protobuf-native"
> -
> -PYTHON_SRC_DIR="python"
> -TEST_SRC_DIR="examples"
> -LANG_SUPPORT="cpp python"
> -
> -do_compile() {
> -       # Compile protoc compiler
> -       base_do_compile
> -}
> -
> -do_compile_ptest() {
> -       # Modify makefile to use the cross-compiler
> -       sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
> -
> -       mkdir -p "${B}/${TEST_SRC_DIR}"
> -
> -       # Add the location of the cross-compiled header and library files
> -       # which haven't been installed yet.
> -       cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
> -       sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> -       sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> -       sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> -       export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
> -
> -       # Save the pkgcfg sysroot variable, and update it to nothing so
> -       # that it doesn't append the sysroot to the beginning of paths.
> -       # The header and library files aren't installed to the target
> -       # system yet.  So the absolute paths were specified above.
> -       save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
> -       export PKG_CONFIG_SYSROOT_DIR=
> -
> -       # Compile the tests
> -       for lang in ${LANG_SUPPORT}; do
> -               oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
> -       done
> -
> -       # Restore the pkgconfig sysroot variable
> -       export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
> -}
> -
> -do_install() {
> -       local olddir=`pwd`
> -
> -       # Install protoc compiler
> -       autotools_do_install
> -
> -       # Install header files
> -       export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
> -       cd "${S}/${PYTHON_SRC_DIR}"
> -       distutils_do_install
> -
> -       cd "$olddir"
> -}
> -
> -do_install_ptest() {
> -       local olddir=`pwd`
> -
> -       cd "${S}/${TEST_SRC_DIR}"
> -       install -d "${D}/${PTEST_PATH}"
> -       for i in add_person* list_people*; do
> -               if [ -x "$i" ]; then
> -                       install "$i" "${D}/${PTEST_PATH}"
> -               fi
> -       done
> -       cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
> -
> -       cd "$olddir"
> -}
> -
> -BBCLASSEXTEND = "nativesdk"
> -
> diff --git a/recipes-containers/criu/protobuf_2.6.1.bb b/recipes-containers/criu/protobuf_2.6.1.bb
> new file mode 100644
> index 0000000..1b7ab20
> --- /dev/null
> +++ b/recipes-containers/criu/protobuf_2.6.1.bb
> @@ -0,0 +1,97 @@
> +SUMMARY = "protobuf"
> +DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> +an efficient yet extensible format. Google uses Protocol Buffers for \
> +almost all of its internal RPC protocols and file formats."
> +HOMEPAGE = "http://code.google.com/p/protobuf/"
> +SECTION = "console/tools"
> +LICENSE = "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
> +
> +PR = "r0"
> +EXCLUDE_FROM_WORLD = "1"
> +
> +SRC_URI[md5sum] = "af05b2cca289f7b86eef2734a0cdc8b9"
> +SRC_URI[sha256sum] = "2667b7cda4a6bc8a09e5463adf3b5984e08d94e72338277affa8594d8b6e5cd1"
> +SRC_URI = "https://github.com/google/protobuf/archive/v2.6.1.tar.gz;downloadfilename=protobuf-2.6.1.tar.gz\
> +       file://protobuf-allow-running-python-scripts-from-anywhere.patch \
> +       file://Omit-google-apputils-dependency.patch \
> +       file://run-ptest"
> +
> +COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> +
> +EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
> +inherit autotools setuptools ptest
> +
> +DEPENDS += "protobuf-native"
> +
> +PYTHON_SRC_DIR="python"
> +TEST_SRC_DIR="examples"
> +LANG_SUPPORT="cpp python"
> +
> +do_compile() {
> +       # Compile protoc compiler
> +       base_do_compile
> +}
> +
> +do_compile_ptest() {
> +       # Modify makefile to use the cross-compiler
> +       sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
> +
> +       mkdir -p "${B}/${TEST_SRC_DIR}"
> +
> +       # Add the location of the cross-compiled header and library files
> +       # which haven't been installed yet.
> +       cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +       export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
> +
> +       # Save the pkgcfg sysroot variable, and update it to nothing so
> +       # that it doesn't append the sysroot to the beginning of paths.
> +       # The header and library files aren't installed to the target
> +       # system yet.  So the absolute paths were specified above.
> +       save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
> +       export PKG_CONFIG_SYSROOT_DIR=
> +
> +       # Compile the tests
> +       for lang in ${LANG_SUPPORT}; do
> +               oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
> +       done
> +
> +       # Restore the pkgconfig sysroot variable
> +       export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
> +}
> +
> +do_install() {
> +       local olddir=`pwd`
> +
> +       # Install protoc compiler
> +       autotools_do_install
> +
> +       # Install header files
> +       export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
> +       cd "${S}/${PYTHON_SRC_DIR}"
> +       distutils_do_install
> +
> +       cd "$olddir"
> +}
> +
> +do_install_ptest() {
> +       local olddir=`pwd`
> +
> +       cd "${S}/${TEST_SRC_DIR}"
> +       install -d "${D}/${PTEST_PATH}"
> +       for i in add_person* list_people*; do
> +               if [ -x "$i" ]; then
> +                       install "$i" "${D}/${PTEST_PATH}"
> +               fi
> +       done
> +       cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
> +
> +       cd "$olddir"
> +}
> +
> +BBCLASSEXTEND = "nativesdk"
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

