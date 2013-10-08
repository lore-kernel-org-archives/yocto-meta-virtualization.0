Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1C36E01696
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Oct 2013 04:57:53 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id u14so6839332lbd.30
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Oct 2013 04:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8Mpr5PZBAnpTOf+M3nkLnwDiZIteV7Rmsg34K1Ci9PA=;
	b=buzN11HIZeo5y6+ovajjRSYOBvkTeZ9HNfoi91cVASxdALBftPCoLU6E13rIyNXJ8G
	bMqHsZN0Y3NulNdRoKd1DKtcgGzDp6b3XmPCLDIrs6kdXI7W1c/hdRx4BUsIFUIYhXP8
	1kZPVNMCr5y0JOL7l5WHyU0qmJmqO+lwwur4M6swBEHusINHXdwSO1udiEqoju8MAdi7
	DkEv1yV1DSQrcFvMhJQCOwFiz+I7+XIZ3XgHCrtqbcNR0P7NBxXBmXBh/RlTF7cFDrsF
	omUhE9iQ1FZM17mv9cLdXYUbr2hvJE9UT1snDEzRkx8SBkkJ6YyVfZoOYIa09DHNYDEW
	zaXQ==
MIME-Version: 1.0
X-Received: by 10.112.138.164 with SMTP id qr4mr914322lbb.49.1381233472177;
	Tue, 08 Oct 2013 04:57:52 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Tue, 8 Oct 2013 04:57:52 -0700 (PDT)
In-Reply-To: <5252EDC5.9010101@twobit.us>
References: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
	<5252EDC5.9010101@twobit.us>
Date: Tue, 8 Oct 2013 07:57:52 -0400
Message-ID: <CABZSBQfi_t-ZWGV-B-qvxgBY2KkpjyhiLaA1RM-r7Awr1JVzGA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] linux-yocto: Add xen guest kernel fragment support for PV/HVM guests, using 'xen-guest' distro flag.
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
X-List-Received-Date: Tue, 08 Oct 2013 11:57:58 -0000
Content-Type: multipart/alternative; boundary=089e0118293a760ba604e8397a25

--089e0118293a760ba604e8397a25
Content-Type: text/plain; charset=ISO-8859-1

Hey Phil,

On Mon, Oct 7, 2013 at 1:22 PM, Philip Tricca <flihp@twobit.us> wrote:

> I'm not the gate-keeper here so feel free to disagree but I'd like this
> more if it were broken up a bit. Thoughts on breaking guest support out
> into a PV guest and a PVHVM guest? The goal here would be to partition the
> kernel options that aren't modules (specifically PVHVM, DOM0, PVMMU,
> PRIVILEGED_GUEST etc).
>
>
This was meant more for a general case, rather than the ultra-minimalist.
It could certainly be broken up more.  But then, it's not entirely clear to
me where you draw the line.  It appears to me that many yocto kernel
configs/fragments tend to build in a significant amount of hardware device
support instead of requiring modules.

My thoughts were to make the backend bits as modules and build in the
common front ends (which is effectively virtual hardware support) and
basics (PVHVM, etc).  On that note, I set pcifront as a module in this
fragment, which should probably also be built in.

No need to do all of this on the first past I suppose. It may be better to
> have someone propose a partitioning after this gets picked up.
>
> Also: what's with having 'KVM_GUEST' compiled in? Is it a dependency?
>
>
I think it slipped into the dom0 config when I was testing nested in KVM.
And using that as my starting point, it slipped in again :)  It should be
able to be safely removed.

Have a good one,
-Chris

