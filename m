Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.5770.1618299347369517990
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 00:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZWxmjGpS;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x4so18243439edd.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Apr 2021 00:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=12Bx8c+30bN3++I3/+1S87Essdxo/xparerr4Itxae8=;
        b=ZWxmjGpSJ1bbShGx5d0Kl+9PWikcbRqcveSiOSenHMReKpct46f0A/GSd6jhr1GCHp
         4LEUL7bLzAl41o8vEkwW8ZA++ZWXQxSckPx31TXROIm0X5r8GtyKskx2kozwa49Qpk8F
         Lof2FYU/uUeDrtcwwvF3NTGBZuJN2PQiU7bYZeP09Q6rN9z0YUjmA8+foH1fGNZMIVCL
         r0BmBfcBYsaut5wegu6h79YnnBv2cfV+a8bK95Y4tN5KgtqC2uBt0xsjW50YvAhqUqVx
         pjAu6M+UvkJJQ5vLQiGz6gdgDk1VyVUcr4GhnrZtHt7iWKhUEFmo2/hxYEwHPjwVMrI+
         y9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=12Bx8c+30bN3++I3/+1S87Essdxo/xparerr4Itxae8=;
        b=GwR/k3mrEvfoyEyZpCVRMkTNdBecT2Yc2KO9AKqzc8zZ7O/ZisWG+KghAmCh9ezLe7
         DfNZHKPkBSffxstC2NlHDjQ4qa/riagH6wF72evZZrrUreE+2MuRDcJhKIPiv9ITdfTV
         FM0+KA3RDq0BVrRzUZws2jNpVeuf1s9xM0gdbGp/0QKMkLKtp3puLVIk5CAVbaPIvwAk
         rn4q0GtPXe+9g4/gwzy7xNoBVaVCXPmx8Q4aj7f692NgZY6jAW4k8TALv1cpidJBoAaj
         RSS0echrT2zAHNVi8ZzyiSuuWTT2xmdLTzHIv2XQQyqBLLiYoP8FHEqprTEa4fnOENK0
         vxpA==
X-Gm-Message-State: AOAM532CSQpuAwbrVHLDVMLDABZM2bJwQs+hNWGw+uGaQgLUAyutw4J7
	ajJ5G+KoHAGS8IuZ5/Xf9TxQuEfYAKklOuRgVTE=
X-Google-Smtp-Source: ABdhPJy4y8UlvxtCegdd61hrGUZxARufLEC0Mi7poJQIMdwfGpgkEItPktAkkXmsXPI3x3gzqU8ynobdMam312BY8c4=
X-Received: by 2002:a50:eb92:: with SMTP id y18mr25228362edr.230.1618299345873;
 Tue, 13 Apr 2021 00:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210404092619.2059377-1-Martin.Jansa@gmail.com>
 <CACMJ4GaTFWE18fGWYPE0PWF1X=8gbGGWcp09bjc7fThc0sPcxg@mail.gmail.com> <CACMJ4GYJ44ZC28gM4WPrZcoxHKCR8Phf-Bkh1_a8Ek6pAwOJbw@mail.gmail.com>
In-Reply-To: <CACMJ4GYJ44ZC28gM4WPrZcoxHKCR8Phf-Bkh1_a8Ek6pAwOJbw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 13 Apr 2021 09:35:34 +0200
Message-ID: <CA+chaQdi_86mtxKpBqBsh40WCHiDViorSWGzUA2DJJ=xOYfs7g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen: drop i686 support also from xen-tools/xen-python2
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a6b05c05bfd5ad04"

--000000000000a6b05c05bfd5ad04
Content-Type: text/plain; charset="UTF-8"

Thanks! This should work for me as well.

