Return-Path: <Muhammad_Sheheryar@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52EC0E007AD; Tue, 21 Feb 2017 23:53:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36804E004D8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Feb 2017 23:53:14 -0800 (PST)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cgRjd-0005tD-U4 from Muhammad_Sheheryar@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Tue, 21 Feb 2017 23:53:14 -0800
Received: from SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Wed, 22 Feb 2017 07:53:10 +0000
Received: from SVR-IES-MBX-04.mgc.mentorg.com ([fe80::9dd6:2f1c:ad6:d35f]) by
	SVR-IES-MBX-04.mgc.mentorg.com ([fe80::9dd6:2f1c:ad6:d35f%22]) with
	mapi id 15.00.1210.000; Wed, 22 Feb 2017 07:53:10 +0000
From: "Sheheryar, Muhammad" <Muhammad_Sheheryar@mentor.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Building docker
Thread-Index: AQHSjOC21S9WUKNr/06RzWqb66GCBQ==
Date: Wed, 22 Feb 2017 07:53:10 +0000
Message-ID: <cc3dc371bff6438ea13431dfe77b2531@SVR-IES-MBX-04.mgc.mentorg.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Building docker
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
X-List-Received-Date: Wed, 22 Feb 2017 07:53:16 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_cc3dc371bff6438ea13431dfe77b2531SVRIESMBX04mgcmentorgco_"

--_000_cc3dc371bff6438ea13431dfe77b2531SVRIESMBX04mgcmentorgco_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks for getting back. I am receiving the following error when trying to =
build docker

