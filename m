Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D935E00C97; Sun, 20 Aug 2017 22:06:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.181 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.181 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A010E00B72
	for <meta-virtualization@yoctoproject.org>;
	Sun, 20 Aug 2017 22:06:38 -0700 (PDT)
Received: by mail-yw0-f181.google.com with SMTP id s187so141289ywf.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 20 Aug 2017 22:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/9xreFYEY9cQHB6qg7NOIIK1waNIh0QwmhpmyGk0KBI=;
	b=qxjgs+GTsjTm2gXxymJzM26w+S9HjZlme7ezyJFkf7u0IORomNA0iDhknd4KoIWoKp
	vU5RX9MBB6696/k56bGqZPJ/i7EWFuYCMH4rO58VEN14Q4/+ONXnreLregPbJOX3rq32
	iECv52683jD5TDw9fPkiFIdkm0J5U8FRL225QEO1cR7mYMepvniF9yRsC42uMZzbgJ1s
	KO8OrVez7Dbz1LfW30c3OtAzJ4Ifu84JgTRhzSKtv+VwrBi57dlRrVRXHWgWwzQFfiCZ
	piQD9KrwrV+pBtRLxPU7mMQIVqQ6xFhLFknE3oEfvwpzkxCkI3MXeuXjATFIgDHQ2G+Z
	ASng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/9xreFYEY9cQHB6qg7NOIIK1waNIh0QwmhpmyGk0KBI=;
	b=g2wxw7AtpcfGStmG6uqTpddwM2qY1LHdbOWzc+sQC9oB1HDsZXBi67sreh8vjCxIYR
	RtEG0oBZ4nmKTRrglzKs0i1zZEFPhRpHYBj3geJO7gm8R+q/KceQVgpLMLzeYnW+qvlg
	EYUtfWrtdwTHTbWw4sKfcVRTpOMVABrMNWFPAaf9aEOytLnCaki9u3mEoRMD20nhxK1q
	RVm5VBzE7589AeKhds6NWJHJj9YQ02wu7AiMaUd/LPDccGAVx4Vawrw5sK42XRoCiXa6
	Bp8tVrAzCaFT8DzRGjIrOZ4Ch5ArIlVs2qyQHD825lOzt/X/cyJoWTXc+UhysgYoyNdO
	Jn5A==
X-Gm-Message-State: AHYfb5hbrm/ZspP5yjb8iD/VclbPkM4Dz7CidU6TZqNzv427TjPgrVJQ
	C7uYTn8d4rGB+nXkE9B14jVJiY9RJg==
X-Received: by 10.37.172.75 with SMTP id r11mr13430299ybd.312.1503291997886;
	Sun, 20 Aug 2017 22:06:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.175.4 with HTTP; Sun, 20 Aug 2017 22:06:37 -0700 (PDT)
In-Reply-To: <DM5PR12MB154859E8836C5AC6A4884F9ECF890@DM5PR12MB1548.namprd12.prod.outlook.com>
References: <DM5PR12MB154859E8836C5AC6A4884F9ECF890@DM5PR12MB1548.namprd12.prod.outlook.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 20 Aug 2017 22:06:37 -0700
Message-ID: <CACMJ4GbENnWuNJY8_SFqwqHzoTnXxsf+VgE0XbmNoYeUOUKFmA@mail.gmail.com>
To: Mo Bah <mobahbay@outlook.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: meta-virtualization branch to use for xen-image-minimal
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
X-List-Received-Date: Mon, 21 Aug 2017 05:06:40 -0000
Content-Type: multipart/alternative; boundary="f403045eb3de8722b005573c71a8"

--f403045eb3de8722b005573c71a8
Content-Type: text/plain; charset="UTF-8"

Mo

Just to give you an additional data point for your aim to build
xen-image-minimal, I just tried building xen-image-minimal using krogoth
since that's what you indicated was your plan, with success in the end but
a couple of nudges are needed along the way.

note: I did not use the full set of layers that you mention, as I think the
fewer layers involved, the greater the odds of success and I don't think
the other layers are necessary.

I used the "genericx86-64" MACHINE.

The changes I needed were:
* xen-image-minimal.bb needs SYSLINUXCFG changing to SYSLINUX_CFG
* ipxe fetch source needs changing to https at the moment as git isn't
currently working
* vgabios recipe compiles a tool ("biossums") that it then uses on the host
-- this seems iffy to me, but I was able to work around it by hand, by
deleting the binary and compiling the tool using "make", which was enough
to unblock progress for the rest of the build.

