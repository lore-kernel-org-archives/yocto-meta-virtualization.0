Return-Path: <jori@enea.com>
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57F4BE00844
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 08:10:17 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 9BF9380D;
	Thu, 27 Feb 2014 17:10:16 +0100 (MET)
X-Virus-Scanned: amavisd-new at acc.umu.se
Received: from sestows930 (sestofw01.enea.se [192.36.1.252])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: zqad)
	by mail.acc.umu.se (Postfix) with ESMTPSA id 52F2F80B;
	Thu, 27 Feb 2014 17:10:15 +0100 (MET)
Received: by sestows930 (Postfix, from userid 1000)
	id 752B6181990; Thu, 27 Feb 2014 17:10:14 +0100 (CET)
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 27 Feb 2014 17:10:09 +0100
Message-Id: <1393517409-425-5-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.rc1
In-Reply-To: <1393517409-425-1-git-send-email-jonas.eriksson@enea.com>
References: <1393517409-425-1-git-send-email-jonas.eriksson@enea.com>
Subject: [PATCH 4/4] libvirt: Disable polkit driver when there is no x11
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

To avoid having the default build of libvirt depend on virtual/x11
through polkit and consolekit, check for x11 in DISTRO_FEATURES before
enabling the polkit support in the default PKG_CONFIG.

Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.2.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
index 5365b8d..4c9cf36 100644
--- a/recipes-extended/libvirt/libvirt_1.2.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
@@ -109,10 +109,11 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
 
 # full config
-PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 polkit lxc test \
+PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
                    remote macvtap libvirtd netcf udev python ebtables \
                    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
                   "
 
 # enable,disable,depends,rdepends
-- 
1.9.rc1


