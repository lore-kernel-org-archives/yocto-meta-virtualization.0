Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B6F9E00C4F; Fri, 30 Aug 2019 02:17:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 874A6E00B65
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 02:17:40 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U9HddC002650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 02:17:40 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 30 Aug 2019 02:17:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Aug 2019 17:17:37 +0800
Message-ID: <20190830091737.36415-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [m-c-s][PATCH] glusterfs: fix RDEPENDS of glusterfs-geo-replication
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
X-List-Received-Date: Fri, 30 Aug 2019 09:17:41 -0000
Content-Type: text/plain

It should rdepend on python3-core and bash. Otherwise, we get the
following QA issue.

  glusterfs-6.1-r0 do_package_qa: QA Issue: /usr/libexec/glusterfs/peer_georep-sshkey.py contained in package glusterfs-geo-replication requires /usr/bin/python3, but no providers found in RDEPENDS_glusterfs-geo-replication? [file-rdeps]
  glusterfs-6.1-r0 do_package_qa: QA Issue: /usr/libexec/glusterfs/set_geo_rep_pem_keys.sh contained in package glusterfs-geo-replication requires /bin/bash, but no providers found in RDEPENDS_glusterfs-geo-replication? [file-rdeps]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/glusterfs/glusterfs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 40a3922d..ebfc3245 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -119,7 +119,7 @@ PACKAGES += "${PN}-rdma ${PN}-geo-replication ${PN}-fuse ${PN}-server \
 RDEPENDS_${PN} += "python3-core python-json python-ctypes bash"
 RDEPENDS_${PN}-ocf += "bash"
 RDEPENDS_${PN}-server += "bash"
-RDEPENDS_${PN}-geo-replication += "python3"
+RDEPENDS_${PN}-geo-replication += "python3-core bash"
 
 FILES_${PN}-dbg += "${libdir}/glusterfs/${PV}/*/.debug \
                     ${libdir}/glusterfs/${PV}/*/*/.debug \
-- 
2.17.1


