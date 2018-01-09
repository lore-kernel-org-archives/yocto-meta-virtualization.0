Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE615E00E04; Tue,  9 Jan 2018 12:15:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26269E00E0B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jan 2018 12:15:25 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w09KFOP4002724
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Jan 2018 12:15:24 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 9 Jan 2018 12:15:24 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 9 Jan 2018 15:15:01 -0500
Message-ID: <1515528906-6892-7-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
References: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 07/12] python-arrow: initial version
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
X-List-Received-Date: Tue, 09 Jan 2018 20:15:31 -0000
Content-Type: text/plain

This is needed by python-jsonext.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-arrow_0.12.0.bb        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb b/meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb
new file mode 100644
index 0000000..46a4021
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Better dates and times for Python"
+HOMEPAGE = "https://github.com/crsmithdev/arrow"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=458d41a4064e4dc109666cfd941a29e4"
+
+SRC_URI[md5sum] = "fafb41dadf2134688797bf1102eebeb6"
+SRC_URI[sha256sum] = "a15ecfddf334316e3ac8695e48c15d1be0d6038603b33043930dcf0e675c86ee"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+        python-dateutil \
+        python-backports-functools-lru-cache \
+        "
-- 
2.7.4


