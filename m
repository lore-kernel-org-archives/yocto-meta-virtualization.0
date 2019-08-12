Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFF1CE00D84; Mon, 12 Aug 2019 07:57:50 -0700 (PDT)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 773DCE00D7E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:57:49 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id t3so10034725ljj.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jhXAeloHSXKZb1ti+Fr0W1iQ0M/R5scYzH8x0n+iEi4=;
	b=fwmuiZY0kfgU2vSH23lBXx2Ex7KcmbjPYXRUf4UNZ3p0b2JX61xeDMwZVgqoYisY0T
	t9L9ENXmGo2iJKYLQvdd6TL2j8NFHII6GAHnxyXa8Nb1uVQSyUK6XfEHLBZD69zK42NT
	mX27ZKvAeG++yN4V3d5AtkL/zSvhZpP4looeLwrkPUuLyZ9VNHIQlnn1dAiOa4kn4AV8
	O9oiBB3HD0qeuUV5zd4wGWEVwKhPT9tHgPWGhkMBanwyHlkLr89FB4gszJ1Ihn4d2Dg/
	Fr+rlxyiHzsVGIv2oChI+Tl/BURhS6L+Ebt7qAF10f6q0zvRhWVrOmtzrCO9D7vwzbky
	CVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jhXAeloHSXKZb1ti+Fr0W1iQ0M/R5scYzH8x0n+iEi4=;
	b=LTQfE+nNk7/ZSlE3TKAcRLWzgFfOOqS/VkeQLtDyeGTiewbg80ezU490rU+4NDYne/
	pJ6Rm5NuYe+YUu0x57NMLLmLegu1pEAofeNP4spzqOZEn8GvZhLZRZsIa/uOuYlofCMd
	uS89cCx/jMklRWB4wwhXQtri4dOSjGiPjPSz7lTwYwQl9/42EupGgSi3403OUwii0xxB
	b6XKFNwPErerq8poLx+ibMbA3L6QdKUAorRpDOTU00zK8bdI8S/kPAjGWg3CoG3Nb2wT
	9ZmigFJLVrtqBSeRfecrYk9KdLCx1YkKRytlhfikqnqSvu3AoXI8AOMxhxdDkMUvniVx
	PPUg==
X-Gm-Message-State: APjAAAUgEfQYIomzIWJqYAbSgfQubek1zloffQqBviTlfVYvve3QAtIm
	E30K1WoCwjGXdm4RvitFFbE5PMhdelFTBKsyV802Z5QwoUE=
X-Google-Smtp-Source: APXvYqzZy+GUWTVlsE7/qZ01B1FSBim6a4va8G3xn2C2/C+tyvCVhlKwOLoLtYD1rPhXwQ8nflJNgnfGPiFgY/AI9zg=
X-Received: by 2002:a2e:8449:: with SMTP id u9mr12766086ljh.104.1565621868375; 
	Mon, 12 Aug 2019 07:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190808063122.11211-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190808063122.11211-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 10:57:36 -0400
Message-ID: <CADkTA4PLuWjt6STi8wevQC5r8_J-ityGQ7Y9b2uQaGabijZApA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-warlock: upgrade 1.3.0 -> 1.3.3
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
X-List-Received-Date: Mon, 12 Aug 2019 14:57:50 -0000
Content-Type: multipart/alternative; boundary="0000000000005130bc058fecbffe"

