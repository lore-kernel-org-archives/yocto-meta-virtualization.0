Return-Path: <b43198@az84smr01.freescale.net>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe003.messaging.microsoft.com [216.32.180.186])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F747E014B5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 02:19:40 -0700 (PDT)
Received: from mail189-co1-R.bigfish.com (10.243.78.252) by
	CO1EHSOBE019.bigfish.com (10.243.66.82) with Microsoft SMTP Server id
	14.1.225.23; Thu, 11 Apr 2013 09:19:39 +0000
Received: from mail189-co1 (localhost [127.0.0.1])	by
	mail189-co1-R.bigfish.com (Postfix) with ESMTP id 993B31E0223	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 09:19:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275chz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail189-co1 (localhost.localdomain [127.0.0.1]) by mail189-co1
	(MessageSwitch) id 1365671977414642_29438;
	Thu, 11 Apr 2013 09:19:37 +0000 (UTC)
Received: from CO1EHSMHS028.bigfish.com (unknown [10.243.78.234])	by
	mail189-co1.bigfish.com (Postfix) with ESMTP id 6379E680049	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 09:19:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS028.bigfish.com
	(10.243.66.38) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 11 Apr 2013 09:19:37 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 11 Apr 2013 09:19:36 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3B9JZvZ029927;	Thu, 11 Apr 2013 02:19:35 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r3B9JXQp009491;
	Thu, 11 Apr 2013 12:19:33 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 11 Apr 2013 12:19:31 +0300
Message-ID: <1365671972-8194-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH v2] Add LXC 0.9.0 recipe
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
X-List-Received-Date: Thu, 11 Apr 2013 09:19:40 -0000
Content-Type: text/plain

Introducing the LXC 0.9.0 recipe.

Maintainer log for intermediate versions since LXC 0.8.0. This only contains
the major differences between versions. You may find the complete log on the
SourceForge LXC devel mailing list [1]. 

0.9.0.alpha1:
- Introduction of the new liblxc API
- Python bindings
- New tools:
   - lxc-device
   - lxc-start-ephemeral
   - python version of lxc-ls
- lxc.autodev support
- oracle template
- reworked lxc-attach
- /etc/lxc/lxc.conf configuration
- Switch to new docbook
- A lot of other improvements, new features and bugfixes

0.9.0.alpha2: bug fix for issue with 0.9.0.alpha1 - no significant changes

0.9.0.alpha3:
- Android support
- New lua binding
- User namespace support
- Oracle template
- Manpage updates
- POSIX shell support for most scripts
- Improved systemd support
- Various API improvements
- Logging improvements

0.9.0.rc1:
- Addition of -P option to all executables (to specify lxcpath)
- Rework of the cgroup handling code
- Rework of lxc-attach for userns
- Updates to the alpine, archlinux, opensuse, oracle and ubuntu
templates. Removal of the lenny template.
- Introduction of a new lxc.stopsignal option
- Introduction of a new lxc.kmsg option
- Various userns improvements
- New --host option in lxc-ps
- Introduction of a few examples lxc hooks
- Support for nested containers in lxc-ls
- Introduction of get_version in the C API.
- And a variety of bugfixes

0.9.0:
Feature changes include:
 - Support for ephemeral containers in lxc-clone
 - --clear-env/--keep-env support in lxc-attach
 - -n option to lxc-start-ephemeral
Everything else is bugfixes on top of rc1.
Tests done by maintainers:
 - Test build on my machine (up to date Ubuntu 13.04)
 - Test build on Launchpad (Ubuntu 12.04, 12.10 and 13.04)
 - Test build on an armhf board running Ubuntu 13.04
 - Test build for Android cross-compiling on my laptop
 - Ran our test suite on the x86 binaries
 - Ran a quick test (start/stop/info/wait) on Android
 - Tested the API and tools on ARM
 - Rebuilt all my local templates (~20 containers) on a variety of
   architectures (i386, amd64, armel and armhf)
   
[1] https://lists.sourceforge.net/lists/listinfo/lxc-develIntroducing the LXC 0.9.0 recipe.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 recipes-containers/lxc/lxc_0.9.0.bb | 38 +++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 recipes-containers/lxc/lxc_0.9.0.bb

diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
new file mode 100644
index 0000000..292285d
--- /dev/null
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PRIORITY = "optional"
+PR = "r1"
+DEPENDS = "libxml2 libcap"
+RDEPENDS_${PN} = " \
+		rsync \
+		gzip \
+		libcap-bin \
+		bridge-utils \
+		dnsmasq \
+		perl-module-strict \
+		perl-module-getopt-long \
+		perl-module-vars \
+		perl-module-warnings-register \
+		perl-module-exporter \
+		perl-module-constant \
+		perl-module-overload \
+		perl-module-exporter-heavy \
+"
+
+SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
+	"
+SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
+SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[doc] = "--enable-doc,--disable-doc"
+PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath"
+PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+
+inherit autotools
+
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-- 
1.7.11.7



