Return-Path: <matera@lifealgorithmic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB437E00997; Fri, 10 Apr 2015 09:21:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail-vn0-f44.google.com (mail-vn0-f44.google.com
	[209.85.216.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C6D5E0095C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Apr 2015 09:21:44 -0700 (PDT)
Received: by vnbg129 with SMTP id g129so6665556vnb.4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Apr 2015 09:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=+tqVsjnE+y+K4M9kuBYVpxBYMbbhL81KuBVi92kT42o=;
	b=ImXORxbYFtdbIhBdJaC2TtNX2SMxDpWFMSsfnSqHKYLhaRFk4ZFpT02W7Rup9XYyp8
	V84bxoIfcKPsIkUWxQ+0GPL1CJO3/mLc1tb9amUhBIFyBGAnlwGVWSd0K4P8tJsbQraz
	J9E/bfNUW4z80bAmgYVFUYlIencpq/yKiDCNR/7kZ9sOoQdTxyP/KqlBUwCHplhyXDX2
	8o6oIA7EuMdrN25NrjJAUvPpIWDdqA2hZ8iIqlA+BcqVgzpBIDTAIXd9EiHSqaLz5duQ
	WmcvX80d8DZUlA0+rGwnoJpDZUkg3lID4werFDa+60SsTMrwoj/Kfa5irC6mYXBrvvxW
	WtIQ==
X-Gm-Message-State: ALoCoQmocds/mfcF4Xu9HY91tFks5swcBMZphohBY9xcJI4oJmwErBLgGYdAzwlJ9thOUqkXjx7m
MIME-Version: 1.0
X-Received: by 10.140.102.180 with SMTP id w49mr2670884qge.82.1428682903481;
	Fri, 10 Apr 2015 09:21:43 -0700 (PDT)
Received: by 10.96.168.194 with HTTP; Fri, 10 Apr 2015 09:21:43 -0700 (PDT)
In-Reply-To: <CADGJdk=ynkc5vtNgL6rB5_sktieS871zE7vQSZ1AkUfLp=G5QQ@mail.gmail.com>
References: <CADGJdkmNL4mG_XeRaaXaWvrLQ10KFo6LkjHHZgAhXa1c98Rj=A@mail.gmail.com>
	<CADkTA4ObJoGRoe7ss6pEL4JRNFoJBVf3B9PCmxb8VaBOHnZOMg@mail.gmail.com>
	<CADGJdkkcPwagtoVa8uLexgOB6LkoG-8XiAWJ9E8X=MFPyRN3ig@mail.gmail.com>
	<CADkTA4MnqESzrZnb-B=0p85_7Luo10jq4bezZr1Ziswxf+1LYA@mail.gmail.com>
	<CADGJdk=ynkc5vtNgL6rB5_sktieS871zE7vQSZ1AkUfLp=G5QQ@mail.gmail.com>
Date: Fri, 10 Apr 2015 09:21:43 -0700
Message-ID: <CADGJdkkAPjUSVcTm2+kxSC+HtjfBGqn3V5ihy5fZWQzvKkRa5A@mail.gmail.com>
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
X-List-Received-Date: Fri, 10 Apr 2015 16:21:48 -0000
Content-Type: multipart/alternative; boundary=001a11c16ebcf58b600513612843

--001a11c16ebcf58b600513612843
Content-Type: text/plain; charset=UTF-8

Hi Bruce,

Doing a git pull and turning off systemd fixed me. The patch works. Thanks!

Cheers
./m

On Thu, Apr 9, 2015 at 1:40 PM, Michael Matera <matera@lifealgorithmic.com>
wrote:

> Hi,
>
> That's what I assumed too. Again, I'm new to Yocto so let me make
> absolutely sure that my setup is sane and I'll let you know. It'll probably
> be tomorrow (when I have time for fun!) because I teach two classes today.
>
> Cheers
> ./m
>
> On Thu, Apr 9, 2015 at 5:27 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>> On Wed, Apr 8, 2015 at 4:54 PM, Michael Matera
>> <matera@lifealgorithmic.com> wrote:
>> > Hi Bruce,
>> >
>> > Thanks for the patch. I'm having trouble getting it compiled. Can you
>> tell
>> > me what versions you're using? I switched to the master branch but now
>> I'm
>> > getting unrelated errors. Here's what I'm using:
>>
>> I'm always working from master (unless otherwise stated). What exact error
>> did you see ? No compilation issues here!
>>
>> Bruce
>>
>> >
>> > meta
>> > meta-yocto
>> > meta-yocto-bsp    = "master:d6d2dd5c9e06c54ff336b44d54f01b4fe24903ed"
>> > meta-virtualization = "master:40dcc06946b0ef46286ae8982565cfa72c972d07"
>> > meta-python
>> > meta-oe
>> > meta-networking
>> > meta-filesystems  = "master:f3092a6766a3004a6fc9e2eef937a40508e97c44"
>> >
>> > Cheers
>> > ./m
>> >
>> >
>> > On Wed, Apr 8, 2015 at 10:24 AM, Bruce Ashfield <
>> bruce.ashfield@gmail.com>
>> > wrote:
>> >>
>> >> On Wed, Apr 8, 2015 at 1:14 AM, Michael Matera
>> >> <matera@lifealgorithmic.com> wrote:
>> >> > Hello folks!
>> >> >
>> >> > This is my first post so I'll try to make it a good one. I ran into
>> some
>> >>
>> >> :). welcome!
>> >>
>> >> > trouble building kvm-image-minimal on Ubuntu 14.04 I suspect because
>> I
>> >> > have
>> >> > the libpcap0.80-dev package installed on my build host. Here's some
>> >> > details:
>> >> >
>> >> > BB_VERSION        = "1.24.0"
>> >> > BUILD_SYS         = "x86_64-linux"
>> >> > NATIVELSBSTRING   = "Ubuntu-14.04"
>> >> > TARGET_SYS        = "x86_64-poky-linux"
>> >> > MACHINE           = "genericx86-64"
>> >> > DISTRO            = "poky"
>> >> > DISTRO_VERSION    = "1.7.1"
>> >> > TUNE_FEATURES     = "m64 core2"
>> >> > TARGET_FPU        = ""
>> >> > meta
>> >> > meta-yocto
>> >> > meta-yocto-bsp    = "dizzy:ec75238f6cc2d2d8d40e0268f6d2acc070cbe9a4"
>> >> > meta-virtualization =
>> "dizzy:8ec8270017fbeae8fcb8c2d82a60a9f5116b0cf2"
>> >> > meta-python
>> >> > meta-oe
>> >> > meta-networking
>> >> > meta-filesystems  = "dizzy:2ebb8752f378c9987b0ece5a14915d703b872c1d"
>> >> >
>> >> > Looking in the log I see:
>> >> >
>> >> >   /usr/lib/x86_64-linux-gnu/libdevmapper.so: undefined reference to
>> >> > `matchpathcon'
>> >> >
>> >> > It seems that the compiler already warned me about this:
>> >> >
>> >> >   warning: library search path "/usr/lib/x86_64-linux-gnu" is unsafe
>> for
>> >> > cross-compilation
>> >> >
>> >> > Going back to log.do_configure, I see:
>> >> >
>> >> >   configure:     pcap: -I/usr/include -L/usr/lib/x86_64-linux-gnu
>> >> > -lpcap
>> >> >
>> >> > This is clearly not right and it shows me that libvirt needs to be
>> >> > configured with a specific location for libpcap. My fix, if you can
>> call
>> >> > it
>> >> > that, is to pass --without-pcap to configure. I did that by adding
>> the
>> >> > following line to libvirt_1.2.8.bb:
>> >> >
>> >> > PACKAGECONFIG[libpcap] =
>> >> > "--with-libpcap=MIKEKNOWSNOT,--without-libpcap,libpcap,"
>> >>
>> >> We have libpcap as a dependency for libvirt, so while the package
>> config
>> >> value works to disable the option, what we need is to point libvirt's
>> >> configuration
>> >> phase to the sysroot, where our target version of libpcap can be found.
>> >>
>> >> That's fundamentally the same thing you are asking above, just without
>> >> packageconfig injecting it into the configuration phase.
>> >>
>> >> .. I went and had a look at how libvirt deals with libpcap and that
>> flag
>> >> doesn't do what you expect in the --with usage .. it only points to a
>> >> different
>> >> location for pcap-config. pcap-config is stubbed out in our system, so
>> >> that
>> >> will never work.
>> >>
>> >> As it turns out, everyone has had a floating or mis identified libcap
>> (my
>> >> config.log doesn't find it, and hence just has 'no').
>> >>
>> >> I pulled together the attached patch, it allows my libpcap from the
>> >> sysroot
>> >> to be found and used for the build.
>> >>
>> >> I didn't do any runtime testing, but if it works for you, I'll push it
>> >> to the tree
>> >> shortly.
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >> >
>> >> > I'm new to Yocto so I haven't read the 2,000 page reference manual
>> >> > closely
>> >> > enough to properly formulate a better PACKAGECONFIG line. Perhaps you
>> >> > could
>> >> > help me with that. :-) In any case, libvirt compiles fine without
>> >> > libpcap
>> >> > and kvm-image-minimal is now built. I'm looking forward to testing
>> it.
>> >> >
>> >> > Cheers
>> >> > ./m
>> >> >
>> >> >
>> >> >
>> >> > --
>> >> > _______________________________________________
>> >> > meta-virtualization mailing list
>> >> > meta-virtualization@yoctoproject.org
>> >> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >> >
>> >>
>> >>
>> >>
>> >> --
>> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end"
>> >
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>
>

--001a11c16ebcf58b600513612843
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,=C2=A0<div><br></div><div>Doing a git pull and tu=
rning off systemd fixed me. The patch works. Thanks!</div><div><br></div><d=
iv>Cheers</div><div>./m</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Thu, Apr 9, 2015 at 1:40 PM, Michael Matera <span dir=
=3D"ltr">&lt;<a href=3D"mailto:matera@lifealgorithmic.com" target=3D"_blank=
">matera@lifealgorithmic.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>That&#39;s what I a=
ssumed too. Again, I&#39;m new to Yocto so let me make absolutely sure that=
 my setup is sane and I&#39;ll let you know. It&#39;ll probably be tomorrow=
 (when I have time for fun!) because I teach two classes today.=C2=A0</div>=
<div><br></div><div>Cheers</div><span class=3D"HOEnZb"><font color=3D"#8888=
88"><div>./m</div></font></span></div><div class=3D"HOEnZb"><div class=3D"h=
5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Apr 9,=
 2015 at 5:27 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Wed, Apr 8, 2015 a=
t 4:54 PM, Michael Matera<br>
&lt;<a href=3D"mailto:matera@lifealgorithmic.com" target=3D"_blank">matera@=
lifealgorithmic.com</a>&gt; wrote:<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; Thanks for the patch. I&#39;m having trouble getting it compiled. Can =
you tell<br>
&gt; me what versions you&#39;re using? I switched to the master branch but=
 now I&#39;m<br>
&gt; getting unrelated errors. Here&#39;s what I&#39;m using:<br>
<br>
</span>I&#39;m always working from master (unless otherwise stated). What e=
xact error<br>
did you see ? No compilation issues here!<br>
<span><font color=3D"#888888"><br>
Bruce<br>
</font></span><div><div><br>
&gt;<br>
&gt; meta<br>
&gt; meta-yocto<br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;master:d6d2dd5c9e06c54ff336b44d5=
4f01b4fe24903ed&quot;<br>
&gt; meta-virtualization =3D &quot;master:40dcc06946b0ef46286ae8982565cfa72=
c972d07&quot;<br>
&gt; meta-python<br>
&gt; meta-oe<br>
&gt; meta-networking<br>
&gt; meta-filesystems=C2=A0 =3D &quot;master:f3092a6766a3004a6fc9e2eef937a4=
0508e97c44&quot;<br>
&gt;<br>
&gt; Cheers<br>
&gt; ./m<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Apr 8, 2015 at 10:24 AM, Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt=
;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Apr 8, 2015 at 1:14 AM, Michael Matera<br>
&gt;&gt; &lt;<a href=3D"mailto:matera@lifealgorithmic.com" target=3D"_blank=
">matera@lifealgorithmic.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Hello folks!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This is my first post so I&#39;ll try to make it a good one. =
I ran into some<br>
&gt;&gt;<br>
&gt;&gt; :). welcome!<br>
&gt;&gt;<br>
&gt;&gt; &gt; trouble building kvm-image-minimal on Ubuntu 14.04 I suspect =
because I<br>
&gt;&gt; &gt; have<br>
&gt;&gt; &gt; the libpcap0.80-dev package installed on my build host. Here&=
#39;s some<br>
&gt;&gt; &gt; details:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.24.0&quot;<=
br>
&gt;&gt; &gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-l=
inux&quot;<br>
&gt;&gt; &gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Ubuntu-14.04&quot;<br>
&gt;&gt; &gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-poky-l=
inux&quot;<br>
&gt;&gt; &gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;gen=
ericx86-64&quot;<br>
&gt;&gt; &gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;pok=
y&quot;<br>
&gt;&gt; &gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;1.7.1&quot;<br>
&gt;&gt; &gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;m64 core2&quot;<br=
>
&gt;&gt; &gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>
&gt;&gt; &gt; meta<br>
&gt;&gt; &gt; meta-yocto<br>
&gt;&gt; &gt; meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;dizzy:ec75238f6cc2d2d8d=
40e0268f6d2acc070cbe9a4&quot;<br>
&gt;&gt; &gt; meta-virtualization =3D &quot;dizzy:8ec8270017fbeae8fcb8c2d82=
a60a9f5116b0cf2&quot;<br>
&gt;&gt; &gt; meta-python<br>
&gt;&gt; &gt; meta-oe<br>
&gt;&gt; &gt; meta-networking<br>
&gt;&gt; &gt; meta-filesystems=C2=A0 =3D &quot;dizzy:2ebb8752f378c9987b0ece=
5a14915d703b872c1d&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Looking in the log I see:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/usr/lib/x86_64-linux-gnu/libdevmapper.so: undefi=
ned reference to<br>
&gt;&gt; &gt; `matchpathcon&#39;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It seems that the compiler already warned me about this:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0warning: library search path &quot;/usr/lib/x86_6=
4-linux-gnu&quot; is unsafe for<br>
&gt;&gt; &gt; cross-compilation<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Going back to log.do_configure, I see:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0configure:=C2=A0 =C2=A0 =C2=A0pcap: -I/usr/includ=
e -L/usr/lib/x86_64-linux-gnu<br>
&gt;&gt; &gt; -lpcap<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This is clearly not right and it shows me that libvirt needs =
to be<br>
&gt;&gt; &gt; configured with a specific location for libpcap. My fix, if y=
ou can call<br>
&gt;&gt; &gt; it<br>
&gt;&gt; &gt; that, is to pass --without-pcap to configure. I did that by a=
dding the<br>
&gt;&gt; &gt; following line to <a href=3D"http://libvirt_1.2.8.bb" target=
=3D"_blank">libvirt_1.2.8.bb</a>:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; PACKAGECONFIG[libpcap] =3D<br>
&gt;&gt; &gt; &quot;--with-libpcap=3DMIKEKNOWSNOT,--without-libpcap,libpcap=
,&quot;<br>
&gt;&gt;<br>
&gt;&gt; We have libpcap as a dependency for libvirt, so while the package =
config<br>
&gt;&gt; value works to disable the option, what we need is to point libvir=
t&#39;s<br>
&gt;&gt; configuration<br>
&gt;&gt; phase to the sysroot, where our target version of libpcap can be f=
ound.<br>
&gt;&gt;<br>
&gt;&gt; That&#39;s fundamentally the same thing you are asking above, just=
 without<br>
&gt;&gt; packageconfig injecting it into the configuration phase.<br>
&gt;&gt;<br>
&gt;&gt; .. I went and had a look at how libvirt deals with libpcap and tha=
t flag<br>
&gt;&gt; doesn&#39;t do what you expect in the --with usage .. it only poin=
ts to a<br>
&gt;&gt; different<br>
&gt;&gt; location for pcap-config. pcap-config is stubbed out in our system=
, so<br>
&gt;&gt; that<br>
&gt;&gt; will never work.<br>
&gt;&gt;<br>
&gt;&gt; As it turns out, everyone has had a floating or mis identified lib=
cap (my<br>
&gt;&gt; config.log doesn&#39;t find it, and hence just has &#39;no&#39;).<=
br>
&gt;&gt;<br>
&gt;&gt; I pulled together the attached patch, it allows my libpcap from th=
e<br>
&gt;&gt; sysroot<br>
&gt;&gt; to be found and used for the build.<br>
&gt;&gt;<br>
&gt;&gt; I didn&#39;t do any runtime testing, but if it works for you, I&#3=
9;ll push it<br>
&gt;&gt; to the tree<br>
&gt;&gt; shortly.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m new to Yocto so I haven&#39;t read the 2,000 page ref=
erence manual<br>
&gt;&gt; &gt; closely<br>
&gt;&gt; &gt; enough to properly formulate a better PACKAGECONFIG line. Per=
haps you<br>
&gt;&gt; &gt; could<br>
&gt;&gt; &gt; help me with that. :-) In any case, libvirt compiles fine wit=
hout<br>
&gt;&gt; &gt; libpcap<br>
&gt;&gt; &gt; and kvm-image-minimal is now built. I&#39;m looking forward t=
o testing it.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cheers<br>
&gt;&gt; &gt; ./m<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; meta-virtualization mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" targe=
t=3D"_blank">meta-virtualization@yoctoproject.org</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtu=
alization" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-v=
irtualization</a><br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await<br>
&gt;&gt; thee at its end&quot;<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a11c16ebcf58b600513612843--
