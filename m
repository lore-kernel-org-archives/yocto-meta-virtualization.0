Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95571E00C32; Tue,  8 Dec 2015 09:34:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id B25D5E00BB6
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:38 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:37 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:38 +0100
Message-ID: <1449596034-8308-27-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 26/42] python-testtools: upgrade 0.9.33 -> 1.8.0
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:57 -0000
Content-Type: text/plain

From: Lei Maohui <leimaohui@cn.fujitsu.com>

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-testtools_0.9.33.bb => python-testtools_1.8.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-testtools_0.9.33.bb => python-testtools_1.8.0.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb
rename to meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
index 48663e9..80a7489 100644
--- a/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb
+++ b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
@@ -9,8 +9,8 @@ SRCNAME = "testtools"
 
 SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "310ce6fab8affecdc7415ff910a83c42"
-SRC_URI[sha256sum] = "5b62231fea71ccb2361d48286481b198ccb8768bf81f8aaec1c8d5fb98eaaca3"
+SRC_URI[md5sum] = "89965b0b39930c0d1f5e07c6f545e6a0"
+SRC_URI[sha256sum] = "8afd6400fb4e75adb0b29bd09695ecb2024cd7befab4677a58c147701afadd97"
 
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
2.5.0


