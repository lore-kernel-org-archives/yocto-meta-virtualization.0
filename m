Return-Path: <prvs=77774814f4=adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 980F1E00901; Mon, 27 Aug 2018 05:10:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [148.163.156.75 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C238E00874
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Aug 2018 05:10:58 -0700 (PDT)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7RCAt8q020208; Mon, 27 Aug 2018 07:10:56 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2m334x6937-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 27 Aug 2018 07:10:56 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7RCAlUQ032209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 27 Aug 2018 07:10:48 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 07:10:47 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 07:10:47 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 27 Aug 2018 07:10:46 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Mon, 27 Aug 2018 15:12:27 +0300
Message-ID: <20180827121227.6950-2-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180827121227.6950-1-adrian.ratiu@ni.com>
References: <20180827121227.6950-1-adrian.ratiu@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-27_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-openstack][PATCH 2/2] python3-pika: add recipe
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
X-List-Received-Date: Mon, 27 Aug 2018 12:10:59 -0000
Content-Type: text/plain

From: Alejandro del Castillo <alejandro.delcastillo@ni.com>

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-devtools/python/python-pika.inc        | 13 +++++++++++++
 .../recipes-devtools/python/python-pika_git.bb     | 14 +-------------
 .../recipes-devtools/python/python3-pika_git.bb    |  3 +++
 3 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pika.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-pika_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pika.inc b/meta-openstack/recipes-devtools/python/python-pika.inc
new file mode 100644
index 0000000..d33979d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pika.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Pure Python RabbitMQ/AMQP 0-9-1 client library"
+HOMEPAGE = "https://github.com/pika/pika"
+SECTION = "devel/python"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb26c37045f9e0d2c5e24b711bd7f01c"
+
+PV = "0.10.0+git${SRCPV}"
+SRCREV = "b907f91415169b7f590174ab5d228e75a1b273e6"
+
+SRC_URI = "git://github.com/pika/pika"
+
+S = "${WORKDIR}/git"
diff --git a/meta-openstack/recipes-devtools/python/python-pika_git.bb b/meta-openstack/recipes-devtools/python/python-pika_git.bb
index 6d2e55a..9d58184 100644
--- a/meta-openstack/recipes-devtools/python/python-pika_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-pika_git.bb
@@ -1,15 +1,3 @@
-SUMMARY = "Pure Python RabbitMQ/AMQP 0-9-1 client library"
-HOMEPAGE = "https://github.com/pika/pika"
-SECTION = "devel/python"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fb26c37045f9e0d2c5e24b711bd7f01c"
-
-PV = "0.10.0+git${SRCPV}"
-SRCREV = "b907f91415169b7f590174ab5d228e75a1b273e6"
-
-SRC_URI = "git://github.com/pika/pika"
-
-S = "${WORKDIR}/git"
+require python-pika.inc
 
 inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python3-pika_git.bb b/meta-openstack/recipes-devtools/python/python3-pika_git.bb
new file mode 100644
index 0000000..93f50b4
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-pika_git.bb
@@ -0,0 +1,3 @@
+require python-pika.inc
+
+inherit setuptools3
-- 
2.18.0


