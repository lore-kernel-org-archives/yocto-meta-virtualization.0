Return-Path: <jori@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 1BB87E00736
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 02:08:13 -0800 (PST)
Received: from sestows930 (172.16.140.35) by smtp.enea.com (172.21.1.208) with
	Microsoft SMTP Server id 14.3.158.1; Wed, 26 Feb 2014 11:08:06 +0100
Received: from jori by sestows930 with local (Exim 4.80)	(envelope-from
	<jori@sestows930>)	id 1WIbPK-0004YL-AF; Wed, 26 Feb 2014 11:08:06 +0100
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Feb 2014 11:07:54 +0100
Message-ID: <1393409277-17451-3-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.rc1
In-Reply-To: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: jonas.eriksson@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 2/5] libvirt: Fix selinux DISTRO_FEATURE check
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

It seems that a $ was forgotten in the DISTRO_FEATURE check for selinux.

Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
---
 recipes-extended/libvirt/libvirt_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
index d30f09d..76d3f42 100644
--- a/recipes-extended/libvirt/libvirt_1.2.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
@@ -111,7 +111,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 # full config
 PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx iproute2 \
                    polkit lxc test remote macvtap libvirtd netcf udev python ebtables \
-                   {@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                   "
 
 # enable,disable,depends,rdepends
-- 
1.9.rc1


