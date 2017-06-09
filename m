Return-Path: <fan.xin@jp.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C647FE00BC8; Thu,  8 Jun 2017 23:00:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [211.128.242.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 671 seconds by postgrey-1.32 at yocto-www;
	Thu, 08 Jun 2017 23:00:44 PDT
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2EA2E00B87
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Jun 2017 23:00:43 -0700 (PDT)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym04.jp.fujitsu.com with smtp
	id 3f89_69ab_aed3db64_c662_49e1_9ce1_00da2cfcefa2;
	Fri, 09 Jun 2017 14:49:29 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 2ECE2AC01F1
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Jun 2017 14:49:28 +0900 (JST)
Received: from g01jpexchkw38.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	15277328491 for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Jun 2017 14:49:27 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw38.g01.fujitsu.local (10.0.193.68) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 9 Jun 2017 14:49:27 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 9 Jun 2017 14:50:47 +0900
Message-ID: <1496987447-8064-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] openvswitch: Fix CVE-2017-9263
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
X-List-Received-Date: Fri, 09 Jun 2017 06:00:46 -0000
Content-Type: text/plain

Backport patch file to fix CVE-2017-9263

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../openvswitch-git/CVE-2017-9263.patch            | 29 ++++++++++++++++++++++
 recipes-networking/openvswitch/openvswitch_git.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch b/recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch
new file mode 100644
index 0000000..0fc3aa1
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/CVE-2017-9263.patch
@@ -0,0 +1,29 @@
+A buggy or malicious switch could send a role status message with a bad
+reason code, which if printed by OVS would cause it to abort.  This fixes
+the problem.
+
+CVE: CVE-2017-9263
+Upstream-Status: Submitted
+
+Reported-by: Bhargava Shastry <bshastry at sec.t-labs.tu-berlin.de>
+Signed-off-by: Ben Pfaff <blp at ovn.org>
+---
+ lib/ofp-print.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ofp-print.c b/lib/ofp-print.c
+index 7ca953100539..1932baf4871f 100644
+--- a/lib/ofp-print.c
++++ b/lib/ofp-print.c
+@@ -2147,7 +2147,8 @@ ofp_print_role_status_message(struct ds *string, const struct ofp_header *oh)
+         break;
+     case OFPCRR_N_REASONS:
+     default:
+-        OVS_NOT_REACHED();
++        ds_put_cstr(string, "(unknown)");
++        break;
+     }
+ }
+ 
+-- 
+2.10.2
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 1fb82ae..6ab0c40 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -29,6 +29,7 @@ SRC_URI = "file://openvswitch-switch \
            file://python-make-remaining-scripts-use-usr-bin-env.patch \
            file://0001-use-the-linux-if_packet.h-Interface-directly.patch \
            file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
+           file://CVE-2017-9263.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
-- 
1.9.1


