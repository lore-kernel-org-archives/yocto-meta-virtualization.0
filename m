Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4295E00C15; Thu, 26 Nov 2015 07:47:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id CAE38E00BFD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:51 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:50 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:26 +0100
Message-ID: <1448552846-24382-14-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 13/13] python-pyscss: upgrade to 1.3.4
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-pyscss_1.2.1.bb => python-pyscss_1.3.4.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pyscss_1.2.1.bb => python-pyscss_1.3.4.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-pyscss_1.2.1.bb b/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-pyscss_1.2.1.bb
rename to meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
index d52fe05..f26352a 100644
--- a/meta-openstack/recipes-devtools/python/python-pyscss_1.2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=28155276e8df3f75bbd327335f66f2fa"
 
-PR = "r0"
 
 SRCNAME = "pyScss"
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "9a5c24922643f6e90ea03d520700521b"
-SRC_URI[sha256sum] = "6f486363f5fac20d218dc5d11b8af4e5b52242a59e5067f42ca227152a7df3cc"
+SRC_URI[md5sum] = "9527b4864cd6023f77a8277e6fb773d7"
+SRC_URI[sha256sum] = "d0323110ecc7d3ead6b99cfec31301306928130e4d0a9eb13226bf390aba8c0e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


