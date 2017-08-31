Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F2F1E00C7B; Thu, 31 Aug 2017 12:24:53 -0700 (PDT)
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
	*      [209.85.217.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.170 listed in dnsbl.sorbs.net]
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28964E00C7A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Aug 2017 12:24:50 -0700 (PDT)
Received: by mail-ua0-f170.google.com with SMTP id c27so1774112uah.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Aug 2017 12:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pXcKs8Y/7W/DDB/E+Tqs1/3RwGNGVdRr43E8jtqUcyY=;
	b=AGw0LTUjyaVmOSzNsNtgcBOW7Vf9VNOmy93YZ87WgFnOUwLfyMVde42J6ZpV/PoHQw
	W5V0prJ6nHYZqmA/e8GsxBubcOcnQ+zJ90nS9ont9u8V1Dqo8Dh1Ei96oU9ti0t4av2V
	APXas950TmTRF66WgVBn/Rs5Lp0a+ngYOW2rHSDMB/RcCJt+LBiJ2508n+y44KdVc25i
	NlJQ3Dr59Y8gfdYSHsc29KH4iFRo0/fXP9o6TG74OFsHL8nDx2U0yAN4RxYySvZ70FL0
	+bJcJe06lhiABFFUMIgJXXVlLLX1UoQ9jSzvIgTYZ/poTLBAaTMSCt0GaMQA2xP6b32Z
	HL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pXcKs8Y/7W/DDB/E+Tqs1/3RwGNGVdRr43E8jtqUcyY=;
	b=Idy7lKK+F9Uisg1DlDlyHBQkfWu7hyD1+OkDETSgHiPB4BJXA0rNuXIGRPw0bwvxYd
	fNORW/KuWcfOzZgUhuWgyxIqhHRZrv9AmEj0kp0XZ6bQjGGJ/qe22haCWYuOarHRW0I+
	GBOTFj5+IxRWkQKLYg0z9DNHnG67Hk99zHTw8sF96jidhzb9vqmmzGec8hGrRZNDKOVW
	qfLC8y6hcZV0wbVNrL9BpAjKNJf8wGPHeBz0bEg1D9jKTAi4fJrQYK62iYr3gh4OgC0w
	WQimluLvR/Cz326yRN3lCbB324n6Dx0JLriHTrLGFc4s+cQkw1IzgNOgDGkScEc/w4V/
	HSMQ==
X-Gm-Message-State: AHPjjUjhM2MPxDugMwKHHH7XR1HFEwQ4wuunq/59mhW+Yb+rT3rEIhsM
	M4vmG4FBaL1Kua2eJMkW7XSOzatTdQ==
X-Google-Smtp-Source: ADKCNb4A9+6ExxblRuouosOf52e7KRM8FTe1MJuTjqYiFhGDKOZDriGaSHjYkvN++F6EEsMFgatNBN8VXZYTnPuoZlM=
X-Received: by 10.159.58.211 with SMTP id q19mr2159197uag.3.1504207490185;
	Thu, 31 Aug 2017 12:24:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 31 Aug 2017 12:24:49 -0700 (PDT)
In-Reply-To: <1504099202-93864-1-git-send-email-tiniuc.alexandru@gmail.com>
References: <1504099202-93864-1-git-send-email-tiniuc.alexandru@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Aug 2017 15:24:49 -0400
Message-ID: <CADkTA4Pwfg4vFy+2Mk4kpc=k-JASAxXZ==8DtNOMS0isoAPstw@mail.gmail.com>
To: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Added dependency to Bash
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
X-List-Received-Date: Thu, 31 Aug 2017 19:24:53 -0000
Content-Type: multipart/alternative; boundary="f403045ed83c1f000905581199d8"

--f403045ed83c1f000905581199d8
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Aug 30, 2017 at 9:20 AM, Alexandru Tiniuc <
tiniuc.alexandru@gmail.com> wrote:

> If Bash is not included by any other recipe, the recipe fails at the QA
> check. This commit adds Bash to the list of dependencies, preventing
> this issue.
>
> Signed-off-by: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
> ---
>  recipes-containers/singularity/singularity_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/singularity/singularity_git.bb
> b/recipes-containers/singularity/singularity_git.bb
> index d0fbeb9..8b97740 100644
> --- a/recipes-containers/singularity/singularity_git.bb
> +++ b/recipes-containers/singularity/singularity_git.bb
> @@ -2,7 +2,7 @@
>  # Singularity build / config: read up on the dev-so test for more info)
>  INSANE_SKIP_${PN} += "dev-so"
>
> -RDEPENDS_${PN} += "glibc python3 ca-certificates openssl"
> +RDEPENDS_${PN} += "glibc python3 ca-certificates openssl bash"
>  # Singularity expects to find python3 under the name python, therefore
> both
>  # cannot be installed at the same time.
>  RCONFLICTS_${PN} = "python"
> --
> 2.1.4
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

--f403045ed83c1f000905581199d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Aug 30, 2017 at 9:20 AM=
, Alexandru Tiniuc <span dir=3D"ltr">&lt;<a href=3D"mailto:tiniuc.alexandru=
@gmail.com" target=3D"_blank">tiniuc.alexandru@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">If Bash is not included by any other =
recipe, the recipe fails at the QA<br>
check. This commit adds Bash to the list of dependencies, preventing<br>
this issue.<br>
<br>
Signed-off-by: Alexandru Tiniuc &lt;<a href=3D"mailto:tiniuc.alexandru@gmai=
l.com">tiniuc.alexandru@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/<wbr>singularity/<a href=3D"http://singularity_git=
.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/<wbr>singularity/<a href=3D"http://singular=
ity_git.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a> b/r=
ecipes-containers/<wbr>singularity/<a href=3D"http://singularity_git.bb" re=
l=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
index d0fbeb9..8b97740 100644<br>
--- a/recipes-containers/<wbr>singularity/<a href=3D"http://singularity_git=
.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
+++ b/recipes-containers/<wbr>singularity/<a href=3D"http://singularity_git=
.bb" rel=3D"noreferrer" target=3D"_blank">singularity_git.bb</a><br>
@@ -2,7 +2,7 @@<br>
=C2=A0# Singularity build / config: read up on the dev-so test for more inf=
o)<br>
=C2=A0INSANE_SKIP_${PN} +=3D &quot;dev-so&quot;<br>
<br>
-RDEPENDS_${PN} +=3D &quot;glibc python3 ca-certificates openssl&quot;<br>
+RDEPENDS_${PN} +=3D &quot;glibc python3 ca-certificates openssl bash&quot;=
<br>
=C2=A0# Singularity expects to find python3 under the name python, therefor=
e both<br>
=C2=A0# cannot be installed at the same time.<br>
=C2=A0RCONFLICTS_${PN} =3D &quot;python&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
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

--f403045ed83c1f000905581199d8--
