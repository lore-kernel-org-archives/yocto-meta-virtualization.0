Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E608E00C2D; Wed,  2 Dec 2015 08:34:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 251C9E00A71
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:36 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:36 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:37 +0100
Message-ID: <1449073966-29707-32-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 31/40] python-oslo.policy: add new recipe
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:17 -0000
Content-Type: text/plain

A backport of commit ee0bfb3210d4fecd7d16e9b1c730b13dfd600914

Openstack Kilo requires oslo.policy>=0.3.1,<0.4.0, and that
commit introduced 0.4.0, so we had to downgrade the version.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/python-oslo.policy_0.3.2.bb             | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.policy_0.3.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.policy_0.3.2.bb b/meta-openstack/recipes-devtools/python/python-oslo.policy_0.3.2.bb
new file mode 100644
index 0000000..18f2ed9
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.policy_0.3.2.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Oslo Policy library"
+DESCRIPTION = "The Oslo Policy library provides support for RBAC policy enforcement across all OpenStack services."
+HOMEPAGE = "https://pypi.python.org/pypi/oslo.policy"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+
+SRCNAME = "oslo.policy"
+SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1612940bb7a6db558563fd5450b75f7e"
+SRC_URI[sha256sum] = "e69a5c559f95bcbf91eb0ea9f16aa65f0fe5fccc7fa03693d4cc991b76e969a6"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+"
+
+RDEPENDS_${PN} += " \
+        python-oslo.config \
+        python-oslo.i18n \
+        python-oslo.serialization \
+        python-pbr \
+"
-- 
2.1.0


