Return-Path: <Wenzong.Fan@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3E6BE00874; Tue,  2 Dec 2014 23:41:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7806E0080C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Dec 2014 23:41:23 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB37fMLj003933
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 2 Dec 2014 23:41:22 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Dec 2014 23:41:22 -0800
From: <wenzong.fan@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 3 Dec 2014 02:41:21 -0500
Message-ID: <1417592481-7620-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libvirt: add PACKAGECONFIG for audit, libcap-ng
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
X-List-Received-Date: Wed, 03 Dec 2014 07:41:24 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add PACKAGECONFIG for audit, libcap-ng, otherwise there would be
warnings like below:

WARN: libvirt: libvirt-virsh rdepends on audit, but it isn't a build dependency?
WARN: libvirt: libvirt-virsh rdepends on libcap-ng, but it isn't a build dependency?
WARN: libvirt: libvirt rdepends on audit, but it isn't a build dependency?
WARN: libvirt: libvirt rdepends on libcap-ng, but it isn't a build dependency?
WARN: libvirt: libvirt-libvirtd rdepends on audit, but it isn't a build dependency?
WARN: libvirt: libvirt-libvirtd rdepends on libcap-ng, but it isn't a build dependency?

Both audit and libcap-ng should be enabled/disabled along with selinux
since all of them are from meta-selinux.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.2.8.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.8.bb b/recipes-extended/libvirt/libvirt_1.2.8.bb
index 57ae613..0f4b29f 100644
--- a/recipes-extended/libvirt/libvirt_1.2.8.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.8.bb
@@ -138,7 +138,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
 # full config
 PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
                    remote macvtap libvirtd netcf udev python ebtables \
-                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
                   "
@@ -174,6 +174,8 @@ PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
 PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
 PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
 PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
+PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
+PACKAGECONFIG[libcap-ng] = "--with-capnp,--without-capng,libcap-ng,"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
1.7.9.5


