Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01282E00CF7; Fri,  1 Dec 2017 12:13:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12E93E00CE8
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 12:13:40 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB1KDeKB028236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 1 Dec 2017 12:13:40 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Dec 2017 12:13:39 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 1 Dec 2017 15:13:33 -0500
Message-ID: <1512159213-5505-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] python-keystone: generate admin-openrc
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
X-List-Received-Date: Fri, 01 Dec 2017 20:13:43 -0000
Content-Type: text/plain

In order to interact with the openstack CLI commands it is common
practice to source *openrc files which populate the environment with a
base set of values. See

https://docs.openstack.org/keystone/pike/install/keystone-openrc-obs.html

We used to do this as part of nova but it makes more sense to create
these as part of keystone. This makes them available early in the
setup process and also maps with the keystone bootstrapping.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-keystone/admin-openrc     | 12 ++++++++++++
 .../recipes-devtools/python/python-keystone_git.bb           |  8 ++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-keystone/admin-openrc

diff --git a/meta-openstack/recipes-devtools/python/python-keystone/admin-openrc b/meta-openstack/recipes-devtools/python/python-keystone/admin-openrc
new file mode 100644
index 0000000..4b459d7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-keystone/admin-openrc
@@ -0,0 +1,12 @@
+#
+# Matches bootstrap data in keystone-init
+#
+export OS_PROJECT_DOMAIN_NAME=Default
+export OS_USER_DOMAIN_NAME=Default
+export OS_PROJECT_NAME=admin
+export OS_USERNAME=%ADMIN_USER%
+export OS_PASSWORD=%ADMIN_PASSWORD%
+export OS_AUTH_URL=http://%CONTROLLER_IP%:35357/v3
+export OS_IDENTITY_API_VERSION=3
+export OS_IMAGE_API_VERSION=2
+export OS_REGION_NAME=RegionOne
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index c3437cd..118574b 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike \
            file://identity.sh \
            file://convert_keystone_backend.py \
            file://wsgi-keystone.conf \
+           file://admin-openrc \
            "
 
 # TBD: update or drop
@@ -92,6 +93,13 @@ do_install_append() {
     sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${KS_INIT_FILE}
     sed -e "s:%ADMIN_ROLE%:${ADMIN_ROLE}:g" -i ${KS_INIT_FILE}
 
+    # Setup the admin-openrc file
+    KS_OPENRC_FILE=${KEYSTONE_CONF_DIR}/admin-openrc
+    install -m 600 ${WORKDIR}/admin-openrc ${KS_OPENRC_FILE}
+    sed -e "s:%CONTROLLER_IP%:${CONTROLLER_IP}:g" -i ${KS_OPENRC_FILE}
+    sed -e "s:%ADMIN_USER%:${ADMIN_USER}:g" -i ${KS_OPENRC_FILE}
+    sed -e "s:%ADMIN_PASSWORD%:${ADMIN_PASSWORD}:g" -i ${KS_OPENRC_FILE}
+
     # Install various configuration files. We have to select suitable
     # permissions as packages such as Apache require read access.
     #
-- 
2.7.4


