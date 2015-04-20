Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 886CEE009D6; Mon, 20 Apr 2015 01:09:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C20ABE009BB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Apr 2015 01:09:35 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89Z52029790
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Apr 2015 01:09:35 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 20 Apr 2015 01:09:34 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 20 Apr 2015 16:09:26 +0800
Message-ID: <81bfe3f1d13b503b9f50c60904da63a2c97f95e5.1429517010.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429517010.git.jackie.huang@windriver.com>
References: <cover.1429517010.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] python-neutron: upgrade to 2015.1.0b3
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Removed the patch neutron-test-nec-plugin-extensions-location.patch
since the main codes and unit tests of NEC plugin had been removed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...utron-test-nec-plugin-extensions-location.patch | 24 ----------------------
 .../recipes-devtools/python/python-neutron_git.bb  |  7 ++-----
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-neutron/neutron-test-nec-plugin-extensions-location.patch

diff --git a/meta-openstack/recipes-devtools/python/python-neutron/neutron-test-nec-plugin-extensions-location.patch b/meta-openstack/recipes-devtools/python/python-neutron/neutron-test-nec-plugin-extensions-location.patch
deleted file mode 100644
index bf54c79..0000000
--- a/meta-openstack/recipes-devtools/python/python-neutron/neutron-test-nec-plugin-extensions-location.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-neutron test: nec plugin extensions location
-
-Some of the neutron built-in testcases failed
-because they can not find nec plugin extensions
-based on the given the relative path.
-
-So forcing these failure testcases to look for
-these extensions using absolute path.
-
-Signed-off-by: Vu Tran <vu.tran@windriver.com>
-
-diff --git a/neutron/tests/unit/nec/test_nec_plugin.py b/neutron/tests/unit/nec/test_nec_plugin.py
-index 2f913ca..1c3f0ce 100644
---- a/neutron/tests/unit/nec/test_nec_plugin.py
-+++ b/neutron/tests/unit/nec/test_nec_plugin.py
-@@ -37,7 +37,7 @@ OFC_MANAGER = 'neutron.plugins.nec.nec_plugin.ofc_manager.OFCManager'
- NOTIFIER = 'neutron.plugins.nec.nec_plugin.NECPluginV2AgentNotifierApi'
- NEC_PLUGIN_INI = """
- [DEFAULT]
--api_extensions_path = neutron/plugins/nec/extensions
-+api_extensions_path = %PYTHON_SITEPACKAGES_DIR%/neutron/plugins/nec/extensions
- [OFC]
- driver = neutron.tests.unit.nec.stub_ofc_driver.StubOFCDriver
- enable_packet_filter = False
diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index 1a5a9b2..3c64d61 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -15,14 +15,13 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
            file://metadata_agent.ini \
            file://neutron-dhcp-agent-netns-cleanup.cron \
            file://0001-neutron.conf-jumpstart-nova-state-reporting-configur.patch \
-           file://neutron-test-nec-plugin-extensions-location.patch \
 	  "
 
 # TBD: update or drop
 # file://uuid_wscheck.patch
 
-SRCREV="1948efa261e47b08e2cde4828321614ee6e169be"
-PV="2015.1.0b2+git${SRCPV}"
+SRCREV = "e86077e8452891cc176841dd6b6316831e12abc1"
+PV = "2015.1.0b3+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -137,8 +136,6 @@ do_install_append() {
     sed -i '/\[keystone_authtoken\]/aidentity_uri=http://127.0.0.1:8081/keystone/admin/' ${NEUTRON_CONF_DIR}/neutron.conf
 
     cp run_tests.sh ${NEUTRON_CONF_DIR}
-
-    sed 's:%PYTHON_SITEPACKAGES_DIR%:${PYTHON_SITEPACKAGES_DIR}:g' -i ${D}${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/tests/unit/nec/test_nec_plugin.py
 }
 
 pkg_postinst_${SRCNAME}-setup () {
-- 
1.9.1


