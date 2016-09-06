Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FE6BE00EF9; Tue,  6 Sep 2016 06:36:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20, 
	RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.173 listed in list.dnswl.org]
	*  2.4 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.173 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7C43E00DB1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Sep 2016 06:36:14 -0700 (PDT)
Received: by mail-qk0-f173.google.com with SMTP id l2so217476215qkf.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Sep 2016 06:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/iGfezoBlNwQxdrJJ/JVut3zOBhzX6C++UKBqnpzLMQ=;
	b=FzAqHJs6xb3Ff4TJYhhnG+Co2XpfieS97flwV+GKLgvRigMDwCHklVmidEjiRAEZXm
	+nPKzMvvQZEwRlM+TCPvf6HJTlZG1ddYU7YMokMX2/a+r7tIV8SGYooLS1LRO52oOPOG
	p0HfVcRDiqRHa0LOFL8gzkpcr9b71XM3P3xJW1LwJtXz8RHqg24OsmJmAy10UgbL85D/
	WYZ7u0ClWzNMqCcK/pATIPCByFg94VIOLw+KMZXXvZ51S4uY72QF6oqKVspzKMnlYzW4
	ccEg5qn04C1RoMue/IcK2PMy4gv0SgxQ6D+E+kqAB2aKP7fnM2Kzzl+nfqa31ucWAPFY
	QD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/iGfezoBlNwQxdrJJ/JVut3zOBhzX6C++UKBqnpzLMQ=;
	b=KwTnOXcDfR4AQt5rBFKEZE+uD3APMfhPrGDBFp7Cpdjp1crAUTpseATY8Sowkw3WI1
	ggQGv5R3C/8DNVmFzurfLAkqGCqJ4q7RXpSvk50ju8kYBKCEhlHuG0WrLY2HmedJzhKU
	klqt5v1Fi4SaqPb0tcsRZQ13x9HYK70MO4Danr+gq8WqBSJngoKMrzUbf0ADzfOkosKy
	qQZcjFzCylc8Tk/GFSKA9Ib4699fcJ3393Ge909cAVvZ9fhojVSArQzDqsz+ZEYweEss
	s/IiqUwuGPZnDVpRseXGhDDcshJDVxwjKsVaO+5Gzf5YJJehEZx2Pa0FJp9jZea8JwUR
	L7Jg==
X-Gm-Message-State: AE9vXwMK2lnHHieNTUuer67ydMRqzLqpsdjOftUVBqo4UzjP+D9Zpnj0+igcuJ2iNgZgVPCUU1aw7w45Gi+IgA==
X-Received: by 10.55.190.68 with SMTP id o65mr44426158qkf.92.1473168973616;
	Tue, 06 Sep 2016 06:36:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.189 with HTTP; Tue, 6 Sep 2016 06:36:12 -0700 (PDT)
In-Reply-To: <20160903031936.7436-1-venkat.mandela@ti.com>
References: <20160903031936.7436-1-venkat.mandela@ti.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Sep 2016 09:36:12 -0400
Message-ID: <CADkTA4PJB5bbiTzdUVc0Hork8RtqWCc+2hYQohrJB5pJOCpTwQ@mail.gmail.com>
To: Venkateswara Rao Mandela <venkat.mandela@ti.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] protobuf: fix source location
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
X-List-Received-Date: Tue, 06 Sep 2016 13:36:20 -0000
Content-Type: multipart/alternative; boundary=94eb2c043be25de8b8053bd6e188

--94eb2c043be25de8b8053bd6e188
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 2, 2016 at 11:19 PM, Venkateswara Rao Mandela <
venkat.mandela@ti.com> wrote:

> The file locations listed in the recipes for protobuf, protobuf-c
> are not currently available. Updating the recipe to
>
> 1. Point URI's to valid locations.
> 2. Update checksums and increment version numbers.
>

merged

Bruce


