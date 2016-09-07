Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 708FAE010D3; Wed,  7 Sep 2016 13:08:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  2.4 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.178 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0727E010C8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 13:08:42 -0700 (PDT)
Received: by mail-qt0-f178.google.com with SMTP id p30so13073146qte.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 Sep 2016 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3n+6hllwLPGmPY6AnSUa1S7nDxx1VOMGlhP+1QAjyKY=;
	b=z05mS8fbnv/HqKyfOGMQnyBixh2my71lfc+jIX3FVyDR7NkvIscDoZS3/gAVUEF5Ii
	t2Invm2dW/+0/hfv9DZnfwNq72BACb7T0h8aLlgOv6Gdi9M1exFtHs0NodyEhIpgXeD4
	ofwhcj5NQ+M3KDKuYDSw4NYwztGk3SHgL/rcDgPxmLcFrr4BZxv155ZSRT5kacwpiE6n
	6BIPwbTKeV7mbI7fbZ4lnM++M03/KTUn/1jDNyvMpoGnr7gEc0CB4o6wniazJL+7kEWE
	oNAyhdK0sNW3rW7kk9hLcDmspdpT7fybXTzsx193jxQzKfxfn8Yd0gmbABy1bcgCuZsx
	DKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3n+6hllwLPGmPY6AnSUa1S7nDxx1VOMGlhP+1QAjyKY=;
	b=Y40dcBEtxSDQEK6b+akSoVAKRi1gupnNWBdr/3n0Rc6L7HaqsBJ3c1GNJxJzfJymWM
	bhg2Wofwp4FoIuiVjW7j2URG+HMPVKlAxzXmfqe6r116PTwoCFyKzFKJabVtshkV3Cu9
	zY4X6qF4t1vwlJ2WB/lCjpMCjxvJUmmxtXX8J7/0RGjm727qss0IoxJZBaz9OW2OOz4g
	Xo8zI7nzBcxYSyfw97KKeSz99Rv/i4T6L4UKTjPJIPIHEbt6kd+hzIYtfcQAK4lF9Vv4
	FV/y2oTnoKZGo2YlOjb2KbDxv9jUDYYXDDFf9Wa3VGUrADwpxwgXmdOsRyCwh9cKjDz3
	SbeA==
X-Gm-Message-State: AE9vXwOyAKCf/LHmSsR783k83HcLMKc2z00FLlMv0bWy16JAQCSg84FwDsR4UHMSp5Kh3nE/EYgePFlO+dFblg==
X-Received: by 10.237.52.101 with SMTP id w92mr54460174qtd.51.1473278921793;
	Wed, 07 Sep 2016 13:08:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.189 with HTTP; Wed, 7 Sep 2016 13:08:41 -0700 (PDT)
In-Reply-To: <02515455-43d0-6487-78e2-c54522c9ca33@ti.com>
References: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
	<02515455-43d0-6487-78e2-c54522c9ca33@ti.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Sep 2016 16:08:41 -0400
Message-ID: <CADkTA4OSqr5rm_Uf8V1fyJN9_gqtR_0z6KC5ddNnEcM0iGJDTw@mail.gmail.com>
To: Venkateswara Rao Mandela <venkat.mandela@ti.com>
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
X-List-Received-Date: Wed, 07 Sep 2016 20:08:45 -0000
Content-Type: multipart/alternative; boundary=94eb2c124a5cc9ed99053bf07a9e

--94eb2c124a5cc9ed99053bf07a9e
Content-Type: text/plain; charset=UTF-8

Yep, these are broken for master and need to be resent.

Cheers,

Bruce

On Wed, Sep 7, 2016 at 5:43 AM, Mandela, Venkateswara Rao <
venkat.mandela@ti.com> wrote:

