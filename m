Return-Path: <protect-me@macula.io>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3609CE00BC2; Tue, 30 Oct 2018 19:53:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.45 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
	[209.85.217.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC6A2E0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Oct 2018 19:53:36 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id p74so2127092vsc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Oct 2018 19:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=macula-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZMav6LSVECmKaQNojfCNry+mznIwZdtE67TYI92k1OM=;
	b=Fl0Lt8pnHNeV7yQvi2jASBY2YOfv9UT6ju6pxL6QcxchUULNDb/qblk+EzFQIU2Gdw
	DNdcBHVdNVrBhvVlukPl97uGMjWdOb3hmZb+FYqJsUMXPVtjnwH79+DJHz4B4VQFHg8F
	nCF3qHyJmFheZjqjUeUD/gwY7vFGzNFuPoeAjcFIoaaYAVODcMCigjzVfDXvtiPAb2Ro
	d5Yc0iq7XYrPh7A659KR6UIpfBd3An3RncQMCa+kHQl4fzgLW8zyK2yfOvOk49HT4VcW
	4VXEOBywMrAqwhvje3zk7hoXb1hHwJ0jvY6OaD03DZQMNXborn9JNfSjIoQ+3WLRMLgM
	H59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZMav6LSVECmKaQNojfCNry+mznIwZdtE67TYI92k1OM=;
	b=jSP3u20eVFLe0zHJyafIWZsDB7cGMxLR8GTxsZb7tTe/ZZvE/yDGXCKQlSo0BD2Hir
	xV75mKmLq0a6d9daC2FohuPPuFukMbVuwR+aH9Qyb9MM38JSQXFwXGbSTHkATKQCP0JJ
	MwXO/FAhokYPBffeuZyyUfhYA/KbEvDudDjbRBZ+MbP8TYY/l/dl3dKCabZOc4+Y9p15
	Mo2GRE4eOjLV8UuserBwy94tAiZOExYp7K7rc6UsI9r8glIBUkQrqmQCAaYMK7phTRW7
	DI6tUpTpmjOtfogyKzoM09jN2t5EDYMx/tU77PwtPnE6RkfFoNv0D9ZX7XHbMCY/hdFd
	CX3A==
X-Gm-Message-State: AGRZ1gI+/LXeG+KfAuWKkwa2iDxsnPpDBm77vkWmIsHFqnzpGUknlPSP
	0KY2Dhi1LO/kZM+7vlFlWDNLYuDKAxc+gdxe/vu1aQ==
X-Google-Smtp-Source: AJdET5fsjP+7wqroQXppgeU8QEBJ4cCJ9whbT62t0KKuBzodifo7HVa4quKttBg79bpbPiej8mIq8welPYL4TzZ9zJ4=
X-Received: by 2002:a67:3c5c:: with SMTP id j89mr522025vsa.117.1540954415692; 
	Tue, 30 Oct 2018 19:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <CACJyUrFcBLUgCg0Hzx9vb7btuULWNqyzQ+jgJbRUhna9v_Vffw@mail.gmail.com>
	<CADkTA4PhwYg=KAdw8yMMu0D6NqX6djRTnDy2YoiaoOBge98biw@mail.gmail.com>
In-Reply-To: <CADkTA4PhwYg=KAdw8yMMu0D6NqX6djRTnDy2YoiaoOBge98biw@mail.gmail.com>
From: Dan Regalado <protect-me@macula.io>
Date: Tue, 30 Oct 2018 19:53:24 -0700
Message-ID: <CACJyUrECXtTT3RELHTC2sjTewrG8qx9VybGbvkomzCqK2GJ+Ww@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Failed to compile Xen 4.11.0 in krogoth branch
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
X-List-Received-Date: Wed, 31 Oct 2018 02:53:38 -0000
Content-Type: multipart/alternative; boundary="00000000000090138505797d6830"

--00000000000090138505797d6830
Content-Type: text/plain; charset="UTF-8"

Thanks Bruce

On Mon, Oct 29, 2018, 1:28 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Tue, Oct 23, 2018 at 5:36 PM Dan Regalado <protect-me@macula.io> wrote:
> >
> > Hi list,
> >
> > First off, thanks for your help.
> > Previously I was able to compile Xen 4.10.0 using krogoth branch for
> Xilinx ZCU102 board and now I want to do the same but with version 4.11.0,
> using same branch so I added the .bb recipe based on below patch:
> >
> >
> https://lists.yoctoproject.org/pipermail/meta-virtualization/2018-July/003633.html
> >
> > But it is failing as follows:
> >
> > I think, the first ERROR related to LIC_FILES_CHKSUM can be easily fixed
> (I guess by putting the right hash in xen.inc)
> >
> > Loading cache: 100%
> |#######################################################################################################################################################################|
> ETA:  00:00:00
> > Loaded 18 entries from dependency cache.
> > Parsing recipes: 100%
> |#####################################################################################################################################################################|
> Time: 00:00:43
> > Parsing of 1895 .bb files complete (17 cached, 1878 parsed). 2451
> targets, 143 skipped, 0 masked, 0 errors.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION        = "1.30.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-16.04"
> > TARGET_SYS        = "aarch64-poky-linux"
> > MACHINE           = "zcu102-zynqmp"
> > DISTRO            = "poky"
> > DISTRO_VERSION    = "2.1.3"
> > TUNE_FEATURES     = "aarch64"
> > TARGET_FPU        = ""
> > meta
> > meta-poky
> > meta-yocto-bsp    = "krogoth:444dc2e99b3c3967d9f83380c34bb99077a6ffa8"
> > meta-oe
> > meta-filesystems
> > meta-python
> > meta-networking   = "krogoth:55c8a76da5dc099a7bc3838495c672140cedb78e"
> > meta-games        = "master:fd67a9749f2fbbc9c4dd3a3f0dbe3125c8e7456a"
> > meta-virtualization = "krogoth:786a54c8cca6388247277573011e96986b23f528"
> > meta-xilinx       = "krogoth:dcd1c218f943c3657b138cb05012c90c65f32a35"
> >
> > NOTE: Fetching uninative binary shim from
> http://downloads.yoctoproject.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha256sum=acf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910f8
> > NOTE: Preparing RunQueue
> > NOTE: Executing SetScene Tasks
> > NOTE: Executing RunQueue Tasks
> > WARNING: libmpc-native-1.0.3-r0 do_fetch: Failed to fetch URL
> http://www.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz, attempting
> MIRRORS if available
> > WARNING: bzip2-1.0.6-r5 do_fetch: Checksum mismatch for local file
> /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz
> > Cleaning and trying again.
> > WARNING: bzip2-1.0.6-r5 do_fetch: Renaming
> /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz to
> /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz_bad-checksum_bb6639fad5666cfe31b46330395a3352
> > WARNING: bzip2-1.0.6-r5 do_fetch: Checksum failure encountered with
> download of http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz - will attempt
> other sources if available
> > WARNING: byacc-native-20150711-r0 do_fetch: Failed to fetch URL
> ftp://invisible-island.net/byacc/byacc-20150711.tgz, attempting MIRRORS
> if available
> > WARNING: shadow-native-4.2.1-r0 do_fetch: Failed to fetch URL
> http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz,
> attempting MIRRORS if available
> > WARNING: bash-completion-2.1-r0 do_fetch: Failed to fetch URL
> http://bash-completion.alioth.debian.org/files/bash-completion-2.1.tar.bz2,
> attempting MIRRORS if available
> > WARNING: libmikmod-3.3.6-r0 do_fetch: Failed to fetch URL
> http://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz,
> attempting MIRRORS if available
> > WARNING: python-setuptools-19.4-r0 do_fetch: Failed to fetch URL
> http://pypi.python.org/packages/source/s/setuptools/setuptools-19.4.tar.gz,
> attempting MIRRORS if available
> > WARNING: coreutils-8.25-r0 do_fetch: Failed to fetch URL
> http://distfiles.gentoo.org/distfiles/coreutils-8.25-man.tar.xz;name=manpages,
> attempting MIRRORS if available
> > ERROR: xen-4.11.0-r0 do_configure: QA Issue: xen: The LIC_FILES_CHKSUM
> does not match for file://COPYING;md5=a6260c12cd5de27e80d89ae18e48d20a
> > xen: The new md5 checksum is bbb4b1bdc2c3b6743da3c39d03249095
> > xen: Check if the license information has changed in
> /home/dux/xen/COPYING to verify that the LICENSE value "GPLv2" remains
> valid [license-checksum]
>
> Since you updated the recipe yourself, you'll also need to update the
> license checksum
> in that recipe.
>
> The original patch may have missed that, but the system is definitely
> telling you that it
> needs to be updated.
>
> Bruce
>
> > ERROR: xen-4.11.0-r0 do_configure: Fatal QA errors found, failing task.
> > ERROR: xen-4.11.0-r0 do_configure: Function failed: do_qa_configure
> > ERROR: Logfile of failure stored in:
> /home/dux/Xilinx/poky/build/tmp/work/aarch64-poky-linux/xen/4.11.0-r0/temp/log.do_configure.28618
> > ERROR: Task 255
> (/home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/
> xen_4.11.0.bb, do_configure) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 3137 tasks of which 9 didn't need to be
> rerun and 1 failed.
> > Waiting for 0 running tasks to finish:
> >
> > Summary: 1 task failed:
> >   /home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/
> xen_4.11.0.bb, do_configure
> > Summary: There were 11 WARNING messages shown.
> > Summary: There were 3 ERROR messages shown, returning a non-zero exit
> code.
> >
> > Any help would be greatly appreciated.
> > --
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

--00000000000090138505797d6830
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks Bruce</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Mon, Oct 29, 2018, 1:28 PM Bruce Ashfield &lt;<a href=3D"mailto=
:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Tue, Oct 23, 2018 at 5:36 PM Dan Regalad=
o &lt;<a href=3D"mailto:protect-me@macula.io" target=3D"_blank" rel=3D"nore=
ferrer">protect-me@macula.io</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi list,<br>
&gt;<br>
&gt; First off, thanks for your help.<br>
&gt; Previously I was able to compile Xen 4.10.0 using krogoth branch for X=
ilinx ZCU102 board and now I want to do the same but with version 4.11.0, u=
sing same branch so I added the .bb recipe based on below patch:<br>
&gt;<br>
&gt; <a href=3D"https://lists.yoctoproject.org/pipermail/meta-virtualizatio=
n/2018-July/003633.html" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://lists.yoctoproject.org/pipermail/meta-virtualization/2018-July/003633=
.html</a><br>
&gt;<br>
&gt; But it is failing as follows:<br>
&gt;<br>
&gt; I think, the first ERROR related to LIC_FILES_CHKSUM can be easily fix=
ed (I guess by putting the right hash in xen.inc)<br>
&gt;<br>
&gt; Loading cache: 100% |#################################################=
###########################################################################=
###########################################| ETA:=C2=A0 00:00:00<br>
&gt; Loaded 18 entries from dependency cache.<br>
&gt; Parsing recipes: 100% |###############################################=
###########################################################################=
###########################################| Time: 00:00:43<br>
&gt; Parsing of 1895 .bb files complete (17 cached, 1878 parsed). 2451 targ=
ets, 143 skipped, 0 masked, 0 errors.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.30.0&quot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot=
;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Ubuntu-16.04&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64-poky-linux&quo=
t;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;zcu102-zynqm=
p&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quot;<b=
r>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2.1.3&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>
&gt; meta<br>
&gt; meta-poky<br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;krogoth:444dc2e99b3c3967d9f83380=
c34bb99077a6ffa8&quot;<br>
&gt; meta-oe<br>
&gt; meta-filesystems<br>
&gt; meta-python<br>
&gt; meta-networking=C2=A0 =C2=A0=3D &quot;krogoth:55c8a76da5dc099a7bc38384=
95c672140cedb78e&quot;<br>
&gt; meta-games=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:fd67a9749f2fbbc=
9c4dd3a3f0dbe3125c8e7456a&quot;<br>
&gt; meta-virtualization =3D &quot;krogoth:786a54c8cca6388247277573011e9698=
6b23f528&quot;<br>
&gt; meta-xilinx=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;krogoth:dcd1c218f943c3=
657b138cb05012c90c65f32a35&quot;<br>
&gt;<br>
&gt; NOTE: Fetching uninative binary shim from <a href=3D"http://downloads.=
yoctoproject.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha=
256sum=3Dacf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910f8" =
rel=3D"noreferrer noreferrer" target=3D"_blank">http://downloads.yoctoproje=
ct.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha256sum=3Da=
cf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910f8</a><br>
&gt; NOTE: Preparing RunQueue<br>
&gt; NOTE: Executing SetScene Tasks<br>
&gt; NOTE: Executing RunQueue Tasks<br>
&gt; WARNING: libmpc-native-1.0.3-r0 do_fetch: Failed to fetch URL <a href=
=3D"http://www.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">http://www.multiprecision.org/mpc/dow=
nload/mpc-1.0.3.tar.gz</a>, attempting MIRRORS if available<br>
&gt; WARNING: bzip2-1.0.6-r5 do_fetch: Checksum mismatch for local file /ho=
me/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz<br>
&gt; Cleaning and trying again.<br>
&gt; WARNING: bzip2-1.0.6-r5 do_fetch: Renaming /home/dux/Xilinx/poky/build=
/downloads/bzip2-1.0.6.tar.gz to /home/dux/Xilinx/poky/build/downloads/bzip=
2-1.0.6.tar.gz_bad-checksum_bb6639fad5666cfe31b46330395a3352<br>
&gt; WARNING: bzip2-1.0.6-r5 do_fetch: Checksum failure encountered with do=
wnload of <a href=3D"http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">http://www.bzip.org/1.0.6/bzip2-1.0=
.6.tar.gz</a> - will attempt other sources if available<br>
&gt; WARNING: byacc-native-20150711-r0 do_fetch: Failed to fetch URL <a hre=
f=3D"ftp://invisible-island.net/byacc/byacc-20150711.tgz" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">ftp://invisible-island.net/byacc/byacc-20150=
711.tgz</a>, attempting MIRRORS if available<br>
&gt; WARNING: shadow-native-4.2.1-r0 do_fetch: Failed to fetch URL <a href=
=3D"http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://pkg-shadow.alioth.debia=
n.org/releases/shadow-4.2.1.tar.xz</a>, attempting MIRRORS if available<br>
&gt; WARNING: bash-completion-2.1-r0 do_fetch: Failed to fetch URL <a href=
=3D"http://bash-completion.alioth.debian.org/files/bash-completion-2.1.tar.=
bz2" rel=3D"noreferrer noreferrer" target=3D"_blank">http://bash-completion=
.alioth.debian.org/files/bash-completion-2.1.tar.bz2</a>, attempting MIRROR=
S if available<br>
&gt; WARNING: libmikmod-3.3.6-r0 do_fetch: Failed to fetch URL <a href=3D"h=
ttp://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.=
3.6.tar.gz" rel=3D"noreferrer noreferrer" target=3D"_blank">http://download=
s.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz</a>=
, attempting MIRRORS if available<br>
&gt; WARNING: python-setuptools-19.4-r0 do_fetch: Failed to fetch URL <a hr=
ef=3D"http://pypi.python.org/packages/source/s/setuptools/setuptools-19.4.t=
ar.gz" rel=3D"noreferrer noreferrer" target=3D"_blank">http://pypi.python.o=
rg/packages/source/s/setuptools/setuptools-19.4.tar.gz</a>, attempting MIRR=
ORS if available<br>
&gt; WARNING: coreutils-8.25-r0 do_fetch: Failed to fetch URL <a href=3D"ht=
tp://distfiles.gentoo.org/distfiles/coreutils-8.25-man.tar.xz;name=3Dmanpag=
es" rel=3D"noreferrer noreferrer" target=3D"_blank">http://distfiles.gentoo=
.org/distfiles/coreutils-8.25-man.tar.xz;name=3Dmanpages</a>, attempting MI=
RRORS if available<br>
&gt; ERROR: xen-4.11.0-r0 do_configure: QA Issue: xen: The LIC_FILES_CHKSUM=
 does not match for file://COPYING;md5=3Da6260c12cd5de27e80d89ae18e48d20a<b=
r>
&gt; xen: The new md5 checksum is bbb4b1bdc2c3b6743da3c39d03249095<br>
&gt; xen: Check if the license information has changed in /home/dux/xen/COP=
YING to verify that the LICENSE value &quot;GPLv2&quot; remains valid [lice=
nse-checksum]<br>
<br>
Since you updated the recipe yourself, you&#39;ll also need to update the<b=
r>
license checksum<br>
in that recipe.<br>
<br>
The original patch may have missed that, but the system is definitely<br>
telling you that it<br>
needs to be updated.<br>
<br>
Bruce<br>
<br>
&gt; ERROR: xen-4.11.0-r0 do_configure: Fatal QA errors found, failing task=
.<br>
&gt; ERROR: xen-4.11.0-r0 do_configure: Function failed: do_qa_configure<br=
>
&gt; ERROR: Logfile of failure stored in: /home/dux/Xilinx/poky/build/tmp/w=
ork/aarch64-poky-linux/xen/4.11.0-r0/temp/log.do_configure.28618<br>
&gt; ERROR: Task 255 (/home/dux/Xilinx/poky/meta-virtualization/recipes-ext=
ended/xen/<a href=3D"http://xen_4.11.0.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">xen_4.11.0.bb</a>, do_configure) failed with exit code &#39=
;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 3137 tasks of which 9 didn&#39;t need t=
o be rerun and 1 failed.<br>
&gt; Waiting for 0 running tasks to finish:<br>
&gt;<br>
&gt; Summary: 1 task failed:<br>
&gt;=C2=A0 =C2=A0/home/dux/Xilinx/poky/meta-virtualization/recipes-extended=
/xen/<a href=3D"http://xen_4.11.0.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">xen_4.11.0.bb</a>, do_configure<br>
&gt; Summary: There were 11 WARNING messages shown.<br>
&gt; Summary: There were 3 ERROR messages shown, returning a non-zero exit =
code.<br>
&gt;<br>
&gt; Any help would be greatly appreciated.<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk" rel=3D"noreferrer">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoprojec=
t.org/listinfo/meta-virtualization</a><br>
<br>
<br>
<br>
-- <br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</blockquote></div>

--00000000000090138505797d6830--
