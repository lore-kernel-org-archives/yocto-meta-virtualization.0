Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4835FE009BC; Mon, 23 Apr 2018 09:37:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E032CE0090A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Apr 2018 09:37:17 -0700 (PDT)
Received: by mail-wr0-f194.google.com with SMTP id w3-v6so43053868wrg.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Apr 2018 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y8XbRtbsoiObYS+j7rgC0f/wpno5JLdXtGnE75wEibY=;
	b=oQiQJLi4Etv8GmfHgPvBO+87SM8a2TuPkIOGMeUCAarPWvPge0dXfXxcfxmhzxYmDV
	X0PoRmeFuEQ+vZYrnXb54bEocJg1y0wyrCjLs7tKLLJPOfAD860I1UPzzHgkXjCYmrhW
	VD5MoFRVGaSUuO2Ll4/N0zDWALZKPCHxqyByKDZjIrPQOfXctlXbrXi0amPf9HeyE68a
	ftBt1cv051EIV4BEjtxgiKr+cVhtbSwIkuVAtJuxFx5fH4TtUdB/wRn/HPmJw+bTshIH
	Qrvht6ckXLtau2EsLHQe0y3ztY+93on5/xxWz8FNkgaIh/B5Un7T77xr5h1Y3ZsO33gG
	xYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y8XbRtbsoiObYS+j7rgC0f/wpno5JLdXtGnE75wEibY=;
	b=biY5K22R6RAZtRUX+E/VkkPjiukZDfj57dDyDKARQQMtHqRb+C8STGrSg7LfHHr+NR
	ElatL42XTMOr74T2k00UxDaAdKx2ZJxvNSrIbZfG+zPk19d/xsJwrtLCelrti3GgYVLG
	KoZddn2bt6rdNUwkudOv71o4r2e+PAyZFQNy9kO4UY/c34tsgX0bfZp6jZwqA2L4C+6j
	Nox4G7YxYNJQJCQ/eYjpdhKoAuXVwmnGp0eeWVq7gL9eJxfi+Erv4RxvIee2estTKq9H
	teVdTPjYqJ6rTwM6Zg6fc9S2wmGRLOieEgV62dzDklARfG68uVJyVzCuRKSVO127SoG+
	R7jg==
X-Gm-Message-State: ALQs6tDsQYapj4l2O4EOiUCQuYA2FZs9gs1rGEUTj8cD65r8e5Dg+iVq
	XpLxI3+9ybs7Be+7TnTmXh/NAYQ3xNEewN7zZTnVNA==
X-Google-Smtp-Source: AIpwx4/D/R2OLfaP5nbIxHqcuq/+KGCy8GPRcf0VEPcRqs8N4hBXl8d+OFYmUBYbNIKqwVv8Sg3PWDoxjSMAQpg0BSs=
X-Received: by 2002:adf:83a2:: with SMTP id
	31-v6mr18384825wre.19.1524501436702; 
	Mon, 23 Apr 2018 09:37:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.129.206 with HTTP; Mon, 23 Apr 2018 09:37:16 -0700 (PDT)
In-Reply-To: <20180420143456.31128-2-akuster808@gmail.com>
References: <20180420143456.31128-1-akuster808@gmail.com>
	<20180420143456.31128-2-akuster808@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Apr 2018 12:37:16 -0400
Message-ID: <CADkTA4MefnBdsDcTHvD6JqcVM89fSGZ+7DF5DM=SzmU-ACa7LA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/2] refactor for YP Compat for PV changes
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
X-List-Received-Date: Mon, 23 Apr 2018 16:37:19 -0000
Content-Type: multipart/alternative; boundary="00000000000098277b056a86a6c6"

--00000000000098277b056a86a6c6
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Apr 20, 2018 at 10:34 AM, Armin Kuster <akuster808@gmail.com> wrote:

> Only include our versions of recipes if virtualiztions is in
> DISTRO_FEATURE
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  conf/distro/include/meta-virt-default-versions.inc | 9 +++++++++
>  conf/layer.conf                                    | 2 ++
>  recipes-devtools/python/python-blinker_1.3.bb      | 2 ++
>  recipes-devtools/python/python-gevent_1.0.1.bb     | 4 +++-
>  recipes-devtools/python/python-m2crypto_0.22.3.bb  | 2 ++
>  recipes-devtools/python/python-pyyaml_3.11.bb      | 2 ++
>  recipes-devtools/python/python-redis_2.10.3.bb     | 2 ++
>  recipes-devtools/python/python-sqlalchemy_1.1.5.bb | 2 ++
>  recipes-devtools/python/python-werkzeug_0.10.4.bb  | 2 ++
>  9 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 conf/distro/include/meta-virt-default-versions.inc
>
> diff --git a/conf/distro/include/meta-virt-default-versions.inc
> b/conf/distro/include/meta-virt-default-versions.inc
> new file mode 100644
> index 0000000..27e7b90
> --- /dev/null
> +++ b/conf/distro/include/meta-virt-default-versions.inc
> @@ -0,0 +1,9 @@
> +# Meta-virtuailization PREFERED_VERSION
> +
> +PREFERRED_VERSION_python-blinker = "1.3"
> +PREFERRED_VERSION_python-gevent = "1.0.1"
> +PREFERRED_VERSION_python-m2crypto = "0.22.3"
> +PREFERRED_VERSION_python-pyyaml = "3.11"
> +PREFERRED_VERSION_python-redis = "2.10.3"
> +PREFERRED_VERSION_python-sqlalchemy = "1.1.5"
> +PREFERRED_VERSION_python-werkzeug = "0.10.4"
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 4233d39..fa2e015 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -26,3 +26,5 @@ PREFERRED_PROVIDER_virtual/containerd ?=
> "containerd-opencontainers"
>  # Sanity check for meta-virtualization layer.
>  # Setting SKIP_META_VIRT_SANITY_CHECK to "1" would skip the bbappend
> files check.
>  INHERIT += "sanity-meta-virt"
> +
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> 'meta-virt-default-versions.inc', '', d)}
> diff --git a/recipes-devtools/python/python-blinker_1.3.bb
> b/recipes-devtools/python/python-blinker_1.3.bb
> index 24e19b5..8abb9c0 100644
> --- a/recipes-devtools/python/python-blinker_1.3.bb
> +++ b/recipes-devtools/python/python-blinker_1.3.bb
> @@ -18,5 +18,7 @@ SRC_URI[sha256sum] = "6811010809262261e41ab7b92f3f6d
> 23f35cf816fbec2bc05077992eeb
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> +DEFAULT_PREFERENCE = "-1"
> +
>  inherit setuptools
>
> diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb
> b/recipes-devtools/python/python-gevent_1.0.1.bb
> index 7f1d262..8cd1388 100644
> --- a/recipes-devtools/python/python-gevent_1.0.1.bb
> +++ b/recipes-devtools/python/python-gevent_1.0.1.bb
> @@ -25,4 +25,6 @@ SRC_URI += "file://gevent-allow-ssl-v2-
> or-v3-certificates.patch"
>  # so always force a cross compile
>  do_configure_append() {
>         sed -i -e 's/^cross_compiling=no/cross_compiling=yes/'
> ${S}/libev/configure
> -}
> \ No newline at end of file
> +}
> +
> +DEFAULT_PREFERENCE = "-1"
> diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb
> b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> index 2c2625d..e151dcc 100644
> --- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
> +++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> @@ -22,6 +22,8 @@ SRC_URI += " \
>  SRC_URI[md5sum] = "573f21aaac7d5c9549798e72ffcefedd"
>  SRC_URI[sha256sum] = "6071bfc817d94723e9b458a010d565
> 365104f84aa73f7fe11919871f7562ff72"
>
> +DEFAULT_PREFERENCE = "-1"
> +
>  inherit setuptools pypi
>
>  DEPENDS += "openssl swig-native"
> diff --git a/recipes-devtools/python/python-pyyaml_3.11.bb
> b/recipes-devtools/python/python-pyyaml_3.11.bb
> index cb1db8c..ecb1719 100644
> --- a/recipes-devtools/python/python-pyyaml_3.11.bb
> +++ b/recipes-devtools/python/python-pyyaml_3.11.bb
> @@ -25,6 +25,8 @@ SRC_URI[sha256sum] = "c36c938a872e5ff494938b33b14aaa
> 156cb439ec67548fcab3535bb78b
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> +DEFAULT_PREFERENCE = "-1"
> +
>  inherit setuptools
>
>  DEPENDS += "libyaml python-cython-native"
> diff --git a/recipes-devtools/python/python-redis_2.10.3.bb
> b/recipes-devtools/python/python-redis_2.10.3.bb
> index 9eda8a5..2ef2b6b 100644
> --- a/recipes-devtools/python/python-redis_2.10.3.bb
> +++ b/recipes-devtools/python/python-redis_2.10.3.bb
> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "a4fb37b02860f6b1617f6469487471
> fd086dd2d38bbce640c2055862b9
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> +DEFAULT_PREFERENCE = "-1"
> +
>  inherit setuptools
>
>  RDEPENDS_${PN} = "redis"
> diff --git a/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
> b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
> index 63caeb4..f22d272 100644
> --- a/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
> +++ b/recipes-devtools/python/python-sqlalchemy_1.1.5.bb
> @@ -13,4 +13,6 @@ SRC_URI[sha256sum] = "68fb40049690e567ebda7b270176f5
> abf0d53d9fbd515fec4e43326f60
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> +DEFAULT_PREFERENCE = "-1"
> +
>  inherit setuptools
> diff --git a/recipes-devtools/python/python-werkzeug_0.10.4.bb
> b/recipes-devtools/python/python-werkzeug_0.10.4.bb
> index 763e5b9..5f3e01f 100644
> --- a/recipes-devtools/python/python-werkzeug_0.10.4.bb
> +++ b/recipes-devtools/python/python-werkzeug_0.10.4.bb
> @@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "9d2771e4c89be127bc4bac056ab7ce
> af0e0064c723d6b6e195739c3af4
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> +DEFAULT_PREFERENCE = "-1"
> +
>  inherit setuptools
>
>  RDEPENDS_${PN} += "python-io \
> --
> 2.14.1
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

