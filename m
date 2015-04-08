Return-Path: <matera@lifealgorithmic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBDCAE0086D; Wed,  8 Apr 2015 13:54:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79CC5E007A0
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Apr 2015 13:54:42 -0700 (PDT)
Received: by qcrf4 with SMTP id f4so34493940qcr.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 08 Apr 2015 13:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=3Zqdg/IIOZV+mRLb2Smhp0Y/ZIi9UiKXmjEZs/YpaLk=;
	b=lASTLiXhJYGzvHulSmEzVXnVek8tYIyIcbn5u267npudtG471RPj9SeDJOoNE5e8It
	6epxK4pJu0/lzXLHrsE4XW4zMpD6MxFnusDQJVrzEJ7kfvgpYxJTD+Z/q/thPZ2BnuyY
	nx1LKtHh/5jat3CtrlZJMVBv5Nc6O3eLdpbzfeO71KqX/G+McPxSq8D39N61C+uAl5Il
	PU6ejxU7qRgeBnXPRHWixsZ4rLfb0OdGZuUluSTTkI9+X6cfcFkvdKuobB3vE1e9FGKW
	vAjlfu4TkAQm/OiOqAsWVPf3YgnJcVfjFIAvoljb06095cSSTrcGVyOWraHnC7I3Q38S
	KqEQ==
X-Gm-Message-State: ALoCoQmRN8oyH5Nqb+GES0jLZh7jQiuv9tF5m3NCYwD/aRj7BQ/lX8rit17wHMwWuAwkNimqJiXB
MIME-Version: 1.0
X-Received: by 10.140.238.138 with SMTP id j132mr33355462qhc.85.1428526482403; 
	Wed, 08 Apr 2015 13:54:42 -0700 (PDT)
Received: by 10.96.168.194 with HTTP; Wed, 8 Apr 2015 13:54:42 -0700 (PDT)
In-Reply-To: <CADkTA4ObJoGRoe7ss6pEL4JRNFoJBVf3B9PCmxb8VaBOHnZOMg@mail.gmail.com>
References: <CADGJdkmNL4mG_XeRaaXaWvrLQ10KFo6LkjHHZgAhXa1c98Rj=A@mail.gmail.com>
	<CADkTA4ObJoGRoe7ss6pEL4JRNFoJBVf3B9PCmxb8VaBOHnZOMg@mail.gmail.com>
Date: Wed, 8 Apr 2015 13:54:42 -0700
Message-ID: <CADGJdkkcPwagtoVa8uLexgOB6LkoG-8XiAWJ9E8X=MFPyRN3ig@mail.gmail.com>
From: Michael Matera <matera@lifealgorithmic.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Error building libvirt with pcap development files installed.
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
X-List-Received-Date: Wed, 08 Apr 2015 20:54:44 -0000
Content-Type: multipart/alternative; boundary=001a1135ac2e894f9705133cbd5d

--001a1135ac2e894f9705133cbd5d
Content-Type: text/plain; charset=UTF-8

Hi Bruce,

Thanks for the patch. I'm having trouble getting it compiled. Can you tell
me what versions you're using? I switched to the master branch but now I'm
getting unrelated errors. Here's what I'm using:

meta
meta-yocto
meta-yocto-bsp    = "master:d6d2dd5c9e06c54ff336b44d54f01b4fe24903ed"
meta-virtualization = "master:40dcc06946b0ef46286ae8982565cfa72c972d07"
meta-python
meta-oe
meta-networking
meta-filesystems  = "master:f3092a6766a3004a6fc9e2eef937a40508e97c44"

Cheers
./m


