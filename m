Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8928E00C55; Thu,  3 Aug 2017 20:52:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.66 listed in dnsbl.sorbs.net]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0125EE00C49
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Aug 2017 20:52:20 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id y15so321489lfd.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Aug 2017 20:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gt/BT4RNkbE35JaR83A9BBAcY6jK2ywMw1wVIg11iJA=;
	b=CVsQ2laWzcu4Hig9ggG9xOeVvsIAtN1ctHzgXLoln2PfHi6z4ez+GdIfuP+Fuqwn/A
	uPtgyaqvhgS0fiIdEmg6McGUDjKRcXaiATtngB/kPqT1wM3DAYJS2rAG/27MTbuciSuT
	Rbqt33MehMsYC9g6eZPiwoNr8pfHBEFR4+ZXjIh9s6dsBSRDy044vFsXO2ChaGzcsw2r
	aSlvzQjHgR8QDXcJ67HamlN8Frqpm122/x/c31KZXCPfuuaEErqGDWycudTiw3LRPVeG
	MUtYSVAPSc9Lk74h88eSrPMu+5yU53AALIHELlS1fAu2l5FGoQWmj/gbaMqMruX858Gj
	wC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gt/BT4RNkbE35JaR83A9BBAcY6jK2ywMw1wVIg11iJA=;
	b=H8Sip+Itl2YOX1gjYpgNYkd9FQm0+R4R1YMdx52ntoemQWc3VGTQ5knfg74KZcQ7Y+
	8SIvgiC1twP8Te+06jZ5Et4OcaBXlYUUgBHojPc5ns0OYBKXrFA5zfx/etw4QY8nmFaX
	XWcrrsMIU8ZCzeZeVetVjmY4GVPNlfhi8KnFFa58jP++9nLtUqu5Sn2ztfdhbuPyiMsi
	az2Pts+c2nEEyPc6syeX8OhckeA7dtXhtQYCgLti6/QMHrg/Xf2POvQNXK3hLnBT4zAr
	ich3VGebWo4lT+r25lcMdRzAlh4SA7FtKXYgqCqt4OmWqq93W0N7fTl2wbd9B5rHgbuj
	DOFg==
X-Gm-Message-State: AHYfb5iGiAcieLphBjtYSZ9234feRtdwSvRGKpUPwPzdaxe7AY85cT4v
	VdPbESmy20uGaJ1oVz7h3o7hSZvyyg==
X-Received: by 10.25.166.213 with SMTP id p204mr229214lfe.191.1501818739764;
	Thu, 03 Aug 2017 20:52:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.18 with HTTP; Thu, 3 Aug 2017 20:52:19 -0700 (PDT)
In-Reply-To: <1501654551-155594-1-git-send-email-fupan.li@windriver.com>
References: <1501654551-155594-1-git-send-email-fupan.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Aug 2017 23:52:19 -0400
Message-ID: <CADkTA4PmW7H9TF_Nn8u7CVVYtVM+K69GEB4OG+1mBPST4GYamw@mail.gmail.com>
To: Fupan Li <fupan.li@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] meta-virtualization:remove inheritting class image-vm
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
X-List-Received-Date: Fri, 04 Aug 2017 03:52:22 -0000
Content-Type: multipart/alternative; boundary="001a114115848033c50555e56ca6"

--001a114115848033c50555e56ca6
Content-Type: text/plain; charset="UTF-8"

Robert Yang had already sent this, so I skipped it. but patch 2/2 is
applied.

Bruce

On Wed, Aug 2, 2017 at 2:15 AM, Fupan Li <fupan.li@windriver.com> wrote:

> oe-core had removed image-vm.bbclass in the commit of
> 929ba563f1bc7195c4981b8e139c432b2cc388ea and using wic.vmdk
> to replace vmdk in IMAGE_FSTYPES.
>
> Signed-off-by: Fupan Li <fupan.li@windriver.com>
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

--001a114115848033c50555e56ca6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Robert Yang had already sent this, so I skipped it. but pa=
tch 2/2 is applied.<div><br></div><div>Bruce</div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Wed, Aug 2, 2017 at 2:15 AM, Fupa=
n Li <span dir=3D"ltr">&lt;<a href=3D"mailto:fupan.li@windriver.com" target=
=3D"_blank">fupan.li@windriver.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">oe-core had removed image-vm.bbclass in the commit of<br>
929ba563f1bc7195c4981b8e139c43<wbr>2b2cc388ea and using wic.vmdk<br>
to replace vmdk in IMAGE_FSTYPES.<br>
<br>
Signed-off-by: Fupan Li &lt;<a href=3D"mailto:fupan.li@windriver.com">fupan=
.li@windriver.com</a>&gt;<br>
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

--001a114115848033c50555e56ca6--
