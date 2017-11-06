Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57EFEE00D5E; Mon,  6 Nov 2017 09:02:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CE35E00D24
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 09:02:33 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA6H2WO4008656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 6 Nov 2017 09:02:32 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 6 Nov 2017 09:02:32 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 6 Nov 2017 12:02:20 -0500
Message-ID: <1509987740-20453-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509987740-20453-1-git-send-email-mark.asselstine@windriver.com>
References: <1509987740-20453-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 4/4] python-keystone: remove use of the 'users' group
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
X-List-Received-Date: Mon, 06 Nov 2017 17:02:34 -0000
Content-Type: text/plain

The use of the 'users' group was associated with the addition of
apache vhost support. See commit bf51fa4f053a [python-keystone: Add
apache vhost server.]. The directories and files needed to be readable
by the same user running apache. Since the use of RSS, definiing a
common group used by multiple recipes (apache and keystone in this
case) becomes more involved and we need to use FILESYSTEM_PERMS_TABLES
to accomplish this. Remove the use of the 'users' group until we can
evaluate if this is still required and if so we have a proper
FILESYSTEM_PERMS_TABLES solution in place. This will solve build
failures for 'unknown group "users"' in the interim.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-keystone_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index 49aa530..6dfdc93 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -74,8 +74,8 @@ do_install_append() {
     install -m 755 -d ${APACHE_CONF_DIR}
 
     install -d ${D}${localstatedir}/log/${SRCNAME}
-    install -g users -m 755 -d ${KEYSTONE_CGI_DIR}
-    install -g users -m 755 -d ${KEYSTONE_PY_DIR}
+    install -m 755 -d ${KEYSTONE_CGI_DIR}
+    install -m 755 -d ${KEYSTONE_PY_DIR}
 
     # Apache needs to read the keystone.conf
     install -m 644 ${WORKDIR}/keystone.conf ${KEYSTONE_CONF_DIR}/
-- 
2.7.4