> Hi,
>
> I was unable to apply this patch on top the latest master. This patch
> appears to be based on older revisions where protobuf and protobuf-c
> recipes were still in recipes-containes/criu. Currently the recipes are in
> recipes-devtools/protobuf. Could you please rebase and resend the patches?
>
> regards,
> Venkat
>
> On Wednesday 07 September 2016 01:39 PM, jianchuan.wang@windriver.com
> wrote:
> > From: Jianchuan Wang <jianchuan.wang@windriver.com>
> >
> > Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> > ---
> >  .../criu/protobuf-native_2.6.1.bb                  | 21 -----
> >  .../criu/protobuf-native_3.0.0.bb                  | 21 +++++
> >  .../recipes-containers/criu/protobuf_2.6.1.bb      | 97
> ----------------------
> >  .../recipes-containers/criu/protobuf_3.0.0.bb      | 97
> ++++++++++++++++++++++
> >  4 files changed, 118 insertions(+), 118 deletions(-)
> >  delete mode 100644 meta-virtualization/recipes-containers/criu/
> protobuf-native_2.6.1.bb
> >  create mode 100644 meta-virtualization/recipes-containers/criu/
> protobuf-native_3.0.0.bb
> >  delete mode 100644 meta-virtualization/recipes-containers/criu/
> protobuf_2.6.1.bb
> >  create mode 100644 meta-virtualization/recipes-containers/criu/
> protobuf_3.0.0.bb
> >
> > diff --git a/meta-virtualization/recipes-containers/criu/protobuf-
> native_2.6.1.bb b/meta-virtualization/recipes-containers/criu/protobuf-
> native_2.6.1.bb
> > deleted file mode 100644
> > index e88c9e7..0000000
> > --- a/meta-virtualization/recipes-containers/criu/protobuf-
> native_2.6.1.bb
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -SUMMARY = "protobuf"
> > -DESCRIPTION = "Protocol Buffers are a way of encoding structured data
> in \
> > -an efficient yet extensible format. Google uses Protocol Buffers for \
> > -almost all of its internal RPC protocols and file formats."
> > -HOMEPAGE = "http://code.google.com/p/protobuf/"
> > -SECTION = "console/tools"
> > -LICENSE = "BSD-3-Clause"
> > -
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a245
> 14"
> > -
> > -PR = "r0"
> > -
> > -SRC_URI[md5sum] = "af05b2cca289f7b86eef2734a0cdc8b9"
> > -SRC_URI[sha256sum] = "2667b7cda4a6bc8a09e5463adf3b59
> 84e08d94e72338277affa8594d8b6e5cd1"
> > -SRC_URI = "https://github.com/google/protobuf/archive/v2.6.1.tar.
> gz;downloadfilename=protobuf-2.6.1.tar.gz \
> > -     "
> > -
> > -EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> > -
> > -inherit native autotools
> > -
> > diff --git a/meta-virtualization/recipes-containers/criu/protobuf-
> native_3.0.0.bb b/meta-virtualization/recipes-containers/criu/protobuf-
> native_3.0.0.bb
> > new file mode 100644
> > index 0000000..33467b3
> > --- /dev/null
> > +++ b/meta-virtualization/recipes-containers/criu/protobuf-
> native_3.0.0.bb
> > @@ -0,0 +1,21 @@
> > +SUMMARY = "protobuf"
> > +DESCRIPTION = "Protocol Buffers are a way of encoding structured data
> in \
> > +an efficient yet extensible format. Google uses Protocol Buffers for \
> > +almost all of its internal RPC protocols and file formats."
> > +HOMEPAGE = "http://code.google.com/p/protobuf/"
> > +SECTION = "console/tools"
> > +LICENSE = "BSD-3-Clause"
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef5400
> 95"
> > +
> > +PR = "r0"
> > +
> > +SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
> > +SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082
> e8fc3bda50038ac3dff787650795734146"
> > +SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.
> gz;downloadfilename=protobuf-3.0.0.tar.gz \
> > +     "
> > +
> > +EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> > +
> > +inherit native autotools
> > +
> > diff --git a/meta-virtualization/recipes-containers/criu/protobuf_2.6.
> 1.bb b/meta-virtualization/recipes-containers/criu/protobuf_2.6.1.bb
> > deleted file mode 100644
> > index 1b7ab20..0000000
> > --- a/meta-virtualization/recipes-containers/criu/protobuf_2.6.1.bb
> > +++ /dev/null
> > @@ -1,97 +0,0 @@
> > -SUMMARY = "protobuf"
> > -DESCRIPTION = "Protocol Buffers are a way of encoding structured data
> in \
> > -an efficient yet extensible format. Google uses Protocol Buffers for \
> > -almost all of its internal RPC protocols and file formats."
> > -HOMEPAGE = "http://code.google.com/p/protobuf/"
> > -SECTION = "console/tools"
> > -LICENSE = "BSD-3-Clause"
> > -
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a245
> 14"
> > -
> > -PR = "r0"
> > -EXCLUDE_FROM_WORLD = "1"
> > -
> > -SRC_URI[md5sum] = "af05b2cca289f7b86eef2734a0cdc8b9"
> > -SRC_URI[sha256sum] = "2667b7cda4a6bc8a09e5463adf3b59
> 84e08d94e72338277affa8594d8b6e5cd1"
> > -SRC_URI = "https://github.com/google/protobuf/archive/v2.6.1.tar.
> gz;downloadfilename=protobuf-2.6.1.tar.gz\
> > -     file://protobuf-allow-running-python-scripts-from-anywhere.patch \
> > -     file://Omit-google-apputils-dependency.patch \
> > -     file://run-ptest"
> > -
> > -COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> > -
> > -EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
> > -inherit autotools setuptools ptest
> > -
> > -DEPENDS += "protobuf-native"
> > -
> > -PYTHON_SRC_DIR="python"
> > -TEST_SRC_DIR="examples"
> > -LANG_SUPPORT="cpp python"
> > -
> > -do_compile() {
> > -     # Compile protoc compiler
> > -     base_do_compile
> > -}
> > -
> > -do_compile_ptest() {
> > -     # Modify makefile to use the cross-compiler
> > -     sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
> > -
> > -     mkdir -p "${B}/${TEST_SRC_DIR}"
> > -
> > -     # Add the location of the cross-compiled header and library files
> > -     # which haven't been installed yet.
> > -     cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
> > -     sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> > -     sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/
> protobuf.pc"
> > -     sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/
> protobuf.pc"
> > -     export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
> > -
> > -     # Save the pkgcfg sysroot variable, and update it to nothing so
> > -     # that it doesn't append the sysroot to the beginning of paths.
> > -     # The header and library files aren't installed to the target
> > -     # system yet.  So the absolute paths were specified above.
> > -     save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
> > -     export PKG_CONFIG_SYSROOT_DIR=
> > -
> > -     # Compile the tests
> > -     for lang in ${LANG_SUPPORT}; do
> > -             oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
> > -     done
> > -
> > -     # Restore the pkgconfig sysroot variable
> > -     export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
> > -}
> > -
> > -do_install() {
> > -     local olddir=`pwd`
> > -
> > -     # Install protoc compiler
> > -     autotools_do_install
> > -
> > -     # Install header files
> > -     export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
> > -     cd "${S}/${PYTHON_SRC_DIR}"
> > -     distutils_do_install
> > -
> > -     cd "$olddir"
> > -}
> > -
> > -do_install_ptest() {
> > -     local olddir=`pwd`
> > -
> > -     cd "${S}/${TEST_SRC_DIR}"
> > -     install -d "${D}/${PTEST_PATH}"
> > -     for i in add_person* list_people*; do
> > -             if [ -x "$i" ]; then
> > -                     install "$i" "${D}/${PTEST_PATH}"
> > -             fi
> > -     done
> > -     cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
> > -
> > -     cd "$olddir"
> > -}
> > -
> > -BBCLASSEXTEND = "nativesdk"
> > -
> > diff --git a/meta-virtualization/recipes-containers/criu/protobuf_3.0.
> 0.bb b/meta-virtualization/recipes-containers/criu/protobuf_3.0.0.bb
> > new file mode 100644
> > index 0000000..e1deeac
> > --- /dev/null
> > +++ b/meta-virtualization/recipes-containers/criu/protobuf_3.0.0.bb
> > @@ -0,0 +1,97 @@
> > +SUMMARY = "protobuf"
> > +DESCRIPTION = "Protocol Buffers are a way of encoding structured data
> in \
> > +an efficient yet extensible format. Google uses Protocol Buffers for \
> > +almost all of its internal RPC protocols and file formats."
> > +HOMEPAGE = "http://code.google.com/p/protobuf/"
> > +SECTION = "console/tools"
> > +LICENSE = "BSD-3-Clause"
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef5400
> 95"
> > +
> > +PR = "r0"
> > +EXCLUDE_FROM_WORLD = "1"
> > +
> > +SRC_URI[md5sum] = "d4f6ca65aadc6310b3872ee421e79fa6"
> > +SRC_URI[sha256sum] = "f5b3563f118f1d3d6e001705fa7082
> e8fc3bda50038ac3dff787650795734146"
> > +SRC_URI = "https://github.com/google/protobuf/archive/v3.0.0.tar.
> gz;downloadfilename=protobuf-3.0.0.tar.gz\
> > +             file://protobuf-allow-running-
> python-scripts-from-anywhere.patch \
> > +             file://run-ptest \
> > +            "
> > +
> > +COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> > +
> > +EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
> > +inherit autotools setuptools ptest
> > +
> > +DEPENDS += "protobuf-native"
> > +
> > +PYTHON_SRC_DIR="python"
> > +TEST_SRC_DIR="examples"
> > +LANG_SUPPORT="cpp python"
> > +
> > +do_compile() {
> > +     # Compile protoc compiler
> > +     base_do_compile
> > +}
> > +
> > +do_compile_ptest() {
> > +     # Modify makefile to use the cross-compiler
> > +     sed -e "s|c++|${CXX}|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
> > +
> > +     mkdir -p "${B}/${TEST_SRC_DIR}"
> > +
> > +     # Add the location of the cross-compiled header and library files
> > +     # which haven't been installed yet.
> > +     cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
> > +     sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i
> "${B}/${TEST_SRC_DIR}/protobuf.pc"
> > +     sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/
> protobuf.pc"
> > +     sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/
> protobuf.pc"
> > +     export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
> > +
> > +     # Save the pkgcfg sysroot variable, and update it to nothing so
> > +     # that it doesn't append the sysroot to the beginning of paths.
> > +     # The header and library files aren't installed to the target
> > +     # system yet.  So the absolute paths were specified above.
> > +     save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
> > +     export PKG_CONFIG_SYSROOT_DIR=
> > +
> > +     # Compile the tests
> > +     for lang in ${LANG_SUPPORT}; do
> > +             oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
> > +     done
> > +
> > +     # Restore the pkgconfig sysroot variable
> > +     export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
> > +}
> > +
> > +do_install() {
> > +     local olddir=`pwd`
> > +
> > +     # Install protoc compiler
> > +     autotools_do_install
> > +
> > +     # Install header files
> > +     export PROTOC="${STAGING_BINDIR_NATIVE}/protoc"
> > +     cd "${S}/${PYTHON_SRC_DIR}"
> > +     distutils_do_install
> > +
> > +     cd "$olddir"
> > +}
> > +
> > +do_install_ptest() {
> > +     local olddir=`pwd`
> > +
> > +     cd "${S}/${TEST_SRC_DIR}"
> > +     install -d "${D}/${PTEST_PATH}"
> > +     for i in add_person* list_people*; do
> > +             if [ -x "$i" ]; then
> > +                     install "$i" "${D}/${PTEST_PATH}"
> > +             fi
> > +     done
> > +     cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
> > +
> > +     cd "$olddir"
> > +}
> > +
> > +BBCLASSEXTEND = "nativesdk"
> > +
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

