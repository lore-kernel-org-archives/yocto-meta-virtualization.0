Return-Path: <bostancioglucevat@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0667AE00B31; Thu, 11 Jul 2019 12:58:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FROM_EXCESS_BASE64,
	HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bostancioglucevat[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.53 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 FROM_EXCESS_BASE64 From: base64 encoded unnecessarily
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E1E3E00A03
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2019 12:58:11 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id x19so1092469eda.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2019 12:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=nqwGCE3ECk48duvyjwbmG25mUp6BNqDtN0uDFOd72Sc=;
	b=o9QqPfx7n0+fKYTs9YdccpirRuiApbnfmtmxQaRmkKuOurv4LfEfMCYD2foUdYersO
	Nux/zHAkfhygUBlZxWWN/xT0M6/+URxJPHQL0JZsv2iFQT78PmI5V5M3vpY06dAlN064
	eQz79jfMrrGWlILNtygVbKInlYgENMu7m6+PcyerLggJVQSf9WeZnX9caCIECttx+GVw
	qSXXzW9JuLMkkSZFDXUYnxB3eT3cJjiasCN41TFKsTmGTRkoTEOpnY0rG24nSG129GkP
	KnqW9VL+U15PQe0a+XadLuRRlvZRGJSZ0loB9nfq3OgNSgYYI/bAnY0yYK7BYpTmm2TC
	hDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=nqwGCE3ECk48duvyjwbmG25mUp6BNqDtN0uDFOd72Sc=;
	b=abFZnDeh16nuGs/sfARz/ur9aU2Inu6Hq0jLF9InMlZFHTkHxVrESylA+1wF3oXB/A
	MH6zgxTgvOeB1tI7uAkMia1KtW4wEEc347OBPegLxkq1Bsv5Xf03Y3s0WYOF2qqCMi47
	EtGedkzvGGc1/fOrcjtK4+m/TC32l6o+aV5IQjPJIcoy4YKCZvrCJ4XYyzZ7vbULQL6o
	QKA7aPSvdD2vRXE8x+Ub2HzMAFNuUHFptvOoWxtNt59DpV1NEXbMfRmX/LkzsP7IZkkI
	MLF4qpwSoOB8U6LAhduwnEa0kxCaq8yzFv0ywwIfOO5VTI1gtdj0GFdmRKMP8nKIBFLC
	m8+g==
X-Gm-Message-State: APjAAAUbD0ZLKcwmD9etA9OO7fyoB6Vnt2/KthLXaKHx35St6v4MR/5E
	36BE0xch/bmMFbNIPSE38mSq3Rr78Wif2CHm9nhEAyoy
X-Google-Smtp-Source: APXvYqwrv1wRP1CBngHpnYnt1LMLU366Mg+Bv0jKU4TvXobZZGtJWC8zUN+cSxWyBlf+/4G/uPJBfhTyOzS4SKTEz24=
X-Received: by 2002:a50:b64a:: with SMTP id c10mr5421956ede.256.1562875090328; 
	Thu, 11 Jul 2019 12:58:10 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Date: Thu, 11 Jul 2019 22:57:59 +0300
Message-ID: <CABPcKDN4vbbTzwjxtiV=7t6OGh9NKPbCz065BbGcUAvcUMgX1w@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: runv compile error
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
X-List-Received-Date: Thu, 11 Jul 2019 19:58:14 -0000
Content-Type: multipart/alternative; boundary="000000000000965f51058d6d36de"

--000000000000965f51058d6d36de
Content-Type: text/plain; charset="UTF-8"

Hi,

meta-virtualization layer runv recipe problems as follows:
1. runv version is too old. since current runv recipe commit, they commited
lots of features. i didn't analyzed e2e what they have done and what this
commits brings us.
2. current runv cannot compiled for aarch64, x86 is fine.

i have tried as follows:
1. i updated runv & hyperstart recipes commits to the latest and there is a
several issues occuring during compile time.
2. i have found why recipe is not compiling, i just have to create little
patch and it's ready to go.

So, we can create a patch for current version of runv or i can create a
patch for update runv & compile-time errors for the new version.

I didn't list the features since runv current commit. I just want to ask
what is the strategy for this problem ?

Current version aarch64 compile error:
NOTE: Executing RunQueue Tasks
ERROR: runv-0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0
do_compile: oe_runmake failed
ERROR: runv-0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0
do_compile: Function failed: do_compile (log file is located at
/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/aarch64-poky-linux/runv/0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/temp/log.do_compile.12483)
ERROR: Logfile of failure stored in:
/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/aarch64-poky-linux/runv/0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/temp/log.do_compile.12483
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-64', 'arm-common', 'arm-64',
'common-linux', 'common-glibc', 'aarch64-linux', 'common']
| DEBUG: Executing shell function do_compile
| fff
|
/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/aarch64-poky-linux/runv/0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/runv-0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677
| NOTE: make -j 8 build-runv
| go build -tags "static_build  " -ldflags "-X main.gitCommit=`git describe
--dirty --always --tags 2> /dev/null || true` -X main.version=1.0.0" -o
runv ./cli/
| # github.com/hyperhq/runv/hypervisor/qemu
| src/import/vendor/src/
github.com/hyperhq/runv/hypervisor/qemu/qemu.go:293:22: too many arguments
in call to newNetworkAddSession
| have (*hypervisor.VmContext, *QemuContext, string, string, int, string,
string, int, int, chan hypervisor.VmEvent)
| want (*hypervisor.VmContext, *QemuContext, string, int, string, string,
int, int, chan<- hypervisor.VmEvent)
| Makefile:592: recipe for target 'build-runv' failed
| make: *** [build-runv] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/aarch64-poky-linux/runv/0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/temp/log.do_compile.12483)
ERROR: Task
(/home/cevat/Desktop/meta-virtualization-ci/yocto/meta-virtualization/recipes-core/runv/runv_git.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2404 tasks of which 2397 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

/home/cevat/Desktop/meta-virtualization-ci/yocto/meta-virtualization/recipes-core/runv/runv_git.bb:
do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--000000000000965f51058d6d36de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br><div>meta-virtualization layer runv recipe prob=
lems as follows:</div><div>1. runv version is too old. since current runv r=
ecipe commit, they commited lots of features. i didn&#39;t analyzed e2e wha=
t they have done and what this commits brings us.</div><div>2. current runv=
 cannot compiled for aarch64, x86 is fine.</div><div><br></div><div>i have =
tried as follows:</div><div>1. i updated runv &amp; hyperstart recipes comm=
its to the latest and there is a several issues occuring during compile tim=
e.</div><div>2. i have found why recipe is not compiling, i just have to cr=
eate little patch and it&#39;s ready to go.</div><div><br></div><div>So, we=
 can create a patch for current version of runv or i can create a patch for=
 update runv &amp; compile-time errors for the new version.</div><div><br><=
/div><div>I didn&#39;t list the features since runv current commit. I just =
want to ask what is the strategy for this problem ?</div><div><br></div><di=
v>Current version aarch64 compile error:<br>NOTE: Executing RunQueue Tasks<=
br>ERROR: runv-0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0 do_comp=
ile: oe_runmake failed<br>ERROR: runv-0.4.0+gitb360a686abc6c6e896382990ef1b=
93ef07c7a677-r0 do_compile: Function failed: do_compile (log file is locate=
d at /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/aa=
rch64-poky-linux/runv/0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/=
temp/log.do_compile.12483)<br>ERROR: Logfile of failure stored in: /home/ce=
vat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/aarch64-poky-li=
nux/runv/0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/temp/log.do_c=
ompile.12483<br>Log data follows:<br>| DEBUG: SITE files [&#39;endian-littl=
e&#39;, &#39;bit-64&#39;, &#39;arm-common&#39;, &#39;arm-64&#39;, &#39;comm=
on-linux&#39;, &#39;common-glibc&#39;, &#39;aarch64-linux&#39;, &#39;common=
&#39;]<br>| DEBUG: Executing shell function do_compile<br>| fff<br>| /home/=
cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/aarch64-poky-=
linux/runv/0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/runv-0.4.0+=
gitb360a686abc6c6e896382990ef1b93ef07c7a677<br>| NOTE: make -j 8 build-runv=
<br>| go build -tags &quot;static_build =C2=A0&quot; -ldflags &quot;-X main=
.gitCommit=3D`git describe --dirty --always --tags 2&gt; /dev/null || true`=
 -X main.version=3D1.0.0&quot; -o runv ./cli/<br>| # <a href=3D"http://gith=
ub.com/hyperhq/runv/hypervisor/qemu">github.com/hyperhq/runv/hypervisor/qem=
u</a><br>| src/import/vendor/src/<a href=3D"http://github.com/hyperhq/runv/=
hypervisor/qemu/qemu.go:293:22">github.com/hyperhq/runv/hypervisor/qemu/qem=
u.go:293:22</a>: too many arguments in call to newNetworkAddSession<br>| 	h=
ave (*hypervisor.VmContext, *QemuContext, string, string, int, string, stri=
ng, int, int, chan hypervisor.VmEvent)<br>| 	want (*hypervisor.VmContext, *=
QemuContext, string, int, string, string, int, int, chan&lt;- hypervisor.Vm=
Event)<br>| Makefile:592: recipe for target &#39;build-runv&#39; failed<br>=
| make: *** [build-runv] Error 2<br>| ERROR: oe_runmake failed<br>| WARNING=
: exit code 1 from a shell command.<br>| ERROR: Function failed: do_compile=
 (log file is located at /home/cevat/Desktop/meta-virtualization-ci/yocto/b=
uild_arm/tmp/work/aarch64-poky-linux/runv/0.4.0+gitb360a686abc6c6e896382990=
ef1b93ef07c7a677-r0/temp/log.do_compile.12483)<br>ERROR: Task (/home/cevat/=
Desktop/meta-virtualization-ci/yocto/meta-virtualization/recipes-core/runv/=
runv_git.bb:do_compile) failed with exit code &#39;1&#39;<br>NOTE: Tasks Su=
mmary: Attempted 2404 tasks of which 2397 didn&#39;t need to be rerun and 1=
 failed.<br><br>Summary: 1 task failed:<br>=C2=A0 /home/cevat/Desktop/meta-=
virtualization-ci/yocto/meta-virtualization/recipes-core/runv/runv_git.bb:d=
o_compile<br>Summary: There were 2 ERROR messages shown, returning a non-ze=
ro exit code.<br></div><div><br></div><div><br></div></div>

--000000000000965f51058d6d36de--
