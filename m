Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C32E5E00498
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 05:42:59 -0800 (PST)
Received: by mail-la0-f54.google.com with SMTP id fp12so15755278lab.27
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Jan 2013 05:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nGbOYuhs0UfPr8BKEP+JStiY1Uc5iAukCsMfRCwOlcM=;
	b=KZhkagHvzNHlG3cBPJ1S+OesNS0yVm91/Vuf3MhBGRmp8sQy68Uykhj7KBLwH5tRZ7
	RVHtVnwZ8+Dtp7XbX9WjQm1PSSI+ygz/65raTUxPgnGD0ghgs7xdVv0926hlxKaFkdkb
	ti4YVx5jihVnKrI7z6ksfIAViHL/6FlMTUzgbd3UvJJpes3CCYluVZgKQyAZczydLGRg
	41DGxCMxodnMlNhF4zG9lHkJd0iShH7mOEzannFgjwE2P/K8iHKO0jb4Qsspq8fSLVrE
	RByD8odD0EzkVFAzu5iDhARu3dZj486hqXC+n3sAeCmtmTe/ILwaNNhWBaOft+3sDSUI
	EJ5w==
MIME-Version: 1.0
Received: by 10.152.148.129 with SMTP id ts1mr58517007lab.19.1357566178062;
	Mon, 07 Jan 2013 05:42:58 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Mon, 7 Jan 2013 05:42:57 -0800 (PST)
In-Reply-To: <1357560505-24122-2-git-send-email-mihai.prica@intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
Date: Mon, 7 Jan 2013 08:42:57 -0500
Message-ID: <CADkTA4PLTwnjb9gk9wwV-uV7ku-E-_qO=xn+oKbA5hiUH=3OAw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-yocto: added kernel configuration for KVM
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
X-List-Received-Date: Mon, 07 Jan 2013 13:43:00 -0000
Content-Type: multipart/alternative; boundary=e89a8f22c701cd70b204d2b30189

--e89a8f22c701cd70b204d2b30189
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 7:08 AM, Mihai Prica <mihai.prica@intel.com> wrote:

> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>  recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
>  recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
>  recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
>  3 files changed, 9 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc
>  create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg
>
> diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc
> b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
> new file mode 100644
> index 0000000..0b5f4fc
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable KVM host support"
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware kvm.cfg
> diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg
> b/recipes-kernel/linux/linux-yocto/kvm.cfg
> new file mode 100644
> index 0000000..0cfcf58
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/kvm.cfg


We already have an identical config fragment within the kernel tree itself:

http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.4/tree/meta/cfg/kernel-cache/features/kvm/qemu-kvm-enable.scc?h=meta

and

http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.4/tree/meta/cfg/kernel-cache/features/kvm/qemu-kvm.cfg?h=meta

If there's a reason why the in-tree version won't work, we should
definitely fix it
there first. Having a copy outside of the kernel itself is going to cause
us maintenance
issues down the road.

Since at the moment, these fragments are targeted to linux-yocto, so
there's no reason
to avoid using the meta data that follows the tree, since we get re-use and
the added
benefit that I won't break any virtualization use cases when working on the
kernel :)

Cheers,

Bruce


>

@@ -0,0 +1,4 @@
> +CONFIG_KVM=y
> +CONFIG_KVM_INTEL=y
> +CONFIG_KVM_AMD=y
> +CONFIG_TUN=y
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 5b163ff..71bead2 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -4,5 +4,6 @@ SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://kvm-enable.scc \
>             "
>
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

--e89a8f22c701cd70b204d2b30189
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jan 7, 2013 at 7:08 AM, Mihai Prica <span dir=3D"ltr">&lt;<=
a href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@intel=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mihai.pri=
ca@intel.com">mihai.prica@intel.com</a>&gt;<br>

---<br>
=A0recipes-kernel/linux/linux-yocto/kvm-enable.scc | =A0 =A04 ++++<br>
=A0recipes-kernel/linux/linux-yocto/kvm.cfg =A0 =A0 =A0 =A0| =A0 =A04 ++++<=
br>
=A0recipes-kernel/linux/linux-yocto_3.4.bbappend =A0 | =A0 =A01 +<br>
=A03 files changed, 9 insertions(+)<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
=A0create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg<br>
<br>
diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc b/recipes-kern=
el/linux/linux-yocto/kvm-enable.scc<br>
new file mode 100644<br>
index 0000000..0b5f4fc<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc<br>
@@ -0,0 +1,4 @@<br>
+define KFEATURE_DESCRIPTION &quot;Enable KVM host support&quot;<br>
+define KFEATURE_COMPATIBILITY board<br>
+<br>
+kconf non-hardware kvm.cfg<br>
diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg b/recipes-kernel/linu=
x/linux-yocto/kvm.cfg<br>
new file mode 100644<br>
index 0000000..0cfcf58<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-yocto/kvm.cfg</blockquote><div><br></div><=
div style>We already have an identical config fragment within the kernel tr=
ee itself:</div><div style><br></div><div style><a href=3D"http://git.yocto=
project.org/cgit/cgit.cgi/linux-yocto-3.4/tree/meta/cfg/kernel-cache/featur=
es/kvm/qemu-kvm-enable.scc?h=3Dmeta">http://git.yoctoproject.org/cgit/cgit.=
cgi/linux-yocto-3.4/tree/meta/cfg/kernel-cache/features/kvm/qemu-kvm-enable=
.scc?h=3Dmeta</a><br>
</div><div style><br></div><div style>and</div><div style><br></div><div st=
yle><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.4/tr=
ee/meta/cfg/kernel-cache/features/kvm/qemu-kvm.cfg?h=3Dmeta">http://git.yoc=
toproject.org/cgit/cgit.cgi/linux-yocto-3.4/tree/meta/cfg/kernel-cache/feat=
ures/kvm/qemu-kvm.cfg?h=3Dmeta</a><br>
</div><div style><br></div><div style>If there&#39;s a reason why the in-tr=
ee version won&#39;t work, we should definitely fix it</div><div style>ther=
e first. Having a copy outside of the kernel itself is going to cause us ma=
intenance</div>
<div style>issues down the road.</div><div style><br></div><div style>Since=
 at the moment, these fragments are=A0targeted=A0to linux-yocto, so there&#=
39;s no reason</div><div style>to avoid using the meta data that follows th=
e tree, since we get re-use and the added</div>
<div style>benefit that I won&#39;t break any virtualization use cases when=
 working on the kernel :)</div><div style><br></div><div style>Cheers,</div=
><div style><br></div><div style>Bruce</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex">
@@ -0,0 +1,4 @@<br>
+CONFIG_KVM=3Dy<br>
+CONFIG_KVM_INTEL=3Dy<br>
+CONFIG_KVM_AMD=3Dy<br>
+CONFIG_TUN=3Dy<br>
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel=
/linux/linux-yocto_3.4.bbappend<br>
index 5b163ff..71bead2 100644<br>
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
@@ -4,5 +4,6 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0file://ebtables.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://vswitch.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0file://kvm-enable.scc \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
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

--e89a8f22c701cd70b204d2b30189--
