Return-Path: <jori@enea.com>
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 592FEE0084C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 08:10:17 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id EA39080E;
	Thu, 27 Feb 2014 17:10:16 +0100 (MET)
X-Virus-Scanned: amavisd-new at acc.umu.se
Received: from sestows930 (sestofw01.enea.se [192.36.1.252])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: zqad)
	by mail.acc.umu.se (Postfix) with ESMTPSA id 4EEAF80A;
	Thu, 27 Feb 2014 17:10:15 +0100 (MET)
Received: by sestows930 (Postfix, from userid 1000)
	id 7266A18198F; Thu, 27 Feb 2014 17:10:14 +0100 (CET)
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 27 Feb 2014 17:10:08 +0100
Message-Id: <1393517409-425-4-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.rc1
In-Reply-To: <1393517409-425-1-git-send-email-jonas.eriksson@enea.com>
References: <1393517409-425-1-git-send-email-jonas.eriksson@enea.com>
Subject: [PATCH 3/4] libvirt: Use DISTRO_FEATURES to enable Xen support
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
X-List-Received-Date: Thu, 27 Feb 2014 16:10:21 -0000

The Xen drivers in libvirt is needed when the build file system image
and kernel are running as dom0. The parts of the kernel needed to run as
dom0 are controlled by DISTRO_FEATURES, and thus there is no need for
the Xen drivers if DISTRO_FEATURES does not contain 'xen'.

Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.2.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
index 76d3f42..5365b8d 100644
--- a/recipes-extended/libvirt/libvirt_1.2.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
@@ -109,9 +109,10 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
 
 # full config
-PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx iproute2 \
-                   polkit lxc test remote macvtap libvirtd netcf udev python ebtables \
+PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 polkit lxc test \
+                   remote macvtap libvirtd netcf udev python ebtables \
                    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
                   "
 
 # enable,disable,depends,rdepends
-- 
1.9.rc1


