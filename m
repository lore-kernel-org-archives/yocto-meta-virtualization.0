Return-Path: <Haitao.Liu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1415EE00D67; Mon, 18 Dec 2017 17:59:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7C22E00CE2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Dec 2017 17:59:00 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBJ1wxTq015988
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Dec 2017 17:59:00 -0800
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 18 Dec 2017 17:58:59 -0800
From: Liu Haitao <haitao.liu@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 19 Dec 2017 09:58:09 +0800
Message-ID: <1513648689-92598-1-git-send-email-haitao.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] lxc: Disable the bind-interfaces for lxc.
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
X-List-Received-Date: Tue, 19 Dec 2017 01:59:02 -0000
Content-Type: text/plain

When enable lxc service it failed with the following errors:

"""
root@intel-x86-64:~# /usr/libexec/lxc/lxc-net start 

     dnsmasq: cannot set --bind-interfaces and --bind-dynamic
     Failed to setup lxc-net.
"""

It said that the "bind-interfaces" and "bind-dynamic" cannot cooperate together.
These two options have the same fundamental capacity of binding network interfaces.

So dnsmasq just require one of this kind of option.

For some reason ,the following commit  compulsively add the "bind-dynamic" option
for dnsamsq.

"""
	c3c4d977cbb51363f9030c2e39d56a772b29f73b
"""

So we just remove 'bind-interfaces' in lxc service scripts.

Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
---
 ...1-lxc-Disable-the-bind-interfaces-for-lxc.patch | 45 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_2.0.8.bb                |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch

diff --git a/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
new file mode 100644
index 0000000..fec6843
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
@@ -0,0 +1,45 @@
+From 76533652915dcca2ce4265b320fd1c20a75adff8 Mon Sep 17 00:00:00 2001
+From: Liu Haitao <haitao.liu@windriver.com>
+Date: Sun, 17 Dec 2017 23:02:13 -0800
+Subject: [PATCH] lxc: Disable the bind-interfaces for lxc.
+
+When enable lxc service it failed with the following errors:
+"""
+    dnsmasq: cannot set --bind-interfaces and --bind-dynamic
+    Failed to setup lxc-net.
+"""
+It said that the "bind-interfaces" and "bind-dynamic" cannot
+cooperate together.
+These two options have the same fundamental capacity of binding
+network interfaces.
+So dnsmasq just require one of this kind of option.
+For some reason ,the following commit  compulsively add the "bind-dynamic" option
+for dnsamsq.
+"""
+	c3c4d977cbb51363f9030c2e39d56a772b29f73b
+"""
+So we just remove 'bind-interfaces' in lxc service scripts.
+
+Upstream-Status: Inappropiate [Modify configuration]
+
+Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
+---
+ config/init/common/lxc-net.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/init/common/lxc-net.in b/config/init/common/lxc-net.in
+index f770950f..6f45228d 100644
+--- a/config/init/common/lxc-net.in
++++ b/config/init/common/lxc-net.in
+@@ -128,7 +128,7 @@ start() {
+     done
+ 
+     dnsmasq $LXC_DHCP_CONFILE_ARG $LXC_DOMAIN_ARG -u ${DNSMASQ_USER} \
+-            --strict-order --bind-interfaces --pid-file="${varrun}"/dnsmasq.pid \
++            --strict-order --pid-file="${varrun}"/dnsmasq.pid \
+             --listen-address ${LXC_ADDR} --dhcp-range ${LXC_DHCP_RANGE} \
+             --dhcp-lease-max=${LXC_DHCP_MAX} --dhcp-no-override \
+             --except-interface=lo --interface=${LXC_BRIDGE} \
+-- 
+2.11.0
+
diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index c9ce5f0..5267bf7 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
 	file://cgroups-work-around-issue-in-gcc-7.patch \
+	file://0001-lxc-Disable-the-bind-interfaces-for-lxc.patch \
 	"
 
 SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
-- 
2.11.0


