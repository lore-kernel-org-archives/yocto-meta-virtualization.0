Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5C90E00C11; Wed, 28 Aug 2019 23:41:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 700C1E0097C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Aug 2019 23:41:40 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7T6fdpZ013586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Aug 2019 23:41:40 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 28 Aug 2019 23:41:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Aug 2019 14:41:37 +0800
Message-ID: <20190829064137.38267-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] ceph: remove fuse related services as WITH_FUSE is OFF
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
X-List-Received-Date: Thu, 29 Aug 2019 06:41:41 -0000
Content-Type: text/plain

We have WITH_FUSE to set to OFF. We should not install any ceph-fuse
units as they are using ceph-fuse.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/ceph/ceph_14.1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/ceph/ceph_14.1.0.bb b/recipes-extended/ceph/ceph_14.1.0.bb
index 55a6d7d..18a324a 100644
--- a/recipes-extended/ceph/ceph_14.1.0.bb
+++ b/recipes-extended/ceph/ceph_14.1.0.bb
@@ -32,8 +32,6 @@ SYSTEMD_SERVICE_${PN} = " \
         ceph-osd@.service \
 	ceph-osd.target \
         ceph.target \
-	ceph-fuse@.service \
-	ceph-fuse.target \
 	ceph-rbd-mirror@.service \
 	ceph-rbd-mirror.target \
 	ceph-volume@.service \
@@ -77,6 +75,8 @@ do_install_append () {
 	mv ${D}${libexecdir}/systemd/system ${D}${systemd_unitdir}
 	mv ${D}${libexecdir}/ceph/ceph-osd-prestart.sh ${D}${libdir}/ceph
 	mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
+	# WITH_FUSE is set to OFF, remove ceph-fuse related units
+	rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/system/ceph-fuse@.service
 }
 
 FILES_${PN} += "\
-- 
2.17.1


