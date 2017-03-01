Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF749E00998; Wed,  1 Mar 2017 00:06:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.172 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D390E00826
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 Mar 2017 00:06:00 -0800 (PST)
Received: by mail-ot0-f172.google.com with SMTP id w44so24556452otw.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 Mar 2017 00:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=b89p1HiEgTbmemsofJ7kmd77x8wKxv2n8RaP0XWJ3ek=;
	b=ZFD4UzZbTjdPYFNoV60rYT2U1G8OmQQEYqplSwt0+jl41bGhlWRQgZpkcCbCkzDY77
	ih1UxkgTxkgPAMnno3yc9tHiDh1PVTPhn6VNNEUQeW0tDesR40hBbor9kc+QxeJJNgLB
	RbPm5jhMDaw0EynhoASiL5l/4wuQX6u/QK8Y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=b89p1HiEgTbmemsofJ7kmd77x8wKxv2n8RaP0XWJ3ek=;
	b=AGgbPxdZORxbeGq6u6N0sb0FJfZUd9CQrrERLtDV0lfizCv5coj7YjGdHmCeV1uEnB
	UihHeZgA4ULr4FKPeQl0DD0/gZQruhvZD7uorLhQK+TvfgcE9afASSAdteXR0y+A1IxY
	G6dVSWH25MfR7ek9umaOpySzsBBvQski31i1VdaikZZ0/RI4MJvfTBO/Y+fJfXNvwYQ4
	n0U+yotquq0vPAce+uSUFqr7xCplKnb22qOuhVKc2YjAV41oW1yU1o90GeQHLUplQ2t5
	CSVqPzWq6u51S/aX5NNagGg+FFvYoECEIuNdn9PtjfdhhA6RCDgMDUB2rhZh4ais7zT/
	/isA==
X-Gm-Message-State: AMke39kly3TKKdmHOGu9EC8WscFOHIKEouVIL/ouWCKCwrsnGqywi6f4RzL93YqEd6KfXzTSupM4CPR0WDiR2oPg
X-Received: by 10.157.59.71 with SMTP id z65mr3784052otb.9.1488355560036; Wed,
	01 Mar 2017 00:06:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.16.99 with HTTP; Wed, 1 Mar 2017 00:05:59 -0800 (PST)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Wed, 1 Mar 2017 09:05:59 +0100
Message-ID: <CAFL6qn6HmUcfTsGRYmRuJ9zf10S4M2ygzWBky4R-rGGafFqE7A@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org, 
	meta-virtualization@yoctoproject.org
Subject: Building a Xen image on Yocto
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
X-List-Received-Date: Wed, 01 Mar 2017 08:06:02 -0000
Content-Type: multipart/alternative; boundary=001a11408c6074b4a20549a6c814

--001a11408c6074b4a20549a6c814
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm trying to build a Xen image on Yocto.

I have tried to execute bitbake xen-image-minimal command and the result
that I've got is the next one:

---------------------------------------------------------------------------------------------------------------
pello@pello-VirtualBox:/opt/yocto_GE/yocto_master_v2/poky/build$ bitbake
xen-image-minimal
Loading cache: 100%
|####################################################################################|
Time: 0:00:01
Loaded 2782 entries from dependency cache.
Parsing recipes: 100%
|##################################################################################|
Time: 0:00:01
Parsing of 2007 .bb files complete (2006 cached, 1 parsed). 2783 targets,
210 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for iasl-native (iasl-native,
acpica-native)
NOTE: consider defining a PREFERRED_PROVIDER entry to match iasl-native

