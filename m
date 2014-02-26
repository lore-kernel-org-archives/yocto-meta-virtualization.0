Return-Path: <jori@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 4AF83E0076C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 02:08:14 -0800 (PST)
Received: from sestows930 (172.16.140.35) by smtp.enea.com (172.21.1.209) with
	Microsoft SMTP Server id 14.3.158.1; Wed, 26 Feb 2014 11:08:05 +0100
Received: from jori by sestows930 with local (Exim 4.80)	(envelope-from
	<jori@sestows930>)	id 1WIbPK-0004Yb-C1; Wed, 26 Feb 2014 11:08:06 +0100
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Feb 2014 11:07:57 +0100
Message-ID: <1393409277-17451-6-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.rc1
In-Reply-To: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: jonas.eriksson@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 5/5] libvirt: Disable polkit driver when there is no x11
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
X-List-Received-Date: Wed, 26 Feb 2014 10:08:14 -0000
Content-Type: text/plain

To avoid having the default build of libvirt depend on virtual/x11
through polkit and consolekit, check for x11 in DISTRO_FEATURES before
enabling the polkit support in the default PKG_CONFIG.

Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
---
 recipes-extended/libvirt/libvirt_1.2.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
index a75cc45..2841fcb 100644
--- a/recipes-extended/libvirt/libvirt_1.2.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
@@ -109,11 +109,12 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
 
 # full config
-PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 polkit test \
+PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 test \
                    remote macvtap libvirtd netcf udev python ebtables \
                    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'lxc', 'lxc', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
                   "
 
 # enable,disable,depends,rdepends
-- 
1.9.rc1