Here are my notes:

=========
# Using 64-bit debian jessie:
user@build-vm:~$ cat /etc/debian_version
8.8
user@build-vm:~$ uname -a
Linux build-vm 3.16.0-4-amd64 #1 SMP Debian 3.16.43-2 (2017-04-30) x86_64
GNU/Linux

# as root:
apt-get update
apt-get install build-essential chrpath diffstat gawk git libncurses5-dev
pkg-config subversion texi2html texinfo

# as build user:
cd /mnt/build
git clone git://git.yoctoproject.org/poky.git -b krogoth
cd poky

git clone git://git.openembedded.org/meta-openembedded -b krogoth
git clone git://git.yoctoproject.org/meta-virtualization -b krogoth

source ./oem-init-build-env

edit conf/bblayers.conf :
----
# POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
POKY_BBLAYERS_CONF_VERSION = "2"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /mnt/build/poky/meta \
  /mnt/build/poky/meta-poky \
  /mnt/build/poky/meta-yocto-bsp \
  /mnt/build/poky/meta-openembedded/meta-oe \
  /mnt/build/poky/meta-openembedded/meta-networking \
  /mnt/build/poky/meta-openembedded/meta-python \
  /mnt/build/poky/meta-virtualization \
  "
----

edit conf/local.conf, append:
----
MACHINE = "genericx86-64"
DISTRO_FEATURES_append = " xen"
----

# update the fetch source for ipxe as the git protocol is currently
failing, so use https:
sed 's,protocol=git,protocol=https,' -i ../meta-virtualization/recipes-
extended/ipxe/ipxe_git.bb

# fix SYSLINUXCFG => SYSLINUX_CFG in xen-image-minimal:
sed 's/SYSLINUXCFG/SYSLINUX_CFG/' -i ../meta-virtualization/recipes-
extended/images/xen-image-minimal.bb

bitbake xen-image-minimal

# vgabios build can fail if your host mismatches your target; if so, try
this workaround:
cd tmp/work/core2-64-poky-linux/vgabios/0.7a-r0/vgabios-0.7a
rm biossums
make biossums
cd -
bitbake vgabios

bitbake xen-image-minimal
# => build success!

I may get some time to test building with a more recent branch later this
week. pyro was ok when I was testing Xen 4.9 work last week, albeit that
with a different MACHINE.

Christopher


On Fri, Aug 11, 2017 at 12:25 PM, Mo Bah <mobahbay@outlook.com> wrote:

