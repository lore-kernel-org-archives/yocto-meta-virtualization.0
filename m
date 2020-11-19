Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.11949.1605804629377845631
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 08:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pxm5KT02;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id y18so5899803ilp.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Nov 2020 08:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MHE9hWTf5GaXgMXQCusVJ4D/UMRffiITl+cJAiTwrX8=;
        b=pxm5KT02vcZ7mx4TkyJdkDeDc9qJ4Ca3lP+D8Bq/Vb6n+OPnFQpNritSbQE31U27s5
         qLMnLS5A5hAlR1z7m9FFTfNaiFnGD07UyiapCWrCQemtSMR3zuPl15tCQHz26SZRnuXm
         1nlsO0EYD/rwnaadY4w9F2/QPubG82L5mvBKaxUxs800UljTn84WLcXzsDYazP19GOc1
         tQVT+c6Kt8gTm+a7Dh1XyUrzDg0Nlmvz1hY62eQSaOgUAy88+SiPjjTOoFWGkDZlBK/u
         EiM6h2OdoeQnGl3h3ShJEODFGProV4s6EMV5xS9Xe5/4+8fD/ijVQAaNh3MQ52rdgl5U
         XcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MHE9hWTf5GaXgMXQCusVJ4D/UMRffiITl+cJAiTwrX8=;
        b=jAi9uRLi//90n+MqbGWG4GADD38Y0rTk11tLi0YX4+C+R7mMKETowolO9bSwyrbR2G
         5+ux367fenUNee3H6HHkGz2VJWhqEM7Fe3OdAzPKCwvFVECeWIyY2aBZVYo0pm37hM26
         vSiXxyyKYQIiNGbUOYH3wJrVqvfsPJOAj+G++SIShZURpiuFpxRUMIoa4u9gpRXe6RYN
         ddV1++IX/nDMh4rAGxJZjo9kDqwFC1bhWQxhJoq1qIoOqePpJcIKrgAGpugT0VcRgIBj
         lWCBVeZW2UEPZZgEZKBWPNyz43ljXImMUU5rXgii+o1b9IHNDrnznDBOnYR6jKx1aLNl
         g5Zw==
X-Gm-Message-State: AOAM530LTzgTvGFaGTqG4AN0YmjQShCWYhuzJtf+jxKOMpCimb+8JiZ3
	wrKUNoPwPYTzEy8ombAG2t24Wu+sAMITkNqzyio=
X-Google-Smtp-Source: ABdhPJx15I8pab/h7xesmiNz/oGZA/0Tuad5f70FcZXIvvLBzVyveKU5CcHuO1efwG0la/oRSxOVn+OCVIbEerWLWno=
X-Received: by 2002:a92:d2cb:: with SMTP id w11mr20556950ilg.170.1605804628675;
 Thu, 19 Nov 2020 08:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20201115034922.30940-1-ticotimo@gmail.com> <20201119160844.GC9432@gmail.com>
In-Reply-To: <20201119160844.GC9432@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Thu, 19 Nov 2020 08:50:16 -0800
Message-ID: <CANx9H-DQm6s5mn+eDGB4U7y2jLey7=7w7EP-JaRjco95EbevJQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-yocto: add cgroup-hugetlb config
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000078924905b47886fa"

--00000000000078924905b47886fa
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2020 at 8:08 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> In message: [meta-virtualization][PATCH] linux-yocto: add cgroup-hugetlb
> config
> on 14/11/2020 Tim Orling wrote:
>
> > From: Tim Orling <ticotimo@gmail.com>
> >
> > Add kernel config fragment for CONFIG_CGROUP_HUGETLB
> >
> > This is a recommended config for Kubernetes and k8s
> > will throw a warning if it is not present.
>
> In my k3s-wip branch, I have a series of kernel configs directly related
> and named for kubernetes .. I had hoped to just merge this into that
> effort, but as you can see from my posts, getting k3s done is taking
> longer than I wanted.
>
> So I've gone ahead and merged this, and I'll consolidate them later when
> I finish k3s.
>
>
Thank you.
I am likewise not convinced this is the final version of this, but it is
what is working for me now.

