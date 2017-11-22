Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3318AE00D24; Wed, 22 Nov 2017 08:10:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D479E00C78
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:09:37 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAMG9aEO015878
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:09:36 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 08:09:35 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 11:09:29 -0500
Message-ID: <1511366970-9229-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH 1/2] python-django-compressor: set useful perms
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
X-List-Received-Date: Wed, 22 Nov 2017 16:10:06 -0000
Content-Type: text/plain

Horizon will fail when you attempt to open the login page. The error
message will indicate that 'compressor' is not found but the issue is
in fact that apache2 can't access these files/directories as they are
restricted to 'root' only. Looking at other Linux deployments this
change matches the permissions you would find elsewhere and now allows
for proper operation.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-django-compressor_2.1.bb        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb b/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
index c546c85..9d528d9 100644
--- a/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
@@ -17,4 +17,11 @@ RDEPENDS_${PN} += " \
         python-rjsmin  \
         "
 
+do_install_append() {
+    # Ensure permisive perms are granted
+    find -L "${D}${PYTHON_SITEPACKAGES_DIR}/compressor" -type f -exec chmod 644 {} \;
+    find -L "${D}${PYTHON_SITEPACKAGES_DIR}/compressor" -type d -exec chmod 755 {} \;
+}
+
+
 CLEANBROKEN = "1"
-- 
2.7.4