--94eb2c124a5cc9ed99053bf07a9e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yep, these are broken for master and need to be resent.<di=
v><br></div><div>Cheers,</div><div><br></div><div>Bruce</div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Sep 7, 2016 at 5:=
43 AM, Mandela, Venkateswara Rao <span dir=3D"ltr">&lt;<a href=3D"mailto:ve=
nkat.mandela@ti.com" target=3D"_blank">venkat.mandela@ti.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I was unable to apply this patch on top the latest master. This patch appea=
rs to be based on older revisions where protobuf and protobuf-c recipes wer=
e still in recipes-containes/criu. Currently the recipes are in recipes-dev=
tools/protobuf. Could you please rebase and resend the patches?<br>
<br>
regards,<br>
Venkat<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Wednesday 07 September 2016 01:39 PM, <a href=3D"mailto:jianchuan.wang@w=
indriver.com">jianchuan.wang@windriver.com</a> wrote:<br>
&gt; From: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windriver.co=
m">jianchuan.wang@windriver.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@win=
driver.com">jianchuan.wang@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../criu/<a href=3D"http://protobuf-native_2.6.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">protobuf-native_2.6.<wbr>1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 -----<br>
&gt;=C2=A0 .../criu/<a href=3D"http://protobuf-native_3.0.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">protobuf-native_3.0.<wbr>0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 +++++<br>
&gt;=C2=A0 .../recipes-containers/criu/<a href=3D"http://protobuf_2.6.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_2.6.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 | 97 ----------------------<br>
&gt;=C2=A0 .../recipes-containers/criu/<a href=3D"http://protobuf_3.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_3.0.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 | 97 ++++++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 118 insertions(+), 118 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-virtualization/recipes-<wbr>containers/c=
riu/<a href=3D"http://protobuf-native_2.6.1.bb" rel=3D"noreferrer" target=
=3D"_blank">protobuf-<wbr>native_2.6.1.bb</a><br>
&gt;=C2=A0 create mode 100644 meta-virtualization/recipes-<wbr>containers/c=
riu/<a href=3D"http://protobuf-native_3.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">protobuf-<wbr>native_3.0.0.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta-virtualization/recipes-<wbr>containers/c=
riu/<a href=3D"http://protobuf_2.6.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">protobuf_2.6.<wbr>1.bb</a><br>
&gt;=C2=A0 create mode 100644 meta-virtualization/recipes-<wbr>containers/c=
riu/<a href=3D"http://protobuf_3.0.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">protobuf_3.0.<wbr>0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-virtualization/recipes-<wbr>containers/criu/<a href=
=3D"http://protobuf-native_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
rotobuf-<wbr>native_2.6.1.bb</a> b/meta-virtualization/recipes-<wbr>contain=
ers/criu/<a href=3D"http://protobuf-native_2.6.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">protobuf-<wbr>native_2.6.1.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index e88c9e7..0000000<br>
&gt; --- a/meta-virtualization/recipes-<wbr>containers/criu/<a href=3D"http=
://protobuf-native_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">protobuf-=
<wbr>native_2.6.1.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,21 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;protobuf&quot;<br>
&gt; -DESCRIPTION =3D &quot;Protocol Buffers are a way of encoding structur=
ed data in \<br>
&gt; -an efficient yet extensible format. Google uses Protocol Buffers for =
\<br>
&gt; -almost all of its internal RPC protocols and file formats.&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/protobuf/" rel=
=3D"noreferrer" target=3D"_blank">http://code.google.com/p/<wbr>protobuf/</=
a>&quot;<br>
&gt; -SECTION =3D &quot;console/tools&quot;<br>
&gt; -LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; -<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>af6809583bfde9a3=
1595a58bb4a245<wbr>14&quot;<br>
&gt; -<br>
&gt; -PR =3D &quot;r0&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>af05b2cca289f7b86eef2734a0cdc8<wbr>b9&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>2667b7cda4a6bc8a09e5463adf3b59<wbr>=
84e08d94e72338277affa8594d8b6e<wbr>5cd1&quot;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archi=
ve/v2.6.1.tar.gz;downloadfilename=3Dprotobuf-2.6.1.tar.gz" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v2.6.1=
.tar.<wbr>gz;downloadfilename=3Dprotobuf-<wbr>2.6.1.tar.gz</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -<br>
&gt; -EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<=
br>
&gt; -<br>
&gt; -inherit native autotools<br>
&gt; -<br>
&gt; diff --git a/meta-virtualization/recipes-<wbr>containers/criu/<a href=
=3D"http://protobuf-native_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
rotobuf-<wbr>native_3.0.0.bb</a> b/meta-virtualization/recipes-<wbr>contain=
ers/criu/<a href=3D"http://protobuf-native_3.0.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">protobuf-<wbr>native_3.0.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..33467b3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-virtualization/recipes-<wbr>containers/criu/<a href=3D"http=
://protobuf-native_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">protobuf-=
<wbr>native_3.0.0.bb</a><br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +SUMMARY =3D &quot;protobuf&quot;<br>
&gt; +DESCRIPTION =3D &quot;Protocol Buffers are a way of encoding structur=
ed data in \<br>
&gt; +an efficient yet extensible format. Google uses Protocol Buffers for =
\<br>
&gt; +almost all of its internal RPC protocols and file formats.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/protobuf/" rel=
=3D"noreferrer" target=3D"_blank">http://code.google.com/p/<wbr>protobuf/</=
a>&quot;<br>
&gt; +SECTION =3D &quot;console/tools&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>35953c752efc9299=
b184f91bef5400<wbr>95&quot;<br>
&gt; +<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>d4f6ca65aadc6310b3872ee421e79f<wbr>a6&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>f5b3563f118f1d3d6e001705fa7082<wbr>=
e8fc3bda50038ac3dff78765079573<wbr>4146&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archi=
ve/v3.0.0.tar.gz;downloadfilename=3Dprotobuf-3.0.0.tar.gz" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.0.0=
.tar.<wbr>gz;downloadfilename=3Dprotobuf-<wbr>3.0.0.tar.gz</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<=
br>
&gt; +<br>
&gt; +inherit native autotools<br>
&gt; +<br>
&gt; diff --git a/meta-virtualization/recipes-<wbr>containers/criu/<a href=
=3D"http://protobuf_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">protobuf=
_2.6.<wbr>1.bb</a> b/meta-virtualization/recipes-<wbr>containers/criu/<a hr=
ef=3D"http://protobuf_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">protob=
uf_2.6.<wbr>1.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 1b7ab20..0000000<br>
&gt; --- a/meta-virtualization/recipes-<wbr>containers/criu/<a href=3D"http=
://protobuf_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_2.6.<wb=
r>1.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,97 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;protobuf&quot;<br>
&gt; -DESCRIPTION =3D &quot;Protocol Buffers are a way of encoding structur=
ed data in \<br>
&gt; -an efficient yet extensible format. Google uses Protocol Buffers for =
\<br>
&gt; -almost all of its internal RPC protocols and file formats.&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/protobuf/" rel=
=3D"noreferrer" target=3D"_blank">http://code.google.com/p/<wbr>protobuf/</=
a>&quot;<br>
&gt; -SECTION =3D &quot;console/tools&quot;<br>
&gt; -LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; -<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>af6809583bfde9a3=
1595a58bb4a245<wbr>14&quot;<br>
&gt; -<br>
&gt; -PR =3D &quot;r0&quot;<br>
&gt; -EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>af05b2cca289f7b86eef2734a0cdc8<wbr>b9&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>2667b7cda4a6bc8a09e5463adf3b59<wbr>=
84e08d94e72338277affa8594d8b6e<wbr>5cd1&quot;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archi=
ve/v2.6.1.tar.gz;downloadfilename=3Dprotobuf-2.6.1.tar.gz\" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v2.6.=
1.tar.<wbr>gz;downloadfilename=3Dprotobuf-<wbr>2.6.1.tar.gz\</a><br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://protobuf-allow-running-<wbr>python-scripts=
-from-anywhere.<wbr>patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://Omit-google-apputils-<wbr>dependency.patch=
 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://run-ptest&quot;<br>
