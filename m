Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98A19E00E0D; Mon, 12 Aug 2019 08:00:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.45 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD7CCE00D8F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:00:00 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id b17so74438605lff.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XSACd/2zhj4zRdleFpE06PEmYIIKW5Qo9JbCvgBpsE4=;
	b=PjMwlWkBjGh9mfo8231CLRvEUJ/A/BxKQVC+3sJF2FgCzxhVLowIbKRZj/dO1Ifbu9
	zWv3o8DQa+aqXunt2/jJQmtxpOEaZI2aSV6yaiNMo7NMle457Mk01NC1DENdnGasfXmp
	ryvEu0RAMxyKnqePTpLJX5rkmO44xqzHDcoRzeWuiu5PPf914xt2AfytJZyKfvrvoajd
	PKohPD7GoW7WdI1uCqEobOpLxtOIMawpm/sc0v6E8mPWmAaR44RxWq7HqTs06JKAF127
	l9OUmsNrTzeFqt/eCfhZZyFI3GnGHIGAtVKqCkfq5yCzf6iOuuU8EDxF9k9TB7cvv5Qt
	UgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XSACd/2zhj4zRdleFpE06PEmYIIKW5Qo9JbCvgBpsE4=;
	b=P+ShgFg4WQ/fquK0BBbTL9O9KKAJ5EliLPinqn4vlkzaG3aYn3daDtUcEB/wljVhaT
	2kdkMgV8Qm96BJ9kl4Ql+LoHfTvxusOvQr4IzN1/tk8StCstx6E2VmFbWzWG9aN4hjWq
	xeNGK+9JvdQg7/8AaXgRJC2X0IXM6mR3qmiDvDWspUDn9tq22dmEa75Csk5fFUJP78lI
	UVrZ2zp0A6l0jHj+96UxdRffkFpBRxscruLpNjKy91kzTAZ0lNhMOgZlVao862ptbSzs
	flNQcZU7SV5GJeE0GpoBimny8i0pJ1HWuEHrynRefdtvvok+wmntpaPl7EfPiUxDlhKL
	hifg==
X-Gm-Message-State: APjAAAVmq6+qL1VTccXmioLg9eBnRh6D8m3u/T40UTFWpvvfzQvfy7bi
	L4/e+vAQ9tTKSmZe55NS2FbXlHDmOoUN33v0HWAmx6fgAAM=
X-Google-Smtp-Source: APXvYqwxAC+QvjIyWpVuGcOLnZtj+y6QZmCLDXbq9gQ9p95YICulOFP/RL7ln/GR+ZWlrxHL8EPMuPCUfGNmwclHOAg=
X-Received: by 2002:a19:110:: with SMTP id 16mr20483982lfb.63.1565621999676;
	Mon, 12 Aug 2019 07:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <1565599728-79421-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565599728-79421-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 10:59:47 -0400
Message-ID: <CADkTA4P1HFRd3MGe7kwfLLk-JUFA9mrtdq2CeBgBoGmsCmjmNg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-oslo.utils: Add python3 version
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
X-List-Received-Date: Mon, 12 Aug 2019 15:00:03 -0000
Content-Type: multipart/alternative; boundary="00000000000024b1a5058fecc7bb"

