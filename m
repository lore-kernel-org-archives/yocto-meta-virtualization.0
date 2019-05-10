Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46202E00D53; Fri, 10 May 2019 13:43:51 -0700 (PDT)
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
	*      [209.85.167.44 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48215E00C78
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 13:43:50 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id v18so5078782lfi.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 13:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yRj3x7gcDEByvhvGHp0dueqSp/su816UVH8WW9+xaBw=;
	b=RN3Mp1j5rgFU0RxrPTNKC2xMCZ1fCvm5OtOLZPcru3fPF722uhJzTE4HZCm/yybytV
	pdaTFInCJaRlmp0bds6cOLeHM9xlbmwLB79gfLbL7svmWGGhxRyn6VidC9l83Fp3g7uQ
	tAhvqUnmvgkXCj274fXV+Jp4dpP/miN6hrwh33iZfhPDXd0dK5zEA6GoYMgAuzgKJn6l
	a9k4EHEyBrutsRAxdBOUCRI9xiXBnIWX/UKZ77WkWYPihjgjAnln0UQPq59N1ioAk9N9
	qVZeFVVAlKJkoiQWUSFFiLZ3CQlHOHctjO+g6ozrYrN2HYWDErpsjmA1pck2a9R94esh
	v0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yRj3x7gcDEByvhvGHp0dueqSp/su816UVH8WW9+xaBw=;
	b=DzLIBE6xWg9DIaPcVMzTsPGSxHXNiZWb34T59RjJEz7IOen1+NVMS70w5Xyc3viBQ2
	xnqTeXeL0JYkaCo2AaF63Nv9//OWhN45K0qBfjVkrNZtAWxQQORKxFUBlhUgqI0E+KWJ
	tJj9M5z9vFQg4uzKQdb52+uW6/xvU4/zhhQJ4WbfSVVajOIhSXbPSb1gYEa3aufMzrcI
	BiTViuY5YCX3BKIi19ft5eKrzfuElMD43+C1/q7OT4/nyndDbd0temCz5CVJz/HSmQ4E
	AbKv0WM0tiiyYM2urjFnlTkzPHz3c5tlrfu4oArIaOF+xj2Nq73NRTNqX1b6HeDvfImL
	aopg==
X-Gm-Message-State: APjAAAUZ2AcM3wpCYbNuECfwmqHdkkfySeVs6j8kH3WBOOGtF8kNK3EM
	7K91CMlow0I7YXJWeqkSVYWULPw97ZYcfbsF/2s=
X-Google-Smtp-Source: APXvYqwR71smnAunzrijmvw0fBvoTCzANJG157QJ9H+dhPtuU2qEv6GAULd7/0gpsBJpKRAYZHvWr9Tp0z7yp/S+VDk=
X-Received: by 2002:a19:520e:: with SMTP id m14mr7315704lfb.65.1557521029218; 
	Fri, 10 May 2019 13:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <1555729914-11620-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1555729914-11620-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 May 2019 16:43:38 -0400
Message-ID: <CADkTA4PYEJzdmGKS8ym1av9Y618qA+g6mJjRiG_brwJPunJs0g@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] python-croniter:update to 0.3.30.
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
X-List-Received-Date: Fri, 10 May 2019 20:43:51 -0000
Content-Type: multipart/alternative; boundary="000000000000ad479d05888e9f93"

--000000000000ad479d05888e9f93
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, May 10, 2019 at 1:42 AM Lei Maohui <leimaohui@cn.fujitsu.com> wrote:

