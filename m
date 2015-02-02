Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1C08E00717; Sun,  1 Feb 2015 23:11:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36446E005A9
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Feb 2015 23:10:52 -0800 (PST)
Received: by mail-la0-f42.google.com with SMTP id ms9so37714537lab.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 01 Feb 2015 23:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wIb/CyrbW91DfHKRsUYjgsCOgvV78ipW2pHSmn74EHQ=;
	b=gLoLie1vIQdQLz9xkZMnDJJGmIKZCMN0IejDth5lt0PoQtFeHl7JOJIYSPotHYa4U8
	mJd7HaIrqabJC0c3azYYamyRCMd5RGAYbtM+cClOllq/QvPF81RfCKLGs3zo9tBnmwnw
	lotAVSwpgfveiM4mP6fL2u85zgbGrPDsDA/fIgvefjfSaroQ+Kp6jvlB2MEac3S23giS
	ken/K3nLEE+wd3FZyTHscj4sYBfvpPz6iuHs7ZyLJMn2f1SITAugjIy8Vy2kL5qqcQFn
	tD6vsdHFKr3n9Snaxm4vcf09fQPEbhZA75uiDc5wXXH892CKEcgR6dLWp46wPjjrGP8F
	3rAg==
MIME-Version: 1.0
X-Received: by 10.112.184.198 with SMTP id ew6mr17749865lbc.71.1422861050201; 
	Sun, 01 Feb 2015 23:10:50 -0800 (PST)
Received: by 10.114.182.115 with HTTP; Sun, 1 Feb 2015 23:10:50 -0800 (PST)
In-Reply-To: <a7ba7b2cdf844220a4a6adfd0e685199@BL2FFO11FD026.protection.gbl>
References: <1422588708-17225-1-git-send-email-nathan.rossi@xilinx.com>
	<a7ba7b2cdf844220a4a6adfd0e685199@BL2FFO11FD026.protection.gbl>
Date: Mon, 2 Feb 2015 02:10:50 -0500
Message-ID: <CABZSBQfG7Q9F17e1ZoM7KP-eGGGxbog9VEzTvmhNgNj2wRRPwQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC 8/8] xen-image-minimal: Install qemu instead of xen-qemu
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
X-List-Received-Date: Mon, 02 Feb 2015 07:11:10 -0000
Content-Type: multipart/alternative; boundary=001a11c3c96a764c98050e15a7d8

--001a11c3c96a764c98050e15a7d8
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 29, 2015 at 10:31 PM, Nathan Rossi <nathan.rossi@xilinx.com>
wrote:

> * Install QEMU from the distro as opposed to a specific xen-qemu setup
>

Missing sign-off, otherwise LGTM


> ---
>  recipes-extended/images/xen-image-minimal.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/images/xen-image-minimal.bb
> b/recipes-extended/images/xen-image-minimal.bb
> index aed0526..26b6d06 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -13,7 +13,7 @@ IMAGE_INSTALL += " \
>      ${@bb.utils.contains('MACHINE_FEATURES', 'pci',
> 'kernel-module-xen-pciback', '', d)} \
>      kernel-module-xen-wdt \
>      xen-base \
> -    xen-qemu \
> +    qemu \
>      "
>
>  LICENSE = "MIT"
> --
> 2.1.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--001a11c3c96a764c98050e15a7d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><div><div class=3D"gmail_extra"><div class=3D"gma=
il_quote">On Thu, Jan 29, 2015 at 10:31 PM, Nathan Rossi <span dir=3D"ltr">=
&lt;<a href=3D"mailto:nathan.rossi@xilinx.com" target=3D"_blank">nathan.ros=
si@xilinx.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* Ins=
tall QEMU from the distro as opposed to a specific xen-qemu setup<br></bloc=
kquote><div><br></div><div>Missing sign-off, otherwise LGTM<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" targe=
t=3D"_blank">xen-image-minimal.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb=
" target=3D"_blank">xen-image-minimal.bb</a> b/recipes-extended/images/<a h=
ref=3D"http://xen-image-minimal.bb" target=3D"_blank">xen-image-minimal.bb<=
/a><br>
index aed0526..26b6d06 100644<br>
--- a/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" targe=
t=3D"_blank">xen-image-minimal.bb</a><br>
+++ b/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" targe=
t=3D"_blank">xen-image-minimal.bb</a><br>
@@ -13,7 +13,7 @@ IMAGE_INSTALL +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;MACHINE_FEATURES&#39;, &#39;p=
ci&#39;, &#39;kernel-module-xen-pciback&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0kernel-module-xen-wdt \<br>
=C2=A0 =C2=A0 =C2=A0xen-base \<br>
-=C2=A0 =C2=A0 xen-qemu \<br>
+=C2=A0 =C2=A0 qemu \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
<span><font color=3D"#888888">--<br>
2.1.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br></div></div></div></div>

--001a11c3c96a764c98050e15a7d8--
