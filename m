Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2F9DE00B30; Wed,  2 Dec 2015 08:33:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 1E1AAE0083E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:32:59 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:32:58 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:13 +0100
Message-ID: <1449073966-29707-8-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 07/40] python-oslo.i18n: upgrade to 1.5.0 (kilo)
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
X-List-Received-Date: Wed, 02 Dec 2015 16:33:39 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/{python-oslo.i18n_1.4.0.bb => python-oslo.i18n_1.5.0.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.i18n_1.4.0.bb => python-oslo.i18n_1.5.0.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.5.0.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.i18n_1.5.0.bb
index d2bc53b..dc50ad9 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.5.0.bb
@@ -9,8 +9,8 @@ PR = "r0"
 SRCNAME = "oslo.i18n"
 SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "afd0a3394785b1b37959c1384129a554"
-SRC_URI[sha256sum] = "a3d64e8d2b4235a457da2c6269d8c97e867a90ba7d938fe0ed3cfc792c8c87bb"
+SRC_URI[md5sum] = "4ed6035729343bb4becdc5ffe6dc8e24"
+SRC_URI[sha256sum] = "cd09da0780e45737b784bdc026ea705ad006e3c003aa5dfeab83f269b4ea0e70"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -27,4 +27,5 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         python-babel \
         python-pbr \
+        python-six \
         "
-- 
2.1.0


