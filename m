Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F1D2E006CC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Jan 2013 23:18:50 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0V7Ip0O012389
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Jan 2013 23:18:51 -0800 (PST)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 30 Jan 2013 23:18:49 -0800
From: <lei.yang@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Thu, 31 Jan 2013 15:18:47 +0800
Message-ID: <1359616727-15082-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] openvswtich: start openvswitch at the boot time
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
X-List-Received-Date: Thu, 31 Jan 2013 07:18:50 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

When I define the bridge, I get below error

root@intel_5500_server:~# ovs-vsctl add-br ovsbr0
Jan 25 17:34:07|00002|stream_unix|ERR|/tmp/stream-unix.1487.0: connection to /var/run/openvswitch/db.sock
failed: No such file or directory
........
........

This is because openvswitch damon isn't running,so we'd better start it at the boot time.
The split-pacakage ${PN}-switch ${PN}-controller provide us to start nessary damon with update-rc.d
so we add them to the RDEPENDS.

Since openvswtich depends on openvswtich kernel module,so auto load the kernel module too.

Signed-off-by: Lei Yang <lei.yang@windriver.com>
Tested-by: Lei Yang <lei.yang@windriver.com>
---
 recipes-kernel/linux/linux-yocto_3.4.bbappend      |    2 +-
 .../openvswitch/openvswitch_1.4.3.bb               |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 5b163ff..918302a 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -5,4 +5,4 @@ SRC_URI += "file://xt-checksum.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
 	    "
-
+module_autoload_openvswitch = "openvswitch"
diff --git a/recipes-networking/openvswitch/openvswitch_1.4.3.bb b/recipes-networking/openvswitch/openvswitch_1.4.3.bb
index 88f0114..6764073 100644
--- a/recipes-networking/openvswitch/openvswitch_1.4.3.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.4.3.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2"
 DEPENDS += "bridge-utils openssl python perl"
 
 RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid \
-	       python perl perl-module-strict"
+	       python perl perl-module-strict ${PN}-switch ${PN}-controller"
 RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
 RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
 RDEPENDS_${PN}-pki = "${PN}"
-- 
1.7.1


