Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97C2AE00887; Tue,  7 Mar 2017 01:50:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.171 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.171 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D77CDE006D8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Mar 2017 01:50:13 -0800 (PST)
Received: by mail-ot0-f171.google.com with SMTP id o24so67090002otb.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 07 Mar 2017 01:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=WGsxhNhZrLW3fAu2AuOQNhcVtwdhka1v+YVQS12sSPU=;
	b=Zi8Swy1NU9uXr3TQPaYzgU5xGy7ZY/q2x1IzkxOzj0ntkc//WVHFjRlgx4me1W2L31
	ceWnTbFvc8yuwGazskqqMm3CRs891AXYY1aCoYUtDggA13ZfT5ufQtiOn57mnistfgUt
	nfNClnNSOsGQIAFPI892/xIJQVD0QL4vbdTvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=WGsxhNhZrLW3fAu2AuOQNhcVtwdhka1v+YVQS12sSPU=;
	b=e4luY1+ahe008w73/TWn95oAXS8YZVu52loUSQJLO2bf+sB7UtRLcXsYhO4I3dP5z7
	g7Z7Y6Uk0SbWy9OKm0y/kAGwmSWdhnPh8RoKcOFw29UNHVLKfrxNUyjuKvVaPSBIgBP4
	NsjdKnnJs+Y2ZWEiOvHN/8DxkZd3aP391yn2tJX+CSfoiecxPSu/OZB0p8IHcabREjRo
	q5rwwlKwUCCMMA9anPAmOpNW0lbcwWchrDsXH+E6XLFphnVtMSxtCPHBPGWH3az4FgkU
	95xboDRRc1bQ4x/pJ2de2bqPYV/8wrvUoKEMcXtC7fxglSjKs5GYX+94SMHSc2MjKNpi
	URog==
X-Gm-Message-State: AMke39m45c1kzOpzWZS4G9UuPUyJhGbO1Y9se1cBthnjOlViNNCpYNYhnEMkoTZOCBTOqW/wxOaExM2tmV+YsE5j
X-Received: by 10.157.4.114 with SMTP id 105mr11428964otc.60.1488880212872;
	Tue, 07 Mar 2017 01:50:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.4.52 with HTTP; Tue, 7 Mar 2017 01:50:12 -0800 (PST)
In-Reply-To: <CAFL6qn5caDGh2TbNWm1AKGbZSm_67ztidWvhOMcACb7TmW1Mpg@mail.gmail.com>
References: <CAFL6qn435A8JDM30SnfJ9TyxnRiRAm2fD0bUEysSiVn7W+fwQA@mail.gmail.com>
	<CAFL6qn5caDGh2TbNWm1AKGbZSm_67ztidWvhOMcACb7TmW1Mpg@mail.gmail.com>
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Tue, 7 Mar 2017 10:50:12 +0100
Message-ID: <CAFL6qn4htL7bidd7CnLUApQseqQW-vBY=j2qhTMR9rbMo0m4=w@mail.gmail.com>
To: meta-xilinx-request@yoctoproject.org, meta-xilinx@yoctoproject.org, 
	meta-virtualization@yoctoproject.org
Subject: Building a Xen image on Yocto for ZCU102 board
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
X-List-Received-Date: Tue, 07 Mar 2017 09:50:17 -0000
Content-Type: multipart/alternative; boundary=001a113ec62233a7ae054a20f00a

--001a113ec62233a7ae054a20f00a
Content-Type: text/plain; charset=UTF-8

---------- Forwarded message ----------
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: 2017-03-07 10:46 GMT+01:00
Subject: Fwd: Building a Xen image on Yocto for ZCU102 board
To: meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org,
meta-virtualization@yoctoproject.org



---------- Forwarded message ----------
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: 2017-03-07 10:41 GMT+01:00
Subject: Building a Xen image on Yocto for ZCU102 board
To: meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org,
meta-virtualization@yoctoproject.org, cardoe@cardoe.com, matha@xilinx.com,
Alistair Francis <alistair23@gmail.com>


