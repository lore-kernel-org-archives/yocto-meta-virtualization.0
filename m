Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF24CE004D1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 13:08:58 -0800 (PST)
Received: by mail-la0-f47.google.com with SMTP id fh20so2164577lab.6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 13:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9ezyOLzkM9zWNAWpOotBExZW7xTln5joxVQoogwzSBI=;
	b=aYQ4NpYUTJakeDcTeT+iqdHIjEXp4OzlWTk05HchZWmDnKXDm4D4tzgzYKqMUdgE/9
	ogAURZUHGkwsRY3OQgN5swIMjhZVbwaSHjaW1iWmt1wcSmM2E0WR0y3ZqHe+eOyx/brr
	XnrFKxPK2zsBhQ1W0u0QjmBBPDOkWdBRUnS5lAq2fDMKbQlTTqp4mi/namnM2BoQLliH
	tOeQLkeK/xmbD/6lXPhSdi1nsIHwDDCkRzIIxnUKiK7ZCWbnwuTB3IyH1YDj7+nLowoP
	oAWAKhOTidEsPFMNP1rm3/V7/NGtEt0aGI3Ggc55ifSdcCQx77/rw1nOIsvI8gP4ai6l
	6yag==
MIME-Version: 1.0
Received: by 10.152.127.202 with SMTP id ni10mr74086652lab.6.1357938537509;
	Fri, 11 Jan 2013 13:08:57 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Fri, 11 Jan 2013 13:08:56 -0800 (PST)
In-Reply-To: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
Date: Fri, 11 Jan 2013 16:08:56 -0500
Message-ID: <CADkTA4Nh1b6oySSoz59oODeLyehSYdGsUrh3JMLK2C9=AOZaKg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Fri, 11 Jan 2013 21:08:59 -0000
Content-Type: multipart/alternative; boundary=f46d042c6aeb27b2f604d309b401

--f46d042c6aeb27b2f604d309b401
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 11, 2013 at 11:27 AM, Mihai Prica <mihai.prica@intel.com> wrote:

> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>  recipes-kernel/linux/linux-yocto_3.4.bbappend |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 5b163ff..6fa02e8 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -6,3 +6,8 @@ SRC_URI += "file://xt-checksum.scc \
>             file://lxc.scc \
>             "
>
> +KERNEL_FEATURES_append = " kvm/qemu-kvm-enable"
>

Have you confirmed that this is adding the option you want ? I would have
expected this to be:

KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"



> +
> +module_autoload_kvm = "kvm"
> +module_autoload_kvm-amd = "kvm-amd"
> +module_autoload_kvm-intel = "kvm-intel"
>

This part looks fine though.

Cheers,

Bruce


> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d042c6aeb27b2f604d309b401
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Fri, Jan 11, 2013 at 11:27 AM, Mihai Prica <span dir=3D=
"ltr">&lt;<a href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.=
prica@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mihai.pri=
ca@intel.com">mihai.prica@intel.com</a>&gt;<br>

---<br>
=A0recipes-kernel/linux/linux-yocto_3.4.bbappend | =A0 =A05 +++++<br>
=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend<br>
index 5b163ff..6fa02e8 100644<br>
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
@@ -6,3 +6,8 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
<br>
+KERNEL_FEATURES_append =3D &quot; kvm/qemu-kvm-enable&quot;<br>
</blockquote><div><br></div><div style>Have you confirmed that this is addi=
ng the option you want ? I would have</div><div style>expected this to be:<=
/div><div style><br></div><div style>KERNEL_FEATURES_append =3D &quot; feat=
ures/kvm/qemu-kvm-enable.scc&quot;<br>
</div><div style><br></div><div>=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex">+<br>
+module_autoload_kvm =3D &quot;kvm&quot;<br>
+module_autoload_kvm-amd =3D &quot;kvm-amd&quot;<br>
+module_autoload_kvm-intel =3D &quot;kvm-intel&quot;<br></blockquote><div><=
br></div><div style>This part looks fine though.</div><div style><br></div>=
<div style>Cheers,</div><div style><br></div><div style>Bruce</div><div>
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">
<span class=3D""><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;
</div></div>

--f46d042c6aeb27b2f604d309b401--
