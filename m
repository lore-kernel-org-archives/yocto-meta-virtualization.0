Return-Path: <max.malisan.uk@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CEAB9E0094C; Tue, 18 Apr 2017 01:05:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (max.malisan.uk[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.170 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79158E00839
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Apr 2017 01:05:49 -0700 (PDT)
Received: by mail-io0-f170.google.com with SMTP id a103so182033935ioj.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Apr 2017 01:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=2T3GOBo36c5oFxsNrXtp108hphH1WehfaVzaa1ODUFY=;
	b=M/a2kbe+LUFImveiV+EZZ6Msr6431eWO6I2BdAncF2Or2aMM64jIFWV4oGLQoIP2m3
	RmUi1E+OH7ejmno8tmiGPppcipWjPP9YY6ewk+5w5ee3qe8Xq4oaouMAfVbedzApCcTx
	VKxT0wURos96h1RkC8T1neMHXvbpdjXkE5sWgVyHxAanRZJ4D1SEs9NgpciyWA0E7P40
	f92AISI2LYkitX6aEdNkaIDTpbmfMK6uYQJYMpC8ka/63xvH7ZagVwM87TtQd2FK6wFe
	CCxKAzcE8fe+WA5p9m/Q+XPUXDJr/4Bc9eirqMBV5DTsqBsaEl7KaZc2AOnxYG2W1nd2
	xjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2T3GOBo36c5oFxsNrXtp108hphH1WehfaVzaa1ODUFY=;
	b=NiVLVf3UZAr0GXiKgWYy7iPI58xX5zEd05rp1+ZPOK6ATq7HCIk3rv+UZWxuz0nBxQ
	tk4nWpHi6QGEbSMiPDUFCNUk/O/9tLTWyIpTls/IfEZLwfvypZynEVTRkXBsRlBxu9a/
	nPkclMpKWoIWNeVX47qbzEAFjynVAQt5fVX9O+JncFOJVU3K2PkjuYOw56fso5MHn649
	6mXVXOgcnzCqFr59N+hA3W7zDREd8j87+/216PLNx1WC/EnkXI8zRPo5FqNnqIvAX0GT
	xQL3fyKTC/n7i5ZmTJCybY1+q3c0QvGLn9QmPcAL9h8htVaIanDfwjBiEWC8WdkwRTvc
	s2Kg==
X-Gm-Message-State: AN3rC/7cvRb1PRHAVxWV9+Bg4juvtrSWBbbVedyRQFnOa4EtSN1o3m8e
	DOCS4EWGHQ0EouoOMQDQUqKw9oYkuBluQ66LPw==
X-Received: by 10.36.110.18 with SMTP id w18mr12312181itc.37.1492502749203;
	Tue, 18 Apr 2017 01:05:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.210.76 with HTTP; Tue, 18 Apr 2017 01:05:48 -0700 (PDT)
From: Massimiliano Malisan <max.malisan.uk@gmail.com>
Date: Tue, 18 Apr 2017 09:05:48 +0100
Message-ID: <CADM9VcsY1xjqGuuzH_=Kky3wP8aB3Cj1gBbtcPHKPRp3TwiO4A@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Problems building criu recipe for morty
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
X-List-Received-Date: Tue, 18 Apr 2017 08:05:52 -0000
Content-Type: multipart/alternative; boundary=001a114aa30431527b054d6c60e5

--001a114aa30431527b054d6c60e5
Content-Type: text/plain; charset=UTF-8

Hi all,

Forewords:
* I am learning to use Yocto, so maybe I am missing something that should
be obvious..
* I do not have any selinux support in my configuration as I don't need it
atm (and I suppose it isn't necessary, otherwise it should be in the
dependency list of the layer).
* The system I am building for uses sysvinit and not systemd as init (just
mentioning due to the systemd-related warning in the second problem, which
I deem unrelated to the error I get..).

I've been trying to build the criu recipe for morty (I have all
repositories: poky, meta-openembedded, meta-intel (I have a x86_64 Intel
CPU) and meta-virtualization - on morty branch) but I have some issues:

1) If I run the recipe "as is" I get the following error:

ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_patch: Command Error: 'quilt
--quiltrc /opt/yocto/virt-builder/meta-virt-builder/tmp/sysroots/x86_64-linux/etc/quiltrc
push' exited with 0  Output:
Applying patch disable-selinux.patch
can't find file to patch at input line 15
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Upstream-Status: Inappropriate [disable feature]
|
|It shows warning when build crius if libselinux has been built already:
|
|  WARNING: QA Issue: criu rdepends on libselinux, but it isn't a build
dependency? [build-deps]
|
|Apply this patch to disable selinux support when 'selinux' is not in
PACKAGECONF.
|
|Signed-off-by: Kai Kang <kai.kang@windriver.com>
|
|diff --git a/Makefile.config b/Makefile.config
|index ce4b8d8..3ac2780 100644
|--- a/Makefile.config
|+++ b/Makefile.config
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch disable-selinux.patch does not apply (enforce with -f)
ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_patch: Function failed:
patch_do_patch
ERROR: Logfile of failure stored in: /opt/yocto/virt-builder/meta-
virt-builder/tmp/work/corei7-64-poky-linux/criu/2.5+
gitAUTOINC+c031417255-r0/temp/log.do_patch.24372
ERROR: Task (/opt/yocto/repository/meta-virtualization/recipes-
containers/criu/criu_git.bb:do_patch) failed with exit code '1'


