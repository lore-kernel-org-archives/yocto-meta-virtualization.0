Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4667EE00C08; Thu, 26 Nov 2015 07:47:39 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D9B90E00BEA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:37 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:36 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:17 +0100
Message-ID: <1448552846-24382-5-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 04/13] python-flake8: upgrade to 2.4.0
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-flake8_2.3.0.bb => python-flake8_2.4.0.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-flake8_2.3.0.bb => python-flake8_2.4.0.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-flake8_2.3.0.bb b/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-flake8_2.3.0.bb
rename to meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
index 89c9744..7a065b9 100644
--- a/meta-openstack/recipes-devtools/python/python-flake8_2.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-flake8_2.4.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a76e57e683629e1ac2a49406169c2a3"
 
-PR = "r0"
 SRCNAME = "flake8"
 
 SRC_URI = "https://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "488d6166f6b9ef9fe9d433b95e77dc07"
-SRC_URI[sha256sum] = "5ee1a43ccd0716d6061521eec6937c983efa027793013e572712c4da55c7c83e"
+SRC_URI[md5sum] = "d413935bb21026c18aca82654114502f"
+SRC_URI[sha256sum] = "d26a9d0252da9f831b8277b824961bb10b1f9d79f4752d32e4814b7bcd1e089b"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


