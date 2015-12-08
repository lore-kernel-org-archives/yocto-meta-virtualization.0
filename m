Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D1CBE00B89; Tue,  8 Dec 2015 09:34:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D40D7E00B89
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:13 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:12 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:22 +0100
Message-ID: <1449596034-8308-11-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 10/42] python-beautifulsoup4: upgrade 4.3.2 -> 4.4.0
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:28 -0000
Content-Type: text/plain

From: Lei Maohui <leimaohui@cn.fujitsu.com>

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...ython-beautifulsoup4_4.3.2.bb => python-beautifulsoup4_4.4.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-beautifulsoup4_4.3.2.bb => python-beautifulsoup4_4.4.0.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.3.2.bb b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.0.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.3.2.bb
rename to meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.0.bb
index 2d3cddb..0b67b80 100644
--- a/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.3.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-beautifulsoup4_4.4.0.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Screen-scraping library"
 HOMEPAGE = "https://pypi.python.org/pypi/beautifulsoup4/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=83e365dc17176bd72ba7d08ca0555efa"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=39dacabe5494f61c8680f6fa7323b596"
 
 PR = "r0"
 SRCNAME = "beautifulsoup4"
 
 SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b8d157a204d56512a4cc196e53e7d8ee"
-SRC_URI[sha256sum] = "a2b29bd048ca2fe54a046b29770964738872a9747003a371344a93eedf7ad58e"
+SRC_URI[md5sum] = "63d1f33e6524f408cb6efbc5da1ae8a5"
+SRC_URI[sha256sum] = "fad91da88f69438b9ba939ab1b2cabaa31b1d914f1cccb4bb157a993ed2917f6"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.5.0


