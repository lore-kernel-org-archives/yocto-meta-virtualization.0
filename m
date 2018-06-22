Return-Path: <rpjday@crashcourse.ca>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD611E00AE6; Fri, 22 Jun 2018 05:18:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	T_DKIM_INVALID autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 T_DKIM_INVALID DKIM-Signature header exists but is not valid
X-Greylist: delayed 1795 seconds by postgrey-1.32 at yocto-www;
	Fri, 22 Jun 2018 05:18:13 PDT
Received: from cpanel4.indieserve.net (cpanel4.indieserve.net [199.212.143.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06F1FE0097C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Jun 2018 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default;
	h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r8P99Pg0cY24IXITmc9YYGUEqlG0851vHQR6xPCZXig=;
	b=L6s9Wak4rbL8bWEQYTRMYvdYHO
	Hv8EBPhb8O16ww3vIuFeflyoKwNJ2zrnepCy4LTzeTK+2btM7o8yMNKR5sKIYIza7Osoc234/2Mha
	78JW8Mnn70zZwgmTdxv/BW5XA40TxoLyL/LS5aDCeLgfBZ8EwhGcKIoJZCkrr/kJKpHzfFbleGizA
	QXa5sjF8jPE+mYaqNJYfiSemapt9l48HJUeq0azyKXoT5FuEZ/IGMDhpAP6eZNX7DPVctUl3cLSjj
	5Cnr7PY+eqz1xGpBjMwM//vVsTc1DtlElmzdoT+UlnRrSsQR9X5LF8I6z0nciglZrCPPAYYphobfn
	DNFsdJtw==;
Received: from cpeac202e043973-cmac202e043970.cpe.net.cable.rogers.com
	([174.112.22.87]:46608 helo=localhost.localdomain)
	by cpanel4.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91)
	(envelope-from <rpjday@crashcourse.ca>) id 1fWKY1-00A3D5-VK
	for meta-virtualization@yoctoproject.org;
	Fri, 22 Jun 2018 07:48:16 -0400
Date: Fri, 22 Jun 2018 07:48:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: meta-virtualization@yoctoproject.org
Message-ID: <alpine.LFD.2.21.1806220744150.31293@localhost.localdomain>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=0.6
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel4.indieserve.net
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel4.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel4.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: build error, iasl-native, fully-updated fedora 28
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
X-List-Received-Date: Fri, 22 Jun 2018 12:18:15 -0000
Content-Type: multipart/mixed; boundary="8323328-1394924706-1529668094=:31293"

--8323328-1394924706-1529668094=:31293
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT


  building with wind river's pulsar linux, target x86_64, and
iasl-native build fails as below. this is with gcc-8.1.1, and this
appears to be a generic enough issue that i thought i would ask about
it here rather than at the pulsar linux github page.

  thoughts?

WARNING: Layer skeleton should set LAYERSERIES_COMPAT_skeleton in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer external-binaries should set LAYERSERIES_COMPAT_external-binaries in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer refkit-extra should set LAYERSERIES_COMPAT_refkit-extra in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer iot-cloud should set LAYERSERIES_COMPAT_iot-cloud in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer metagw should set LAYERSERIES_COMPAT_metagw in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer up-board should set LAYERSERIES_COMPAT_up-board in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer wrlabs-integration should set LAYERSERIES_COMPAT_wrlabs-integration in its conf/layer.conf file to list the core layer names it is compatible with.
NOTE: Started PRServer with DBfile: /home/rpjday/github/pulsar/wr-core/build-intel-x86/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 35135, PID: 30586
WARNING: Layer skeleton should set LAYERSERIES_COMPAT_skeleton in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer external-binaries should set LAYERSERIES_COMPAT_external-binaries in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer refkit-extra should set LAYERSERIES_COMPAT_refkit-extra in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer iot-cloud should set LAYERSERIES_COMPAT_iot-cloud in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer metagw should set LAYERSERIES_COMPAT_metagw in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer up-board should set LAYERSERIES_COMPAT_up-board in its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer wrlabs-integration should set LAYERSERIES_COMPAT_wrlabs-integration in its conf/layer.conf file to list the core layer names it is compatible with.
Loading cache...done.
Loaded 4912 entries from dependency cache.
Parsing recipes...done.
Parsing of 3683 .bb files complete (3679 cached, 4 parsed). 4916 targets, 89 skipped, 5 masked, 0 errors.
WARNING: No recipes available for:
  /home/rpjday/github/pulsar/wr-core/layers/meta-cloud-services/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/meta-cloud-services/meta-openstack/recipes-kernel/linux/linux-yocto_4.10.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/meta-cloud-services/meta-openstack/recipes-kernel/linux/linux-yocto_4.4.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/meta-cloud-services/meta-openstack/recipes-kernel/linux/linux-yocto_4.9.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/meta-gateway/recipes-core-luci/busybox/busybox_1.22.1.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/meta-gateway/recipes-kernel/kernel/linux-yocto-rt_4.9.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/meta-gateway/recipes-kernel/kernel/linux-yocto_4.9.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/meta-gateway/recipes-navigation/gpsd/gpsd_3.16.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-bsp/shim/shim_git.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-containers/lxc/lxc_2.0.%.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-core/dbus/dbus_1.10.20.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-core/util-linux/util-linux_2.30.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-extended/libsolv/libsolv_0.6.28.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-extended/libvirt/libvirt_1.3.5.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-extended/man-pages/man-pages_4.11.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-hac/haccmds/haccmds_1.0.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-kernel/linux/linux-yocto-rt_4.9.bbappend
  /home/rpjday/github/pulsar/wr-core/layers/wrlabs-integration/recipes-kernel/linux/linux-yocto_4.9.bbappend
NOTE: Multiple providers are available for iasl-native (iasl-native, acpica-native)
Consider defining a PREFERRED_PROVIDER entry to match iasl-native
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.39.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "fedora-28"
TARGET_SYS           = "x86_64-wrs-linux"
MACHINE              = "intel-corei7-64"
DISTRO               = "Pulsar-Linux"
DISTRO_VERSION       = "10.17.41.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 = "HEAD:b34e86b4ee13d53f09d558e613d5b66c845edde6"
oe-meta-go           = "HEAD:b29b384eae4a40933d07cc64c51e890c289d9621"
meta-virtualization  = "HEAD:8344dd9e9f55a5ea81f9c57c74bd9a8b9a04e8ad"
external-binaries    = "HEAD:78d4168b29efe5e812c36502a1c300d3d4c45935"
meta-xfce
meta-webserver
meta-perl
meta-python
meta-oe
meta-gnome
meta-multimedia
meta-networking
meta-filesystems
meta-initramfs       = "HEAD:a4056a96ecc857b1d675b89dc35cf9ed8a876f80"
meta-refkit-extra    = "HEAD:4ca2e7474b046fa0bd7813cd6da7cf455733d61c"
meta-dpdk            = "HEAD:8a0f847836671111915088d2838e3ff6f3c7642c"
meta-java            = "HEAD:aa276b00d8a6bbffffd59d1980153c99521ce6ea"
meta-iot-cloud       = "HEAD:6039a7a8a9a0cad4e32736be3a05a529b65e126a"
meta-security        = "HEAD:f9c5e2022b54097474e46d9efb54080bd0e4d606"
meta-browser         = "HEAD:1cd38d701a49eade80a04140f70d3383117b9745"
meta-openstack
meta-cloud-services  = "HEAD:31e3086409b5055b8ce5962a614f1284003c513d"
meta-cube            = "HEAD:62f03f7d42f784923a8b02ce9d30d62d6552a22b"
meta-gateway         = "HEAD:48dae0603506cff9bde674755d963e5cf3e75244"
meta-up-board        = "HEAD:024d0f5e404cb29789c2bba90aa72efd00f2a0e6"
meta-intel           = "HEAD:fec5d45ec3978d4b7c9649bee45fe58f914bcee4"
wrlabs-integration   = "HEAD:02e0f675db192294044ffbce6146ec25f34ffdba"

Initialising tasks...done.
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 94 of 98 (virtual:native:/home/rpjday/github/pulsar/wr-core/layers/meta-virtualization/recipes-extended/iasl/iasl_20160527.bb:do_compile)
NOTE: recipe iasl-native-20160527-r0: task do_compile: Started
ERROR: iasl-native-20160527-r0 do_compile: oe_runmake failed
ERROR: iasl-native-20160527-r0 do_compile: Function failed: do_compile (log file is located at /home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/temp/log.do_compile.30670)
ERROR: Logfile of failure stored in: /home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/temp/log.do_compile.30670
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8 iasl NOOPT=TRUE NOFORTIFY=TRUE
| make[1]: Entering directory '/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/acpica-unix-20160527/generate/unix/iasl'
| gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=c99 -Wall -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=2 -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=0 -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -Winline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limits -o obj/aslanalyze.o ../../../source/compiler/aslanalyze.c
| gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=c99 -Wall -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=2 -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=0 -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -Winline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limits -o obj/aslcodegen.o ../../../source/compiler/aslcodegen.c
| gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=c99 -Wall -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=2 -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=0 -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -Winline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limits -o obj/aslpredef.o ../../../source/compiler/aslpredef.c
| gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=c99 -Wall -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=2 -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=0 -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -Winline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limits -o obj/aslprepkg.o ../../../source/compiler/aslprepkg.c
| gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=c99 -Wall -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=2 -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=0 -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -Winline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limits -o obj/aslprintf.o ../../../source/compiler/aslprintf.c
| gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=c99 -Wall -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=2 -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=0 -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -Winline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limits -o obj/aslprune.o ../../../source/compiler/aslprune.c
| gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=c99 -Wall -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=2 -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=0 -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -Winline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limits -o obj/aslresource.o ../../../source/compiler/aslresource.c
| gcc  -c -isystem/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/recipe-sysroot-native/usr/include -O2 -pipe -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -std=c99 -Wall -Wbad-function-cast -Wdeclaration-after-statement -Werror -Wformat=2 -Wmissing-declarations -Wmissing-prototypes -Wstrict-aliasing=0 -Wstrict-prototypes -Wswitch-default -Wpointer-arith -Wundef -Waddress -Waggregate-return -Winit-self -Winline -Wmissing-declarations -Wmissing-field-initializers -Wnested-externs -Wold-style-definition -Wno-format-nonliteral -Wredundant-decls -Wempty-body -Woverride-init -Wlogical-op -Wmissing-parameter-type -Wold-style-declaration -Wtype-limits -o obj/aslrestype1.o ../../../source/compiler/aslrestype1.c
| In function ¡CgWriteTableHeader¢,
|     inlined from ¡CgWriteNode¢ at ../../../source/compiler/aslcodegen.c:715:9,
|     inlined from ¡CgAmlWriteWalk¢ at ../../../source/compiler/aslcodegen.c:207:5:
| ../../../source/compiler/aslcodegen.c:500:5: error: ¡strncpy¢ specified bound 4 equals destination size [-Werror=stringop-truncation]
|      strncpy (TableHeader.Signature, Child->Asl.Value.String, 4);
|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../source/compiler/aslcodegen.c:517:5: error: ¡strncpy¢ specified bound 6 equals destination size [-Werror=stringop-truncation]
|      strncpy (TableHeader.OemId, Child->Asl.Value.String, 6);
|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../source/compiler/aslcodegen.c:522:5: error: ¡strncpy¢ specified bound 8 equals destination size [-Werror=stringop-truncation]
|      strncpy (TableHeader.OemTableId, Child->Asl.Value.String, 8);
|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../source/compiler/aslpredef.c: In function ¡ApCheckForPredefinedMethod¢:
| ../../../source/compiler/aslpredef.c:237:33: error: ¡ required for ¢ directive writing 14 bytes into a region of size between 1 and 4096 [-Werror=format-overflow=]
|              sprintf (MsgBuffer, "%s required for %4.4s",
|                                  ^~~~~~~~~~~~~~~~~~~~~~~
| ../../../source/compiler/aslpredef.c:237:13: note: ¡sprintf¢ output between 19 and 4114 bytes into a destination of size 4096
|              sprintf (MsgBuffer, "%s required for %4.4s",
|              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|                  StringBuffer, ThisName->Info.Name);
|                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../source/compiler/aslanalyze.c: In function ¡AnCheckMethodReturnValue¢:
| ../../../source/compiler/aslanalyze.c:431:17: error: ¡%s¢ directive writing up to 4095 bytes into a region of size 4080 [-Werror=format-overflow=]
|                  "Method returns [%s], %s operator requires [%s]",
|                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|                  StringBuffer, OpInfo->Name, StringBuffer2);
|                  ~~~~~~~~~~~~
| ../../../source/compiler/aslanalyze.c:430:13: note: ¡sprintf¢ output 41 or more bytes (assuming 8231) into a destination of size 4096
|              sprintf (MsgBuffer,
|              ^~~~~~~~~~~~~~~~~~~
|                  "Method returns [%s], %s operator requires [%s]",
|                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|                  StringBuffer, OpInfo->Name, StringBuffer2);
|                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../source/compiler/aslpredef.c: In function ¡ApCheckObjectType¢:
| ../../../source/compiler/aslpredef.c:780:29: error: ¡%s¢ directive writing up to 4095 bytes into a region of size between 4056 and 4071 [-Werror=format-overflow=]
|          sprintf (MsgBuffer, "%4.4s: found %s at index %u, %s required",
|                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|              PredefinedName, TypeName, PackageIndex, StringBuffer);
|                                                      ~~~~~~~~~~~~
| ../../../source/compiler/aslpredef.c:780:9: note: ¡sprintf¢ output 35 or more bytes (assuming 4145) into a destination of size 4096
|          sprintf (MsgBuffer, "%4.4s: found %s at index %u, %s required",
|          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|              PredefinedName, TypeName, PackageIndex, StringBuffer);
|              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../source/compiler/aslpredef.c:775:29: error: ¡%s¢ directive writing up to 4095 bytes into a region of size between 4076 and 4082 [-Werror=format-overflow=]
|          sprintf (MsgBuffer, "%4.4s: found %s, %s required",
|                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|              PredefinedName, TypeName, StringBuffer);
|                                        ~~~~~~~~~~~~
| ../../../source/compiler/aslpredef.c:775:9: note: ¡sprintf¢ output 24 or more bytes (assuming 4125) into a destination of size 4096
|          sprintf (MsgBuffer, "%4.4s: found %s, %s required",
|          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|              PredefinedName, TypeName, StringBuffer);
|              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| cc1: all warnings being treated as errors
| make[1]: *** [../Makefile.rules:18: obj/aslcodegen.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| cc1: all warnings being treated as errors
| make[1]: *** [../Makefile.rules:18: obj/aslanalyze.o] Error 1
| cc1: all warnings being treated as errors
| make[1]: *** [../Makefile.rules:18: obj/aslpredef.o] Error 1
| make[1]: Leaving directory '/home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/acpica-unix-20160527/generate/unix/iasl'
| make: *** [generate/unix/Makefile.common:25: iasl] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/temp/run.do_compile.30670:1 exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at /home/rpjday/github/pulsar/wr-core/build-intel-x86/tmp/work/x86_64-linux/iasl-native/20160527-r0/temp/log.do_compile.30670)
NOTE: recipe iasl-native-20160527-r0: task do_compile: Failed
ERROR: Task (virtual:native:/home/rpjday/github/pulsar/wr-core/layers/meta-virtualization/recipes-extended/iasl/iasl_20160527.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 95 tasks of which 94 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  virtual:native:/home/rpjday/github/pulsar/wr-core/layers/meta-virtualization/recipes-extended/iasl/iasl_20160527.bb:do_compile
Summary: There were 15 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--8323328-1394924706-1529668094=:31293--
