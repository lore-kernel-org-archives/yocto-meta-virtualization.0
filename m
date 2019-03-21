Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A092E00D00; Thu, 21 Mar 2019 01:43:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 017F4E00CDD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 01:43:12 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2L8hCwm009763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Mar 2019 01:43:12 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 21 Mar 2019 01:43:09 -0700
From: <kai.kang@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Thu, 21 Mar 2019 04:43:06 -0400
Message-ID: <20190321084306.21915-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [meta-cloud-services][PATCH] glusterfs: fix installed-vs-shipped qa issue
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
X-List-Received-Date: Thu, 21 Mar 2019 08:43:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix installed-vs-shipped qa issue of glusterfs:

| ERROR: glusterfs-5.4-r0 do_package: QA Issue: glusterfs:
  Files/directories were installed but not shipped in any package:
|   /usr/libexec/glusterfs/mount-shared-storage.sh

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/glusterfs/glusterfs.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 17aaf75..5843d7c 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -152,6 +152,7 @@ FILES_${PN} = "${libdir}/glusterfs/${PV}/auth \
                ${libexecdir}/glusterfs/events \
                ${libexecdir}/glusterfs/glusterfind \
                ${libexecdir}/glusterfs/gfind_missing_files \
+               ${libexecdir}/glusterfs/mount-shared-storage.sh \
                ${libexecdir}/glusterfs/peer_mountbroker.py \
                ${libexecdir}/glusterfs/peer_eventsapi.py \
                ${libexecdir}/glusterfs/peer_mountbroker \
-- 
2.20.0