>
> Signed-off-by: Venkateswara Rao Mandela <venkat.mandela@ti.com>
> ---
>  recipes-devtools/protobuf/protobuf-c_0.15.bb       | 6 +++---
>  recipes-devtools/protobuf/protobuf-native_2.5.0.bb | 8 ++++----
>  recipes-devtools/protobuf/protobuf_2.5.0.bb        | 9 ++++-----
>  3 files changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/recipes-devtools/protobuf/protobuf-c_0.15.bb
> b/recipes-devtools/protobuf/protobuf-c_0.15.bb
> index 91dcb3b..4876d33 100644
> --- a/recipes-devtools/protobuf/protobuf-c_0.15.bb
> +++ b/recipes-devtools/protobuf/protobuf-c_0.15.bb
> @@ -6,14 +6,14 @@ LICENSE = "Apache-2.0"
>
>  LIC_FILES_CHKSUM = "file://src/google/protobuf-c/
> protobuf-c.c;endline=33;md5=333140fae7cf8a38dc5f980ddb63704b"
>
> -PR = "r0"
> +PR = "r1"
>
>  DEPENDS = "protobuf"
>
>  SRC_URI[md5sum] = "73ff0c8df50d2eee75269ad8f8c07dc8"
>  SRC_URI[sha256sum] = "8fcb538e13a5431c46168fc8f2e6ad
> 2574e2db9b684c0c72b066e24f010a0036"
> -SRC_URI = "http://protobuf-c.googlecode.com/files/protobuf-c-${PV}.tar.gz
> \
> -       file://disable_tests.patch"
> +SRC_URI = "https://storage.googleapis.com/google-code-archive-
> downloads/v2/code.google.com/protobuf-c/protobuf-c-${PV}.tar.gz \
> +        file://disable_tests.patch"
>
>  inherit autotools
>
> diff --git a/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
> b/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
> index 61b18a7..47acdae 100644
> --- a/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
> +++ b/recipes-devtools/protobuf/protobuf-native_2.5.0.bb
> @@ -8,11 +8,11 @@ LICENSE = "BSD-3-Clause"
>
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a245
> 14"
>
> -PR = "r0"
> +PR = "r1"
>
> -SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
> -SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98
> bdcb7cedb5b91d3b5bdcf29c98c293f58e"
> -SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
> +SRC_URI[md5sum] = "9c21577a03adc1879aba5b52d06e25cf"
> +SRC_URI[sha256sum] = "c2665a7aa2ac1a206e61b28e014486
> e3de59009ea2be2bde9182e0847f38b62f"
> +SRC_URI = "https://github.com/google/protobuf/archive/v${PV}.tar.gz \
>         "
>
>  EXTRA_OECONF += " --with-protoc=echo --disable-shared"
> diff --git a/recipes-devtools/protobuf/protobuf_2.5.0.bb
> b/recipes-devtools/protobuf/protobuf_2.5.0.bb
> index 23b74a7..b503a35 100644
> --- a/recipes-devtools/protobuf/protobuf_2.5.0.bb
> +++ b/recipes-devtools/protobuf/protobuf_2.5.0.bb
> @@ -8,16 +8,15 @@ LICENSE = "BSD-3-Clause"
>
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a245
> 14"
>
> -PR = "r0"
> +PR = "r1"
>  EXCLUDE_FROM_WORLD = "1"
>
> -SRC_URI[md5sum] = "b751f772bdeb2812a2a8e7202bf1dae8"
> -SRC_URI[sha256sum] = "c55aa3dc538e6fd5eaf732f4eb6b98
> bdcb7cedb5b91d3b5bdcf29c98c293f58e"
> -SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz \
> +SRC_URI[md5sum] = "9c21577a03adc1879aba5b52d06e25cf"
> +SRC_URI[sha256sum] = "c2665a7aa2ac1a206e61b28e014486
> e3de59009ea2be2bde9182e0847f38b62f"
> +SRC_URI = "https://github.com/google/protobuf/archive/v${PV}.tar.gz \
>         file://protobuf-allow-running-python-scripts-from-anywhere.patch \
>         file://run-ptest"
>
> -
>  EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
>  inherit autotools setuptools ptest
>
> --
> 2.9.3
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