Build Configuration:
BB_VERSION        = "1.33.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal"
TARGET_SYS        = "aarch64-poky-linux"
MACHINE           = "zcu102-zynqmp"
DISTRO            = "poky"
DISTRO_VERSION    = "2.2+snapshot-20170301"
TUNE_FEATURES     = "aarch64"
TARGET_FPU        = ""
meta
meta-poky
meta-yocto-bsp    = "master:3c83b56309ab419f8cda72c0711479f60f61439a"
meta-xilinx       = "master:be91292d155b734acbabb13501e4781a7211cdcb"
meta-virtualization = "master:c5cd21af5f27309c7926b781852e1ef22940a10d"
meta-oe
meta-networking
meta-filesystems
meta-python       = "master:a868418132f7cbaae477a3c7bc326979700a73eb"
oe-meta-go        = "master:0712320950adf810fb324d49fba5d49ae19981b0"
meta-selinux      = "master:3b5e6bd92ef9638ba06002dc785a30d0893d9966"

Initialising tasks: 100%
|###############################################################################|
Time: 0:00:15
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: libxml2-native-2.9.4-r0 do_compile: oe_runmake failed
ERROR: libxml2-native-2.9.4-r0 do_compile: Function failed: do_compile (log
file is located at
/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/temp/log.do_compile.7516)
ERROR: Logfile of failure stored in:
/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/temp/log.do_compile.7516
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 2
| ERROR: oe_runmake failed
| make  all-recursive
| make[1]: Entering directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build'
| Making all in include
| make[2]: Entering directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build/include'
| Making all in libxml
| make[3]: Entering directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build/include/libxml'
| make[3]: Nothing to be done for 'all'.
| make[3]: Leaving directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build/include/libxml'
| make[3]: Entering directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build/include'
| make[3]: Nothing to be done for 'all-am'.
| make[3]: Leaving directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build/include'
| make[2]: Leaving directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build/include'
| Making all in .
| make[2]: Entering directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build'
| ./x86_64-linux-libtool  --tag=CC   --mode=link gcc  -D_REENTRANT
-I/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
 -isystem/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/include