> - 0.3.27 can't be download any more.
> - Changed license checksum file to docs/LICENSE which is better than
> PKG-INFO.
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../python/{python-croniter_0.3.27.bb => python-croniter_0.3.30.bb} | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-croniter_0.3.27.bb
> => python-croniter_0.3.30.bb} (68%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-croniter_0.3.27.bb b/meta-openstack/recipes-devtools/python/
> python-croniter_0.3.30.bb
> similarity index 68%
> rename from meta-openstack/recipes-devtools/python/
> python-croniter_0.3.27.bb
> rename to meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
> index 97df2a9..2859441 100644
> --- a/meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb
> +++ b/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
> @@ -2,13 +2,13 @@ DESCRIPTION = "croniter provides iteration for datetime
> object with cron like fo
>  HOMEPAGE = "https://pypi.python.org/pypi/croniter/0.3.4"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=21cc5101d5b0c940e3354fb1bd26c7e5"
> +LIC_FILES_CHKSUM =
> "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>
>  # Archived version so we have to overwrite what the pypi class will derive
>  PYPI_SRC_URI = "
> https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "f5543f9f165fe725b2133b698f520380"
> -SRC_URI[sha256sum] =
> "fbd72189a0ff38c27e953d15175c5fedafb953479559240a1afcf8e8e7523757"
> +SRC_URI[md5sum] = "e4a8987521b144c4c2149d4adde8f55c"
> +SRC_URI[sha256sum] =
> "538adeb3a7f7816c3cdec6db974c441620d764c25ff4ed0146ee7296b8a50590"
>
>  inherit setuptools pypi
>
> --
> 2.7.4
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

--000000000000ad479d05888e9f93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Ma=
y 10, 2019 at 1:42 AM Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu=
.com">leimaohui@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">- 0.3.27 can&#39;t be download any more.<br>
- Changed license checksum file to docs/LICENSE which is better than PKG-IN=
FO.<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com" t=
arget=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-croniter_0.3.27.bb" rel=3D"noref=
errer" target=3D"_blank">python-croniter_0.3.27.bb</a> =3D&gt; <a href=3D"h=
ttp://python-croniter_0.3.30.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-croniter_0.3.30.bb</a>} | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-croniter_0.3.27.bb" rel=3D"noreferrer" target=3D"_blank">python-croniter=
_0.3.27.bb</a> =3D&gt; <a href=3D"http://python-croniter_0.3.30.bb" rel=3D"=
noreferrer" target=3D"_blank">python-croniter_0.3.30.bb</a>} (68%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-croniter_0.3.27.bb" rel=3D"noreferrer" target=3D"_blank">python-croniter_=
0.3.27.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://py=
thon-croniter_0.3.30.bb" rel=3D"noreferrer" target=3D"_blank">python-cronit=
er_0.3.30.bb</a><br>
similarity index 68%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-croniter_0.3.27.bb" rel=3D"noreferrer" target=3D"_blank">python-croniter_0=
.3.27.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-c=
roniter_0.3.30.bb" rel=3D"noreferrer" target=3D"_blank">python-croniter_0.3=
.30.bb</a><br>
index 97df2a9..2859441 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-croni=
ter_0.3.27.bb" rel=3D"noreferrer" target=3D"_blank">python-croniter_0.3.27.=
bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-croni=
ter_0.3.30.bb" rel=3D"noreferrer" target=3D"_blank">python-croniter_0.3.30.=
bb</a><br>
@@ -2,13 +2,13 @@ DESCRIPTION =3D &quot;croniter provides iteration for dat=
etime object with cron like fo<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/croniter/0=
.3.4" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/cro=
niter/0.3.4</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D21cc5101d5b0c940e3354fb1b=
d26c7e5&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://docs/LICENSE;md5=3Db8ee59850b882cbf62318=
8489ea748e2&quot;<br>
<br>
=C2=A0# Archived version so we have to overwrite what the pypi class will d=
erive<br>
=C2=A0PYPI_SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/so=
urce/c/croniter/croniter-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.=
gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;f5543f9f165fe725b2133b698f520380&quot;<br>
-SRC_URI[sha256sum] =3D &quot;fbd72189a0ff38c27e953d15175c5fedafb9534795592=
40a1afcf8e8e7523757&quot;<br>
+SRC_URI[md5sum] =3D &quot;e4a8987521b144c4c2149d4adde8f55c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;538adeb3a7f7816c3cdec6db974c441620d764c25ff4e=
d0146ee7296b8a50590&quot;<br>
<br>
=C2=A0inherit setuptools pypi<br>
<br>
-- <br>
2.7.4<br>
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

--000000000000ad479d05888e9f93--
