Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96AC1E00D6C; Wed, 29 May 2019 22:49:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8E6FE00D52
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:49:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4U5meF0012196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:48:50 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 29 May 2019 22:48:29 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 01:47:50 -0400
Message-ID: <1559195272-27896-3-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
References: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] libvirt: update bbappend to match bb version
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
X-List-Received-Date: Thu, 30 May 2019 05:49:03 -0000
Content-Type: text/plain

The recipe has been updated from v4 to v5.3.2

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../recipes-extended/libvirt/libvirt_4.%.bbappend           | 13 -------------
 .../recipes-extended/libvirt/libvirt_5.%.bbappend           | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
 create mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
deleted file mode 100644
index 0b0f011..0000000
--- a/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
-	 	 python ebtables \
-		 ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-		"
-
-inherit useradd
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN}_append = " ;--system libvirt"
-
-do_install_append() {
-	sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i ${D}/etc/libvirt/libvirtd.conf
-	sed -e "s:^#unix_sock_rw_perms =:unix_sock_rw_perms =:g" -i ${D}/etc/libvirt/libvirtd.conf
-}
diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend
new file mode 100644
index 0000000..0b0f011
--- /dev/null
+++ b/meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend
@@ -0,0 +1,13 @@
+PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
+	 	 python ebtables \
+		 ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+		"
+
+inherit useradd
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN}_append = " ;--system libvirt"
+
+do_install_append() {
+	sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i ${D}/etc/libvirt/libvirtd.conf
+	sed -e "s:^#unix_sock_rw_perms =:unix_sock_rw_perms =:g" -i ${D}/etc/libvirt/libvirtd.conf
+}
-- 
2.8.1


