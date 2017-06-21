Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20CF4E00BBD; Wed, 21 Jun 2017 11:26:09 -0700 (PDT)
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
	*      [209.85.220.195 listed in list.dnswl.org]
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDC5DE00B83
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 11:26:05 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id p21so4684478qke.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BZeLyy5TGsSQiT6pqQIs6MluONYGkYYMhv1TT2kxonc=;
	b=o7KzaS2lXloIpqARcDw434hUCxpsPkoysv6c7/RNEzp4blkmHj2pqO4VFe1l1Jzh9x
	/Y8ERM0NBierJt2bVPLoUWorOz+pJeFN99MTJhbIAuDpRvBzwAu9h2H2IwgF2pA11gta
	niIH6ZS8hrKdoXBS3EZ0TwYjDg80nhBM4T16uGxBG2CLZV6Exr1MWKn/GbwCH6xggeuG
	oin3RvyEfQ/dmpgereIr+fmNyEiJZK/Ad86roXuOk2R1AUHMuWO5XhD4hlponHmT28J2
	FM+1ypmPwKUCqeWpJSeZpDG4C99w3TNh3Q6jxUOuoUJBwPFDtVz0uKcL/na6e+KBekC8
	jbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BZeLyy5TGsSQiT6pqQIs6MluONYGkYYMhv1TT2kxonc=;
	b=OPfoEhscloJ5oG13+vJoV0OFqvCVwlPoBPEpsXUHNtuusEKHmHLfMNEqRmkt7oxyUh
	2LnsSyKpihYV+Xw0WPrYgG2j4BhN+g7LOgeBWT9ZdgFwTX8fVfJAdYJjPTV9D9Y3Q9oT
	Al0QwTnQmoHh2QFhamqk5IWnllvosdrHq1D92C+R52lD47krY/ZsNek9h87VMTIxLkj7
	AGNHnp8yZSv7JMqg/uWUpygF8rF7dxnKThY0WAX2IQjHxC/yUyB0vtxdhoqBi6HRDXlM
	2KW6IUWZJUcg7pU2Y8GFYX1zyzNQgKoIUKdQM6xkTjVlnjCtL9V4VqpnqErgGyMSJ8z/
	gz8g==
X-Gm-Message-State: AKS2vOyo22iRbr9eJjwSpc8KP6yC+w+/Rz6qvI2NcA1PiG8lKKnmnFUW
	q87Vq9fgbOJCT3hWhPSA4C2eU2AIwg==
X-Received: by 10.55.27.136 with SMTP id m8mr39727314qkh.196.1498069564890;
	Wed, 21 Jun 2017 11:26:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.135.172 with HTTP; Wed, 21 Jun 2017 11:26:04 -0700 (PDT)
In-Reply-To: <20170620020251.14885-1-anselmo.melo@intel.com>
References: <20170620020251.14885-1-anselmo.melo@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Jun 2017 14:26:04 -0400
Message-ID: <CADkTA4OqEJNL_hEwTF_WxQsjZ_s1e78z3rOnotFgx+pid++34Q@mail.gmail.com>
To: "Anselmo L. S. Melo" <anselmo.melo@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: Remove libtrust from dependencies
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
X-List-Received-Date: Wed, 21 Jun 2017 18:26:09 -0000
Content-Type: multipart/alternative; boundary="001a1147f2e243a3f505527c80e7"

--001a1147f2e243a3f505527c80e7
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Jun 19, 2017 at 10:02 PM, Anselmo L. S. Melo <anselmo.melo@intel.com
> wrote:

> According to https://github.com/docker/libtrust, this repo is now
> deprecated
> and the library was integrated in the docker-distribution repository.
>
> Signed-off-by: Anselmo L. S. Melo <anselmo.melo@intel.com>
> ---
>  recipes-containers/docker/docker_git.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index 74170cb..c1b38dc 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -43,7 +43,6 @@ DEPENDS = " \
>      go-context \
>      go-mux \
>      go-patricia \
> -    go-libtrust \
>      go-logrus \
>      go-fsnotify \
>      go-dbus \
> --
> 2.13.1
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

--001a1147f2e243a3f505527c80e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jun 19, 2017 at 10:02 P=
M, Anselmo L. S. Melo <span dir=3D"ltr">&lt;<a href=3D"mailto:anselmo.melo@=
intel.com" target=3D"_blank">anselmo.melo@intel.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">According to <a href=3D"https://github.com=
/docker/libtrust" rel=3D"noreferrer" target=3D"_blank">https://github.com/d=
ocker/<wbr>libtrust</a>, this repo is now deprecated<br>
and the library was integrated in the docker-distribution repository.<br>
<br>
Signed-off-by: Anselmo L. S. Melo &lt;<a href=3D"mailto:anselmo.melo@intel.=
com">anselmo.melo@intel.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">dock<wbr>er_git.bb</a> | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a> b/recipes-containe=
rs/docker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">do<wbr>cker_git.bb</a><br>
index 74170cb..c1b38dc 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
@@ -43,7 +43,6 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0go-context \<br>
=C2=A0 =C2=A0 =C2=A0go-mux \<br>
=C2=A0 =C2=A0 =C2=A0go-patricia \<br>
-=C2=A0 =C2=A0 go-libtrust \<br>
=C2=A0 =C2=A0 =C2=A0go-logrus \<br>
=C2=A0 =C2=A0 =C2=A0go-fsnotify \<br>
=C2=A0 =C2=A0 =C2=A0go-dbus \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.1<br>
<br>
--<br>
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

--001a1147f2e243a3f505527c80e7--