> Hi Everyone,
>
> I am trying to build xen-image-minimal out of Yocto and I did checkout of
> the master branch of the meta-virtualization layer.
>
>
> But when doing, 'bitbake xen-image-minimal', I am seeing the following
> error.
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> *| make[5]: Leaving directory
> '/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86/cpu'
> | make[4]: Leaving directory
> '/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86'
> |
> /home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/Rules.mk:166:
> recipe for target
> '/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86/built_in.o'
> failed | make[3]: ***
> [/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86/built_in.o]
> Error 2 | make[3]: Leaving directory
> '/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/arch/x86'
> | Makefile:135: recipe for target
> '/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/xen'
> failed | make[2]: ***
> [/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen/xen]
> Error 2 | make[2]: Leaving directory
> '/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen'
> | Makefile:45: recipe for target 'install' failed | make[1]: *** [install]
> Error 2 | make[1]: Leaving directory
> '/home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/xen-4.8.0/xen'
> | Makefile:97: recipe for target 'install-xen' failed | make: ***
> [install-xen] Error 2 | ERROR: oe_runmake failed | WARNING: exit code 1
> from a shell command. | ERROR: Function failed: do_compile (log file is
> located at
> /home/m/grxen/poky/build/tmp-glibc/work/core2-64-oe-linux/xen/4.8.0-r0/temp/log.do_compile.30351)
> ERROR: Task
> (/home/m/grxen/poky/meta-virtualization/recipes-extended/xen/xen_4.8.0.bb:do_compile)
> failed with exit code '1' NOTE: Tasks Summary: Attempted 2081 tasks of
> which 1387 didn't need to be rerun and 1 failed. Summary: 1 task failed:
> /home/m/grxen/poky/meta-virtualization/recipes-extended/xen/xen_4.8.0.bb:do_compile
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.*
>
> Is the master branch of meta-virtualization layer having issues with
> 'xen-image-minimal'?
>
> I tried the 'bitbake xen-image-minimal' by putting the *'MACHINE ?=
> "intel-corei7-64"* and *MACHINE ?= "genericx86-64" *and *DISTRO_FEATURES_append
> = " xen"* in the conf/local.conf.
>
> And the bblayers.conf looks like:
> BBLAYERS ?= " \
>   /home/m/grxen/poky/meta \
>   /home/m/grxen/poky/meta-poky \
>   /home/m/grxen/poky/meta-yocto-bsp \
>   /home/m/grxen/poky/meta-openembedded/meta-oe \
>   /home/m/grxen/poky/meta-openembedded/meta-python \
>   /home/m/grxen/poky/meta-openembedded/meta-networking \
>   /home/m/grxen/poky/meta-openembedded/meta-filesystems \
>   /home/m/grxen/poky/meta-virtualization \
>   /home/m/grxen/poky/oe-meta-go \
>   /home/m/grxen/poky/openembedded-core/meta \
>   /home/m/grxen/poky/openembedded-core/meta-selftest \
>   /home/m/grxen/poky/openembedded-core/meta-skeleton \
>   /home/m/grxen/poky/meta-selinux \
>   "
>
> And all the layers have been downloaded as per documentation mentioned in
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about/
>
> meta-virtualization - Layer enabling hypervisor ...
> <http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about/>
> git.yoctoproject.org
> Layer enabling hypervisor, virtualization tool stack, and cloud support.
> git repository hosting
> Could you suggest which branch of meta-virtualization would work for
> 'xen-image-minimal' while doing bitbake?
> Currently, I am trying with git checkout -b krogoth origin/krogoth branch.
>
> Thanks
> M
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>

--f403045eb3de8722b005573c71a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Mo<br><br></div>Just to give you an additio=
nal data point for your aim to build xen-image-minimal, I just tried buildi=
ng xen-image-minimal using krogoth since that&#39;s what you indicated was =
your plan, with success in the end but a couple of nudges are needed along =
the way.<br><br>note: I did not use the full set of layers that you mention=
, as I think the fewer layers involved, the greater the odds of success and=
 I don&#39;t think the other layers are necessary.<br><br></div><div>I used=
 the &quot;genericx86-64&quot; MACHINE.<br></div><div><br></div><div>The ch=
anges I needed were:<br></div><div>* <a href=3D"http://xen-image-minimal.bb=
">xen-image-minimal.bb</a> needs SYSLINUXCFG changing to SYSLINUX_CFG<br></=
div><div>* ipxe fetch source needs changing to https at the moment as git i=
sn&#39;t currently working<br></div><div>* vgabios recipe compiles a tool (=
&quot;biossums&quot;) that it then uses on the host -- this seems iffy to m=
e, but I was able to work around it by hand, by deleting the binary and com=
piling the tool using &quot;make&quot;, which was enough to unblock progres=
s for the rest of the build.<br><br></div><div>Here are my notes:<br><br>=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br># Using 64-bit debian jessie:<br>user@build-=
vm:~$ cat /etc/debian_version <br>8.8<br>user@build-vm:~$ uname -a<br>Linux=
 build-vm 3.16.0-4-amd64 #1 SMP Debian 3.16.43-2 (2017-04-30) x86_64 GNU/Li=
nux<br><br># as root:<br>apt-get update<br>apt-get install build-essential =
chrpath diffstat gawk git libncurses5-dev pkg-config subversion texi2html t=
exinfo<br><br># as build user:<br>cd /mnt/build<br>git clone git://<a href=
=3D"http://git.yoctoproject.org/poky.git" target=3D"_blank">git.yoctoprojec=
t.org/<wbr>poky.git</a> -b krogoth<br></div><div>cd poky<br><br>git clone g=
it://<a href=3D"http://git.openembedded.org/meta-openembedded" target=3D"_b=
lank">git.openembedded.org/<wbr>meta-openembedded</a> -b krogoth<br></div><=
div>git clone git://<a href=3D"http://git.yoctoproject.org/meta-virtualizat=
ion" target=3D"_blank">git.yoctoproject.org/<wbr>meta-virtualization</a> -b=
 krogoth<br></div><div><br>source ./oem-init-build-env<br><br>edit conf/bbl=
