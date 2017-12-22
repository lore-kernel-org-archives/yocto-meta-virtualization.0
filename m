Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50103E00D75; Fri, 22 Dec 2017 12:57:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28D7BE00D1C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Dec 2017 12:57:54 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBMKvswx011447
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 22 Dec 2017 12:57:54 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 22 Dec 2017 12:57:53 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 22 Dec 2017 15:57:44 -0500
Message-ID: <1513976264-6066-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] dnsmasq: add dnsmasq.d entries for lxc and libvirt
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
X-List-Received-Date: Fri, 22 Dec 2017 20:57:56 -0000
Content-Type: text/plain

A while ago changes were merged to meta-openembedded to make
/etc/dnsmasq.d (and specifically the files it contains) referenced
when the main instance of dnsmasq is run (see dnsmasq.service and
commit ba665493a0dd [dnsmasq: allow for dnsmasq instances to reuse
default dnsmasq.conf]).

We, however, continued to modify the global configuration
(/etc/dnsmasq.conf) to keep the main instance of dnsmasq from
attaching to virbr0 and lxcbr0, by using 'bind-dynamic'. This approach
is problematic, since it is common that other instances of dnsmasq
will make use of the global configuration file and may have
incompatible options. We see this for example when attempting to start
lxc-net which will attempt to use 'bind-interface' which is
incompatible with 'bind-dynamic' that we were adding to the global
configuration.

Here we remove our change to the global configuration (leaving it
mostly empty as it should be) and instead have lxc and libvirt
packages instruct the global instance not to bind to virbr0 and lxcbr0
by adding configuration files to /etc/dnsmasq.d (setting
except-interface).

The added benefit to this approach is that if lxc or libvirt are not
part of an image the global configuration will not be modified in such
a way as to expect that they are present.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

I tested this with kvm-image-minimal with lxc and lxc-setup included
in the image and with all 3 instances (global, lxc and libvirt) of
dnsmasq up and running. Running a VM with libvirt and a container with
lxc (both networked) and everything was working as expected. There is
an issue with /etc/recolv.conf but it is related to the configuration
of systemd-resolved which Yocto promotes and nothing to do with these
changes. For testing I disabled systemd-resolved and use udhcpc to
populate /etc/resolv.conf.

For people using OverC this change will result in a slight change in
configuration in cube-essential as the default behavior will be used
instead of bind-dynamic that would have been present previously, as
neither lxc or libvirt are installed in cube-essential. I didn't
complete tests with OverC but although this is a slight configuration
change the runtime behavior should be identical.


 recipes-containers/lxc/files/dnsmasq.conf     | 2 ++
 recipes-containers/lxc/lxc_2.0.8.bb           | 6 ++++++
 recipes-extended/libvirt/libvirt/dnsmasq.conf | 2 ++
 recipes-extended/libvirt/libvirt_1.3.5.bb     | 6 ++++++
 recipes-support/dnsmasq/dnsmasq_2.%.bbappend  | 5 -----
 5 files changed, 16 insertions(+), 5 deletions(-)
 create mode 100644 recipes-containers/lxc/files/dnsmasq.conf
 create mode 100644 recipes-extended/libvirt/libvirt/dnsmasq.conf
 delete mode 100644 recipes-support/dnsmasq/dnsmasq_2.%.bbappend

diff --git a/recipes-containers/lxc/files/dnsmasq.conf b/recipes-containers/lxc/files/dnsmasq.conf
new file mode 100644
index 0000000..124f7eb
--- /dev/null
+++ b/recipes-containers/lxc/files/dnsmasq.conf
@@ -0,0 +1,2 @@
+bind-interfaces
+except-interface=lxcbr0
diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index c9ce5f0..b616e94 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
 	file://cgroups-work-around-issue-in-gcc-7.patch \
+	file://dnsmasq.conf \
 	"
 
 SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
@@ -134,6 +135,11 @@ do_install_append() {
 	    if [ -d ${D}${exec_prefix}/lib/python* ]; then mv ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi
 	    rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
 	fi
+
+	# Force the main dnsmasq instance to bind only to specified interfaces and
+	# to not bind to virbr0. Libvirt will run its own instance on this interface.
+	install -d ${D}/${sysconfdir}/dnsmasq.d
+	install -m 644 ${WORKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/lxc
 }
 
 EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
diff --git a/recipes-extended/libvirt/libvirt/dnsmasq.conf b/recipes-extended/libvirt/libvirt/dnsmasq.conf
new file mode 100644
index 0000000..a7c3059
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/dnsmasq.conf
@@ -0,0 +1,2 @@
+bind-interfaces
+except-interface=virbr0
diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index 8ed2505..e7a2b23 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
            file://libvirtd.sh \
            file://libvirtd.conf \
+           file://dnsmasq.conf \
            file://runptest.patch \
            file://run-ptest \
            file://tests-allow-separated-src-and-build-dirs.patch \
@@ -219,6 +220,7 @@ require libvirt-python.inc
 do_install_append() {
 	install -d ${D}/etc/init.d
 	install -d ${D}/etc/libvirt
+	install -d ${D}/etc/dnsmasq.d
 
 	install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
 	install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
@@ -266,6 +268,10 @@ do_install_append() {
 	# Add hook support for libvirt
 	mkdir -p ${D}/etc/libvirt/hooks
 
+	# Force the main dnsmasq instance to bind only to specified interfaces and
+	# to not bind to virbr0. Libvirt will run its own instance on this interface.
+	install -m 644 ${WORKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/libvirt-daemon
+
 	# remove .la references to our working diretory
 	for i in `find ${D}${libdir} -type f -name *.la`; do
 	    sed -i -e 's#-L${B}/src/.libs##g' $i
diff --git a/recipes-support/dnsmasq/dnsmasq_2.%.bbappend b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
deleted file mode 100644
index 8d66ca6..0000000
--- a/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# dnsmasq is greedy with interfaces by default using bind-dynamic will
-# make it less greedy but still function as it did by default.
-do_install_append() {
-    sed -i '/#bind-interfaces/a # Play nice with libvirt\nbind-dynamic' ${D}${sysconfdir}/dnsmasq.conf
-}
-- 
2.7.4


