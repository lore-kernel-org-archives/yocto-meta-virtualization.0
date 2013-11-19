Return-Path: <Yang.Shi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B46D0E004DD
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Nov 2013 09:45:41 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAJHjgEr026482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Nov 2013 09:45:42 -0800 (PST)
Received: from localhost.localdomain (147.11.152.86) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 19 Nov 2013 09:45:40 -0800
From: Yang Shi <yang.shi@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 19 Nov 2013 09:40:09 -0800
Message-ID: <1384882809-21394-1-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Cc: yang.shi@windriver.com
Subject: [PATCH] libvirt: Correct IP_PATH
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
X-List-Received-Date: Tue, 19 Nov 2013 17:45:41 -0000
Content-Type: text/plain

ip is installed into /sbin/ip, but the default path used by libvirt is /bin/ip,
so override IP_PATH in configure.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.1.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
index 4bdade8..598d7ef 100644
--- a/recipes-extended/libvirt/libvirt_1.1.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
@@ -117,7 +117,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
 
 # full config
-PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
+PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx iproute2 \
                    polkit lxc test remote macvtap libvirtd netcf udev python ebtables \
                    {@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                   "
@@ -150,6 +150,7 @@ PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
 PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
 PACKAGECONFIG[python] = "--with-python,--without-python,python,"
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
+PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
1.7.5.4