--0000000000005130bc058fecbffe
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 8, 2019 at 2:32 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Remove 1.2.0.bb file.
>
> Upgrade 1.3.0 -> 1.3.3
> Name of LICENSE file changed LICENSE.txt -> LICENSE
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-warlock_1.2.0.bb | 21
> ---------------------
>  ...hon-warlock_1.3.0.bb => python-warlock_1.3.3.bb} |  6 +++---
>  2 files changed, 3 insertions(+), 24 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/
> python-warlock_1.2.0.bb
>  rename meta-openstack/recipes-devtools/python/{python-warlock_1.3.0.bb
> => python-warlock_1.3.3.bb} (57%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-warlock_1.2.0.bb b/meta-openstack/recipes-devtools/python/
> python-warlock_1.2.0.bb
> deleted file mode 100644
> index 0839983..0000000
> --- a/meta-openstack/recipes-devtools/python/python-warlock_1.2.0.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "Build self-validating python objects using JSON schemas"
> -HOMEPAGE = "http://github.com/bcwaldon/warlock"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2"
> -LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -DEPENDS += " \
> -        python-jsonschema \
> -        python-jsonpatch \
> -        "
> -
> -SRC_URI[md5sum] = "8389225c589ada11a9094abc5d9053df"
> -SRC_URI[sha256sum] =
> "7c0d17891e14cf77e13a598edecc9f4682a5bc8a219dc84c139c5ba02789ef5a"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += " \
> -        python-jsonschema \
> -        python-jsonpatch \
> -        python-six \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/
> python-warlock_1.3.0.bb b/meta-openstack/recipes-devtools/python/
> python-warlock_1.3.3.bb
> similarity index 57%
> rename from meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
> rename to meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
> index a62cbd8..c2c694b 100644
> --- a/meta-openstack/recipes-devtools/python/python-warlock_1.3.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-warlock_1.3.3.bb
> @@ -2,12 +2,12 @@ DESCRIPTION = "Build self-validating python objects
> using JSON schemas"
>  HOMEPAGE = "http://github.com/bcwaldon/warlock"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2"
> -LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  DEPENDS += "python-jsonschema python-jsonpatch"
>
> -SRC_URI[md5sum] = "61cc809a3af2c76288f4dd26a003932d"
> -SRC_URI[sha256sum] =
> "d7403f728fce67ee2f22f3d7fa09c9de0bc95c3e7bcf6005b9c1962b77976a06"
> +SRC_URI[md5sum] = "746aba989d97762948e5fca6601f283f"
> +SRC_URI[sha256sum] =
> "a093c4d04b42b7907f69086e476a766b7639dca50d95edc83aef6aeab9db2090"
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

--0000000000005130bc058fecbffe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Au=
g 8, 2019 at 2:32 AM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuji=
tsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Yuan Chao &lt;<a href=3D"mailto:yu=
anc.fnst@cn.fujitsu.com" target=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt=
;<br>
<br>
Remove <a href=3D"http://1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">1.2=
.0.bb</a> file.<br>
<br>
Upgrade 1.3.0 -&gt; 1.3.3<br>
Name of LICENSE file changed LICENSE.txt -&gt; LICENSE<br>
<br>
Signed-off-by: Yuan Chao &lt;<a href=3D"mailto:yuanc.fnst@cn.fujitsu.com" t=
arget=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-warlock_1.2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.2.0.bb</a> | 21 ---=
------------------<br>
=C2=A0...<a href=3D"http://hon-warlock_1.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">hon-warlock_1.3.0.bb</a> =3D&gt; <a href=3D"http://python-warlo=
ck_1.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.3.3.bb</=
a>} |=C2=A0 6 +++---<br>
=C2=A02 files changed, 3 insertions(+), 24 deletions(-)<br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-warlock_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
-warlock_1.2.0.bb</a><br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-warlock_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.=
3.0.bb</a> =3D&gt; <a href=3D"http://python-warlock_1.3.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-warlock_1.3.3.bb</a>} (57%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-warlock_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.2=
.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-warlock_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.2.=
0.bb</a><br>
deleted file mode 100644<br>
index 0839983..0000000<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-warlo=
ck_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.2.0.bb</=
a><br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-DESCRIPTION =3D &quot;Build self-validating python objects using JSON sche=
mas&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://github.com/bcwaldon/warlock" rel=3D"n=
oreferrer" target=3D"_blank">http://github.com/bcwaldon/warlock</a>&quot;<b=
r>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;Apache-2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57&quot;<br>
-<br>
-DEPENDS +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-jsonschema \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-jsonpatch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;8389225c589ada11a9094abc5d9053df&quot;<br>
-SRC_URI[sha256sum] =3D &quot;7c0d17891e14cf77e13a598edecc9f4682a5bc8a219dc=
84c139c5ba02789ef5a&quot;<br>
-<br>
-inherit setuptools pypi<br>
-<br>
-RDEPENDS_${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-jsonschema \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-jsonpatch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-six \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-warlock_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.3=
.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-warlock_1.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.3.=
3.bb</a><br>
similarity index 57%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-warlock_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.3.=
0.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-w=
arlock_1.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.3.3.=
bb</a><br>
index a62cbd8..c2c694b 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-warlo=
ck_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.3.0.bb</=
a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-warlo=
ck_1.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python-warlock_1.3.3.bb</=
a><br>
@@ -2,12 +2,12 @@ DESCRIPTION =3D &quot;Build self-validating python object=
s using JSON schemas&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://github.com/bcwaldon/warlock" rel=
=3D"noreferrer" target=3D"_blank">http://github.com/bcwaldon/warlock</a>&qu=
ot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python-jsonschema python-jsonpatch&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;61cc809a3af2c76288f4dd26a003932d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d7403f728fce67ee2f22f3d7fa09c9de0bc95c3e7bcf6=
005b9c1962b77976a06&quot;<br>
+SRC_URI[md5sum] =3D &quot;746aba989d97762948e5fca6601f283f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a093c4d04b42b7907f69086e476a766b7639dca50d95e=
dc83aef6aeab9db2090&quot;<br>
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

--0000000000005130bc058fecbffe--
