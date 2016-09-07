Return-Path: <venkat.mandela@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13BD3E00FFC; Wed,  7 Sep 2016 02:43:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CC80E00E39
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 02:43:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u879hOmR010995;
	Wed, 7 Sep 2016 04:43:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u879hNE6022300;
	Wed, 7 Sep 2016 04:43:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 7 Sep 2016 04:43:22 -0500
Received: from [172.24.145.235] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u879hKoT006483;
	Wed, 7 Sep 2016 04:43:21 -0500
References: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
To: <jianchuan.wang@windriver.com>, <meta-virtualization@yoctoproject.org>
From: "Mandela, Venkateswara Rao" <venkat.mandela@ti.com>
Organization: Texas Instruments
Message-ID: <02515455-43d0-6487-78e2-c54522c9ca33@ti.com>
Date: Wed, 7 Sep 2016 15:13:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:49.0) Gecko/20100101
	Thunderbird/49.0
MIME-Version: 1.0
In-Reply-To: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
Subject: Re: [PATCH 1/3] protobuf: uprev 3.0.0 from 2.6.1
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: venkat.mandela@ti.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2016 09:43:31 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi,

I was unable to apply this patch on top the latest master. This patch appears to be based on older revisions where protobuf and protobuf-c recipes were still in recipes-containes/criu. Currently the recipes are in recipes-devtools/protobuf. Could you please rebase and resend the patches?

regards,
Venkat

