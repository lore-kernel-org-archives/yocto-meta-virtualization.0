Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1DA46E00D26; Tue, 22 Aug 2017 19:42:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.195 listed in dnsbl.sorbs.net]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5827BE00B8E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:42:29 -0700 (PDT)
Received: by mail-ua0-f195.google.com with SMTP id e28so218157uah.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A5z+RreAUlaHB2k77DHNjlVeRnC+B3Jpra95XSBJk74=;
	b=C59IySRvLOuqUrjEQpkpExcfGfwQxph9xMvc3zB7mqNjx5F5NcDsFrR5XyTDfF6PrY
	ngv2wc8xkwKwneXKSY75ba9yyYoWS34URQkSOki6ew8ZvA0cJDQqR2b7KuDSx9nPObt8
	TCHBFC0BkIsu8riGEkuX3fL+vCXAZsFx181BrAl85Rf28rw8epIKcGxxYeKxP82sqUkD
	cTyRhjGiYKt9U4pR7sdFJN+ZFOrqhkLpfqg2jQI3j1kmxQ6IybjNW3sP9djldRlJ68qT
	CBJ2m6uiMQMgMaqs/iGYhumG9SoulbC7K0VToGUoxyHQYTh9EPzSr8dcNTaqPF/y/CRx
	t7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A5z+RreAUlaHB2k77DHNjlVeRnC+B3Jpra95XSBJk74=;
	b=oFo4zokwG48eScTHL2u2dmz8Mh75kDkI3CdLvRBPwH9PAUd3X9/UhNSYiBbJDg6R7H
	iFVlffDcPIxiL1v2Xbt+23JqAdeebBTASmEUod9Xc/ZXYADWtqXAxPnAywknv2Shdl4I
	rWjwKbYmeJqk7dp2xhJxfVAcz+hQYiOZ/T2dPZ8t9iieQzA3Re5KXtV2chyyQZxN2kRz
	Vn+QrefC9CCacFW1vqc5Zado2WC3GFr638dXQpAMJ3UpAw6xFJv+3x6WzL4ZKdaMAmI2
	34LwDZVuXGytZ7QMqqDHtbwfhJUb14Z4ygUifneMag3Z73Dw0nfXMtUYzuOu3zF5BqPY
	qHqw==
X-Gm-Message-State: AHYfb5haFynvNYA5wgEPhQHC+NhfmgTxTlUd+98xOhcDR3Hx/XKj/knG
	174DjGv2oWq3NUGf3C+flortwfFuTw==
X-Received: by 10.176.75.213 with SMTP id b21mr875452uag.3.1503456148418; Tue,
	22 Aug 2017 19:42:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 22 Aug 2017 19:42:27 -0700 (PDT)
In-Reply-To: <1503378503-23353-2-git-send-email-christopher.w.clark@gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
	<1503378503-23353-2-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2017 22:42:27 -0400
Message-ID: <CADkTA4MGpGfw_-mByH=VyUeg1a6pfMugww4YkSS2PfxJ02e-tQ@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 1/4] vgabios : extract biossums tool and build it separately, native
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
X-List-Received-Date: Wed, 23 Aug 2017 02:42:30 -0000
Content-Type: multipart/alternative; boundary="f403045e22a6a97854055762a955"

--f403045e22a6a97854055762a955
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 1:08 AM, <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.clark6@baesystems.com>
>
> The biossums tool is used to generate the vgabios build product.
>
> This patch:
> * adds a separate recipe "biossums" for the tool
> * makes the vgabios recipe depend upon biossums-native
> * makes the vgabios recipe use the native binary rather than a locally
> built one
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/vgabios/biossums_0.7a.bb | 37
> +++++++++++++++++++++++++++++++
>  recipes-extended/vgabios/vgabios_0.7a.bb  |  6 +++--
>  2 files changed, 41 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-extended/vgabios/biossums_0.7a.bb
>
> diff --git a/recipes-extended/vgabios/biossums_0.7a.bb
> b/recipes-extended/vgabios/biossums_0.7a.bb
> new file mode 100644
> index 0000000..276d037
> --- /dev/null
> +++ b/recipes-extended/vgabios/biossums_0.7a.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "biossums tool for building Plex86/Bochs LGPL VGABios"
> +HOMEPAGE = "http://www.nongnu.org/vgabios/"
> +LICENSE = "LGPLv2.1"
> +SECTION = "firmware"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
> +
> +SRC_URI =  "http://savannah.gnu.org/download/vgabios/vgabios-${PV}.tgz"
> +
> +SRC_URI[md5sum] = "2c0fe5c0ca08082a9293e3a7b23dc900"
> +SRC_URI[sha256sum] = "9d24c33d4bfb7831e2069cf3644936
> a53ef3de21d467872b54ce2ea30881b865"
> +
> +PR = "r0"
>

