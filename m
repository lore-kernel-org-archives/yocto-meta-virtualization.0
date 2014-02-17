Return-Path: <v_gota@yahoo.com>
Received: from n10-vm5.bullet.mail.bf1.yahoo.com
	(n10-vm5.bullet.mail.bf1.yahoo.com [66.196.80.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6581BE00838
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Feb 2014 02:41:31 -0800 (PST)
Received: from [66.196.81.176] by n10.bullet.mail.bf1.yahoo.com with NNFMP;
	17 Feb 2014 10:41:30 -0000
Received: from [98.139.212.230] by t6.bullet.mail.bf1.yahoo.com with NNFMP;
	17 Feb 2014 10:41:30 -0000
Received: from [127.0.0.1] by omp1039.mail.bf1.yahoo.com with NNFMP;
	17 Feb 2014 10:41:30 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 365171.89571.bm@omp1039.mail.bf1.yahoo.com
Received: (qmail 66429 invoked by uid 60001); 17 Feb 2014 10:41:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1392633690; bh=2M4vj5Uymry3rnDhz+jOpeCo9jB74bdnmHnC/7pzZdM=;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=ow7m2PJWlcV5auWH7FKMaqVCb4ytGfdom6rHPMMW4FKSCkBju9FG5EoeHo34HdAQkursCoXeWSiergQOR/yx+8Ws2I45RfajjEVeZ9PHA+I+7nkCBhfmORHyjZVZAXVRrg1cZwdHe79dF0zEGENYVQyXLcffFCXyuhLk1atyUx8=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=D7dvu3uD+IM4g5T/VXhwgZvhXPrtcRR26s0LxMpna2BQawPAVO3sO10NlCD4HlCjndBAH6alcfsQetXLVlDByItBz2mR2kZk1b/yEEENgrU0Sk185odPEaFDlv2+o6KAwtXGs2Knun11CVWekhRMzYkC0y/CW/9JXiMCVRhGCQw=;
X-YMail-OSG: _nUyRUkVM1kr7Ji0auXQbnCzXl6OnCCdsqchDjcYenpIqsb
	BYiqE50xWCQKPiV8QZOe57nrQ48J4osNpSIMK6djCpas_YAeKNjEpz8rmNU4
	sMbLcOJ2VriBCkhxvCT9vYYtVZfvyV4KCycSMQsPRaUsT3gGXKpiKi7xha69
	r370bR0_cwp30c3qefys.UIf7MIQZy_0036svZRCIdp5DRZg80ru1Q_hTv0b
	sMR0rtFwjtHTFj1i9Vh7Fvd41C1BCSTCKZkHKJv4MTKSgfZyAB_vXs1vl38S
	tpaDrd4aB7KZMmaZRLwxvhlwsIM7RSuR5BGo6k3AJGI1jJzxFJx_j8d3P8VZ
	L0j5sdE9ZNKtBHIEsbgv.8SZ6vXYunF8Nh99PVrZX9alhF5kxrK93VhHkx54
	XNMvl1xaGyMiiwDsqNGij.MDWBjnpKITQ2FxNRNT69Atv87IsuZNfB5N.SqZ
	1XETI_swX9yNq8LAXGvk0.xMMlwmugXM9j6UayYbRj4IA3SCp3swy5UFth1r
	yns7l74GJY2PxOqVy1RhgTs_GP1usDHx07A6O3nMmp3yxnQbSdn1BvsE3ucV
	7KZOW4Y_1DoUPasyMgIGK_FW5bshA5TpZQRudSEaC_nQlIR8E14S0Ijit0QY
	FeCQAIGA7IswxvF7dnht3JvR88oDwsZqYymZBFGBKR0oK0eE7OBh1C96uY3E
	LWKQgxGhqx7jFM75fdGoQGJM8X.160XwC37jH6CN.J1r6EPARE7zVaDZPNNt
	7s.m7bDA50zV3bTIlfrx5tQ--
Received: from [116.197.184.11] by web162001.mail.bf1.yahoo.com via HTTP;
	Mon, 17 Feb 2014 02:41:30 PST
X-Rocket-MIMEInfo: 002.001,
	CgpJIHdhcyBidWlsZGluZyBrdm0taW1hZ2UtbWluaW1hbCB3aGVyZSBsaWJ2aXJ0IHB1bGxlZCB4ZW4tNC4xLjIuIMKgSSBtb3ZlZCB0byBkb3JhIGFuZCBwdWxsZWQgbWV0YS12aXJ0dWFsaXphdGlvbiBvZmYgZG9yYS4gdGhlIGJ1aWxkIGZhaWxzIHdpdGggdGhlIGJlbG93IGVycm9ycyBpbiBwYWNrYWdpbmcuIEkgYW0gYnVpbGRpbmcgNjQgYml0IGltYWdlLCBJIGV4cGVjdCB0aGVzZSBzaG91bGQgYmUgaW4gL3Vzci9saWI2NC4KCgoKRVJST1I6IFFBIElzc3VlOiB4ZW46IEZpbGVzL2RpcmVjdG9yaWVzIHcBMAEBAQE-
X-Mailer: YahooMailWebService/0.8.177.636
References: <1392290269.37071.YahooMailNeo@web162001.mail.bf1.yahoo.com>
	<CABZSBQddrC7omUDosH9bHHEJrDq0VM4+que=K1XhYxGKOKL74A@mail.gmail.com>
	<1392443004.5090.YahooMailNeo@web162004.mail.bf1.yahoo.com>
	<1392632508.42027.YahooMailNeo@web162002.mail.bf1.yahoo.com>
Message-ID: <1392633690.84187.YahooMailNeo@web162001.mail.bf1.yahoo.com>
Date: Mon, 17 Feb 2014 02:41:30 -0800 (PST)
From: Venkatesh Gota <v_gota@yahoo.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
In-Reply-To: <1392632508.42027.YahooMailNeo@web162002.mail.bf1.yahoo.com>
MIME-Version: 1.0
Subject: Re: Build error: do_rootfs: libxenstore3.0-4.1.2-r1.0@x86_64
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Venkatesh Gota <v_gota@yahoo.com>
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Feb 2014 10:41:32 -0000
Content-Type: multipart/alternative;
	boundary="1969517296-1778712275-1392633690=:84187"

--1969517296-1778712275-1392633690=:84187
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

=0A=0AI was building kvm-image-minimal where libvirt pulled xen-4.1.2. =A0I=
 moved to dora and pulled meta-virtualization off dora. the build fails wit=
h the below errors in packaging. I am building 64 bit image, I expect these=
 should be in /usr/lib64.=0A=0A=0A=0AERROR: QA Issue: xen: Files/directorie=
s were installed but not shipped=0A=A0 /usr/lib=0A=A0 /usr/lib/libxenguest.=
so=0A=A0 /usr/lib/libfsimage.so=0A=A0 /usr/lib/libblktapctl.a=0A=A0 /usr/li=
b/libxenvchan.so.1.0=0A=A0 /usr/lib/libxenlight.a=0A=A0 /usr/lib/libxenvcha=
n.a=0A=A0 /usr/lib/libvhd.so.1.0=0A<clip>=0A=A0 /usr/lib/libxlutil.so.4.3=
=0A=A0 /usr/lib/libxenstore.a=0A=0A=A0 /usr/lib/libfsimage.so.1.0.0=0A=A0 /=
usr/lib/xen=0A=A0 /usr/lib/.debug=0A=A0 /usr/lib/python2.7=0A=A0 /usr/lib/f=
s=0A=A0 /usr/lib/xen/bin=0A=A0 /usr/lib/xen/boot=0A=A0 /usr/lib/xen/bin/xen=
paging=0A<clip>=0A=A0=A0/usr/lib/.debug/libfsimage.so.1.0.0=0A=0A=A0 /usr/l=
ib/python2.7/site-packages=0A=A0 /usr/lib/python2.7/site-packages/fsimage.s=
o=0A<clip>=0A=A0 /usr/lib/python2.7/site-packages/grub/ExtLinuxConf.pyc=0A=
=A0 /usr/lib/fs/ext2fs-lib=0A=A0 /usr/lib/fs/xfs=0A=0A<clip>=0A=A0=A0/usr/l=
ib/fs/zfs/.debug/fsimage.so=0A=0A=A0 /usr/libexec/.debug=0A=A0 /usr/libexec=
/.debug/qemu-bridge-helper=0AERROR: QA run found fatal errors. Please consi=
der fixing them.=0AERROR: Function failed: do_package_qa=0AERROR: Logfile o=
f failure stored in: /mnt/vgota/yocto-dora/poky/build/tmp-eglibc/work/x86_6=
4-poky-linux/xen/4.3.0-r0/temp/log.do_package.26295=0AERROR: Task 1776 (/mn=
t/vgota/yocto-dora/poky/meta-virtualization/recipes-extended/xen/xen_4.3.0.=
bb, do_package) failed with exit code '1'=0ANOTE: Tasks Summary: Attempted =
3414 tasks of which 3407 didn't need to be rerun=0A=0A=0Athere is also anot=
her error in polkit.=0A=0Alog.do_install.7758:chown: cannot access `/mnt/vg=
ota/yocto-dora/poky/build/tmp-eglibc/work/x86_64-poky-linux/polkit/0.111-r0=
/image/usr/lib64/polkit-1/polkit-agent-helper-1': No such file or directory=
=0A=0A=0Awhereas polkit-1/polkit-agent-helper-1 is actually in image/usr/li=
b/ and not in lib64.=0A=0A=0A=0AOn Saturday, February 15, 2014 11:13 AM, Ve=
nkatesh Gota <v_gota@yahoo.com> wrote:=0A =0AI tried building kvm-image-min=
imal, and libvirt seems to need libxenstore. Thanks, I will try on dora.=0A=
=0ARegards,=0A-Venkat=0A=0A=0A=0AOn Thursday, February 13, 2014 6:13 PM, Ch=
ris Patterson <cjp256@gmail.com> wrote:=0A =0AAre you building the xen-imag=
e-minimal or including xen in one of your core images?=0A=0A=0AThe xen vers=
ion in the dylan branch is fairly old and is known to not build properly - =
if you are trying to build a xen image, I'd recommend moving forward to a n=
ewer branch (or backporting the xen recipe to dylan).=0A=0ACheers,=0A-Chris=
=0A=0A=0A=0AOn Thu, Feb 13, 2014 at 6:17 AM, Venkatesh Gota <v_gota@yahoo.c=
om> wrote:=0A=0A=0A>=0A>I pulled dylan meta-virtualization layer into my yo=
cto project based off dylan. I am unable to build core-image-* with meta-vi=
rtualization included. It fails towards the end with this error.=0A>=0A>=0A=
>| =A0 49:Installing libxenstore3.0 =A0####################################=
#### [ =A03%]=0A>| Output from libxenstore3.0-4.1.2-r1.0@x86_64:=0A>| error=
: unpacking of archive failed on file /usr/lib64: cpio: rename failed - Res=
ource temporarily unavailable=0A>| =A0 50:Installing eglibc-gconv-.. ######=
################################## [ =A03%]=0A>=0A>=0A>the file exists, and=
 not sure what is cpio complaining about.=0A>=0A>=0A>yocto-build:/mnt/vgota=
/poky/build/tmp-eglibc/work/x86_64-poky-linux$ find . | grep libxenstore3.0=
 | xargs ls -al=0A>-rw-r--r-- 2 vgota vgota =A00 Feb 13 16:32 ./xen/4.1.2-r=
1/deploy-rpms/x86_64/libxenstore3.0-4.1.2-r1.0.x86_64.rpm=0A>lrwxrwxrwx 1 v=
gota vgota 22 Feb 13 15:29 ./xen/4.1.2-r1/pkgdata/runtime-reverse/libxensto=
re3.0 -> ../runtime/libxenstore=0A>=0A>=0A>any insight is appreciated.=0A>=
=0A>=0A>_______________________________________________=0A>meta-virtualizat=
ion mailing list=0A>meta-virtualization@yoctoproject.org=0A>https://lists.y=
octoproject.org/listinfo/meta-virtualization=0A>=0A>

--1969517296-1778712275-1392633690=:84187
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:He=
lveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;fo=
nt-size:12pt"><div><br></div><div class=3D"yahoo_quoted" style=3D"display: =
block;"><div style=3D"font-family: HelveticaNeue, 'Helvetica Neue', Helveti=
ca, Arial, 'Lucida Grande', sans-serif; font-size: 12pt;"><div style=3D"fon=
t-family: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande=
', sans-serif; font-size: 12pt;"><div dir=3D"ltr"> </div>  <div class=3D"y_=
msg_container"><div id=3D"yiv9348071892"><div><div style=3D"color: rgb(0, 0=
, 0); background-color: rgb(255, 255, 255); font-family: HelveticaNeue, 'He=
lvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; font-size: 12=
pt;"><div><span style=3D"background-color:transparent;">I was building kvm-=
image-minimal where libvirt pulled xen-4.1.2. &nbsp;I moved to dora and pul=
led meta-virtualization off dora. the build fails with the below errors in =
packaging. I
 am building 64 bit image, I expect these should be in /usr/lib64.</span><b=
r clear=3D"none"></div><div style=3D"color: rgb(0, 0, 0); font-size: 16px; =
font-family: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Gra=
nde', sans-serif; background-color: transparent; font-style: normal;"><span=
><br clear=3D"none"></span></div><div style=3D"background-color:transparent=
;"><br clear=3D"none"></div><div style=3D"background-color:transparent;">ER=
ROR: QA Issue: xen: Files/directories were installed but not shipped</div><=
div style=3D"background-color:transparent;">&nbsp; /usr/lib</div><div style=
=3D"background-color:transparent;">&nbsp; /usr/lib/libxenguest.so</div><div=
 style=3D"background-color:transparent;">&nbsp; /usr/lib/libfsimage.so</div=
><div style=3D"background-color:transparent;">&nbsp; /usr/lib/libblktapctl.=
a</div><div style=3D"background-color:transparent;">&nbsp; /usr/lib/libxenv=
chan.so.1.0</div><div style=3D"background-color:transparent;">&nbsp;
 /usr/lib/libxenlight.a</div><div style=3D"background-color:transparent;">&=
nbsp; /usr/lib/libxenvchan.a</div><div style=3D"background-color:transparen=
t;">&nbsp; /usr/lib/libvhd.so.1.0</div><div style=3D"background-color:trans=
parent;">&lt;clip&gt;</div><div style=3D"background-color:transparent;">&nb=
sp; /usr/lib/libxlutil.so.4.3</div><div style=3D"background-color:transpare=
nt;"><span style=3D"background-color:transparent;font-size:12pt;">&nbsp; /u=
sr/lib/libxenstore.a</span><br clear=3D"none"></div><div style=3D"backgroun=
d-color:transparent;">&nbsp; /usr/lib/libfsimage.so.1.0.0</div><div style=
=3D"background-color:transparent;">&nbsp;=0A /usr/lib/xen</div><div style=
=3D"background-color:transparent;">&nbsp; /usr/lib/.debug</div><div style=
=3D"background-color:transparent;">&nbsp; /usr/lib/python2.7</div><div styl=
e=3D"background-color:transparent;">&nbsp; /usr/lib/fs</div><div style=3D"b=
ackground-color:transparent;">&nbsp; /usr/lib/xen/bin</div><div style=3D"ba=
ckground-color:transparent;">&nbsp; /usr/lib/xen/boot</div><div style=3D"ba=
ckground-color:transparent;">&nbsp; /usr/lib/xen/bin/xenpaging</div><div st=
yle=3D"background-color:transparent;"><span style=3D"background-color:trans=
parent;font-size:12pt;">&lt;clip&gt;</span></div><div style=3D"background-c=
olor: transparent; color: rgb(0, 0, 0); font-size: 12pt; font-family: Helve=
ticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; =
font-style: normal;"><span style=3D"background-color:transparent;font-size:=
12pt;">&nbsp;&nbsp;/usr/lib/.debug/libfsimage.so.1.0.0</span><br clear=3D"n=
one"></div><div style=3D"background-color:transparent;">&nbsp;=0A /usr/lib/=
python2.7/site-packages</div><div style=3D"background-color:transparent;">&=
nbsp; /usr/lib/python2.7/site-packages/fsimage.so</div><div style=3D"backgr=
ound-color:transparent;">&lt;clip&gt;</div><div style=3D"background-color:t=
ransparent;">&nbsp; /usr/lib/python2.7/site-packages/grub/ExtLinuxConf.pyc<=
/div><div style=3D"background-color:transparent;">&nbsp; /usr/lib/fs/ext2fs=
-lib</div><div style=3D"background-color:transparent;"><span style=3D"backg=
round-color:transparent;font-size:12pt;">&nbsp; /usr/lib/fs/xfs</span><br c=
lear=3D"none"></div><div style=3D"background-color:transparent;"><span styl=
e=3D"background-color:transparent;font-size:12pt;">&lt;clip&gt;</span></div=
><div style=3D"background-color: transparent; color: rgb(0, 0, 0); font-siz=
e: 12pt; font-family: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'L=
ucida Grande', sans-serif; font-style: normal;"><span
 style=3D"background-color:transparent;font-size:12pt;">&nbsp;&nbsp;/usr/li=
b/fs/zfs/.debug/fsimage.so</span><br clear=3D"none"></div><div style=3D"bac=
kground-color:transparent;">&nbsp; /usr/libexec/.debug</div><div style=3D"b=
ackground-color:transparent;">&nbsp; /usr/libexec/.debug/qemu-bridge-helper=
</div><div style=3D"background-color:transparent;">ERROR: QA run found fata=
l errors. Please consider fixing them.</div><div style=3D"background-color:=
transparent;">ERROR: Function failed: do_package_qa</div><div style=3D"back=
ground-color:transparent;">ERROR: Logfile of failure stored in: /mnt/vgota/=
yocto-dora/poky/build/tmp-eglibc/work/x86_64-poky-linux/xen/4.3.0-r0/temp/l=
og.do_package.26295</div><div style=3D"background-color:transparent;">ERROR=
: Task 1776 (/mnt/vgota/yocto-dora/poky/meta-virtualization/recipes-extende=
d/xen/xen_4.3.0.bb, do_package) failed with exit code '1'</div><div style=
=3D"background-color:transparent;"><span></span></div><div
 style=3D"background-color:transparent;">NOTE: Tasks Summary: Attempted 341=
4 tasks=0A of which 3407 didn't need to be rerun</div><div style=3D"color: =
rgb(0, 0, 0); font-size: 16px; font-family: HelveticaNeue, 'Helvetica Neue'=
, Helvetica, Arial, 'Lucida Grande', sans-serif; background-color: transpar=
ent; font-style: normal;"><br clear=3D"none"></div><div style=3D"color: rgb=
(0, 0, 0); font-size: 16px; font-family: HelveticaNeue, 'Helvetica Neue', H=
elvetica, Arial, 'Lucida Grande', sans-serif; background-color: transparent=
; font-style: normal;"><br clear=3D"none"></div><div style=3D"color: rgb(0,=
 0, 0); font-size: 16px; font-family: HelveticaNeue, 'Helvetica Neue', Helv=
etica, Arial, 'Lucida Grande', sans-serif; background-color: transparent; f=
ont-style: normal;">there is also another error in polkit.</div><div style=
=3D"color: rgb(0, 0, 0); font-size: 16px; font-family: HelveticaNeue, 'Helv=
etica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; background-colo=
r: transparent; font-style: normal;"><br clear=3D"none"></div><div
 style=3D"background-color:transparent;">log.do_install.7758:chown:=0A cann=
ot access `/mnt/vgota/yocto-dora/poky/build/tmp-eglibc/work/x86_64-poky-lin=
ux/polkit/0.111-r0/image/usr/lib64/polkit-1/polkit-agent-helper-1': No such=
 file or directory<br clear=3D"none"></div><div style=3D"background-color: =
transparent; color: rgb(0, 0, 0); font-size: 16px; font-family: HelveticaNe=
ue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; font-s=
tyle: normal;"><br clear=3D"none"></div><div style=3D"background-color: tra=
nsparent; color: rgb(0, 0, 0); font-size: 16px; font-family: HelveticaNeue,=
 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; font-styl=
e: normal;">whereas polkit-1/polkit-agent-helper-1 is actually in image/usr=
/lib/ and not in lib64.</div><div class=3D"yiv9348071892yqt7913183611" id=
=3D"yiv9348071892yqt00344"><div class=3D"yiv9348071892yahoo_quoted" style=
=3D"display: block;"> <br clear=3D"none"> <br clear=3D"none"> <div style=3D=
"font-family: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Gr=
ande',
 sans-serif; font-size: 12pt;"> <div style=3D"font-family: HelveticaNeue, '=
Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; font-size: =
12pt;"> <div dir=3D"ltr"> <font size=3D"2" face=3D"Arial"> On Saturday, Feb=
ruary 15, 2014 11:13 AM, Venkatesh Gota &lt;v_gota@yahoo.com&gt; wrote:<br =
clear=3D"none"> </font> </div>  <div class=3D"yiv9348071892y_msg_container"=
><div id=3D"yiv9348071892"><div><div style=3D"color: rgb(0, 0, 0); backgrou=
nd-color: rgb(255, 255, 255); font-family: HelveticaNeue, 'Helvetica Neue',=
 Helvetica, Arial, 'Lucida Grande', sans-serif; font-size: 12pt;"><div id=
=3D"yiv9348071892"><div><div style=3D"color: rgb(0, 0, 0); background-color=
: rgb(255, 255, 255); font-family: HelveticaNeue, 'Helvetica Neue', Helveti=
ca, Arial, 'Lucida Grande', sans-serif; font-size: 12pt;"><div id=3D"yiv934=
8071892yui_3_13_0_ym1_6_1392359390761_10"><span id=3D"yiv9348071892yui_3_13=
_0_ym1_6_1392359390761_17">I tried building kvm-image-minimal, and libvirt =
seems to need
 libxenstore. Thanks, I will try on dora.</span></div><div id=3D"yiv9348071=
892yui_3_13_0_ym1_6_1392359390761_10"><span><br clear=3D"none"></span></div=
><div id=3D"yiv9348071892yui_3_13_0_ym1_6_1392359390761_10"><span>Regards,<=
/span></div><div id=3D"yiv9348071892yui_3_13_0_ym1_6_1392359390761_10"><spa=
n>-Venkat</span></div><div class=3D"yiv9348071892yqt1112400064" id=3D"yiv93=
48071892yqt42789"><div class=3D"yiv9348071892yqt9812182184" id=3D"yiv934807=
1892yqt55478"><div class=3D"yiv9348071892yahoo_quoted" id=3D"yiv9348071892y=
ui_3_13_0_ym1_6_1392359390761_12" style=3D"display:block;"> <br clear=3D"no=
ne"> <br clear=3D"none"> <div class=3D"yiv9348071892yui_3_13_0_ym1_1_139235=
9390761_2895" style=3D"font-family: HelveticaNeue, 'Helvetica Neue', Helvet=
ica, Arial, 'Lucida Grande', sans-serif; font-size: 12pt;"> <div class=3D"y=
iv9348071892yui_3_13_0_ym1_1_1392359390761_2896" style=3D"font-family: Helv=
eticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif;=
 font-size: 12pt;"> <div
 dir=3D"ltr"> <font size=3D"2" face=3D"Arial"> On Thursday, February 13, 20=
14 6:13 PM, Chris Patterson &lt;cjp256@gmail.com&gt; wrote:<br clear=3D"non=
e"> </font>=0A </div>  <div class=3D"yiv9348071892y_msg_container"><div id=
=3D"yiv9348071892"><div><div dir=3D"ltr"><div>Are you building the xen-imag=
e-minimal or including xen in one of your core images?<br clear=3D"none"></=
div><div><br clear=3D"none"></div><div>The xen version in the dylan branch =
is fairly old and is known to not build properly - if you=0A are trying to =
build a xen image, I'd recommend moving forward to a newer branch (or backp=
orting the xen recipe to dylan).</div>=0A<div><br clear=3D"none"></div><div=
>Cheers,</div><div>-Chris</div></div><div class=3D"yiv9348071892gmail_extra=
"><br clear=3D"none"><br clear=3D"none"><div class=3D"yiv9348071892gmail_qu=
ote">On Thu, Feb 13, 2014 at 6:17 AM, Venkatesh Gota <span dir=3D"ltr">&lt;=
<a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mailto:v_gota@yahoo.com" targ=
et=3D"_blank" href=3D"mailto:v_gota@yahoo.com">v_gota@yahoo.com</a>&gt;</sp=
an> wrote:<br clear=3D"none">=0A<blockquote class=3D"yiv9348071892gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;=
"><div class=3D"yiv9348071892yqt5525474837" id=3D"yiv9348071892yqt93927"><d=
iv><div class=3D"yiv9348071892yui_3_13_0_ym1_1_1392359390761_2899" style=3D=
"font-size: 12pt; font-family: HelveticaNeue, 'Helvetica Neue', Helvetica, =
Arial, 'Lucida Grande', sans-serif;"><div>=0A<br clear=3D"none"></div><div =
class=3D"yiv9348071892yui_3_13_0_ym1_1_1392359390761_2900" style=3D"font-st=
yle: normal; font-size: 16px; background-color: transparent; font-family: H=
elveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-ser=
if;">I pulled dylan meta-virtualization layer into my yocto project based o=
ff dylan. I am unable to build core-image-* with meta-virtualization includ=
ed. It fails towards the end with this error.</div>=0A<div class=3D"yiv9348=
071892yui_3_13_0_ym1_1_1392359390761_2901" style=3D"font-style: normal; fon=
t-size: 16px; background-color: transparent; font-family: HelveticaNeue, 'H=
elvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif;"><br clear=
=3D"none"></div><div style=3D"background-color:transparent;">=0A| &nbsp; 49=
:Installing libxenstore3.0 &nbsp;######################################## [=
 &nbsp;3%]</div><div style=3D"background-color:transparent;">|=0A Output fr=
