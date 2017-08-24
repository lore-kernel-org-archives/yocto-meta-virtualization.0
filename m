Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDACFE00BA2; Thu, 24 Aug 2017 06:56:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.178 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.178 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEC92E0090A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:56:24 -0700 (PDT)
Received: by mail-ua0-f178.google.com with SMTP id 60so2320108uac.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eFaOa2ewl4f/kpLgKXvk0hZiWksY6m08A5ZmpqA0K+k=;
	b=pHKBHMKPkIpBnqs4mV6zGhgIg1Ep+oVG8w5923gTQc9QnafsOoVaEW2atVtK6IwKDX
	4Y6CLbeKzzbB6vdhZpIUTNuwhNFKQl8gqKY0njpG0L9HP/F3Y/AennqMGlp9Y7pDGJb9
	tKCzRDiSp7Ll/u4sPK27ckoGRgq8khcBHDaZIb72rMqVltMWXy8++0LEbeJZoF08NqaU
	A+XUblfe7U8kxslOhIANW/Af306DUlyXH8Tg8Vg3KaLSwhm8Wqco5EkLbC2GXxEvLNRG
	kmmlINUSAna+ROiqWoaoOMkGqo/deoiIUU9MKN2DmvC4FjYjN2/K2zltC8MVFKI/iDRo
	MZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eFaOa2ewl4f/kpLgKXvk0hZiWksY6m08A5ZmpqA0K+k=;
	b=hudOEeROrW2Uwiumj2Ba7N9Pc+vR3W1PPvUTCqAye0MB9nfB7p7jPLo8IaWPM7yrO+
	6WDlXIjeMMjLAZGeS0/xZetDHeARKSiZUHnKoKZtczGMbWtZUyi818Zb6XMPn5JUUs+8
	mFSvB7SK3xJZQvQnM6Zw68bRwlA654AgzSBTrCMao38bAyFWVICEnnqEXk8yerT+kypD
	gRl4yDwq+PWyREPJALpC22FdlKSH4Ago1UcUXC90ShsXXubJcO7UXkHi8ejoPz/s/FJA
	k9+8pgz3rg5EmRlPq/o4vlLhy68/cWyt69yFRudCuqWsvdJcY9F46bFnBTkwNb0Fy0EM
	N6qA==
X-Gm-Message-State: AHYfb5iAkxbyqhCurwms1qZdT2JCBbBCIYlVD1BaT/M91TVgmGcQ0i9d
	fCf/XEfflpQ4GtYxeW5Mb9MGCDL8Nw==
X-Received: by 10.159.58.96 with SMTP id r32mr2883592uag.168.1503582983924;
	Thu, 24 Aug 2017 06:56:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 24 Aug 2017 06:56:23 -0700 (PDT)
In-Reply-To: <1503519081-6755-1-git-send-email-mark.asselstine@windriver.com>
References: <1503519081-6755-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2017 09:56:23 -0400
Message-ID: <CADkTA4OUcCVWveiWvGZCHjRG__j4gN8XpnpbPgXgbMsAst_LHw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: fix build failure, failing QA check
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
X-List-Received-Date: Thu, 24 Aug 2017 13:56:25 -0000
Content-Type: multipart/alternative; boundary="f403045e903aa5b44805578031f5"

--f403045e903aa5b44805578031f5
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Aug 23, 2017 at 4:11 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> The build is failing due to a failing QA check:
>
>   ERROR: lxc-2.0.8-r0 do_package_qa: QA Issue:
>   /usr/lib/lxc/ptest/src/tests/lxc-test-may-control contained in
>   package lxc-ptest requires /bin/bash, but no providers found in
>   RDEPENDS_lxc-ptest? [file-rdeps]
>
> Add bash to the the ptest RDEPENDS.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-containers/lxc/lxc_2.0.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/
> lxc_2.0.8.bb
> index 8b5d77f..93d5a10 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -22,7 +22,7 @@ RDEPENDS_${PN} = " \
>                 gnutls \
>                 nettle \
>  "
> -RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls"
> +RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash"
>
>  SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
> --
> 2.7.4
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

--f403045e903aa5b44805578031f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Aug 23, 2017 at 4:11 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">The build is failing due to a fa=
iling QA check:<br>
<br>
=C2=A0 ERROR: lxc-2.0.8-r0 do_package_qa: QA Issue:<br>
=C2=A0 /usr/lib/lxc/ptest/src/tests/<wbr>lxc-test-may-control contained in<=
br>
=C2=A0 package lxc-ptest requires /bin/bash, but no providers found in<br>
=C2=A0 RDEPENDS_lxc-ptest? [file-rdeps]<br>
<br>
Add bash to the the ptest RDEPENDS.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.8.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.8.bb</a><br>
index 8b5d77f..93d5a10 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
@@ -22,7 +22,7 @@ RDEPENDS_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gnutls \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nettle \<br>
=C2=A0&quot;<br>
-RDEPENDS_${PN}-ptest +=3D &quot;file make gmp nettle gnutls&quot;<br>
+RDEPENDS_${PN}-ptest +=3D &quot;file make gmp nettle gnutls bash&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/downloads/${B=
PN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://linuxcontaine=
rs.org/<wbr>downloads/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-1.0.0-disable-<wbr>udhcp-from-busybo=
x-template.<wbr>patch \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--f403045e903aa5b44805578031f5--
