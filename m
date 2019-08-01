Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FE71E00DA3; Wed, 31 Jul 2019 19:17:07 -0700 (PDT)
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
	*      [209.85.167.65 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09F21E00CD7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Jul 2019 19:17:05 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id c19so48944863lfm.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Jul 2019 19:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M1uccORpzFg/XpHPteNu5wvcttx7F3iVr3dP+v3/bYQ=;
	b=mkgYuXpcmXjHG4wQz1wNaZo4v7LtM5ZF4Mh0bkh8pckt9ppFekATKcY0kq3cQyw6oq
	/3ZoQr42xnKOnlCy2d/8CETVea7O7gdukPdQHwdXbzSnmMby4SzFU3NPTb9ZHOHExhkr
	SFUb3KZnTrxVmIDsBuO1spSUc8nBzOFbZhPC58GbSpdx6mCugxt/vstC9AggFrgaOYoH
	ZioHymL7NDez2OWXsmEcZZ1/M9HxoudXci3yFzbDGiYL6PEoqVfYOlkr8FZbHKozLsWZ
	aFNLyndn+Ey/nwq+u48OzDIA1+trxdnuLPg9cYCK20jkHIXK89VneAnwFF9cROb3WDY7
	0gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M1uccORpzFg/XpHPteNu5wvcttx7F3iVr3dP+v3/bYQ=;
	b=T0ZmL/As/lpOUBoveA5Dx96NRP9xRXlb6ByLX2SKtzoTM7FKVaGiNcJiPA0HWtidXM
	GGxgyHMLuCqXCcNR8IwZVJi6HYAcrAfCzFHEXQ5MP94QJaVlv6t3LzuzzsM19S1iJbp3
	nyOYAi3Ke6PgPFc1ks7sgK6XYovlPanVwhHLCKf+jI/LO5VgwT/4EeQqSRQRhOY+/UZY
	0q4xkfZ14X7WZhTBnHGjg7hcrIhp4EnVGnNQvLAwfVKxJUr/LEESbZ7GZE/XwFDlnOtl
	Q2JRPIe71hXK/O1woZJ5DsfWAZA/WNbr0Uf3YREkKu7g+qEAbJbxVokv0JAkMUyiYZcy
	gTGA==
X-Gm-Message-State: APjAAAWhXPmv3ruSzSvwIzMTHQ/1zPx5euII4GSzsXWgw3T4eN4hnYjy
	duhhKXy6GLlFYicFP2jLrT7ue23Wzc4T2BCfLw2wxA==
X-Google-Smtp-Source: APXvYqx17AkuxdjNr0xiItBMk6oO23tXQ8RAE3qTjJsdCHu4ZMOIwyZRIClr1d8+m4x4DERK0mK4QrQhAsv5SGfh1l4=
X-Received: by 2002:ac2:418f:: with SMTP id z15mr8522944lfh.177.1564625824757; 
	Wed, 31 Jul 2019 19:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190801012359.10869-1-Qi.Chen@windriver.com>
In-Reply-To: <20190801012359.10869-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Jul 2019 22:16:56 -0400
Message-ID: <CADkTA4N+V-sVrQS8=ZtW1AtyxrEP_Mo2Ea8cpTyeNXszCpdgYA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kubernetes: set COMPATIBLE_HOST
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
X-List-Received-Date: Thu, 01 Aug 2019 02:17:07 -0000
Content-Type: multipart/alternative; boundary="0000000000007dbda8058f04d6c2"

--0000000000007dbda8058f04d6c2
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Jul 31, 2019 at 9:24 PM Chen Qi <Qi.Chen@windriver.com> wrote:

> Currently kubernetes does not build for qemux86, qemumips, qemumips64,
> qemuppc. So set COMPATIBLE_HOST to make this clear. Otherwise we get
> build failure when trying to build like below.
>
>   fatal error: bits/long-double-64.h: No such file or directory
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> index ea34719..5b4c3a9 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -28,6 +28,8 @@ inherit systemd
>  inherit go
>  inherit goarch
>
> +COMPATIBLE_HOST = '(x86_64.*|arm.*|aarch64.*)-linux'
> +
>  do_compile() {
>         export GOARCH="${TARGET_GOARCH}"
>         export GOOS="${TARGET_GOOS}"
> --
> 2.17.1
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

--0000000000007dbda8058f04d6c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, J=
ul 31, 2019 at 9:24 PM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
>Qi.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Currently kubernetes does not build for qemux86, qemu=
mips, qemumips64,<br>
qemuppc. So set COMPATIBLE_HOST to make this clear. Otherwise we get<br>
build failure when trying to build like below.<br>
<br>
=C2=A0 fatal error: bits/long-double-64.h: No such file or directory<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git=
.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> b/recipes-c=
ontainers/kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferrer=
" target=3D"_blank">kubernetes_git.bb</a><br>
index ea34719..5b4c3a9 100644<br>
--- a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
+++ b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
@@ -28,6 +28,8 @@ inherit systemd<br>
=C2=A0inherit go<br>
=C2=A0inherit goarch<br>
<br>
+COMPATIBLE_HOST =3D &#39;(x86_64.*|arm.*|aarch64.*)-linux&#39;<br>
+<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D&quot;${TARGET_GOARCH}&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOOS=3D&quot;${TARGET_GOOS}&quot;<br>
-- <br>
2.17.1<br>
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

--0000000000007dbda8058f04d6c2--
