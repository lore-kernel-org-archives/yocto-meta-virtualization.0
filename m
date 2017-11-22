Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF394E00D28; Wed, 22 Nov 2017 10:28:31 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64ED2E008A4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 10:28:26 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAMISQXT006543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 10:28:26 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 10:28:24 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 13:28:12 -0500
Message-ID: <1511375292-27471-7-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511375292-27471-1-git-send-email-mark.asselstine@windriver.com>
References: <1511375292-27471-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 6/6] python-keystone: update endpoints in config to match reality
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
X-List-Received-Date: Wed, 22 Nov 2017 18:28:32 -0000
Content-Type: text/plain

When attempting to validate python-openstackclient it was found that
the old endpoints from previous releases of keystone where still being
used. Update the endpoints to reflect how the current version of
keyston is configured.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-keystone_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index d7f6400..c3437cd 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -114,11 +114,11 @@ do_install_append() {
     # Edit the configuration to allow it to work out of the box
     KEYSTONE_CONF_FILE=${KEYSTONE_CONF_DIR}/keystone.conf
     sed "/# admin_endpoint = .*/a \
-        public_endpoint = http://%CONTROLLER_IP%:8081/keystone/main/ " \
+        public_endpoint = http://%CONTROLLER_IP%:5000/ " \
         -i ${KEYSTONE_CONF_FILE}
 
     sed "/# admin_endpoint = .*/a \
-        admin_endpoint = http://%CONTROLLER_IP%:8081/keystone/admin/ " \
+        admin_endpoint = http://%CONTROLLER_IP%:35357/ " \
         -i ${KEYSTONE_CONF_FILE}
     
     sed -e "s:%SERVICE_TOKEN%:${SERVICE_TOKEN}:g" -i ${KEYSTONE_CONF_FILE}
-- 
2.7.4


