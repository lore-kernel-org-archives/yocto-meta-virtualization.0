Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C18BE00BA2; Mon, 24 Sep 2018 20:28:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B74ACE00B9D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Sep 2018 20:28:29 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8P3SStP016616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Sep 2018 20:28:28 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 24 Sep 2018 20:28:27 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 25 Sep 2018 11:28:26 +0800
Message-ID: <1537846106-268688-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] containerd: Disable for all mips machines
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
X-List-Received-Date: Tue, 25 Sep 2018 03:28:30 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

containerd does not support mips since it depends on boltdb which does not
support mips.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-containers/containerd/containerd.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/containerd/containerd.inc b/recipes-containers/containerd/containerd.inc
index eb47cc9..0eca5a6 100644
--- a/recipes-containers/containerd/containerd.inc
+++ b/recipes-containers/containerd/containerd.inc
@@ -88,3 +88,5 @@ FILES_${PN} += "${systemd_system_unitdir}/*"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INSANE_SKIP_${PN} += "ldflags already-stripped"
+
+COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
-- 
2.7.4


