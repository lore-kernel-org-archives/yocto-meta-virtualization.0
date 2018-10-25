Return-Path: <protect-me@macula.io>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5456E00994; Thu, 25 Oct 2018 10:58:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.221.175 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
	[209.85.221.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BAADE008E3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Oct 2018 10:58:06 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 22so1589145vkz.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Oct 2018 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=macula-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=NGY8QD5pA4JGh7JPiphnhjDoh2wku/a1ZYM8BxQJZU4=;
	b=W0OiDCViWbOVfUuX3lbF7HYalpdbKFal/pQHW2hjxyAwQ6ZeRAkzbBS7aPvVVrFRKG
	BsbFGLkMrePPDhoYiCi/Q2zAo0N8Ikx8CQoxhO7g7a5UI8fgv7dDHTXepKF9jlK4PY1s
	AK1osdCNPNRs83wluH+a6Nil8jYUfcFsXudqCwd7WB4kyV/CV+woInqiK5iS/mA7l7F0
	bghDln/yFxvY3eWSc8kfj/W0xW4zq4VeGQh4+mrLhJH1e5pzRUx1xopoyzyjNJ0TWW+C
	Rm39Fq3uBHOP4ewyHScCM7jT2zbsnHAOxjw83aymT4oFJqv88u9axa6PGh08GySudT1L
	7ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=NGY8QD5pA4JGh7JPiphnhjDoh2wku/a1ZYM8BxQJZU4=;
	b=f94MR7exFXQzusOZFDfvNKOfkTqPRrWTN3/Yu7ce+poVlmIoPwo0COAeVjAI2Z4Cjy
	h+KJGqA3q9GSQtieIEtfHG3pFbQfojnM9yn/zTfQSxd8pTFsO316Dspp2/k9mf9Vdwd3
	1NCUN3gyDwGGUz3kHHNXeAfCzvW/+j90sSZ0xE20vT7OSPSV/QZyd71MbY5lET9bpRBL
	kXUjQp6LRdR41jgfD/DHnwF+cLitMIeKdDTHWTBrksBvVk3HRu1jYv3n1Bc/AXZ0ktED
	OhkfE6QXXO0JNoXPbGYoclUfe+g+QBnMn5YKm5PQADJO69MOW78bPkK/s8H9EZ7/jLfb
	B/QQ==
X-Gm-Message-State: AGRZ1gJyz+ceoTNPX8U8sFYJf9l0TZSF6yyN+uYD/k9TK/Pr7zROqfPZ
	p4WNNLipe4RA508qdIQzM/3fBn7EWxCRm7CvKe1ARFIv
X-Google-Smtp-Source: AJdET5ewpwvgdD66t3h964x2Y+L30aimioOOQx9z6Qw7mKPycIYH3EqFMPkGoyq6CWvFaPS5eDKI2yNc9ec5uQKl8BY=
X-Received: by 2002:a1f:9016:: with SMTP id s22-v6mr125850vkd.28.1540490285148;
	Thu, 25 Oct 2018 10:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACJyUrFcBLUgCg0Hzx9vb7btuULWNqyzQ+jgJbRUhna9v_Vffw@mail.gmail.com>
In-Reply-To: <CACJyUrFcBLUgCg0Hzx9vb7btuULWNqyzQ+jgJbRUhna9v_Vffw@mail.gmail.com>
From: Dan Regalado <protect-me@macula.io>
Date: Thu, 25 Oct 2018 10:57:54 -0700
Message-ID: <CACJyUrGGgMF-kYr__2JcAkgJ8RDTSroF8MG-4Bega8h8akbT=A@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Thu, 25 Oct 2018 17:58:07 -0000
Content-Type: multipart/alternative; boundary="0000000000003a01330579115824"

--0000000000003a01330579115824
Content-Type: text/plain; charset="UTF-8"

Anyone here?

On Tue, Oct 23, 2018 at 2:36 PM Dan Regalado <protect-me@macula.io> wrote:

> Hi list,
>
> First off, thanks for your help.
> Previously I was able to compile Xen 4.10.0 using krogoth branch for
> Xilinx ZCU102 board and now I want to do the same but with version 4.11.0,
> using same branch so I added the .bb recipe based on below patch:
>
>
> https://lists.yoctoproject.org/pipermail/meta-virtualization/2018-July/003633.html
>
> But it is failing as follows:
>
> I think, the first ERROR related to LIC_FILES_CHKSUM can be easily fixed
> (I guess by putting the right hash in xen.inc)
>
> Loading cache: 100%
> |#######################################################################################################################################################################|
> ETA:  00:00:00
> Loaded 18 entries from dependency cache.
> Parsing recipes: 100%
> |#####################################################################################################################################################################|
> Time: 00:00:43
> Parsing of 1895 .bb files complete (17 cached, 1878 parsed). 2451 targets,
> 143 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        = "1.30.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-16.04"
> TARGET_SYS        = "aarch64-poky-linux"
> MACHINE           = "zcu102-zynqmp"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.1.3"
> TUNE_FEATURES     = "aarch64"
> TARGET_FPU        = ""
> meta
> meta-poky
> meta-yocto-bsp    = "krogoth:444dc2e99b3c3967d9f83380c34bb99077a6ffa8"
> meta-oe
> meta-filesystems
> meta-python
> meta-networking   = "krogoth:55c8a76da5dc099a7bc3838495c672140cedb78e"
> meta-games        = "master:fd67a9749f2fbbc9c4dd3a3f0dbe3125c8e7456a"
> meta-virtualization = "krogoth:786a54c8cca6388247277573011e96986b23f528"
> meta-xilinx       = "krogoth:dcd1c218f943c3657b138cb05012c90c65f32a35"
>
> NOTE: Fetching uninative binary shim from
> http://downloads.yoctoproject.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha256sum=acf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910f8
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: libmpc-native-1.0.3-r0 do_fetch: Failed to fetch URL
> http://www.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz, attempting
> MIRRORS if available
> WARNING: bzip2-1.0.6-r5 do_fetch: Checksum mismatch for local file
> /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz
> Cleaning and trying again.
> WARNING: bzip2-1.0.6-r5 do_fetch: Renaming
> /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz to
> /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz_bad-checksum_bb6639fad5666cfe31b46330395a3352
> WARNING: bzip2-1.0.6-r5 do_fetch: Checksum failure encountered with
> download of http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz - will attempt
> other sources if available
> WARNING: byacc-native-20150711-r0 do_fetch: Failed to fetch URL
> ftp://invisible-island.net/byacc/byacc-20150711.tgz, attempting MIRRORS
> if available
> WARNING: shadow-native-4.2.1-r0 do_fetch: Failed to fetch URL
> http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz,
> attempting MIRRORS if available
> WARNING: bash-completion-2.1-r0 do_fetch: Failed to fetch URL
> http://bash-completion.alioth.debian.org/files/bash-completion-2.1.tar.bz2,
> attempting MIRRORS if available
> WARNING: libmikmod-3.3.6-r0 do_fetch: Failed to fetch URL
> http://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz,
> attempting MIRRORS if available
> WARNING: python-setuptools-19.4-r0 do_fetch: Failed to fetch URL
> http://pypi.python.org/packages/source/s/setuptools/setuptools-19.4.tar.gz,
> attempting MIRRORS if available
> WARNING: coreutils-8.25-r0 do_fetch: Failed to fetch URL
> http://distfiles.gentoo.org/distfiles/coreutils-8.25-man.tar.xz;name=manpages,
> attempting MIRRORS if available
> ERROR: xen-4.11.0-r0 do_configure: QA Issue: xen: The LIC_FILES_CHKSUM
> does not match for file://COPYING;md5=a6260c12cd5de27e80d89ae18e48d20a
> xen: The new md5 checksum is bbb4b1bdc2c3b6743da3c39d03249095
> xen: Check if the license information has changed in /home/dux/xen/COPYING
> to verify that the LICENSE value "GPLv2" remains valid [license-checksum]
> ERROR: xen-4.11.0-r0 do_configure: Fatal QA errors found, failing task.
> ERROR: xen-4.11.0-r0 do_configure: Function failed: do_qa_configure
> ERROR: Logfile of failure stored in:
> /home/dux/Xilinx/poky/build/tmp/work/aarch64-poky-linux/xen/4.11.0-r0/temp/log.do_configure.28618
> ERROR: Task 255
> (/home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/
> xen_4.11.0.bb, do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3137 tasks of which 9 didn't need to be
> rerun and 1 failed.
> Waiting for 0 running tasks to finish:
>
> Summary: 1 task failed:
>   /home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/
> xen_4.11.0.bb, do_configure
> Summary: There were 11 WARNING messages shown.
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
>
> Any help would be greatly appreciated.
>

--0000000000003a01330579115824
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Anyone here?</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Tue, Oct 23, 2018 at 2:36 PM Dan Regalado &lt;<a href=3D"mailto=
:protect-me@macula.io">protect-me@macula.io</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">=
Hi list,<div><br></div><div>First off, thanks for your help.=C2=A0</div><di=
v>Previously I was able to compile Xen 4.10.0 using krogoth branch for Xili=
nx ZCU102 board and now I want to do the same but with version 4.11.0, usin=
g same branch so I added the .bb recipe based on below patch:</div><div><br=
></div><div><a href=3D"https://lists.yoctoproject.org/pipermail/meta-virtua=
lization/2018-July/003633.html" target=3D"_blank">https://lists.yoctoprojec=
t.org/pipermail/meta-virtualization/2018-July/003633.html</a></div><div><br=
></div><div>But it is failing as follows:</div><div><br></div><div>I think,=
 the first ERROR related to=C2=A0<span style=3D"background-color:rgb(255,25=
5,255)">LIC_FILES_CHKSUM can be easily fixed (I guess by putting the right =
hash in xen.inc)=C2=A0</span></div><div><br></div><div>Loading cache: 100% =
|##########################################################################=
###########################################################################=
##################| ETA:=C2=A0 00:00:00<br>Loaded 18 entries from dependenc=
y cache.<br>Parsing recipes: 100% |########################################=
###########################################################################=
##################################################| Time: 00:00:43<br>Parsi=
ng of 1895 .bb files complete (17 cached, 1878 parsed). 2451 targets, 143 s=
kipped, 0 masked, 0 errors.<br>NOTE: Resolving any missing task queue depen=
dencies<br><br>Build Configuration:<br>BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D &quot;1.30.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING=
=C2=A0=C2=A0 =3D &quot;Ubuntu-16.04&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;aarch64-poky-linux&quot;<br>MACHINE=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;zcu102-=
zynqmp&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =
=3D &quot;2.1.3&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;aa=
rch64&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &qu=
ot;&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-poky=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0<br>meta-yocto-bsp=C2=A0=C2=A0=C2=A0 =3D &quot;krogoth=
:444dc2e99b3c3967d9f83380c34bb99077a6ffa8&quot;<br>meta-oe=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-filesystems=C2=
=A0=C2=A0<br>meta-python=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-=
networking=C2=A0=C2=A0 =3D &quot;krogoth:55c8a76da5dc099a7bc3838495c672140c=
edb78e&quot;<br>meta-games=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &q=
uot;master:fd67a9749f2fbbc9c4dd3a3f0dbe3125c8e7456a&quot;<br>meta-virtualiz=
ation =3D &quot;krogoth:786a54c8cca6388247277573011e96986b23f528&quot;<br>m=
eta-xilinx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;krogoth:dcd1c218f9=
43c3657b138cb05012c90c65f32a35&quot;<br><br>NOTE: Fetching uninative binary=
 shim from=C2=A0<a href=3D"http://downloads.yoctoproject.org/releases/unina=
