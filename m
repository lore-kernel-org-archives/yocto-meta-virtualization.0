Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0A9BBE00A7D; Thu, 11 Jul 2019 23:45:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37860E00A7D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2019 23:45:45 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6C6jjxN020727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2019 23:45:45 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 11 Jul 2019 23:45:44 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 12 Jul 2019 14:45:42 +0800
Message-ID: <1562913942-36813-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: Only add polkit to PACKAGECONFIG if polkit is in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Jul 2019 06:45:47 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

At first, the polkit support is always enabled in
PACKAGECONFIG and since Feb 27 2014, use x11
DISTRO_FEATURES to control the polkit support
with below commit.
=========================================================
commit ce991a62d5f2ce006074ee4b8a97c6029308548c
Author: Jonas Eriksson <jonas.eriksson@enea.com>
Date:   Thu Feb 27 17:10:09 2014 +0100

    libvirt: Disable polkit driver when there is no x11

    To avoid having the default build of libvirt depend on virtual/x11
    through polkit and consolekit, check for x11 in DISTRO_FEATURES before
    enabling the polkit support in the default PKG_CONFIG.

    Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
    Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

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
=========================================================

After below commits to add polkit as a required distro feature
in meta-oe, we should unify altogether to enable polkit if
polkit distro feature is set.
97a1a55 polkit: add polkit as a required distro
feature c049e02 polkit: inherit distro_features_check

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 recipes-extended/libvirt/libvirt_5.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_5.3.0.bb b/recipes-extended/libvirt/libvirt_5.3.0.bb
index c54a99e..286f0de 100644
--- a/recipes-extended/libvirt/libvirt_5.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_5.3.0.bb
@@ -188,7 +188,7 @@ PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx iproute2 lxc test \
                    fuse iproute2 firewalld libpcap \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polkit', '', d)} \
                    ${@bb.utils.contains('KARCH', 'arm', '', 'numactl', d)} \
                   "
 
-- 
2.7.4


