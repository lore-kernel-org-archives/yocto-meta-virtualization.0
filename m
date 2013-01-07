Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36899E00498
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 05:47:19 -0800 (PST)
Received: by mail-la0-f47.google.com with SMTP id fh20so15783790lab.34
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Jan 2013 05:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=i4YQgKGMSANCORL9bmCitR6xP0EiduSFq/ibT/t2PVk=;
	b=SeQFPLUmmB8TzQkOCjtwk+jSqoHgADRLCh1ed9UCRU5VtMaNLCD6ZJkasX58VzQOC1
	7F8RIWDCNLkmN9IzFnTpRGNW1PiTv3IaTZ7x1tTkhVq0pDSu7n9gd1hks5VilvecLf83
	RnYli25L0czg7nU3UHVxs5NL8pRyaHkjkoCAtwVCRDcJShbvWazSUkCFxgrWl72GAx9Q
	rrE7++UGZS0xnm77BJh6DZzAh0cmfM16MTYBig8nq/i/id5Upkrrj6fI8j1qYBFLLe5i
	/Gk1wHEyVaBQLFJLN4DNOHwr3CJ/0lFHnTXVnbx13119ZP2sRRO2hTEGemrdyif07Hgs
	BgcA==
MIME-Version: 1.0
Received: by 10.152.113.165 with SMTP id iz5mr2871726lab.50.1357566438142;
	Mon, 07 Jan 2013 05:47:18 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Mon, 7 Jan 2013 05:47:18 -0800 (PST)
In-Reply-To: <1357560505-24122-3-git-send-email-mihai.prica@intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-3-git-send-email-mihai.prica@intel.com>
Date: Mon, 7 Jan 2013 08:47:18 -0500
Message-ID: <CADkTA4N3E2JpKxm6tzBz6TOs0cAx+OkB_q2e+=bExLSgFUyPNg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] Created new target:kvm-image-minimal
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
X-List-Received-Date: Mon, 07 Jan 2013 13:47:19 -0000
Content-Type: multipart/alternative; boundary=f46d0408393b4df27c04d2b3119f

--f46d0408393b4df27c04d2b3119f
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 7:08 AM, Mihai Prica <mihai.prica@intel.com> wrote:

> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>  recipes-extended/images/kvm-image-minimal.bb |   22
> ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 recipes-extended/images/kvm-image-minimal.bb
>
> diff --git a/recipes-extended/images/kvm-image-minimal.bbb/recipes-extended/images/
> kvm-image-minimal.bb
> new file mode 100644
> index 0000000..486cd9c
> --- /dev/null
> +++ b/recipes-extended/images/kvm-image-minimal.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "A minimal kvm image"
> +
> +IMAGE_INSTALL = " \
> +    packagegroup-core-boot \
>

Have you thought about an image variant that isn't actually bootable ?
There are
quite a few use cases where having the build not depend on a kernel, but
instead
simply creates a userspace that can be booted via feeding an external
kernel
directly to qemu on the command line.

Not having the kernel decadency turns out to be quite useful when you want
to
build a KVM host and KVM guest kernel with different configurations, in a
single
build.

Cheers,

Bruce


> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
> +    qemu \
> +    libvirt \
> +    libvirt-libvirtd \
> +    libvirt-virsh \
> +    "
> +
> +IMAGE_FEATURES += "ssh-server-openssh"
> +
> +IMAGE_LINGUAS = " "
> +
> +LICENSE = "MIT"
> +
> +inherit core-image
> +
> +IMAGE_ROOTFS_SIZE = "8192"
> +
> +ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
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

--f46d0408393b4df27c04d2b3119f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jan 7, 2013 at 7:08 AM, Mihai Prica <span dir=3D"ltr">&lt;<=
a href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@intel=
.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Mihai Prica &lt;<a href=3D"ma=
ilto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@intel.com</a>&gt;=
<br>

---<br>
=A0recipes-extended/images/<a href=3D"http://kvm-image-minimal.bb" target=
=3D"_blank">kvm-image-minimal.bb</a> | =A0 22 ++++++++++++++++++++++<br>
=A01 file changed, 22 insertions(+)<br>
=A0create mode 100644 recipes-extended/images/<a href=3D"http://kvm-image-m=
inimal.bb" target=3D"_blank">kvm-image-minimal.bb</a><br>
<br>
diff --git a/recipes-extended/images/<a href=3D"http://kvm-image-minimal.bb=
" target=3D"_blank">kvm-image-minimal.bb</a> b/recipes-extended/images/<a h=
ref=3D"http://kvm-image-minimal.bb" target=3D"_blank">kvm-image-minimal.bb<=
/a><br>


new file mode 100644<br>
index 0000000..486cd9c<br>
--- /dev/null<br>
+++ b/recipes-extended/images/<a href=3D"http://kvm-image-minimal.bb" targe=
t=3D"_blank">kvm-image-minimal.bb</a><br>
@@ -0,0 +1,22 @@<br>
+DESCRIPTION =3D &quot;A minimal kvm image&quot;<br>
+<br>
+IMAGE_INSTALL =3D &quot; \<br>
+ =A0 =A0packagegroup-core-boot \<br></blockquote><div><br></div><div>Have =
you thought about an image variant that isn&#39;t actually bootable ? There=
 are</div><div>quite a few use cases where having the build not depend on a=
 kernel, but instead</div>
<div style>simply creates a userspace that can be booted via feeding an ext=
ernal kernel=A0</div><div style>directly to qemu on the command line.</div>=
<div style><br></div><div style>Not having the kernel=A0decadency=A0turns o=
ut to be quite useful when you want to=A0</div>
<div style>build a KVM host and KVM guest kernel with different configurati=
ons, in a single</div><div style>build.</div><div style><br></div><div styl=
e>Cheers,</div><div style><br></div><div style>Bruce</div><div>=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">

+ =A0 =A0${ROOTFS_PKGMANAGE_BOOTSTRAP} \<br>
+ =A0 =A0qemu \<br>
+ =A0 =A0libvirt \<br>
+ =A0 =A0libvirt-libvirtd \<br>
+ =A0 =A0libvirt-virsh \<br>
+ =A0 =A0&quot;<br>
+<br>
+IMAGE_FEATURES +=3D &quot;ssh-server-openssh&quot;<br>
+<br>
+IMAGE_LINGUAS =3D &quot; &quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+inherit core-image<br>
+<br>
+IMAGE_ROOTFS_SIZE =3D &quot;8192&quot;<br>
+<br>
+ROOTFS_POSTPROCESS_COMMAND +=3D &quot;remove_packaging_data_files ; &quot;=
<br>
<span><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;
</div></div>

--f46d0408393b4df27c04d2b3119f--
