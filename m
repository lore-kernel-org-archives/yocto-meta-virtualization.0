Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC6DEE00DA3; Wed, 31 Jul 2019 19:17:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F11CE00927
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Jul 2019 19:17:34 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id y17so43134544ljk.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Jul 2019 19:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZD6i/Iwm2rezEmG1lfpAfswVk1eExBJfXnGiRiKWWRM=;
	b=mQu1Z46t2y4tQ4jljZtEXuGHxAfsUbcjvTOJHlKZUi4qKd/FEcyH+jB0V+Zx5UlsX8
	lfnrAgGYBMFZWi2KCdFPXVnKHWPX7wu1iobg8bkrcNyFqx99PIXZyYyuBZsBzgGp0X7r
	i9Qq81TTg/8zZBG69Puc8fJEB3adilG4rsrjRkhh+3FXMR6oh8v6mMbi/c9zr61dFShI
	KDsezvF7SSpDZLN5I2uhfV3t5R58xtqQtkdh+kTthVD0OE/1LA0gH7n4+5QP+WAWlqYR
	/yRnT9hEOcvPiE8ddkJ6tphr9TgZDTF1xWlgs3srpQjbIqgvGeqw5Kr2KzP1qif/Norb
	UEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZD6i/Iwm2rezEmG1lfpAfswVk1eExBJfXnGiRiKWWRM=;
	b=qu8AA6WquiB72zYoPGrWwHzO7bSW6JPfmgT0Z/G6Kd03P1O4huCsk7PN65ZUFpKaVF
	FDmfr5BpGCJgKT90P5euc1BxwG3kQUPZExQV6euu+m8ptW45kx+Dzr3nv1ebvLFDy891
	zzzS4Nsu/X1wzC/z74BRR1Eu7zj37TU81VchxJO1qgH8TX+osU2WmKBa5fD1FFrLfSqX
	2Cok872UucusULG6DZiD5sS1aZE+tteax3RHd56uUgTdzF9sxzYDmU/WzzpwdWAk0Bqk
	+WSxClBmXnb0TS6bhidqJO+Nwaw0T+BIdC0hkNMBT5XR0CNxmrCI7pBSpf9FEgFk+T4r
	MV8g==
X-Gm-Message-State: APjAAAV2h4PyN70q1Z2h4aCVP5z1MjRZbgntqlXiqfJTM6EIxXA4KSm0
	Q5C8FgKNZD1PS9wIDJjgwpQpUbf/rkU1zj2JnaI=
X-Google-Smtp-Source: APXvYqy5Y5kILACtrIiRRQBKd0ZHVS6w7S861QrABLl+HQZxX0X9w443SUHRsXPrsqdXZwmtJ8tg94c15wGfD4mhvSo=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr51241088lja.87.1564625853788; 
	Wed, 31 Jul 2019 19:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <1564119371-297091-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1564119371-297091-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Jul 2019 22:17:25 -0400
Message-ID: <CADkTA4NWRf_V_jyZMuXr8O10Eb_kJxTbJu73HqFyefbrNonCHQ@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-dateutil: Remove the bbappend
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
X-List-Received-Date: Thu, 01 Aug 2019 02:17:35 -0000
Content-Type: multipart/alternative; boundary="00000000000038b4bf058f04d852"

--00000000000038b4bf058f04d852
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jul 26, 2019 at 1:36 AM <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> The current bbappend only has below logic:
> CLEANBROKEN = "1"
>
> For python-dateutil, the distutils class is about to
> do a clean via "setup.py clean" as below logic in distutils
> class without CLEANBROKE = "1":
> distutils_do_configure() {
>         if [ "${CLEANBROKEN}" != "1" ] ; then
>                 NO_FETCH_BUILD=1 \
>                 ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py clean ${DISTUTILS_BUILD_ARGS}
>         fi
> }
>
> But it works for python-dateutil, no need to set
> CLEANBROKEN, so remove this bbappend.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  recipes-devtools/python/python-dateutil_%.bbappend | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644 recipes-devtools/python/python-dateutil_%.bbappend
>
> diff --git a/recipes-devtools/python/python-dateutil_%.bbappend
> b/recipes-devtools/python/python-dateutil_%.bbappend
> deleted file mode 100644
> index 68409e5..0000000
> --- a/recipes-devtools/python/python-dateutil_%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -CLEANBROKEN = "1"
> --
> 2.7.4
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000038b4bf058f04d852
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Ju=
l 26, 2019 at 1:36 AM &lt;<a href=3D"mailto:mingli.yu@windriver.com">mingli=
.yu@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.=
com" target=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
<br>
The current bbappend only has below logic:<br>
CLEANBROKEN =3D &quot;1&quot;<br>
<br>
For python-dateutil, the distutils class is about to<br>
do a clean via &quot;setup.py clean&quot; as below logic in distutils<br>
class without CLEANBROKE =3D &quot;1&quot;:<br>
distutils_do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${CLEANBROKEN}&quot; !=3D &quot;1&qu=
ot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NO_FETCH_BUILD=3D1 =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${STAGING_BINDIR_NA=
TIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py clean ${DISTUTILS_BUILD_ARG=
S}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
}<br>
<br>
But it works for python-dateutil, no need to set<br>
CLEANBROKEN, so remove this bbappend.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com" tar=
get=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/python-dateutil_%.bbappend | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
=C2=A0delete mode 100644 recipes-devtools/python/python-dateutil_%.bbappend=
<br>
<br>
diff --git a/recipes-devtools/python/python-dateutil_%.bbappend b/recipes-d=
evtools/python/python-dateutil_%.bbappend<br>
deleted file mode 100644<br>
index 68409e5..0000000<br>
--- a/recipes-devtools/python/python-dateutil_%.bbappend<br>
+++ /dev/null<br>
@@ -1 +0,0 @@<br>
-CLEANBROKEN =3D &quot;1&quot;<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--00000000000038b4bf058f04d852--
