Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBBDDE00DCF; Thu, 22 Sep 2016 07:05:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42DADE006E9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Sep 2016 07:04:54 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id n185so1217288qke.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Sep 2016 07:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=twHIeKKEhZW6Ok+b9MSVcH7Qmtc0mq+IOmmfMSwChp0=;
	b=RFmHNljjTRtJMduaEC0j+Br/M9tqJkP1sgfOAMV52S49K5x+q9X01ZsOlaNauxiW/G
	pSpTjfyijQcVN1zIOlbI+0L3Ih3KW2HpyJv8sYryooY/Dk5aWgjwA4gyrGg57FiF0/a8
	NtL6MQMbWaWX42x6gGlGllVPXSQllL75hv1vtjSzcdZi5KIVDTaEuEt4C7iTAxSKbzdL
	ZhQfmTY6vUYl8MlNV3t56lpMsmLJpGnLjL1Fe8WzGjWxg86o6jqtjr8ddcMQqBJdtidq
	RaiQjx0Jq7T0ohaThUVDI3+bPnH6rZsseiLPOUAJZjc4hdxpgFDPymuwKcb7Yk/9pyAG
	cfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=twHIeKKEhZW6Ok+b9MSVcH7Qmtc0mq+IOmmfMSwChp0=;
	b=i++17rUpH9KQlNcmJlL2iJyT3dcqfDC21MK90gQQvRSZ/HQlLl1nXc76WbEmY/jv4N
	aw0ZKvg9Bp9abBmBO8wY2RG/soPADADuDMlb/nDVKASUjPqNuBLqKujuktmQXfpYAafB
	rO8WdNItEchdzCFTPBNI7Fcn2KsUrWDcQg2ohywm0qfAvWoHGr/mX1JIDeI6X8r7Eu8W
	GS2tqAmuwOiaHFBK1FAFj1f2lpsm+dxjyPQrg86Jo3zajPgg7Bjn/biAILKdlabuk8RD
	9HUYupl0LEdARTBgXhhr2v9qsrfVZnSm5roUHcSxNkwQ584vnfxtdXXxcndbxR+9XYxO
	ldqQ==
X-Gm-Message-State: AA6/9RnX7XeRUtdYPR0BRXUFEbzXhLROoAgGgr+xxzCXubBx2R/1OHLoADQRYF7+ulVFXGHnbTljSW/VUkBCDA==
X-Received: by 10.55.182.4 with SMTP id g4mr2103282qkf.120.1474553094005; Thu,
	22 Sep 2016 07:04:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Thu, 22 Sep 2016 07:04:53 -0700 (PDT)
In-Reply-To: <1474390872-43488-1-git-send-email-jason.wessel@windriver.com>
References: <1474390872-43488-1-git-send-email-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Sep 2016 10:04:53 -0400
Message-ID: <CADkTA4MYuXvFcRkNedCKfnYe=Vzto9mMiWBgKFgM1fV_0O2m_w@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [v2 PATCH] go-cross: Fix host contamination for x86_64 host to x86_64 target
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
X-List-Received-Date: Thu, 22 Sep 2016 14:05:08 -0000
Content-Type: multipart/alternative; boundary=94eb2c060cf05eea62053d19254b

