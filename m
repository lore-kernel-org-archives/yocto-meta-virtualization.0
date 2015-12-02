Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D9C0E009B6; Wed,  2 Dec 2015 08:32:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C68D6E0090E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:32:53 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:32:52 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:09 +0100
Message-ID: <1449073966-29707-4-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 03/40] python-pycadf: upgrade to 0.8.0 (kilo)
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
X-List-Received-Date: Wed, 02 Dec 2015 16:32:57 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/{python-pycadf_0.6.0.bb => python-pycadf_0.8.0.bb}       | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pycadf_0.6.0.bb => python-pycadf_0.8.0.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb b/meta-openstack/recipes-devtools/python/python-pycadf_0.8.0.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb
rename to meta-openstack/recipes-devtools/python/python-pycadf_0.8.0.bb
index 1857063..14b530b 100644
--- a/meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-pycadf_0.8.0.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PR = "r0"
-
 SRCNAME = "pycadf"
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "283ff62801098f499e37aa493c1d18bb"
-SRC_URI[sha256sum] = "9ba1e9ac52ee2a2d6d9cc89847323559cc2ffe7b4d80b703944a0a1f75c7093f"
+SRC_URI[md5sum] = "3a9f439003ed165db7e9a7ef1d360259"
+SRC_URI[sha256sum] = "240d7775682a0f49fb580310dd6459e8a8b5f5619dfdc687f043c3fe21b48ba1"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


