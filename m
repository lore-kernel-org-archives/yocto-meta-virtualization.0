Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B51F0E00C49; Thu,  3 Aug 2017 20:51:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.47 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.47 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF1D9E00C43
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Aug 2017 20:51:35 -0700 (PDT)
Received: by mail-lf0-f47.google.com with SMTP id m86so2022566lfi.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Aug 2017 20:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lGS7PAaPqWWjGzb0wWGkIxWKoq3Sp/ILxHjDCo4cLg4=;
	b=X3z13VoZCbiWJmScaqVftZhcyJV/QemsfjsINSV1SKgjVkH5TVTgWp7hiMVt4g4zKp
	ipuLGsc5+8qn4skPUh54w9AinnChiapCjYz874mPjJcUgptjduN/vU8EdYze5Ref+5K1
	cFO8jji0UJsSWuqWW+VtZJyKFU/X82FAErq0pAxG94aQAdNsyFoONIZI2vhbDTGMVq0S
	HmubYKEe+mk4ydgxP8Xo3ChcJfjXtNSvDsgtEobYQpOq5y6AeUt+QQQxnjoUWY77sH/r
	9bv0wVSS+UOEGeQLkoXgUkJf6mnbobYUeh7ZUCVRCRDeymVfd7Ws336TA6IbbYP8p2F5
	zXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lGS7PAaPqWWjGzb0wWGkIxWKoq3Sp/ILxHjDCo4cLg4=;
	b=HmOPi44viBXQZT3rOiC3mCXAisDIdX9LIlsN8slmpaBbjY8kHcil02oUgOQQJDZSer
	dxlOT13NWy5ayWDC/jPm7Z3ET+Bzsum6JbqUsZUOjnOgl82dlK4Ey3J2Y3YYi/aXiWFF
	qCHcKUOAa+5alqucOWQgv1CrDhdGLJ2djqYMmgTWNcF+mc3LIuXrpJWaAkBkeqe6fRWq
	lCnwRBfPt249Pc9Vb+NZmtkm7YI9/WB4FpvPQTdk2o15gQ6zo2Z2iVbBxvr5G9KbfJcn
	W0RjDsLSJ9zwJWEFSiMwkJOJfGyhJw7juJIeaa7z1JxetCHScyE749zP0sF7LaV//rWD
	Jyfw==
X-Gm-Message-State: AHYfb5jY+yBgORhoj5yKkjisAJvBMwrmN5ME40lqD+nh8Z+PikLTtaXl
	wo7DE7Ds1hJ/kfy/sHKji53nmENRAA==
X-Received: by 10.46.81.65 with SMTP id b1mr317836lje.168.1501818695091; Thu,
	03 Aug 2017 20:51:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.18 with HTTP; Thu, 3 Aug 2017 20:51:34 -0700 (PDT)
In-Reply-To: <20170801022251.38972-1-liezhi.yang@windriver.com>
References: <20170801022251.38972-1-liezhi.yang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Aug 2017 23:51:34 -0400
Message-ID: <CADkTA4MEcFV9ae4=3KS0byRzvxwBv6Mgvo5Fc0KZaARX9_R-mg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] cloud-image-guest/controller: remove inherit image-vm
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
X-List-Received-Date: Fri, 04 Aug 2017 03:51:36 -0000
Content-Type: multipart/alternative; boundary="f403045fff28d68c690555e5691a"

