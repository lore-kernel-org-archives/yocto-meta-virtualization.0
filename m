Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 093D0E00CAB; Mon, 17 Dec 2018 21:31:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A8DFE00CA1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Dec 2018 21:31:56 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBI5VIk9011185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 21:31:29 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 17 Dec 2018 21:31:08 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Tue, 18 Dec 2018 00:31:16 -0500
Message-ID: <1545111076-243584-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] openvswitch: Add new option to use short hostname for ovs-ctl script
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
X-List-Received-Date: Tue, 18 Dec 2018 05:31:57 -0000
Content-Type: text/plain

[Backport two commits from openvswitch]

Current ovs-ctl forces to set full hostname in external-ids. In
some situation users may want to set short hostname. For example,
in OpenStack - OVN integration, Neutron uses the host-id provided
by Nova, which is usually short hostname, to set "requested-chassis"
in OVN. The mismatch in hypervisor's external-ids:hostname setting
causes OVN port binding failure. It can be overridden to short name
but a openvswitch restart using ovs-ctl would again set it to full
hostname. This patch ensures in such use cases --no-full-hostname
can be specified to ovs-ctl to set short hostname instead.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...-ctl-Add-new-option-to-use-short-hostname.patch | 63 ++++++++++++++++++++++
 recipes-networking/openvswitch/openvswitch_git.bb  |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch b/recipes-networking/openvswitch/openvswitch-git/0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch
new file mode 100644
index 0000000..b539310
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch
@@ -0,0 +1,63 @@
+From 48091ad4e2417df5494be1a61378785d3bae9733 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Mon, 17 Dec 2018 04:16:24 -0500
+Subject: [PATCH] ovs-ctl: Add new option to use short hostname
+
+Current ovs-ctl forces to set full hostname in external-ids. In
+some situation users may want to set short hostname. For example,
+in OpenStack - OVN integration, Neutron uses the host-id provided
+by Nova, which is usually short hostname, to set "requested-chassis"
+in OVN. The mismatch in hypervisor's external-ids:hostname setting
+causes OVN port binding failure. It can be overridden to short name
+but a openvswitch restart using ovs-ctl would again set it to full
+hostname. This patch ensures in such use cases --no-full-hostname
+can be specified to ovs-ctl to set short hostname instead.
+
+Signed-off-by: Han Zhou <hzhou8@ebay.com>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+
+Upstream-Status: Backport [298115b94] and [dd091e163].
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ utilities/ovs-ctl.in | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/utilities/ovs-ctl.in b/utilities/ovs-ctl.in
+index 43c8f32..ca5e1dd 100755
+--- a/utilities/ovs-ctl.in
++++ b/utilities/ovs-ctl.in
+@@ -38,7 +38,12 @@ insert_mod_if_required () {
+ set_hostname () {
+     # 'hostname -f' needs network connectivity to work.  So we should
+     # call this only after ovs-vswitchd is running.
+-    ovs_vsctl set Open_vSwitch . external-ids:hostname="$(hostname -f)"
++    if test X$FULL_HOSTNAME = Xyes; then
++        hn="$(hostname -f)" || hn="$(uname -n)"
++    else
++        hn="$(uname -n)"
++    fi
++    ovs_vsctl set Open_vSwitch . external-ids:hostname="$hn"
+ }
+ 
+ set_system_ids () {
+@@ -291,6 +296,8 @@ enable_protocol () {
+ set_defaults () {
+     SYSTEM_ID=
+ 
++    FULL_HOSTNAME=yes
++
+     DELETE_BRIDGES=no
+     DELETE_TRANSIENT_PORTS=no
+ 
+@@ -376,6 +383,7 @@ Less important options for "start", "restart" and "force-reload-kmod":
+   --no-mlockall                  do not lock all of ovs-vswitchd into memory
+   --ovsdb-server-priority=NICE   set ovsdb-server's niceness (default: $OVSDB_SERVER_PRIORITY)
+   --ovs-vswitchd-priority=NICE   set ovs-vswitchd's niceness (default: $OVS_VSWITCHD_PRIORITY)
++  --no-full-hostname             set short hostname instead of full hostname
+ 
+ Debugging options for "start", "restart" and "force-reload-kmod":
+   --ovsdb-server-wrapper=WRAPPER
+-- 
+2.8.1
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index b8bbb3a..9be4a91 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -33,6 +33,7 @@ SRC_URI = "file://openvswitch-switch \
            file://python-switch-remaining-scripts-to-use-python3.patch \
            file://systemd-update-tool-paths.patch \
            file://systemd-create-runtime-dirs.patch \
+           file://0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.8.1


