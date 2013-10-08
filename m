Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA5A1E01696
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Oct 2013 05:09:45 -0700 (PDT)
Received: by mail-la0-f41.google.com with SMTP id ec20so6940006lab.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Oct 2013 05:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JGdV5DWIgnrrZJqBM2lgiivVoPlF3YwXBDwkJCSJkqU=;
	b=v6C0n0XFcqVhe9dCKxoRyDMCTXAMlJtxMnhi83NTILORpGZwpz+8jKFI3etBZNnyrT
	qZRUcXo7P5de9nuxmtN83EnxmfoWPUbMwFLmP9njQ7tg1dA6qM+cZKyTT4VJ0s60w7Nj
	g54b0hh7eWD8gWE1vE7TxsFhFp88xhxwKGz9Px0XD8WTOE+H6vSx37Du2yKpQ61WVZG+
	AzQsUi4maFYQ9vXUxTWuUBAlYJIgiXG1gtwsiMRWf5sjznrjSbfDRpIwX+73/sVMvQq/
	KrUTywB3UJ9UmLI345o9FHTI3R9rlnTRrpHhPn54nhr2y33dkVJPrfPBfu5wtWNqWMwv
	cMXg==
MIME-Version: 1.0
X-Received: by 10.112.172.137 with SMTP id bc9mr2258316lbc.21.1381234184288;
	Tue, 08 Oct 2013 05:09:44 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Tue, 8 Oct 2013 05:09:44 -0700 (PDT)
In-Reply-To: <5252ED8D.4000600@twobit.us>
References: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
	<1381094537-11576-4-git-send-email-cjp256@gmail.com>
	<5252ED8D.4000600@twobit.us>
Date: Tue, 8 Oct 2013 08:09:44 -0400
Message-ID: <CABZSBQd9daGV45i8nKmegy2td1WXFQLNDQQeA3BQ7R7V8+8EdQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen-guest-image-minimal: example image for a PV/HVM/PVHVM xen guest built with the 'xen-guest' kernel fragment.
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
X-List-Received-Date: Tue, 08 Oct 2013 12:09:46 -0000
Content-Type: multipart/alternative; boundary=001a11c26456e8006004e839a41c

--001a11c26456e8006004e839a41c
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 7, 2013 at 1:21 PM, Philip Tricca <flihp@twobit.us> wrote:

> I'm a bit confused about this one. Maybe it's my misunderstanding.
> Questions in line:
>
> On 10/06/2013 05:22 PM, Chris Patterson wrote:
> > Signed-off-by: Chris Patterson <cjp256@gmail.com>
> > ---
> >  recipes-extended/images/xen-guest-image-minimal.bb | 31
> ++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 recipes-extended/images/xen-guest-image-minimal.bb
> >
> > diff --git a/recipes-extended/images/xen-guest-image-minimal.bbb/recipes-extended/images/
> xen-guest-image-minimal.bb
> > new file mode 100644
> > index 0000000..05b0b61
> > --- /dev/null
> > +++ b/recipes-extended/images/xen-guest-image-minimal.bb
> > @@ -0,0 +1,31 @@
> > +DESCRIPTION = "A Xen PV guest image."
> > +
> > +inherit core-image
> > +
> > +IMAGE_INSTALL += " \
> > +    packagegroup-core-boot \
> > +    kernel-module-xen-acpi-processor \
> > +    kernel-module-xen-blkback \
> > +    kernel-module-xen-netback \
> > +    kernel-module-xen-pciback \
>
> For a minimal guest I'd expect you wouldn't want any of the *back drivers.
> Did you mean for these to be the *front drivers?
>
>
This image was matching up to the xen-guest kernel fragment, including the
remaining xen modules.  The backend modules are not required and could be
removed from this image.

Thanks,
-Chris


> Cheers,
> - Philip
>
> > +    kernel-module-xen-pcifront \
> > +    "
> > +
> > +IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', '
> xf86-video-fbdev', '', d)}"
> > +IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', '
> xf86-video-vesa', '', d)}"
> > +
> > +LICENSE = "MIT"
> > +
> > +SYSLINUX_KERNEL_ARGS ?= "LABEL=boot ramdisk_size=32768 root=/dev/ram0
> rootimg=rootfs.img rw console=hvc0 console=tty0 panic=10 debugshell=5"
> > +
> > +# syslinux is not required for PV guest configuration, but for HVM
> > +build_syslinux_cfg () {
> > +     echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
> > +     echo "DEFAULT boot" >> ${SYSLINUXCFG}
> > +     echo "TIMEOUT 10" >> ${SYSLINUXCFG}
> > +     echo "PROMPT 1" >> ${SYSLINUXCFG}
> > +     echo "LABEL boot" >> ${SYSLINUXCFG}
> > +     echo "  KERNEL /vmlinuz" >> ${SYSLINUXCFG}
> > +     echo "  INITRD /initrd" >> ${SYSLINUXCFG}
> > +     echo "  APPEND ${SYSLINUX_KERNEL_ARGS}" >> ${SYSLINUXCFG}
> > +}
> >
>
>

