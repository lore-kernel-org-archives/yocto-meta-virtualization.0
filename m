Return-Path: <joakim.roubert@axis.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A217E00D6A; Tue, 17 Sep 2019 06:54:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [195.60.68.11 listed in list.dnswl.org]
X-Greylist: delayed 397 seconds by postgrey-1.32 at yocto-www;
	Tue, 17 Sep 2019 06:54:46 PDT
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6519AE00C74
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 06:54:46 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E8FF718415
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 15:48:07 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id amU1eFKVTH6E for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 15:48:04 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A2DFA18416
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 15:48:04 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 845811A06B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 15:48:04 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78D001A060
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 15:48:04 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 15:48:04 +0200 (CEST)
Received: from pc33929-1906.se.axis.com (pc33929-1906.se.axis.com
	[10.88.130.51])
	by seth.se.axis.com (Postfix) with ESMTP id 6C6B630F7;
	Tue, 17 Sep 2019 15:48:04 +0200 (CEST)
Received: by pc33929-1906.se.axis.com (Postfix, from userid 20727)
	id 6604A60131; Tue, 17 Sep 2019 15:48:04 +0200 (CEST)
From: Joakim Roubert <joakim.roubert@axis.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Sep 2019 15:47:27 +0200
Message-Id: <20190917134727.3174-1-joakimr@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Joakim Roubert <joakimr@axis.com>
Subject: [PATCH] templates/lxc-download.in: Use curl instead of wget
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
X-List-Received-Date: Tue, 17 Sep 2019 13:54:48 -0000
Content-Transfer-Encoding: 8bit

When curl's MIT license is preferable to wget's GPLv3. Which it is in
several situations.

Change-Id: I72ee1ce66493c564557b73fae80f5219ef83af6d
Signed-off-by: Joakim Roubert <joakimr@axis.com>
---
 .../templates-use-curl-instead-of-wget.patch  | 49 +++++++++++++++++++
 recipes-containers/lxc/lxc_3.2.1.bb           |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch

diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
new file mode 100644
index 0000000..4b185bf
--- /dev/null
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
@@ -0,0 +1,49 @@
+From dd7b0a2e4542c352456747a45d7eeb11e9fdec26 Mon Sep 17 00:00:00 2001
+From: Joakim Roubert <joakimr@axis.com>
+Date: Fri, 16 Aug 2019 07:52:48 +0200
+Subject: [PATCH] Use curl instead of wget
+
+When curl's MIT license is preferable to wget's GPLv3.
+
+Change-Id: I4684ae7569704514fdcc63e0655c556efcaf44f8
+Signed-off-by: Joakim Roubert <joakimr@axis.com>
+---
+ templates/lxc-download.in | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/templates/lxc-download.in b/templates/lxc-download.in
+index b70daaf..9526eae 100644
+--- a/templates/lxc-download.in
++++ b/templates/lxc-download.in
+@@ -74,9 +74,9 @@ cleanup() {
+   fi
+ }
+ 
+-wget_wrapper() {
++curl_wrapper() {
+   for _ in $(seq 3); do
+-    if wget "$@"; then
++    if curl "$@"; then
+       return 0
+     fi
+   done
+@@ -85,8 +85,8 @@ wget_wrapper() {
+ }
+ 
+ download_file() {
+-  if ! wget_wrapper -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
+-    if ! wget_wrapper -T 30 -q "http://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
++  if ! curl_wrapper -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
++    if ! curl_wrapper -m 30 -s "http://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
+       if [ "$3" = "noexit" ]; then
+         return 1
+       else
+@@ -266,7 +266,7 @@ while :; do
+ done
+ 
+ # Check for required binaries
+-for bin in tar xz wget; do
++for bin in tar xz curl; do
+   if ! command -V "${bin}" >/dev/null 2>&1; then
+     echo "ERROR: Missing required tool: ${bin}" 1>&2
+     exit 1
diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
index 4b8f10b..b852515 100644
--- a/recipes-containers/lxc/lxc_3.2.1.bb
+++ b/recipes-containers/lxc/lxc_3.2.1.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "libxml2 libcap"
 RDEPENDS_${PN} = " \
 		rsync \
+		curl \
 		gzip \
 		xz \
 		tar \
-		wget \
 		libcap-bin \
 		bridge-utils \
 		dnsmasq \
@@ -41,6 +41,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
 	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
 	file://template-make-busybox-template-compatible-with-core-.patch \
+	file://templates-use-curl-instead-of-wget.patch \
 	file://tests-our-init-is-not-busybox.patch \
 	file://tests-add-no-validate-when-using-download-template.patch \
 	file://network-restore-ability-to-move-nl80211-devices.patch \
-- 
2.20.1


