Return-Path: <Muhammad_Sheheryar@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE71BE00970; Sun, 26 Feb 2017 22:49:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BCB4E007BA
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Feb 2017 22:49:08 -0800 (PST)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ciF7L-0000Dx-K4 from Muhammad_Sheheryar@mentor.com ;
	Sun, 26 Feb 2017 22:49:07 -0800
Received: from SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) by
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Mon, 27 Feb 2017 06:49:04 +0000
Received: from SVR-IES-MBX-04.mgc.mentorg.com ([fe80::9dd6:2f1c:ad6:d35f]) by
	SVR-IES-MBX-04.mgc.mentorg.com ([fe80::9dd6:2f1c:ad6:d35f%22]) with
	mapi id 15.00.1210.000; Mon, 27 Feb 2017 06:49:04 +0000
From: "Sheheryar, Muhammad" <Muhammad_Sheheryar@mentor.com>
To: "M. Asselstine" <asselsm@mcmaster.ca>
Thread-Topic: [meta-virtualization] Building docker
Thread-Index: AQHSjOC21S9WUKNr/06RzWqb66GCBaF8D7AAgABheAA=
Date: Mon, 27 Feb 2017 06:49:04 +0000
Message-ID: <1488178144346.37842@mentor.com>
References: <cc3dc371bff6438ea13431dfe77b2531@SVR-IES-MBX-04.mgc.mentorg.com>,
	<CAPuovELn54FBCEv12XCQ9xvxvmrWBFUwBYNJJHGcY0E8Z45pLg@mail.gmail.com>
