Return-Path: <bambalakkat@gmail.com>
Received: from mail-bk0-f43.google.com (mail-bk0-f43.google.com
	[209.85.214.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59EB8E006BC
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Dec 2013 16:18:58 -0800 (PST)
Received: by mail-bk0-f43.google.com with SMTP id mz12so5682578bkb.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Dec 2013 16:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=tcOSZ2h/ztmXCFyUYlwuhl48bAVtStxC2hPSavV4TMY=;
	b=ZqEYMDxuTiGOp9roEdIA6TUHbM+7bT76Dn15J1VgmrAPzT8hKj5lmn2pyFYeWIJtvH
	B8x5P/CIn/Rc+LZPfhsR3RPlSqRqSNyd2eIB3hy4iK21GreQVwB4WkqBs0XSEJYZ0EE2
	Z9RI5ApTB6Bf9hGQWo/t2osfVpA0c84ypI+XffeNagq/1YB84WlGzhDVCSdcqYLPaV8x
	cwGFNGpsBjU7wZV+lQ82Ucp4yJPZA6nGClsKdUaVrccrAn0K/nU6YeRWo7vBuz4wxNNX
	DrU5ksIq+jNaw2QPJyiobvPWx7UgVI45Hpe278W9gzF4ZX+zUuV06JVtHr0DPhV21spI
	ABnA==
MIME-Version: 1.0
X-Received: by 10.205.17.70 with SMTP id qb6mr46632bkb.97.1386029936937; Mon,
	02 Dec 2013 16:18:56 -0800 (PST)
Received: by 10.204.225.207 with HTTP; Mon, 2 Dec 2013 16:18:56 -0800 (PST)
Date: Mon, 2 Dec 2013 16:18:56 -0800
Message-ID: <CAHb3sCc6B_S=AdzWCwUE62W+RqmY7GB=zkcCxHA7CG6HV6=VTw@mail.gmail.com>
From: balagopal ambalakkat <bambalakkat@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: ERROR while building kvm-minimal-image: xg_main.c:221:52: error: 'ulong' undeclared (first use in this function)
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
X-List-Received-Date: Tue, 03 Dec 2013 00:19:01 -0000
Content-Type: multipart/alternative; boundary=20cf302074260a3f9004ec963e14

--20cf302074260a3f9004ec963e14
Content-Type: text/plain; charset=ISO-8859-1

Hello

While building kvm-minimal-image . I encountered the following error
(detail below)

xg_main.c: In function '_check_hyp':
| xg_main.c:221:52: error: 'ulong' undeclared (first use in this function)

- fixed by replacing "*ulong"* with "*unsigned long" *to fix the issue in
the specified file in
working /home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work/x86_64-poky-linux/xen/4.1.2-r1/xen-4.1.2/
directory.

Not sure if this is already fixed.  just sending



*==*
Build Configuration:
BB_VERSION        = "1.18.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "crystalforest-gladden"
DISTRO            = "poky"
DISTRO_VERSION    = "1.4.2"
TUNE_FEATURES     = "m64"
TARGET_FPU        = ""
meta
meta-yocto        = "dylan:4e399f08d596197859214fdb3b06403b87bf8789"
meta-intel        = "dylan:86525216c6b8bdb850bf01958fe4defae3b42f4a"
meta-oe
meta-networking   = "dylan:44754206632dd5b0725aeb43e99e4ff9e0245dca"
meta-virtualization = "dylan:15a0d3432ea8d4441417b689a58aae8a6a7fb860"
meta-crystalforest-gladden =
"dylan:4e399f08d596197859214fdb3b06403b87bf8789"

### ERROR while building kvm-minimal-image

|
-I/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/sysroots/crystalforest-gladden/include
-D__XEN_TOOLS__ -MMD -MF .subdirs-install.d  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE  -O2 -fomit-frame-pointer -m64 -fno-strict-aliasing
-std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-value
-Wdeclaration-after-statement -Wno-unused-but-set-variable
 -I/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/sysroots/crystalforest-gladden/include
-D__XEN_TOOLS__ -MMD -MF .gdbsx.d  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE  -O2 -fomit-frame-pointer -m64 -fno-strict-aliasing
-std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-value
-Wdeclaration-after-statement -Wno-unused-but-set-variable
 -I/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/sysroots/crystalforest-gladden/include
-D__XEN_TOOLS__ -MMD -MF .all.d  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 -Wmissing-prototypes  -O2 -fomit-frame-pointer -m64 -fno-strict-aliasing
-std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-value
-Wdeclaration-after-statement -Wno-unused-but-set-variable
 -I/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/sysroots/crystalforest-gladden/include
-D__XEN_TOOLS__ -MMD -MF .xg_main.o.d  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE  -Wmissing-prototypes   -I. -I../../../include  -c -o
xg_main.o xg_main.c
| xg_main.c: In function '_domctl_hcall':
| xg_main.c:181:52: error: 'ulong' undeclared (first use in this function)
| xg_main.c:181:52: note: each undeclared identifier is reported only once
for each function it appears in
| xg_main.c: In function '_check_hyp':
| xg_main.c:221:52: error: 'ulong' undeclared (first use in this function)
| make[4]: *** [xg_main.o] Error 1
| make[4]: Leaving directory
`/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work/x86_64-poky-linux/xen/4.1.2-r1/xen-4.1.2/tools/debugger/gdbsx/xg'
| make[3]: *** [all] Error 2
| make[3]: Leaving directory
`/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work/x86_64-poky-linux/xen/4.1.2-r1/xen-4.1.2/tools/debugger/gdbsx'
| make[2]: *** [subdir-install-debugger/gdbsx] Error 2
| make[2]: Leaving directory
`/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work/x86_64-poky-linux/xen/4.1.2-r1/xen-4.1.2/tools'
| make[1]: *** [subdirs-install] Error 2
| make[1]: Leaving directory
`/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work/x86_64-poky-linux/xen/4.1.2-r1/xen-4.1.2/tools'
| make: *** [install-tools] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see
/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work/x86_64-poky-linux/xen/4.1.2-r1/temp/log.do_compile.9770
for further information)
ERROR: Task 1415
(/home/ambalakkat/projects/yocto/git/poky/meta-virtualization/recipes-extended/xen/
xen_4.1.2.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1995 tasks of which 293 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:

/home/ambalakkat/projects/yocto/git/poky/meta-virtualization/recipes-extended/xen/
xen_4.1.2.bb, do_compile
Summary: There were 10 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


-- 
*Balagopal* *Ambalakkat*

--20cf302074260a3f9004ec963e14
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello</div><div><br></div><div>While building kv=
m-minimal-image . I encountered the following error (detail below)</div><di=
v><br></div><div><div><div>xg_main.c: In function &#39;_check_hyp&#39;:</di=
v>
<div>| xg_main.c:221:52: error: &#39;ulong&#39; undeclared (first use in th=
is function)</div><div><br></div></div></div><div><div>- fixed by replacing=
 &quot;<b>ulong&quot;</b>=A0with &quot;<b>unsigned long&quot; </b>to fix th=
e issue in the specified file in</div>
<div>working=A0/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work=
/x86_64-poky-linux/xen/4.1.2-r1/xen-4.1.2/ directory.</div></div><div><br><=
/div><div>Not sure if this is already fixed. =A0just sending</div><div><br>
</div><div><br></div></div><div><br></div><div><b>=3D=3D</b></div><div><div=
>Build Configuration:</div><div>BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.18.0&=
quot;</div><div>BUILD_SYS =A0 =A0 =A0 =A0 =3D &quot;x86_64-linux&quot;</div=
><div>NATIVELSBSTRING =A0 =3D &quot;Ubuntu-12.04&quot;</div>
<div>TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;x86_64-poky-linux&quot;</div><div>=
MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;crystalforest-gladden&quot;</div><div=
>DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;</div><div>DISTRO_VERSIO=
N =A0 =A0=3D &quot;1.4.2&quot;</div><div>
TUNE_FEATURES =A0 =A0 =3D &quot;m64&quot;</div><div>TARGET_FPU =A0 =A0 =A0 =
=A0=3D &quot;&quot;</div><div>meta =A0 =A0 =A0 =A0 =A0 =A0 =A0</div><div>me=
ta-yocto =A0 =A0 =A0 =A0=3D &quot;dylan:4e399f08d596197859214fdb3b06403b87b=
f8789&quot;</div><div>meta-intel =A0 =A0 =A0 =A0=3D &quot;dylan:86525216c6b=
8bdb850bf01958fe4defae3b42f4a&quot;</div>
<div>meta-oe =A0 =A0 =A0 =A0 =A0=A0</div><div>meta-networking =A0 =3D &quot=
;dylan:44754206632dd5b0725aeb43e99e4ff9e0245dca&quot;</div><div>meta-virtua=
lization =3D &quot;dylan:15a0d3432ea8d4441417b689a58aae8a6a7fb860&quot;</di=
v><div>meta-crystalforest-gladden =3D &quot;dylan:4e399f08d596197859214fdb3=
b06403b87bf8789&quot;</div>
</div><div><br></div>
<div>### ERROR while building kvm-minimal-image</div><div><br></div><div>| =
-I/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/sysroots/crystalf=
orest-gladden/include -D__XEN_TOOLS__ -MMD -MF .subdirs-install.d =A0-D_LAR=
GEFILE_SOURCE -D_LARGEFILE64_SOURCE =A0-O2 -fomit-frame-pointer -m64 -fno-s=
trict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wno-unused-value -Wd=
eclaration-after-statement -Wno-unused-but-set-variable =A0-I/home/ambalakk=
at/projects/yocto/git/poky/opus-build/tmp/sysroots/crystalforest-gladden/in=
clude -D__XEN_TOOLS__ -MMD -MF .gdbsx.d =A0-D_LARGEFILE_SOURCE -D_LARGEFILE=
64_SOURCE =A0-O2 -fomit-frame-pointer -m64 -fno-strict-aliasing -std=3Dgnu9=
9 -Wall -Wstrict-prototypes -Wno-unused-value -Wdeclaration-after-statement=
 -Wno-unused-but-set-variable =A0-I/home/ambalakkat/projects/yocto/git/poky=
/opus-build/tmp/sysroots/crystalforest-gladden/include -D__XEN_TOOLS__ -MMD=
 -MF .all.d =A0-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =A0-Wmissing-proto=
types =A0-O2 -fomit-frame-pointer -m64 -fno-strict-aliasing -std=3Dgnu99 -W=
all -Wstrict-prototypes -Wno-unused-value -Wdeclaration-after-statement -Wn=
o-unused-but-set-variable =A0-I/home/ambalakkat/projects/yocto/git/poky/opu=
s-build/tmp/sysroots/crystalforest-gladden/include -D__XEN_TOOLS__ -MMD -MF=
 .xg_main.o.d =A0-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =A0-Wmissing-pro=
totypes =A0 -I. -I../../../include =A0-c -o xg_main.o xg_main.c</div>

<div>| xg_main.c: In function &#39;_domctl_hcall&#39;:</div><div>| xg_main.=
c:181:52: error: &#39;ulong&#39; undeclared (first use in this function)</d=
iv><div>| xg_main.c:181:52: note: each undeclared identifier is reported on=
ly once for each function it appears in</div>

<div>| xg_main.c: In function &#39;_check_hyp&#39;:</div><div>| xg_main.c:2=
21:52: error: &#39;ulong&#39; undeclared (first use in this function)</div>=
<div>| make[4]: *** [xg_main.o] Error 1</div><div>| make[4]: Leaving direct=
ory `/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work/x86_64-po=
ky-linux/xen/4.1.2-r1/xen-4.1.2/tools/debugger/gdbsx/xg&#39;</div>

<div>| make[3]: *** [all] Error 2</div><div>| make[3]: Leaving directory `/=
home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work/x86_64-poky-lin=
ux/xen/4.1.2-r1/xen-4.1.2/tools/debugger/gdbsx&#39;</div><div>| make[2]: **=
* [subdir-install-debugger/gdbsx] Error 2</div>

<div>| make[2]: Leaving directory `/home/ambalakkat/projects/yocto/git/poky=
/opus-build/tmp/work/x86_64-poky-linux/xen/4.1.2-r1/xen-4.1.2/tools&#39;</d=
iv><div>| make[1]: *** [subdirs-install] Error 2</div><div>| make[1]: Leavi=
ng directory `/home/ambalakkat/projects/yocto/git/poky/opus-build/tmp/work/=
x86_64-poky-linux/xen/4.1.2-r1/xen-4.1.2/tools&#39;</div>

<div>| make: *** [install-tools] Error 2</div><div>| ERROR: oe_runmake fail=
ed</div><div>| ERROR: Function failed: do_compile (see /home/ambalakkat/pro=
jects/yocto/git/poky/opus-build/tmp/work/x86_64-poky-linux/xen/4.1.2-r1/tem=
p/log.do_compile.9770 for further information)</div>

<div>ERROR: Task 1415 (/home/ambalakkat/projects/yocto/git/poky/meta-virtua=
lization/recipes-extended/xen/<a href=3D"http://xen_4.1.2.bb" target=3D"_bl=
ank">xen_4.1.2.bb</a>, do_compile) failed with exit code &#39;1&#39;</div>
<div>NOTE: Tasks Summary: Attempted 1995 tasks of which 293 didn&#39;t need=
 to be rerun and 1 failed.</div>
<div>Waiting for 0 running tasks to finish:</div><div><br></div><div>Summar=
y: 1 task failed:</div><div>=A0 /home/ambalakkat/projects/yocto/git/poky/me=
ta-virtualization/recipes-extended/xen/<a href=3D"http://xen_4.1.2.bb" targ=
et=3D"_blank">xen_4.1.2.bb</a>, do_compile</div>

<div>Summary: There were 10 WARNING messages shown.</div><div>Summary: Ther=
e was 1 ERROR message shown, returning a non-zero exit code.</div><div><br>=
</div><div><br></div>-- <br><div dir=3D"ltr"><font face=3D"trebuchet ms, sa=
ns-serif"><i>Balagopal</i> <i>Ambalakkat</i></font></div>


</div>

--20cf302074260a3f9004ec963e14--