-O2 -pipe -pedantic -W -Wformat -Wno-format-extra-args -Wunused -Wimplicit
-Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wchar-subscripts
-Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align
-Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes
-Wnested-externs -Winline -Wredundant-decls -Wno-long-long
-Wl,--version-script=../libxml2-2.9.4/libxml2.syms -version-info 11:4:9
-ldl
-L/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib
-L/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/lib
-Wl,-rpath-link,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/lib
-Wl,-rpath,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib
-Wl,-rpath,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/lib
-Wl,-O1 -o libxml2.la -rpath
/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib
SAX.lo entities.lo encoding.lo error.lo parserInternals.lo parser.lo
tree.lo hash.lo list.lo xmlIO.lo xmlmemory.lo uri.lo valid.lo xlink.lo
HTMLparser.lo HTMLtree.lo debugXML.lo xpath.lo xpointer.lo xinclude.lo
nanohttp.lo nanoftp.lo  catalog.lo globals.lo threads.lo c14n.lo
xmlstring.lo buf.lo xmlregexp.lo xmlschemas.lo xmlschemastypes.lo
xmlunicode.lo  xmlreader.lo relaxng.lo dict.lo SAX2.lo xmlwriter.lo
legacy.lo chvalid.lo pattern.lo xmlsave.lo xmlmodule.lo schematron.lo
xzlib.lo
-L/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
-lz   -lm
| x86_64-linux-libtool:   error: 'xpath.lo' is not a valid libtool object
| Makefile:967: recipe for target 'libxml2.la' failed
| make[2]: *** [libxml2.la] Error 1
| make[2]: Leaving directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build'
| Makefile:1438: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
'/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build'
| Makefile:857: recipe for target 'all' failed
| make: *** [all] Error 2
| WARNING:
/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/temp/run.do_compile.7516:1
exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at
/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/temp/log.do_compile.7516)
ERROR: Task
(virtual:native:/opt/yocto_GE/yocto_master_v2/poky/meta/recipes-core/libxml/libxml2_2.9.4.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1053 tasks of which 1051 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

virtual:native:/opt/yocto_GE/yocto_master_v2/poky/meta/recipes-core/libxml/libxml2_2.9.4.bb:
do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
---------------------------------------------------------------------------------------------------------------

In the other hand, I have add all this layers in the bblayers.conf file:

------------------------------------------------------------
---------------------------------------------------
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
  "
------------------------------------------------------------
---------------------------------------------------

What should I do to solve the issue?
Looking forward to an answer,
Regards,
Pello

--001a11408c6074b4a20549a6c814
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Hi all,</span><div><span =
style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-size:1=
2.8px">I&#39;m trying to build a Xen image on Yocto.<br></span><div style=
=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">I have trie=
d to execute bitbake xen-image-minimal command and the result that I&#39;ve=
 got is the next one:</div><div style=3D"font-size:12.8px"><br></div><div s=
tyle=3D"font-size:12.8px"><div style=3D"font-size:12.8px">-----------------=
---------------------------------------------------------------------------=
-------------------</div></div><div><div><span style=3D"font-size:12.8px">p=
ello@pello-VirtualBox:/opt/yocto_GE/yocto_master_v2/poky/build$ bitbake xen=
-image-minimal</span></div><div><span style=3D"font-size:12.8px">Loading ca=
che: 100% |################################################################=
####################| Time: 0:00:01</span></div><div><span style=3D"font-si=
ze:12.8px">Loaded 2782 entries from dependency cache.</span></div><div><spa=
n style=3D"font-size:12.8px">Parsing recipes: 100% |#######################=
###########################################################| Time: 0:00:01<=
/span></div><div><span style=3D"font-size:12.8px">Parsing of 2007 .bb files=
 complete (2006 cached, 1 parsed). 2783 targets, 210 skipped, 0 masked, 0 e=
rrors.</span></div><div><span style=3D"font-size:12.8px">NOTE: Resolving an=
y missing task queue dependencies</span></div><div><span style=3D"font-size=
:12.8px">NOTE: multiple providers are available for iasl-native (iasl-nativ=
e, acpica-native)</span></div><div><span style=3D"font-size:12.8px">NOTE: c=
onsider defining a PREFERRED_PROVIDER entry to match iasl-native</span></di=
v><div><span style=3D"font-size:12.8px"><br></span></div><div><span style=
=3D"font-size:12.8px">Build Configuration:</span></div><div><span style=3D"=
font-size:12.8px">BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.33.1&qu=
ot;</span></div><div><span style=3D"font-size:12.8px">BUILD_SYS =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;</span></div><div><span style=
=3D"font-size:12.8px">NATIVELSBSTRING =C2=A0 =3D &quot;universal&quot;</spa=
n></div><div><span style=3D"font-size:12.8px">TARGET_SYS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;aarch64-poky-linux&quot;</span></div><div><span style=
=3D"font-size:12.8px">MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;=
zcu102-zynqmp&quot;</span></div><div><span style=3D"font-size:12.8px">DISTR=
O =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky&quot;</span></div=
><div><span style=3D"font-size:12.8px">DISTRO_VERSION =C2=A0 =C2=A0=3D &quo=
t;2.2+snapshot-20170301&quot;</span></div><div><span style=3D"font-size:12.=
8px">TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;aarch64&quot;</span></div><div><=
span style=3D"font-size:12.8px">TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &=
quot;&quot;</span></div><div><span style=3D"font-size:12.8px">meta =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></div><div><span style=3D"f=
ont-size:12.8px">meta-poky =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span></div><d=
iv><span style=3D"font-size:12.8px">meta-yocto-bsp =C2=A0 =C2=A0=3D &quot;m=
aster:3c83b56309ab419f8cda72c0711479f60f61439a&quot;</span></div><div><span=
 style=3D"font-size:12.8px">meta-xilinx =C2=A0 =C2=A0 =C2=A0 =3D &quot;mast=