In-Reply-To: <CAPuovELn54FBCEv12XCQ9xvxvmrWBFUwBYNJJHGcY0E8Z45pLg@mail.gmail.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Building docker
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
X-List-Received-Date: Mon, 27 Feb 2017 06:49:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I am using Ubuntu 16.04 and the fido branch of yocto project for building d=
ocker.=0A=
=0A=
Regards,=0A=
=0A=
Muhammad Sheheryar Qureshi=0A=
________________________________________=0A=
From: asselsm@gmail.com <asselsm@gmail.com> on behalf of M. Asselstine <ass=
elsm@mcmaster.ca>=0A=
Sent: Monday, February 27, 2017 5:59 AM=0A=
To: Sheheryar, Muhammad=0A=
Cc: meta-virtualization@yoctoproject.org=0A=
Subject: Re: [meta-virtualization] Building docker=0A=
=0A=
On Wed, Feb 22, 2017 at 2:53 AM, Sheheryar, Muhammad=0A=
<Muhammad_Sheheryar@mentor.com> wrote:=0A=
> Hi Peter,=0A=
>=0A=
> Thanks for getting back. I am receiving the following error when trying t=
o=0A=
> build docker=0A=
>=0A=
> ERROR: Function failed: do_compile (log file is located at=0A=
> /var/mshehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linu=
x/golang-cross/1.3-r0/temp/log.do_compile.4734)=0A=
> ERROR: Logfile of failure stored in:=0A=
> /var/mshehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linu=
x/golang-cross/1.3-r0/temp/log.do_compile.4734=0A=
> Log data follows:=0A=
> | DEBUG: Executing shell function do_compile=0A=
> | GOARCH i586=0A=
> | CC_FOR_TARGET gcc=0A=
> | + set -e=0A=
> | + [ ! -f run.bash ]=0A=
> | + uname=0A=
> | + ld --version=0A=
> | + grep gold.* 2\.20=0A=
> | + [ -d /selinux -a -f /selinux/booleans/allow_execstack -a -x=0A=
> /usr/sbin/selinuxenabled ]=0A=
> | + [ -d /sys/fs/selinux -a -f /sys/fs/selinux/booleans/allow_execstack -=
a=0A=
> -x /usr/sbin/selinuxenabled ]=0A=
> | + uname -s=0A=
> | + [ Linux =3D=3D GNU/kFreeBSD ]=0A=
> | ./make.bash: 104: [: Linux: unexpected operator=0A=
=0A=
What OS and version as you using as the build host?=0A=
=0A=
Regards,=0A=
Mark=0A=
=0A=
> | + rm -f ./pkg/runtime/runtime_defs.go=0A=
> | + echo # Building C bootstrap tool.=0A=
> | # Building C bootstrap tool.=0A=
> | + echo cmd/dist=0A=
> | cmd/dist=0A=
> | + cd ..=0A=
> | + pwd=0A=
> | + export=0A=
> GOROOT=3D/var/mshehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-=
poky-linux/golang-cross/1.3-r0/go=0A=
> | +=0A=
> GOROOT_FINAL=3D/var/mshehery/Documents/git/new_fido/poky/build/tmp/sysroo=
ts/x86_64-linux/usr/lib/i586-poky-linux/go=0A=
> | +=0A=
> DEFGOROOT=3D-DGOROOT_FINAL=3D"/var/mshehery/Documents/git/new_fido/poky/b=
uild/tmp/sysroots/x86_64-linux/usr/lib/i586-poky-linux/go"=0A=
> | + mflag=3D=0A=
> | + uname=0A=
> | + [ Linux =3D=3D Darwin ]=0A=
> | ./make.bash: 124: [: Linux: unexpected operator=0A=
> | + type -t gcc=0A=
> | + type -t clang=0A=
> | + [ -z gcc  -a -z -t: not found=0A=
> | gcc is /usr/bin/gcc -a -n -t: not found=0A=
> | clang: not found ]=0A=
> | + gcc -O2 -Wall -Werror -o cmd/dist/dist -Icmd/dist=0A=
> -DGOROOT_FINAL=3D"/var/mshehery/Documents/git/new_fido/poky/build/tmp/sys=
roots/x86_64-linux/usr/lib/i586-poky-linux/go"=0A=
> cmd/dist/arm.c cmd/dist/buf.c cmd/dist/build.c cmd/dist/buildgc.c=0A=
> cmd/dist/buildgo.c cmd/dist/buildruntime.c cmd/dist/goc2c.c cmd/dist/main=
.c=0A=
> cmd/dist/plan9.c cmd/dist/unix.c cmd/dist/windows.c=0A=
> | + ./cmd/dist/dist env -p=0A=
> | go tool dist: unknown $GOARCH i586=0A=
> | + echo FAIL=3Dtrue=0A=
> | + eval FAIL=3Dtrue=0A=
> | + FAIL=3Dtrue=0A=
> | + [ true =3D true ]=0A=
> | + exit 1=0A=
> | WARNING: exit code 1 from a shell command.=0A=
> | ERROR: Function failed: do_compile (log file is located at=0A=
> /var/mshehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linu=
x/golang-cross/1.3-r0/temp/log.do_compile.4734)=0A=
> ERROR: Task 104=0A=
> (/var/mshehery/Documents/git/new_fido/poky/meta-virtualization/recipes-de=
vtools/go/golang-cross_1.3.bb,=0A=
> do_compile) failed with exit code '1'=0A=
> NOTE: Tasks Summary: Attempted 1617 tasks of which 1486 didn't need to be=
=0A=
> rerun and 1 failed.=0A=
> Waiting for 0 running tasks to finish:=0A=
>=0A=
> Summary: 1 task failed:=0A=
>=0A=
> /var/mshehery/Documents/git/new_fido/poky/meta-virtualization/recipes-dev=
tools/go/golang-cross_1.3.bb,=0A=
> do_compile=0A=
> Summary: There were 2 WARNING messages shown.=0A=
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.=
=0A=
>=0A=
> Regards,=0A=
>=0A=
> Muhammad Sheheryar Qureshi=0A=
>=0A=
>=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> meta-virtualization mailing list=0A=
> meta-virtualization@yoctoproject.org=0A=
> https://lists.yoctoproject.org/listinfo/meta-virtualization=0A=
>=0A=