&gt; -<br>
&gt; -COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
&gt; -<br>
&gt; -EXTRA_OECONF +=3D &quot; --with-protoc=3D${STAGING_<wbr>BINDIR_NATIVE=
}/protoc&quot;<br>
&gt; -inherit autotools setuptools ptest<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot;protobuf-native&quot;<br>
&gt; -<br>
&gt; -PYTHON_SRC_DIR=3D&quot;python&quot;<br>
&gt; -TEST_SRC_DIR=3D&quot;examples&quot;<br>
&gt; -LANG_SUPPORT=3D&quot;cpp python&quot;<br>
&gt; -<br>
&gt; -do_compile() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Compile protoc compiler<br>
&gt; -=C2=A0 =C2=A0 =C2=A0base_do_compile<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_compile_ptest() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Modify makefile to use the cross-compiler<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -e &quot;s|c++|${CXX}|g&quot; -i &quot;${S}/$=
{TEST_SRC_DIR}/<wbr>Makefile&quot;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${B}/${TEST_SRC_DIR}&quot;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Add the location of the cross-compiled header a=
nd library files<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# which haven&#39;t been installed yet.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cp &quot;${B}/protobuf.pc&quot; &quot;${B}/${TEST=
_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -e &#39;s|libdir=3D|libdir=3D${PKG_<wbr>CONFI=
G_SYSROOT_DIR}|&#39; -i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Cflags:|Cflags: -I${S}/src|&#39; -i=
 &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Libs:|Libs: -L${B}/src/.libs|&#39; =
