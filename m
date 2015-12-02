Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3C9CE00AAB; Wed,  2 Dec 2015 08:33:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 170A3E00825
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:32:56 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:32:55 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:11 +0100
Message-ID: <1449073966-29707-6-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 05/40] python-stevedore: upgrade to 1.3.0 (kilo)
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
X-List-Received-Date: Wed, 02 Dec 2015 16:33:23 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 ...{python-stevedore_1.2.0.bb => python-stevedore_1.3.0.bb} | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-stevedore_1.2.0.bb => python-stevedore_1.3.0.bb} (53%)

diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.2.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb
similarity index 53%
rename from meta-openstack/recipes-devtools/python/python-stevedore_1.2.0.bb
rename to meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb
index 0f493eb..6100f68 100644
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb
@@ -4,17 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PR = "r0"
+SRC_URI[md5sum] = "e9ed2a1cf91ee76fd9045f902fa58089"
+SRC_URI[sha256sum] = "beab2b7f91966d259796392c39ed6f260b32851861561dd9f3b9be2fd0c426a5"
 
-SRCNAME = "stevedore"
-SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "bd82728ab03e62121fbbb077bcd55fdb"
-SRC_URI[sha256sum] = "3f70db9052c26e66dac61cb73d8c6f5211373983d39872addab617c759db4b45"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi
 
 DEPENDS += " \
         python-pip \
-- 
2.1.0


