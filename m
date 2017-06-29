Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 341DDE00B05; Thu, 29 Jun 2017 11:05:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C385CE00726
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 11:05:30 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5TI5Twc001843
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 11:05:29 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Jun 2017 11:05:28 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Thu, 29 Jun 2017 13:56:39 -0400
Message-ID: <1498758999-7928-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python: satisfy setup.py 'setup_requires' for vcversioner
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
X-List-Received-Date: Thu, 29 Jun 2017 18:05:32 -0000
Content-Type: text/plain

python-jsonschema has a 'setup_requires' for python vcversioner so we
must have a -native version of python-vcversioner and DEPEND on it in
order to avoid setup.py downloading the requires from PyPI.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb | 5 +++++
 .../recipes-devtools/python/python-vcversioner_2.14.0.0.bb        | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
index a3a7ec0..fef8d5f 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
@@ -17,3 +17,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit setuptools
 
 DEPENDS += "python-vcversioner"
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-vcversioner-native \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
index 2fe96ab..bcff6f3 100644
--- a/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
@@ -14,3 +14,11 @@ SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
+
+
+DEPENDS_class-native += " \
+        python \
+        python-setuptools \
+        "
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