tive/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha256sum=3Dacf1e44a0ac2e855e81da6=
426197d36358bf7b4e88e552ef933128498c8910f8" target=3D"_blank">http://downlo=
ads.yoctoproject.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2=
;sha256sum=3Dacf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910=
f8</a><br>NOTE: Preparing RunQueue<br>NOTE: Executing SetScene Tasks<br>NOT=
E: Executing RunQueue Tasks<br>WARNING: libmpc-native-1.0.3-r0 do_fetch: Fa=
iled to fetch URL=C2=A0<a href=3D"http://www.multiprecision.org/mpc/downloa=
d/mpc-1.0.3.tar.gz" target=3D"_blank">http://www.multiprecision.org/mpc/dow=
nload/mpc-1.0.3.tar.gz</a>, attempting MIRRORS if available<br>WARNING: bzi=
p2-1.0.6-r5 do_fetch: Checksum mismatch for local file /home/dux/Xilinx/pok=
y/build/downloads/bzip2-1.0.6.tar.gz<br>Cleaning and trying again.<br>WARNI=
NG: bzip2-1.0.6-r5 do_fetch: Renaming /home/dux/Xilinx/poky/build/downloads=
/bzip2-1.0.6.tar.gz to /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.ta=
r.gz_bad-checksum_bb6639fad5666cfe31b46330395a3352<br>WARNING: bzip2-1.0.6-=
r5 do_fetch: Checksum failure encountered with download of=C2=A0<a href=3D"=
http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz" target=3D"_blank">http://www.=
bzip.org/1.0.6/bzip2-1.0.6.tar.gz</a>=C2=A0- will attempt other sources if =
available<br>WARNING: byacc-native-20150711-r0 do_fetch: Failed to fetch UR=
L=C2=A0<a href=3D"ftp://invisible-island.net/byacc/byacc-20150711.tgz" targ=
et=3D"_blank">ftp://invisible-island.net/byacc/byacc-20150711.tgz</a>, atte=
mpting MIRRORS if available<br>WARNING: shadow-native-4.2.1-r0 do_fetch: Fa=
iled to fetch URL=C2=A0<a href=3D"http://pkg-shadow.alioth.debian.org/relea=
ses/shadow-4.2.1.tar.xz" target=3D"_blank">http://pkg-shadow.alioth.debian.=
org/releases/shadow-4.2.1.tar.xz</a>, attempting MIRRORS if available<br>WA=
RNING: bash-completion-2.1-r0 do_fetch: Failed to fetch URL=C2=A0<a href=3D=
"http://bash-completion.alioth.debian.org/files/bash-completion-2.1.tar.bz2=
" target=3D"_blank">http://bash-completion.alioth.debian.org/files/bash-com=
pletion-2.1.tar.bz2</a>, attempting MIRRORS if available<br>WARNING: libmik=
mod-3.3.6-r0 do_fetch: Failed to fetch URL=C2=A0<a href=3D"http://downloads=
.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz" tar=
get=3D"_blank">http://downloads.sourceforge.net/project/mikmod/libmikmod/3.=
3.6/libmikmod-3.3.6.tar.gz</a>, attempting MIRRORS if available<br>WARNING:=
 python-setuptools-19.4-r0 do_fetch: Failed to fetch URL=C2=A0<a href=3D"ht=
