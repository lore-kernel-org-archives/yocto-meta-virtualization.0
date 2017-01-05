Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87BCAE0049F; Wed,  4 Jan 2017 19:35:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.180 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41BADE0049A
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Jan 2017 19:35:08 -0800 (PST)
Received: by mail-qt0-f180.google.com with SMTP id d45so286807192qta.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Jan 2017 19:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CjH7qvPqEEZUwBKS495BahMjn6Jl2wwZixxacKwBAag=;
	b=e0R9tzKR8PTxJ4NbPsfLaYo1Htl/dJM3lhhgkd/sJdaVVY2zQVPlwUB7vg2vau12gY
	CbCKvo7/cHiOwjAQOpHYI5NxCAH3uBmWUiALkShgFglGBzAVw/JojoJb2NehywSaySIg
	PANgpX4AjByT50kNH/kh3n/XsrfhmCFHE32Sc4omod7C+QJ/6FJPH/Rj7tQWJlOulZCH
	swPUulY/rE3d6CU5HFyvKP9mUXscAAIKDIVXQO7Ntl3SwbJYTDRwY2+TOw5++B726/q3
	ACq3lYJDVnvY/HDkW6dikiyYr5P8cpbXG15PxEbynEJG+YqzZth2ho17pMCVRRpdOmsI
	4hVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CjH7qvPqEEZUwBKS495BahMjn6Jl2wwZixxacKwBAag=;
	b=BbgNSEdUHmx1WIqhyvKxJqHUi0uG+afoKHHUCr3BhxiX+S6xa3OLFmDyTcAOVLdUa4
	x8I3g7evJmKmzMhRTIL1Dyznz9r+dKiOPSn2JtZ6df7v9nqaR/dj3qaxcKuHTqiFzf2J
	/Eb673miWOlFxjU0OOYj2Rj03KMwtGHnrROk8Nqz6ZOkY6GINfiei6Pzs0EBOoSEpcMF
	btdwoMpuDEc59VTWq/LteREUks+CVSJik9vhtgH5pgT5dui8+DUUe3GKuiowhPDmDiTt
	Z9E+Rl5zVeFn486dnMDiu53MSDuPRJ/L6e93bsATKxWRND/KwHovVMM0+oDNJEipT3oi
	Ojjw==
X-Gm-Message-State: AIkVDXL+TP5h+GDuYVb8bXWPrm5bBcJKvAM6BvvvmlRshMtoC2rvgt4FNqRkeP3XiJotXXXI567Im1FW64iQZg==
X-Received: by 10.237.38.33 with SMTP id z30mr58409797qtc.285.1483587308177;
	Wed, 04 Jan 2017 19:35:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Wed, 4 Jan 2017 19:35:07 -0800 (PST)
In-Reply-To: <20170103180232.22291-1-adrian.ratiu@ni.com>
References: <20170103180232.22291-1-adrian.ratiu@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Jan 2017 22:35:07 -0500
Message-ID: <CADkTA4MY+8WYfUfuTQs3TMjjNhTKSWGuox+vjRmXWZJaEpWZag@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v3] meta-openstack: add new python-avahi recipe
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
X-List-Received-Date: Thu, 05 Jan 2017 03:35:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c12293c7f53e805455096c6

--94eb2c12293c7f53e805455096c6
Content-Type: text/plain; charset=UTF-8

v3 merged.

Bruce

On Tue, Jan 3, 2017 at 1:02 PM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> OE-core commit 36e9ed89950 ("avahi-ui: remove support for building a python
> module") removed the python avahi bindings because nothing in OE-core used
> them. These bindings are very useful however when configuring targets from
> salt using the zeroconf protocol.
>
> An added benefit of having a python-avahi recipe separate from avahi-ui is
> that we don't need X11 in DISTRO_FEATURES anymore to use python-avahi, it's
> just two simple python files, there was no need for all that complexity in
> avahi-ui in the first place to get the python avahi bindings.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../recipes-devtools/python/python-avahi_0.6.32.bb | 34
> ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-avahi_
> 0.6.32.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
> b/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
> new file mode 100644
> index 0000000..c129337
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Python bindings for the avahi zeroconf client"
> +HOMEPAGE = "https://github.com/lathiat/avahi"
> +SECTION = "devel/python"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}
> /avahi-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
> +SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d75
> 75b60f5818a772e28fa0e18b98bc1db454"
> +
> +S = "${WORKDIR}/avahi-${PV}"
> +
> +inherit python-dir pythonnative
> +
> +# we only need the python bindings
> +do_install () {
> +       install -d ${D}${PYTHON_SITEPACKAGES_DIR}/avahi
> +
> +       sed -i'' -e "s,@PYTHON\@,${bindir}/python,g" \
> +               ${S}/avahi-python/avahi/__init__.py  \
> +               ${S}/avahi-python/avahi-bookmarks.in
> +
> +       install -m 0775 ${S}/avahi-python/avahi/__init__.py \
> +               ${D}${PYTHON_SITEPACKAGES_DIR}/avahi/__init__.py
> +
> +       install -m 0775 ${S}/avahi-python/avahi-bookmarks.in \
> +               ${D}${PYTHON_SITEPACKAGES_DIR}/avahi/avahi-bookmarks
> +}
> +
> +RDEPENDS_${PN} += "python-core python-dbus"
> +
> +FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/avahi"
> --
> 2.11.0
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c12293c7f53e805455096c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v3 merged.<div><br></div><div>Bruce</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jan 3, 2017 at 1:02=
 PM, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.ratiu=
