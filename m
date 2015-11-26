Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4B30E00C0A; Thu, 26 Nov 2015 07:47:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id B05E4E00C13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:48 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:47 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:24 +0100
Message-ID: <1448552846-24382-12-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 11/13] python-setuptools-git: upgrade to 1.1
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...python-setuptools-git_1.0.bb => python-setuptools-git_1.1.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-setuptools-git_1.0.bb => python-setuptools-git_1.1.bb} (68%)

diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.0.bb b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
similarity index 68%
rename from meta-openstack/recipes-devtools/python/python-setuptools-git_1.0.bb
rename to meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
index 8c41969..9447744 100644
--- a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
@@ -4,15 +4,14 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
 
-PR = "r0"
 SRCNAME = "setuptools-git"
 
-SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}b1.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ac67cbaa1336b7de25b1b5ff93b4e90d"
-SRC_URI[sha256sum] = "dccd496b4166315c2b6b842f3dcd417b22e2cb43aaa4a8983b1ea0ceae0fe328"
+SRC_URI[md5sum] = "7b5967e9527c789c3113b07a1f196f6e"
+SRC_URI[sha256sum] = "047d7595546635edebef226bc566579d422ccc48a8a91c7d32d8bd174f68f831"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}b1"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-- 
2.1.0


