Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE54BE005A3
	for <meta-virtualization@yoctoproject.org>;
	Sun,  8 Sep 2013 19:23:28 -0700 (PDT)
Received: by mail-lb0-f174.google.com with SMTP id w6so4499742lbh.33
	for <meta-virtualization@yoctoproject.org>;
	Sun, 08 Sep 2013 19:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=npB4HDBA+NPubAtEG3IfFsUIy5b/s3Gg9r4AoD2EFzY=;
	b=LEJtluqSBaXG7RetZjXUvGlyW8TOKMF5kCHF+LnnVprL13uObDFUb4FtB9V6fJcnaI
	RtFZM/Qou+xUeStQqYzm50sEDGBZ2uCcV3VIRzdWr4U+wWSyXUgiQTdbX7CLUd4Lv6DL
	OcIQgcOfnqrnTb3qXGLwkmPqvsvQLmXbAi++sdfEAGq79Fn1/KePSaFYbeN6I2QPjbVD
	5lM02TQ32W0f5q9tJdtrMEwXq0BM3/lmi7jkvppNAOXj5uWEFkMNmbkhZN6mUKrl7a/9
	6WJWnlFm9S8nVggY7X44SwsY53IrGTTFsEacvaxFNGC3TUXE1mC53rSNZ4AouoWZPCMd
	aFfQ==
MIME-Version: 1.0
X-Received: by 10.152.120.37 with SMTP id kz5mr14181643lab.21.1378693406494;
	Sun, 08 Sep 2013 19:23:26 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Sun, 8 Sep 2013 19:23:26 -0700 (PDT)
In-Reply-To: <CADkTA4MAHOGDS7=8VMQQuUYDq_uGXq04WRyGqhfkVw=NBLHxOA@mail.gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-2-git-send-email-cjp256@gmail.com>
	<CADkTA4MAHOGDS7=8VMQQuUYDq_uGXq04WRyGqhfkVw=NBLHxOA@mail.gmail.com>
Date: Sun, 8 Sep 2013 22:23:26 -0400
Message-ID: <CABZSBQf4Qejx8zf0Q4AZG3SQCHDWwen_6w-VEyBOKvzj-vyx-g@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] linux-yocto: add kernel fragment and scc for xen dom0 kernel support.
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
X-List-Received-Date: Mon, 09 Sep 2013 02:23:31 -0000
Content-Type: multipart/alternative; boundary=089e01228148bf94ff04e5ea1219

--089e01228148bf94ff04e5ea1219
Content-Type: text/plain; charset=ISO-8859-1

Bruce,

I'm working on a v2 of my patches and I was curious how would you like to
handle the xen kernel fragment.

Should I go back and make a patch suitable for linux-yocto and submit
there?  Or stage for meta-virtualization and submit again (with signoff and
3.10 support)?

Thanks,
-Chris