2) If I remove the patch reference from the recipe the compilation seems
run fine but in the end I get this error:

ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_package_qa: QA Issue: criu: The
compile log indicates that host include and/or library paths were used.
         Please check the log '/opt/yocto/virt-builder/meta-
virt-builder/tmp/work/corei7-64-poky-linux/criu/2.5+
gitAUTOINC+c031417255-r0/temp/log.do_compile' for more information.
[compile-host-path]
WARNING: criu-2.5+gitAUTOINC+c031417255-r0 do_package_qa: QA Issue:
/usr/libexec/criu/scripts/systemd-autofs-restart.sh contained in package
criu requires /bin/bash, but no providers found in RDEPENDS_criu?
[file-rdeps]
ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_package_qa: QA run found fatal
errors. Please consider fixing them.
ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_package_qa: Function failed:
do_package_qa
ERROR: Logfile of failure stored in: /opt/yocto/virt-builder/meta-
virt-builder/tmp/work/corei7-64-poky-linux/criu/2.5+
gitAUTOINC+c031417255-r0/temp/log.do_package_qa.27615
ERROR: Task (/opt/yocto/repository/meta-virtualization/recipes-
containers/criu/criu_git.bb:do_package_qa) failed with exit code '1'


Any idea on how to solve this?

Best regards,
    Max

--001a114aa30431527b054d6c60e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:12.8px">Hi all,</div><div style=3D=
"font-size:12.8px"><br></div><div style=3D"font-size:12.8px"><div>Forewords=
:=C2=A0</div><div>* I am learning to use Yocto, so maybe I am missing somet=
hing that should be obvious..=C2=A0</div><div>* I do not have any selinux s=
upport in my configuration as I don&#39;t need it atm (and I suppose it isn=
&#39;t necessary, otherwise it should be in the dependency list of the laye=
r).</div></div><div style=3D"font-size:12.8px">* The system I am building f=
or uses sysvinit and not systemd as init (just mentioning due to the system=
d-related warning in the second problem, which I deem unrelated to the erro=
r I get..).</div><div style=3D"font-size:12.8px"><br></div><div style=3D"fo=
nt-size:12.8px">I&#39;ve been trying to build the criu recipe for morty (I =
have all repositories: poky, meta-openembedded, meta-intel (I have a x86_64=
 Intel CPU) and meta-virtualization - on morty branch) but I have some issu=