--00000000000024b1a5058fecc7bb
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 12, 2019 at 4:55 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Providing a python3 version of python-oslo.utils.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-oslo.utils.inc              | 41 +++++++++++++++++++
>  .../python/python-oslo.utils_git.bb           | 41 +------------------
>  .../python/python3-oslo.utils_git.bb          |  2 +
>  3 files changed, 44 insertions(+), 40 deletions(-)
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-oslo.utils.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python3-oslo.utils_git.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
> b/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
> new file mode 100644
> index 0000000..04aa24a
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.utils.inc
> @@ -0,0 +1,41 @@
> +DESCRIPTION = "Oslo utils"
> +HOMEPAGE = "https://launchpad.net/oslo"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> +
> +SRCNAME = "oslo.utils"
> +SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike
> <http://github.com/openstack/$%7BSRCNAME%7D.git;branch=stable/pike>"
> +
> +PV = "3.28.0+git${SRCPV}"
> +SRCREV = "8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c"
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        ${PYTHON_PN}-pbr \
> +        "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        ${PYTHON_PN}-pbr-native \
> +        "
> +
> +# RDEPENDS_default:
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-pbr \
> +        ${PYTHON_PN}-six \
> +        ${PYTHON_PN}-iso8601 \
> +        ${PYTHON_PN}-oslo.i18n \
> +        ${PYTHON_PN}-monotonic \
> +        ${PYTHON_PN}-pytz \
> +        ${PYTHON_PN}-netaddr \
> +        ${PYTHON_PN}-netifaces \
> +        ${PYTHON_PN}-debtcollector \
> +        ${PYTHON_PN}-funcsigs \
> +        ${PYTHON_PN}-pyparsing \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/
> python-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/
> python-oslo.utils_git.bb
> index e73bf53..fea3c85 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
> @@ -1,41 +1,2 @@
> -DESCRIPTION = "Oslo utils"
> -HOMEPAGE = "https://launchpad.net/oslo"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> -
> -SRCNAME = "oslo.utils"
> -SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike
> <http://github.com/openstack/$%7BSRCNAME%7D.git;branch=stable/pike>"
> -
> -PV = "3.28.0+git${SRCPV}"
> -SRCREV = "8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c"
> -S = "${WORKDIR}/git"
> -
>  inherit setuptools
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -# RDEPENDS_default:
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-six \
> -        python-iso8601 \
> -        python-oslo.i18n \
> -        python-monotonic \
> -        python-pytz \
> -        python-netaddr \
> -        python-netifaces \
> -        python-debtcollector \
> -        python-funcsigs \
> -        python-pyparsing \
> -        "
> +require python-oslo.utils.inc
> diff --git a/meta-openstack/recipes-devtools/python/
> python3-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/
> python3-oslo.utils_git.bb
> new file mode 100644
> index 0000000..3b4636a
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-oslo.utils_git.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-oslo.utils.inc
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000024b1a5058fecc7bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Au=
g 12, 2019 at 4:55 AM Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fu=
jitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Providing a python3 version of python=
-oslo.utils.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/python-oslo.utils.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 41 +++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-oslo.utils_git.bb" rel=3D"norefer=
rer" target=3D"_blank">python-oslo.utils_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 41 +------------------<br>
=C2=A0.../python/<a href=3D"http://python3-oslo.utils_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-oslo.utils_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A03 files changed, 44 insertions(+), 40 deletions(-)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-oslo=
.utils.inc<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python3-oslo.utils_git.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-oslo.utils_git.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils.inc b=
/meta-openstack/recipes-devtools/python/python-oslo.utils.inc<br>
new file mode 100644<br>
index 0000000..04aa24a<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/python-oslo.utils.inc<br>
@@ -0,0 +1,41 @@<br>
+DESCRIPTION =3D &quot;Oslo utils&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://launchpad.net/oslo" rel=3D"noreferre=
r" target=3D"_blank">https://launchpad.net/oslo</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D34400b68072d710fecd0a2940a=
0d1658&quot;<br>
+<br>
+SRCNAME =3D &quot;oslo.utils&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/openstack/$%7BSRCNAME=
%7D.git;branch=3Dstable/pike" rel=3D"noreferrer" target=3D"_blank">github.c=
om/openstack/${SRCNAME}.git;branch=3Dstable/pike</a>&quot;<br>
+<br>
+PV =3D &quot;3.28.0+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit setuptools<br>
+<br>
+# DEPENDS_default: python-pip<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pip \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pbr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+# Satisfy setup.py &#39;setup_requires&#39;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pbr-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+# RDEPENDS_default: <br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pbr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-iso8601 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-oslo.i18n \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-monotonic \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pytz \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-netaddr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-netifaces \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-debtcollector \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-funcsigs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pyparsing \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-oslo.utils_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.utils=
_git.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-oslo.utils_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.util=
s_git.bb</a><br>
index e73bf53..fea3c85 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-oslo.=
utils_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.utils_git.bb=
</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-oslo.=
utils_git.bb" rel=3D"noreferrer" target=3D"_blank">python-oslo.utils_git.bb=
</a><br>
@@ -1,41 +1,2 @@<br>
-DESCRIPTION =3D &quot;Oslo utils&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://launchpad.net/oslo" rel=3D"noreferre=
r" target=3D"_blank">https://launchpad.net/oslo</a>&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D34400b68072d710fecd0a2940a=
0d1658&quot;<br>
-<br>
-SRCNAME =3D &quot;oslo.utils&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/openstack/$%7BSRCNAME=
%7D.git;branch=3Dstable/pike" rel=3D"noreferrer" target=3D"_blank">github.c=
om/openstack/${SRCNAME}.git;branch=3Dstable/pike</a>&quot;<br>
-<br>
-PV =3D &quot;3.28.0+git${SRCPV}&quot;<br>
-SRCREV =3D &quot;8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c&quot;<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
=C2=A0inherit setuptools<br>
-<br>
-# DEPENDS_default: python-pip<br>
-<br>
-DEPENDS +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pip \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-# Satisfy setup.py &#39;setup_requires&#39;<br>
-DEPENDS +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr-native \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-# RDEPENDS_default: <br>
-RDEPENDS_${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-six \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-iso8601 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-oslo.i18n \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-monotonic \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pytz \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-netaddr \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-netifaces \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-debtcollector \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-funcsigs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pyparsing \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+require python-oslo.utils.inc<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n3-oslo.utils_git.bb" rel=3D"noreferrer" target=3D"_blank">python3-oslo.uti=
ls_git.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://py=
thon3-oslo.utils_git.bb" rel=3D"noreferrer" target=3D"_blank">python3-oslo.=
utils_git.bb</a><br>
new file mode 100644<br>
index 0000000..3b4636a<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-oslo=
.utils_git.bb" rel=3D"noreferrer" target=3D"_blank">python3-oslo.utils_git.=
bb</a><br>
@@ -0,0 +1,2 @@<br>
+inherit setuptools3<br>
+require python-oslo.utils.inc<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--00000000000024b1a5058fecc7bb--
