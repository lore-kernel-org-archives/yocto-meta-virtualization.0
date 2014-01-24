Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2407E008EC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Jan 2014 13:23:11 -0800 (PST)
Received: by mail-lb0-f169.google.com with SMTP id q8so3003362lbi.28
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Jan 2014 13:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=erH7nCb8L9DL7LE3NiQy8uMmUwD48stJNqGkhakZrNU=;
	b=woR6sbxwasLbN/nlRFfh8vC7FbMbKnPlF1QyW41gpEmymcZ8bAtKIQz0z/c3jeIaR3
	Rxy7Qtq6AyLp3NCNsMc+MRaiVGfLTdCp7JxmPO7gOaNH4NQ3of6S+ejrKKtM6dfW68tZ
	vZgGE/9DOw6RY9RHtPyn3qDmN6pFL23HHDMCKT6IN0WDTmEXHVD1iCJYmjgTh6h76AM2
	b1Vmtgbf7KIiXHhcaWaWONy3e9lYXAV2O0sB/dCXqaMXEo0yqJqAsX+hIujNwgRWuRHf
	ZgxTvateYfCWyeNc4fqiCq+9wdoUbeYGMfEoWyHPnczp6zv8fJ3O1pRTOOQSpyrD2Sag
	WPEQ==
MIME-Version: 1.0
X-Received: by 10.152.164.166 with SMTP id yr6mr10297054lab.1.1390598589712;
	Fri, 24 Jan 2014 13:23:09 -0800 (PST)
Received: by 10.114.161.69 with HTTP; Fri, 24 Jan 2014 13:23:09 -0800 (PST)
In-Reply-To: <1390447173-9925-1-git-send-email-flihp@twobit.us>
References: <1390447173-9925-1-git-send-email-flihp@twobit.us>
Date: Fri, 24 Jan 2014 16:23:09 -0500
Message-ID: <CABZSBQexn0MUDxvn0HgK762y5hsyHMRwc+pV7sWmGso5x=33xQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: Add libgcc as runtime dependency of xen-xl package.
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
X-List-Received-Date: Fri, 24 Jan 2014 21:23:14 -0000
Content-Type: multipart/alternative; boundary=001a11349a02f70d6904f0bdf65e

--001a11349a02f70d6904f0bdf65e
Content-Type: text/plain; charset=ISO-8859-1

+1


On Wed, Jan 22, 2014 at 10:19 PM, Philip Tricca <flihp@twobit.us> wrote:

> Much of xl operates fine without libgcc but some operations complain
> that pthread_cancel won't work properly without libgcc_s.so.1
> installed. The exact text is:
>
> libgcc_s.so.1 must be installed for pthread_cancel to work
>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen.inc |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 30d99f4..3acdc01 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -70,6 +70,8 @@ RDEPENDS_${PN}-xencommons = "\
>      ${PN}-scripts-common \
>      "
>
> +RDEPENDS_${PN}-xl = "libgcc"
> +
>  PACKAGES = "\
>      ${PN}-base \
>      ${PN}-blktap \
> --
> 1.7.10.4
>
>

--001a11349a02f70d6904f0bdf65e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+1</div><div class=3D"gmail_extra"><br><br><div class=3D"g=
mail_quote">On Wed, Jan 22, 2014 at 10:19 PM, Philip Tricca <span dir=3D"lt=
r">&lt;<a href=3D"mailto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Much of xl operates fine without libgcc but =
some operations complain<br>
that pthread_cancel won&#39;t work properly without libgcc_s.so.1<br>
installed. The exact text is:<br>
<br>
libgcc_s.so.1 must be installed for pthread_cancel to work<br>
<br>
Signed-off-by: Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us">flihp@t=
wobit.us</a>&gt;<br>
---<br>
=A0recipes-extended/xen/xen.inc | =A0 =A02 ++<br>
=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 30d99f4..3acdc01 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -70,6 +70,8 @@ RDEPENDS_${PN}-xencommons =3D &quot;\<br>
=A0 =A0 =A0${PN}-scripts-common \<br>
=A0 =A0 =A0&quot;<br>
<br>
+RDEPENDS_${PN}-xl =3D &quot;libgcc&quot;<br>
+<br>
=A0PACKAGES =3D &quot;\<br>
=A0 =A0 =A0${PN}-base \<br>
=A0 =A0 =A0${PN}-blktap \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a11349a02f70d6904f0bdf65e--