--f403045fff28d68c690555e5691a
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Jul 31, 2017 at 10:22 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The image-vm.bbclass had been removed by oe-core, and vmdk is replaced
> by wic.vmdk.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  recipes-extended/images/cloud-image-controller.bb | 3 +--
>  recipes-extended/images/cloud-image-guest.bb      | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-extended/images/cloud-image-controller.bb
> b/recipes-extended/images/cloud-image-controller.bb
> index 0b2a67b..5eef302 100644
> --- a/recipes-extended/images/cloud-image-controller.bb
> +++ b/recipes-extended/images/cloud-image-controller.bb
> @@ -26,9 +26,8 @@ IMAGE_INSTALL = "\
>      "
>
>  inherit core-image
> -inherit image-vm
>
> -IMAGE_FSTYPES = "vmdk tar.gz"
> +IMAGE_FSTYPES = "wic.vmdk tar.gz"
>
>  # Ensure extra space for guest images
>  #IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
> diff --git a/recipes-extended/images/cloud-image-guest.bb
> b/recipes-extended/images/cloud-image-guest.bb
> index e24bf0d..5db25f0 100644
> --- a/recipes-extended/images/cloud-image-guest.bb
> +++ b/recipes-extended/images/cloud-image-guest.bb
> @@ -13,6 +13,5 @@ IMAGE_INSTALL = "\
>      "
>
>  inherit core-image
> -inherit image-vm
>
> -IMAGE_FSTYPES += "vmdk"
> +IMAGE_FSTYPES += "wic.vmdk"
> --
> 2.10.2
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

--f403045fff28d68c690555e5691a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jul 31, 2017 at 10:22 P=
M, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windrive=
r.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">The image-vm.bbclass had been removed by oe=
-core, and vmdk is replaced<br>
by wic.vmdk.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/images/<a href=3D"http://cloud-image-controller.bb" =
rel=3D"noreferrer" target=3D"_blank">cloud-<wbr>image-controller.bb</a> | 3=
 +--<br>
=C2=A0recipes-extended/images/<a href=3D"http://cloud-image-guest.bb" rel=
=3D"noreferrer" target=3D"_blank">cloud-<wbr>image-guest.bb</a>=C2=A0 =C2=
=A0 =C2=A0 | 3 +--<br>
=C2=A02 files changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-extended/images/<a href=3D"http://cloud-image-controll=
er.bb" rel=3D"noreferrer" target=3D"_blank">clou<wbr>d-image-controller.bb<=
/a> b/recipes-extended/images/<a href=3D"http://cloud-image-controller.bb" =
rel=3D"noreferrer" target=3D"_blank">clou<wbr>d-image-controller.bb</a><br>
index 0b2a67b..5eef302 100644<br>
--- a/recipes-extended/images/<a href=3D"http://cloud-image-controller.bb" =
rel=3D"noreferrer" target=3D"_blank">clou<wbr>d-image-controller.bb</a><br>
+++ b/recipes-extended/images/<a href=3D"http://cloud-image-controller.bb" =
rel=3D"noreferrer" target=3D"_blank">clou<wbr>d-image-controller.bb</a><br>
@@ -26,9 +26,8 @@ IMAGE_INSTALL =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0inherit core-image<br>
-inherit image-vm<br>
<br>
-IMAGE_FSTYPES =3D &quot;vmdk tar.gz&quot;<br>
+IMAGE_FSTYPES =3D &quot;wic.vmdk tar.gz&quot;<br>
<br>
=C2=A0# Ensure extra space for guest images<br>
=C2=A0#IMAGE_ROOTFS_EXTRA_SPACE =3D &quot;41943040&quot;<br>
diff --git a/recipes-extended/images/<a href=3D"http://cloud-image-guest.bb=
" rel=3D"noreferrer" target=3D"_blank">clou<wbr>d-image-guest.bb</a> b/reci=
pes-extended/images/<a href=3D"http://cloud-image-guest.bb" rel=3D"noreferr=
er" target=3D"_blank">clou<wbr>d-image-guest.bb</a><br>
index e24bf0d..5db25f0 100644<br>
--- a/recipes-extended/images/<a href=3D"http://cloud-image-guest.bb" rel=
=3D"noreferrer" target=3D"_blank">clou<wbr>d-image-guest.bb</a><br>
+++ b/recipes-extended/images/<a href=3D"http://cloud-image-guest.bb" rel=
=3D"noreferrer" target=3D"_blank">clou<wbr>d-image-guest.bb</a><br>
@@ -13,6 +13,5 @@ IMAGE_INSTALL =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0inherit core-image<br>
-inherit image-vm<br>
<br>
-IMAGE_FSTYPES +=3D &quot;vmdk&quot;<br>
+IMAGE_FSTYPES +=3D &quot;wic.vmdk&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
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

--f403045fff28d68c690555e5691a--
