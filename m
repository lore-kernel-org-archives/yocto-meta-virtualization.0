Return-Path: <Maxin.John@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 364E9E006B7; Tue,  8 Jul 2014 04:02:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 6A09AE004FF
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Jul 2014 04:02:55 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Tue, 8 Jul 2014
	13:02:52 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id E8FE7288F30;
	Tue,  8 Jul 2014 13:02:52 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Jul 2014 13:02:50 +0200
Message-ID: <1404817370-56388-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] linux-yocto/3.10/3.14/3.4: replaces module_autoload with KERNEL_MODULE_AUTOLOAD
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
X-List-Received-Date: Tue, 08 Jul 2014 11:02:57 -0000
Content-Type: text/plain

Replace module_autoload with KERNEL_MODULE_AUTOLOAD for "openvswitch".

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 recipes-kernel/linux/linux-yocto_3.10.bbappend | 2 +-
 recipes-kernel/linux/linux-yocto_3.14.bbappend | 2 +-
 recipes-kernel/linux/linux-yocto_3.4.bbappend  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
index 3e8799a..c03d7e0 100644
--- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -5,7 +5,7 @@ SRC_URI += "file://xt-checksum.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
 	    "
-module_autoload_openvswitch = "openvswitch"
+KERNEL_MODULE_AUTOLOAD += "openvswitch"
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 
 KERNEL_MODULE_AUTOLOAD += "kvm"
diff --git a/recipes-kernel/linux/linux-yocto_3.14.bbappend b/recipes-kernel/linux/linux-yocto_3.14.bbappend
index 3e8799a..c03d7e0 100644
--- a/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -5,7 +5,7 @@ SRC_URI += "file://xt-checksum.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
 	    "
-module_autoload_openvswitch = "openvswitch"
+KERNEL_MODULE_AUTOLOAD += "openvswitch"
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 
 KERNEL_MODULE_AUTOLOAD += "kvm"
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index de820b6..9180748 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -5,7 +5,7 @@ SRC_URI += "file://xt-checksum.scc \
 	    file://vswitch.scc \
 	    file://lxc.scc \
 	    "
-module_autoload_openvswitch = "openvswitch"
+KERNEL_MODULE_AUTOLOAD += "openvswitch"
 KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
 
 KERNEL_MODULE_AUTOLOAD += "kvm"
-- 
1.9.1


