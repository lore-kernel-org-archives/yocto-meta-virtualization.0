Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CD79E00D35; Sun, 22 Sep 2019 23:34:49 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3EF5E00929
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Sep 2019 23:34:48 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id q64so12391605ljb.12
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Sep 2019 23:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fvE50wAvCYNmMq2Kl1JI0o2sl4bOGGXmibVTP2k9WGo=;
	b=rbJBGi0vlyGDhwHJJDxPj80MSMNfTD616PE1B8br4NUmoFXH6XkrP2opENfPwXlDTY
	ItC9IqHBchMytVp2UDF8x3ELajWbwJ4yBk1LlTJFHrTOvMvRyfv+7dNg7uV9XrvLmO8I
	Q0EB8msySlwLc4i70pTl5lZbDRWxNm7/IZ9Ocz6D/JQjB5ZQ6o4SlanzIel1CplLicSX
	HGfXGLRA8CeRMyrsA7FbRthfsBW846CeXxrifj7Z9c93zM/MEc2EQQCYPFOgC83nwKO9
	rRds/Vxs1a8hae+JredB932ZiakqHjyuI8JVdYhi4bzp2Qanh59rp9C0kzIsPXVtCbgH
	Fa6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fvE50wAvCYNmMq2Kl1JI0o2sl4bOGGXmibVTP2k9WGo=;
	b=JkKyLpHTOHFoQpehW7siqxglnapRCN+Hqk/s2iigvCZI6uPYLkliQDVNJFpcrAzihT
	KE/lAkmfhfzHY/9/OkMpqaeAc5GKwU+pWZn3HGSLQ+BrZZuD5G1zZcFR9sU0DSvcwUZE
	2yGIDMl7hKaCWGqdF8nYI+YLGLHRFg4JpmrQhFF2V/UGbkD04SZQ/wEF2vFK37/l/NEE
	sq8pm1Zqo6qidgndYdyzHg9H5XUfrXH7qeT0vWwzgQW1lQdWCrbOVHk7tr9ymp5xAZik
	4RHmzWNz6Oj/Rb5f3WcwiMlbj28KY57MO6R4p2ssHVKXL6F5qzpfwcJHaP4a1PPwdFU4
	Cl1w==
X-Gm-Message-State: APjAAAXHzSm98tykCLZlwXxKTNsWVkDTap6fNUnBECMqn2Cif3r9xAH2
	Z9CFXSdJeRquQ1dqpvG6uXW57yPR3fY+efNfGJ8=
X-Google-Smtp-Source: APXvYqzVcIRkgkE2cFdM67OVq6/ErmQi/Fgvut+JNumQQ75zd8x1tEY9Ksj/vjYeUjfpp/eqH/0f+3/RmD27Jc4sj1c=
X-Received: by 2002:a2e:9a45:: with SMTP id k5mr15968864ljj.87.1569220487619; 
	Sun, 22 Sep 2019 23:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190920040344.6886-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190920040344.6886-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Sep 2019 02:34:36 -0400
Message-ID: <CADkTA4N6iUEFw9rWe-FHKx5DLvz4egjVXhzTzkgZXOkFLQPZqg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-osc-lib: upgrade 1.13.0 -> 1.14.1
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
X-List-Received-Date: Mon, 23 Sep 2019 06:34:49 -0000
Content-Type: multipart/alternative; boundary="000000000000bd26440593329dcd"

--000000000000bd26440593329dcd
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Sep 20, 2019 at 12:04 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-osc-lib.inc             | 4
> ++--
>  .../python/{python-osc-lib_1.13.0.bb => python-osc-lib_1.14.1.bb}     | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-osc-lib_1.13.0.bb
> => python-osc-lib_1.14.1.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> index 0589137..1767b43 100644
> --- a/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> +++ b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>
> -SRC_URI[md5sum] = "5e91028524b50a72f9913ccd2994cf77"
> -SRC_URI[sha256sum] =
> "9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707950dc1c6f0b286cce77"
> +SRC_URI[md5sum] = "240d3debc1b6eaadf5e8838f5f2d06fb"
> +SRC_URI[sha256sum] =
> "3467a1edf62946f1b67724fa7f9c699b5e31d80b111ed9e4c7aec21633a3e30d"
>
>  inherit pypi
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/
> python-osc-lib_1.14.1.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/
> python-osc-lib_1.13.0.bb
> rename to meta-openstack/recipes-devtools/python/python-osc-lib_1.14.1.bb
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

--000000000000bd26440593329dcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Se=
p 20, 2019 at 12:04 AM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fu=
jitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a hre=
f=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fu=
jitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/python/python-osc-lib.inc=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0.../python/{<a href=3D"http://python-osc-lib_1.13.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-osc-lib_1.13.0.bb</a> =3D&gt; <a href=3D"htt=
p://python-osc-lib_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python-o=
sc-lib_1.14.1.bb</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1=
.13.0.bb</a> =3D&gt; <a href=3D"http://python-osc-lib_1.14.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-osc-lib_1.14.1.bb</a>} (100%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib.inc b/me=
ta-openstack/recipes-devtools/python/python-osc-lib.inc<br>
index 0589137..1767b43 100644<br>
--- a/meta-openstack/recipes-devtools/python/python-osc-lib.inc<br>
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib.inc<br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1dece7821bf3fd70fe130=
9eaa37d52a2&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;5e91028524b50a72f9913ccd2994cf77&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707=
950dc1c6f0b286cce77&quot;<br>
+SRC_URI[md5sum] =3D &quot;240d3debc1b6eaadf5e8838f5f2d06fb&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3467a1edf62946f1b67724fa7f9c699b5e31d80b111ed=
9e4c7aec21633a3e30d&quot;<br>
<br>
=C2=A0inherit pypi<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.=
13.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-osc-lib_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1=
.14.1.bb</a><br>
similarity index 100%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.1=
3.0.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-o=
sc-lib_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.14.=
1.bb</a><br>
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

--000000000000bd26440593329dcd--
