Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0335E00C39; Thu, 24 Mar 2016 08:52:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2A9BE00AEA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:52:01 -0700 (PDT)
Received: by mail-oi0-f44.google.com with SMTP id i21so17624210oig.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=kFlKX+Pmm1e+KDjUZx7quq3Wa1CAWuWt9KWknmszyvg=;
	b=U9ukykcw1BOkuW9RK/+zlmJg1RSqh13iumeNIrMbA+UfynLVcd5qKgiv5YYBeljeN9
	F9hkwStsfQeTP//ACn5uy5ZLVT/Mqpu/KsCBJTX263jvnNqzHrrDrHFRs0AclmPfb/Kj
	EKZlS4ngYdh1nSR0lRMIoOndrx4yG2NHQmqoWEnat9/apYpSg5RtsmGGKz2rdgzCUvu9
	YkFcUevsed2aXBBahpV9g7QnhvaFpYabimKq0m5C2RkUrDwL8vhwDoWZHxr40u0jirmf
	Tj1STuQ6BiW0Zo2Lb3lrziRIUw47k0fi++RhykiOJvU9cOKgc/RFJjKJdzyXToa0mDzz
	T5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=kFlKX+Pmm1e+KDjUZx7quq3Wa1CAWuWt9KWknmszyvg=;
	b=HIb+3EdZciJ5ifWK5iR7BJRpBjl/Xg0dd520K14BDblcirle67LvqdtBSIj4E29elh
	RJnqMUkfto6A6zqnDHWiVDvkD2K7rAADjs87DNCMxJEaoGPaMdPgyu1s2+S2u3lw4aY5
	ilWmZ6MxWMA4qvSU2rTwUKrGUK6jxzgN0OPnSNRlpiDsQct+Uf97SVBc9NHUOGzWNcGs
	+06hj7fPDQr+h5OW+10p1mi87zIQ7hn9Q0K4mc+j2Qr6sge2e8JaBXLTQM9i6zNikuRC
	AMvKE/eLiAKDKiSqTOKMoaad1l2cs+EeOGapb1KwfnQwz+ebe+SoUt624lLLVUyHiH8L
	EFkw==
X-Gm-Message-State: AD7BkJKLeEtm+ArC+UsUG5Us/UWpugXObwOaf+s0sXAloOaCEn2gBiytx/wdbupT4TC5/ibOY3j0CnbKH8p9mQ==
MIME-Version: 1.0
X-Received: by 10.202.190.87 with SMTP id o84mr4635293oif.109.1458834682255;
	Thu, 24 Mar 2016 08:51:22 -0700 (PDT)
Received: by 10.157.8.248 with HTTP; Thu, 24 Mar 2016 08:51:22 -0700 (PDT)
In-Reply-To: <1458833417-7662-1-git-send-email-derek@asterius.io>
References: <1458833417-7662-1-git-send-email-derek@asterius.io>
Date: Thu, 24 Mar 2016 11:51:22 -0400
Message-ID: <CADkTA4McjEaCM_VspSypr8sAWLHM-TsuFFSBAFVJJtV6knGsOQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] ipxe: add cdr-tools-native to the list of depends
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
X-List-Received-Date: Thu, 24 Mar 2016 15:52:04 -0000
Content-Type: multipart/alternative; boundary=001a113d677205a063052ecd6b7a

--001a113d677205a063052ecd6b7a
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 11:30 AM, Derek Straka <derek@asterius.io> wrote:

> During the compile phase, ipxe needs to use mkisofs which is part of
> cdrtools
>

merged.

Bruce


>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  recipes-extended/ipxe/ipxe_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/
> ipxe_git.bb
> index 6dc492e..d52c567 100644
> --- a/recipes-extended/ipxe/ipxe_git.bb
> +++ b/recipes-extended/ipxe/ipxe_git.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Open source network boot firmware"
>  HOMEPAGE = "http://ipxe.org"
>  LICENSE = "GPLv2"
> -DEPENDS = "binutils-native perl-native syslinux mtools-native"
> +DEPENDS = "binutils-native perl-native syslinux mtools-native
> cdrtools-native"
>  LIC_FILES_CHKSUM =
> "file://../COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
>  SRCREV = "8c43891db4eb131d019360ccfb619f235b17eb58"
> --
> 1.9.1
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

--001a113d677205a063052ecd6b7a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 24, 2016 at 11:30 AM, Derek Straka <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">During the compile phas=
e, ipxe needs to use mkisofs which is part of cdrtools<br></blockquote><div=
><br></div><div>merged.</div><div><br></div><div>Bruce</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">derek@=
asterius.io</a>&gt;<br>
---<br>
=C2=A0recipes-extended/ipxe/<a href=3D"http://ipxe_git.bb" rel=3D"noreferre=
r" target=3D"_blank">ipxe_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/ipxe/<a href=3D"http://ipxe_git.bb" rel=3D"no=
referrer" target=3D"_blank">ipxe_git.bb</a> b/recipes-extended/ipxe/<a href=
=3D"http://ipxe_git.bb" rel=3D"noreferrer" target=3D"_blank">ipxe_git.bb</a=
><br>
index 6dc492e..d52c567 100644<br>
--- a/recipes-extended/ipxe/<a href=3D"http://ipxe_git.bb" rel=3D"noreferre=
r" target=3D"_blank">ipxe_git.bb</a><br>
+++ b/recipes-extended/ipxe/<a href=3D"http://ipxe_git.bb" rel=3D"noreferre=
r" target=3D"_blank">ipxe_git.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0DESCRIPTION =3D &quot;Open source network boot firmware&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://ipxe.org" rel=3D"noreferrer" tar=
get=3D"_blank">http://ipxe.org</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
-DEPENDS =3D &quot;binutils-native perl-native syslinux mtools-native&quot;=
<br>
+DEPENDS =3D &quot;binutils-native perl-native syslinux mtools-native cdrto=
ols-native&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://../COPYING;md5=3D8ca43cbc842c2336e8=
35926c2166c28b&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;8c43891db4eb131d019360ccfb619f235b17eb58&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113d677205a063052ecd6b7a--