On Fri, Aug 30, 2013 at 1:32 AM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Thu, Aug 29, 2013 at 11:37 PM, Chris Patterson <cjp256@gmail.com>
> wrote:
> > ---
> >  recipes-kernel/linux/linux-yocto/xen.cfg |   53
> ++++++++++++++++++++++++++++++
> >  recipes-kernel/linux/linux-yocto/xen.scc |    4 +++
> >  2 files changed, 57 insertions(+)
> >  create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg
> >  create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc
> >
> > diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg
> b/recipes-kernel/linux/linux-yocto/xen.cfg
> > new file mode 100644
> > index 0000000..f9cfb6a
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-yocto/xen.cfg
>
> Nice. The fragment looks good. I'd actually like to bump this up to the
> level of
> in-tree support that we have for KVM.
>
> And by that, I mean that I can merge this to the meta branch of the
> linux-yocto
> kernel (and also found in the tracking yocto-kernel-cache repository).
>
> Once there, it can be built and tested standalone, as well as shared by
> other
> feature fragments. You'd then be able to just enable it via a
> KERNEL_FEATURES
> entry, just like KVM.
>
> Cheers,
>
> Bruce
>
> > @@ -0,0 +1,53 @@
> >
> +..........................................................................
> > +.                                WARNING
> > +.
> > +. This file is a kernel configuration fragment, and not a full kernel
> > +. configuration file.  The final kernel configuration is made up of
> > +. an assembly of processed fragments, each of which is designed to
> > +. capture a specific part of the final configuration (e.g. platform
> > +. configuration, feature configuration, and board specific hardware
> > +. configuration).  For more information on kernel configuration, please
> > +. consult the product documentation.
> > +.
> >
> +..........................................................................
> > +
> > +CONFIG_PARAVIRT_GUEST=y
> > +# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> > +CONFIG_XEN=y
> > +CONFIG_XEN_DOM0=y
> > +CONFIG_XEN_PRIVILEGED_GUEST=y
> > +CONFIG_XEN_PVHVM=y
> > +CONFIG_XEN_MAX_DOMAIN_MEMORY=500
> > +CONFIG_XEN_SAVE_RESTORE=y
> > +# CONFIG_XEN_DEBUG_FS is not set
> > +CONFIG_PARAVIRT=y
> > +# CONFIG_PARAVIRT_SPINLOCKS is not set
> > +CONFIG_PARAVIRT_CLOCK=y
> > +# CONFIG_PARAVIRT_DEBUG is not set
> > +CONFIG_PCI_XEN=y
> > +CONFIG_XEN_PCIDEV_FRONTEND=m
> > +CONFIG_XEN_BLKDEV_FRONTEND=m
> > +CONFIG_XEN_BLKDEV_BACKEND=m
> > +CONFIG_XEN_NETDEV_FRONTEND=m
> > +CONFIG_XEN_NETDEV_BACKEND=m
> > +CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
> > +CONFIG_HVC_XEN=y
> > +CONFIG_HVC_XEN_FRONTEND=y
> > +CONFIG_XEN_WDT=m
> > +CONFIG_XEN_FBDEV_FRONTEND=y
> > +# Xen driver support
> > +CONFIG_XEN_BALLOON=y
> > +CONFIG_XEN_SCRUB_PAGES=y
> > +CONFIG_XEN_DEV_EVTCHN=m
> > +CONFIG_XEN_BACKEND=y
> > +CONFIG_XENFS=m
> > +CONFIG_XEN_COMPAT_XENFS=y
> > +CONFIG_XEN_SYS_HYPERVISOR=y
> > +CONFIG_XEN_XENBUS_FRONTEND=y
> > +CONFIG_XEN_GNTDEV=m
> > +CONFIG_XEN_GRANT_DEV_ALLOC=m
> > +CONFIG_SWIOTLB_XEN=y
> > +CONFIG_XEN_PCIDEV_BACKEND=y
> > +CONFIG_XEN_PRIVCMD=m
> > +CONFIG_XEN_ACPI_PROCESSOR=m
> > +CONFIG_PCI_STUB=y
> > diff --git a/recipes-kernel/linux/linux-yocto/xen.scc
> b/recipes-kernel/linux/linux-yocto/xen.scc
> > new file mode 100644
> > index 0000000..6c68bda
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-yocto/xen.scc
> > @@ -0,0 +1,4 @@
> > +define KFEATURE_DESCRIPTION "Xen Dom0 Support"
> > +define KFEATURE_COMPATIBILITY board
> > +
> > +kconf non-hardware xen.cfg
> > --
> > 1.7.10.4
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--089e01228148bf94ff04e5ea1219
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Bruce,<br><br>I&#39;m working on a v2 of my patc=
hes and I was curious how would you like to handle the xen kernel fragment.=
<br><br></div>Should I go back and make a patch suitable for linux-yocto an=
d submit there?=A0 Or stage for meta-virtualization and submit again (with =
signoff and 3.10 support)?<br>
<br></div>Thanks,<br>-Chris<br></div><div class=3D"gmail_extra"><br><br><di=
v class=3D"gmail_quote">On Fri, Aug 30, 2013 at 1:32 AM, Bruce Ashfield <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_b=
lank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Thu, Aug 29, 2013 at 11=
:37 PM, Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com">cjp256@gmai=
l.com</a>&gt; wrote:<br>

