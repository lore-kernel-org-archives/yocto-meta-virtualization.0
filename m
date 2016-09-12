Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4257E006D2; Mon, 12 Sep 2016 07:04:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.174 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.174 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6309E00444
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Sep 2016 07:03:43 -0700 (PDT)
Received: by mail-qt0-f174.google.com with SMTP id 93so72775359qtg.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Sep 2016 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BaRM4dfeeYq7C3atpCasRk/NBSlPxVYu4Dh07gXhZHA=;
	b=YEKvJGCgmYJSjzKDLCl4XPBD7KXbulJi1K4+DxQ87T8rFiojP9W5e8ewCktadEoZPV
	NTmFFLYEmspRnXP640LsU6QRY4U92d2PBkrNuj1ycO3GCer18kFPJKJ0yhvoL2eN2tcH
	S8wnrSHF/GEc2fDidvTNAxtOYh7k/WRlp8ly+c4IrFyDUCEdlMwxhf8N4PnPaTFzmdZd
	BaGmOpNCMi60ZO30sm1dJx/qUKwUjS63zBwb3dSv/X/YWS9AOyLl46H5ON0jpkTiTO2w
	Jz79yJFFHhUGYYA0HAxg+QRRMj/QYxT/gIq9+WyZkx51SWB9pWmTK9fLKJ6bcqF27ekO
	D5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BaRM4dfeeYq7C3atpCasRk/NBSlPxVYu4Dh07gXhZHA=;
	b=iWbGZVSxQ8+NAMkh36mEiN3LqC4HyHhf4k2hkAc6v0bNCOq0PD9mT+xCweAuxJvs3Y
	A1aStByRmVjlVmTdaXiLKfNcdwXqXuLY2j7yCLTziO2Z7saNLagVZskRbHdxy4BcJnGI
	6G2bJp8aXgRUwaXP8G34MWoqeWKGz2RFtbHvRQYI6Dl8c5Duk2rKxpVR38qC9fnDko90
	iqA6OXQaWa0lObrOIttmGoouXwZJZXshWG+3gsAywP3gMdAtirCyVop0ulhlT9T50IPB
	l+vDXsBcsBuNHzeHZ/n7Cqe4WdjM0od/qNCIWUXIkhpWO4i970DE5bBtxYzBiygYfhdH
	GXBg==
X-Gm-Message-State: AE9vXwNAIo5RAiIoiyGAvihwvk7DyzblVMBmTlv+Yur6/atn7Z8dZPk33QW4s1VYC536n9w4RqiyJJ9/DPh3Aw==
X-Received: by 10.200.33.183 with SMTP id 52mr20098130qty.128.1473689022350;
	Mon, 12 Sep 2016 07:03:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Mon, 12 Sep 2016 07:03:40 -0700 (PDT)
In-Reply-To: <1473312960-115788-1-git-send-email-jianchuan.wang@windriver.com>
References: <1473312960-115788-1-git-send-email-jianchuan.wang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Sep 2016 10:03:40 -0400
Message-ID: <CADkTA4O4HATc65vFYJ40FaTN-VjjK+1VFdz-u=bLrJa3nHxPCw@mail.gmail.com>
To: jianchuan.wang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] protobuf: uprev 3.0.0 from 2.6.1
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
X-List-Received-Date: Mon, 12 Sep 2016 14:04:13 -0000
Content-Type: multipart/alternative; boundary=001a113fde42afe053053c4ff6b4

--001a113fde42afe053053c4ff6b4
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 8, 2016 at 1:35 AM, <jianchuan.wang@windriver.com> wrote:

> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
>
This series is merged.

Bruce


> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  recipes-devtools/protobuf/protobuf-native_2.5.0.bb | 20 -----
>  recipes-devtools/protobuf/protobuf-native_3.0.0.bb | 21 +++++
>  recipes-devtools/protobuf/protobuf_2.5.0.bb        | 95
> ---------------------
>  recipes-devtools/protobuf/protobuf_3.0.0.bb        | 97
> ++++++++++++++++++++++
>  4 files changed, 118 insertions(+), 115 deletions(-)
>  delete mode 100644 recipes-devtools/protobuf/protobuf-native_2.5.0.bb
>  create mode 100644 recipes-devtools/protobuf/protobuf-native_3.0.0.bb
>  delete mode 100644 recipes-devtools/protobuf/protobuf_2.5.0.bb
>  create mode 100644 recipes-devtools/protobuf/protobuf_3.0.0.bb
>
> diff --git a/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
> b/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
> deleted file mode 100644
> index 47acdae..0000000
> --- a/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY = "protobuf"
> -DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> -an efficient yet extensible format. Google uses Protocol Buffers for \
> -almost all of its internal RPC protocols and file formats."
> -HOMEPAGE = "http://code.google.com/p/protobuf/"
> -SECTION = "console/tools"
> -LICENSE = "BSD-3-Clause"
> -
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a245
> 14"
> -
> -PR = "r1"
> -
> -SRC_URI[md5sum] = "9c21577a03adc1879aba5b52d06e25cf"
> -SRC_URI[sha256sum] = "c2665a7aa2ac1a206e61b28e014486
> e3de59009ea2be2bde9182e0847f38b62f"
> -SRC_URI = "https://github.com/google/protobuf/archive/v${PV}.tar.gz \
> -       "
> -
> -EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> -
> -inherit native autotools
> diff --git a/recipes-devtools/protobuf/protobuf-native_3.0.0.bb
> b/recipes-devtools/protobuf/protobuf-native_3.0.0.bb
> new file mode 100644
> index 0000000..33467b3
> --- /dev/null
> +++ b/recipes-devtools/protobuf/protobuf-native_3.0.0.bb
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
> +SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082
> e8fc3bda50038ac3dff787650795734146"
> +SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.
> gz;downloadfilename=protobuf-3.0.0.tar.gz \
> +       "
> +
> +EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> +
> +inherit native autotools
> +
> diff --git a/recipes-devtools/protobuf/protobuf_2.5.0.bb
> b/recipes-devtools/protobuf/protobuf_2.5.0.bb
> deleted file mode 100644
> index b503a35..0000000
> --- a/recipes-devtools/protobuf/protobuf_2.5.0.bb
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -SUMMARY = "protobuf"
> -DESCRIPTION = "Protocol Buffers are a way of encoding structured data in \
> -an efficient yet extensible format. Google uses Protocol Buffers for \
> -almost all of its internal RPC protocols and file formats."
> -HOMEPAGE = "http://code.google.com/p/protobuf/"
> -SECTION = "console/tools"
> -LICENSE = "BSD-3-Clause"
> -
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a245
> 14"
> -
> -PR = "r1"
> -EXCLUDE_FROM_WORLD = "1"
> -
> -SRC_URI[md5sum] = "9c21577a03adc1879aba5b52d06e25cf"
> -SRC_URI[sha256sum] = "c2665a7aa2ac1a206e61b28e014486
> e3de59009ea2be2bde9182e0847f38b62f"
> -SRC_URI = "https://github.com/google/protobuf/archive/v${PV}.tar.gz \
> -       file://protobuf-allow-running-python-scripts-from-anywhere.patch \
> -       file://run-ptest"
> -
> -EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
> -inherit autotools setuptools ptest
> -
> -DEPENDS += "protobuf-native"
> -RDEPENDS_${PN}-ptest = "bash python"
> -
> -PYTHON_SRC_DIR="python"
> -TEST_SRC_DIR="examples"
> -LANG_SUPPORT="python"
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
> -       sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> -       sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/
> protobuf.pc"
> -       sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/
> protobuf.pc"
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
> diff --git a/recipes-devtools/protobuf/protobuf_3.0.0.bb
> b/recipes-devtools/protobuf/protobuf_3.0.0.bb
> new file mode 100644
> index 0000000..e1deeac
> --- /dev/null
> +++ b/recipes-devtools/protobuf/protobuf_3.0.0.bb
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
> +SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082
> e8fc3bda50038ac3dff787650795734146"
> +SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.
> gz;downloadfilename=protobuf-3.0.0.tar.gz\
> +               file://protobuf-allow-running-
> python-scripts-from-anywhere.patch \
> +               file://run-ptest \
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
> +       sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> +       sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/
> protobuf.pc"
> +       sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/
> protobuf.pc"
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
> 2.8.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113fde42afe053053c4ff6b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Sep 8, 2016 at 1:35 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jianchuan.wang@windriver.com" target=3D"_blank">jianchuan.wang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">From: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windriver.com">=
jianchuan.wang@windriver.com</a>&gt;<br>
<br></span></blockquote><div><br></div><div>This series is merged.<br><br><=
/div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D"">
Signed-off-by: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windrive=
r.com">jianchuan.wang@windriver.com</a>&gt;<br>
---<br>
</span>=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf-native_2.=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-native_2.5.0.bb<=
/a> | 20 -----<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-native_3.0.0.bb</a> | 2=
1 +++++<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">prot<wbr>obuf_2.5.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 95 ---------------------<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb" rel=3D=
"noreferrer" target=3D"_blank">prot<wbr>obuf_3.0.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 97 ++++++++++++++++++++++<br>
=C2=A04 files changed, 118 insertions(+), 115 deletions(-)<br>
=C2=A0delete mode 100644 recipes-devtools/protobuf/<a href=3D"http://protob=
uf-native_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-nati=
ve_2.5.0.bb</a><br>
=C2=A0create mode 100644 recipes-devtools/protobuf/<a href=3D"http://protob=
uf-native_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-nati=
ve_3.0.0.bb</a><br>
=C2=A0delete mode 100644 recipes-devtools/protobuf/<a href=3D"http://protob=
uf_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf_2.5.0.bb</a=
><br>
=C2=A0create mode 100644 recipes-devtools/protobuf/<a href=3D"http://protob=
uf_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf_3.0.0.bb</a=
><br>
<br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_2.=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_2.5.0.bb<=
/a> b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_2.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_2.5.0.bb</a><br>
deleted file mode 100644<br>
index 47acdae..0000000<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_2.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_2.5.0.bb</a><br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
<span class=3D"">-SUMMARY =3D &quot;protobuf&quot;<br>
-DESCRIPTION =3D &quot;Protocol Buffers are a way of encoding structured da=
ta in \<br>
-an efficient yet extensible format. Google uses Protocol Buffers for \<br>
-almost all of its internal RPC protocols and file formats.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/protobuf/" rel=3D"n=
oreferrer" target=3D"_blank">http://code.google.com/p/<wbr>protobuf/</a>&qu=
ot;<br>
-SECTION =3D &quot;console/tools&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-<br>
</span>-LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3D<wbr>af6809583b=
fde9a31595a58bb4a245<wbr>14&quot;<br>
-<br>
-PR =3D &quot;r1&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>9c21577a03adc1879aba5b52d06e25<wbr>cf&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>c2665a7aa2ac1a206e61b28e014486<wbr>e3de5=
9009ea2be2bde9182e0847f38<wbr>b62f&quot;<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v$=
{PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/google=
/<wbr>protobuf/archive/v${PV}.tar.gz</a> \<br>
<span class=3D"">-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<br>
-<br>
-inherit native autotools<br>
</span>diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-na=
tive_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.=
0.0.bb</a> b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.0.0.bb<=
/a><br>
<span class=3D"">new file mode 100644<br>
index 0000000..33467b3<br>
--- /dev/null<br>
</span>+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_3.0.0.bb<=
/a><br>
<span class=3D"">@@ -0,0 +1,21 @@<br>
+SUMMARY =3D &quot;protobuf&quot;<br>
+DESCRIPTION =3D &quot;Protocol Buffers are a way of encoding structured da=
ta in \<br>
+an efficient yet extensible format. Google uses Protocol Buffers for \<br>
+almost all of its internal RPC protocols and file formats.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/protobuf/" rel=3D"n=
oreferrer" target=3D"_blank">http://code.google.com/p/<wbr>protobuf/</a>&qu=
ot;<br>
+SECTION =3D &quot;console/tools&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>35953c752efc9299b184f=
91bef5400<wbr>95&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>d4f6ca65aadc6310b3872ee421e79f<wbr>a6&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>f5b3563f118f1d3d6e001705fa7082<wbr>e8fc3=
bda50038ac3dff78765079573<wbr>4146&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v3=
.0.0.tar.gz;downloadfilename=3Dprotobuf-3.0.0.tar.gz" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.0.0.tar.=
<wbr>gz;downloadfilename=3Dprotobuf-<wbr>3.0.0.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<br>
+<br>
+inherit native autotools<br>
+<br>
</span>diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf_2.=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_2.5.0.bb</a> b/r=
ecipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">pr<wbr>otobuf_2.5.0.bb</a><br>
deleted file mode 100644<br>
index b503a35..0000000<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pr<wbr>otobuf_2.5.0.bb</a><br>
+++ /dev/null<br>
@@ -1,95 +0,0 @@<br>
<span class=3D"">-SUMMARY =3D &quot;protobuf&quot;<br>
-DESCRIPTION =3D &quot;Protocol Buffers are a way of encoding structured da=
ta in \<br>
-an efficient yet extensible format. Google uses Protocol Buffers for \<br>
-almost all of its internal RPC protocols and file formats.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/protobuf/" rel=3D"n=
oreferrer" target=3D"_blank">http://code.google.com/p/<wbr>protobuf/</a>&qu=
ot;<br>
-SECTION =3D &quot;console/tools&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-<br>
</span>-LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3D<wbr>af6809583b=
fde9a31595a58bb4a245<wbr>14&quot;<br>
-<br>
-PR =3D &quot;r1&quot;<br>
-EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>9c21577a03adc1879aba5b52d06e25<wbr>cf&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>c2665a7aa2ac1a206e61b28e014486<wbr>e3de5=
9009ea2be2bde9182e0847f38<wbr>b62f&quot;<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v$=
{PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/google=
/<wbr>protobuf/archive/v${PV}.tar.gz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://protobuf-allow-running-<wbr>python-scrip=
ts-from-anywhere.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest&quot;<br>
<span class=3D"">-<br>
-EXTRA_OECONF +=3D &quot; --with-protoc=3D${STAGING_<wbr>BINDIR_NATIVE}/pro=
toc&quot;<br>
-inherit autotools setuptools ptest<br>
-<br>
-DEPENDS +=3D &quot;protobuf-native&quot;<br>
</span>-RDEPENDS_${PN}-ptest =3D &quot;bash python&quot;<br>
<span class=3D"">-<br>
-PYTHON_SRC_DIR=3D&quot;python&quot;<br>
-TEST_SRC_DIR=3D&quot;examples&quot;<br>
</span>-LANG_SUPPORT=3D&quot;python&quot;<br>
<div><div class=3D"h5">-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Compile protoc compiler<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0base_do_compile<br>
-}<br>
-<br>
-do_compile_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Modify makefile to use the cross-compiler<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s|c++|${CXX}|g&quot; -i &quot;${S}=
/${TEST_SRC_DIR}/<wbr>Makefile&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${B}/${TEST_SRC_DIR}&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Add the location of the cross-compiled header=
 and library files<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# which haven&#39;t been installed yet.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp &quot;${B}/protobuf.pc&quot; &quot;${B}/${TE=
ST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|libdir=3D|libdir=3D${PKG_<wbr>CON=
FIG_SYSROOT_DIR}|&#39; -i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Cflags:|Cflags: -I${S}/src|&#39; =
-i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Libs:|Libs: -L${B}/src/.libs|&#39=
; -i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_PATH=3D&quot;${B}/${TEST_<wbr=
>SRC_DIR}&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Save the pkgcfg sysroot variable, and update =
it to nothing so<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# that it doesn&#39;t append the sysroot to the=
 beginning of paths.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# The header and library files aren&#39;t insta=
lled to the target<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# system yet.=C2=A0 So the absolute paths were =
specified above.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0save_pkg_config_sysroot_dir=3D$<wbr>PKG_CONFIG_=
SYSROOT_DIR<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Compile the tests<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for lang in ${LANG_SUPPORT}; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C &quot=
;${S}/${TEST_SRC_DIR}&quot; ${lang}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Restore the pkgconfig sysroot variable<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D$save_<wbr>pkg_=
config_sysroot_dir<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0local olddir=3D`pwd`<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Install protoc compiler<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Install header files<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PROTOC=3D&quot;${STAGING_BINDIR_<wbr>NAT=
IVE}/protoc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd &quot;${S}/${PYTHON_SRC_DIR}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0distutils_do_install<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd &quot;$olddir&quot;<br>
-}<br>
-<br>
-do_install_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0local olddir=3D`pwd`<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd &quot;${S}/${TEST_SRC_DIR}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}/${PTEST_PATH}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in add_person* list_people*; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$i&qu=
ot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install &quot;$i&quot; &quot;${D}/${PTEST_PATH}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp &quot;${S}/${TEST_SRC_DIR}/<wbr>addressbook_=
pb2.py&quot; &quot;${D}/${PTEST_PATH}&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd &quot;$olddir&quot;<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
-<br>
</div></div>diff --git a/recipes-devtools/protobuf/<a href=3D"http://protob=
uf_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a=
> b/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a><br>
<span class=3D"">new file mode 100644<br>
index 0000000..e1deeac<br>
--- /dev/null<br>
</span>+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a><br>
<div><div class=3D"h5">@@ -0,0 +1,97 @@<br>
+SUMMARY =3D &quot;protobuf&quot;<br>
+DESCRIPTION =3D &quot;Protocol Buffers are a way of encoding structured da=
ta in \<br>
+an efficient yet extensible format. Google uses Protocol Buffers for \<br>
+almost all of its internal RPC protocols and file formats.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/protobuf/" rel=3D"n=
oreferrer" target=3D"_blank">http://code.google.com/p/<wbr>protobuf/</a>&qu=
ot;<br>
+SECTION =3D &quot;console/tools&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>35953c752efc9299b184f=
91bef5400<wbr>95&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br>
+EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>d4f6ca65aadc6310b3872ee421e79f<wbr>a6&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>f5b3563f118f1d3d6e001705fa7082<wbr>e8fc3=
bda50038ac3dff78765079573<wbr>4146&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v3=
.0.0.tar.gz;downloadfilename=3Dprotobuf-3.0.0.tar.gz\" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.0.0.tar=
.<wbr>gz;downloadfilename=3Dprotobuf-<wbr>3.0.0.tar.gz\</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://protobuf-all=
ow-running-<wbr>python-scripts-from-anywhere.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
+<br>
+EXTRA_OECONF +=3D &quot; --with-protoc=3D${STAGING_<wbr>BINDIR_NATIVE}/pro=
toc&quot;<br>
+inherit autotools setuptools ptest<br>
+<br>
+DEPENDS +=3D &quot;protobuf-native&quot;<br>
+<br>
+PYTHON_SRC_DIR=3D&quot;python&quot;<br>
+TEST_SRC_DIR=3D&quot;examples&quot;<br>
+LANG_SUPPORT=3D&quot;cpp python&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Compile protoc compiler<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0base_do_compile<br>
+}<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Modify makefile to use the cross-compiler<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s|c++|${CXX}|g&quot; -i &quot;${S}=
/${TEST_SRC_DIR}/<wbr>Makefile&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${B}/${TEST_SRC_DIR}&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Add the location of the cross-compiled header=
 and library files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# which haven&#39;t been installed yet.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp &quot;${B}/protobuf.pc&quot; &quot;${B}/${TE=
