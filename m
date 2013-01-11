Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C13D0E004D1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 13:19:11 -0800 (PST)
Received: by mail-lb0-f172.google.com with SMTP id y2so1640176lbk.17
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 13:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aBh0rQ/0RfVxMic2xNWhpeNGrVxGKmIah7SdkMHFKhc=;
	b=rOhwCcyHYYv2ZaGfp/PUpa6kag+OmCYJQH6iqbWKQBHip1dZgFaxOrjsmRKfy2N9sB
	YWnEyLoIBHUzliuyqCz1ufSl2Zcd/ARq6bY/lpsQ0SggjtslILQ7TL35CufN7BgnDQBE
	c2iIErtWQA7tAmOOhuruEzwWWRTFXPYFsTbmJpJm8hoD2o+njRySQle4d1WJsj6G4JLx
	hcYSKHm5LovpRl4SgZu44+h95bVxZ2EA70g/GvnP7PDLIAeqL8p3Qu6LkCuwhzGm2baS
	E2TLBoR1b1Vj49qyipkeYOI83KNt/AjRjIIAYR5DKOKDYxFfs2g4KKfx8jfAU4OazNLd
	QJSw==
MIME-Version: 1.0
Received: by 10.112.50.205 with SMTP id e13mr31648191lbo.57.1357939150030;
	Fri, 11 Jan 2013 13:19:10 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Fri, 11 Jan 2013 13:19:09 -0800 (PST)
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF8FB687@IRSMSX101.ger.corp.intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-3-git-send-email-mihai.prica@intel.com>
	<CADkTA4N3E2JpKxm6tzBz6TOs0cAx+OkB_q2e+=bExLSgFUyPNg@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A818CA5@039-SN1MPN1-002.039d.mgd.msft.net>
	<97BD068FB200C44AA73C2B641F162ECF8FB687@IRSMSX101.ger.corp.intel.com>
Date: Fri, 11 Jan 2013 16:19:09 -0500
Message-ID: <CADkTA4Ofk_vB8_ptRvy3TonsV3SsNp7ckstB3RUX+_D3R58qQg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Prica, Mihai" <mihai.prica@intel.com>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"meta-virtualization@yoctoproject.org"
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
X-List-Received-Date: Fri, 11 Jan 2013 21:19:12 -0000
Content-Type: multipart/alternative; boundary=f46d0401fe3baa074c04d309d8c5

--f46d0401fe3baa074c04d309d8c5
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 9, 2013 at 2:57 PM, Prica, Mihai <mihai.prica@intel.com> wrote:

> -----Original Message-----
> From: McClintock Matthew-B29882 [mailto:B29882@freescale.com]
> Sent: Monday, January 07, 2013 10:27 PM
> To: Bruce Ashfield
> Cc: Prica, Mihai; meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH 2/2] Created new
> target:kvm-image-minimal
>
> On Mon, Jan 7, 2013 at 7:47 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> >
> >
> > On Mon, Jan 7, 2013 at 7:08 AM, Mihai Prica <mihai.prica@intel.com>
> wrote:
> >>
> >> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> >> ---
> >>  recipes-extended/images/kvm-image-minimal.bb |   22
> >> ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>  create mode 100644 recipes-extended/images/kvm-image-minimal.bb
> >>
> >> diff --git a/recipes-extended/images/kvm-image-minimal.bb
> >> b/recipes-extended/images/kvm-image-minimal.bb
> >> new file mode 100644
> >> index 0000000..486cd9c
> >> --- /dev/null
> >> +++ b/recipes-extended/images/kvm-image-minimal.bb
> >> @@ -0,0 +1,22 @@
> >> +DESCRIPTION = "A minimal kvm image"
> >> +
> >> +IMAGE_INSTALL = " \
> >> +    packagegroup-core-boot \
> >
> >
> > Have you thought about an image variant that isn't actually bootable ?
> > There are quite a few use cases where having the build not depend on a
> > kernel, but instead simply creates a userspace that can be booted via
> > feeding an external kernel directly to qemu on the command line.
> >
> > Not having the kernel decadency turns out to be quite useful when you
> > want to build a KVM host and KVM guest kernel with different
> > configurations, in a single build.
>
> I don't exactly understand what you mean by " an image variant that isn't
> actually bootable ?". I just used core-image-minimal as a starting point.
> Using this recipe you just get the ext3 and the kernel, you don't get an
> hddimg..
>
>
What I mean is that a "bootable" image typically depends on virtual/kernel
to configure
and build a kernel, and then possibly assemble parts of the kernel output
into the image
itself.

We often want to build a rootfs, but have no kernel build as part of that
rootfs, since the
kernel is built separately and then passed to qemu-kvm during the launch
phase. Not
having that dependency means that you can just build userspace, assemble a
rootfs and
then launch the guest.

If you have a dependency on virtual/kernel it turns out that you can end up
with a circular
dependency if you use a method like Matthew showed, the nested rootfs
depend has
it's own kernel dependency, and you have an image that depends on a kernel,
that depends
on an image that depends on a kernel .. etc, and you continue looping.