tp://pypi.python.org/packages/source/s/setuptools/setuptools-19.4.tar.gz" t=
arget=3D"_blank">http://pypi.python.org/packages/source/s/setuptools/setupt=
ools-19.4.tar.gz</a>, attempting MIRRORS if available<br>WARNING: coreutils=
-8.25-r0 do_fetch: Failed to fetch URL=C2=A0<a href=3D"http://distfiles.gen=
too.org/distfiles/coreutils-8.25-man.tar.xz;name=3Dmanpages" target=3D"_bla=
nk">http://distfiles.gentoo.org/distfiles/coreutils-8.25-man.tar.xz;name=3D=
manpages</a>, attempting MIRRORS if available<br><span style=3D"background-=
color:rgb(255,255,0)">ERROR: xen-4.11.0-r0 do_configure: QA Issue: xen: The=
 LIC_FILES_CHKSUM does not match for file://COPYING;md5=3Da6260c12cd5de27e8=
0d89ae18e48d20a</span><br>xen: The new md5 checksum is bbb4b1bdc2c3b6743da3=
c39d03249095<br>xen: Check if the license information has changed in /home/=
dux/xen/COPYING to verify that the LICENSE value &quot;GPLv2&quot; remains =
valid [license-checksum]<br><span style=3D"background-color:rgb(255,255,0)"=
>ERROR: xen-4.11.0-r0 do_configure: Fatal QA errors found, failing task.<br=
>ERROR: xen-4.11.0-r0 do_configure: Function failed: do_qa_configure<br>ERR=
OR: Logfile of failure stored in: /home/dux/Xilinx/poky/build/tmp/work/aarc=
h64-poky-linux/xen/4.11.0-r0/temp/log.do_configure.28618<br>ERROR: Task 255=
 (/home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/<a href=3D=
"http://xen_4.11.0.bb/" target=3D"_blank">xen_4.11.0.bb</a>, do_configure) =
failed with exit code &#39;1&#39;</span><br>NOTE: Tasks Summary: Attempted =
3137 tasks of which 9 didn&#39;t need to be rerun and 1 failed.<br>Waiting =
for 0 running tasks to finish:<br><br>Summary: 1 task failed:<br>=C2=A0 /ho=
me/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/<a href=3D"http=
://xen_4.11.0.bb/" target=3D"_blank">xen_4.11.0.bb</a>, do_configure<br>Sum=
mary: There were 11 WARNING messages shown.<br>Summary: There were 3 ERROR =
messages shown, returning a non-zero exit code.<br></div><div><br></div><di=
v>Any help would be greatly appreciated.</div></div></div></div>
</blockquote></div>

--0000000000003a01330579115824--
