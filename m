Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3539CE00AAF; Wed,  2 Dec 2015 08:34:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A7A2EE008E5
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:18 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:17 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:25 +0100
Message-ID: <1449073966-29707-20-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 19/40] python-oslo.messaging: upgrade to 1.8.3
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:08 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/python-oslo.messaging_git.bb            | 23 ++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
index 8841ec0..82a5c98 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
@@ -4,26 +4,33 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PR = "r0"
-
 SRCNAME = "oslo.messaging"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo"
 
-PV = "1.6.0"
-SRCREV = "68cd8cfecc12a40b61a7b8557aad7b5a4e1f1c6d"
+PV = "1.8.3"
+SRCREV = "0f24108058fbf15752d384be4c13e4fbac801f2a"
 S = "${WORKDIR}/git"
 
 inherit setuptools
 
-# DEPENDS_default: python-pip
-
 DEPENDS += " \
         python-pip \
         python-pbr \
         "
 
-# RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         bash \
         python-pbr \
+        python-oslo.config \
+        python-oslo.utils \
+        python-oslo.serialization \
+        python-oslo.i18n \
+        python-stevedore \
+        python-six \
+        python-eventlet \
+        python-pyyaml \
+        python-kombu \
+        python-oslo.middleware \
+        python-futures \
+        python-aioeventlet \
         "
-- 
2.1.0


