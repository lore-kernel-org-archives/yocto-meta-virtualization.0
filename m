Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9261E00BFF; Wed,  2 Dec 2015 08:34:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 66A4CE007B1
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:32 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:31 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:34 +0100
Message-ID: <1449073966-29707-29-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 28/40] python-neutron: upgrade to 2015.1.2
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:13 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-neutron_git.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index 1a5a9b2..e665e5e 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -4,10 +4,9 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r1"
 SRCNAME = "neutron"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
            file://neutron-server.init \
            file://neutron-agent.init \
            file://l3_agent.ini \
@@ -15,14 +14,13 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
            file://metadata_agent.ini \
            file://neutron-dhcp-agent-netns-cleanup.cron \
            file://0001-neutron.conf-jumpstart-nova-state-reporting-configur.patch \
-           file://neutron-test-nec-plugin-extensions-location.patch \
 	  "
 
 # TBD: update or drop
 # file://uuid_wscheck.patch
 
-SRCREV="1948efa261e47b08e2cde4828321614ee6e169be"
-PV="2015.1.0b2+git${SRCPV}"
+SRCREV="b175e03b12527d23c05fc45016e927a20c98d2f1"
+PV="2015.1.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -137,8 +135,6 @@ do_install_append() {
     sed -i '/\[keystone_authtoken\]/aidentity_uri=http://127.0.0.1:8081/keystone/admin/' ${NEUTRON_CONF_DIR}/neutron.conf
 
     cp run_tests.sh ${NEUTRON_CONF_DIR}
-
-    sed 's:%PYTHON_SITEPACKAGES_DIR%:${PYTHON_SITEPACKAGES_DIR}:g' -i ${D}${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/tests/unit/nec/test_nec_plugin.py
 }
 
 pkg_postinst_${SRCNAME}-setup () {
@@ -286,6 +282,7 @@ RDEPENDS_${PN} += "python-paste \
 	python-markupsafe \
 	python-pyparsing \
 	python-pbr \
+	python-jsonrpclib \
 	"
 
 RDEPENDS_${SRCNAME} = "${PN} \
-- 
2.1.0