Hi all,

as you know, I'm trying to build a Xen image using Yocto master branch for
ZCU102 board.

I have been experimenting some errors during the last days when I have
tried to execute bitbake xen-image-minimal command.

Some of you have told me to change to a stable branch in order to don't
have errors, but some weeks ago I tried to build a core-image-minimal for
ZCU102 using Morty branch and I couldn't. I think that this branch has not
enough support in order to build images for this (ZCU102) target. Anyway if
this information is not correct, I need to test the image using QEMU
emulator, and this also would't be possible with Morty for the ZCU102 board
case.

In the other hand, when I try to execute xen-image-minimal using master
branch, I experimented this error:

| ERROR: Function failed: do_compile (log file is located at
/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/aarch64-poky-linux/xen/4.8.0-r0/temp/log.do_compile.23462)
ERROR: Task
(/opt/yocto_GE/yocto_master_v2/poky/meta-virtualization/recipes-extended/xen/xen_4.8.0.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2385 tasks of which 2381 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

/opt/yocto_GE/yocto_master_v2/poky/meta-virtualization/recipes-extended/xen/xen_4.8.0.bb:
do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


As you can see, it's an error related to compilation. I have read that the
error can be due to the GCC compiler version in the next link:
https://lists.yoctoproject.org/pipermail/meta-virtualization/2015-December/
001589.html
Could this be the problem? If yes, how can I solve it? in which file do I
need to change the compiler version I want to use?

On the other side, do I need to include meta-petalinux layer in my project
in order to use Xen? That's what I have read in the next link:
http://www.wiki.xilinx.com/Xen+Hypervisor+through+Yocto+Flow
This link also says that the used machine can be qemuzynqmp and that's not
correct. In my case, I'm trying to build the image using zcu102-zynqmp
machine.
Anyway, if I include meta-petalinux layer on my project, I got an error
related to qt5. I have tried to include meta-qt5 layer too, but I got the
next error:


pello@pello-VirtualBox:/opt/yocto_GE/yocto_master_v2/poky/build$ bitbake
xen-image-minimal
NOTE: /opt/yocto_GE/yocto_master_v2/poky/meta-qt5/recipes-qt/qt5/
qtbase_git.bb: base_contains is deprecated, please use bb.utils.contains
instead.
NOTE: /opt/yocto_GE/yocto_master_v2/poky/meta-qt5/recipes-qt/qt5/
qtbase_git.bb: base_contains is deprecated, please use bb.utils.contains
instead.
WARNING:
/opt/yocto_GE/yocto_master_v2/poky/meta-petalinux/recipes-external/external-xilinx-toolchain/
libgcc-xilinx.bb: LICENSE_libgcov-dev includes licenses (GPL-3.0) that are
not listed in LICENSE
Parsing recipes: 100%
|##################################################################################|
Time: 0:05:14
Parsing of 2097 .bb files complete (0 cached, 2097 parsed). 2894 targets,
221 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for iasl-native (iasl-native,
acpica-native)
NOTE: consider defining a PREFERRED_PROVIDER entry to match iasl-native
ERROR: Nothing RPROVIDES 'busybox-inetd' (but
/opt/yocto_GE/yocto_master_v2/poky/meta/recipes-core/busybox/
busybox_1.24.1.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'busybox-inetd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['busybox-inetd']
NOTE: Runtime target 'busybox' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['busybox', 'busybox-inetd']
NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-core-boot',
'busybox', 'busybox-inetd']
ERROR: Required build target 'xen-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['xen-image-minimal',
'packagegroup-core-boot', 'busybox', 'busybox-inetd']

Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Other thing that I have read that I need to add to my project in order to
configure the kernel for using Xen, has been to append in the local.conf
file the DISTRO_FEATURES_append = " xen". I also have done this, but the
bitbake result was the same as first reported image where it says that has
occurred a compilation errorSo can anybody answer this questions please?

