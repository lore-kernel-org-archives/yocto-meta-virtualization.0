Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83251E00D2A; Wed, 22 Nov 2017 08:09:07 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51111E00A62
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:09:02 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAMG92Ce003534
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:09:02 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 08:09:01 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 11:08:44 -0500
Message-ID: <1511366926-8247-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH 1/3] python-*: Set permissive perms
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
X-List-Received-Date: Wed, 22 Nov 2017 16:09:07 -0000
Content-Type: text/plain

Keystone will fail with permission denied if we don't set more
permissive permissions for the PGK-INFO files in these packages.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb | 3 ++-
 meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb  | 8 ++++++++
 meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb  | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
index 7b3c7d8..0981c27 100644
--- a/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
@@ -10,7 +10,8 @@ SRC_URI[sha256sum] = "e20376e2e32291798d2226502994134c1c4e175136d8375b3c517a234f
 inherit setuptools pypi
 
 do_install_append() {
-	perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
+	perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt")
+	perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
 	for f in $perm_files; do
 		chmod 644 "${f}"
 	done
diff --git a/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb b/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb
index 21a0585..aa04663 100644
--- a/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb
+++ b/meta-openstack/recipes-devtools/python/python-oauth2_1.5.211.bb
@@ -15,3 +15,11 @@ RDEPENDS_${PN} += "python-prettytable \
             python-mccabe \
             python-pep8 \
             python-pyflakes"
+
+
+do_install_append() {
+	perm_files=$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
+	for f in $perm_files; do
+		chmod 644 "${f}"
+	done
+}
diff --git a/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb b/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb
index fe4560b..3b5d38f 100644
--- a/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-oauthlib_0.7.2.bb
@@ -21,6 +21,7 @@ RDEPENDS_${PN} += " \
 
 do_install_append() {
         perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt" -o -name "requires.txt"`
+        perm_files="$perm_files "$(find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "PKG-INFO")
         for f in $perm_files; do
                 chmod 644 "${f}"
         done
-- 
2.7.4


