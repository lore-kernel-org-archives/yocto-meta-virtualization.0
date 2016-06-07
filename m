Return-Path: <Xulin.Sun@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 550BAE009D8; Mon,  6 Jun 2016 18:47:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EE30E009CB
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Jun 2016 18:47:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u571l8s0003919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 6 Jun 2016 18:47:09 -0700 (PDT)
Received: from pek-lpggp4.wrs.com (128.224.153.77) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 6 Jun 2016 18:47:08 -0700
From: Xulin Sun <xulin.sun@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 7 Jun 2016 09:47:06 +0800
Message-ID: <1465264026-66571-1-git-send-email-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] python-keystone: fix QA warning of host uid contamination
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
X-List-Received-Date: Tue, 07 Jun 2016 01:47:15 -0000
Content-Type: text/plain

QA Issue: python-keystone:
/keystone/usr/share/openstack-dashboard/openstack_dashboard/api/keystone-httpd.py
is owned by gid 100, which is the same as the user running bitbake. This may be
due to host contamination [host-user-contaminated]

Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-keystone_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index a8d1181..4bd739a 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -91,11 +91,11 @@ do_install_append() {
         ${KEYSTONE_CONF_DIR}/policy.json
     install -m 644 ${S}${sysconfdir}/keystone-paste.ini \
         ${KEYSTONE_CONF_DIR}/keystone-paste.ini
-    install -g users -m 644 ${S}/httpd/keystone.py \
+    install -m 644 ${S}/httpd/keystone.py \
         ${KEYSTONE_PY_DIR}/keystone-httpd.py
-    install -g users -m 644 ${S}/httpd/keystone.py \
+    install -m 644 ${S}/httpd/keystone.py \
         ${KEYSTONE_CGI_DIR}/admin
-    install -g users -m 644 ${S}/httpd/keystone.py \
+    install -m 644 ${S}/httpd/keystone.py \
         ${KEYSTONE_CGI_DIR}/main
 
     cp -r ${S}/examples ${KEYSTONE_PACKAGE_DIR}
-- 
2.5.0


