Return-Path: <adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2CA19E0053B; Tue, 20 Dec 2016 10:00:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [130.164.80.23 listed in list.dnswl.org]
X-Greylist: delayed 1625 seconds by postgrey-1.32 at yocto-www;
	Tue, 20 Dec 2016 10:00:42 PST
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E08FBE0049D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 10:00:42 -0800 (PST)
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uBKHXa13019212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 11:33:36 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 20 Dec 2016 11:33:36 -0600
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 20 Dec 2016 11:33:35 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 20 Dec 2016 19:31:51 +0200
Message-ID: <20161220173151.2143-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612200221
Subject: [PATCH] meta-openstack: add python-pika git based recipe
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
X-List-Received-Date: Tue, 20 Dec 2016 18:00:46 -0000
Content-Type: text/plain

This package provides a RabbitMQ/AMQP python client library.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-openstack/recipes-devtools/python/python-pika_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pika_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pika_git.bb b/meta-openstack/recipes-devtools/python/python-pika_git.bb
new file mode 100644
index 0000000..6d2e55a
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pika_git.bb
@@ -0,0 +1,15 @@
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
+
+inherit setuptools
-- 
2.11.0


