Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42345E00BAA; Wed,  1 May 2019 12:39:14 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2644E0053F
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 May 2019 12:39:12 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id h21so39059ljk.13
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 May 2019 12:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SxnPA6HSOHmQYJb2K8pE+Z4aOEvUyWe0jwaoUMOqh3M=;
	b=C8U7uiSZvLds/dmT2TY3K6oVM5FYSqOdINf59TpKVe7iBeI4WBp5WxcCsN++b39XqO
	bRnEAMBlc+/CcEVXgRyOv9tw45Q2TfSQjRbVuO5U54NHk2jbA46hUhmcD/q0F/ZSJOZa
	QiwqcuudP2s9tkaE0st26li2d6+OdnUxFeHPqUK3C892b4KWKnA7BCD9rK0yBwzB3g75
	QmBedwUQBPHXxeex8ED1X3QKG0/o8j1FHBIX2b2BMuDQrigof0ZKvxtiUxsW9b8hAUZr
	r17LAapJQqH2kiSkF4TcMdMJq0PLibmy1AGEBnfhygZt9m6dKlwFHd+vw1/jf29igNZt
	XFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SxnPA6HSOHmQYJb2K8pE+Z4aOEvUyWe0jwaoUMOqh3M=;
	b=UE6sKvMr7zIsmVqMnAhlH2IETmvfwznTp1YdgabgIlmLQLMDaCsLwzjfnrxLxDjSsk
	3jgxATzjit0QJg0hiLXScRXKKR/pXIQIkujfX3lxW7l5SJQiFlferG+PyMrlU9drepQM
	SWMJoj8ROunjeQS1WgFSkwlXHV7aXCtX95ABj8H1Ws0NEjDNTDFAeZMv9EqQSzZ/k6nv
	imSOyYTNd0Vigdq8gYb1goOIm0T+qsqrNrVKxBO9dxSPRKikkz/Fv8e7nP9Z0egOGWZh
	LojU/wiLu8aGRGOWtD6837paGfbHpWTUwA0RuMqTcWNSq7ZwYxiNWsyQ2zE9LMkCW4n9
	h29A==
X-Gm-Message-State: APjAAAWxErhP8NUxzW4RU/ALuscclm/qrmg4kb+htTLD3laguapRH38G
	mwfx7D9KTPIyzi9ZxkSfiXjJ2CuIYq18QXKQTCSxFdQR
X-Google-Smtp-Source: APXvYqxIkImH5/ge9ymq2CQ4cRLVL5/aNEn7F1UB/qXKEfbyR5A3EbCrIuUJLVgrXaVxDvCW41c4LyEWDmhFjpz58+Y=
X-Received: by 2002:a2e:9c89:: with SMTP id x9mr21429968lji.28.1556739551629; 
	Wed, 01 May 2019 12:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190428013339.91413-1-kai.kang@windriver.com>
In-Reply-To: <20190428013339.91413-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 1 May 2019 15:39:00 -0400
Message-ID: <CADkTA4N5V8JrwzgHES0cLCFYrCQo2-bc4g5df-jfSNRRMf6feA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH v2 1/3] glusterfs: remove PACKAGECONFIG libibverbs for arm 32 and mips
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
X-List-Received-Date: Wed, 01 May 2019 19:39:14 -0000
Content-Type: multipart/alternative; boundary="000000000000fb96e60587d8ab2e"

--000000000000fb96e60587d8ab2e
Content-Type: text/plain; charset="UTF-8"

Is there a patch 2/3 in this v2 series ? I don't see it in my inbox(s).

Bruce

On Sat, Apr 27, 2019 at 9:33 PM <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Package libibverbs has been set imcompatible with arm 32 and mips arches
> by commit 215b975. So disable libibverbs support of glusterfs for arm 32
> and mips arches too.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/glusterfs/glusterfs.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-extended/glusterfs/glusterfs.inc
> b/recipes-extended/glusterfs/glusterfs.inc
> index ab5f4e0..692d74a 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -50,6 +50,9 @@ EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
>                 "
>
>  PACKAGECONFIG ??= "georeplication libibverbs"
> +PACKAGECONFIG_remove_mipsarch = "libibverbs"
> +PACKAGECONFIG_remove_arm = "libibverbs"
> +
>  PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
>  PACKAGECONFIG[georeplication] =
> "--enable-georeplication,--disable-georeplication,,rsync"
>  PACKAGECONFIG[libibverbs] =
> "--enable-ibverbs,--disable-ibverbs,virtual/libibverbs librdmacm,"
> --
> 2.20.0
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

--000000000000fb96e60587d8ab2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Is =
there a patch 2/3 in this v2 series ? I don&#39;t see it in my inbox(s).</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 27, =
2019 at 9:33 PM &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@wind=
river.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" tar=
get=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
Package libibverbs has been set imcompatible with arm 32 and mips arches<br=
>
by commit 215b975. So disable libibverbs support of glusterfs for arm 32<br=
>
and mips arches too.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/glusterfs/glusterfs.inc | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/gl=
usterfs/glusterfs.inc<br>
index ab5f4e0..692d74a 100644<br>
--- a/recipes-extended/glusterfs/glusterfs.inc<br>
+++ b/recipes-extended/glusterfs/glusterfs.inc<br>
@@ -50,6 +50,9 @@ EXTRA_OECONF =3D &quot;ac_cv_file__etc_debian_version=3Dn=
o \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;georeplication libibverbs&quot;<br>
+PACKAGECONFIG_remove_mipsarch =3D &quot;libibverbs&quot;<br>
+PACKAGECONFIG_remove_arm =3D &quot;libibverbs&quot;<br>
+<br>
=C2=A0PACKAGECONFIG[debug] =3D &quot;--enable-debug,--disable-debug,,&quot;=
<br>
=C2=A0PACKAGECONFIG[georeplication] =3D &quot;--enable-georeplication,--dis=
able-georeplication,,rsync&quot;<br>
=C2=A0PACKAGECONFIG[libibverbs] =3D &quot;--enable-ibverbs,--disable-ibverb=
s,virtual/libibverbs librdmacm,&quot;<br>
-- <br>
2.20.0<br>
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

--000000000000fb96e60587d8ab2e--
