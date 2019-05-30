Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 752AEE00D4C; Wed, 29 May 2019 22:48:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 180ADE00D47
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:48:57 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4U5mux2018009
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2019 22:48:56 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 29 May 2019 22:48:56 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 30 May 2019 01:47:52 -0400
Message-ID: <1559195272-27896-5-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
References: <1559195272-27896-1-git-send-email-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] iproute2: update bbappend to match bb version
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
X-List-Received-Date: Thu, 30 May 2019 05:48:57 -0000
Content-Type: text/plain

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend | 4 ----
 meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend
 create mode 100644 meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend

diff --git a/meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend b/meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend
deleted file mode 100644
index 2fde00d..0000000
--- a/meta-openstack/recipes-support/iproute2/iproute2_4.%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
-
-RRECOMMENDS_${PN} += "kernel-module-veth \
-	"
diff --git a/meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend b/meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend
new file mode 100644
index 0000000..2fde00d
--- /dev/null
+++ b/meta-openstack/recipes-support/iproute2/iproute2_5.%.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
+
+RRECOMMENDS_${PN} += "kernel-module-veth \
+	"
-- 
2.8.1