--001a11c26456e8006004e839a41c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Oct 7, 2013 at 1:21 PM, Philip Tricca <span dir=3D"ltr">&lt=
;<a href=3D"mailto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&g=
t;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m a bit confused ab=
out this one. Maybe it&#39;s my misunderstanding. Questions in line:<br>
<div class=3D"im"><br>
On 10/06/2013 05:22 PM, Chris Patterson wrote:<br>
&gt; Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com"=
>cjp256@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.b=
b" target=3D"_blank">xen-guest-image-minimal.bb</a> | 31 ++++++++++++++++++=
++++<br>
&gt; =A01 file changed, 31 insertions(+)<br>
&gt; =A0create mode 100644 recipes-extended/images/<a href=3D"http://xen-gu=
est-image-minimal.bb" target=3D"_blank">xen-guest-image-minimal.bb</a><br>
&gt;<br>
&gt; diff --git a/recipes-extended/images/<a href=3D"http://xen-guest-image=
-minimal.bb" target=3D"_blank">xen-guest-image-minimal.bb</a> b/recipes-ext=
ended/images/<a href=3D"http://xen-guest-image-minimal.bb" target=3D"_blank=
">xen-guest-image-minimal.bb</a><br>

&gt; new file mode 100644<br>
&gt; index 0000000..05b0b61<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-extended/images/<a href=3D"http://xen-guest-image-minima=
l.bb" target=3D"_blank">xen-guest-image-minimal.bb</a><br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +DESCRIPTION =3D &quot;A Xen PV guest image.&quot;<br>
&gt; +<br>
&gt; +inherit core-image<br>
&gt; +<br>
&gt; +IMAGE_INSTALL +=3D &quot; \<br>
&gt; + =A0 =A0packagegroup-core-boot \<br>
&gt; + =A0 =A0kernel-module-xen-acpi-processor \<br>
&gt; + =A0 =A0kernel-module-xen-blkback \<br>
&gt; + =A0 =A0kernel-module-xen-netback \<br>
&gt; + =A0 =A0kernel-module-xen-pciback \<br>
<br>
</div>For a minimal guest I&#39;d expect you wouldn&#39;t want any of the *=
back drivers. Did you mean for these to be the *front drivers?<br>
<br></blockquote><div><div><br>This image was matching up to the xen-guest =
kernel fragment,=20
including the remaining xen modules.=A0 The backend modules are not=20
required and could be removed from this image.<br><br></div>Thanks,<br>-Chr=
is<br>=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
- Philip<br>
<div class=3D""><div class=3D"h5"><br>
&gt; + =A0 =A0kernel-module-xen-pcifront \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +IMAGE_INSTALL +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, =
&#39;x11&#39;, &#39; xf86-video-fbdev&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +IMAGE_INSTALL +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, =
&#39;x11&#39;, &#39; xf86-video-vesa&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +<br>
&gt; +SYSLINUX_KERNEL_ARGS ?=3D &quot;LABEL=3Dboot ramdisk_size=3D32768 roo=
t=3D/dev/ram0 rootimg=3Drootfs.img rw console=3Dhvc0 console=3Dtty0 panic=
=3D10 debugshell=3D5&quot;<br>
&gt; +<br>
&gt; +# syslinux is not required for PV guest configuration, but for HVM<br=
>
&gt; +build_syslinux_cfg () {<br>
&gt; + =A0 =A0 echo &quot;ALLOWOPTIONS 1&quot; &gt; ${SYSLINUXCFG}<br>
&gt; + =A0 =A0 echo &quot;DEFAULT boot&quot; &gt;&gt; ${SYSLINUXCFG}<br>
&gt; + =A0 =A0 echo &quot;TIMEOUT 10&quot; &gt;&gt; ${SYSLINUXCFG}<br>
&gt; + =A0 =A0 echo &quot;PROMPT 1&quot; &gt;&gt; ${SYSLINUXCFG}<br>
&gt; + =A0 =A0 echo &quot;LABEL boot&quot; &gt;&gt; ${SYSLINUXCFG}<br>
&gt; + =A0 =A0 echo &quot; =A0KERNEL /vmlinuz&quot; &gt;&gt; ${SYSLINUXCFG}=
<br>
&gt; + =A0 =A0 echo &quot; =A0INITRD /initrd&quot; &gt;&gt; ${SYSLINUXCFG}<=
br>
&gt; + =A0 =A0 echo &quot; =A0APPEND ${SYSLINUX_KERNEL_ARGS}&quot; &gt;&gt;=
 ${SYSLINUXCFG}<br>
&gt; +}<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div></div>

--001a11c26456e8006004e839a41c--