On Wed, Apr 8, 2015 at 10:24 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Wed, Apr 8, 2015 at 1:14 AM, Michael Matera
> <matera@lifealgorithmic.com> wrote:
> > Hello folks!
> >
> > This is my first post so I'll try to make it a good one. I ran into some
>
> :). welcome!
>
> > trouble building kvm-image-minimal on Ubuntu 14.04 I suspect because I
> have
> > the libpcap0.80-dev package installed on my build host. Here's some
> details:
> >
> > BB_VERSION        = "1.24.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-14.04"
> > TARGET_SYS        = "x86_64-poky-linux"
> > MACHINE           = "genericx86-64"
> > DISTRO            = "poky"
> > DISTRO_VERSION    = "1.7.1"
> > TUNE_FEATURES     = "m64 core2"
> > TARGET_FPU        = ""
> > meta
> > meta-yocto
> > meta-yocto-bsp    = "dizzy:ec75238f6cc2d2d8d40e0268f6d2acc070cbe9a4"
> > meta-virtualization = "dizzy:8ec8270017fbeae8fcb8c2d82a60a9f5116b0cf2"
> > meta-python
> > meta-oe
> > meta-networking
> > meta-filesystems  = "dizzy:2ebb8752f378c9987b0ece5a14915d703b872c1d"
> >
> > Looking in the log I see:
> >
> >   /usr/lib/x86_64-linux-gnu/libdevmapper.so: undefined reference to
> > `matchpathcon'
> >
> > It seems that the compiler already warned me about this:
> >
> >   warning: library search path "/usr/lib/x86_64-linux-gnu" is unsafe for
> > cross-compilation
> >
> > Going back to log.do_configure, I see:
> >
> >   configure:     pcap: -I/usr/include -L/usr/lib/x86_64-linux-gnu  -lpcap
> >
> > This is clearly not right and it shows me that libvirt needs to be
> > configured with a specific location for libpcap. My fix, if you can call
> it
> > that, is to pass --without-pcap to configure. I did that by adding the
> > following line to libvirt_1.2.8.bb:
> >
> > PACKAGECONFIG[libpcap] =
> > "--with-libpcap=MIKEKNOWSNOT,--without-libpcap,libpcap,"
>
> We have libpcap as a dependency for libvirt, so while the package config
> value works to disable the option, what we need is to point libvirt's
> configuration
> phase to the sysroot, where our target version of libpcap can be found.
>
> That's fundamentally the same thing you are asking above, just without
> packageconfig injecting it into the configuration phase.
>
> .. I went and had a look at how libvirt deals with libpcap and that flag
> doesn't do what you expect in the --with usage .. it only points to a
> different
> location for pcap-config. pcap-config is stubbed out in our system, so that
> will never work.
>
> As it turns out, everyone has had a floating or mis identified libcap (my
> config.log doesn't find it, and hence just has 'no').
>
> I pulled together the attached patch, it allows my libpcap from the sysroot
> to be found and used for the build.
>
> I didn't do any runtime testing, but if it works for you, I'll push it
> to the tree
> shortly.
>
> Cheers,
>
> Bruce
>
> >
> > I'm new to Yocto so I haven't read the 2,000 page reference manual
> closely
> > enough to properly formulate a better PACKAGECONFIG line. Perhaps you
> could
> > help me with that. :-) In any case, libvirt compiles fine without libpcap
> > and kvm-image-minimal is now built. I'm looking forward to testing it.
> >
> > Cheers
> > ./m
> >
> >
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--001a1135ac2e894f9705133cbd5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,=C2=A0<div><br></div><div>Thanks for the patch. I=
&#39;m having trouble getting it compiled. Can you tell me what versions yo=
u&#39;re using? I switched to the master branch but now I&#39;m getting unr=
elated errors. Here&#39;s what I&#39;m using:=C2=A0</div><div><br></div><di=
v><div>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>meta=
-yocto =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>meta-yocto-bsp =C2=A0 =C2=A0=
=3D &quot;master:d6d2dd5c9e06c54ff336b44d54f01b4fe24903ed&quot;</div><div>m=
eta-virtualization =3D &quot;master:40dcc06946b0ef46286ae8982565cfa72c972d0=
7&quot;</div><div>meta-python =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>meta-oe =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>meta-networking =C2=A0=
=C2=A0</div><div>meta-filesystems =C2=A0=3D &quot;master:f3092a6766a3004a6f=
c9e2eef937a40508e97c44&quot;</div></div><div><br></div><div>Cheers</div><di=
v>./m</div><div><br></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, Apr 8, 2015 at 10:24 AM, Bruce Ashfield <span dir=
=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">=
bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span class=3D"">On Wed, Apr 8, 2015 at 1:14 AM, Michael Matera<br>
&lt;<a href=3D"mailto:matera@lifealgorithmic.com">matera@lifealgorithmic.co=
m</a>&gt; wrote:<br>
&gt; Hello folks!<br>
&gt;<br>
&gt; This is my first post so I&#39;ll try to make it a good one. I ran int=
o some<br>
<br>
</span>:). welcome!<br>
<div><div class=3D"h5"><br>
&gt; trouble building kvm-image-minimal on Ubuntu 14.04 I suspect because I=
 have<br>
&gt; the libpcap0.80-dev package installed on my build host. Here&#39;s som=
e details:<br>
&gt;<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.24.0&quot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot=
;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Ubuntu-14.04&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-poky-linux&quot=
;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;genericx86-6=
4&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quot;<b=
r>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;1.7.1&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;m64 core2&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>
&gt; meta<br>
&gt; meta-yocto<br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;dizzy:ec75238f6cc2d2d8d40e0268f6=
d2acc070cbe9a4&quot;<br>
&gt; meta-virtualization =3D &quot;dizzy:8ec8270017fbeae8fcb8c2d82a60a9f511=
6b0cf2&quot;<br>
&gt; meta-python<br>
&gt; meta-oe<br>
&gt; meta-networking<br>
&gt; meta-filesystems=C2=A0 =3D &quot;dizzy:2ebb8752f378c9987b0ece5a14915d7=
03b872c1d&quot;<br>
&gt;<br>
&gt; Looking in the log I see:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/usr/lib/x86_64-linux-gnu/libdevmapper.so: undefined refer=
ence to<br>
&gt; `matchpathcon&#39;<br>
&gt;<br>
&gt; It seems that the compiler already warned me about this:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0warning: library search path &quot;/usr/lib/x86_64-linux-g=
nu&quot; is unsafe for<br>
&gt; cross-compilation<br>
&gt;<br>
&gt; Going back to log.do_configure, I see:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0configure:=C2=A0 =C2=A0 =C2=A0pcap: -I/usr/include -L/usr/=
lib/x86_64-linux-gnu=C2=A0 -lpcap<br>
&gt;<br>
&gt; This is clearly not right and it shows me that libvirt needs to be<br>
&gt; configured with a specific location for libpcap. My fix, if you can ca=
ll it<br>
&gt; that, is to pass --without-pcap to configure. I did that by adding the=
<br>
&gt; following line to <a href=3D"http://libvirt_1.2.8.bb" target=3D"_blank=
">libvirt_1.2.8.bb</a>:<br>
&gt;<br>
&gt; PACKAGECONFIG[libpcap] =3D<br>
&gt; &quot;--with-libpcap=3DMIKEKNOWSNOT,--without-libpcap,libpcap,&quot;<b=
r>
<br>
</div></div>We have libpcap as a dependency for libvirt, so while the packa=
ge config<br>
value works to disable the option, what we need is to point libvirt&#39;s<b=
r>
configuration<br>
phase to the sysroot, where our target version of libpcap can be found.<br>
<br>
That&#39;s fundamentally the same thing you are asking above, just without<=
br>
packageconfig injecting it into the configuration phase.<br>
<br>
.. I went and had a look at how libvirt deals with libpcap and that flag<br=
>
doesn&#39;t do what you expect in the --with usage .. it only points to a d=
ifferent<br>
location for pcap-config. pcap-config is stubbed out in our system, so that=
<br>
will never work.<br>
<br>
As it turns out, everyone has had a floating or mis identified libcap (my<b=
r>
config.log doesn&#39;t find it, and hence just has &#39;no&#39;).<br>
<br>
I pulled together the attached patch, it allows my libpcap from the sysroot=
<br>
to be found and used for the build.<br>
<br>
I didn&#39;t do any runtime testing, but if it works for you, I&#39;ll push=
 it<br>
to the tree<br>
shortly.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; I&#39;m new to Yocto so I haven&#39;t read the 2,000 page reference ma=
nual closely<br>
&gt; enough to properly formulate a better PACKAGECONFIG line. Perhaps you =
could<br>
&gt; help me with that. :-) In any case, libvirt compiles fine without libp=
cap<br>
&gt; and kvm-image-minimal is now built. I&#39;m looking forward to testing=
 it.<br>
&gt;<br>
&gt; Cheers<br>
&gt; ./m<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
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
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div>

--001a1135ac2e894f9705133cbd5d--
