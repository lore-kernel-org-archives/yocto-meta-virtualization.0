Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32078E00B76; Tue, 27 Jun 2017 10:25:16 -0700 (PDT)
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
	*      [209.85.215.45 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.45 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4555FE00B2F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:25:14 -0700 (PDT)
Received: by mail-lf0-f45.google.com with SMTP id m77so21222250lfe.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G2eZPcqf6CTfFf5Tc99JKFtHdYfol/aUQDq3e0ShLgY=;
	b=sJbyC7ITS+dD8gnK/DuG8fOVyIB186Rg+R30891RQ2Wbb4Y21krhhBQAUfjmozQvDJ
	7LLbJhBj0Wn7R8T6CHNV21DhoTr4zAuFC/OTc27nVZsgIB7GEebuH0AhRQtPzVGMWCjU
	hy7qPz6TD8lGBhN7sdxhXnUfcDeCzZ+9N2mAEZRet+4wwT+90l02A/3x+7urg5ods8Od
	Rxc5zj+gd9l5nGTz5dTQhvT1GsOq0zk/jO5iyO+ZQ4OPsTEYQtxTaZAIer14I4FkdGMw
	8nNVSkHzn6ZZ394BaEe+ZN9EyXF26M06jAc/ZHbSPWoG1+BO+WfKZ81mjZD/g5EwDVsj
	NZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G2eZPcqf6CTfFf5Tc99JKFtHdYfol/aUQDq3e0ShLgY=;
	b=SU3hZNR2iTfyvmtd0o3yhG/5N7GxuKw9X6iJbceTL9nXNZDkkIY8RsC00lKtnA5y+4
	Ma/PoWBHYEtkNLM8KYflh6vooYB9eWmib/E8CV8buO/x3dAqU2ej/b+aoj/eamkcySKE
	Q8+jSD+Ed0QYUyjFMpI79COB645530Z8IiIfRXIjchuoaYLO5lee6Q6oN5log+PU3lEL
	Hb4sZEZrSY1QQX3MTTbEW7BjfjQwwSvCNKu1sPYGrJJm/s3Di0WdIrYBK1nQcSUHSXmx
	+dxpzQCkfpZ3DlKvChZnf1el3J+HMe4lcmooPU6qb5S0qWqje1GTBod9e/OSiQWqoTye
	Qquw==
X-Gm-Message-State: AKS2vOwAj9DG54YrFuuZvHMAhK5z5CoqKPkdTcUPQDElyKrAe+KvMdrJ
	wMBDp8xHfUVh9zWOKFAvdpGIHG7xlg==
X-Received: by 10.46.97.26 with SMTP id v26mr1868829ljb.116.1498584313599;
	Tue, 27 Jun 2017 10:25:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Tue, 27 Jun 2017 10:25:12 -0700 (PDT)
In-Reply-To: <1498109109-12828-2-git-send-email-zhe.he@windriver.com>
References: <1498109109-12828-1-git-send-email-zhe.he@windriver.com>
	<1498109109-12828-2-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Jun 2017 13:25:12 -0400
Message-ID: <CADkTA4NUSoFz_yQCvpmbnNCjoQAYAfDKdZohfRg92jp1qmAYjA@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] criu: add bash rdepends
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
X-List-Received-Date: Tue, 27 Jun 2017 17:25:16 -0000
Content-Type: multipart/alternative; boundary="f403045f7400ad9cb90552f45998"

--f403045f7400ad9cb90552f45998
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Jun 22, 2017 at 1:25 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> Fix the following QA warning:
> QA Issue: /usr/libexec/criu/scripts/systemd-autofs-restart.sh contained
> in package criu requires /bin/bash, but no providers found in
> RDEPENDS_criu? [file-rdeps]
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/criu/criu_git.bb
> b/recipes-containers/criu/criu_git.bb
> index 29f136a..849a832 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -28,6 +28,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git
> \
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
>
>  DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native
> libbsd"
> +RDEPENDS_${PN} = "bash"
>
>  S = "${WORKDIR}/git"
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

--f403045f7400ad9cb90552f45998
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jun 22, 2017 at 1:25 AM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"=
_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
<br>
Fix the following QA warning:<br>
QA Issue: /usr/libexec/criu/scripts/<wbr>systemd-autofs-restart.sh containe=
d<br>
in package criu requires /bin/bash, but no providers found in<br>
RDEPENDS_criu? [file-rdeps]<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_<wbr>git.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"=
noreferrer" target=3D"_blank">criu<wbr>_git.bb</a> b/recipes-containers/cri=
u/<a href=3D"http://criu_git.bb" rel=3D"noreferrer" target=3D"_blank">criu<=
wbr>_git.bb</a><br>
index 29f136a..849a832 100644<br>
--- a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu<wbr>_git.bb</a><br>
+++ b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu<wbr>_git.bb</a><br>
@@ -28,6 +28,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/xemu=
l/criu.git;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/=
xemul/criu.<wbr>git;protocol=3Dgit</a> \<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;libnl libcap protobuf-c-native protobuf-c util-lin=
ux-native libbsd&quot;<br>
+RDEPENDS_${PN} =3D &quot;bash&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
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

--f403045f7400ad9cb90552f45998--