Cheers,
> - Philip
>
> On 10/06/2013 05:22 PM, Chris Patterson wrote:
> > Signed-off-by: Chris Patterson <cjp256@gmail.com>
> > ---
> >  recipes-kernel/linux/linux-yocto/xen-guest.cfg | 55
> ++++++++++++++++++++++++++
> >  recipes-kernel/linux/linux-yocto/xen-guest.scc |  4 ++
> >  recipes-kernel/linux/linux-yocto_3.10.bbappend |  3 ++
> >  recipes-kernel/linux/linux-yocto_3.4.bbappend  |  3 ++
> >  recipes-kernel/linux/linux-yocto_3.8.bbappend  |  3 ++
> >  5 files changed, 68 insertions(+)
> >  create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.cfg
> >  create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.scc
> >
> > diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.cfg
> b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
> > new file mode 100644
> > index 0000000..cbde3cc
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-yocto/xen-guest.cfg
> > @@ -0,0 +1,55 @@
> > +###
> > +# linux 3.4, 3.8
> > +CONFIG_PARAVIRT_GUEST=y
> > +###
> > +
> > +###
> > +# linux 3.10
> > +CONFIG_HYPERVISOR_GUEST=y
> > +###
> > +
> > +CONFIG_PARAVIRT=y
> > +CONFIG_XEN=y
> > +CONFIG_XEN_DOM0=y
> > +CONFIG_XEN_PRIVILEGED_GUEST=y
> > +CONFIG_XEN_PVHVM=y
> > +CONFIG_XEN_MAX_DOMAIN_MEMORY=500
> > +CONFIG_XEN_SAVE_RESTORE=y
> > +CONFIG_KVM_GUEST=y
> > +CONFIG_PARAVIRT_CLOCK=y
> > +CONFIG_HIBERNATE_CALLBACKS=y
> > +CONFIG_PCI_XEN=y
> > +CONFIG_XEN_PCIDEV_FRONTEND=m
> > +CONFIG_SYS_HYPERVISOR=y
> > +CONFIG_XEN_BLKDEV_FRONTEND=y
> > +CONFIG_XEN_BLKDEV_BACKEND=m
> > +CONFIG_XEN_NETDEV_FRONTEND=y
> > +CONFIG_XEN_NETDEV_BACKEND=m
> > +CONFIG_INPUT_MISC=y
> > +CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
> > +CONFIG_HVC_IRQ=y
> > +CONFIG_HVC_XEN=y
> > +CONFIG_HVC_XEN_FRONTEND=y
> > +CONFIG_XEN_WDT=m
> > +CONFIG_FB_SYS_FILLRECT=y
> > +CONFIG_FB_SYS_COPYAREA=y
> > +CONFIG_FB_SYS_IMAGEBLIT=y
> > +CONFIG_FB_SYS_FOPS=y
> > +CONFIG_FB_DEFERRED_IO=y
> > +CONFIG_XEN_FBDEV_FRONTEND=y
> > +CONFIG_XEN_BALLOON=y
> > +CONFIG_XEN_SCRUB_PAGES=y
> > +CONFIG_XEN_DEV_EVTCHN=y
> > +CONFIG_XEN_BACKEND=y
> > +CONFIG_XENFS=y
> > +CONFIG_XEN_COMPAT_XENFS=y
> > +CONFIG_XEN_SYS_HYPERVISOR=y
> > +CONFIG_XEN_XENBUS_FRONTEND=y
> > +CONFIG_XEN_GNTDEV=y
> > +CONFIG_XEN_GRANT_DEV_ALLOC=y
> > +CONFIG_SWIOTLB_XEN=y
> > +CONFIG_XEN_PCIDEV_BACKEND=m
> > +CONFIG_XEN_PRIVCMD=m
> > +CONFIG_XEN_ACPI_PROCESSOR=m
> > +CONFIG_XEN_MCE_LOG=y
> > +CONFIG_XEN_HAVE_PVMMU=y
> > diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.scc
> b/recipes-kernel/linux/linux-yocto/xen-guest.scc
> > new file mode 100644
> > index 0000000..575bc43
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-yocto/xen-guest.scc
> > @@ -0,0 +1,4 @@
> > +define KFEATURE_DESCRIPTION "Xen PV Guest Support"
> > +define KFEATURE_COMPATIBILITY board
> > +
> > +kconf non-hardware xen-guest.cfg
> > diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend
> b/recipes-kernel/linux/linux-yocto_3.10.bbappend
> > index cc7fd98..a3165cd 100644
> > --- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
> > +++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
> > @@ -17,3 +17,6 @@ KERNEL_FEATURES_append +=
> "${@base_contains('DISTRO_FEATURES', 'aufs', ' feature
> >
> >  # xen dom0 kernel support
> >  SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> > +
> > +# xen guest kernel support
> > +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen-guest', '
> file://xen-guest.scc', '', d)}"
> > diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> > index 448d57f..4d3a0d1 100644
> > --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> > +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> > @@ -14,3 +14,6 @@ module_autoload_kvm-intel = "kvm-intel"
> >
> >  # xen dom0 kernel support
> >  SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> > +
> > +# xen guest kernel support
> > +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen-guest', '
> file://xen-guest.scc', '', d)}"
> > diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend
> b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> > index cc7fd98..a3165cd 100644
> > --- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
> > +++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
> > @@ -17,3 +17,6 @@ KERNEL_FEATURES_append +=
> "${@base_contains('DISTRO_FEATURES', 'aufs', ' feature
> >
> >  # xen dom0 kernel support
> >  SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> > +
> > +# xen guest kernel support
> > +SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen-guest', '
> file://xen-guest.scc', '', d)}"
> >
>
>

