Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDCF8E00A4C; Fri, 20 Jan 2017 06:00:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.181 listed in list.dnswl.org]
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E2D8E00A37
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 06:00:40 -0800 (PST)
Received: by mail-yb0-f181.google.com with SMTP id 123so54496013ybe.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 06:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EC2XJDLCtvY4NDfA/SvIKlYVgpmwcS9895jU/G4wASA=;
	b=UjYPYZQCk7JmMXrH/QThfNnIiYbBBNXM4BxXlFjFmhBXsMAq5BVXjle8OBBZTJmu2J
	GtrM9N8MiFqHUPrElrPvzAzgVePl4wKmi0bYseMBqAO2b4236FIo1/yHTOBJjpL3z+fY
	iTLgIhR0gmHWaDVD99xHO3dioHBxyXWA+g79lv4svbNRgDZDMHCAxt77GmBm04W4VY6T
	Rj7lvfl95KQP4Y7KhMZ0ZH2KC0HNuRgeY74QPOa7VeZue+NWHSe5e/weSuqw3zTMELYq
	vJkDauVgL5249rXpj7NJJ8EEHX8H3J3kQ1jQ1q0ZPbFqMM1T97NWaBbf8aKVT7n9z4vb
	7oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EC2XJDLCtvY4NDfA/SvIKlYVgpmwcS9895jU/G4wASA=;
	b=VXemX9rRrnNvq/cQ/Cm4vtm1MPaOC1grwWYOt6EsZ+/keMv9Fur4zey2x/o3JCxBfh
	Ca4b5GEcVZr/qISXsb9qEABZThAd3WteWnWojbsa0Guqx5rKBfipZRiYgXayQgVYaxYK
	qumnOZJYnpS5IE6dbLPwqJk2mfhQ0s1S1b1GL2bUjTB5Hz/3euOjul9kad2M0zp1M85M
	Tr8M3iO7D5rxg3jxwz5792SjLXWTChbpDJScRIpSWx8GbH9bFOlxj/kZsu+cBKllekO2
	QLVrbmmh4oOJJFWsVrFV9IrG7OEjt5v/XS3gERKaftKrVr9E/uEy87sUQ8hWHwXOU266
	Re5w==
X-Gm-Message-State: AIkVDXKUOjWyeR5dWhx2fsFKwnbqDkP+Z2Q0a6s/KzDGw4iF4VZ9PevxKFQwKl2H53AM2ltsZqWAAlHBs1nMIw==
X-Received: by 10.55.68.74 with SMTP id r71mr5323307qka.157.1484920837278;
	Fri, 20 Jan 2017 06:00:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 20 Jan 2017 06:00:36 -0800 (PST)
In-Reply-To: <1484880927-765-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1484880927-765-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Jan 2017 09:00:36 -0500
Message-ID: <CADkTA4N69+a_tz2WXtsB4bFbRTPickAJ_KqxGuOZjVR1r0dO2g@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-mox3: 0.9.0 -> 0.20.0
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
X-List-Received-Date: Fri, 20 Jan 2017 14:00:47 -0000
Content-Type: multipart/alternative; boundary=001a11488c9406939c054687132e

--001a11488c9406939c054687132e
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Jan 19, 2017 at 9:55 PM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> Upgrade python-mox3 from 0.9.0 to 0.20.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-mox3_0.9.0.bb => python-mox3_0.20.0.bb}          | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-mox3_0.9.0.bb =>
> python-mox3_0.20.0.bb} (64%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
> b/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> similarity index 64%
> rename from meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
> rename to meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> index 7eb948e..893978b 100644
> --- a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mox3_0.20.0.bb
> @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=
> 3b83ef96387f14655fc854ddc3c6bd57"
>  PR = "r0"
>
>  SRCNAME = "mox3"
> -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/d8/a8/
> 64e78823c52d719181100e9e01dd3485a6e064e79e402089ba4e33cfaed6
> /${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "7574eabaa0f1d8f83289f33aaf2c4884"
> -SRC_URI[sha256sum] = "8469f35690077f888fbb49a7e31251
> de9f78bd319ebd4e1af0bbb1349c1ad1be"
> +SRC_URI[md5sum] = "53be7bf2d109c8bdf477c75b369773b8"
> +SRC_URI[sha256sum] = "7b1549222353f6cc5b705734ef186f
> e2cc323d30c3987df50eceb77273595606"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
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
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11488c9406939c054687132e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Thu, Jan 19, 2017 at 9:55 PM, H=
uang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.c=
om" target=3D"_blank">huangqy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Upgrade python-mox3 from 0.9.0 to 0.20.0.<br=
>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-mox3_0.9.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python-mox3_0.9.0.<wbr>bb</a> =3D&gt; <a href=3D"http:/=
/python-mox3_0.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python-mox3_0.=
20.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-<wbr>devtools/python/{<a href=3D"http:/=
/python-mox3_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python-mox3_<wb=
r>0.9.0.bb</a> =3D&gt; <a href=3D"http://python-mox3_0.20.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python-mox3_0.20.0.bb</a>} (64%)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-mox3_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python-mox3_0.<w=
br>9.0.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http=
://python-mox3_0.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python-mox3_=
0.<wbr>20.0.bb</a><br>
similarity index 64%<br>
rename from meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://p=
ython-mox3_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python-mox3_0.<wb=
r>9.0.bb</a><br>
rename to meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://pyt=
hon-mox3_0.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python-mox3_0.<wbr=
>20.0.bb</a><br>
index 7eb948e..893978b 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
mox3_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">python-mox3_0.<wbr>9.0.=
bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
mox3_0.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python-mox3_0.<wbr>20.=
0.bb</a><br>
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3D<wbr>=
3b83ef96387f14655fc854ddc3c6bd<wbr>57&quot;<br>
=C2=A0PR =3D &quot;r0&quot;<br>
<br>
=C2=A0SRCNAME =3D &quot;mox3&quot;<br>
-SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/m/${S=
RCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https=
://pypi.python.org/<wbr>packages/source/m/${SRCNAME}/$<wbr>{SRCNAME}-${PV}.=
tar.gz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/d8/a8/64e788=
23c52d719181100e9e01dd3485a6e064e79e402089ba4e33cfaed6/${SRCNAME}-${PV}.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/<wbr>pack=
ages/d8/a8/<wbr>64e78823c52d719181100e9e01dd34<wbr>85a6e064e79e402089ba4e33=
cfaed6<wbr>/${SRCNAME}-${PV}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>7574eabaa0f1d8f83289f33aaf2c48<wbr>84&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>8469f35690077f888fbb49a7e31251<wbr>de9f7=
8bd319ebd4e1af0bbb1349c1a<wbr>d1be&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>53be7bf2d109c8bdf477c75b369773<wbr>b8&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>7b1549222353f6cc5b705734ef186f<wbr>e2cc3=
23d30c3987df50eceb7727359<wbr>5606&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
<br>
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

--001a11488c9406939c054687132e--