--94eb2c060cf05eea62053d19254b
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 20, 2016 at 1:01 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> The go-cross package is explicitly for compiling target libraries on
> the host system.  When the target architecture matches the host
> architecture it will actually use the host's linker and compiler
> however which can result in the generation of the cgo.a library having
> linker symbols which might not work properly when compiling other
> packages.
>
> A typical error looks like this when building consul-migrate:
>
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/lib/
> x86_64-linux/go/pkg/tool/linux_amd64/link: running x86_64-yocto-linux-gcc
> failed: exit status 1
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/
> libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld:
> /opt/build-intel-x86/tmp/work/core2-64-yocto-linux/consul-
> migrate/git-r0/build-tmp/go-link-956548052/000002.o: unrecognized
> relocation (0x2a) in section `.text'
> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/
> libexec/x86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld: final link
> failed: Bad value
> collect2: error: ld returned 1 exit status
>
> The fix is to use the make.bash --target-only option to properly build
> the libraries with the target toolchain.
>
> When the host architecture does not match the target architecture we
> must also force build the target libraries or they get dynamically
> populated into the sysroot in an uncontrolled manner by the first
> package that uses go-cross to compile code.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-devtools/go-cross/go-cross.inc | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go-cross/go-cross.inc
> b/recipes-devtools/go-cross/go-cross.inc
> index 613e9c7..6363a78 100644
> --- a/recipes-devtools/go-cross/go-cross.inc
> +++ b/recipes-devtools/go-cross/go-cross.inc
> @@ -2,6 +2,10 @@ inherit cross
>
>  DEPENDS += "go-native"
>
> +# Prevent runstrip from running because you get errors when the host arch
> != target arch
> +#INHIBIT_PACKAGE_STRIP = "1"
> +STRIP = "echo"
> +
>  export GOHOSTOS = "${BUILD_GOOS}"
>  export GOHOSTARCH = "${BUILD_GOARCH}"
>  export GOOS = "${TARGET_GOOS}"
> @@ -26,6 +30,8 @@ do_compile() {
>
>      cd src
>      ./make.bash --host-only
> +    # Ensure cgo.a is built with the target toolchain
> +    GO_FLAGS="-a" ./make.bash --target-only
>  }
>
>  do_install() {
> @@ -38,7 +44,9 @@ do_install() {
>      install -d ${D}${bindir}
>      for f in ${B}/bin/*
>      do
> -        install -m755 $f ${D}${bindir}
> +        if [ ! -d "$f" ] ; then
> +            install -m755 $f ${D}${bindir}
> +        fi
>      done
>  }
>
> --
> 1.9.1
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

--94eb2c060cf05eea62053d19254b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>merged.<br></div><br></div>Bruce<br></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Sep 20, 2016 at=
 1:01 PM, Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel=
@windriver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">The go-cross package is explicitl=
y for compiling target libraries on<br>
the host system.=C2=A0 When the target architecture matches the host<br>
architecture it will actually use the host&#39;s linker and compiler<br>
however which can result in the generation of the cgo.a library having<br>
linker symbols which might not work properly when compiling other<br>
packages.<br>
<br>
A typical error looks like this when building consul-migrate:<br>
<br>
/opt/build-intel-x86/tmp/<wbr>sysroots/x86_64-linux/usr/lib/<wbr>x86_64-lin=
ux/go/pkg/tool/<wbr>linux_amd64/link: running x86_64-yocto-linux-gcc failed=
: exit status 1<br>
/opt/build-intel-x86/tmp/<wbr>sysroots/x86_64-linux/usr/<wbr>libexec/x86_64=
-yocto-linux/<wbr>gcc/x86_64-yocto-linux/5.2.0/<wbr>ld: /opt/build-intel-x8=
6/tmp/work/<wbr>core2-64-yocto-linux/consul-<wbr>migrate/git-r0/build-tmp/g=
o-<wbr>link-956548052/000002.o: unrecognized relocation (0x2a) in section `=
.text&#39;<br>
/opt/build-intel-x86/tmp/<wbr>sysroots/x86_64-linux/usr/<wbr>libexec/x86_64=
-yocto-linux/<wbr>gcc/x86_64-yocto-linux/5.2.0/<wbr>ld: final link failed: =
Bad value<br>
collect2: error: ld returned 1 exit status<br>
<br>
The fix is to use the make.bash --target-only option to properly build<br>
the libraries with the target toolchain.<br>
<br>
When the host architecture does not match the target architecture we<br>
must also force build the target libraries or they get dynamically<br>
populated into the sysroot in an uncontrolled manner by the first<br>
package that uses go-cross to compile code.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/go-cross/go-<wbr>cross.inc | 10 +++++++++-<br>
=C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-devtools/go-cross/<wbr>go-cross.inc b/recipes-devtools=
/go-cross/<wbr>go-cross.inc<br>
index 613e9c7..6363a78 100644<br>
--- a/recipes-devtools/go-cross/<wbr>go-cross.inc<br>
+++ b/recipes-devtools/go-cross/<wbr>go-cross.inc<br>
@@ -2,6 +2,10 @@ inherit cross<br>
<br>
=C2=A0DEPENDS +=3D &quot;go-native&quot;<br>
<br>
+# Prevent runstrip from running because you get errors when the host arch =
!=3D target arch<br>
+#INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
+STRIP =3D &quot;echo&quot;<br>
+<br>
=C2=A0export GOHOSTOS =3D &quot;${BUILD_GOOS}&quot;<br>
=C2=A0export GOHOSTARCH =3D &quot;${BUILD_GOARCH}&quot;<br>
=C2=A0export GOOS =3D &quot;${TARGET_GOOS}&quot;<br>
@@ -26,6 +30,8 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0cd src<br>
=C2=A0 =C2=A0 =C2=A0./make.bash --host-only<br>
+=C2=A0 =C2=A0 # Ensure cgo.a is built with the target toolchain<br>
+=C2=A0 =C2=A0 GO_FLAGS=3D&quot;-a&quot; ./make.bash --target-only<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
@@ -38,7 +44,9 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
=C2=A0 =C2=A0 =C2=A0for f in ${B}/bin/*<br>
=C2=A0 =C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m755 $f ${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -d &quot;$f&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m755 $f ${D}${bindir}<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--94eb2c060cf05eea62053d19254b--
