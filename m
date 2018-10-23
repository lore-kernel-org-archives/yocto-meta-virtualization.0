Return-Path: <protect-me@macula.io>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 348D0E00901; Tue, 23 Oct 2018 14:36:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.41 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
	[209.85.217.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1F12E008D7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Oct 2018 14:36:37 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id c205so1866079vsd.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Oct 2018 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=macula-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=WQL61TI7jXgqszV3mhRTsOToIY0jGC4Zh2y4ndUXlfw=;
	b=x/jrxZSLcSx+fjsCg8tXMvogQK7Ns8Sa8mMG4ggU6tRm9MrYAANJFoIcjffCuVtbTl
	0UBTamOJ9zZxPDAEXxgBX5gCDHki3zSWPPe0e81wcfFCXbUcbJiFADRNColr2/kVAJXh
	4WrsaO1HXkM/FcHWgsSalYS6p6ownA8mn+t4KtXll0pLCvKYOt95aUAkgT0cFDI7w3Tb
	K5wvoHS4MMD2G9LA5nuIRTyRxmdZqoLwlbLyf8HvfXyV8Ybn3Pqsni0Ma5EKSU5FdBek
	WmKkYz81gky0bcldCjygsfDSKWkgo6bBfbxbKov4DSQIcJMEMglTlMvrch8KFNGrstF0
	b7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=WQL61TI7jXgqszV3mhRTsOToIY0jGC4Zh2y4ndUXlfw=;
	b=Ia2ko50poRffyETIflTnt6Y9K66hg1jyLNe98bIDJCMpRHPbt5ThLAvYMJwxwaWBP0
	WsLleIzyxdFeS33jtOOiJkc0bc4Rm1G8iXAEFGbx8vEz3jULHY9euzBndxX0yPBBVMM4
	jIkhgk1VNvwFykvpI4MN5bZJ3Ije8QgLTIAudckmbsAY/cIDIn6lACxz3Mz4JWWomnpT
	dAkl2LtB/NVc9aouMhCzB0PcWVXyqlApkjuEF8Rs8Am3KamyJwxtMaOOHUchM1Z5Vi7/
	8Q6mND+lflmrTyPaFjm7riTM7JRKXAXaDvLpdl+4sSaDT76SirJ2JD6/PmS8RFX1HKu/
	J45g==
X-Gm-Message-State: ABuFfogw0KLOTU3H6o92uxkCgOy7IKMpkPX6CySpiGS9Wj+x27ktPdCG
	KkPmBbPwjhG/0S0bFgCf5n7fw8qF6vgKQwHkAJ1A6D3eOxk=
X-Google-Smtp-Source: ACcGV62w3zk5ASbK3HjmpLAQqHKTbrfa3L5Wf5LPc1GybBicrj927hWhIx8XtHqj7lzxaxmg1SXanLu6DFGaoMbvvvk=
X-Received: by 2002:a67:2cd0:: with SMTP id
	s199mr21462457vss.117.1540330596518; 
	Tue, 23 Oct 2018 14:36:36 -0700 (PDT)
MIME-Version: 1.0
From: Dan Regalado <protect-me@macula.io>
Date: Tue, 23 Oct 2018 14:36:25 -0700
Message-ID: <CACJyUrFcBLUgCg0Hzx9vb7btuULWNqyzQ+jgJbRUhna9v_Vffw@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Failed to compile Xen 4.11.0 in krogoth branch
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
X-List-Received-Date: Tue, 23 Oct 2018 21:36:39 -0000
Content-Type: multipart/alternative; boundary="0000000000000ae67c0578ec2a52"

--0000000000000ae67c0578ec2a52
Content-Type: text/plain; charset="UTF-8"

Hi list,

First off, thanks for your help.
Previously I was able to compile Xen 4.10.0 using krogoth branch for Xilinx
ZCU102 board and now I want to do the same but with version 4.11.0, using
same branch so I added the .bb recipe based on below patch:

https://lists.yoctoproject.org/pipermail/meta-virtualization/2018-July/003633.html

But it is failing as follows:

I think, the first ERROR related to LIC_FILES_CHKSUM can be easily fixed (I
guess by putting the right hash in xen.inc)

Loading cache: 100%
|#######################################################################################################################################################################|
ETA:  00:00:00
Loaded 18 entries from dependency cache.
Parsing recipes: 100%
|#####################################################################################################################################################################|
Time: 00:00:43
Parsing of 1895 .bb files complete (17 cached, 1878 parsed). 2451 targets,
143 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.30.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-16.04"
TARGET_SYS        = "aarch64-poky-linux"
MACHINE           = "zcu102-zynqmp"
DISTRO            = "poky"
DISTRO_VERSION    = "2.1.3"
TUNE_FEATURES     = "aarch64"
TARGET_FPU        = ""
meta
meta-poky
meta-yocto-bsp    = "krogoth:444dc2e99b3c3967d9f83380c34bb99077a6ffa8"
meta-oe
meta-filesystems
meta-python
meta-networking   = "krogoth:55c8a76da5dc099a7bc3838495c672140cedb78e"
meta-games        = "master:fd67a9749f2fbbc9c4dd3a3f0dbe3125c8e7456a"
meta-virtualization = "krogoth:786a54c8cca6388247277573011e96986b23f528"
meta-xilinx       = "krogoth:dcd1c218f943c3657b138cb05012c90c65f32a35"

NOTE: Fetching uninative binary shim from
http://downloads.yoctoproject.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha256sum=acf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910f8
NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: libmpc-native-1.0.3-r0 do_fetch: Failed to fetch URL
http://www.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz, attempting
MIRRORS if available
WARNING: bzip2-1.0.6-r5 do_fetch: Checksum mismatch for local file
/home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz
Cleaning and trying again.
WARNING: bzip2-1.0.6-r5 do_fetch: Renaming
/home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz to
/home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz_bad-checksum_bb6639fad5666cfe31b46330395a3352
WARNING: bzip2-1.0.6-r5 do_fetch: Checksum failure encountered with
download of http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz - will attempt
other sources if available
WARNING: byacc-native-20150711-r0 do_fetch: Failed to fetch URL
ftp://invisible-island.net/byacc/byacc-20150711.tgz, attempting MIRRORS if
available
WARNING: shadow-native-4.2.1-r0 do_fetch: Failed to fetch URL
http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz,
attempting MIRRORS if available
WARNING: bash-completion-2.1-r0 do_fetch: Failed to fetch URL
http://bash-completion.alioth.debian.org/files/bash-completion-2.1.tar.bz2,
attempting MIRRORS if available
WARNING: libmikmod-3.3.6-r0 do_fetch: Failed to fetch URL
http://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz,
attempting MIRRORS if available
WARNING: python-setuptools-19.4-r0 do_fetch: Failed to fetch URL
http://pypi.python.org/packages/source/s/setuptools/setuptools-19.4.tar.gz,
attempting MIRRORS if available
WARNING: coreutils-8.25-r0 do_fetch: Failed to fetch URL
http://distfiles.gentoo.org/distfiles/coreutils-8.25-man.tar.xz;name=manpages,
attempting MIRRORS if available
ERROR: xen-4.11.0-r0 do_configure: QA Issue: xen: The LIC_FILES_CHKSUM does
not match for file://COPYING;md5=a6260c12cd5de27e80d89ae18e48d20a
xen: The new md5 checksum is bbb4b1bdc2c3b6743da3c39d03249095
xen: Check if the license information has changed in /home/dux/xen/COPYING
to verify that the LICENSE value "GPLv2" remains valid [license-checksum]
ERROR: xen-4.11.0-r0 do_configure: Fatal QA errors found, failing task.
ERROR: xen-4.11.0-r0 do_configure: Function failed: do_qa_configure
ERROR: Logfile of failure stored in:
/home/dux/Xilinx/poky/build/tmp/work/aarch64-poky-linux/xen/4.11.0-r0/temp/log.do_configure.28618
ERROR: Task 255
(/home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/
xen_4.11.0.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3137 tasks of which 9 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/
xen_4.11.0.bb, do_configure
Summary: There were 11 WARNING messages shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.

Any help would be greatly appreciated.

--0000000000000ae67c0578ec2a52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi list,<div><br></div><=
div>First off, thanks for your help.=C2=A0</div><div>Previously I was able =
to compile Xen 4.10.0 using krogoth branch for Xilinx ZCU102 board and now =
I want to do the same but with version 4.11.0, using same branch so I added=
 the .bb recipe based on below patch:</div><div><br></div><div><a href=3D"h=
ttps://lists.yoctoproject.org/pipermail/meta-virtualization/2018-July/00363=
3.html">https://lists.yoctoproject.org/pipermail/meta-virtualization/2018-J=
uly/003633.html</a></div><div><br></div><div>But it is failing as follows:<=
/div><div><br></div><div>I think, the first ERROR related to=C2=A0<span sty=
le=3D"background-color:rgb(255,255,255)">LIC_FILES_CHKSUM can be easily fix=
ed (I guess by putting the right hash in xen.inc)=C2=A0</span></div><div><b=
r></div><div>Loading cache: 100% |#########################################=
###########################################################################=
###################################################| ETA:=C2=A0 00:00:00<br=
>Loaded 18 entries from dependency cache.<br>Parsing recipes: 100% |#######=
###########################################################################=
###########################################################################=
########| Time: 00:00:43<br>Parsing of 1895 .bb files complete (17 cached, =
1878 parsed). 2451 targets, 143 skipped, 0 masked, 0 errors.<br>NOTE: Resol=
ving any missing task queue dependencies<br><br>Build Configuration:<br>BB_=
VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.30.0&quot;<br=
>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64=
-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0 =3D &quot;Ubuntu-16.04&quot;<br=
>TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;aarch64-pok=
y-linux&quot;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;zcu102-zynqmp&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>DISTRO_V=
ERSION=C2=A0=C2=A0=C2=A0 =3D &quot;2.1.3&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;aarch64&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D &quot;&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-poky=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>meta-yocto-bsp=C2=A0=C2=
=A0=C2=A0 =3D &quot;krogoth:444dc2e99b3c3967d9f83380c34bb99077a6ffa8&quot;<=
br>meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<br>meta-filesystems=C2=A0=C2=A0<br>meta-python=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<br>meta-networking=C2=A0=C2=A0 =3D &quot;krogoth:55c8a76=
da5dc099a7bc3838495c672140cedb78e&quot;<br>meta-games=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:fd67a9749f2fbbc9c4dd3a3f0dbe3125c8e7=
456a&quot;<br>meta-virtualization =3D &quot;krogoth:786a54c8cca638824727757=
3011e96986b23f528&quot;<br>meta-xilinx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;krogoth:dcd1c218f943c3657b138cb05012c90c65f32a35&quot;<br><br>NOT=
E: Fetching uninative binary shim from=C2=A0<a href=3D"http://downloads.yoc=
toproject.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha256=
sum=3Dacf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910f8" tar=
get=3D"_blank">http://downloads.yoctoproject.org/releases/uninative/1.0.1/x=
86_64-nativesdk-libc.tar.bz2;sha256sum=3Dacf1e44a0ac2e855e81da6426197d36358=
bf7b4e88e552ef933128498c8910f8</a><br>NOTE: Preparing RunQueue<br>NOTE: Exe=
cuting SetScene Tasks<br>NOTE: Executing RunQueue Tasks<br>WARNING: libmpc-=
native-1.0.3-r0 do_fetch: Failed to fetch URL=C2=A0<a href=3D"http://www.mu=
ltiprecision.org/mpc/download/mpc-1.0.3.tar.gz" target=3D"_blank">http://ww=
w.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz</a>, attempting MIRRORS =
if available<br>WARNING: bzip2-1.0.6-r5 do_fetch: Checksum mismatch for loc=
al file /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz<br>Cleanin=
g and trying again.<br>WARNING: bzip2-1.0.6-r5 do_fetch: Renaming /home/dux=
/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz to /home/dux/Xilinx/poky/bu=
ild/downloads/bzip2-1.0.6.tar.gz_bad-checksum_bb6639fad5666cfe31b46330395a3=
352<br>WARNING: bzip2-1.0.6-r5 do_fetch: Checksum failure encountered with =
download of=C2=A0<a href=3D"http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz" t=
arget=3D"_blank">http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz</a>=C2=A0- wi=
ll attempt other sources if available<br>WARNING: byacc-native-20150711-r0 =
do_fetch: Failed to fetch URL=C2=A0<a href=3D"ftp://invisible-island.net/by=
acc/byacc-20150711.tgz" target=3D"_blank">ftp://invisible-island.net/byacc/=
byacc-20150711.tgz</a>, attempting MIRRORS if available<br>WARNING: shadow-=
native-4.2.1-r0 do_fetch: Failed to fetch URL=C2=A0<a href=3D"http://pkg-sh=
adow.alioth.debian.org/releases/shadow-4.2.1.tar.xz" target=3D"_blank">http=
://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz</a>, attemptin=
g MIRRORS if available<br>WARNING: bash-completion-2.1-r0 do_fetch: Failed =
to fetch URL=C2=A0<a href=3D"http://bash-completion.alioth.debian.org/files=
/bash-completion-2.1.tar.bz2" target=3D"_blank">http://bash-completion.alio=
th.debian.org/files/bash-completion-2.1.tar.bz2</a>, attempting MIRRORS if =
available<br>WARNING: libmikmod-3.3.6-r0 do_fetch: Failed to fetch URL=C2=
=A0<a href=3D"http://downloads.sourceforge.net/project/mikmod/libmikmod/3.3=
.6/libmikmod-3.3.6.tar.gz" target=3D"_blank">http://downloads.sourceforge.n=
et/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz</a>, attempting MI=
RRORS if available<br>WARNING: python-setuptools-19.4-r0 do_fetch: Failed t=
o fetch URL=C2=A0<a href=3D"http://pypi.python.org/packages/source/s/setupt=
ools/setuptools-19.4.tar.gz" target=3D"_blank">http://pypi.python.org/packa=
ges/source/s/setuptools/setuptools-19.4.tar.gz</a>, attempting MIRRORS if a=
vailable<br>WARNING: coreutils-8.25-r0 do_fetch: Failed to fetch URL=C2=A0<=
a href=3D"http://distfiles.gentoo.org/distfiles/coreutils-8.25-man.tar.xz;n=
ame=3Dmanpages" target=3D"_blank">http://distfiles.gentoo.org/distfiles/cor=
eutils-8.25-man.tar.xz;name=3Dmanpages</a>, attempting MIRRORS if available=
<br><span style=3D"background-color:rgb(255,255,0)">ERROR: xen-4.11.0-r0 do=
_configure: QA Issue: xen: The LIC_FILES_CHKSUM does not match for file://C=
OPYING;md5=3Da6260c12cd5de27e80d89ae18e48d20a</span><br>xen: The new md5 ch=
ecksum is bbb4b1bdc2c3b6743da3c39d03249095<br>xen: Check if the license inf=
ormation has changed in /home/dux/xen/COPYING to verify that the LICENSE va=
lue &quot;GPLv2&quot; remains valid [license-checksum]<br><span style=3D"ba=
ckground-color:rgb(255,255,0)">ERROR: xen-4.11.0-r0 do_configure: Fatal QA =
errors found, failing task.<br>ERROR: xen-4.11.0-r0 do_configure: Function =
failed: do_qa_configure<br>ERROR: Logfile of failure stored in: /home/dux/X=
ilinx/poky/build/tmp/work/aarch64-poky-linux/xen/4.11.0-r0/temp/log.do_conf=
igure.28618<br>ERROR: Task 255 (/home/dux/Xilinx/poky/meta-virtualization/r=
ecipes-extended/xen/<a href=3D"http://xen_4.11.0.bb/" target=3D"_blank">xen=
_4.11.0.bb</a>, do_configure) failed with exit code &#39;1&#39;</span><br>N=
OTE: Tasks Summary: Attempted 3137 tasks of which 9 didn&#39;t need to be r=
erun and 1 failed.<br>Waiting for 0 running tasks to finish:<br><br>Summary=
: 1 task failed:<br>=C2=A0 /home/dux/Xilinx/poky/meta-virtualization/recipe=
s-extended/xen/<a href=3D"http://xen_4.11.0.bb/" target=3D"_blank">xen_4.11=
.0.bb</a>, do_configure<br>Summary: There were 11 WARNING messages shown.<b=
r>Summary: There were 3 ERROR messages shown, returning a non-zero exit cod=
e.<br></div><div><br></div><div>Any help would be greatly appreciated.</div=
></div></div></div>

--0000000000000ae67c0578ec2a52--