om libxenstore3.0-4.1.2-r1.0@x86_64:</div><div style=3D"background-color:tr=
ansparent;">| error: unpacking of archive failed on file /usr/lib64: cpio: =
rename failed - Resource temporarily unavailable</div><div style=3D"backgro=
und-color:transparent;">=0A| &nbsp; 50:Installing eglibc-gconv-.. #########=
############################### [ &nbsp;3%]</div><div><br clear=3D"none"></=
div><div>the file exists, and not sure what is cpio complaining about.</div=
><div><br clear=3D"none"></div><div><div><div>yocto-build:/mnt/vgota/poky/b=
uild/tmp-eglibc/work/x86_64-poky-linux$ find . | grep libxenstore3.0 | xarg=
s ls -al</div>=0A<div>-rw-r--r-- 2 vgota vgota &nbsp;0 Feb 13 16:32 ./xen/4=
.1.2-r1/deploy-rpms/x86_64/libxenstore3.0-4.1.2-r1.0.x86_64.rpm</div><div>l=
rwxrwxrwx 1 vgota vgota 22 Feb 13 15:29 ./xen/4.1.2-r1/pkgdata/runtime-reve=
rse/libxenstore3.0 -&gt; ../runtime/libxenstore</div>=0A<div><br clear=3D"n=
one"></div><div>any insight is appreciated.</div></div><div><br clear=3D"no=
ne"></div></div></div></div></div><br clear=3D"none">______________________=
_________________________<br clear=3D"none">=0Ameta-virtualization mailing =
list<br clear=3D"none">=0A<a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mai=
lto:meta-virtualization@yoctoproject.org" target=3D"_blank" href=3D"mailto:=
meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.org<=
/a><br clear=3D"none">=0A<a rel=3D"nofollow" shape=3D"rect" target=3D"_blan=
k" href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization">htt=
ps://lists.yoctoproject.org/listinfo/meta-virtualization</a><br clear=3D"no=
ne">=0A<br clear=3D"none"></blockquote></div><br clear=3D"none"></div></div=
></div><br clear=3D"none"><br clear=3D"none"></div>  </div> </div>  </div><=
/div></div> </div></div></div></div></div></div><br clear=3D"none"><br clea=
r=3D"none"></div>  </div> </div>  </div></div> </div></div></div><br><br></=
div>  </div> </div>  </div> </div></body></html>

--1969517296-1778712275-1392633690=:84187--