Having an image that doesn't depend on virtual/kernel at any point, breaks
that loop.

Cheers,

Bruce


> > I've shared this with Bruce before so I thought I would share on this
> list also. It's hacky and possibly not the way to go but we have been doing
> this in a kvm image. Not the depends, and the post process addition.
> >
> > fsl-image-kvm.bb:
> >
> > #
> > # Copyright (C) 2007 OpenedHand Ltd.
> > #
> > IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}
> u-boot"
> > IMAGE_LINGUAS = " "
> >
> > PR = "r1"
> >
> > LICENSE = "MIT"
> >
> > inherit core-image
> >
> > IMAGE_ROOTFS_SIZE = "8192"
> >
> > # remove not needed ipkg informations
> > ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; mkdir
> ${IMAGE_ROOTFS}/images; cp
> ${DEPLOY_DIR_IMAGE}/fsl-image-minimal-${MACHINE}.ext2.gz.u-boot
> > ${IMAGE_ROOTFS}/images"
> >
> > IMAGE_FSTYPES = "tar.gz ext2.gz.u-boot"
> >
> > # pkgconfig is here for qemu, and it's not in DEPENDS because of
> multilib # build issues. to fix later IMAGE_INSTALL += "pkgconfig qemu
> kernel-image"
> >
> > do_rootfs[depends] += "fsl-image-minimal:do_rootfs"
>
> Thanks for the recipe. I'll see what I can use from it.
>
>
> Mihai
> >
> >
> > Cheers,
> >
> > Bruce
> >
> >>
> >> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
> >> +    qemu \
> >> +    libvirt \
> >> +    libvirt-libvirtd \
> >> +    libvirt-virsh \
> >> +    "
> >> +
> >> +IMAGE_FEATURES += "ssh-server-openssh"
> >> +
> >> +IMAGE_LINGUAS = " "
> >> +
> >> +LICENSE = "MIT"
> >> +
> >> +inherit core-image
> >> +
> >> +IMAGE_ROOTFS_SIZE = "8192"
> >> +
> >> +ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end"
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d0401fe3baa074c04d309d8c5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 9, 2013 at 2:57 PM, Prica, Mihai <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@inte=
l.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">----=
-Original Message-----<br>
From: McClintock Matthew-B29882 [mailto:<a href=3D"mailto:B29882@freescale.=
com">B29882@freescale.com</a>]<br>
Sent: Monday, January 07, 2013 10:27 PM<br>
To: Bruce Ashfield<br>
Cc: Prica, Mihai; <a href=3D"mailto:meta-virtualization@yoctoproject.org">m=
eta-virtualization@yoctoproject.org</a><br>
Subject: Re: [meta-virtualization] [PATCH 2/2] Created new target:kvm-image=
-minimal<br>
<br>
On Mon, Jan 7, 2013 at 7:47 AM, Bruce Ashfield &lt;<a href=3D"mailto:bruce.=
ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Jan 7, 2013 at 7:08 AM, Mihai Prica &lt;<a href=3D"mailto:miha=
i.prica@intel.com">mihai.prica@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mihai.prica@intel=
.com">mihai.prica@intel.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =A0recipes-extended/images/<a href=3D"http://kvm-image-minimal.bb"=
 target=3D"_blank">kvm-image-minimal.bb</a> | =A0 22<br>
&gt;&gt; ++++++++++++++++++++++<br>
&gt;&gt; =A01 file changed, 22 insertions(+)<br>
&gt;&gt; =A0create mode 100644 recipes-extended/images/<a href=3D"http://kv=
m-image-minimal.bb" target=3D"_blank">kvm-image-minimal.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-extended/images/<a href=3D"http://kvm-image-m=
inimal.bb" target=3D"_blank">kvm-image-minimal.bb</a><br>
&gt;&gt; b/recipes-extended/images/<a href=3D"http://kvm-image-minimal.bb" =
target=3D"_blank">kvm-image-minimal.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..486cd9c<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/recipes-extended/images/<a href=3D"http://kvm-image-minimal.=
bb" target=3D"_blank">kvm-image-minimal.bb</a><br>
&gt;&gt; @@ -0,0 +1,22 @@<br>
&gt;&gt; +DESCRIPTION =3D &quot;A minimal kvm image&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +IMAGE_INSTALL =3D &quot; \<br>
&gt;&gt; + =A0 =A0packagegroup-core-boot \<br>
&gt;<br>
&gt;<br>
&gt; Have you thought about an image variant that isn&#39;t actually bootab=
le ?<br>
&gt; There are quite a few use cases where having the build not depend on a=
<br>
&gt; kernel, but instead simply creates a userspace that can be booted via<=
br>
&gt; feeding an external kernel directly to qemu on the command line.<br>
&gt;<br>
&gt; Not having the kernel decadency turns out to be quite useful when you<=
br>
&gt; want to build a KVM host and KVM guest kernel with different<br>
&gt; configurations, in a single build.<br>
<br>
</div></div>I don&#39;t exactly understand what you mean by &quot; an image=
 variant that isn&#39;t actually bootable ?&quot;. I just used core-image-m=
inimal as a starting point. Using this recipe you just get the ext3 and the=
 kernel, you don&#39;t get an hddimg..<br>

<div class=3D"im"><br></div></blockquote><div><br></div><div style>What I m=
ean is that a &quot;bootable&quot; image typically depends on virtual/kerne=
l to configure</div><div style>and build a kernel, and then possibly assemb=
le=A0parts of the kernel output into the image</div>
<div style>itself.</div><div style><br></div><div style>We often want to bu=
ild a rootfs, but have no kernel build as part of that rootfs, since the=A0=
</div><div style>kernel is built separately and then passed to qemu-kvm dur=
ing the launch phase. Not=A0</div>
<div style>having that dependency means that you can just build userspace, =
assemble a rootfs and</div><div style>then launch the guest.</div><div styl=
e><br></div><div style>If you have a dependency on virtual/kernel it turns =
out that you can end up with a circular</div>
<div style>dependency if you use a method like Matthew showed, the nested r=
ootfs depend has</div><div style>it&#39;s own kernel dependency, and you ha=
ve an image that depends on a kernel, that depends</div><div style>on an im=
age that depends on a kernel .. etc, and you continue looping.</div>
<div style><br></div><div style>Having an image that doesn&#39;t depend on =
virtual/kernel at any point, breaks that loop.</div><div style><br></div><d=
iv style>Cheers,</div><div style><br></div><div style>Bruce</div><div>=A0</=
div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
&gt; I&#39;ve shared this with Bruce before so I thought I would share on t=
his list also. It&#39;s hacky and possibly not the way to go but we have be=
en doing this in a kvm image. Not the depends, and the post process additio=
n.<br>

&gt;<br>
&gt; <a href=3D"http://fsl-image-kvm.bb" target=3D"_blank">fsl-image-kvm.bb=
</a>:<br>
&gt;<br>
&gt; #<br>
&gt; # Copyright (C) 2007 OpenedHand Ltd.<br>
&gt; #<br>
&gt; IMAGE_INSTALL =3D &quot;packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOT=
STRAP} u-boot&quot;<br>
&gt; IMAGE_LINGUAS =3D &quot; &quot;<br>
&gt;<br>
&gt; PR =3D &quot;r1&quot;<br>
&gt;<br>
&gt; LICENSE =3D &quot;MIT&quot;<br>
&gt;<br>
&gt; inherit core-image<br>
&gt;<br>
&gt; IMAGE_ROOTFS_SIZE =3D &quot;8192&quot;<br>
&gt;<br>
&gt; # remove not needed ipkg informations<br>
&gt; ROOTFS_POSTPROCESS_COMMAND +=3D &quot;remove_packaging_data_files ; mk=
dir ${IMAGE_ROOTFS}/images; cp ${DEPLOY_DIR_IMAGE}/fsl-image-minimal-${MACH=
INE}.ext2.gz.u-boot<br>
&gt; ${IMAGE_ROOTFS}/images&quot;<br>
&gt;<br>
&gt; IMAGE_FSTYPES =3D &quot;tar.gz ext2.gz.u-boot&quot;<br>
&gt;<br>
&gt; # pkgconfig is here for qemu, and it&#39;s not in DEPENDS because of m=
ultilib # build issues. to fix later IMAGE_INSTALL +=3D &quot;pkgconfig qem=
u kernel-image&quot;<br>
&gt;<br>
&gt; do_rootfs[depends] +=3D &quot;fsl-image-minimal:do_rootfs&quot;<br>
<br>
</div>Thanks for the recipe. I&#39;ll see what I can use from it.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
Mihai<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; + =A0 =A0${ROOTFS_PKGMANAGE_BOOTSTRAP} \<br>
&gt;&gt; + =A0 =A0qemu \<br>
&gt;&gt; + =A0 =A0libvirt \<br>
&gt;&gt; + =A0 =A0libvirt-libvirtd \<br>
&gt;&gt; + =A0 =A0libvirt-virsh \<br>
&gt;&gt; + =A0 =A0&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +IMAGE_FEATURES +=3D &quot;ssh-server-openssh&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +IMAGE_LINGUAS =3D &quot; &quot;<br>
&gt;&gt; +<br>
&gt;&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit core-image<br>
&gt;&gt; +<br>
&gt;&gt; +IMAGE_ROOTFS_SIZE =3D &quot;8192&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +ROOTFS_POSTPROCESS_COMMAND +=3D &quot;remove_packaging_data_files=
 ; &quot;<br>
&gt;&gt; --<br>
&gt;&gt; 1.7.9.5<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtu=
alization@yoctoproject.org</a><br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtua=
lization</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt; thee at its end&quot;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
&gt;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--f46d0401fe3baa074c04d309d8c5--