On Tue, Apr 13, 2021 at 5:15 AM Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> On Tue, Apr 6, 2021 at 10:59 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > On Sun, Apr 4, 2021 at 2:26 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > >
> > > * this commit seems no longer true for current version of xen:
> > >   commit a0964e2044cb1ccdd4f64173658ce7602257ff48
> > >   Author: Christopher Clark <christopher.w.clark@gmail.com>
> > >   Date:   Tue Feb 25 16:16:00 2020 -0800
> > >
> > >     xen, xen-tools: separate COMPATIBLE_HOST for hypervisor and tools
> > >
> > >     The tools have broader platform compatibility than the hypervisor.
> > >
> > > * xen-tools are failing to build for qemux86 as shown in:
> > >   http://errors.yoctoproject.org/Errors/Details/575367/
> > >
> > >   make[8]: Entering directory
> 'TOPDIR/tmp-glibc/work/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/firmware/xen-dir/xen-root/xen'
> > >   echo "*** Xen x86/32 target no longer supported!"
> > >   *** Xen x86/32 target no longer supported!
> > >   make[8]: Leaving directory
> 'TOPDIR/tmp-glibc/work/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/firmware/xen-dir/xen-root/xen'
> > >   ln -sf xen-root/xen/xen xen-shim
> > >   ln -sf xen-root/xen/xen-syms xen-shim-syms
> > >   ...
> > >   install: cannot stat 'xen-dir/xen-shim': No such file or directory
> > >   make[4]: *** [Makefile:51: install] Error 1
> > >
> > >   revert the commit and also drop i686 from map_xen_arch
> >
> > Thanks for reporting this, Martin. I need to look into this. I can see
> > why this particular part of the tools build is not suitable for x86/32
> > but I don't think that it necessarily means that the entire suite of
> > xen-tools should be removed with it for x86/32, and if not then this
> > won't be the change that we will want to fix this build issue.
>
> To follow up on this: I've just posted an alternative patch that fixes
> the 32-bit x86 xen-tools build, so patch from this thread will not be
> required.
>
> thanks
>
> Christopher
>
>
> >
> > Christopher
> >
> >
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  recipes-extended/xen/xen-arch.inc       | 3 +--
> > >  recipes-extended/xen/xen-hypervisor.inc | 3 ---
> > >  recipes-extended/xen/xen-python2.bb     | 3 ---
> > >  recipes-extended/xen/xen-tools.inc      | 2 --
> > >  recipes-extended/xen/xen.inc            | 2 ++
> > >  5 files changed, 3 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/recipes-extended/xen/xen-arch.inc
> b/recipes-extended/xen/xen-arch.inc
> > > index fb0093e..9676045 100644
> > > --- a/recipes-extended/xen/xen-arch.inc
> > > +++ b/recipes-extended/xen/xen-arch.inc
> > > @@ -8,8 +8,7 @@ def map_xen_arch(a, d):
> > >      import re
> > >      valid_archs = d.getVar('valid_xen_archs').split()
> > >
> > > -    if   re.match("i.86", a):        return "x86_32"
> > > -    elif re.match("x86.64", a):      return "x86_64"
> > > +    if re.match("x86.64", a):      return "x86_64"
> > >      elif re.match("arm.*", a):       return "arm32"
> > >      elif re.match("aarch64.*", a):   return "arm64"
> > >      elif a in valid_archs:           return a
> > > diff --git a/recipes-extended/xen/xen-hypervisor.inc
> b/recipes-extended/xen/xen-hypervisor.inc
> > > index 916bd3c..d8e57e2 100644
> > > --- a/recipes-extended/xen/xen-hypervisor.inc
> > > +++ b/recipes-extended/xen/xen-hypervisor.inc
> > > @@ -6,9 +6,6 @@ DESCRIPTION = "The Xen hypervisor"
> > >  # this allows for varying the target architecture or toolchain used
> > >  # to build the different components. eg. 32-bit tools and a 64-bit
> hypervisor.
> > >
> > > -# The Xen hypervisor has a narrower compatible platform range than
> the Xen tools
> > > -COMPATIBLE_HOST =
> '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> > > -
> > >  inherit deploy python3native cml1
> > >
> > >  PACKAGES = " \
> > > diff --git a/recipes-extended/xen/xen-python2.bb
> b/recipes-extended/xen/xen-python2.bb
> > > index ad3c1fd..08d8e92 100644
> > > --- a/recipes-extended/xen/xen-python2.bb
> > > +++ b/recipes-extended/xen/xen-python2.bb
> > > @@ -6,9 +6,6 @@ SECTION = "console/tools"
> > >
> > >  SRCREV ?= "a5fcafbfbee55261853fba07149c1c795f2baf58"
> > >
> > > -# The same restriction as xen-tools.inc, because of the dependency on
> xen-tools-xentrace from xen-tools-xentrace-format
> > > -COMPATIBLE_HOST =
> 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> > > -
> > >  XEN_REL ?= "4.12"
> > >  XEN_BRANCH ?= "stable-4.12"
> > >
> > > diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> > > index 722c503..35d0c58 100644
> > > --- a/recipes-extended/xen/xen-tools.inc
> > > +++ b/recipes-extended/xen/xen-tools.inc
> > > @@ -1,8 +1,6 @@
> > >  SUMMARY = "Xen hypervisor tools"
> > >  DESCRIPTION = "Tools and utility software for the Xen hypervisor"
> > >
> > > -COMPATIBLE_HOST =
> 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> > > -
> > >  inherit setuptools3 update-rc.d systemd deploy
> > >  require xen-blktap.inc
> > >
> > > diff --git a/recipes-extended/xen/xen.inc
> b/recipes-extended/xen/xen.inc
> > > index 9e8fcad..8277939 100644
> > > --- a/recipes-extended/xen/xen.inc
> > > +++ b/recipes-extended/xen/xen.inc
> > > @@ -2,6 +2,8 @@ HOMEPAGE = "http://xen.org"
> > >  LICENSE = "GPLv2"
> > >  SECTION = "console/tools"
> > >
> > > +COMPATIBLE_HOST =
> '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> > > +
> > >  inherit autotools-brokensep
> > >
> > >  require xen-arch.inc
> > > --
> > > 2.30.2
> > >
>