&gt; ---<br>
&gt; =A0recipes-kernel/linux/linux-yocto/xen.cfg | =A0 53 +++++++++++++++++=
+++++++++++++<br>
&gt; =A0recipes-kernel/linux/linux-yocto/xen.scc | =A0 =A04 +++<br>
&gt; =A02 files changed, 57 insertions(+)<br>
&gt; =A0create mode 100644 recipes-kernel/linux/linux-yocto/xen.cfg<br>
&gt; =A0create mode 100644 recipes-kernel/linux/linux-yocto/xen.scc<br>
&gt;<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel=
/linux/linux-yocto/xen.cfg<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f9cfb6a<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto/xen.cfg<br>
<br>
</div>Nice. The fragment looks good. I&#39;d actually like to bump this up =
to the level of<br>
in-tree support that we have for KVM.<br>
<br>
And by that, I mean that I can merge this to the meta branch of the linux-y=
octo<br>
kernel (and also found in the tracking yocto-kernel-cache repository).<br>
<br>
Once there, it can be built and tested standalone, as well as shared by oth=
er<br>
feature fragments. You&#39;d then be able to just enable it via a KERNEL_FE=
ATURES<br>
entry, just like KVM.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<div><div class=3D"h5"><br>
&gt; @@ -0,0 +1,53 @@<br>
&gt; +.....................................................................=
.....<br>
&gt; +. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0WARN=
ING<br>
&gt; +.<br>
&gt; +. This file is a kernel configuration fragment, and not a full kernel=
<br>
&gt; +. configuration file. =A0The final kernel configuration is made up of=
<br>
&gt; +. an assembly of processed fragments, each of which is designed to<br=
>
&gt; +. capture a specific part of the final configuration (e.g. platform<b=
r>
&gt; +. configuration, feature configuration, and board specific hardware<b=
r>
&gt; +. configuration). =A0For more information on kernel configuration, pl=
ease<br>
&gt; +. consult the product documentation.<br>
&gt; +.<br>
&gt; +.....................................................................=
.....<br>
&gt; +<br>
&gt; +CONFIG_PARAVIRT_GUEST=3Dy<br>
&gt; +# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set<br>
&gt; +CONFIG_XEN=3Dy<br>
&gt; +CONFIG_XEN_DOM0=3Dy<br>
&gt; +CONFIG_XEN_PRIVILEGED_GUEST=3Dy<br>
&gt; +CONFIG_XEN_PVHVM=3Dy<br>
&gt; +CONFIG_XEN_MAX_DOMAIN_MEMORY=3D500<br>
&gt; +CONFIG_XEN_SAVE_RESTORE=3Dy<br>
&gt; +# CONFIG_XEN_DEBUG_FS is not set<br>
&gt; +CONFIG_PARAVIRT=3Dy<br>
&gt; +# CONFIG_PARAVIRT_SPINLOCKS is not set<br>
&gt; +CONFIG_PARAVIRT_CLOCK=3Dy<br>
&gt; +# CONFIG_PARAVIRT_DEBUG is not set<br>
&gt; +CONFIG_PCI_XEN=3Dy<br>
&gt; +CONFIG_XEN_PCIDEV_FRONTEND=3Dm<br>
&gt; +CONFIG_XEN_BLKDEV_FRONTEND=3Dm<br>
&gt; +CONFIG_XEN_BLKDEV_BACKEND=3Dm<br>
&gt; +CONFIG_XEN_NETDEV_FRONTEND=3Dm<br>
&gt; +CONFIG_XEN_NETDEV_BACKEND=3Dm<br>
&gt; +CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dy<br>
&gt; +CONFIG_HVC_XEN=3Dy<br>
&gt; +CONFIG_HVC_XEN_FRONTEND=3Dy<br>
&gt; +CONFIG_XEN_WDT=3Dm<br>
&gt; +CONFIG_XEN_FBDEV_FRONTEND=3Dy<br>
&gt; +# Xen driver support<br>
&gt; +CONFIG_XEN_BALLOON=3Dy<br>
&gt; +CONFIG_XEN_SCRUB_PAGES=3Dy<br>
&gt; +CONFIG_XEN_DEV_EVTCHN=3Dm<br>
&gt; +CONFIG_XEN_BACKEND=3Dy<br>
&gt; +CONFIG_XENFS=3Dm<br>
&gt; +CONFIG_XEN_COMPAT_XENFS=3Dy<br>
&gt; +CONFIG_XEN_SYS_HYPERVISOR=3Dy<br>
&gt; +CONFIG_XEN_XENBUS_FRONTEND=3Dy<br>
&gt; +CONFIG_XEN_GNTDEV=3Dm<br>
&gt; +CONFIG_XEN_GRANT_DEV_ALLOC=3Dm<br>
&gt; +CONFIG_SWIOTLB_XEN=3Dy<br>
&gt; +CONFIG_XEN_PCIDEV_BACKEND=3Dy<br>
&gt; +CONFIG_XEN_PRIVCMD=3Dm<br>
&gt; +CONFIG_XEN_ACPI_PROCESSOR=3Dm<br>
&gt; +CONFIG_PCI_STUB=3Dy<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto/xen.scc b/recipes-kernel=
/linux/linux-yocto/xen.scc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..6c68bda<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto/xen.scc<br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +define KFEATURE_DESCRIPTION &quot;Xen Dom0 Support&quot;<br>
&gt; +define KFEATURE_COMPATIBILITY board<br>
&gt; +<br>
&gt; +kconf non-hardware xen.cfg<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div>

--089e01228148bf94ff04e5ea1219--
