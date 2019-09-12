Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7329AE00DFC; Thu, 12 Sep 2019 12:55:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56CD8E00D83
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Sep 2019 12:55:39 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8CJtbRm000012
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2019 12:55:37 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 12 Sep 2019 12:55:37 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Thu, 12 Sep 2019 15:55:31 -0400
Message-ID: <1568318131-30946-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openvswitch: drop LSB bits
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
X-List-Received-Date: Thu, 12 Sep 2019 19:55:40 -0000
Content-Type: text/plain

openembedded-core commit fb064356af61 [Remove LSB support] dropped the
'lsb' recipe which caused openvswitch to throw a dependency fail for
both sysvinit and systemd builds. LSB init functions for
log_begin_msg, log_end_msg and others were being used. We now use the
functions from ovs-lib which are part of OVS and supply the remaining
ones directly. This allows us to regain the functionality and drop the
dependency on 'lsb'.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../openvswitch/files/openvswitch-testcontroller               | 10 +++++++++-
 recipes-networking/openvswitch/openvswitch.inc                 |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/openvswitch/files/openvswitch-testcontroller b/recipes-networking/openvswitch/files/openvswitch-testcontroller
index aad5ad6..57c7798 100755
--- a/recipes-networking/openvswitch/files/openvswitch-testcontroller
+++ b/recipes-networking/openvswitch/files/openvswitch-testcontroller
@@ -40,7 +40,7 @@ PIDFILE=/var/run/openvswitch/$NAME.pid
 
 test -x $DAEMON || exit 0
 
-. /lib/lsb/init-functions
+. /usr/share/openvswitch/scripts/ovs-lib
 
 # Default options, these can be overriden by the information
 # at /etc/default/openvswitch-testcontroller
@@ -89,6 +89,14 @@ running_pid() {
     return 0
 }
 
+log_begin_msg () {
+    echo "$@"
+}
+
+log_end_msg () {
+    echo "$@"
+}
+
 running() {
 # Check if the process is running looking at /proc
 # (works for all users)
diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 46865bd..37fbe5a 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -16,7 +16,7 @@ DEPENDS += "bridge-utils openssl python3 perl python3-six-native coreutils-nativ
 RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
         python3 perl perl-module-strict ${PN}-switch \
         bash python3-twisted python3-six"
-RDEPENDS_${PN}-testcontroller = "${PN} lsb ${PN}-pki"
+RDEPENDS_${PN}-testcontroller = "${PN} ${PN}-pki"
 RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
 RDEPENDS_${PN}-pki = "${PN}"
 RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
-- 
2.7.4


