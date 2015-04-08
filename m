Return-Path: <matera@lifealgorithmic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65FE9E0098D; Tue,  7 Apr 2015 22:14:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.173 listed in list.dnswl.org]
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04972E00953
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Apr 2015 22:14:12 -0700 (PDT)
Received: by qku63 with SMTP id 63so72498870qku.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 07 Apr 2015 22:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=IjeonLxogzuZW0O0OVdl0M2xoeMC8BV08+4pRtSYg3w=;
	b=VJKGoclHvaTNBLChURmp2OEIiYlqbEfDZVYVALaOE+FO6rr2u1sJ53OPpR7oMt3zBg
	dgbsN+OnYGcD0N2nj63Biaf8t4xc5byeY8MV5LDLeXBtvs5608FDMlc/mPpDbvR3uC6P
	zilFtsaJmafS5U1T0qR8wAmvxGJolqks0LqMPUkLsmrY7Gy0vizw/JQyMTtdvZbZHC4I
	VxAV6O/WY9o3VoTXz4waBLg/H9JVGQjf+1w2qYuIfblRrjUZu6jhhxX8AqxrKJdeKMp3
	nbdfHq4qZcmyf9zzHbLp240dZz2bNBvboc+DR2/j0JPk+i+Wvl4/WXQOfG64gWVnCLVy
	DUnQ==
X-Gm-Message-State: ALoCoQnPqSC4K8ZFb6ua8ZHf9cMbF4IeHEdmdevK+d4fGONYxf4y72wxBwGwbKgGrFW2MSofQTgp
MIME-Version: 1.0
X-Received: by 10.140.86.112 with SMTP id o103mr27219354qgd.98.1428470052438; 
	Tue, 07 Apr 2015 22:14:12 -0700 (PDT)
Received: by 10.96.168.194 with HTTP; Tue, 7 Apr 2015 22:14:12 -0700 (PDT)
Date: Tue, 7 Apr 2015 22:14:12 -0700
Message-ID: <CADGJdkmNL4mG_XeRaaXaWvrLQ10KFo6LkjHHZgAhXa1c98Rj=A@mail.gmail.com>
From: Michael Matera <matera@lifealgorithmic.com>
To: meta-virtualization@yoctoproject.org
Subject: Error building libvirt with pcap development files installed.
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
X-List-Received-Date: Wed, 08 Apr 2015 05:14:15 -0000
Content-Type: multipart/alternative; boundary=001a11c13da80c5d0c05132f9ae0

--001a11c13da80c5d0c05132f9ae0
Content-Type: text/plain; charset=UTF-8

Hello folks!

This is my first post so I'll try to make it a good one. I ran into some
trouble building kvm-image-minimal on Ubuntu 14.04 I suspect because I have
the libpcap0.80-dev package installed on my build host. Here's some details:

BB_VERSION        = "1.24.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "genericx86-64"
DISTRO            = "poky"
DISTRO_VERSION    = "1.7.1"
TUNE_FEATURES     = "m64 core2"
TARGET_FPU        = ""
meta
meta-yocto
meta-yocto-bsp    = "dizzy:ec75238f6cc2d2d8d40e0268f6d2acc070cbe9a4"
meta-virtualization = "dizzy:8ec8270017fbeae8fcb8c2d82a60a9f5116b0cf2"
meta-python
meta-oe
meta-networking
meta-filesystems  = "dizzy:2ebb8752f378c9987b0ece5a14915d703b872c1d"

Looking in the log I see:

  /usr/lib/x86_64-linux-gnu/libdevmapper.so: undefined reference to