@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span class=3D"">OE-core commit 36e9ed89950 (&q=
uot;avahi-ui: remove support for building a python<br>
module&quot;) removed the python avahi bindings because nothing in OE-core =
used<br>
them. These bindings are very useful however when configuring targets from<=
br>
salt using the zeroconf protocol.<br>
<br>
An added benefit of having a python-avahi recipe separate from avahi-ui is<=
br>
that we don&#39;t need X11 in DISTRO_FEATURES anymore to use python-avahi, =
it&#39;s<br>
just two simple python files, there was no need for all that complexity in<=
br>
avahi-ui in the first place to get the python avahi bindings.<br>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
>adrian.ratiu@ni.com</a>&gt;<br>
---<br>
</span>=C2=A0.../recipes-devtools/python/<a href=3D"http://python-avahi_0.6=
.32.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-avahi_0.6.32.bb</a=
> | 34 ++++++++++++++++++++++<br>
=C2=A01 file changed, 34 insertions(+)<br>
<span class=3D"">=C2=A0create mode 100644 meta-openstack/recipes-<wbr>devto=
ols/python/<a href=3D"http://python-avahi_0.6.32.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python-avahi_<wbr>0.6.32.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-avahi_0.6.32.bb" rel=3D"noreferrer" target=3D"_blank">python-avahi_<=
wbr>0.6.32.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"=
http://python-avahi_0.6.32.bb" rel=3D"noreferrer" target=3D"_blank">python-=
avahi_<wbr>0.6.32.bb</a><br>
new file mode 100644<br>
</span>index 0000000..c129337<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
avahi_0.6.32.bb" rel=3D"noreferrer" target=3D"_blank">python-avahi_<wbr>0.6=
.32.bb</a><br>
@@ -0,0 +1,34 @@<br>
<span class=3D"">+SUMMARY =3D &quot;Python bindings for the avahi zeroconf =
client&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/lathiat/avahi" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/lathiat/<wbr>avahi</a>&quot;<=
br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>2d5025d4aa3495befef8f=
17206a5b0<wbr>a1&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/lathiat/avahi/releases/dow=
nload/v${PV}/avahi-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/lathiat/<wbr>avahi/releases/download/v${PV}<wbr>/avahi-${PV}.=
tar.gz</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>22b5e705d3eabb31d26f2e1e7b0740<wbr>13&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>d54991185d514a0aba54ebeb408d75<wbr>75b60=
f5818a772e28fa0e18b98bc1d<wbr>b454&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/avahi-${PV}&quot;<br>
+<br>
+inherit python-dir pythonnative<br>
+<br>
+# we only need the python bindings<br>
+do_install () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PYTHON_SITEPACKAGES_DIR}<wbr>/=
avahi<br>
+<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i&#39;&#39; -e &quot;s,@PYTHON\@,${=
bindir}/python,<wbr>g&quot; \<br>
<div class=3D"HOEnZb"><div class=3D"h5">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0${S}/avahi-python/avahi/__<wbr>init__.py=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/avahi-python/<=
a href=3D"http://avahi-bookmarks.in" rel=3D"noreferrer" target=3D"_blank">a=
vahi-<wbr>bookmarks.in</a><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0775 ${S}/avahi-python/avahi/__<wbr>=
init__.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${PYTHON_SITEPA=
CKAGES_DIR}<wbr>/avahi/__init__.py<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0775 ${S}/avahi-python/<a href=3D"ht=
tp://avahi-bookmarks.in" rel=3D"noreferrer" target=3D"_blank">avahi-<wbr>bo=
okmarks.in</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${PYTHON_SITEPA=
CKAGES_DIR}<wbr>/avahi/avahi-bookmarks<br>
+}<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;python-core python-dbus&quot;<br>
+<br>
+FILES_${PN} =3D &quot;${PYTHON_SITEPACKAGES_DIR}/<wbr>avahi&quot;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c12293c7f53e805455096c6--
