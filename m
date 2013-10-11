Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52535E0159B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Oct 2013 13:57:54 -0700 (PDT)
Received: by mail-lb0-f174.google.com with SMTP id w6so3877182lbh.33
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Oct 2013 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cm0shQTiVnCPueTd1lfKSY8QoOhYRCOFRwLQLotXNE4=;
	b=rTRy9aPCrxATxDfD+F2qAntCn6tE8yDtqlI+tv8xFnXx+WkOlMos/d3xwahj2bvkI4
	EKhheEyjII+EwIJ9nAK4Pomq09F3EQwJ2eVr0wNpJdh8gs76x8YE1DG14TH0Y2CIc5dt
	Uw5sn8I4w6XqzgCEzKQc4badymxBjWbN/SaVbViuOkryWe4rB4PmaopbLb5e0+iL4zse
	Cc/lJuUWsNxaY1mtcgUaM8rW+Tkc8S/F8tVeqqmC8CfnvB9nnI5TyRP3vttX/3oqZAWx
	K0hsObDJJPLwR0YbA2llauieV7LtXVqZBkO/7+37VQNEaVhIv5MZs+II3xZN031g5muh
	ssUw==
MIME-Version: 1.0
X-Received: by 10.112.53.130 with SMTP id b2mr18235811lbp.6.1381525073150;
	Fri, 11 Oct 2013 13:57:53 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Fri, 11 Oct 2013 13:57:53 -0700 (PDT)
In-Reply-To: <CADkTA4PUpuVhh28WFetFChKapQvZ8ym4D+EvmgadX-3u93=CoA@mail.gmail.com>
References: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
	<CADkTA4PUpuVhh28WFetFChKapQvZ8ym4D+EvmgadX-3u93=CoA@mail.gmail.com>
Date: Fri, 11 Oct 2013 16:57:53 -0400
Message-ID: <CABZSBQcfQOA73Mz7n-pKWpkRJ4cz+0pbPvOGxysMAyKQAi8PTg@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 0/3] Xen guest support
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
X-List-Received-Date: Fri, 11 Oct 2013 20:57:55 -0000
Content-Type: multipart/alternative; boundary=001a11c3f4003bc98604e87d5feb

--001a11c3f4003bc98604e87d5feb
Content-Type: text/plain; charset=ISO-8859-1

Thanks, looks good.


On Thu, Oct 10, 2013 at 11:34 PM, Bruce Ashfield
<bruce.ashfield@gmail.com>wrote:

> On Wed, Oct 9, 2013 at 10:22 PM, Chris Patterson <cjp256@gmail.com> wrote:
> > This patch set supercedes:
> > [meta-virtualization][PATCH] xen-guest-image-minimal: example image for
> a PV/HVM/PVHVM xen guest built with the 'xen-guest' kernel fragment.
> > [meta-virtualization][PATCH] linux-yocto: Add xen guest kernel fragment
> support for PV/HVM guests, using 'xen-guest' distro flag.
> >
> > v1 -> v2:
> > Consolidates xen-guest.cfg and xen.cfg into a single fragment that
> should be more consistent with typical yocto fragments and satisfies
> requirements for different types of xen guests.
> > Simplified xen-guest-image-minimal to simply append console=hvc0 kernel
> argument instead of the special syslinux config handling.
>
> Chris,
>
> I grabbed and merged these three, plus the outstanding patches from your
> other series. I very well could have missed something, so if i have, resend
> them and I'll get them merged right away.
>
> Bruce
>
> >
> > Chris Patterson (3):
> >   linux-yocto/xen: update fragment to support both dom0 and typical xen
> >     guests.
> >   xen-image-minimal: update image installed modules to reflect xen
> >     fragment changes.
> >   xen-guest-image-minimal: add minimal xen guest image.
> >
> >  recipes-extended/images/xen-guest-image-minimal.bb | 16
> ++++++++++++++++
> >  recipes-extended/images/xen-image-minimal.bb       |  6 ------
> >  recipes-kernel/linux/linux-yocto/xen.cfg           | 13 ++++++-------
> >  recipes-kernel/linux/linux-yocto/xen.scc           |  4 ++--
> >  recipes-kernel/linux/linux-yocto_3.10.bbappend     |  2 +-
> >  recipes-kernel/linux/linux-yocto_3.4.bbappend      |  2 +-
> >  recipes-kernel/linux/linux-yocto_3.8.bbappend      |  2 +-
> >  7 files changed, 27 insertions(+), 18 deletions(-)
> >  create mode 100644 recipes-extended/images/xen-guest-image-minimal.bb
> >
> > --
> > 1.8.4.rc3
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