--089e0118293a760ba604e8397a25
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Phil,<br><div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Mon, Oct 7, 2013 at 1:22 PM, Philip Tricca <span dir=
=3D"ltr">&lt;<a href=3D"mailto:flihp@twobit.us" target=3D"_blank">flihp@two=
bit.us</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m not the gate-keep=
er here so feel free to disagree but I&#39;d like this more if it were brok=
en up a bit. Thoughts on breaking guest support out into a PV guest and a P=
VHVM guest? The goal here would be to partition the kernel options that are=
n&#39;t modules (specifically PVHVM, DOM0, PVMMU, PRIVILEGED_GUEST etc).<br=
>

<br></blockquote><div><br>This was meant more for a general case, rather th=
an the=20
ultra-minimalist.=A0 It could certainly be broken up more.=A0 But then, it&=
#39;s
 not entirely clear to me where you draw the line.=A0 It appears to me=20
that many yocto kernel configs/fragments tend to build in a significant amo=
unt of
hardware device support instead of requiring modules.<br><br>My thoughts we=
re to make the backend bits as modules and=20
build in the common front ends (which is effectively virtual hardware=20
support) and basics (PVHVM, etc).=A0 On that note, I set pcifront as a modu=
le in this fragment, which should
 probably also be built in.<br><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
No need to do all of this on the first past I suppose. It may be better to =
have someone propose a partitioning after this gets picked up.<br>
<br>
Also: what&#39;s with having &#39;KVM_GUEST&#39; compiled in? Is it a depen=
dency?<br>
<br></blockquote><div>=A0</div><div>I think it slipped into the dom0 config=
 when I was testing nested in KVM. And using that as my starting point, it =
