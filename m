Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CE57E0182C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 20:07:59 -0800 (PST)
Received: by mail-la0-f54.google.com with SMTP id hp15so286528lab.41
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 20:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Np7UdMetS4XsropcOjkFoluPn1YNKU/UlPdSMDrX2ew=;
	b=XcMVbO25gN8DYntBPiXwuF8q+760pUOxh6WCz3UbF10JOQ1p232GUl6ElwHALbVn3e
	TdizaCjwLnJtO2qvTKmkgRgBYvytSLfCgMOZSg56eXZVExvx++QQO4RhNlV54KMOjL1c
	jhuW0X4lcsIltrOPaGizgH2IdyomfxVTw1FjdI041pg+S2fAe46k0CjdR17Uf6hyAzn7
	uZB1mHV/hJg8qCJsdZfCZRazXuO2NPSlBp9Pn+rsacAJzp+e4KNtBHVJ71BTlYn6jTQq
	kmpYZHdl+vg/vZgoaxIsGBGe4wCShiZPHsvmhsFl9l/fFJZg4uH81YMTkweSIOvd7Sy8
	VNSg==
MIME-Version: 1.0
X-Received: by 10.152.6.74 with SMTP id y10mr9254816lay.16.1383883678796; Thu,
	07 Nov 2013 20:07:58 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Thu, 7 Nov 2013 20:07:58 -0800 (PST)
In-Reply-To: <CADkTA4MAfcsVPH54igL_PSvh8U=Q_85bSQincGSQNb7OMHMPSQ@mail.gmail.com>
References: <1383706491-3555-1-git-send-email-flihp@twobit.us>
	<CADkTA4MAfcsVPH54igL_PSvh8U=Q_85bSQincGSQNb7OMHMPSQ@mail.gmail.com>
Date: Thu, 7 Nov 2013 23:07:58 -0500
Message-ID: <CABZSBQcXJ4mJTCAwwVoT9-oRoAOKsZYwxiPNxn1eOawpB-K5xA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add getty to inittab for login on Xen serial console.
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
X-List-Received-Date: Fri, 08 Nov 2013 04:08:00 -0000
Content-Type: multipart/alternative; boundary=089e0149401a15cf9504eaa28742

--089e0149401a15cf9504eaa28742
Content-Type: text/plain; charset=ISO-8859-1

Thanks, handy!


On Thu, Nov 7, 2013 at 3:32 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Tue, Nov 5, 2013 at 9:54 PM, Philip Tricca <flihp@twobit.us> wrote:
> > It's not pretty but the mechanisms in sysvinit-inittab assume the
> > console device name is tty*. The Xen console device doesn't meet
> > this criteria.
>
> merged (with a minor tweak to the shortlog).
>
> Bruce
>
> >
> > Signed-off-by: Philip Tricca <flihp@twobit.us>
> > ---
> >  recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend |    7 +++++++
> >  1 file changed, 7 insertions(+)
> >  create mode 100644
> recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> >
> > diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> > new file mode 100644
> > index 0000000..2edbedf
> > --- /dev/null
> > +++ b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> > @@ -0,0 +1,7 @@
> > +do_install_append() {
> > +       echo "${DISTRO_FEATURES}" | grep -q 'xen'
> > +       if [ $? -eq 0 ]; then
> > +               echo "" >> ${D}${sysconfdir}/inittab
> > +               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >>
> ${D}${sysconfdir}/inittab
> > +       fi
> > +}
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
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--089e0149401a15cf9504eaa28742
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, handy!<br></div><div class=3D"gmail_extra"><br><br=
><div class=3D"gmail_quote">On Thu, Nov 7, 2013 at 3:32 PM, Bruce Ashfield =
<span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D=
"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, Nov 5, 2013 at 9:5=
4 PM, Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us">flihp@twobit.us<=
/a>&gt; wrote:<br>

&gt; It&#39;s not pretty but the mechanisms in sysvinit-inittab assume the<=
br>
&gt; console device name is tty*. The Xen console device doesn&#39;t meet<b=
r>
&gt; this criteria.<br>
<br>
</div>merged (with a minor tweak to the shortlog).<br>
<br>
Bruce<br>
<div class=3D"im HOEnZb"><br>
&gt;<br>
&gt; Signed-off-by: Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us">fl=
ihp@twobit.us</a>&gt;<br>
&gt; ---<br>
&gt; =A0recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend | =A0 =A07 =
+++++++<br>
&gt; =A01 file changed, 7 insertions(+)<br>
&gt; =A0create mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.88dsf.b=
bappend<br>
&gt;<br>
&gt; diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend b=
/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend<br>
&gt; new file mode 100644<br>
&gt; index 0000000..2edbedf<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +do_install_append() {<br>
&gt; + =A0 =A0 =A0 echo &quot;${DISTRO_FEATURES}&quot; | grep -q &#39;xen&#=
39;<br>
&gt; + =A0 =A0 =A0 if [ $? -eq 0 ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;&quot; &gt;&gt; ${D}${sysconf=
dir}/inittab<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;X0:12345:respawn:/sbin/getty =
115200 hvc0&quot; &gt;&gt; ${D}${sysconfdir}/inittab<br>
&gt; + =A0 =A0 =A0 fi<br>
&gt; +}<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
<br>
<br>
<br>
</div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</div></div></blockquote></div><br></div>

--089e0149401a15cf9504eaa28742--
