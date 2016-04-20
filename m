Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FF1AE00ED3; Wed, 20 Apr 2016 13:46:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.218.48 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EF05E007D2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Apr 2016 13:46:18 -0700 (PDT)
Received: by mail-oi0-f48.google.com with SMTP id p188so61794123oih.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Apr 2016 13:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ZvyonNRtoe86RjI8u8pG4ukuuUKlP13r7r+7sZ21H/w=;
	b=xCyKsdN4JXMBBDk20OTAnqVPZq1Rv5ifygTFobxpZQdHlZTHU3Lbo1yoaAWa/JLWS7
	UVe1jBlxEM+ukImoeWw/VttwMat/A+La0jfuexvSjIBeaLpGA/MPpi7JeaeibitmJr5s
	y7eSbjC/bJil94F2M6wV90m8vIeLixRooAiBWQfIoQWGMeJI0CDerlI76h/ipCCuhnNE
	rfPJk9+0weSu503X/kO8ewiyH1uMZpZbVvmlS/V1IM+0zT9lBlHke42V2NLLHZs/QkO1
	2GbvHU8tJEPLDX1PKF2M97WtyzMaGDdo601zlPjEv2KCIuGzIk/dp5eZtympGRk2q03F
	R0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ZvyonNRtoe86RjI8u8pG4ukuuUKlP13r7r+7sZ21H/w=;
	b=DjD/45VmD5GUDhYXM2I0lOVaMEx1MtQRLqIDbC+F7lHUf771UCYlntOIuHTEPanJCg
	GscpZ79WGDhDK7HtUKOT4GIaw7ev5cKgm1OGOcwTyYKbqY+SAUAjfYYiwTNsWFBmDEOg
	WxjtmUG5iRfVq70p6iY46sNmN8potlcdirenO4I2AqfpI9aAJ96MJ2/U9cU6vPQeYEOX
	dnbCGSVEFZ94OT+2BZt5i9R7tEz0QHsp4ZVnBXQKNLOvfw9uMgt3Nr4FHc42PGcFvyCg
	JpHSynA01VKvNkQ6LpFp3LX51Ip2bSg0l7ir1C5rR5w38GfuZN/87RziwRq1Tx4BRko5
	qosg==
X-Gm-Message-State: AOPr4FW1FwrAbCW2D0unaR7yA6JWPBDO52FFziKsyQ4035CKP0bv9TDgtqMzR0bVdE9ThzaqabALtaTjxysY2A==
MIME-Version: 1.0
X-Received: by 10.182.98.167 with SMTP id ej7mr5039945obb.46.1461185177540;
	Wed, 20 Apr 2016 13:46:17 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 20 Apr 2016 13:46:17 -0700 (PDT)
In-Reply-To: <1461040499-31037-1-git-send-email-zhe.he@windriver.com>
References: <1461040499-31037-1-git-send-email-zhe.he@windriver.com>
Date: Wed, 20 Apr 2016 16:46:17 -0400
Message-ID: <CADkTA4NNhbVTtqMrsk+EXDgYESh6be2Z8mk14iiYEDk51O=4Mw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: ptest: Fix python path
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
X-List-Received-Date: Wed, 20 Apr 2016 20:46:21 -0000
Content-Type: multipart/alternative; boundary=047d7b2e41ec755fe50530f0affe

--047d7b2e41ec755fe50530f0affe
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Apr 19, 2016 at 12:34 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> Set PYTHON to TARGET_PYTHON for running on target
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../openvswitch-ptest-Fix-python-path.patch        | 30
> ++++++++++++++++++++++
>  recipes-networking/openvswitch/openvswitch_git.bb  |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644
> recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch
>
> diff --git
> a/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch
> b/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch
> new file mode 100644
> index 0000000..c75ebc5
> --- /dev/null
> +++
> b/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-python-path.patch
> @@ -0,0 +1,30 @@
> +From 2a78bddb865e0d3377f437428ed6825195af0a14 Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Wed, 13 Apr 2016 03:13:01 -0400
> +Subject: [PATCH] openvswitch: ptest: Fix python path
> +
> +For now PYTHON just happens to be the same as TARGET_PYTHON so we get the
> right
> +python binary. This patch sets PYTHON to TARGET_PYTHON since ptest is
> going to
> +be run on target.
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + tests/atlocal.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/atlocal.in b/tests/atlocal.in
> +index 5815c6c..db2d2c9 100644
> +--- a/tests/atlocal.in
> ++++ b/tests/atlocal.in
> +@@ -5,7 +5,7 @@ EGREP='@EGREP@'
> + PERL='@PERL@'
> +
> + if test x"$PYTHON" = x; then
> +-    PYTHON='@PYTHON@'
> ++    PYTHON='@TARGET_PYTHON@'
> + fi
> +
> + PYTHONPATH=$abs_top_srcdir/python:$abs_top_builddir/tests:$PYTHONPATH
> +--
> +1.9.1
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index 2f7fe3e..b46d5af 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -24,6 +24,7 @@ SRC_URI += "\
>         file://run-ptest \
>         file://disable_m4_check.patch \
>         file://kernel_module.patch \
> +       file://openvswitch-ptest-Fix-python-path.patch \
>         "
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=247d8817aece26b21a8cd6791b3ea994"
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

