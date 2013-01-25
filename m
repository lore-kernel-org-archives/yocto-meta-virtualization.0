Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67ABCE004AB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2013 08:05:59 -0800 (PST)
Received: by mail-lb0-f180.google.com with SMTP id q12so980891lbc.39
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2013 08:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=pRM/GF/1R3hzxCb9j9Qlo2CgcI2mn/Imp0ZQTpcdtoA=;
	b=AIetj1VZ08GvAZ1MsgjdaPvNjuUA1lpwDUjM7W/oj1kJk0jorKmdM9s+LVuAXAyr7L
	fnCNss3Bx2mIle21RMqiSIew2QoyOVuVr3KzaZrkoxl7/0gjMVKXFU950WyeQlCGh1jL
	40Xfi8wRET4lVfww4oN2hC9BBbYozxonw0h1IdF+agMNTWXvfOpJQZWQRNttnb/ohfUU
	3LPJRWOTvo8DQz4D4NyWHQToZIrg5vkvi3y5upr0jJwsefPc5+8rIOWmxToygwU0N9Wf
	dZKMW9HtDNBu+xYY9kxdoEDbRn+7d1+uJlXAZU+i4pqOww/EuhuvJcGfoM/lPXpCKCjV
	1B/w==
MIME-Version: 1.0
X-Received: by 10.152.125.237 with SMTP id mt13mr5608447lab.45.1359129955357; 
	Fri, 25 Jan 2013 08:05:55 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Fri, 25 Jan 2013 08:05:55 -0800 (PST)
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF914A03@IRSMSX101.ger.corp.intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<CADkTA4Nh1b6oySSoz59oODeLyehSYdGsUrh3JMLK2C9=AOZaKg@mail.gmail.com>
	<CAHsH0E8431dvHzC+qHerH6UqpDp3KbUzOf8vE5KXHUw0+23_QQ@mail.gmail.com>
	<CADkTA4OWKDPuP+g_VDqfoWGkRHaee-aOS+WhCySYMb7kPwjxQw@mail.gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF914A03@IRSMSX101.ger.corp.intel.com>
Date: Fri, 25 Jan 2013 11:05:55 -0500
Message-ID: <CADkTA4O7eY58kiTcbm0wev_tyPveMuQr+E+60ANBbTEZ+mj5Dw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Prica, Mihai" <mihai.prica@intel.com>
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
X-List-Received-Date: Fri, 25 Jan 2013 16:05:59 -0000
Content-Type: multipart/alternative; boundary=f46d04426ccc3153e104d41f1a9a

--f46d04426ccc3153e104d41f1a9a
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 25, 2013 at 10:48 AM, Prica, Mihai <mihai.prica@intel.com>wrote:

>
>
> > From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
> > Sent: Sunday, January 13, 2013 4:49 PM
> > To: lei yang
> > Cc: Prica, Mihai; meta-virtualization@yoctoproject.org
> > Subject: Re: [meta-virtualization] [PATCH v2 1/2] linux-yocto: added
> kernel configuration for KVM
> >
> >
> >
> > On Sat, Jan 12, 2013 at 1:08 AM, lei yang <yanglei.fage@gmail.com>
> wrote:
> > On Fri, Jan 11, 2013 at 1:08 PM, Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > > On Fri, Jan 11, 2013 at 11:27 AM, Mihai Prica <mihai.prica@intel.com>
> wrote:
> > >>
> >> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> >> ---
> >>  recipes-kernel/linux/linux-yocto_3.4.bbappend |    5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> >> b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> >> index 5b163ff..6fa02e8 100644
> >> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> >> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> >> @@ -6,3 +6,8 @@ SRC_URI += "file://xt-checksum.scc \
> >>             file://lxc.scc \
> >>             "
> >>
> >> +KERNEL_FEATURES_append = " kvm/qemu-kvm-enable"
> >
> >
> > Have you confirmed that this is adding the option you want ? I would have
> > expected this to be:
> >
> > KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
> >
> >
> > Hi Bruce,
> >
> > I also notice this, I did a serch in internal layer just found below
> > in wr-kernel use the same way
> >
> > templates/feature/libhugetlbfs/template.conf:KERNEL_FEATURES_append +=
> > "features/hugetlb"
> >
> > I don't know if there is defect for this, both work or not,or we like
> >.scc is there(coding style)
> >
> > They style is an older way of doing things. I have a yocto 1.4 bugzilla
> entry to convert
> > all cases of features that do not end with ".scc" to the more explicit
> format that includes
> > the extension.
> >
> > So no need to do anything special, but just keep in mind to use ".scc"
> when possible,
> > and eventually existing features will be converted.
> >
> > Cheers,
> >
> > Bruce
>
> I see that this hasn't been merged to master. Do I have to redo this  with
> "features/kvm/qemu-kvm-enable.scc" ?
>
>
Hmm. Sorry for letting this sit idle. Yes, let's make that change and I'll
do the
merge. I've recently converted all includes to be explicit, so having this
in the
same format is important.

