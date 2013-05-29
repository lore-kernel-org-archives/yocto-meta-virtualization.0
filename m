Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EBCEE01439
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 May 2013 23:55:19 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4T6tHB9003134
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 May 2013 23:55:19 -0700 (PDT)
Received: from pek-lpgtest3.wrs.com (128.224.153.83) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 28 May 2013 23:55:15 -0700
From: <lei.yang@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <david.c.nystrom@gmail.com>,
	<bruce.ashfield@gmail.com>
Date: Wed, 29 May 2013 14:55:13 +0800
Message-ID: <1369810513-19253-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] libvirt: Enable selinux if selinux is available
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
X-List-Received-Date: Wed, 29 May 2013 06:55:19 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

Enable selinux when "DISTRO_FEATURES" contains selinux

Signed-off-by: Lei Yang <lei.yang@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index 989b8b1..b0a4e0a 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -112,7 +112,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
 
 # full config
 PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
-	           polkit lxc test remote macvtap libvirtd netcf udev python"
+	           polkit lxc test remote macvtap libvirtd netcf udev python ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 
 PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
@@ -136,7 +136,7 @@ PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
 PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
 PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
 PACKAGECONFIG[udev] = "--with-udev --with-pciaccess,--without-udev,udev libpciaccess,"
-
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 # Enable the Python tool support
 require libvirt-python.inc
 
-- 
1.7.1