--001a11c3f4003bc98604e87d5feb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, looks good.</div><div class=3D"gmail_extra"><br><b=
r><div class=3D"gmail_quote">On Thu, Oct 10, 2013 at 11:34 PM, Bruce Ashfie=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Oct 9, 2013 at 10:=
22 PM, Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com">cjp256@gmail=
.com</a>&gt; wrote:<br>

&gt; This patch set supercedes:<br>
&gt; [meta-virtualization][PATCH] xen-guest-image-minimal: example image fo=
r a PV/HVM/PVHVM xen guest built with the &#39;xen-guest&#39; kernel fragme=
nt.<br>
&gt; [meta-virtualization][PATCH] linux-yocto: Add xen guest kernel fragmen=
t support for PV/HVM guests, using &#39;xen-guest&#39; distro flag.<br>
&gt;<br>
&gt; v1 -&gt; v2:<br>
&gt; Consolidates xen-guest.cfg and xen.cfg into a single fragment that sho=
uld be more consistent with typical yocto fragments and satisfies requireme=
nts for different types of xen guests.<br>
&gt; Simplified xen-guest-image-minimal to simply append console=3Dhvc0 ker=
nel argument instead of the special syslinux config handling.<br>
<br>
</div>Chris,<br>
<br>
I grabbed and merged these three, plus the outstanding patches from your<br=
>
other series. I very well could have missed something, so if i have, resend=
<br>
them and I&#39;ll get them merged right away.<br>
<br>
Bruce<br>
<div class=3D"im"><br>
&gt;<br>
&gt; Chris Patterson (3):<br>
&gt; =A0 linux-yocto/xen: update fragment to support both dom0 and typical =
xen<br>
&gt; =A0 =A0 guests.<br>
&gt; =A0 xen-image-minimal: update image installed modules to reflect xen<b=
r>
&gt; =A0 =A0 fragment changes.<br>
&gt; =A0 xen-guest-image-minimal: add minimal xen guest image.<br>
&gt;<br>
&gt; =A0recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.b=
b" target=3D"_blank">xen-guest-image-minimal.bb</a> | 16 ++++++++++++++++<b=
r>
&gt; =A0recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" tar=
get=3D"_blank">xen-image-minimal.bb</a> =A0 =A0 =A0 | =A06 ------<br>
&gt; =A0recipes-kernel/linux/linux-yocto/xen.cfg =A0 =A0 =A0 =A0 =A0 | 13 +=
+++++-------<br>
&gt; =A0recipes-kernel/linux/linux-yocto/xen.scc =A0 =A0 =A0 =A0 =A0 | =A04=
 ++--<br>
&gt; =A0recipes-kernel/linux/linux-yocto_3.10.bbappend =A0 =A0 | =A02 +-<br=
>
&gt; =A0recipes-kernel/linux/linux-yocto_3.4.bbappend =A0 =A0 =A0| =A02 +-<=
br>
&gt; =A0recipes-kernel/linux/linux-yocto_3.8.bbappend =A0 =A0 =A0| =A02 +-<=
br>
&gt; =A07 files changed, 27 insertions(+), 18 deletions(-)<br>
&gt; =A0create mode 100644 recipes-extended/images/<a href=3D"http://xen-gu=
est-image-minimal.bb" target=3D"_blank">xen-guest-image-minimal.bb</a><br>
&gt;<br>
&gt; --<br>
&gt; 1.8.4.rc3<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
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

--001a11c3f4003bc98604e87d5feb--