er:be91292d155b734acbabb13501e4781a7211cdcb&quot;</span></div><div><span st=
yle=3D"font-size:12.8px">meta-virtualization =3D &quot;master:c5cd21af5f273=
09c7926b781852e1ef22940a10d&quot;</span></div><div><span style=3D"font-size=
:12.8px">meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span></div><div>=
<span style=3D"font-size:12.8px">meta-networking =C2=A0=C2=A0</span></div><=
div><span style=3D"font-size:12.8px">meta-filesystems =C2=A0</span></div><d=
iv><span style=3D"font-size:12.8px">meta-python =C2=A0 =C2=A0 =C2=A0 =3D &q=
uot;master:a868418132f7cbaae477a3c7bc326979700a73eb&quot;</span></div><div>=
<span style=3D"font-size:12.8px">oe-meta-go =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
&quot;master:0712320950adf810fb324d49fba5d49ae19981b0&quot;</span></div><di=
v><span style=3D"font-size:12.8px">meta-selinux =C2=A0 =C2=A0 =C2=A0=3D &qu=
ot;master:3b5e6bd92ef9638ba06002dc785a30d0893d9966&quot;</span></div><div><=
span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-s=
ize:12.8px">Initialising tasks: 100% |#####################################=
##########################################| Time: 0:00:15</span></div><div>=
<span style=3D"font-size:12.8px">NOTE: Executing SetScene Tasks</span></div=
><div><span style=3D"font-size:12.8px">NOTE: Executing RunQueue Tasks</span=
></div><div><span style=3D"font-size:12.8px">ERROR: libxml2-native-2.9.4-r0=
 do_compile: oe_runmake failed</span></div><div><span style=3D"font-size:12=
.8px">ERROR: libxml2-native-2.9.4-r0 do_compile: Function failed: do_compil=
e (log file is located at /opt/yocto_GE/yocto_master_v2/poky/build/tmp/work=
/x86_64-linux/libxml2-native/2.9.4-r0/temp/log.do_compile.7516)</span></div=
><div><span style=3D"font-size:12.8px">ERROR: Logfile of failure stored in:=
 /opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-nat=
ive/2.9.4-r0/temp/log.do_compile.7516</span></div><div><span style=3D"font-=
size:12.8px">Log data follows:</span></div><div><span style=3D"font-size:12=
.8px">| DEBUG: Executing shell function do_compile</span></div><div><span s=
tyle=3D"font-size:12.8px">| NOTE: make -j 2</span></div><div><span style=3D=
"font-size:12.8px">| ERROR: oe_runmake failed</span></div><div><span style=
=3D"font-size:12.8px">| make =C2=A0all-recursive</span></div><div><span sty=
le=3D"font-size:12.8px">| make[1]: Entering directory &#39;/opt/yocto_GE/yo=
cto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/buil=
d&#39;</span></div><div><span style=3D"font-size:12.8px">| Making all in in=
clude</span></div><div><span style=3D"font-size:12.8px">| make[2]: Entering=
 directory &#39;/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-li=