--047d7b2e41ec755fe50530f0affe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Apr 19, 2016 at 12:34 A=
M,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@=
windriver.com</a>&gt;<br>
<br>
Set PYTHON to TARGET_PYTHON for running on target<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0.../openvswitch-ptest-Fix-python-path.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 30 ++++++++++++++++++++++<br>
=C2=A0recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a>=C2=A0 |=C2=A0 1=
 +<br>
=C2=A02 files changed, 31 insertions(+)<br>
=C2=A0create mode 100644 recipes-networking/openvswitch/openvswitch-git/ope=
nvswitch-ptest-Fix-python-path.patch<br>
<br>
diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-pte=
st-Fix-python-path.patch b/recipes-networking/openvswitch/openvswitch-git/o=
penvswitch-ptest-Fix-python-path.patch<br>
new file mode 100644<br>
index 0000000..c75ebc5<br>
--- /dev/null<br>
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-ptest-Fix-=
python-path.patch<br>
@@ -0,0 +1,30 @@<br>
+From 2a78bddb865e0d3377f437428ed6825195af0a14 Mon Sep 17 00:00:00 2001<br>
+From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.=
com</a>&gt;<br>
+Date: Wed, 13 Apr 2016 03:13:01 -0400<br>
+Subject: [PATCH] openvswitch: ptest: Fix python path<br>
+<br>
+For now PYTHON just happens to be the same as TARGET_PYTHON so we get the =
right<br>
+python binary. This patch sets PYTHON to TARGET_PYTHON since ptest is goin=
g to<br>
+be run on target.<br>
+<br>
+Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
+---<br>
+ tests/<a href=3D"http://atlocal.in" rel=3D"noreferrer" target=3D"_blank">=
atlocal.in</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/tests/<a href=3D"http://atlocal.in" rel=3D"noreferrer" target=
=3D"_blank">atlocal.in</a> b/tests/<a href=3D"http://atlocal.in" rel=3D"nor=
eferrer" target=3D"_blank">atlocal.in</a><br>
+index 5815c6c..db2d2c9 100644<br>
+--- a/tests/<a href=3D"http://atlocal.in" rel=3D"noreferrer" target=3D"_bl=
ank">atlocal.in</a><br>
++++ b/tests/<a href=3D"http://atlocal.in" rel=3D"noreferrer" target=3D"_bl=
ank">atlocal.in</a><br>
+@@ -5,7 +5,7 @@ EGREP=3D&#39;@EGREP@&#39;<br>
+ PERL=3D&#39;@PERL@&#39;<br>
+<br>
+ if test x&quot;$PYTHON&quot; =3D x; then<br>
+-=C2=A0 =C2=A0 PYTHON=3D&#39;@PYTHON@&#39;<br>
++=C2=A0 =C2=A0 PYTHON=3D&#39;@TARGET_PYTHON@&#39;<br>
+ fi<br>
+<br>
+ PYTHONPATH=3D$abs_top_srcdir/python:$abs_top_builddir/tests:$PYTHONPATH<b=
r>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/recipe=
s-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" rel=3D"noref=
errer" target=3D"_blank">openvswitch_git.bb</a><br>
index 2f7fe3e..b46d5af 100644<br>
--- a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -24,6 +24,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_m4_check.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://kernel_module.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-ptest-Fix-python-path.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D247d8817aece26b21a8cd=
6791b3ea994&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--047d7b2e41ec755fe50530f0affe--
