Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18022E00858; Tue,  7 Apr 2015 01:55:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B02C6E007A0
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Apr 2015 01:55:16 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t378tFdU021588
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Apr 2015 01:55:15 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 7 Apr 2015 01:55:15 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 7 Apr 2015 16:55:14 +0800
Message-ID: <1428396914-16902-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] python-oslotest: correct the SRC_URI and add bash to rdepends
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
X-List-Received-Date: Tue, 07 Apr 2015 08:55:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- It's updated to 1.4.0 in previous commit but the SRC_URI
  and checksums are incorrect.
- The scripts in python-oslotest needs bash so add it to
  rdepends to avoid:
  WARNING: QA Issue: python-oslotest requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb
index edb37d8..b3819e4 100644
--- a/meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 PR = "r0"
 SRCNAME = "oslotest"
 
-SRC_URI = "https://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-1.0.0.tar.gz \
+SRC_URI = "https://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "1f7710e4d38b615990737f813704fd58"
-SRC_URI[sha256sum] = "cf05f4ff0cbf84ad0b5d1bef7c46d719eaf4408107e65a32a4500cf707d1a1e7"
+SRC_URI[md5sum] = "a573e1943869f0841f487cf94a121321"
+SRC_URI[sha256sum] = "4226c044198792da7e14ca76895656e8d6e4b256eab184a6c81477b373e059a6"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -26,4 +26,5 @@ RDEPENDS_${PN} = "python-fixtures \
                   python-testtools \
                   python-mock \
                   python-mox \
+                  bash \
 "
-- 
1.9.1