Cheers,

Bruce


> Mihai
>
> > I'm glad to do a test later.
> >
> > Lei
> >
> >
> >>
> >> +
> >> +module_autoload_kvm = "kvm"
> >> +module_autoload_kvm-amd = "kvm-amd"
> >> +module_autoload_kvm-intel = "kvm-intel"
> >
> >
> > This part looks fine though.
> >
> > Cheers,
> >
> > Bruce
> >
> >>
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
> thee at
> > its end"
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d04426ccc3153e104d41f1a9a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Jan 25, 2013 at 10:48 AM, Prica, Mihai <span dir=3D"ltr">&l=
t;<a href=3D"mailto:mihai.prica@intel.com" target=3D"_blank">mihai.prica@in=
tel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
<br>
&gt; From: Bruce Ashfield [mailto:<a href=3D"mailto:bruce.ashfield@gmail.co=
m">bruce.ashfield@gmail.com</a>]<br>
&gt; Sent: Sunday, January 13, 2013 4:49 PM<br>
&gt; To: lei yang<br>
&gt; Cc: Prica, Mihai; <a href=3D"mailto:meta-virtualization@yoctoproject.o=
rg">meta-virtualization@yoctoproject.org</a><br>
&gt; Subject: Re: [meta-virtualization] [PATCH v2 1/2] linux-yocto: added k=
ernel configuration for KVM<br>
<div><div class=3D"h5">&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Sat, Jan 12, 2013 at 1:08 AM, lei yang &lt;<a href=3D"mailto:yangle=
i.fage@gmail.com">yanglei.fage@gmail.com</a>&gt; wrote:<br>
&gt; On Fri, Jan 11, 2013 at 1:08 PM, Bruce Ashfield<br>
&gt; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.c=
om</a>&gt; wrote:<br>
&gt; &gt; On Fri, Jan 11, 2013 at 11:27 AM, Mihai Prica &lt;<a href=3D"mail=
to:mihai.prica@intel.com">mihai.prica@intel.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt;&gt; Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mihai.prica@intel=
.com">mihai.prica@intel.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =A0recipes-kernel/linux/linux-yocto_3.4.bbappend | =A0 =A05 +++++<=
br>
&gt;&gt; =A01 file changed, 5 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
&gt;&gt; b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
&gt;&gt; index 5b163ff..6fa02e8 100644<br>
&gt;&gt; --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
&gt;&gt; +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend<br>
&gt;&gt; @@ -6,3 +6,8 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 file://lxc.scc \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt; +KERNEL_FEATURES_append =3D &quot; kvm/qemu-kvm-enable&quot;<br>
&gt;<br>
&gt;<br>
&gt; Have you confirmed that this is adding the option you want ? I would h=
ave<br>
&gt; expected this to be:<br>
&gt;<br>
&gt; KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.scc&quo=
t;<br>
&gt;<br>
&gt;<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; I also notice this, I did a serch in internal layer just found below<b=
r>
&gt; in wr-kernel use the same way<br>
&gt;<br>
&gt; templates/feature/libhugetlbfs/template.conf:KERNEL_FEATURES_append +=
=3D<br>
&gt; &quot;features/hugetlb&quot;<br>
&gt;<br>
&gt; I don&#39;t know if there is defect for this, both work or not,or we l=
ike<br>
&gt;.scc is there(coding style)<br>
&gt;<br>
&gt; They style is an older way of doing things. I have a yocto 1.4 bugzill=
a entry to convert<br>
&gt; all cases of features that do not end with &quot;.scc&quot; to the mor=
e explicit format that includes<br>
&gt; the extension.<br>
&gt;<br>
&gt; So no need to do anything special, but just keep in mind to use &quot;=
.scc&quot; when possible,=A0<br>
&gt; and eventually existing features will be converted.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
<br>
</div></div>I see that this hasn&#39;t been merged to master. Do I have to =
redo this =A0with &quot;features/kvm/qemu-kvm-enable.scc&quot; ?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div style>Hmm. Sorry for letting this sit idle. Yes, let=
&#39;s make that change and I&#39;ll do the</div><div style>merge. I&#39;ve=
 recently converted all includes to be explicit, so having this in the</div=
>
<div style>same format is important.</div><div style><br></div><div style>C=
heers,</div><div style><br></div><div style>Bruce</div><div>=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888">
Mihai<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; I&#39;m glad to do a test later.<br>
&gt;<br>
&gt; Lei<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +module_autoload_kvm =3D &quot;kvm&quot;<br>
&gt;&gt; +module_autoload_kvm-amd =3D &quot;kvm-amd&quot;<br>
&gt;&gt; +module_autoload_kvm-intel =3D &quot;kvm-intel&quot;<br>
&gt;<br>
&gt;<br>
&gt; This part looks fine though.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;<br>
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
ait thee at<br>
&gt; its end&quot;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
&gt;<br>
<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--f46d04426ccc3153e104d41f1a9a--
