Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F19FDE00CD8; Tue, 22 Nov 2016 10:56:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D33FE00CCC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:45 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAMIuiEK028247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:44 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 10:56:44 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 22 Nov 2016 13:56:15 -0500
Message-ID: <1479840976-10540-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 3/4] libvirt: change how we make updates to the dnsmasq configuration
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
X-List-Received-Date: Tue, 22 Nov 2016 18:56:46 -0000
Content-Type: text/plain

Our old approach of making the default configuration of dnsmasq use
'bind-dynamic' has some negative side effects. ie. by making this
change when meta-virtualization is used but when libvirtd is not
installed in the rootfs we prevent dnsmasq from binding to all
interfaces (which is the expected/builtin default behavior of
dnsmasq). The results can also be non-deterministic when multiple
instances of dnsmasq are being run (which instance configured with
bind-dynamic should attend to new network interfaces?)

Additionally our approach modifies the default dnsmasq configuration
file which ideally should have now changes, allowing dnsmasq to be
configured using its builtin configuration values and also allowing
for other instances of dnsmasq to better reuse the default
configuration file.

These changes allow for better coexistence of libvirt with packages
like lxc which run their own instances of dnsmasq.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon | 2 ++
 recipes-extended/libvirt/libvirt_1.3.5.bb               | 6 ++++++
 2 files changed, 8 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon

diff --git a/recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon b/recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon
new file mode 100644
index 0000000..a7c3059
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon
@@ -0,0 +1,2 @@
+bind-interfaces
+except-interface=virbr0
diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index c848c99..b8e8159 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://0001-qemu-Let-empty-default-VNC-password-work-as-document.patch \
            file://0001-ptest-add-missing-test_helper-files.patch \
            file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
+           file://dnsmasq.libvirt-daemon \
           "
 
 SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
@@ -112,6 +113,7 @@ FILES_${PN}-libvirtd = " \
 	${sbindir}/libvirtd \
 	${systemd_unitdir}/system/* \
 	${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
+	${sysconfdir}/dnsmasq.d/libvirt-daemon \
         "
 
 FILES_${PN}-virsh = "${bindir}/virsh"
@@ -258,6 +260,10 @@ do_install_append() {
 	for i in `find ${D}${libdir} -type f -name *.la`; do
 	    sed -i -e 's#-L${B}/src/.libs##g' $i
 	done
+
+	# ensure dnsmasq doesn't default to listenning on all interfaces
+	install -d ${D}/${sysconfdir}/dnsmasq.d
+	install -m 644 ${WORKDIR}/dnsmasq.libvirt-daemon ${D}/${sysconfdir}/dnsmasq.d/libvirt-daemon
 }
 
 EXTRA_OECONF += " \
-- 
2.7.4