nux/libxml2-native/2.9.4-r0/build/include&#39;</span></div><div><span style=
=3D"font-size:12.8px">| Making all in libxml</span></div><div><span style=
=3D"font-size:12.8px">| make[3]: Entering directory &#39;/opt/yocto_GE/yoct=
o_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build/=
include/libxml&#39;</span></div><div><span style=3D"font-size:12.8px">| mak=
e[3]: Nothing to be done for &#39;all&#39;.</span></div><div><span style=3D=
"font-size:12.8px">| make[3]: Leaving directory &#39;/opt/yocto_GE/yocto_ma=
ster_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build/incl=
ude/libxml&#39;</span></div><div><span style=3D"font-size:12.8px">| make[3]=
: Entering directory &#39;/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work=
/x86_64-linux/libxml2-native/2.9.4-r0/build/include&#39;</span></div><div><=
span style=3D"font-size:12.8px">| make[3]: Nothing to be done for &#39;all-=
am&#39;.</span></div><div><span style=3D"font-size:12.8px">| make[3]: Leavi=
ng directory &#39;/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-=
linux/libxml2-native/2.9.4-r0/build/include&#39;</span></div><div><span sty=
le=3D"font-size:12.8px">| make[2]: Leaving directory &#39;/opt/yocto_GE/yoc=
to_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build=
/include&#39;</span></div><div><span style=3D"font-size:12.8px">| Making al=
l in .</span></div><div><span style=3D"font-size:12.8px">| make[2]: Enterin=
g directory &#39;/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-l=
inux/libxml2-native/2.9.4-r0/build&#39;</span></div><div><span style=3D"fon=
t-size:12.8px">| ./x86_64-linux-libtool =C2=A0--tag=3DCC =C2=A0 --mode=3Dli=
nk gcc =C2=A0-D_REENTRANT -I/opt/yocto_GE/yocto_master_v2/poky/build/tmp/wo=
rk/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib/pkgco=
nfig/../../../usr/include =C2=A0-isystem/opt/yocto_GE/yocto_master_v2/poky/=
build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/u=
sr/include -O2 -pipe -pedantic -W -Wformat -Wno-format-extra-args -Wunused =
-Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wchar-subscripts -=
Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-=
strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wneste=
d-externs -Winline -Wredundant-decls -Wno-long-long =C2=A0 -Wl,--version-sc=
ript=3D../libxml2-2.9.4/libxml2.syms -version-info 11:4:9 -ldl -L/opt/yocto=
_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r=
0/recipe-sysroot-native/usr/lib -L/opt/yocto_GE/yocto_master_v2/poky/build/=
tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/lib -Wl=
,-rpath-link,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux=
/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link,/opt=
/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2=
.9.4-r0/recipe-sysroot-native/lib -Wl,-rpath,/opt/yocto_GE/yocto_master_v2/=
poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-nat=
ive/usr/lib -Wl,-rpath,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x8=
6_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/lib -Wl,-O1 -o <a =
href=3D"http://libxml2.la">libxml2.la</a> -rpath /opt/yocto_GE/yocto_master=
_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/recipe-sysroot=
-native/usr/lib SAX.lo entities.lo encoding.lo error.lo parserInternals.lo =
parser.lo tree.lo hash.lo list.lo xmlIO.lo xmlmemory.lo uri.lo valid.lo xli=
nk.lo HTMLparser.lo HTMLtree.lo debugXML.lo xpath.lo xpointer.lo xinclude.l=
o nanohttp.lo nanoftp.lo =C2=A0catalog.lo globals.lo threads.lo c14n.lo xml=
string.lo buf.lo xmlregexp.lo xmlschemas.lo xmlschemastypes.lo xmlunicode.l=
o =C2=A0xmlreader.lo relaxng.lo dict.lo SAX2.lo xmlwriter.lo legacy.lo chva=
lid.lo pattern.lo xmlsave.lo xmlmodule.lo schematron.lo xzlib.lo =C2=A0 -L/=
opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-nativ=
e/2.9.4-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib -lz =C2=
=A0 -lm</span></div><div><span style=3D"font-size:12.8px">| x86_64-linux-li=
btool: =C2=A0 error: &#39;xpath.lo&#39; is not a valid libtool object</span=
></div><div><span style=3D"font-size:12.8px">| Makefile:967: recipe for tar=
get &#39;<a href=3D"http://libxml2.la">libxml2.la</a>&#39; failed</span></d=
iv><div><span style=3D"font-size:12.8px">| make[2]: *** [<a href=3D"http://=
libxml2.la">libxml2.la</a>] Error 1</span></div><div><span style=3D"font-si=
ze:12.8px">| make[2]: Leaving directory &#39;/opt/yocto_GE/yocto_master_v2/=
poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build&#39;</span><=
/div><div><span style=3D"font-size:12.8px">| Makefile:1438: recipe for targ=
et &#39;all-recursive&#39; failed</span></div><div><span style=3D"font-size=
:12.8px">| make[1]: *** [all-recursive] Error 1</span></div><div><span styl=
e=3D"font-size:12.8px">| make[1]: Leaving directory &#39;/opt/yocto_GE/yoct=
o_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/build&=
#39;</span></div><div><span style=3D"font-size:12.8px">| Makefile:857: reci=
pe for target &#39;all&#39; failed</span></div><div><span style=3D"font-siz=
e:12.8px">| make: *** [all] Error 2</span></div><div><span style=3D"font-si=
ze:12.8px">| WARNING: /opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86=
_64-linux/libxml2-native/2.9.4-r0/temp/run.do_compile.7516:1 exit 1 from &#=
39;exit 1&#39;</span></div><div><span style=3D"font-size:12.8px">| ERROR: F=
unction failed: do_compile (log file is located at /opt/yocto_GE/yocto_mast=
er_v2/poky/build/tmp/work/x86_64-linux/libxml2-native/2.9.4-r0/temp/log.do_=
compile.7516)</span></div><div><span style=3D"font-size:12.8px">ERROR: Task=
 (virtual:native:/opt/yocto_GE/yocto_master_v2/poky/meta/recipes-core/libxm=
l/libxml2_2.9.4.bb:do_compile) failed with exit code &#39;1&#39;</span></di=
v><div><span style=3D"font-size:12.8px">NOTE: Tasks Summary: Attempted 1053=
 tasks of which 1051 didn&#39;t need to be rerun and 1 failed.</span></div>=
<div><span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"=
font-size:12.8px">Summary: 1 task failed:</span></div><div><span style=3D"f=
ont-size:12.8px">=C2=A0 virtual:native:/opt/yocto_GE/yocto_master_v2/poky/m=
eta/recipes-core/libxml/libxml2_2.9.4.bb:do_compile</span></div><div><span =
style=3D"font-size:12.8px">Summary: There were 2 ERROR messages shown, retu=
rning a non-zero exit code.</span></div><div style=3D"font-size:12.8px">---=
---------------------------------------------------------------------------=
---------------------------------</div></div></div><div style=3D"font-size:=
12.8px"><br></div><div style=3D"font-size:12.8px"><div style=3D"font-size:1=
2.8px">In the other hand, I have add all this layers in the bblayers.conf f=
ile:</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size=
:12.8px">------------------------------<wbr>------------------------------<=
wbr>------------------------------<wbr>---------------------<br></div><div =
style=3D"font-size:12.8px"><div>BBLAYERS ?=3D &quot; \</div><div>=C2=A0 /op=
t/yocto_GE/yocto_master_v2/<wbr>poky/meta \</div><div>=C2=A0 /opt/yocto_GE/=
yocto_master_v2/<wbr>poky/meta-poky \</div><div>=C2=A0 /opt/yocto_GE/yocto_=
master_v2/<wbr>poky/meta-yocto-bsp \</div><div>=C2=A0 /opt/yocto_GE/yocto_m=
aster_v2/<wbr>poky/meta-xilinx \</div><div>=C2=A0 /opt/yocto_GE/yocto_maste=
r_v2/<wbr>poky/meta-virtualization \</div><div>=C2=A0 /opt/yocto_GE/yocto_m=
aster_v2/<wbr>poky/meta-openembedded/meta-oe \</div><div>=C2=A0 /opt/yocto_=
GE/yocto_master_v2/<wbr>poky/meta-openembedded/meta-<wbr>networking \</div>=
<div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky/meta-openembedded/meta-=
<wbr>filesystems \</div><div>=C2=A0 /opt/yocto_GE/yocto_master_v2/<wbr>poky=
/meta-openembedded/meta-<wbr>python \</div><div>=C2=A0 /opt/yocto_GE/yocto_=
master_v2/<wbr>poky/oe-meta-go \</div><div>=C2=A0 /opt/yocto_GE/yocto_maste=
r_v2/<wbr>poky/meta-selinux \</div><div>=C2=A0 &quot;</div></div><div style=
=3D"font-size:12.8px">------------------------------<wbr>------------------=
------------<wbr>------------------------------<wbr>---------------------<b=
r></div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:1=
2.8px">What should I do to solve the issue?</div><div style=3D"font-size:12=
.8px">Looking forward to an answer,</div><div style=3D"font-size:12.8px">Re=
gards,</div><div style=3D"font-size:12.8px">Pello</div></div></div>

--001a11408c6074b4a20549a6c814--