ERROR: Function failed: do_compile (log file is located at /var/mshehery/Do=
cuments/git/new_fido/poky/build/tmp/work/x86_64-poky-linux/golang-cross/1.3=
-r0/temp/log.do_compile.4734)
ERROR: Logfile of failure stored in: /var/mshehery/Documents/git/new_fido/p=
oky/build/tmp/work/x86_64-poky-linux/golang-cross/1.3-r0/temp/log.do_compil=
e.4734
Log data follows:
| DEBUG: Executing shell function do_compile
| GOARCH i586
| CC_FOR_TARGET gcc
| + set -e
| + [ ! -f run.bash ]
| + uname
| + ld --version
| + grep gold.* 2\.20
| + [ -d /selinux -a -f /selinux/booleans/allow_execstack -a -x /usr/sbin/s=
elinuxenabled ]
| + [ -d /sys/fs/selinux -a -f /sys/fs/selinux/booleans/allow_execstack -a =
-x /usr/sbin/selinuxenabled ]
| + uname -s
| + [ Linux =3D=3D GNU/kFreeBSD ]
| ./make.bash: 104: [: Linux: unexpected operator
| + rm -f ./pkg/runtime/runtime_defs.go
| + echo # Building C bootstrap tool.
| # Building C bootstrap tool.
| + echo cmd/dist
| cmd/dist
| + cd ..
| + pwd
| + export GOROOT=3D/var/mshehery/Documents/git/new_fido/poky/build/tmp/wor=
k/x86_64-poky-linux/golang-cross/1.3-r0/go
| + GOROOT_FINAL=3D/var/mshehery/Documents/git/new_fido/poky/build/tmp/sysr=
oots/x86_64-linux/usr/lib/i586-poky-linux/go
| + DEFGOROOT=3D-DGOROOT_FINAL=3D"/var/mshehery/Documents/git/new_fido/poky=
/build/tmp/sysroots/x86_64-linux/usr/lib/i586-poky-linux/go"
| + mflag=3D
| + uname
| + [ Linux =3D=3D Darwin ]
| ./make.bash: 124: [: Linux: unexpected operator
| + type -t gcc
| + type -t clang
| + [ -z gcc  -a -z -t: not found
| gcc is /usr/bin/gcc -a -n -t: not found
| clang: not found ]
| + gcc -O2 -Wall -Werror -o cmd/dist/dist -Icmd/dist -DGOROOT_FINAL=3D"/va=
r/mshehery/Documents/git/new_fido/poky/build/tmp/sysroots/x86_64-linux/usr/=
lib/i586-poky-linux/go" cmd/dist/arm.c cmd/dist/buf.c cmd/dist/build.c cmd/=
dist/buildgc.c cmd/dist/buildgo.c cmd/dist/buildruntime.c cmd/dist/goc2c.c =
cmd/dist/main.c cmd/dist/plan9.c cmd/dist/unix.c cmd/dist/windows.c
| + ./cmd/dist/dist env -p
| go tool dist: unknown $GOARCH i586
| + echo FAIL=3Dtrue
| + eval FAIL=3Dtrue
| + FAIL=3Dtrue
| + [ true =3D true ]
| + exit 1
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /var/mshehery/=
Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linux/golang-cross/1=
.3-r0/temp/log.do_compile.4734)
ERROR: Task 104 (/var/mshehery/Documents/git/new_fido/poky/meta-virtualizat=
ion/recipes-devtools/go/golang-cross_1.3.bb, do_compile) failed with exit c=
ode '1'
NOTE: Tasks Summary: Attempted 1617 tasks of which 1486 didn't need to be r=
erun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /var/mshehery/Documents/git/new_fido/poky/meta-virtualization/recipes-dev=
tools/go/golang-cross_1.3.bb, do_compile
Summary: There were 2 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Regards,

Muhammad Sheheryar Qureshi


--_000_cc3dc371bff6438ea13431dfe77b2531SVRIESMBX04mgcmentorgco_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-b=
ottom:0;} --></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<span style=3D"font-size:12pt;background-color:white;" dir=3D"ltr">
<div style=3D"margin-top:0;margin-bottom:0;"><font face=3D"Tahoma,Geneva,sa=
ns-serif">Hi Peter,</font></div>
<div style=3D"margin-top:0;margin-bottom:0;"><br>
</div>
<div style=3D"margin-top:0;margin-bottom:0;"><font face=3D"Tahoma,Geneva,sa=
ns-serif">Thanks for getting back. I am receiving the following error when =
trying to build docker</font></div>
<div style=3D"margin-top:0;margin-bottom:0;"><br>
</div>
<div style=3D"margin-top:0;margin-bottom:0;"><font face=3D"Tahoma,Geneva,sa=
ns-serif">ERROR: Function failed: do_compile (log file is located at /var/m=
shehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linux/golang=
-cross/1.3-r0/temp/log.do_compile.4734)</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">ERROR: Logfile of failure stored in=
: /var/mshehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linu=
x/golang-cross/1.3-r0/temp/log.do_compile.4734</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">Log data follows:</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| DEBUG: Executing shell function d=
o_compile</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| GOARCH i586</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| CC_FOR_TARGET gcc</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; set -e</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; [ ! -f run.bash ]</font><br=
>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; uname</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; ld --version</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; grep gold.* 2\.20</font><br=
>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; [ -d /selinux -a -f /selinu=
x/booleans/allow_execstack -a -x /usr/sbin/selinuxenabled ]</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; [ -d /sys/fs/selinux -a -f =
/sys/fs/selinux/booleans/allow_execstack -a -x /usr/sbin/selinuxenabled ]</=
font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; uname -s</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; [ Linux =3D=3D GNU/kFreeBSD=
 ]</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| ./make.bash: 104: [: Linux: unexp=
ected operator</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; rm -f ./pkg/runtime/runtime=
_defs.go</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; echo # Building C bootstrap=
 tool.</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| # Building C bootstrap tool.</fon=
t><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; echo cmd/dist</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| cmd/dist</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; cd ..</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; pwd</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; export GOROOT=3D/var/mshehe=
ry/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linux/golang-cros=
s/1.3-r0/go</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; GOROOT_FINAL=3D/var/msheher=
y/Documents/git/new_fido/poky/build/tmp/sysroots/x86_64-linux/usr/lib/i586-=
poky-linux/go</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; DEFGOROOT=3D-DGOROOT_FINAL=
=3D&quot;/var/mshehery/Documents/git/new_fido/poky/build/tmp/sysroots/x86_6=
4-linux/usr/lib/i586-poky-linux/go&quot;</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; mflag=3D</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; uname</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; [ Linux =3D=3D Darwin ]</fo=
nt><br>
<font face=3D"Tahoma,Geneva,sans-serif">| ./make.bash: 124: [: Linux: unexp=
ected operator</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; type -t gcc</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; type -t clang</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; [ -z gcc&nbsp; -a -z -t: no=
t found</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| gcc is /usr/bin/gcc -a -n -t: not=
 found</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| clang: not found ]</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; gcc -O2 -Wall -Werror -o cm=
d/dist/dist -Icmd/dist -DGOROOT_FINAL=3D&quot;/var/mshehery/Documents/git/n=
ew_fido/poky/build/tmp/sysroots/x86_64-linux/usr/lib/i586-poky-linux/go&quo=
t; cmd/dist/arm.c cmd/dist/buf.c cmd/dist/build.c
 cmd/dist/buildgc.c cmd/dist/buildgo.c cmd/dist/buildruntime.c cmd/dist/goc=
2c.c cmd/dist/main.c cmd/dist/plan9.c cmd/dist/unix.c cmd/dist/windows.c</f=
ont><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; ./cmd/dist/dist env -p</fon=
t><br>
<font face=3D"Tahoma,Geneva,sans-serif">| go tool dist: unknown $GOARCH i58=
6</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; echo FAIL=3Dtrue</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; eval FAIL=3Dtrue</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; FAIL=3Dtrue</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; [ true =3D true ]</font><br=
>
<font face=3D"Tahoma,Geneva,sans-serif">| &#43; exit 1</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| WARNING: exit code 1 from a shell=
 command.</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">| ERROR: Function failed: do_compil=
e (log file is located at /var/mshehery/Documents/git/new_fido/poky/build/t=
mp/work/x86_64-poky-linux/golang-cross/1.3-r0/temp/log.do_compile.4734)</fo=
nt><br>
<font face=3D"Tahoma,Geneva,sans-serif">ERROR: Task 104 (/var/mshehery/Docu=
ments/git/new_fido/poky/meta-virtualization/recipes-devtools/go/golang-cros=
s_1.3.bb, do_compile) failed with exit code '1'</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">NOTE: Tasks Summary: Attempted 1617=
 tasks of which 1486 didn't need to be rerun and 1 failed.</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">Waiting for 0 running tasks to fini=
sh:</font><br>
<br>
<font face=3D"Tahoma,Geneva,sans-serif">Summary: 1 task failed:</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">&nbsp; /var/mshehery/Documents/git/=
new_fido/poky/meta-virtualization/recipes-devtools/go/golang-cross_1.3.bb, =
do_compile</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">Summary: There were 2 WARNING messa=
ges shown.</font><br>
<font face=3D"Tahoma,Geneva,sans-serif">Summary: There was 1 ERROR message =
shown, returning a non-zero exit code.</font></div>
<div style=3D"margin-top:0;margin-bottom:0;"><font face=3D"Tahoma,Geneva,sa=
ns-serif"><br>
</font></div>
<div style=3D"margin-top:0;margin-bottom:0;"><font face=3D"Tahoma,Geneva,sa=
ns-serif">Regards,</font><font face=3D"Tahoma,Geneva,sans-serif"><br>
</font></div>
<div style=3D"margin-top:0;margin-bottom:0;"><font face=3D"Tahoma,Geneva,sa=
ns-serif"><br>
</font></div>
<div style=3D"margin-top:0;margin-bottom:0;"><font face=3D"Tahoma,Geneva,sa=
ns-serif">Muhammad Sheheryar Qureshi
</font></div>
</span>
<p><br>
</p>
</body>
</html>

--_000_cc3dc371bff6438ea13431dfe77b2531SVRIESMBX04mgcmentorgco_--