On Wednesday 07 September 2016 01:39 PM, jianchuan.wang@windriver.com wrote:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  .../criu/protobuf-native_2.6.1.bb                  | 21 -----
>  .../criu/protobuf-native_3.0.0.bb                  | 21 +++++
>  .../recipes-containers/criu/protobuf_2.6.1.bb      | 97 ----------------------
>  .../recipes-containers/criu/protobuf_3.0.0.bb      | 97 ++++++++++++++++++++++
>  4 files changed, 118 insertions(+), 118 deletions(-)
>  delete mode 100644 meta-virtualization/recipes-containers/criu/protobuf-native_2.6.1.bb
>  create mode 100644 meta-virtualization/recipes-containers/criu/protobuf-native_3.0.0.bb
>  delete mode 100644 meta-virtualization/recipes-containers/criu/protobuf_2.6.1.bb
>  create mode 100644 meta-virtualization/recipes-containers/criu/protobuf_3.0.0.bb
>
> diff --git a/meta-virtualization/recipes-containers/criu/protobuf-native_2.6.1.bb b/meta-virtualization/recipes-containers/criu/protobuf-native_2.6.1.bb
> deleted file mode 100644
> index e88c9e7..0000000
> --- a/meta-virtualization/recipes-containers/criu/protobuf-native_2.6.1.bb
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
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
> -
> -PR = "r0"
> -
> -SRC_URI[md5sum] = "af05b2cca289f7b86eef2734a0cdc8b9"
> -SRC_URI[sha256sum] = "2667b7cda4a6bc8a09e5463adf3b5984e08d94e72338277affa8594d8b6e5cd1"
> -SRC_URI = "https://github.com/google/protobuf/archive/v2.6.1.tar.gz;downloadfilename=protobuf-2.6.1.tar.gz \
> -	"
> -
> -EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> -
> -inherit native autotools
> -
> diff --git a/meta-virtualization/recipes-containers/criu/protobuf-native_3.0.0.bb b/meta-virtualization/recipes-containers/criu/protobuf-native_3.0.0.bb
> new file mode 100644
> index 0000000..33467b3
> --- /dev/null
> +++ b/meta-virtualization/recipes-containers/criu/protobuf-native_3.0.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "protobuf"
> +DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> +an efficient yet extensible format. Google uses Protocol Buffers for \
> +almost all of its internal RPC protocols and file formats."
> +HOMEPAGE = "http://code.google.com/p/protobuf/"
> +SECTION = "console/tools"
> +LICENSE = "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
> +
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
> +SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146"
> +SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.gz;downloadfilename=protobuf-3.0.0.tar.gz \
> +	"
> +
> +EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> +
> +inherit native autotools
> +
> diff --git a/meta-virtualization/recipes-containers/criu/protobuf_2.6.1.bb b/meta-virtualization/recipes-containers/criu/protobuf_2.6.1.bb
> deleted file mode 100644
> index 1b7ab20..0000000
> --- a/meta-virtualization/recipes-containers/criu/protobuf_2.6.1.bb
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -SUMMARY = "protobuf"
> -DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> -an efficient yet extensible format. Google uses Protocol Buffers for \
> -almost all of its internal RPC protocols and file formats."
> -HOMEPAGE = "http://code.google.com/p/protobuf/"
> -SECTION = "console/tools"
> -LICENSE = "BSD-3-Clause"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
> -
> -PR = "r0"
> -EXCLUDE_FROM_WORLD = "1"
> -
> -SRC_URI[md5sum] = "af05b2cca289f7b86eef2734a0cdc8b9"
> -SRC_URI[sha256sum] = "2667b7cda4a6bc8a09e5463adf3b5984e08d94e72338277affa8594d8b6e5cd1"
> -SRC_URI = "https://github.com/google/protobuf/archive/v2.6.1.tar.gz;downloadfilename=protobuf-2.6.1.tar.gz\
> -	file://protobuf-allow-running-python-scripts-from-anywhere.patch \
> -	file://Omit-google-apputils-dependency.patch \
> -	file://run-ptest"
> -
> -COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
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
> -	# Compile protoc compiler
> -	base_do_compile
> -}
> -
> -do_compile_ptest() {
> -	# Modify makefile to use the cross-compiler
> -	sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
> -
> -	mkdir -p "${B}/${TEST_SRC_DIR}"
> -
> -	# Add the location of the cross-compiled header and library files
> -	# which haven't been installed yet.
> -	cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
> -	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> -	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> -	sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> -	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
> -
> -	# Save the pkgcfg sysroot variable, and update it to nothing so
> -	# that it doesn't append the sysroot to the beginning of paths.
> -	# The header and library files aren't installed to the target
> -	# system yet.  So the absolute paths were specified above.
> -	save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
> -	export PKG_CONFIG_SYSROOT_DIR=
> -
> -	# Compile the tests
> -	for lang in ${LANG_SUPPORT}; do
> -		oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
> -	done
> -
> -	# Restore the pkgconfig sysroot variable
> -	export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
> -}
> -
> -do_install() {
> -	local olddir=`pwd`
> -
> -	# Install protoc compiler
> -	autotools_do_install
> -
> -	# Install header files
> -	export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
> -	cd "${S}/${PYTHON_SRC_DIR}"
> -	distutils_do_install
> -
> -	cd "$olddir"
> -}
> -
> -do_install_ptest() {
> -	local olddir=`pwd`
> -
> -	cd "${S}/${TEST_SRC_DIR}"
> -	install -d "${D}/${PTEST_PATH}"
> -	for i in add_person* list_people*; do
> -		if [ -x "$i" ]; then
> -			install "$i" "${D}/${PTEST_PATH}"
> -		fi
> -	done
> -	cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
> -	
> -	cd "$olddir"
> -}
> -
> -BBCLASSEXTEND = "nativesdk"
> -
> diff --git a/meta-virtualization/recipes-containers/criu/protobuf_3.0.0.bb b/meta-virtualization/recipes-containers/criu/protobuf_3.0.0.bb
> new file mode 100644
> index 0000000..e1deeac
> --- /dev/null
> +++ b/meta-virtualization/recipes-containers/criu/protobuf_3.0.0.bb
> @@ -0,0 +1,97 @@
> +SUMMARY = "protobuf"
> +DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> +an efficient yet extensible format. Google uses Protocol Buffers for \
> +almost all of its internal RPC protocols and file formats."
> +HOMEPAGE = "http://code.google.com/p/protobuf/"
> +SECTION = "console/tools"
> +LICENSE = "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
> +
> +PR = "r0"
> +EXCLUDE_FROM_WORLD = "1"
> +
> +SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
> +SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146"
> +SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.gz;downloadfilename=protobuf-3.0.0.tar.gz\
> +	        file://protobuf-allow-running-python-scripts-from-anywhere.patch \
> +	        file://run-ptest \
> +            "
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
> +	# Compile protoc compiler
> +	base_do_compile
> +}
> +
> +do_compile_ptest() {
> +	# Modify makefile to use the cross-compiler
> +	sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
> +
> +	mkdir -p "${B}/${TEST_SRC_DIR}"
> +
> +	# Add the location of the cross-compiled header and library files
> +	# which haven't been installed yet.
> +	cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +	sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
> +
> +	# Save the pkgcfg sysroot variable, and update it to nothing so
> +	# that it doesn't append the sysroot to the beginning of paths.
> +	# The header and library files aren't installed to the target
> +	# system yet.  So the absolute paths were specified above.
> +	save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
> +	export PKG_CONFIG_SYSROOT_DIR=
> +
> +	# Compile the tests
> +	for lang in ${LANG_SUPPORT}; do
> +		oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
> +	done
> +
> +	# Restore the pkgconfig sysroot variable
> +	export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
> +}
> +
> +do_install() {
> +	local olddir=`pwd`
> +
> +	# Install protoc compiler
> +	autotools_do_install
> +
> +	# Install header files
> +	export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
> +	cd "${S}/${PYTHON_SRC_DIR}"
> +	distutils_do_install
> +
> +	cd "$olddir"
> +}
> +
> +do_install_ptest() {
> +	local olddir=`pwd`
> +
> +	cd "${S}/${TEST_SRC_DIR}"
> +	install -d "${D}/${PTEST_PATH}"
> +	for i in add_person* list_people*; do
> +		if [ -x "$i" ]; then
> +			install "$i" "${D}/${PTEST_PATH}"
> +		fi
> +	done
> +	cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
> +	
> +	cd "$olddir"
> +}
> +
> +BBCLASSEXTEND = "nativesdk"
> +