-i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_PATH=3D&quot;${B}/${TEST_<wbr>S=
RC_DIR}&quot;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Save the pkgcfg sysroot variable, and update it=
 to nothing so<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# that it doesn&#39;t append the sysroot to the b=
eginning of paths.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# The header and library files aren&#39;t install=
ed to the target<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# system yet.=C2=A0 So the absolute paths were sp=
ecified above.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0save_pkg_config_sysroot_dir=3D$<wbr>PKG_CONFIG_SY=
SROOT_DIR<br>
&gt; -=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Compile the tests<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for lang in ${LANG_SUPPORT}; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C &quot;$=
{S}/${TEST_SRC_DIR}&quot; ${lang}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Restore the pkgconfig sysroot variable<br>
&gt; -=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D$save_<wbr>pkg_co=
nfig_sysroot_dir<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_install() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0local olddir=3D`pwd`<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Install protoc compiler<br>
&gt; -=C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Install header files<br>
&gt; -=C2=A0 =C2=A0 =C2=A0export PROTOC=3D&quot;${STAGING_BINDIR_<wbr>NATIV=
E}/protoc&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cd &quot;${S}/${PYTHON_SRC_DIR}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0distutils_do_install<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cd &quot;$olddir&quot;<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_install_ptest() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0local olddir=3D`pwd`<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cd &quot;${S}/${TEST_SRC_DIR}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -d &quot;${D}/${PTEST_PATH}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for i in add_person* list_people*; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$i&quot=
; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0install &quot;$i&quot; &quot;${D}/${PTEST_PATH}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cp &quot;${S}/${TEST_SRC_DIR}/<wbr>addressbook_pb=
2.py&quot; &quot;${D}/${PTEST_PATH}&quot;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cd &quot;$olddir&quot;<br>
&gt; -}<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
&gt; -<br>
&gt; diff --git a/meta-virtualization/recipes-<wbr>containers/criu/<a href=
=3D"http://protobuf_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">protobuf=
_3.0.<wbr>0.bb</a> b/meta-virtualization/recipes-<wbr>containers/criu/<a hr=
ef=3D"http://protobuf_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">protob=
uf_3.0.<wbr>0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..e1deeac<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-virtualization/recipes-<wbr>containers/criu/<a href=3D"http=
://protobuf_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.0.<wb=
r>0.bb</a><br>
&gt; @@ -0,0 +1,97 @@<br>
&gt; +SUMMARY =3D &quot;protobuf&quot;<br>
&gt; +DESCRIPTION =3D &quot;Protocol Buffers are a way of encoding structur=
ed data in \<br>
&gt; +an efficient yet extensible format. Google uses Protocol Buffers for =
\<br>
&gt; +almost all of its internal RPC protocols and file formats.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/protobuf/" rel=
=3D"noreferrer" target=3D"_blank">http://code.google.com/p/<wbr>protobuf/</=
a>&quot;<br>
&gt; +SECTION =3D &quot;console/tools&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>35953c752efc9299=
b184f91bef5400<wbr>95&quot;<br>
&gt; +<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt; +EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>d4f6ca65aadc6310b3872ee421e79f<wbr>a6&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>f5b3563f118f1d3d6e001705fa7082<wbr>=
e8fc3bda50038ac3dff78765079573<wbr>4146&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archi=
ve/v3.0.0.tar.gz;downloadfilename=3Dprotobuf-3.0.0.tar.gz\" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/google/<wbr>protobuf/archive/v3.0.=
0.tar.<wbr>gz;downloadfilename=3Dprotobuf-<wbr>3.0.0.tar.gz\</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://protobuf-allow=
-running-<wbr>python-scripts-from-anywhere.<wbr>patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECONF +=3D &quot; --with-protoc=3D${STAGING_<wbr>BINDIR_NATIVE=
}/protoc&quot;<br>
&gt; +inherit autotools setuptools ptest<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;protobuf-native&quot;<br>
&gt; +<br>
&gt; +PYTHON_SRC_DIR=3D&quot;python&quot;<br>
&gt; +TEST_SRC_DIR=3D&quot;examples&quot;<br>
&gt; +LANG_SUPPORT=3D&quot;cpp python&quot;<br>
&gt; +<br>
&gt; +do_compile() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Compile protoc compiler<br>
&gt; +=C2=A0 =C2=A0 =C2=A0base_do_compile<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_compile_ptest() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Modify makefile to use the cross-compiler<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sed -e &quot;s|c++|${CXX}|g&quot; -i &quot;${S}/$=
{TEST_SRC_DIR}/<wbr>Makefile&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mkdir -p &quot;${B}/${TEST_SRC_DIR}&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Add the location of the cross-compiled header a=
nd library files<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# which haven&#39;t been installed yet.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp &quot;${B}/protobuf.pc&quot; &quot;${B}/${TEST=
_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sed -e &#39;s|libdir=3D|libdir=3D${PKG_<wbr>CONFI=
G_SYSROOT_DIR}|&#39; -i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Cflags:|Cflags: -I${S}/src|&#39; -i=
 &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sed -e &#39;s|Libs:|Libs: -L${B}/src/.libs|&#39; =
