Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECC70E006CD
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Jan 2013 06:48:38 -0800 (PST)
Received: by mail-la0-f51.google.com with SMTP id fj20so3024214lab.24
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Jan 2013 06:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Wn2yysPo3yZa1T/byOB0DeZqRy/BB2ftZWOqor4jdzk=;
	b=gHpr2XPFylRWibfkmYg/exhzKyWBPy2I96o+DavD1Y6cnZD0QkP8n1h9bSGVvhXIDf
	HNshpw1pwU2fSvnZqWazCZq0vBVwEWV9o7z6LVbMViPsx1oSJYuE83m4WBN4pjxcm/WZ
	6aU739Vulqw0lGFpMnjBGPAok1aqmTInoDkl/xQuqf8CiDoCihyJcub6vlPUHkQMRRxP
	IAgZ1dglMCI6YV/o39RY5hQwjvuYlRouyS3Z2Y1USNb9jyUZQQ9bJSuSXh1ggWRd1EJy
	23aLoH+JNEQ7JGY/15/GNHgsUQqLAA2XD9EJZ8k474Wnr9sFf4GbPHvES8iBJf0NOCU8
	8PwA==
MIME-Version: 1.0
Received: by 10.112.102.9 with SMTP id fk9mr14939528lbb.100.1358088517499;
	Sun, 13 Jan 2013 06:48:37 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Sun, 13 Jan 2013 06:48:37 -0800 (PST)
In-Reply-To: <CAHsH0E8431dvHzC+qHerH6UqpDp3KbUzOf8vE5KXHUw0+23_QQ@mail.gmail.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<CADkTA4Nh1b6oySSoz59oODeLyehSYdGsUrh3JMLK2C9=AOZaKg@mail.gmail.com>
	<CAHsH0E8431dvHzC+qHerH6UqpDp3KbUzOf8vE5KXHUw0+23_QQ@mail.gmail.com>
Date: Sun, 13 Jan 2013 09:48:37 -0500
Message-ID: <CADkTA4OWKDPuP+g_VDqfoWGkRHaee-aOS+WhCySYMb7kPwjxQw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: lei yang <yanglei.fage@gmail.com>
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
X-List-Received-Date: Sun, 13 Jan 2013 14:48:39 -0000
Content-Type: multipart/alternative; boundary=f46d0401fbb9a8bc3904d32c9ff4

--f46d0401fbb9a8bc3904d32c9ff4
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 12, 2013 at 1:08 AM, lei yang <yanglei.fage@gmail.com> wrote:

> On Fri, Jan 11, 2013 at 1:08 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Fri, Jan 11, 2013 at 11:27 AM, Mihai Prica <mihai.prica@intel.com>
> wrote:
> >>
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
>
> Hi Bruce,
>
> I also notice this, I did a serch in internal layer just found below
> in wr-kernel use the same way
>
> templates/feature/libhugetlbfs/template.conf:KERNEL_FEATURES_append +=
> "features/hugetlb"
>
> I don't know if there is defect for this, both work or not,or we like
> .scc is there(coding style)
>

They style is an older way of doing things. I have a yocto 1.4 bugzilla
entry to convert
all cases of features that do not end with ".scc" to the more explicit
format that includes
the extension.

So no need to do anything special, but just keep in mind to use ".scc" when
possible,
and eventually existing features will be converted.

Cheers,

Bruce


>
> I'm glad to do a test later.
>
> Lei
>
>
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d0401fbb9a8bc3904d32c9ff4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sat, Jan 12, 2013 at 1:08 AM, lei yang <span dir=3D"ltr">&lt;<a =
href=3D"mailto:yanglei.fage@gmail.com" target=3D"_blank">yanglei.fage@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Fri, Jan 11, 2013 at 1:=
08 PM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a=
>&gt; wrote:<br>
&gt; On Fri, Jan 11, 2013 at 11:27 AM, Mihai Prica &lt;<a href=3D"mailto:mi=
hai.prica@intel.com">mihai.prica@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
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
<br>
</div>Hi Bruce,<br>
<br>
I also notice this, I did a serch in internal layer just found below<br>
in wr-kernel use the same way<br>
<br>
templates/feature/libhugetlbfs/template.conf:KERNEL_FEATURES_append +=3D<br=
>
&quot;features/hugetlb&quot;<br>
<br>
I don&#39;t know if there is defect for this, both work or not,or we like<b=
r>
.scc is there(coding style)<br></blockquote><div><br></div><div style>They =
style is an older way of doing things. I have a yocto 1.4 bugzilla entry to=
 convert</div><div style>all cases of features that do not end with &quot;.=
scc&quot; to the more explicit format that includes</div>
<div style>the extension.</div><div style><br></div><div style>So no need t=
o do anything special, but just keep in mind to use &quot;.scc&quot; when p=
ossible,=A0</div><div style>and eventually existing features will be conver=
ted.</div>
<div style><br></div><div style>Cheers,</div><div style><br></div><div styl=
e>Bruce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I&#39;m glad to do a test later.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Lei<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
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
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--f46d0401fbb9a8bc3904d32c9ff4--
