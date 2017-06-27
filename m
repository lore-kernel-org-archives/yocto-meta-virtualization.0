Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C330E00B76; Tue, 27 Jun 2017 10:25:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.68 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B284E00B2F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:25:38 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id n136so3289384lfn.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WvdWQbYbME5xcnOcEIHZpk1m/7HD8UCWUOV4wCgo7es=;
	b=Da7OELky5B1y30qL/HQmXS2AK0UJGcWNEdALdIdLhhW6ZX24yqpMe70/bGAG00IaWh
	GqhIZFr6zMIh6bh49koZ+2Zzy4PbIp2/99w7F5x+2K8YpIkqB0NVVytJy4b2qAiXdKjL
	NFg9KnCEMEaDoSoGSe2EpcLJJcnEjGUtVa5Yxq69azBL2GFTQhxytX7t1HhN8uvGu8lV
	w1hSGs/2bm02Q6pYkTMhlZC2jf/gO3k7x0h4UZcEIW8aQI/31AlBPqbr913HntS9i64k
	LrykUqTm5oeHwJhlEhQ4RnRybuUYK93wov6Bqq/t7+64FmevvQNnU+1OQofZO7ACoNnF
	VOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WvdWQbYbME5xcnOcEIHZpk1m/7HD8UCWUOV4wCgo7es=;
	b=nlxFc9cHUvyVgd93yXc1vEZngs2t6Bdaa9KGibfwVHobGX+ggn1e/cLrYsMvUSKe4T
	NIH6hCwFLdVa/aGZlmw1Ni8+D4SfxLTwwrFGUX7Es/gUPL0P/uKlqYMVoF+lXkvN5X/h
	e4I6g6VRqtU+12LiCLcfj8XhkG5SGLkr3NiDxIeXlHvDyVG8oAR28Z2TG2a3v0wRESkd
	RFhRcuz9Zm339Pkat7EqJ4THqo/sh/IVN+Jl4Mnr63xZx74xb71qA1AcAKNaMjek3ZKJ
	D45UABdeiN/kk22RVrCS+EvzFagHWTDGmu3Gmw/jZZw2mVkSR2DmKFRrWCQqmolPB/AH
	ifnQ==
X-Gm-Message-State: AKS2vOzVeR29r8ylB0kcfy0Kcvmu7UGHpHAONzQWmVlK6C5o2pBfVLo0
	i/Iem2yS/CxO0gB1cOVCaPxTF3JHKg==
X-Received: by 10.25.213.129 with SMTP id m123mr1935067lfg.28.1498584337019;
	Tue, 27 Jun 2017 10:25:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Tue, 27 Jun 2017 10:25:36 -0700 (PDT)
In-Reply-To: <1498122883-17423-1-git-send-email-zhe.he@windriver.com>
References: <1498122883-17423-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Jun 2017 13:25:36 -0400
Message-ID: <CADkTA4M_PxTANvTEkjbOkv4Fy0R035LT+WmcV4X2RDTzod6Z3w@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: add gmp libidn gnutls nettle rdepends
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
X-List-Received-Date: Tue, 27 Jun 2017 17:25:40 -0000
Content-Type: multipart/alternative; boundary="001a1142038012f8230552f45b7c"

--001a1142038012f8230552f45b7c
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Jun 22, 2017 at 5:14 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> Fix the following QA warnings:
> QA Issue: lxc rdepends on gmp, but it isn't a build dependency,
> missing gmp in DEPENDS or PACKAGECONFIG? [build-deps]
> QA Issue: lxc rdepends on libidn, but it isn't a build dependency,
> missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]
> QA Issue: lxc rdepends on gnutls, but it isn't a build dependency,
> missing gnutls in DEPENDS or PACKAGECONFIG? [build-deps]
> QA Issue: lxc rdepends on nettle, but it isn't a build dependency,
> missing nettle in DEPENDS or PACKAGECONFIG? [build-deps]
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-containers/lxc/lxc_2.0.8.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/
> lxc_2.0.8.bb
> index 3dd9f63..f4d1102 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -17,6 +17,10 @@ RDEPENDS_${PN} = " \
>                 perl-module-constant \
>                 perl-module-overload \
>                 perl-module-exporter-heavy \
> +               gmp \
> +               libidn \
> +               gnutls \
> +               nettle \
>  "
>  RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls"
>
> --
> 2.8.1
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

--001a1142038012f8230552f45b7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jun 22, 2017 at 5:14 AM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"=
_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
<br>
Fix the following QA warnings:<br>
QA Issue: lxc rdepends on gmp, but it isn&#39;t a build dependency,<br>
missing gmp in DEPENDS or PACKAGECONFIG? [build-deps]<br>
QA Issue: lxc rdepends on libidn, but it isn&#39;t a build dependency,<br>
missing libidn in DEPENDS or PACKAGECONFIG? [build-deps]<br>
QA Issue: lxc rdepends on gnutls, but it isn&#39;t a build dependency,<br>
missing gnutls in DEPENDS or PACKAGECONFIG? [build-deps]<br>
QA Issue: lxc rdepends on nettle, but it isn&#39;t a build dependency,<br>
missing nettle in DEPENDS or PACKAGECONFIG? [build-deps]<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.8.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.8.bb</a><br>
index 3dd9f63..f4d1102 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
@@ -17,6 +17,10 @@ RDEPENDS_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-constan=
t \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-overloa=
d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-exporte=
r-heavy \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libidn \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnutls \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nettle \<br>
=C2=A0&quot;<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;file make gmp nettle gnutls&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.8.1<br>
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

--001a1142038012f8230552f45b7c--