slipped in again :)=A0 It should be able to be safely removed.<br><br>Have =
a good one,<br>
-Chris<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
- Philip<br>
<div class=3D""><div class=3D"h5"><br></div></div></blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div class=3D""><div class=3D"h5">
On 10/06/2013 05:22 PM, Chris Patterson wrote:<br>
&gt; Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com"=
>cjp256@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0recipes-kernel/linux/linux-yocto/xen-guest.cfg | 55 +++++++++++++++=
+++++++++++<br>
&gt; =A0recipes-kernel/linux/linux-yocto/xen-guest.scc | =A04 ++<br>
&gt; =A0recipes-kernel/linux/linux-yocto_3.10.bbappend | =A03 ++<br>
&gt; =A0recipes-kernel/linux/linux-yocto_3.4.bbappend =A0| =A03 ++<br>
&gt; =A0recipes-kernel/linux/linux-yocto_3.8.bbappend =A0| =A03 ++<br>
&gt; =A05 files changed, 68 insertions(+)<br>
&gt; =A0create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.cfg<b=
r>
&gt; =A0create mode 100644 recipes-kernel/linux/linux-yocto/xen-guest.scc<b=
r>
&gt;<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.cfg b/recipes-=
kernel/linux/linux-yocto/xen-guest.cfg<br>
&gt; new file mode 100644<br>
&gt; index 0000000..cbde3cc<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto/xen-guest.cfg<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +###<br>
&gt; +# linux 3.4, 3.8<br>
&gt; +CONFIG_PARAVIRT_GUEST=3Dy<br>
&gt; +###<br>
&gt; +<br>
&gt; +###<br>
&gt; +# linux 3.10<br>
&gt; +CONFIG_HYPERVISOR_GUEST=3Dy<br>
&gt; +###<br>
&gt; +<br>
&gt; +CONFIG_PARAVIRT=3Dy<br>
&gt; +CONFIG_XEN=3Dy<br>
&gt; +CONFIG_XEN_DOM0=3Dy<br>
&gt; +CONFIG_XEN_PRIVILEGED_GUEST=3Dy<br>
&gt; +CONFIG_XEN_PVHVM=3Dy<br>
&gt; +CONFIG_XEN_MAX_DOMAIN_MEMORY=3D500<br>
&gt; +CONFIG_XEN_SAVE_RESTORE=3Dy<br>
&gt; +CONFIG_KVM_GUEST=3Dy<br>
&gt; +CONFIG_PARAVIRT_CLOCK=3Dy<br>
&gt; +CONFIG_HIBERNATE_CALLBACKS=3Dy<br>
&gt; +CONFIG_PCI_XEN=3Dy<br>
&gt; +CONFIG_XEN_PCIDEV_FRONTEND=3Dm<br>
&gt; +CONFIG_SYS_HYPERVISOR=3Dy<br>
&gt; +CONFIG_XEN_BLKDEV_FRONTEND=3Dy<br>
&gt; +CONFIG_XEN_BLKDEV_BACKEND=3Dm<br>
&gt; +CONFIG_XEN_NETDEV_FRONTEND=3Dy<br>
&gt; +CONFIG_XEN_NETDEV_BACKEND=3Dm<br>
&gt; +CONFIG_INPUT_MISC=3Dy<br>
&gt; +CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dy<br>
&gt; +CONFIG_HVC_IRQ=3Dy<br>
&gt; +CONFIG_HVC_XEN=3Dy<br>
&gt; +CONFIG_HVC_XEN_FRONTEND=3Dy<br>
&gt; +CONFIG_XEN_WDT=3Dm<br>
&gt; +CONFIG_FB_SYS_FILLRECT=3Dy<br>
&gt; +CONFIG_FB_SYS_COPYAREA=3Dy<br>
&gt; +CONFIG_FB_SYS_IMAGEBLIT=3Dy<br>
&gt; +CONFIG_FB_SYS_FOPS=3Dy<br>
&gt; +CONFIG_FB_DEFERRED_IO=3Dy<br>
&gt; +CONFIG_XEN_FBDEV_FRONTEND=3Dy<br>
&gt; +CONFIG_XEN_BALLOON=3Dy<br>
&gt; +CONFIG_XEN_SCRUB_PAGES=3Dy<br>
&gt; +CONFIG_XEN_DEV_EVTCHN=3Dy<br>
&gt; +CONFIG_XEN_BACKEND=3Dy<br>
&gt; +CONFIG_XENFS=3Dy<br>
&gt; +CONFIG_XEN_COMPAT_XENFS=3Dy<br>
&gt; +CONFIG_XEN_SYS_HYPERVISOR=3Dy<br>
&gt; +CONFIG_XEN_XENBUS_FRONTEND=3Dy<br>
&gt; +CONFIG_XEN_GNTDEV=3Dy<br>
&gt; +CONFIG_XEN_GRANT_DEV_ALLOC=3Dy<br>
&gt; +CONFIG_SWIOTLB_XEN=3Dy<br>
&gt; +CONFIG_XEN_PCIDEV_BACKEND=3Dm<br>
&gt; +CONFIG_XEN_PRIVCMD=3Dm<br>
&gt; +CONFIG_XEN_ACPI_PROCESSOR=3Dm<br>
&gt; +CONFIG_XEN_MCE_LOG=3Dy<br>
&gt; +CONFIG_XEN_HAVE_PVMMU=3Dy<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto/xen-guest.scc b/recipes-=
kernel/linux/linux-yocto/xen-guest.scc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..575bc43<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto/xen-guest.scc<br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +define KFEATURE_DESCRIPTION &quot;Xen PV Guest Support&quot;<br>
&gt; +define KFEATURE_COMPATIBILITY board<br>
&gt; +<br>
&gt; +kconf non-hardware xen-guest.cfg<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-=
kernel/linux/linux-yocto_3.10.bbappend<br>
&gt; index cc7fd98..a3165cd 100644<br>
&gt; --- a/recipes-kernel/linux/linux-yocto_3.10.bbappend<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend<br>
&gt; @@ -17,3 +17,6 @@ KERNEL_FEATURES_append +=3D &quot;${@base_contains(&=
#39;DISTRO_FEATURES&#39;, &#39;aufs&#39;, &#39; feature<br>
&gt;<br>
&gt; =A0# xen dom0 kernel support<br>
&gt; =A0SRC_URI +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39=
;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +# xen guest kernel support<br>
&gt; +SRC_URI +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;x=
en-guest&#39;, &#39; file://xen-guest.scc&#39;, &#39;&#39;, d)}&quot;<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-k=
ernel/linux/linux-yocto_3.4.bbappend<br>
&gt; index 448d57f..4d3a0d1 100644<br>
&gt; --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
&gt; @@ -14,3 +14,6 @@ module_autoload_kvm-intel =3D &quot;kvm-intel&quot;<=
br>
&gt;<br>
&gt; =A0# xen dom0 kernel support<br>
&gt; =A0SRC_URI +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39=
;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +# xen guest kernel support<br>
&gt; +SRC_URI +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;x=
en-guest&#39;, &#39; file://xen-guest.scc&#39;, &#39;&#39;, d)}&quot;<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-k=
ernel/linux/linux-yocto_3.8.bbappend<br>
&gt; index cc7fd98..a3165cd 100644<br>
&gt; --- a/recipes-kernel/linux/linux-yocto_3.8.bbappend<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend<br>
&gt; @@ -17,3 +17,6 @@ KERNEL_FEATURES_append +=3D &quot;${@base_contains(&=
#39;DISTRO_FEATURES&#39;, &#39;aufs&#39;, &#39; feature<br>
&gt;<br>
&gt; =A0# xen dom0 kernel support<br>
&gt; =A0SRC_URI +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39=
;xen&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +# xen guest kernel support<br>
&gt; +SRC_URI +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;x=
en-guest&#39;, &#39; file://xen-guest.scc&#39;, &#39;&#39;, d)}&quot;<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div></div></div>

--089e0118293a760ba604e8397a25--