--94eb2c043be25de8b8053bd6e188
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Sep 2, 2016 at 11:19 PM, Venkateswara Rao Mandela <span dir=3D"=
ltr">&lt;<a href=3D"mailto:venkat.mandela@ti.com" target=3D"_blank">venkat.=
mandela@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The =
file locations listed in the recipes for protobuf, protobuf-c<br>
are not currently available. Updating the recipe to<br>
<br>
1. Point URI&#39;s to valid locations.<br>
2. Update checksums and increment version numbers.<br></blockquote><div><br=
></div><div>merged<br><br></div><div>Bruce<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
Signed-off-by: Venkateswara Rao Mandela &lt;<a href=3D"mailto:venkat.mandel=
a@ti.com">venkat.mandela@ti.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf-c_0.15.bb" rel=
=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-c_0.15.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 6 +++---<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf-native_2.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">prot<wbr>obuf-native_2.5.0.bb</a> | 8=
 ++++----<br>
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">prot<wbr>obuf_2.5.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 9 ++++-----<br>
=C2=A03 files changed, 11 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-c_0.15.bb=
" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-c_0.15.bb</a> b/recipe=
s-devtools/protobuf/<a href=3D"http://protobuf-c_0.15.bb" rel=3D"noreferrer=
" target=3D"_blank">pr<wbr>otobuf-c_0.15.bb</a><br>
index 91dcb3b..4876d33 100644<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf-c_0.15.bb" rel=
=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-c_0.15.bb</a><br>
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf-c_0.15.bb" rel=
=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-c_0.15.bb</a><br>
@@ -6,14 +6,14 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://src/google/protobuf-c/<wbr>protobuf=
-c.c;endline=3D33;md5=3D<wbr>333140fae7cf8a38dc5f980ddb6370<wbr>4b&quot;<br=
>
<br>
-PR =3D &quot;r0&quot;<br>
+PR =3D &quot;r1&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;protobuf&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>73ff0c8df50d2eee75269ad8f8c07d<wbr>c8&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>8fcb538e13a5431c46168fc8f2e6ad<wbr>=
2574e2db9b684c0c72b066e24f010a<wbr>0036&quot;<br>
-SRC_URI =3D &quot;<a href=3D"http://protobuf-c.googlecode.com/files/protob=
uf-c-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://protobuf-c.g=
ooglecode.<wbr>com/files/protobuf-c-${PV}.<wbr>tar.gz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable_tests.patch&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://storage.googleapis.com/google-code-ar=
chive-downloads/v2/code.google.com/protobuf-c/protobuf-c-${PV}.tar.gz" rel=
=3D"noreferrer" target=3D"_blank">https://storage.googleapis.<wbr>com/googl=
e-code-archive-<wbr>downloads/v2/code.google.com/<wbr>protobuf-c/protobuf-c=
-${PV}.<wbr>tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_tests.patch&quot;<br>
<br>
=C2=A0inherit autotools<br>
<br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_2.=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_2.5.0.bb<=
/a> b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_2.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_2.5.0.bb</a><br>
index 61b18a7..47acdae 100644<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_2.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_2.5.0.bb</a><br>
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_2.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf-native_2.5.0.bb</a><br>
@@ -8,11 +8,11 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3D<wbr>af6809583bfd=
e9a31595a58bb4a245<wbr>14&quot;<br>
<br>
-PR =3D &quot;r0&quot;<br>
+PR =3D &quot;r1&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>b751f772bdeb2812a2a8e7202bf1da<wbr>e8&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>c55aa3dc538e6fd5eaf732f4eb6b98<wbr>bdcb7=
cedb5b91d3b5bdcf29c98c293<wbr>f58e&quot;<br>
-SRC_URI =3D &quot;<a href=3D"http://protobuf.googlecode.com/files/protobuf=
-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://protobuf.googlec=
ode.<wbr>com/files/protobuf-${PV}.tar.<wbr>gz</a> \<br>
+SRC_URI[md5sum] =3D &quot;<wbr>9c21577a03adc1879aba5b52d06e25<wbr>cf&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c2665a7aa2ac1a206e61b28e014486<wbr>e3de5=
9009ea2be2bde9182e0847f38<wbr>b62f&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v$=
{PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/google=
/<wbr>protobuf/archive/v${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<=
br>
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">pr<wbr>otobuf_2.5.0.bb</a> b/recipes-=
devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">pr<wbr>otobuf_2.5.0.bb</a><br>
index 23b74a7..b503a35 100644<br>
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pr<wbr>otobuf_2.5.0.bb</a><br>
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf_2.5.0.bb" rel=3D=
"noreferrer" target=3D"_blank">pr<wbr>otobuf_2.5.0.bb</a><br>
@@ -8,16 +8,15 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3D<wbr>af6809583bfd=
e9a31595a58bb4a245<wbr>14&quot;<br>
<br>
-PR =3D &quot;r0&quot;<br>
+PR =3D &quot;r1&quot;<br>
=C2=A0EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>b751f772bdeb2812a2a8e7202bf1da<wbr>e8&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>c55aa3dc538e6fd5eaf732f4eb6b98<wbr>bdcb7=
cedb5b91d3b5bdcf29c98c293<wbr>f58e&quot;<br>
-SRC_URI =3D &quot;<a href=3D"http://protobuf.googlecode.com/files/protobuf=
-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://protobuf.googlec=
ode.<wbr>com/files/protobuf-${PV}.tar.<wbr>gz</a> \<br>
+SRC_URI[md5sum] =3D &quot;<wbr>9c21577a03adc1879aba5b52d06e25<wbr>cf&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c2665a7aa2ac1a206e61b28e014486<wbr>e3de5=
9009ea2be2bde9182e0847f38<wbr>b62f&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archive/v$=
{PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/google=
/<wbr>protobuf/archive/v${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://protobuf-allow-running-<wbr>python-scrip=
ts-from-anywhere.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest&quot;<br>
<br>
-<br>
=C2=A0EXTRA_OECONF +=3D &quot; --with-protoc=3D${STAGING_<wbr>BINDIR_NATIVE=
}/protoc&quot;<br>
=C2=A0inherit autotools setuptools ptest<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.9.3<br>
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
</div></div>

--94eb2c043be25de8b8053bd6e188--
