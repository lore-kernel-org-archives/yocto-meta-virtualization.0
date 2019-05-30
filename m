Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90640E00D48; Wed, 29 May 2019 22:48:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 219B7E00798
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:48:28 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4U5mSaW008235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:48:28 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 29 May 2019 22:48:28 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 01:47:49 -0400
Message-ID: <1559195272-27896-2-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
References: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] iptables: update bbappend to match to oe-core version
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
X-List-Received-Date: Thu, 30 May 2019 05:48:29 -0000
Content-Type: text/plain

Now iptables has been updated to v1.8, so bbappend should be adjusted
too.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend | 3 ---
 meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
 create mode 100644 meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend

diff --git a/meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend b/meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
deleted file mode 100644
index 2a53557..0000000
--- a/meta-openstack/recipes-extended/iptables/iptables_1.6.%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RRECOMMENDS_${PN} += "kernel-module-xt-conntrack \
-                      kernel-module-xt-redirect \
-                      "
diff --git a/meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend b/meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend
new file mode 100644
index 0000000..2a53557
--- /dev/null
+++ b/meta-openstack/recipes-extended/iptables/iptables_1.8.%.bbappend
@@ -0,0 +1,3 @@
+RRECOMMENDS_${PN} += "kernel-module-xt-conntrack \
+                      kernel-module-xt-redirect \
+                      "
-- 
2.8.1