ST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|libdir=3D|libdir=3D${PKG_<wbr>CON=
FIG_SYSROOT_DIR}|&#39; -i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Cflags:|Cflags: -I${S}/src|&#39; =
-i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Libs:|Libs: -L${B}/src/.libs|&#39=
; -i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_PATH=3D&quot;${B}/${TEST_<wbr=
>SRC_DIR}&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Save the pkgcfg sysroot variable, and update =
it to nothing so<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# that it doesn&#39;t append the sysroot to the=
 beginning of paths.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# The header and library files aren&#39;t insta=
lled to the target<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# system yet.=C2=A0 So the absolute paths were =
specified above.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0save_pkg_config_sysroot_dir=3D$<wbr>PKG_CONFIG_=
SYSROOT_DIR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Compile the tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for lang in ${LANG_SUPPORT}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C &quot=
;${S}/${TEST_SRC_DIR}&quot; ${lang}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Restore the pkgconfig sysroot variable<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D$save_<wbr>pkg_=
config_sysroot_dir<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local olddir=3D`pwd`<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Install protoc compiler<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Install header files<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export PROTOC=3D&quot;${STAGING_BINDIR_<wbr>NAT=
IVE}/protoc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd &quot;${S}/${PYTHON_SRC_DIR}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0distutils_do_install<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd &quot;$olddir&quot;<br>
+}<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local olddir=3D`pwd`<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd &quot;${S}/${TEST_SRC_DIR}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}/${PTEST_PATH}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in add_person* list_people*; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$i&qu=
ot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install &quot;$i&quot; &quot;${D}/${PTEST_PATH}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp &quot;${S}/${TEST_SRC_DIR}/<wbr>addressbook_=
pb2.py&quot; &quot;${D}/${PTEST_PATH}&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd &quot;$olddir&quot;<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
+<br>
--<br>
</div></div>2.8.1<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113fde42afe053053c4ff6b4--
