Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 360B6E00510; Wed,  4 Jan 2017 19:35:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.176 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B48B8E0049D
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Jan 2017 19:35:17 -0800 (PST)
Received: by mail-qk0-f176.google.com with SMTP id u25so416083126qki.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Jan 2017 19:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z5FFYoMKwoWJBJykVEdN6COfWIdf4kRT0pKSTjsUkPc=;
	b=STy+13y1wR3tifLHWBka4AhSRwxKGyN/Z54x5x3QqZw1D5PhzpPmR88rRa34GwWnTC
	SCc8RP7S7alvhLtK8E+oEboSGEf7kb5U6svmVQ8ZgSM6nhCI5iF17obsNrCT3EmJ65ya
	jM1nexaHyY7+mgXPL1nt9wDyKPsokoWIIG1z3Z1w7HKIFZlSDdUDzYBVDXFAYkuj838O
	7KtqSMyME2wYR1D1P4iiWwzUGjDaUaHNUYLx9rdM5lcCwFvhzWoShC2VBema6eBcEooe
	GkWH+hUUE0dXacuun7QZ45EKveLOTCmlO1QgvtEg5X5+IeH3XwCERAimz1+dcJeXsxNS
	1ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z5FFYoMKwoWJBJykVEdN6COfWIdf4kRT0pKSTjsUkPc=;
	b=RXU78l5v9lFJfIWEZBnIF1CGoKMhifIqT5z26E9giXjbzfGaDhfEvQSze7d7gnMnNE
	kKKgSX89YJbgn0N/a6inc/zbg0xe41FSQDYHHAyZ+SinNwjkO01wzvT4vDsPetFgg81v
	1kpUjKNbsuAqRBcnf8ph3jXuGUa6D9wZa4uQSPYPJXNf0iwgIJzktqWzPH7TRPkG7k82
	Jz+0RVNXnfVf2REKDsxt6NJHhJVcAKuIHROgh+8Q8+znzv2G+HYT2Wz35GnAueiuRMp2
	zDczvg/XjUsSxJ0nDjKN+MEqd5Jn/D1CbsINBI4pK+1NCtk/NwPmWDhO7ArXhnmv5wWx
	l7vg==
X-Gm-Message-State: AIkVDXI2xS5uv10ib6JeYTaYPhpGWvoFddn3pd8DN/2eCG/oMKJTxMaKPUgCHkeJE20+Oa/mLLmeHcY3krUCnA==
X-Received: by 10.55.161.11 with SMTP id k11mr68786377qke.149.1483587316769;
	Wed, 04 Jan 2017 19:35:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Wed, 4 Jan 2017 19:35:16 -0800 (PST)
In-Reply-To: <20170105012615.68784-1-fupan.li@windriver.com>
References: <20170105012615.68784-1-fupan.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Jan 2017 22:35:16 -0500
Message-ID: <CADkTA4Os9Di=uSxXPMHnWO7tYgQ71KXPOhwQ2hNF1FNmMK8nUA@mail.gmail.com>
To: fupan <fupan.li@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: add rdepends to initscripts
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
X-List-Received-Date: Thu, 05 Jan 2017 03:35:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c07728e02885405455097f6

--94eb2c07728e02885405455097f6
Content-Type: text/plain; charset=UTF-8

merged

bruce

On Wed, Jan 4, 2017 at 8:26 PM, <fupan.li@windriver.com> wrote:

> From: fli <fupan.li@windriver.com>
>
> lxc's postinst will run populate-volatile.sh scripts,
> which is provided by initscripts package, thus it's better
> to add this rdepends.
>
> Signed-off-by: fli <fupan.li@windriver.com>
> ---
>  recipes-containers/lxc/lxc_2.0.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/
> lxc_2.0.0.bb
> index 53068a8..26c9e1d 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
> @@ -10,6 +10,7 @@ RDEPENDS_${PN} = " \
>                 libcap-bin \
>                 bridge-utils \
>                 dnsmasq \
> +               initscripts \
>                 perl-module-strict \
>                 perl-module-getopt-long \
>                 perl-module-vars \
> --
> 2.9.3
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

--94eb2c07728e02885405455097f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Wed, Jan 4, 2017 at 8:26 PM, =
 <span dir=3D"ltr">&lt;<a href=3D"mailto:fupan.li@windriver.com" target=3D"=
_blank">fupan.li@windriver.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: fli &lt;<a href=3D"mailto:fupan.li@windriver.com">fupan=
.li@windriver.com</a>&gt;<br>
<br>
lxc&#39;s postinst will run populate-volatile.sh scripts,<br>
which is provided by initscripts package, thus it&#39;s better<br>
to add this rdepends.<br>
<br>
Signed-off-by: fli &lt;<a href=3D"mailto:fupan.li@windriver.com">fupan.li@w=
indriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.0.bb</a><br>
index 53068a8..26c9e1d 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
@@ -10,6 +10,7 @@ RDEPENDS_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libcap-bin \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bridge-utils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnsmasq \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initscripts \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-strict =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-getopt-=
long \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-vars \<=
br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.3<br>
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

--94eb2c07728e02885405455097f6--
