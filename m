Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 289C7E00524
	for <meta-virtualization@yoctoproject.org>;
	Sun,  9 Feb 2014 18:57:32 -0800 (PST)
Received: by mail-la0-f41.google.com with SMTP id mc6so4348919lab.14
	for <meta-virtualization@yoctoproject.org>;
	Sun, 09 Feb 2014 18:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Uy/vec8p84WkOVuieEiTPWt7ozW+Ac6e6mLFBJiZP7A=;
	b=Niv2FCHMEhdHSnUTQ5h43UC9t2c42OzED1AeNVPXxuqVBmluKTGxPW00ZN7n41YNkD
	34bVUj+2mNjPnz7cKE0wfUmnA6ihDzGeOlbuwkSSSxtfCnTIJVW2r10yz53tT40wqioT
	S1Ai9j7V2pB/P325oRraZyGLlUl/Jzli2nNMcHn0O2UfkNKu+XJfIuodgvy1W2n80scF
	H/Z1fSZkWPPj+GHKCpgRjAbK3Qj38UmdhP7rU4oMZBJqBNeTeXkjmvBktl9tOnkXbLZH
	JvK/Fp60RzmpQDKwgu16FH+2P8kcoB6rSBhtdPIXWAZdgLfCV1gYjzWGdlXuolEVe3hA
	RbIA==
MIME-Version: 1.0
X-Received: by 10.112.138.233 with SMTP id qt9mr237453lbb.34.1392001050399;
	Sun, 09 Feb 2014 18:57:30 -0800 (PST)
Received: by 10.114.161.69 with HTTP; Sun, 9 Feb 2014 18:57:30 -0800 (PST)
In-Reply-To: <1391996719-14419-3-git-send-email-flihp@twobit.us>
References: <1391996719-14419-1-git-send-email-flihp@twobit.us>
	<1391996719-14419-3-git-send-email-flihp@twobit.us>
Date: Sun, 9 Feb 2014 21:57:30 -0500
Message-ID: <CABZSBQdqreuLav6Wq=6BjgdWsOr+0ezi6EV3_gi3adPLDBi6uw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] xen: Add RDEPENDS block for xendomains script.
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
X-List-Received-Date: Mon, 10 Feb 2014 02:57:42 -0000
Content-Type: multipart/alternative; boundary=089e0122971022da8004f2048022

--089e0122971022da8004f2048022
Content-Type: text/plain; charset=ISO-8859-1

Perhaps something to do with udev rules (which may invoke the block
scripts)?


On Sun, Feb 9, 2014 at 8:45 PM, Philip Tricca <flihp@twobit.us> wrote:

> I can't explain the dependency on xen-scripts-block as the xendomains
> script doesn't invoke any of these scripts directly. Still xendomains
> hangs indefinitely without them.
>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index bd2fc74..4c27497 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -70,6 +70,13 @@ RDEPENDS_${PN}-xencommons = "\
>      ${PN}-scripts-common \
>      "
>
> +RDEPENDS_${PN}-xendomains = "\
> +    ${PN}-console \
> +    ${PN}-scripts-block \
> +    ${PN}-scripts-common \
> +    ${PN}-xenstored \
> +    "
> +
>  RDEPENDS_${PN}-xl = "libgcc"
>
>  PACKAGES = "\
> --
> 1.7.10.4
>
>

--089e0122971022da8004f2048022
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Perhaps something to do with udev rules (which may invoke =
the block scripts)?</div><div class=3D"gmail_extra"><br><br><div class=3D"g=
mail_quote">On Sun, Feb 9, 2014 at 8:45 PM, Philip Tricca <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">I can&#39;t explain the dependency on xen-sc=
ripts-block as the xendomains<br>
script doesn&#39;t invoke any of these scripts directly. Still xendomains<b=
r>
hangs indefinitely without them.<br>
<br>
Signed-off-by: Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us">flihp@t=
wobit.us</a>&gt;<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index bd2fc74..4c27497 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -70,6 +70,13 @@ RDEPENDS_${PN}-xencommons =3D &quot;\<br>
=A0 =A0 =A0${PN}-scripts-common \<br>
=A0 =A0 =A0&quot;<br>
<br>
+RDEPENDS_${PN}-xendomains =3D &quot;\<br>
+ =A0 =A0${PN}-console \<br>
+ =A0 =A0${PN}-scripts-block \<br>
+ =A0 =A0${PN}-scripts-common \<br>
+ =A0 =A0${PN}-xenstored \<br>
+ =A0 =A0&quot;<br>
+<br>
=A0RDEPENDS_${PN}-xl =3D &quot;libgcc&quot;<br>
<br>
=A0PACKAGES =3D &quot;\<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
</font></span></blockquote></div><br></div>

--089e0122971022da8004f2048022--
