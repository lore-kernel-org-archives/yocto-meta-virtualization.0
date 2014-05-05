Return-Path: <joe.slater@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30804E00B7C; Mon,  5 May 2014 16:00:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
X-Greylist: delayed 8219 seconds by postgrey-1.32 at yocto-www;
	Mon, 05 May 2014 16:00:03 PDT
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE8EBE00B5D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 May 2014 16:00:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s45Kh364024010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 5 May 2014 13:43:03 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 5 May 2014 13:43:02 -0700
From: Joe Slater <jslater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 5 May 2014 13:43:02 -0700
Message-ID: <1399322582-18219-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Cc: joe.slater@windriver.com
Subject: [meta-virt][PATCH 1/1] libvirt: force use of libssh2
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
X-List-Received-Date: Mon, 05 May 2014 23:00:08 -0000
Content-Type: text/plain

We add a PACKAGECONFIG[] to deterministically build with
or without libssh2 and add ssh2 to PACKAGECONFIG, so we will
always use it.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.2.2.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.2.bb b/recipes-extended/libvirt/libvirt_1.2.2.bb
index a66a6ad..eaa880c 100644
--- a/recipes-extended/libvirt/libvirt_1.2.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.2.bb
@@ -134,6 +134,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
 # full config
 PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
                    remote macvtap libvirtd netcf udev python ebtables \
+                   ssh2 \
                    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
@@ -169,6 +170,7 @@ PACKAGECONFIG[python] = ",,python,"
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
 PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
 PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
+PACKAGECONFIG[ssh2] = "--with-ssh2,--without-ssh2,libssh2,"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
1.7.3.4