Just for adding some more information, the layers that I have add in my
bblayers file are the next:

BBLAYERS ?= " \
  /opt/yocto_GE/yocto_master_v2/poky/meta \
  /opt/yocto_GE/yocto_master_v2/poky/meta-poky \
  /opt/yocto_GE/yocto_master_v2/poky/meta-yocto-bsp \
  /opt/yocto_GE/yocto_master_v2/poky/meta-xilinx \
  /opt/yocto_GE/yocto_master_v2/poky/meta-virtualization \
  /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-oe \
  /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-networking \
  /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-filesystems \
  /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-python \
  /opt/yocto_GE/yocto_master_v2/poky/oe-meta-go \
  /opt/yocto_GE/yocto_master_v2/poky/meta-selinux \
  /opt/yocto_GE/yocto_master_v2/poky/meta-petalinux \
  /opt/yocto_GE/yocto_master_v2/poky/meta-qt5 \
  "

The last two are the ones that give different problems when I run bitbake.

I would appreciate any answer,
Thanks,
Pello

--001a113ec62233a7ae054a20f00a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote">---------- Forwarded messag=
e ----------<br>From: <b class=3D"gmail_sendername">Pello Heriz</b> <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:pello.heriz@alumni.mondragon.edu">pello.he=
riz@alumni.mondragon.edu</a>&gt;</span><br>Date: 2017-03-07 10:46 GMT+01:00=
<br>Subject: Fwd: Building a Xen image on Yocto for ZCU102 board<br>To: <a =
href=3D"mailto:meta-xilinx@yoctoproject.org">meta-xilinx@yoctoproject.org</=
a>, <a href=3D"mailto:meta-xilinx-request@yoctoproject.org">meta-xilinx-req=
uest@yoctoproject.org</a>, <a href=3D"mailto:meta-virtualization@yoctoproje=
ct.org">meta-virtualization@yoctoproject.org</a><br><br><br><div class=3D"g=
mail-HOEnZb"><div class=3D"gmail-h5"><div dir=3D"ltr"><br><div class=3D"gma=
il_quote">---------- Forwarded message ----------<br>From: <b class=3D"gmai=
l_sendername">Pello Heriz</b> <span dir=3D"ltr">&lt;<a href=3D"mailto:pello=
.heriz@alumni.mondragon.edu" target=3D"_blank">pello.heriz@alumni.mondragon=
.<wbr>edu</a>&gt;</span><br>Date: 2017-03-07 10:41 GMT+01:00<br>Subject: Bu=
ilding a Xen image on Yocto for ZCU102 board<br>To: <a href=3D"mailto:meta-=
xilinx@yoctoproject.org" target=3D"_blank">meta-xilinx@yoctoproject.org</a>=
, <a href=3D"mailto:meta-xilinx-request@yoctoproject.org" target=3D"_blank"=
>meta-xilinx-request@<wbr>yoctoproject.org</a>, <a href=3D"mailto:meta-virt=
ualization@yoctoproject.org" target=3D"_blank">meta-virtualization@<wbr>yoc=
toproject.org</a>, <a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">c=
ardoe@cardoe.com</a>, <a href=3D"mailto:matha@xilinx.com" target=3D"_blank"=
>matha@xilinx.com</a>, Alistair Francis &lt;<a href=3D"mailto:alistair23@gm=
ail.com" target=3D"_blank">alistair23@gmail.com</a>&gt;<br><br><br><div dir=
=3D"ltr">Hi all,<div><br></div><div>as you know, I&#39;m trying to build a =
Xen image using Yocto master branch for ZCU102 board.</div><div><br></div><=
div>I have been experimenting some errors during the last days when I have =
tried to execute bitbake xen-image-minimal command.</div><div><br></div><di=
v>Some of you have told me to change to a stable branch in order to don&#39=
;t have errors, but some weeks ago I tried to build a core-image-minimal fo=
r ZCU102 using Morty branch and I couldn&#39;t. I think that this branch ha=
s not enough support in order to build images for this (ZCU102) target. Any=
way if this information is not correct, I need to test the image using QEMU=
 emulator, and this also would&#39;t be possible with Morty for the ZCU102 =