--00000000000098277b056a86a6c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 20, 2018 at 10:34 AM=
, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com=
" target=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Only include our versions of recipes if virtualiztion=
s is in<br>
DISTRO_FEATURE<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">aku=
ster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0conf/distro/include/meta-virt-<wbr>default-versions.inc | 9 +++++++++=
<br>
=C2=A0conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 2 ++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-blinker_1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-blinker_1.3.bb</a>=C2=A0 =C2=
=A0 =C2=A0 | 2 ++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-gevent_1.0.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 4 +++-<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22.3.bb" =
rel=3D"noreferrer" target=3D"_blank">python<wbr>-m2crypto_0.22.3.bb</a>=C2=
=A0 | 2 ++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-pyyaml_3.11.bb</a>=C2=A0 =C2=
=A0 =C2=A0 | 2 ++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-redis_2.10.3.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-redis_2.10.3.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.1.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">python<wbr>-sqlalchemy_1.1.5.bb</a> |=
 2 ++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-werkzeug_0.10.4.bb" =
rel=3D"noreferrer" target=3D"_blank">python<wbr>-werkzeug_0.10.4.bb</a>=C2=
=A0 | 2 ++<br>
=C2=A09 files changed, 26 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 conf/distro/include/meta-virt-<wbr>default-version=
s.inc<br>
<br>
diff --git a/conf/distro/include/meta-<wbr>virt-default-versions.inc b/conf=
/distro/include/meta-<wbr>virt-default-versions.inc<br>
new file mode 100644<br>
index 0000000..27e7b90<br>
--- /dev/null<br>
+++ b/conf/distro/include/meta-<wbr>virt-default-versions.inc<br>
@@ -0,0 +1,9 @@<br>
+# Meta-virtuailization PREFERED_VERSION<br>
+<br>
+PREFERRED_VERSION_python-<wbr>blinker =3D &quot;1.3&quot;<br>
+PREFERRED_VERSION_python-<wbr>gevent =3D &quot;1.0.1&quot;<br>
+PREFERRED_VERSION_python-<wbr>m2crypto =3D &quot;0.22.3&quot;<br>
+PREFERRED_VERSION_python-<wbr>pyyaml =3D &quot;3.11&quot;<br>
+PREFERRED_VERSION_python-<wbr>redis =3D &quot;2.10.3&quot;<br>
+PREFERRED_VERSION_python-<wbr>sqlalchemy =3D &quot;1.1.5&quot;<br>
+PREFERRED_VERSION_python-<wbr>werkzeug =3D &quot;0.10.4&quot;<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index 4233d39..fa2e015 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -26,3 +26,5 @@ PREFERRED_PROVIDER_virtual/<wbr>containerd ?=3D &quot;con=
tainerd-opencontainers&quot;<br>
=C2=A0# Sanity check for meta-virtualization layer.<br>
=C2=A0# Setting SKIP_META_VIRT_SANITY_CHECK to &quot;1&quot; would skip the=
 bbappend files check.<br>