es:</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:=
12.8px">1) If I run the recipe &quot;as is&quot; I get the following error:=
</div><div style=3D"font-size:12.8px"><br></div><blockquote style=3D"font-s=
ize:12.8px;margin:0px 0px 0px 40px;border:none;padding:0px"><div>ERROR: cri=
u-2.5+gitAUTOINC+<wbr>c031417255-r0 do_patch: Command Error: &#39;quilt --q=
uiltrc /opt/yocto/virt-builder/meta-<wbr>virt-builder/tmp/sysroots/x86_<wbr=
>64-linux/etc/quiltrc push&#39; exited with 0 =C2=A0Output:</div><div>Apply=
ing patch disable-selinux.patch</div><div>can&#39;t find file to patch at i=
nput line 15</div><div>Perhaps you used the wrong -p or --strip option?</di=
v><div>The text leading up to this was:</div><div>-------------------------=
-</div><div>|Upstream-Status: Inappropriate [disable feature]</div><div>|</=
div><div>|It shows warning when build crius if libselinux has been built al=
ready:</div><div>|</div><div>| =C2=A0WARNING: QA Issue: criu rdepends on li=
bselinux, but it isn&#39;t a build dependency? [build-deps]</div><div>|</di=
v><div>|Apply this patch to disable selinux support when &#39;selinux&#39; =
is not in PACKAGECONF.</div><div>|</div><div>|Signed-off-by: Kai Kang &lt;<=
a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriv=
er.com</a>&gt;</div><div>|</div><div>|diff --git a/Makefile.config b/Makefi=
le.config</div><div>|index ce4b8d8..3ac2780 100644</div><div>|--- a/Makefil=
e.config</div><div>|+++ b/Makefile.config</div><div>-----------------------=
---</div><div>No file to patch.=C2=A0 Skipping patch.</div><div>1 out of 1 =
hunk ignored</div><div>Patch disable-selinux.patch does not apply (enforce =
with -f)</div><div>ERROR: criu-2.5+gitAUTOINC+<wbr>c031417255-r0 do_patch: =
Function failed: patch_do_patch</div><div>ERROR: Logfile of failure stored =
in: /opt/yocto/virt-builder/meta-<wbr>virt-builder/tmp/work/corei7-<wbr>64-=
poky-linux/criu/2.5+<wbr>gitAUTOINC+c031417255-r0/temp/<wbr>log.do_patch.24=
372</div><div>ERROR: Task (/opt/yocto/repository/meta-<wbr>virtualization/r=
ecipes-<wbr>containers/criu/criu_git.bb:do<wbr>_patch) failed with exit cod=
e &#39;1&#39;</div></blockquote><div style=3D"font-size:12.8px"><br></div><=
div style=3D"font-size:12.8px">2) If I remove the patch reference from the =
recipe the compilation seems run fine but in the end I get this error:</div=
><div style=3D"font-size:12.8px"><br></div><blockquote style=3D"font-size:1=
2.8px;margin:0px 0px 0px 40px;border:none;padding:0px"><div>ERROR: criu-2.5=
+gitAUTOINC+<wbr>c031417255-r0 do_package_qa: QA Issue: criu: The compile l=
og indicates that host include and/or library paths were used.</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Please check the log &#39;/opt/yocto/virt=
-builder/meta-<wbr>virt-builder/tmp/work/corei7-<wbr>64-poky-linux/criu/2.5=
+<wbr>gitAUTOINC+c031417255-r0/temp/<wbr>log.do_compile&#39; for more infor=
mation. [compile-host-path]</div><div>WARNING: criu-2.5+gitAUTOINC+<wbr>c03=
1417255-r0 do_package_qa: QA Issue: /usr/libexec/criu/scripts/<wbr>systemd-=
autofs-restart.sh contained in package criu requires /bin/bash, but no prov=
iders found in RDEPENDS_criu? [file-rdeps]</div><div>ERROR: criu-2.5+gitAUT=
OINC+<wbr>c031417255-r0 do_package_qa: QA run found fatal errors. Please co=
nsider fixing them.</div><div>ERROR: criu-2.5+gitAUTOINC+<wbr>c031417255-r0=
 do_package_qa: Function failed: do_package_qa</div><div>ERROR: Logfile of =
failure stored in: /opt/yocto/virt-builder/meta-<wbr>virt-builder/tmp/work/=
corei7-<wbr>64-poky-linux/criu/2.5+<wbr>gitAUTOINC+c031417255-r0/temp/<wbr>=
log.do_package_qa.27615</div><div>ERROR: Task (/opt/yocto/repository/meta-<=
wbr>virtualization/recipes-<wbr>containers/criu/criu_git.bb:do<wbr>_package=
_qa) failed with exit code &#39;1&#39;</div></blockquote><div style=3D"font=
-size:12.8px"><br></div><div style=3D"font-size:12.8px">Any idea on how to =
solve this?</div><div style=3D"font-size:12.8px"><br></div><div style=3D"fo=
nt-size:12.8px">Best regards,</div><div style=3D"font-size:12.8px">=C2=A0 =
=C2=A0 Max</div></div>

--001a114aa30431527b054d6c60e5--
