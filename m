Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CBDFE00D4E; Mon,  5 Aug 2019 04:29:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0EA0E00BA1
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 04:29:01 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id v18so78925100ljh.6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Aug 2019 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5czcdEa64/JW23hkIwMJL7fa9rPPZErhre7DyZZ9lD8=;
	b=c0jvehUGNziQ7F63CHixQYWTS6sUDS6KhNXvnfLQnxBNrxd+L5piy3zKGTEK0ko6lP
	Fk//+haIS6rp6cxKXHuNHgLa9YFrINVp7d8AI/DA7+mMI7dOWLRuK4UAURy/mpF+55/t
	1ZRhRMxPGBzJ4Tgd4WtnMtgs5h/wG/JhEFHdCp8iHpsfwsaLjLXv/qkAi7Kfet3sBXHW
	HUJw8OyEbuitvedjcVpklCS0w5fxh9yl4ePsau9PWr+LJ36x73FRKHjWnE9+cmnruCCB
	ap5pUHykyEKzWyDsFTOVmyWd+gkyz5FVtjnQMkCmYt3ZbBSPV4z+zRtIWTfp2cZc63Pr
	clEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5czcdEa64/JW23hkIwMJL7fa9rPPZErhre7DyZZ9lD8=;
	b=WxcWQSTl0ZT+ifQhqGqrg+LBcPD3UgWdqV0BVzpPoFbKsw4lWHYcw0mLbR0FW3VjC1
	0z3i1SdYFVuTvnknZSBxhgsxyMMLcM9qe3f0Z6RcKEzfkR5QXGwZuu6tQAWCBkIEfFJD
	g7n7iNO0v6OOtJc3FwdNY7SayUd25slZsXhUHe1F0AhArGyfY2Aai+JfrSgF3MgCuQEA
	CuR8FIthkiC7Ra5XVDA/TBOYsSPJNtUS40NGRsyvYdCgsUPJJI7quiZQaK7dR5MYU1Zq
	wcFh10iVxHPpIxdZkEZrjTqlTpk/rS4OIUGlusuTskI3LKY0fo9deOwVIYslM2tdzKUE
	nZ1Q==
X-Gm-Message-State: APjAAAUfjkUJBi/F0YsArsQQsMbLtz3QKkI0HU1XbKeS1ryN9pIMGYIG
	GGtHfH2QXsNq1lR0et4/UQwEapnWVUdkhPo84i4=
X-Google-Smtp-Source: APXvYqzkmNdnWAaPSEJNTpCBqD3hai/0XlgWiADYaSbNmV1OTGOWbi+a9/oy2Uq6YeQugF+SEVCZ/eo6r3IK4V/trqI=
X-Received: by 2002:a2e:b048:: with SMTP id d8mr37159156ljl.118.1565004540543; 
	Mon, 05 Aug 2019 04:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190805060143.24108-1-Qi.Chen@windriver.com>
	<20190805060143.24108-2-Qi.Chen@windriver.com>
In-Reply-To: <20190805060143.24108-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 5 Aug 2019 08:28:48 -0300
Message-ID: <CADkTA4OYhWqw_nRRYx4=mjz2Pasxude6sPQyhiaWFwBuRYK2Gg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/4] runc: remove static to enable building systemd support
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
X-List-Received-Date: Mon, 05 Aug 2019 11:29:02 -0000
Content-Type: multipart/alternative; boundary="000000000000b60811058f5d03ab"

--000000000000b60811058f5d03ab
Content-Type: text/plain; charset="UTF-8"

On Mon., Aug. 5, 2019, 3:02 a.m. Chen Qi, <Qi.Chen@windriver.com> wrote:

> Remove the 'static' from do_compile to enable systemd support.
> This avoid runtime error is docker's cgroup driver is set to systemd
> on systemd based images.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/runc/runc.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/runc/runc.inc
> b/recipes-containers/runc/runc.inc
> index 46fd09d..1f2f944 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -54,7 +54,7 @@ do_compile() {
>         export CFLAGS=""
>         export LDFLAGS=""
>
> -       oe_runmake static
> +       oe_runmake
>


This needs to be optional, via a packageconfig that can be overidden and
that can trigger a default of the init manager is systemd. (I actually want
static and systemd in my configs )

Bruce

 }
>
>  do_install() {
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--000000000000b60811058f5d03ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon., Aug. 5, 2019, 3:02 a.m. Chen Qi, &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Remove the &#39;static&#39; from do_com=
pile to enable systemd support.<br>
This avoid runtime error is docker&#39;s cgroup driver is set to systemd<br=
>
on systemd based images.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/runc/runc.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/run=
c.inc<br>
index 46fd09d..1f2f944 100644<br>
--- a/recipes-containers/runc/runc.inc<br>
+++ b/recipes-containers/runc/runc.inc<br>
@@ -54,7 +54,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake static<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">This need=
s to be optional, via a packageconfig that can be overidden and that can tr=
igger a default of the init manager is systemd. (I actually want static and=
 systemd in my configs )</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Bruce</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank" r=
el=3D"noreferrer">meta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/listinfo/meta-virtualization</a><br>
</blockquote></div></div></div>

--000000000000b60811058f5d03ab--