-i &quot;${B}/${TEST_SRC_DIR}/<wbr>protobuf.pc&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_PATH=3D&quot;${B}/${TEST_<wbr>S=
RC_DIR}&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Save the pkgcfg sysroot variable, and update it=
 to nothing so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# that it doesn&#39;t append the sysroot to the b=
eginning of paths.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# The header and library files aren&#39;t install=
ed to the target<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# system yet.=C2=A0 So the absolute paths were sp=
ecified above.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0save_pkg_config_sysroot_dir=3D$<wbr>PKG_CONFIG_SY=
SROOT_DIR<br>
&gt; +=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Compile the tests<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for lang in ${LANG_SUPPORT}; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C &quot;$=
{S}/${TEST_SRC_DIR}&quot; ${lang}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Restore the pkgconfig sysroot variable<br>
&gt; +=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D$save_<wbr>pkg_co=
nfig_sysroot_dir<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0local olddir=3D`pwd`<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Install protoc compiler<br>
&gt; +=C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Install header files<br>
&gt; +=C2=A0 =C2=A0 =C2=A0export PROTOC=3D&quot;${STAGING_BINDIR_<wbr>NATIV=
E}/protoc&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd &quot;${S}/${PYTHON_SRC_DIR}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0distutils_do_install<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd &quot;$olddir&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0local olddir=3D`pwd`<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd &quot;${S}/${TEST_SRC_DIR}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0install -d &quot;${D}/${PTEST_PATH}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for i in add_person* list_people*; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -x &quot;$i&quot=
; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0install &quot;$i&quot; &quot;${D}/${PTEST_PATH}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp &quot;${S}/${TEST_SRC_DIR}/<wbr>addressbook_pb=
2.py&quot; &quot;${D}/${PTEST_PATH}&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd &quot;$olddir&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
&gt; +<br>
<br>
--<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">_______________________=
_______<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div>

--94eb2c124a5cc9ed99053bf07a9e--
