Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C552BE00B76; Tue, 27 Jun 2017 10:25:28 -0700 (PDT)
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
	*      [209.85.215.66 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.66 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3977E00B2F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:25:27 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id n136so3289111lfn.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bv41AWs3GIdJpEyx9/Hk5VQOX7+WMxE5pDTkXcfbFtU=;
	b=ghWxJWq8qN/Yo6PTnCpNVP59CM5HqtR9MXhTcSCR0lMUd4O2kW+qfyGINknGffvcRT
	uDq9koqOEWR0fFzkPE55eJCbZor8rYjBvUpz/s4KiEfPBLKo0uwkzMl+99Tkih8fCKEa
	aINKMxzizS8nxKj588P+sJmawXPSmljOIfbzzvRY09NcgrV6XCXGMIFMQfiuvG2S1nQq
	lL/v28xFwHYGOjsaUoREY7BhvdlJY93Nhv81JxA4/01+oSe+Q+T/zryp8nhsus9oJjpV
	ciwiC/juGGbPg4IflSGE7iX88KFYS3aleqk1Z2TVbbjkqXQzsSHhkXiJh9+b9YlLQu31
	D+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bv41AWs3GIdJpEyx9/Hk5VQOX7+WMxE5pDTkXcfbFtU=;
	b=Ez6WYr/SgSIy0An9pmUfEJPHlvP/BRuzRSkd+AjJKgnAQhcjxDV7D1NMKWGqBEb9za
	hjdJZI5xo/5GcetJTdji1Xjc4bibQin/SCTB7mx8K5CISNM4VgkBfLONEdsClpxN/7vP
	Tl27QoK/aXmnGTsu7zODbdrqevQ4+e916eEfiyb3vn+y1fai8RrYxTKE5J/wmgP2XS1e
	5uGPd0+skHqoVAmd4j8ExZDfpbxW9U8HkQ39woZuafM0fptDLqdMWWLMkV8JpGFPjpy+
	7KJBPBj91/vvlwVSce+HCgU+AXnjQG2FDC5tW02jAwczRvL05xf4uS3KElOzitsszNSY
	cXIQ==
X-Gm-Message-State: AKS2vOwXKRcZF3gauM1ro5Q8KlyM3JI1NJ+8KqD/PBwp/aZnZsAq9fZO
	oYJCtUM88HDb6aWP7QZ78Fm6zBwNpA==
X-Received: by 10.46.87.16 with SMTP id l16mr2076270ljb.100.1498584326248;
	Tue, 27 Jun 2017 10:25:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Tue, 27 Jun 2017 10:25:25 -0700 (PDT)
In-Reply-To: <1498109109-12828-1-git-send-email-zhe.he@windriver.com>
References: <1498109109-12828-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Jun 2017 13:25:25 -0400
Message-ID: <CADkTA4Ptgw8t_Q_U=VpgiunnzXSc=9KKu1Uu5L4dTW_U9_Qj6A@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] criu: add libbsd rdepends
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
X-List-Received-Date: Tue, 27 Jun 2017 17:25:28 -0000
Content-Type: multipart/alternative; boundary="f403045f85cc6ea1450552f45add"

--f403045f85cc6ea1450552f45add
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Jun 22, 2017 at 1:25 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> Fix the following QA warning:
> QA Issue: criu rdepends on libbsd, but it isn't a build dependency?
> [build-deps]
>
> This had been fixed by 1fd94d853545b55173b1f0e2cf683a5d21f8cd7b,
> but then was overwritten by b9b7ece0cd52966467035fb71ad9ba472bf24b88
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/criu/criu_git.bb
> b/recipes-containers/criu/criu_git.bb
> index 21dee2b..29f136a 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -27,7 +27,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git
> \
>
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
>
> -DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native"
> +DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native
> libbsd"
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

--f403045f85cc6ea1450552f45add
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
QA Issue: criu rdepends on libbsd, but it isn&#39;t a build dependency? [bu=
ild-deps]<br>
<br>
This had been fixed by 1fd94d853545b55173b1f0e2cf683a<wbr>5d21f8cd7b,<br>
but then was overwritten by b9b7ece0cd52966467035fb71ad9ba<wbr>472bf24b88<b=
r>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_<wbr>git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"=
noreferrer" target=3D"_blank">criu<wbr>_git.bb</a> b/recipes-containers/cri=
u/<a href=3D"http://criu_git.bb" rel=3D"noreferrer" target=3D"_blank">criu<=
wbr>_git.bb</a><br>
index 21dee2b..29f136a 100644<br>
--- a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu<wbr>_git.bb</a><br>
+++ b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu<wbr>_git.bb</a><br>
@@ -27,7 +27,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/xemu=
l/criu.git;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/=
xemul/criu.<wbr>git;protocol=3Dgit</a> \<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
<br>
-DEPENDS +=3D &quot;libnl libcap protobuf-c-native protobuf-c util-linux-na=
tive&quot;<br>
+DEPENDS +=3D &quot;libnl libcap protobuf-c-native protobuf-c util-linux-na=
tive libbsd&quot;<br>
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

--f403045f85cc6ea1450552f45add--