`matchpathcon'

It seems that the compiler already warned me about this:

  warning: library search path "/usr/lib/x86_64-linux-gnu" is unsafe for
cross-compilation

Going back to log.do_configure, I see:

  configure:     pcap: -I/usr/include -L/usr/lib/x86_64-linux-gnu  -lpcap

This is clearly not right and it shows me that libvirt needs to be
configured with a specific location for libpcap. My fix, if you can call it
that, is to pass --without-pcap to configure. I did that by adding the
following line to libvirt_1.2.8.bb:

PACKAGECONFIG[libpcap] =
"--with-libpcap=MIKEKNOWSNOT,--without-libpcap,libpcap,"

I'm new to Yocto so I haven't read the 2,000 page reference manual closely
enough to properly formulate a better PACKAGECONFIG line. Perhaps you could
help me with that. :-) In any case, libvirt compiles fine without libpcap
and kvm-image-minimal is now built. I'm looking forward to testing it.

Cheers
./m

--001a11c13da80c5d0c05132f9ae0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello folks!=C2=A0<div><br></div><div>This is my first pos=
t so I&#39;ll try to make it a good one. I ran into some trouble building k=
vm-image-minimal on Ubuntu 14.04 I suspect because I have the libpcap0.80-d=
ev package installed on my build host. Here&#39;s some details:</div><div><=
br></div><div><div>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.24.0&q=
uot;</div><div>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux=
&quot;</div><div>NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-14.04&quot;</div><=
div>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-linux&quot;=
</div><div>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;genericx86-=
64&quot;</div><div>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;poky&quot;</div><div>DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;1.7.1&quot;</d=
iv><div>TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;</div><div>TAR=
GET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;</div><div>meta =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>meta-yocto =C2=A0 =C2=
=A0 =C2=A0 =C2=A0</div><div>meta-yocto-bsp =C2=A0 =C2=A0=3D &quot;dizzy:ec7=
5238f6cc2d2d8d40e0268f6d2acc070cbe9a4&quot;</div><div>meta-virtualization =
=3D &quot;dizzy:8ec8270017fbeae8fcb8c2d82a60a9f5116b0cf2&quot;</div><div>me=
ta-python =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>meta-oe =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=C2=A0</div><div>meta-networking =C2=A0=C2=A0</div><div>meta-=
filesystems =C2=A0=3D &quot;dizzy:2ebb8752f378c9987b0ece5a14915d703b872c1d&=
quot;</div></div><div><br></div><div>Looking in the log I see:=C2=A0</div><=
div><br></div><div>=C2=A0 /usr/lib/x86_64-linux-gnu/libdevmapper.so: undefi=
ned reference to `matchpathcon&#39;<br></div><div><br></div><div>It seems t=
hat the compiler already warned me about this:=C2=A0</div><div><br></div><d=
iv>=C2=A0 warning: library search path &quot;/usr/lib/x86_64-linux-gnu&quot=
; is unsafe for cross-compilation<br></div><div><br></div><div>Going back t=
o log.do_configure, I see:=C2=A0</div><div><br></div><div><div>=C2=A0 confi=
gure: =C2=A0 =C2=A0 pcap: -I/usr/include -L/usr/lib/x86_64-linux-gnu =C2=A0=
-lpcap=C2=A0<br></div></div><div><br></div><div>This is clearly not right a=
nd it shows me that libvirt needs to be configured with a specific location=
 for libpcap. My fix, if you can call it that, is to pass --without-pcap to=
 configure. I did that by adding the following line to <a href=3D"http://li=
bvirt_1.2.8.bb">libvirt_1.2.8.bb</a>:</div><div><br></div><div>PACKAGECONFI=
G[libpcap] =3D &quot;--with-libpcap=3DMIKEKNOWSNOT,--without-libpcap,libpca=
p,&quot;<br></div><div><br></div><div>I&#39;m new to Yocto so I haven&#39;t=
 read the 2,000 page reference manual closely enough to properly formulate =
a better PACKAGECONFIG line. Perhaps you could help me with that. :-) In an=
y case, libvirt compiles fine without libpcap and kvm-image-minimal is now =
built. I&#39;m looking forward to testing it.=C2=A0</div><div><br></div><di=
v>Cheers</div><div>./m</div><div><br></div><div><br></div></div>

--001a11c13da80c5d0c05132f9ae0--
