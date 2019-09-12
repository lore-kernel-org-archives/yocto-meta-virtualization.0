Return-Path: <Yunguo.Wei@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 994B2E00E15; Thu, 12 Sep 2019 01:30:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9D82E00E07
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Sep 2019 01:30:29 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8C8USMG000085
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Sep 2019 01:30:28 -0700 (PDT)
Received: from pek-bsp-build5.wrs.com (128.224.179.117) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Thu, 12 Sep 2019 01:30:27 -0700
From: Yunguo Wei <yunguo.wei@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 12 Sep 2019 16:31:55 +0800
Message-ID: <1568277115-115334-1-git-send-email-yunguo.wei@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lxc: restore the ability to move nl80211 device
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
X-List-Received-Date: Thu, 12 Sep 2019 08:30:30 -0000
Content-Type: text/plain

nl80211 device can't be moved to another namespace due to
e389f2afd8509(start: unify and simplify network creation), and lxc
community has fixed this issue with:

commit 3dd7829433f63b2ec1323a1f237efa7d67ea6e2b lxc upstream

This patch is grabbing the commit above, and should be abandoned with
lxc uprev afterwards.

See more details here: https://github.com/lxc/lxc/issues/3105

Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
---
 ...k-restore-ability-to-move-nl80211-devices.patch | 94 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_3.2.1.bb                |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 recipes-containers/lxc/files/network-restore-ability-to-move-nl80211-devices.patch

diff --git a/recipes-containers/lxc/files/network-restore-ability-to-move-nl80211-devices.patch b/recipes-containers/lxc/files/network-restore-ability-to-move-nl80211-devices.patch
new file mode 100644
index 0000000..aa1aecd
--- /dev/null
+++ b/recipes-containers/lxc/files/network-restore-ability-to-move-nl80211-devices.patch
@@ -0,0 +1,94 @@
+From 3dd7829433f63b2ec1323a1f237efa7d67ea6e2b Mon Sep 17 00:00:00 2001
+From: Christian Brauner <christian.brauner@ubuntu.com>
+Date: Fri, 26 Jul 2019 08:20:02 +0200
+Subject: [PATCH] network: restore ability to move nl80211 devices
+
+Closes #3105.
+Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
+---
+ src/lxc/network.c | 31 +++++++++++++++++--------------
+ 1 file changed, 17 insertions(+), 14 deletions(-)
+
+diff --git a/src/lxc/network.c b/src/lxc/network.c
+index 9755116..7684f95 100644
+--- a/src/lxc/network.c
++++ b/src/lxc/network.c
+@@ -1248,22 +1248,21 @@ static int lxc_netdev_rename_by_name_in_netns(pid_t pid, const char *old,
+ static int lxc_netdev_move_wlan(char *physname, const char *ifname, pid_t pid,
+ 				const char *newname)
+ {
+-	char *cmd;
++	__do_free char *cmd = NULL;
+ 	pid_t fpid;
+-	int err = -1;
+ 
+ 	/* Move phyN into the container.  TODO - do this using netlink.
+ 	 * However, IIUC this involves a bit more complicated work to talk to
+ 	 * the 80211 module, so for now just call out to iw.
+ 	 */
+ 	cmd = on_path("iw", NULL);
+-	if (!cmd)
+-		goto out1;
+-	free(cmd);
++	if (!cmd) {
++		return -1;
++	}
+ 
+ 	fpid = fork();
+ 	if (fpid < 0)
+-		goto out1;
++		return -1;
+ 
+ 	if (fpid == 0) {
+ 		char pidstr[30];
+@@ -1274,21 +1273,18 @@ static int lxc_netdev_move_wlan(char *physname, const char *ifname, pid_t pid,
+ 	}
+ 
+ 	if (wait_for_pid(fpid))
+-		goto out1;
++		return -1;
+ 
+-	err = 0;
+ 	if (newname)
+-		err = lxc_netdev_rename_by_name_in_netns(pid, ifname, newname);
++		return lxc_netdev_rename_by_name_in_netns(pid, ifname, newname);
+ 
+-out1:
+-	free(physname);
+-	return err;
++	return 0;
+ }
+ 
+ int lxc_netdev_move_by_name(const char *ifname, pid_t pid, const char* newname)
+ {
++	__do_free char *physname = NULL;
+ 	int index;
+-	char *physname;
+ 
+ 	if (!ifname)
+ 		return -EINVAL;
+@@ -3279,13 +3275,20 @@ int lxc_network_move_created_netdev_priv(struct lxc_handler *handler)
+ 		return 0;
+ 
+ 	lxc_list_for_each(iterator, network) {
++		__do_free char *physname = NULL;
+ 		int ret;
+ 		struct lxc_netdev *netdev = iterator->elem;
+ 
+ 		if (!netdev->ifindex)
+ 			continue;
+ 
+-		ret = lxc_netdev_move_by_index(netdev->ifindex, pid, NULL);
++		if (netdev->type == LXC_NET_PHYS)
++			physname = is_wlan(netdev->link);
++
++		if (physname)
++			ret = lxc_netdev_move_wlan(physname, netdev->link, pid, NULL);
++		else
++			ret = lxc_netdev_move_by_index(netdev->ifindex, pid, NULL);
+ 		if (ret) {
+ 			errno = -ret;
+ 			SYSERROR("Failed to move network device \"%s\" with ifindex %d to network namespace %d",
+-- 
+2.7.4
+
diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
index 585ab8f..4b8f10b 100644
--- a/recipes-containers/lxc/lxc_3.2.1.bb
+++ b/recipes-containers/lxc/lxc_3.2.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://template-make-busybox-template-compatible-with-core-.patch \
 	file://tests-our-init-is-not-busybox.patch \
 	file://tests-add-no-validate-when-using-download-template.patch \
+	file://network-restore-ability-to-move-nl80211-devices.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
-- 
2.7.4


