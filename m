Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75453E00E60; Mon, 13 Jun 2016 00:23:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 439AEE00CD2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Jun 2016 00:23:30 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5D7NQQq026947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 00:23:29 -0700 (PDT)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 00:23:25 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Mon, 13 Jun 2016 15:23:15 +0800
Message-ID: <1465802595-11295-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [meta-cloud-services] [PATCH] python-cinder: Move tgt config files to avoid confliction
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
X-List-Received-Date: Mon, 13 Jun 2016 07:23:34 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

We might have the following warning and error since both tgt and python-
cinder create /etc/tgt/targets.conf. This patch creates conf.d/
under /etc/tgt/ and puts python-cinder's config file there. tgt's
config file will include it automatically.

warning: Removing tgt-1.0.63+git0+eca74a72d2-r0.0@corei7_64 due to
file /etc/tgt/targets.conf conflicting with
python-cinder-7.0.0+git0+61026d4e4f-r0.0@corei7_64
error: tgt-dev-1.0.63+git0+eca74a72d2-r0.0 requires tgt =
1.0.63+git0+eca74a72d2-r0.0

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-cinder_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-cinder_git.bb b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
index 3b8200e..9620e83 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-cinder_git.bb
@@ -107,8 +107,8 @@ do_install_append() {
 
     #Create cinder volume group backing file
     sed 's/%CINDER_LVM_VOLUME_BACKING_FILE_SIZE%/${CINDER_LVM_VOLUME_BACKING_FILE_SIZE}/g' -i ${D}/etc/cinder/drivers/lvm_iscsi_setup.sh
-    mkdir -p ${D}/etc/tgt/
-    echo "include /etc/cinder/data/volumes/*" > ${D}/etc/tgt/targets.conf
+    mkdir -p ${D}/etc/tgt/conf.d/
+    echo "include /etc/cinder/data/volumes/*" > ${D}/etc/tgt/conf.d/python-cinder.conf
 
     # Create Cinder nfs_share config file with default nfs server
     echo "${CINDER_NFS_VOLUME_SERVERS}" > ${D}/etc/cinder/nfs_shares
-- 
2.8.1