Bruce
>
> >
> > Signed-off-by: Tim Orling <ticotimo@gmail.com>
> > ---
> >  recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg | 5 +++++
> >  recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc | 5 +++++
> >  recipes-kernel/linux/linux-yocto_virtualization.inc | 1 +
> >  3 files changed, 11 insertions(+)
> >  create mode 100644 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
> >  create mode 100644 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
> >
> > diff --git a/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
> b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
> > new file mode 100644
> > index 0000000..417ca24
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: MIT
> > +#
> > +# This requires CONFIG_HUGETLBFS
> > +
> > +CONFIG_CGROUP_HUGETLB=y
> > diff --git a/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
> b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
> > new file mode 100644
> > index 0000000..7d1f999
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: MIT
> > +define KFEATURE_DESCRIPTION "Enable hugetlb cgroup"
> > +define KFEATURE_COMPATIBILITY all
> > +
> > +kconf non-hardware cgroup-hugetlb.cfg
> > diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc
> b/recipes-kernel/linux/linux-yocto_virtualization.inc
> > index f050b3f..42a10b3 100644
> > --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> > +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> > @@ -5,6 +5,7 @@ SRC_URI += "file://xt-checksum.scc \
> >           file://vswitch.scc \
> >           file://lxc.scc \
> >              file://docker.scc \
> > +         file://cgroup-hugetlb.scc \
> >           "
> >  KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES',
> 'kvm', 'features/kvm/qemu-kvm-enable.scc', '', d)}"
> >
> > --
> > 2.25.0
> >
>
> >
> > 
> >
>
>

--00000000000078924905b47886fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 19, 2020 at 8:08 AM Bruce=
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">In message: [meta-virtualization][PATCH] linux-yocto: add cgroup-hug=
etlb config<br>
on 14/11/2020 Tim Orling wrote:<br>
<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"=
_blank">ticotimo@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Add kernel config fragment for CONFIG_CGROUP_HUGETLB<br>
&gt; <br>
&gt; This is a recommended config for Kubernetes and k8s<br>
&gt; will throw a warning if it is not present.<br>
<br>
In my k3s-wip branch, I have a series of kernel configs directly related<b=
r>
and named for kubernetes .. I had hoped to just merge this into that<br>
effort, but as you can see from my posts, getting k3s done is taking<br>
longer than I wanted.<br>
<br>
So I&#39;ve gone ahead and merged this, and I&#39;ll consolidate them late=
r when<br>
I finish k3s.<br>
<br></blockquote><div><br></div><div>Thank you.</div><div>I am likewise no=
t convinced this is the final version of this, but it is what is working fo=
r me now.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
Bruce<br>
<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" t=
arget=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg | 5 +++++<b=
r>
&gt;=C2=A0 recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc | 5 +++++<b=
r>
&gt;=C2=A0 recipes-kernel/linux/linux-yocto_virtualization.inc | 1 +<br>
&gt;=C2=A0 3 files changed, 11 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-kernel/linux/linux-yocto/cgroup-huge=
tlb.cfg<br>
&gt;=C2=A0 create mode 100644 recipes-kernel/linux/linux-yocto/cgroup-huge=
tlb.scc<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg b/re=
cipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg<br>
&gt; new file mode 100644<br>
&gt; index 0000000..417ca24<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.cfg<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +# This requires CONFIG_HUGETLBFS<br>
&gt; +<br>
&gt; +CONFIG_CGROUP_HUGETLB=3Dy<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc b/re=
cipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..7d1f999<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +define KFEATURE_DESCRIPTION &quot;Enable hugetlb cgroup&quot;<br>
&gt; +define KFEATURE_COMPATIBILITY all<br>
&gt; +<br>
&gt; +kconf non-hardware cgroup-hugetlb.cfg<br>
&gt; diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/re=
cipes-kernel/linux/linux-yocto_virtualization.inc<br>
&gt; index f050b3f..42a10b3 100644<br>
&gt; --- a/recipes-kernel/linux/linux-yocto_virtualization.inc<br>
&gt; +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc<br>
&gt; @@ -5,6 +5,7 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vswitch.scc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc.scc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cgroup-hugetlb.scc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&#39;DIS=
TRO_FEATURES&#39;, &#39;kvm&#39;, &#39;features/kvm/qemu-kvm-enable.scc&#39=
;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.25.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000078924905b47886fa--
