Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20184E00D44; Thu, 19 Oct 2017 18:36:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F854E00CD1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Oct 2017 18:36:52 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9K1apvg007712
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Oct 2017 18:36:51 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 19 Oct 2017 18:36:50 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 20 Oct 2017 09:21:25 +0800
Message-ID: <20171020012126.3575-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 1/2] linux-yocto: remove bbappend for 4.1
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
X-List-Received-Date: Fri, 20 Oct 2017 01:36:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Remove linux-yocto bbappend of version 4.1 which has been removed in
oe-core by:

http://ala-git.wrs.com/cgit/oe-core/commit/?id=1a25cea311cbebb2af0c1a0b964208281e6026de

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend
deleted file mode 100644
index 843546c..0000000
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://enable-veth.cfg \
-            file://enable-iscsi-tcp.cfg \
-            file://enable-nbd.cfg \
-            file://enable-rtlink.cfg \
-            file://nf.scc \
-            file://nfs.scc \
-	"
-- 
2.14.1