=C2=A0INHERIT +=3D &quot;sanity-meta-virt&quot;<br>
+<br>
+require ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;virtuali=
zation&#39;, &#39;meta-virt-default-versions.<wbr>inc&#39;, &#39;&#39;, d)}=
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-blinker_1.3.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-blinker_1.3.bb</a> b/re=
cipes-devtools/python/<a href=3D"http://python-blinker_1.3.bb" rel=3D"noref=
errer" target=3D"_blank">pyth<wbr>on-blinker_1.3.bb</a><br>
index 24e19b5..8abb9c0 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-blinker_1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-blinker_1.3.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-blinker_1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-blinker_1.3.bb</a><br>
@@ -18,5 +18,7 @@ SRC_URI[sha256sum] =3D &quot;<wbr>6811010809262261e41ab7b=
92f3f6d<wbr>23f35cf816fbec2bc05077992eeb<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
+DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
+<br>
=C2=A0inherit setuptools<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-gevent_1.0.1.bb</a> b/=
recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.bb" rel=3D"no=
referrer" target=3D"_blank">pyth<wbr>on-gevent_1.0.1.bb</a><br>
index 7f1d262..8cd1388 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-gevent_1.0.1.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-gevent_1.0.1.bb</a><br>
@@ -25,4 +25,6 @@ SRC_URI +=3D &quot;file://gevent-allow-ssl-v2-<wbr>or-v3-=
certificates.patch&quot;<br>
=C2=A0# so always force a cross compile<br>
=C2=A0do_configure_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^cross_compiling=3Dno/cross_<w=
br>compiling=3Dyes/&#39; ${S}/libev/configure<br>
-}<br>
\ No newline at end of file<br>
+}<br>
+<br>
+DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22=
.3.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-m2crypto_0.22.3.bb<=
/a> b/recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22.3.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-m2crypto_0.22.3.bb</a><br>
index 2c2625d..e151dcc 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22.3.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-m2crypto_0.22.3.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22.3.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-m2crypto_0.22.3.bb</a><br>
@@ -22,6 +22,8 @@ SRC_URI +=3D &quot; \<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>573f21aaac7d5c9549798e72ffcefe<wbr>dd&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>6071bfc817d94723e9b458a010d565<wbr>=
365104f84aa73f7fe11919871f7562<wbr>ff72&quot;<br>
<br>
+DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
+<br>
=C2=A0inherit setuptools pypi<br>
<br>
=C2=A0DEPENDS +=3D &quot;openssl swig-native&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-pyyaml_3.11.bb</a> b/re=
cipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.bb" rel=3D"noref=
errer" target=3D"_blank">pyth<wbr>on-pyyaml_3.11.bb</a><br>
index cb1db8c..ecb1719 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-pyyaml_3.11.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-pyyaml_3.11.bb</a><br>
@@ -25,6 +25,8 @@ SRC_URI[sha256sum] =3D &quot;<wbr>c36c938a872e5ff494938b3=
3b14aaa<wbr>156cb439ec67548fcab3535bb78b<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
+DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
+<br>
=C2=A0inherit setuptools<br>
<br>
=C2=A0DEPENDS +=3D &quot;libyaml python-cython-native&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-redis_2.10.3.=
bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-redis_2.10.3.bb</a> b/=
recipes-devtools/python/<a href=3D"http://python-redis_2.10.3.bb" rel=3D"no=
referrer" target=3D"_blank">pyth<wbr>on-redis_2.10.3.bb</a><br>
index 9eda8a5..2ef2b6b 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-redis_2.10.3.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-redis_2.10.3.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-redis_2.10.3.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-redis_2.10.3.bb</a><br>
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] =3D &quot;<wbr>a4fb37b02860f6b1617f646=
9487471<wbr>fd086dd2d38bbce640c2055862b9<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
+DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
+<br>
=C2=A0inherit setuptools<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;redis&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.=
1.5.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sqlalchemy_1.1.5.b=
b</a> b/recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.1.5.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sqlalchemy_1.1.5.bb</a>=
<br>
index 63caeb4..f22d272 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.1.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sqlalchemy_1.1.5.bb</a><b=
r>
+++ b/recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.1.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sqlalchemy_1.1.5.bb</a><b=
r>
@@ -13,4 +13,6 @@ SRC_URI[sha256sum] =3D &quot;<wbr>68fb40049690e567ebda7b2=
70176f5<wbr>abf0d53d9fbd515fec4e43326f60<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
+DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
+<br>
=C2=A0inherit setuptools<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-werkzeug_0.10=
.4.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-werkzeug_0.10.4.bb<=
/a> b/recipes-devtools/python/<a href=3D"http://python-werkzeug_0.10.4.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-werkzeug_0.10.4.bb</a><br>
index 763e5b9..5f3e01f 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-werkzeug_0.10.4.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-werkzeug_0.10.4.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-werkzeug_0.10.4.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-werkzeug_0.10.4.bb</a><br>
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D &quot;<wbr>9d2771e4c89be127bc4bac0=
56ab7ce<wbr>af0e0064c723d6b6e195739c3af4<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
+DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
+<br>
=C2=A0inherit setuptools<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;python-io \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.14.1<br>
<br>
-- <br>
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
</div>

--00000000000098277b056a86a6c6--