board case.</div><div><br></div><div>In the other hand, when I try to execu=
te xen-image-minimal using master branch, I experimented this error:</div><=
div><br></div><div><div>| ERROR: Function failed: do_compile (log file is l=
ocated at /opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/aarch64-poky-li=
nux/xen/4.8.0-r0/temp/log.do_compile.23462)</div><div>ERROR: Task (/opt/yoc=
to_GE/yocto_master_v2/poky/meta-virtualization/recipes-extended/xen/xen_4.8=
.0.bb:do_compile) failed with exit code &#39;1&#39;</div><div>NOTE: Tasks S=
ummary: Attempted 2385 tasks of which 2381 didn&#39;t need to be rerun and =
1 failed.</div><div><br></div><div>Summary: 1 task failed:</div><div>=C2=A0=
 /opt/yocto_GE/yocto_master_v2/poky/meta-virtualization/recipes-extended/xe=
n/xen_4.8.0.bb:do_compile</div><div>Summary: There were 2 ERROR messages sh=
own, returning a non-zero exit code.</div></div><div><br></div><div><br></d=
iv><div>As you can see, it&#39;s an error related to compilation. I have re=
ad that the error can be due to the GCC compiler version in the next link:=
=C2=A0<a href=3D"https://lists.yoctoproject.org/pipermail/meta-virtualizati=
on/2015-December/001589.html" target=3D"_blank">https://lists.yoctoproje<wb=
r>ct.org/pipermail/meta-<wbr>virtualization/2015-December/<wbr>001589.html<=
/a></div><div>Could this be the problem? If yes, how can I solve it? in whi=
ch file do I need to change the compiler version I want to use?</div><div><=
br></div><div>On the other side, do I need to include meta-petalinux layer =
in my project in order to use Xen? That&#39;s what I have read in the next =
link: <a href=3D"http://www.wiki.xilinx.com/Xen+Hypervisor+through+Yocto+Fl=
ow" target=3D"_blank">http://www.wiki.xilinx.com/Xen<wbr>+Hypervisor+throug=
h+Yocto+Flow</a></div><div>This link also says that the used machine can be=
 qemuzynqmp and that&#39;s not correct. In my case, I&#39;m trying to build=
 the image using zcu102-zynqmp machine.</div><div>Anyway, if I include meta=
-petalinux layer on my project, I got an error related to qt5. I have tried=
 to include meta-qt5 layer too, but I got the next error:</div><div><br></d=
iv><div><br></div><div><div>pello@pello-VirtualBox:/opt/yocto_GE/yocto_mast=
er_v2/poky/build$ bitbake xen-image-minimal</div><div>NOTE: /opt/yocto_GE/y=
octo_master_v2/poky/meta-qt5/recipes-qt/qt5/<a href=3D"http://qtbase_git.bb=
">qtbase_git.bb</a>: base_contains is deprecated, please use bb.utils.conta=
ins instead.</div><div>NOTE: /opt/yocto_GE/yocto_master_v2/poky/meta-qt5/re=
cipes-qt/qt5/<a href=3D"http://qtbase_git.bb">qtbase_git.bb</a>: base_conta=
ins is deprecated, please use bb.utils.contains instead.</div><div>WARNING:=
 /opt/yocto_GE/yocto_master_v2/poky/meta-petalinux/recipes-external/externa=