--000000000000a6b05c05bfd5ad04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks! This should work for me as well.</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 13, 20=
21 at 5:15 AM Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@g=
mail.com">christopher.w.clark@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Tue, Apr 6, 2021 at 10:59 PM Chri=
stopher Clark<br>
&lt;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">chri=
stopher.w.clark@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, Apr 4, 2021 at 2:26 AM Martin Jansa &lt;<a href=3D"mailto:mart=
in.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:=
<br>
&gt; &gt;<br>
&gt; &gt; * this commit seems no longer true for current version of xen:<br=
>
&gt; &gt;=C2=A0 =C2=A0commit a0964e2044cb1ccdd4f64173658ce7602257ff48<br>
&gt; &gt;=C2=A0 =C2=A0Author: Christopher Clark &lt;<a href=3D"mailto:chris=
topher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</=
a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0Date:=C2=A0 =C2=A0Tue Feb 25 16:16:00 2020 -0800<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0xen, xen-tools: separate COMPATIBLE_HOST for h=
ypervisor and tools<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0The tools have broader platform compatibility =
than the hypervisor.<br>
&gt; &gt;<br>
&gt; &gt; * xen-tools are failing to build for qemux86 as shown in:<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Deta=
ils/575367/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoprojec=
t.org/Errors/Details/575367/</a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0make[8]: Entering directory &#39;TOPDIR/tmp-glibc/wor=
k/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/fi=
rmware/xen-dir/xen-root/xen&#39;<br>
&gt; &gt;=C2=A0 =C2=A0echo &quot;*** Xen x86/32 target no longer supported!=
&quot;<br>
&gt; &gt;=C2=A0 =C2=A0*** Xen x86/32 target no longer supported!<br>
&gt; &gt;=C2=A0 =C2=A0make[8]: Leaving directory &#39;TOPDIR/tmp-glibc/work=
/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/fir=
mware/xen-dir/xen-root/xen&#39;<br>
&gt; &gt;=C2=A0 =C2=A0ln -sf xen-root/xen/xen xen-shim<br>
&gt; &gt;=C2=A0 =C2=A0ln -sf xen-root/xen/xen-syms xen-shim-syms<br>
&gt; &gt;=C2=A0 =C2=A0...<br>
&gt; &gt;=C2=A0 =C2=A0install: cannot stat &#39;xen-dir/xen-shim&#39;: No s=
uch file or directory<br>
&gt; &gt;=C2=A0 =C2=A0make[4]: *** [Makefile:51: install] Error 1<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0revert the commit and also drop i686 from map_xen_arc=
h<br>
&gt;<br>
&gt; Thanks for reporting this, Martin. I need to look into this. I can see=
<br>
&gt; why this particular part of the tools build is not suitable for x86/32=
<br>
&gt; but I don&#39;t think that it necessarily means that the entire suite =
of<br>
&gt; xen-tools should be removed with it for x86/32, and if not then this<b=
r>
&gt; won&#39;t be the change that we will want to fix this build issue.<br>
<br>
To follow up on this: I&#39;ve just posted an alternative patch that fixes<=
br>
the 32-bit x86 xen-tools build, so patch from this thread will not be<br>
required.<br>
<br>
thanks<br>
<br>
Christopher<br>
<br>
<br>
&gt;<br>
&gt; Christopher<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gm=
ail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 recipes-extended/xen/xen-arch.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 3 +--<br>
&gt; &gt;=C2=A0 recipes-extended/xen/xen-hypervisor.inc | 3 ---<br>
&gt; &gt;=C2=A0 recipes-extended/xen/<a href=3D"http://xen-python2.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-python2.bb</a>=C2=A0 =C2=A0 =C2=A0| 3=
 ---<br>
