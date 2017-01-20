Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E6BDE00AAA; Fri, 20 Jan 2017 06:01:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.182 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.182 listed in dnsbl.sorbs.net]
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
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E94FCE00A9B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 06:01:39 -0800 (PST)
Received: by mail-yw0-f182.google.com with SMTP id w75so87654291ywg.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 06:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dOR6XdBI67CWDSjbDjviIBJ/R7/nAqgaYrjk263Mpxk=;
	b=u3lB82czggdO1f+174EOhpesZ1pINcxeRJkWsdizZH1BVBvo+9EmsBw0RQWp6qhPZw
	XXQ0Q5Usa7PV8Ozh1GQAqmfWwCz31FglP08+N/8bqxp5UmIqIbsZuO5qkCyCe7LxEKTB
	2ApUjecx1xpLJPzRN6LtatXAa0s3YP2qFDs4GtFVGkUZeDWKYqHw+aZNuXggWIfyoOJ/
	GSujjAySCxn8ePyqLcKT40A6hTbYtWj2JWRzT6jeWEXYugpZUm/yLOLboUaMQEMDyktv
	aLRdAox9UvZhMKKM/U+0oF1YlvsPv0tmdAewNWeydLkXx73TuOkW5t4f8+Lx06gPtupN
	FB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dOR6XdBI67CWDSjbDjviIBJ/R7/nAqgaYrjk263Mpxk=;
	b=cq+EwdKLrTicSEWc6CNQdXy2Pa2L2nDwLxRyPYWBsEF6M3kufYqqENmjV9OOH+V4a3
	54v+tkscKZs+bm7o57ERl9H0L2gkwjFV9vaoAOzIsGXIxWfEW2ys90Z5JYyumNZmZmk9
	meypSMmBCGsFHZbfd1OjpYb07RfzS86HijYtQVr15e+1P6VfkImLd8znea0ImsHp3m9o
	w8Ytj5Zd0vqDrqyJPTS3qERAmQuDVXsDR84qECA98JcMIcDfQfpBSHdTatDBgeF0DrB4
	s1NhFjJyYiWfaX1zz+skx7LfCvAf/hLgkXPx6HXSZVp7eEsxrQzw2GaILys78H7MXzcl
	8QDA==
X-Gm-Message-State: AIkVDXK254UdIKqsOySoTw2Swoh36b3Xc2tkBQx2MqkMwOuzDIG9sP+RcGQ36A19BMNtKX7opNO5glm+laTdOQ==
X-Received: by 10.55.101.194 with SMTP id z185mr2159361qkb.318.1484920899333; 
	Fri, 20 Jan 2017 06:01:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 20 Jan 2017 06:01:36 -0800 (PST)
In-Reply-To: <1484905455-1488-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1484905455-1488-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Jan 2017 09:01:36 -0500
Message-ID: <CADkTA4Ocuas4RiiBp0U9Fi8w059f3s69CZBw-3ABbhbvFbhUyw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-routes: 1.13 -> 2.4.1
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
X-List-Received-Date: Fri, 20 Jan 2017 14:01:41 -0000
Content-Type: multipart/alternative; boundary=94eb2c05e1deb9745e05468716cb

--94eb2c05e1deb9745e05468716cb
Content-Type: text/plain; charset=UTF-8

All the meta-cloud-services uprevs should now be merged. If I missed any
changes,
resend the patches.

Cheers,

Bruce

On Fri, Jan 20, 2017 at 4:44 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> 1) Upgrade python-routes from 1.13 to 2.4.1.
> 2) Change the License file's name and checksum,since the license file is
> changed.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-routes_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-routes_git.bb
> b/meta-openstack/recipes-devtools/python/python-routes_git.bb
> index 814339b..408f0a8 100644
> --- a/meta-openstack/recipes-devtools/python/python-routes_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-routes_git.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "A Python re-implementation of the Rails
> routes system."
>  HOMEPAGE = "http://routes.groovie.org"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=aa6285dc7b7c93b3905bb2757f33eb62"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=90976c1a0e3029278f882cfe2e84a6
> ae"
>
> -PV = "1.13+git${SRCPV}"
> -SRCREV = "467501d5fcfa265b3dfae615e7f0dcda8ce79d4e"
> +PV = "2.4.1+git${SRCPV}"
> +SRCREV = "2dcef8079cf09f427eeb0be62374f6c1a52bf59d"
>
>  SRCNAME = "Routes"
>  SRC_URI = "git://github.com/bbangert/routes.git"
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

--94eb2c05e1deb9745e05468716cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>All the meta-cloud-services uprevs should n=
ow be merged. If I missed any changes,<br></div>resend the patches.<br><br>=
</div>Cheers,<br><br></div>Bruce<br></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Fri, Jan 20, 2017 at 4:44 AM, Huang Qiyu <span =
dir=3D"ltr">&lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com" target=3D"_b=
lank">huangqy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">1) Upgrade python-routes from 1.13 to 2.4.1.<br>
2) Change the License file&#39;s name and checksum,since the license file i=
s changed.<br>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
routes_git.bb" rel=3D"noreferrer" target=3D"_blank">python-routes_<wbr>git.=
bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-routes_git.bb" rel=3D"noreferrer" target=3D"_blank">python-routes_<w=
br>git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http=
://python-routes_git.bb" rel=3D"noreferrer" target=3D"_blank">python-routes=
_<wbr>git.bb</a><br>
index 814339b..408f0a8 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
routes_git.bb" rel=3D"noreferrer" target=3D"_blank">python-routes_<wbr>git.=
bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
routes_git.bb" rel=3D"noreferrer" target=3D"_blank">python-routes_<wbr>git.=
bb</a><br>
@@ -2,10 +2,10 @@ DESCRIPTION =3D &quot;A Python re-implementation of the R=
ails routes system.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://routes.groovie.org" rel=3D"noref=
errer" target=3D"_blank">http://routes.groovie.org</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>aa6285dc7b7c93b3905bb=
2757f33eb<wbr>62&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D<wbr>90976c1a0e3029278=
f882cfe2e84a6<wbr>ae&quot;<br>
<br>
-PV =3D &quot;1.13+git${SRCPV}&quot;<br>
-SRCREV =3D &quot;<wbr>467501d5fcfa265b3dfae615e7f0dc<wbr>da8ce79d4e&quot;<=
br>
+PV =3D &quot;2.4.1+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;<wbr>2dcef8079cf09f427eeb0be62374f6<wbr>c1a52bf59d&quot;<=
br>
<br>
=C2=A0SRCNAME =3D &quot;Routes&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/bbangert/routes.=
git" rel=3D"noreferrer" target=3D"_blank">github.com/bbangert/<wbr>routes.g=
it</a>&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
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

--94eb2c05e1deb9745e05468716cb--