ayers.conf :<br>----<br># POKY_BBLAYERS_CONF_VERSION is increased each time=
 build/conf/bblayers.conf<br># changes incompatibly<br>POKY_BBLAYERS_CONF_V=
ERSION =3D &quot;2&quot;<br><br>BBPATH =3D &quot;${TOPDIR}&quot;<br>BBFILES=
 ?=3D &quot;&quot;<br><br>BBLAYERS ?=3D &quot; \<br>=C2=A0 /mnt/build/poky/=
meta \<br>=C2=A0 /mnt/build/poky/meta-poky \<br>=C2=A0 /mnt/build/poky/meta=
-yocto-bsp \<br>=C2=A0 /mnt/build/poky/meta-<wbr>openembedded/meta-oe \<br>=
=C2=A0 /mnt/build/poky/meta-<wbr>openembedded/meta-networking \<br>=C2=A0 /=
mnt/build/poky/meta-<wbr>openembedded/meta-python \<br>=C2=A0 /mnt/build/po=
ky/meta-<wbr>virtualization \<br>=C2=A0 &quot;<br>----<br><br>edit conf/loc=
al.conf, append:<br>----<br>MACHINE =3D &quot;genericx86-64&quot;<br>DISTRO=
_FEATURES_append =3D &quot; xen&quot;<br>----<br><br># update the fetch sou=
rce for ipxe as the git protocol is currently failing, so use https:<br>sed=
 &#39;s,protocol=3Dgit,protocol=3D<wbr>https,&#39; -i ../meta-virtualizatio=
n/recipes-<wbr>extended/ipxe/<a href=3D"http://ipxe_git.bb" target=3D"_blan=
k">ipxe_git.bb</a><br><br># fix SYSLINUXCFG =3D&gt; SYSLINUX_CFG in xen-ima=
ge-minimal:<br>sed &#39;s/SYSLINUXCFG/SYSLINUX_CFG/&#39; -i ../meta-virtual=
ization/recipes-<wbr>extended/images/<a href=3D"http://xen-image-minimal.bb=
" target=3D"_blank">xen-image-<wbr>minimal.bb</a><br><br>bitbake xen-image-=
minimal<br><br># vgabios build can fail if your host mismatches your target=
; if so, try this workaround:<br>cd tmp/<wbr>work/core2-64-poky-linux/<wbr>=
vgabios/0.7a-r0/vgabios-0.7a<br>rm biossums<br>make biossums<br>cd -<br>bit=
bake vgabios<br><br>bitbake xen-image-minimal<br></div><div># =3D&gt; build=
 success!<br></div><br></div>I may get some time to test building with a mo=
re recent branch later this week. pyro was ok when I was testing Xen 4.9 wo=
rk last week, albeit that with a different MACHINE.<br><div><br>Christopher=
<br><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Fri, Aug 11, 2017 at 12:25 PM, Mo Bah <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mobahbay@outlook.com" target=3D"_blank">mobahbay@outlook.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">