&gt; &gt;=C2=A0 recipes-extended/xen/xen-tools.inc=C2=A0 =C2=A0 =C2=A0 | 2 =
--<br>
&gt; &gt;=C2=A0 recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 ++<br>
&gt; &gt;=C2=A0 5 files changed, 3 insertions(+), 10 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended=
/xen/xen-arch.inc<br>
&gt; &gt; index fb0093e..9676045 100644<br>
&gt; &gt; --- a/recipes-extended/xen/xen-arch.inc<br>
&gt; &gt; +++ b/recipes-extended/xen/xen-arch.inc<br>
&gt; &gt; @@ -8,8 +8,7 @@ def map_xen_arch(a, d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 import re<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 valid_archs =3D d.getVar(&#39;valid_xen_archs=
&#39;).split()<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 if=C2=A0 =C2=A0re.match(&quot;i.86&quot;, a):=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;x86_32&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 elif re.match(&quot;x86.64&quot;, a):=C2=A0 =C2=A0=
 =C2=A0 return &quot;x86_64&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 if re.match(&quot;x86.64&quot;, a):=C2=A0 =C2=A0 =
=C2=A0 return &quot;x86_64&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 elif re.match(&quot;arm.*&quot;, a):=C2=A0 =
=C2=A0 =C2=A0 =C2=A0return &quot;arm32&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 elif re.match(&quot;aarch64.*&quot;, a):=C2=
=A0 =C2=A0return &quot;arm64&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 elif a in valid_archs:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return a<br>
&gt; &gt; diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-ex=
tended/xen/xen-hypervisor.inc<br>
&gt; &gt; index 916bd3c..d8e57e2 100644<br>
&gt; &gt; --- a/recipes-extended/xen/xen-hypervisor.inc<br>
&gt; &gt; +++ b/recipes-extended/xen/xen-hypervisor.inc<br>
&gt; &gt; @@ -6,9 +6,6 @@ DESCRIPTION =3D &quot;The Xen hypervisor&quot;<br=
>
&gt; &gt;=C2=A0 # this allows for varying the target architecture or toolch=
ain used<br>
&gt; &gt;=C2=A0 # to build the different components. eg. 32-bit tools and a=
 64-bit hypervisor.<br>
&gt; &gt;<br>
&gt; &gt; -# The Xen hypervisor has a narrower compatible platform range th=
an the Xen tools<br>
&gt; &gt; -COMPATIBLE_HOST =3D &#39;(x86_64.*).*-linux|aarch64.*-linux|arm-=
.*-linux-gnueabi&#39;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 inherit deploy python3native cml1<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PACKAGES =3D &quot; \<br>
&gt; &gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen-python2.b=
b" rel=3D"noreferrer" target=3D"_blank">xen-python2.bb</a> b/recipes-extend=
ed/xen/<a href=3D"http://xen-python2.bb" rel=3D"noreferrer" target=3D"_blan=
k">xen-python2.bb</a><br>
&gt; &gt; index ad3c1fd..08d8e92 100644<br>
&gt; &gt; --- a/recipes-extended/xen/<a href=3D"http://xen-python2.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-python2.bb</a><br>
&gt; &gt; +++ b/recipes-extended/xen/<a href=3D"http://xen-python2.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-python2.bb</a><br>
&gt; &gt; @@ -6,9 +6,6 @@ SECTION =3D &quot;console/tools&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRCREV ?=3D &quot;a5fcafbfbee55261853fba07149c1c795f2baf58&=
quot;<br>
&gt; &gt;<br>
&gt; &gt; -# The same restriction as xen-tools.inc, because of the dependen=
cy on xen-tools-xentrace from xen-tools-xentrace-format<br>
&gt; &gt; -COMPATIBLE_HOST =3D &#39;i686-.*-linux|(x86_64.*).*-linux|aarch6=
4.*-linux|arm-.*-linux-gnueabi&#39;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 XEN_REL ?=3D &quot;4.12&quot;<br>
&gt; &gt;=C2=A0 XEN_BRANCH ?=3D &quot;stable-4.12&quot;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extende=
d/xen/xen-tools.inc<br>
&gt; &gt; index 722c503..35d0c58 100644<br>
&gt; &gt; --- a/recipes-extended/xen/xen-tools.inc<br>
&gt; &gt; +++ b/recipes-extended/xen/xen-tools.inc<br>
&gt; &gt; @@ -1,8 +1,6 @@<br>
&gt; &gt;=C2=A0 SUMMARY =3D &quot;Xen hypervisor tools&quot;<br>
&gt; &gt;=C2=A0 DESCRIPTION =3D &quot;Tools and utility software for the Xe=
n hypervisor&quot;<br>
&gt; &gt;<br>
&gt; &gt; -COMPATIBLE_HOST =3D &#39;i686-.*-linux|(x86_64.*).*-linux|aarch6=
4.*-linux|arm-.*-linux-gnueabi&#39;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 inherit setuptools3 update-rc.d systemd deploy<br>
&gt; &gt;=C2=A0 require xen-blktap.inc<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/=
xen.inc<br>
&gt; &gt; index 9e8fcad..8277939 100644<br>
&gt; &gt; --- a/recipes-extended/xen/xen.inc<br>
&gt; &gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt; &gt; @@ -2,6 +2,8 @@ HOMEPAGE =3D &quot;<a href=3D"http://xen.org" rel=
=3D"noreferrer" target=3D"_blank">http://xen.org</a>&quot;<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt;=C2=A0 SECTION =3D &quot;console/tools&quot;<br>
&gt; &gt;<br>
&gt; &gt; +COMPATIBLE_HOST =3D &#39;(x86_64.*).*-linux|aarch64.*-linux|arm-=
.*-linux-gnueabi&#39;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 inherit autotools-brokensep<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 require xen-arch.inc<br>
&gt; &gt; --<br>
&gt; &gt; 2.30.2<br>
&gt; &gt;<br>
</blockquote></div>

--000000000000a6b05c05bfd5ad04--