l-xilinx-toolchain/<a href=3D"http://libgcc-xilinx.bb">libgcc-xilinx.bb</a>=
: LICENSE_libgcov-dev includes licenses (GPL-3.0) that are not listed in LI=
CENSE</div><div>Parsing recipes: 100% |####################################=
##############################################| Time: 0:05:14</div><div>Par=
sing of 2097 .bb files complete (0 cached, 2097 parsed). 2894 targets, 221 =
skipped, 0 masked, 0 errors.</div><div>NOTE: Resolving any missing task que=
ue dependencies</div><div>NOTE: multiple providers are available for iasl-n=
ative (iasl-native, acpica-native)</div><div>NOTE: consider defining a PREF=
ERRED_PROVIDER entry to match iasl-native</div><div>ERROR: Nothing RPROVIDE=
S &#39;busybox-inetd&#39; (but /opt/yocto_GE/yocto_master_v2/poky/meta/reci=
pes-core/busybox/<a href=3D"http://busybox_1.24.1.bb">busybox_1.24.1.bb</a>=
 RDEPENDS on or otherwise requires it)</div><div>NOTE: Runtime target &#39;=
busybox-inetd&#39; is unbuildable, removing...</div><div>Missing or unbuild=
able dependency chain was: [&#39;busybox-inetd&#39;]</div><div>NOTE: Runtim=
e target &#39;busybox&#39; is unbuildable, removing...</div><div>Missing or=
 unbuildable dependency chain was: [&#39;busybox&#39;, &#39;busybox-inetd&#=
39;]</div><div>NOTE: Runtime target &#39;packagegroup-core-boot&#39; is unb=
uildable, removing...</div><div>Missing or unbuildable dependency chain was=
: [&#39;packagegroup-core-boot&#39;, &#39;busybox&#39;, &#39;busybox-inetd&=
#39;]</div><div>ERROR: Required build target &#39;xen-image-minimal&#39; ha=
s no buildable providers.</div><div>Missing or unbuildable dependency chain=
 was: [&#39;xen-image-minimal&#39;, &#39;packagegroup-core-boot&#39;, &#39;=
busybox&#39;, &#39;busybox-inetd&#39;]</div><div><br></div><div>Summary: Th=
ere was 1 WARNING message shown.</div><div>Summary: There were 2 ERROR mess=
ages shown, returning a non-zero exit code.</div></div><div><br></div><div>=
Other thing that I have read that I need to add to my project in order to c=
onfigure the kernel for using Xen, has been to append in the local.conf fil=
e the DISTRO_FEATURES_append =3D &quot; xen&quot;. I also have done this, b=
ut the bitbake result was the same as first reported image where it says th=
at has occurred a compilation errorSo can anybody answer this questions ple=
ase?</div><div><br></div><div>Just for adding some more information, the la=
yers that I have add in my bblayers file are the next:</div><div><br></div>=
<div>BBLAYERS ?=3D &quot; \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/=
<wbr>poky/meta \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/m=
eta-poky \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/meta-yo=
cto-bsp \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/meta-xil=
inx \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/meta-virtual=
ization \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/meta-ope=
nembedded/meta-oe \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>pok=
y/meta-openembedded/meta-ne<wbr>tworking \</div><div>=C2=A0 /opt/yocto_GE/y=
octo_master_v2/<wbr>poky/meta-openembedded/meta-fi<wbr>lesystems \</div><di=
v>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/meta-openembedded/meta-py<=
wbr>thon \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/oe-meta=
-go \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/meta-selinux=
 \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/meta-petalinux =
\</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/meta-qt5 \</div>=
<div>=C2=A0 &quot;=C2=A0</div><div><br></div><div>The last two are the ones=
 that give different problems when I run bitbake.</div><div><br></div><div>=
I would appreciate any answer,</div><div>Thanks,</div><div>Pello</div><div>=
<br></div><div><br></div></div>
</div><br></div>
</div></div></div><br></div>

--001a113ec62233a7ae054a20f00a--