<div dir=3D"ltr">
Hi Everyone,
<div id=3D"m_-8948539386113454725divtagdefaultwrapper" style=3D"font-size:1=
2pt;color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-serif,&quot;EmojiFo=
nt&quot;,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColor=
Emoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols" d=
ir=3D"ltr">
<p>I am trying to build xen-image-minimal out of Yocto and I did checkout o=
f the master branch of the meta-virtualization layer.
<br>
</p>
<p><br>
</p>
<p>But when doing, &#39;bitbake xen-image-minimal&#39;, I am seeing the fol=
lowing error.</p>
<p><br>
</p>
<div><b>| make[5]: Leaving directory &#39;/home/m/grxen/poky/build/tmp-<wbr=
>glibc/work/core2-64-oe-linux/<wbr>xen/4.8.0-r0/xen-4.8.0/xen/<wbr>arch/x86=
/cpu&#39;<br>
| make[4]: Leaving directory &#39;/home/m/grxen/poky/build/tmp-<wbr>glibc/w=
ork/core2-64-oe-linux/<wbr>xen/4.8.0-r0/xen-4.8.0/xen/<wbr>arch/x86&#39;<br=
>
| /home/m/grxen/poky/build/tmp-<wbr>glibc/work/core2-64-oe-linux/<wbr>xen/4=
.8.0-r0/xen-4.8.0/xen/<wbr>Rules.mk:166: recipe for target &#39;/home/m/grx=
en/poky/build/tmp-<wbr>glibc/work/core2-64-oe-linux/<wbr>xen/4.8.0-r0/xen-4=
.8.0/xen/<wbr>arch/x86/built_in.o&#39; failed<br>
| make[3]: *** [/home/m/grxen/poky/build/tmp-<wbr>glibc/work/core2-64-oe-li=
nux/<wbr>xen/4.8.0-r0/xen-4.8.0/xen/<wbr>arch/x86/built_in.o] Error 2<br>
| make[3]: Leaving directory &#39;/home/m/grxen/poky/build/tmp-<wbr>glibc/w=
ork/core2-64-oe-linux/<wbr>xen/4.8.0-r0/xen-4.8.0/xen/<wbr>arch/x86&#39;<br=
>
| Makefile:135: recipe for target &#39;/home/m/grxen/poky/build/tmp-<wbr>gl=
ibc/work/core2-64-oe-linux/<wbr>xen/4.8.0-r0/xen-4.8.0/xen/<wbr>xen&#39; fa=
iled<br>
| make[2]: *** [/home/m/grxen/poky/build/tmp-<wbr>glibc/work/core2-64-oe-li=
nux/<wbr>xen/4.8.0-r0/xen-4.8.0/xen/<wbr>xen] Error 2<br>
| make[2]: Leaving directory &#39;/home/m/grxen/poky/build/tmp-<wbr>glibc/w=
ork/core2-64-oe-linux/<wbr>xen/4.8.0-r0/xen-4.8.0/xen&#39;<br>
| Makefile:45: recipe for target &#39;install&#39; failed<br>
| make[1]: *** [install] Error 2<br>
| make[1]: Leaving directory &#39;/home/m/grxen/poky/build/tmp-<wbr>glibc/w=
ork/core2-64-oe-linux/<wbr>xen/4.8.0-r0/xen-4.8.0/xen&#39;<br>
| Makefile:97: recipe for target &#39;install-xen&#39; failed<br>
| make: *** [install-xen] Error 2<br>
| ERROR: oe_runmake failed<br>
| WARNING: exit code 1 from a shell command.<br>
| ERROR: Function failed: do_compile (log file is located at /home/m/grxen/=
poky/build/tmp-<wbr>glibc/work/core2-64-oe-linux/<wbr>xen/4.8.0-r0/temp/log=
.do_<wbr>compile.30351)<br>
ERROR: Task (/home/m/grxen/poky/meta-<wbr>virtualization/recipes-<wbr>exten=
ded/xen/xen_4.8.0.bb:do_<wbr>compile) failed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 2081 tasks of which 1387 didn&#39;t need to =
be rerun and 1 failed.<br>
<br>
Summary: 1 task failed:<br>
=C2=A0 /home/m/grxen/poky/meta-<wbr>virtualization/recipes-<wbr>extended/xe=
n/xen_4.8.0.bb:do_<wbr>compile<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.=
</b></div>
<br>
Is the master branch of meta-virtualization layer having issues with &#39;x=
en-image-minimal&#39;?
<br>
<br>
I tried the &#39;bitbake xen-image-minimal&#39; by putting the <b>&#39;<spa=
n>MACHINE ?=3D &quot;intel-corei7-64</span>&quot;</b> and
<span><b>MACHINE ?=3D &quot;genericx86-64&quot; </b>and <span><span><b>DIST=
RO_FEATURES_append =3D &quot; xen&quot;</b></span></span>
<b></b>in the conf/local.conf.<br>
<br>
And the bblayers.conf looks like:<br>
<div>BBLAYERS ?=3D &quot; \<br>
=C2=A0 /home/m/grxen/poky/meta \<br>
=C2=A0 /home/m/grxen/poky/meta-poky \<br>
=C2=A0 /home/m/grxen/poky/meta-yocto-<wbr>bsp \<br>
=C2=A0 /home/m/grxen/poky/meta-<wbr>openembedded/meta-oe \ <br>
=C2=A0 /home/m/grxen/poky/meta-<wbr>openembedded/meta-python \ <br>
=C2=A0 /home/m/grxen/poky/meta-<wbr>openembedded/meta-networking \ <br>
=C2=A0 /home/m/grxen/poky/meta-<wbr>openembedded/meta-filesystems \ <br>
=C2=A0 /home/m/grxen/poky/meta-<wbr>virtualization \<br>
=C2=A0 /home/m/grxen/poky/oe-meta-go \<br>
=C2=A0 /home/m/grxen/poky/<wbr>openembedded-core/meta \ <br>
=C2=A0 /home/m/grxen/poky/<wbr>openembedded-core/meta-<wbr>selftest \<br>
=C2=A0 /home/m/grxen/poky/<wbr>openembedded-core/meta-<wbr>skeleton \ <br>
=C2=A0 /home/m/grxen/poky/meta-<wbr>selinux \ <br>
=C2=A0 &quot;<br>
</div>
<br>
And all the layers have been downloaded as per documentation mentioned in <=
a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/abo=
ut/" class=3D"m_-8948539386113454725OWAAutoLink" id=3D"m_-89485393861134547=
25LPlnk804212" target=3D"_blank">
http://git.yoctoproject.org/<wbr>cgit/cgit.cgi/meta-<wbr>virtualization/abo=
ut/</a> <br>
<br>
<div id=3D"m_-8948539386113454725LPBorder_GT_15024542053840.226445162272678=
64" style=3D"margin-bottom:20px;overflow:auto;width:100%;text-indent:0px">
<table id=3D"m_-8948539386113454725LPContainer_15024542053710.3007271333312=
367" style=3D"width:90%;background-color:rgb(255,255,255);overflow:auto;pad=
ding-top:20px;padding-bottom:20px;margin-top:20px;border-top:1px dotted rgb=
(200,200,200);border-bottom:1px dotted rgb(200,200,200)" cellspacing=3D"0">
<tbody>
<tr style=3D"border-spacing:0px" valign=3D"top">
<td id=3D"m_-8948539386113454725TextCell_15024542053750.7529949949566461" s=
tyle=3D"vertical-align:top;padding:0px;display:table-cell" colspan=3D"2">
<div id=3D"m_-8948539386113454725LPRemovePreviewContainer_15024542053760.90=
21992851707933"></div>
<div id=3D"m_-8948539386113454725LPTitle_15024542053760.9987794121240315" s=
tyle=3D"color:rgb(0,120,215);font-weight:400;font-size:21px;font-family:&qu=
ot;wf_segoe-ui_light&quot;,&quot;Segoe UI Light&quot;,&quot;Segoe WP Light&=
quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;lin=
e-height:21px">
<a id=3D"m_-8948539386113454725LPUrlAnchor_15024542053790.9569886343941635"=
 style=3D"text-decoration:none" href=3D"http://git.yoctoproject.org/cgit/cg=
