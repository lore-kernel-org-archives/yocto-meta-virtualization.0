Return-Path: <prvs=7770f27c63=adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A9F4E00A86; Mon, 20 Aug 2018 09:42:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	TVD_SPACE_RATIO,TVD_SPACE_RATIO_MINFP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [148.163.156.75 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  2.5 TVD_SPACE_RATIO_MINFP Space ratio
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 397F2E003D7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 09:42:01 -0700 (PDT)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7KFtU89006676 for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 10:58:36 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2kxgyre67x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 10:58:36 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7KFwZ6R012420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 10:58:35 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 20 Aug 2018 10:58:35 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 20 Aug 2018 10:58:35 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 20 Aug 2018 10:58:33 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 20 Aug 2018 19:00:22 +0300
Message-ID: <20180820160023.5432-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-20_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: Sergey Kizunov <sergey.kizunov@ni.com>
Subject: [meta-cloud-services][PATCH 1/2] python-pytest-salt: add recipe
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
X-List-Received-Date: Mon, 20 Aug 2018 16:42:02 -0000
Content-Type: text/plain

From: Sergey Kizunov <sergey.kizunov@ni.com>

Signed-off-by: Sergey Kizunov <sergey.kizunov@ni.com>
---
 .../python/python-pytest-salt_2017.7.0.bb     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb b/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
new file mode 100644
index 0000000..e2cf1cd
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "This pytest plugin will allow the Salt Daemons to be used in tests."
+HOMEPAGE = "https://github.com/saltstack/pytest-salt"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
+
+SRCNAME = "pytest-salt"
+SRC_URI = "git://github.com/saltstack/${SRCNAME}.git;branch=master"
+
+SRC_URI[md5sum] = "c598d7db87ea52cdeb067d7596b3b0b1"
+SRC_URI[sha256sum] = "7052459cda9fbdbbfff9a25b24243b0b96cf56835a2c41135d754cc5b65e2494"
+
+SRCREV = "feb5031f80cf84b113ebe69543cdd44b6a373d21"
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+RDEPENDS_${PN} = " \
+    python-pytest \
+    python-pytest-tempdir \
+    python-pytest-helpers-namespace \
+    python-psutil \
+    "
-- 
2.18.0