Minor issue, no need for a PR value in a new recipe. The PR server will
handle it.


> +
> +BBCLASSEXTEND = "native"
> +
> +FILES_${PN} = "${bindir}/biossums"
> +
> +S = "${WORKDIR}/vgabios-${PV}"
> +
> +do_configure() {
> +    # Don't override the compiler or its flags:
> +    sed 's,^CC,DISABLED_CC,' -i Makefile
> +    sed 's,^CFLAGS,DISABLED_CFLAGS,' -i Makefile
> +    # Supply the C flags to the compiler:
> +    sed 's,-o biossums,$(CFLAGS) -o biossums,' -i Makefile
> +}
> +
> +do_compile() {
> +    oe_runmake clean
>

What actually happens if the clean isn't run before each compile ?

Bruce


> +    oe_runmake biossums
> +}
> +
> +do_install() {
> +    mkdir -p "${D}${bindir}"
> +    install -m 0755 biossums "${D}${bindir}"
> +}
> diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb
> b/recipes-extended/vgabios/vgabios_0.7a.bb
> index 0ed8bb4..8c89041 100644
> --- a/recipes-extended/vgabios/vgabios_0.7a.bb
> +++ b/recipes-extended/vgabios/vgabios_0.7a.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.nongnu.org/vgabios/"
>  LICENSE = "LGPLv2.1"
>  SECTION = "firmware"
>
> -DEPENDS = "dev86-native"
> +DEPENDS = "dev86-native biossums-native"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
>
> @@ -20,7 +20,9 @@ FILES_${PN}-dbg = "/usr/share/firmware/${PN}-${
> PV}*.debug.bin"
>  S = "${WORKDIR}/${PN}-${PV}"
>
>  do_configure() {
> -    echo "Skip do_configure"
> +    # Override to use the native-built biossums tool:
> +    sed 's,./biossums,biossums,' -i Makefile
> +    sed 's,$(CC) -o biossums biossums.c,touch biossums,' -i Makefile
>  }
>
>  do_install() {
> --
> 2.1.4
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

--f403045e22a6a97854055762a955
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Aug 22, 2017 at 1:08 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:christopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Christ=
opher Clark &lt;<a href=3D"mailto:christopher.clark6@baesystems.com">christ=
opher.clark6@<wbr>baesystems.com</a>&gt;<br>
<br>
The biossums tool is used to generate the vgabios build product.<br>
<br>
This patch:<br>
* adds a separate recipe &quot;biossums&quot; for the tool<br>
* makes the vgabios recipe depend upon biossums-native<br>
* makes the vgabios recipe use the native binary rather than a locally buil=
t one<br>
<br>
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@b=
aesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=3D"n=
oreferrer" target=3D"_blank">bioss<wbr>ums_0.7a.bb</a> | 37 +++++++++++++++=
+++++++++++++++<wbr>+<br>
=C2=A0recipes-extended/vgabios/<a href=3D"http://vgabios_0.7a.bb" rel=3D"no=
referrer" target=3D"_blank">vgabi<wbr>os_0.7a.bb</a>=C2=A0 |=C2=A0 6 +++--<=
br>
=C2=A02 files changed, 41 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 recipes-extended/vgabios/<a href=3D"http://biossum=
s_0.7a.bb" rel=3D"noreferrer" target=3D"_blank">bioss<wbr>ums_0.7a.bb</a><b=
r>
<br>
diff --git a/recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" r=
el=3D"noreferrer" target=3D"_blank">bio<wbr>ssums_0.7a.bb</a> b/recipes-ext=
ended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=3D"noreferrer" target=
=3D"_blank">bio<wbr>ssums_0.7a.bb</a><br>
new file mode 100644<br>
index 0000000..276d037<br>
--- /dev/null<br>
+++ b/recipes-extended/vgabios/<a href=3D"http://biossums_0.7a.bb" rel=3D"n=
oreferrer" target=3D"_blank">bio<wbr>ssums_0.7a.bb</a><br>
@@ -0,0 +1,37 @@<br>
+DESCRIPTION =3D &quot;biossums tool for building Plex86/Bochs LGPL VGABios=
&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.nongnu.org/vgabios/" rel=3D"noref=
errer" target=3D"_blank">http://www.nongnu.org/<wbr>vgabios/</a>&quot;<br>
+LICENSE =3D &quot;LGPLv2.1&quot;<br>
+SECTION =3D &quot;firmware&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>dcf3c825659e82539645d=
a41a79085<wbr>89&quot;<br>
+<br>
+SRC_URI =3D=C2=A0 &quot;<a href=3D"http://savannah.gnu.org/download/vgabio=
s/vgabios-${PV}.tgz" rel=3D"noreferrer" target=3D"_blank">http://savannah.g=
nu.org/<wbr>download/vgabios/vgabios-${PV}<wbr>.tgz</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>2c0fe5c0ca08082a9293e3a7b23dc9<wbr>00&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>9d24c33d4bfb7831e2069cf3644936<wbr>a53ef=
3de21d467872b54ce2ea30881<wbr>b865&quot;<br>
+<br>
+PR =3D &quot;r0&quot;<br></blockquote><div><br></div><div>Minor issue, no =
need for a PR value in a new recipe. The PR server will handle it.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+FILES_${PN} =3D &quot;${bindir}/biossums&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/vgabios-${PV}&quot;<br>
+<br>
+do_configure() {<br>
+=C2=A0 =C2=A0 # Don&#39;t override the compiler or its flags:<br>
+=C2=A0 =C2=A0 sed &#39;s,^CC,DISABLED_CC,&#39; -i Makefile<br>
+=C2=A0 =C2=A0 sed &#39;s,^CFLAGS,DISABLED_CFLAGS,&#39; -i Makefile<br>
+=C2=A0 =C2=A0 # Supply the C flags to the compiler:<br>
+=C2=A0 =C2=A0 sed &#39;s,-o biossums,$(CFLAGS) -o biossums,&#39; -i Makefi=
le<br>
+}<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 oe_runmake clean<br></blockquote><div><br>What actually happ=
ens if the clean isn&#39;t run before each compile ?=C2=A0</div><div><br></=
div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 oe_runmake biossums<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 mkdir -p &quot;${D}${bindir}&quot;<br>
+=C2=A0 =C2=A0 install -m 0755 biossums &quot;${D}${bindir}&quot;<br>
+}<br>
diff --git a/recipes-extended/vgabios/<a href=3D"http://vgabios_0.7a.bb" re=
l=3D"noreferrer" target=3D"_blank">vga<wbr>bios_0.7a.bb</a> b/recipes-exten=
ded/vgabios/<a href=3D"http://vgabios_0.7a.bb" rel=3D"noreferrer" target=3D=
"_blank">vga<wbr>bios_0.7a.bb</a><br>
index 0ed8bb4..8c89041 100644<br>
--- a/recipes-extended/vgabios/<a href=3D"http://vgabios_0.7a.bb" rel=3D"no=
referrer" target=3D"_blank">vga<wbr>bios_0.7a.bb</a><br>
+++ b/recipes-extended/vgabios/<a href=3D"http://vgabios_0.7a.bb" rel=3D"no=
referrer" target=3D"_blank">vga<wbr>bios_0.7a.bb</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.nongnu.org/vgabios=
/" rel=3D"noreferrer" target=3D"_blank">http://www.nongnu.org/<wbr>vgabios/=
</a>&quot;<br>
=C2=A0LICENSE =3D &quot;LGPLv2.1&quot;<br>
=C2=A0SECTION =3D &quot;firmware&quot;<br>
<br>
-DEPENDS =3D &quot;dev86-native&quot;<br>
+DEPENDS =3D &quot;dev86-native biossums-native&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>dcf3c825659e8253=
9645da41a79085<wbr>89&quot;<br>
<br>
@@ -20,7 +20,9 @@ FILES_${PN}-dbg =3D &quot;/usr/share/firmware/${PN}-${<wb=
r>PV}*.debug.bin&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/${PN}-${PV}&quot;<br>
<br>
=C2=A0do_configure() {<br>
-=C2=A0 =C2=A0 echo &quot;Skip do_configure&quot;<br>
+=C2=A0 =C2=A0 # Override to use the native-built biossums tool:<br>
+=C2=A0 =C2=A0 sed &#39;s,./biossums,biossums,&#39; -i Makefile<br>
+=C2=A0 =C2=A0 sed &#39;s,$(CC) -o biossums biossums.c,touch biossums,&#39;=
 -i Makefile<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--f403045e22a6a97854055762a955--