it.cgi/meta-virtualization/about/" target=3D"_blank">meta-virtualization - =
Layer enabling hypervisor ...</a></div>
<div id=3D"m_-8948539386113454725LPMetadata_15024542053810.9906985067008547=
" style=3D"margin:10px 0px 16px;color:rgb(102,102,102);font-weight:400;font=
-family:&quot;wf_segoe-ui_normal&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&=
quot;,Tahoma,Arial,sans-serif;font-size:14px;line-height:14px">
<a href=3D"http://git.yoctoproject.org" target=3D"_blank">git.yoctoproject.=
org</a></div>
<div id=3D"m_-8948539386113454725LPDescription_15024542053820.5467038874994=
977" style=3D"display:block;color:rgb(102,102,102);font-weight:400;font-fam=
ily:&quot;wf_segoe-ui_normal&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot=
;,Tahoma,Arial,sans-serif;font-size:14px;line-height:20px;max-height:100px;=
overflow:hidden">
Layer enabling hypervisor, virtualization tool stack, and cloud support. gi=
t repository hosting</div>
</td>
</tr>
</tbody>
</table>
</div>
Could you suggest which branch of meta-virtualization would work for &#39;x=
en-image-minimal&#39; while doing bitbake?<br>
Currently, I am trying with <span>git checkout -b krogoth origin/krogoth</s=
pan> branch.<br>
<br>
Thanks<span class=3D"HOEnZb"><font color=3D"#888888"><br>
M<br>
<br>
<br>
<br>
</font></span></span><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<p></p>
</div>
</div>

<br>--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
<br></blockquote></div><br></div>

--f403045eb3de8722b005573c71a8--
