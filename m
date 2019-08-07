Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 117BEE00D8B; Tue,  6 Aug 2019 20:12:15 -0700 (PDT)
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
	*      [209.85.208.174 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D02CE00C22
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 20:12:14 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id m23so83947033lje.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Aug 2019 20:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+s1lpaTvJ8xQGd9YFJwWZ81Ddb/XjYTGmuWGMx4TdP8=;
	b=I35RY06nJUQrD4WIjYMggBsk7wlHe0pq7uVLokGuIDc0chglNeeEysU9y0M3s4CWSz
	Y1nCiixaYJl7p2qbTZ3qd9DFWchyz+gZJvmybOTbXKPBxHzcwNjozSH6bY2dX4Mkxz6u
	ckw3kez3DVpi9KpeLhjZagOeTFftmuDbVwL5/CmmJgBIB2UPl+RUM9yZg9DB7U1RA0ml
	j3sHGng9qM+wIoPhhOLYSaEIboUcvCRckaH9kqOVN7GlKINH0SvhizEEcUOQ6oGp1cES
	SKfwvvfmLfu6jO+gffOFlXoFUBUQDrxlRYVToKzcIRSYSk3VxEcfSA71CzEUDMJkpDQt
	pUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+s1lpaTvJ8xQGd9YFJwWZ81Ddb/XjYTGmuWGMx4TdP8=;
	b=PrtqEezig/0H2cVvq+fgcT7ZOo5AMdgPd0AxFHyH+lSRejq/XY7nY44Q6xB2UFKCkD
	Dva5ihUBs9QhsktjfrwHpyg8iBTr6vjaxp+9pobjv6n91yjqNqvY+4zo3Hwf0drGSXBG
	F2mJBjDUIUA15mMdAZwLevgeUfJaqrCFc1QTGNqSYRjERckIgzVKmDrC5Ft1BdGn34fm
	BtMZ1Yd6xtLyNAz4Nmb5ss0LddcEP5z9SLqJrxh47yWh1NgWRS1cpPZ1Fv+eDHvXv4r0
	Twx6oc7gemjFrbnFHO/s5qtYDqF+GToSYxhIsihR+4KXAwDYw0H7xd70EqvI6geLeTN2
	ggew==
X-Gm-Message-State: APjAAAUcQ610Y8mYvPJod+kpHMW4M2Zos2gabjEeHmpVdBv+R4BspJR9
	wbglUXfyVTY0aPDlBSQGkYbwwlozbmYNMUUSU9N7Aw==
X-Google-Smtp-Source: APXvYqx/ckL2mYjCR60fPXgsBbRazOeWNgAr8a9jV4zQNIcTjRGUpIo1B0O1F/NupvWkPI4wkb1VhckHhiUXpnM1XPQ=
X-Received: by 2002:a2e:b048:: with SMTP id d8mr3591191ljl.118.1565147533097; 
	Tue, 06 Aug 2019 20:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190806010148.7325-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190806010148.7325-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Aug 2019 00:12:02 -0300
Message-ID: <CADkTA4PUWzmahBvXSz_fMthy35P30Q=4qUtQ4Kah76vmTOctkA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-ceilometerclient: upgrade 2.9.0 -> 2.9.1
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
X-List-Received-Date: Wed, 07 Aug 2019 03:12:15 -0000
Content-Type: multipart/alternative; boundary="000000000000bb3eb7058f7e4e07"

--000000000000bb3eb7058f7e4e07
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 5, 2019 at 10:03 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-ceilometerclient_git.bb |
> 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-ceilometerclient_git.bb b/meta-openstack/recipes-devtools/python/
> python-ceilometerclient_git.bb
> index 1a13198..77c9c49 100644
> --- a/meta-openstack/recipes-devtools/python/
> python-ceilometerclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/
> python-ceilometerclient_git.bb
> @@ -31,7 +31,7 @@ SRC_URI = "\
>         git://
> github.com/openstack/python-ceilometerclient.git;branch=stable/pike \
>         "
>
> -PV = "2.9.0+git${SRCPV}"
> +PV = "2.9.1"
>  SRCREV = "4ee321feeef39fa2a297ad8e58e931b8a03d8f14"
>  S = "${WORKDIR}/git"
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

--000000000000bb3eb7058f7e4e07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Au=
g 5, 2019 at 10:03 PM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Yuan Chao &lt;<a href=3D"mailto:y=
uanc.fnst@cn.fujitsu.com" target=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&g=
t;<br>
<br>
Signed-off-by: Yuan Chao &lt;<a href=3D"mailto:yuanc.fnst@cn.fujitsu.com" t=
arget=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-ceilo=
meterclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-ceilometerc=
lient_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-ceilometerclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-ceil=
ometerclient_git.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D=
"http://python-ceilometerclient_git.bb" rel=3D"noreferrer" target=3D"_blank=
">python-ceilometerclient_git.bb</a><br>
index 1a13198..77c9c49 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-ceilo=
meterclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-ceilometerc=
lient_git.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-ceilo=
meterclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-ceilometerc=
lient_git.bb</a><br>
@@ -31,7 +31,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/openstack/py=
thon-ceilometerclient.git;branch=3Dstable/pike" rel=3D"noreferrer" target=
=3D"_blank">github.com/openstack/python-ceilometerclient.git;branch=3Dstabl=
e/pike</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-PV =3D &quot;2.9.0+git${SRCPV}&quot;<br>
+PV =3D &quot;2.9.1&quot;<br>
=C2=A0SRCREV =3D &quot;4ee321feeef39fa2a297ad8e58e931b8a03d8f14&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
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

--000000000000bb3eb7058f7e4e07--
