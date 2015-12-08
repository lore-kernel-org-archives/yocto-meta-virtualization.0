Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F993E00C19; Tue,  8 Dec 2015 09:34:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 23FE2E00B94
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:25 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:25 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:30 +0100
Message-ID: <1449596034-8308-19-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 18/42] python-pecan: upgrade 0.8.3 -> 0.9.0
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:40 -0000
Content-Type: text/plain

From: Li xin <lixin.fnst@cn.fujitsu.com>

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-pecan_0.8.3.bb => python-pecan_0.9.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pecan_0.8.3.bb => python-pecan_0.9.0.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-pecan_0.8.3.bb b/meta-openstack/recipes-devtools/python/python-pecan_0.9.0.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-pecan_0.8.3.bb
rename to meta-openstack/recipes-devtools/python/python-pecan_0.9.0.bb
index e7f32cd..efab57e 100644
--- a/meta-openstack/recipes-devtools/python/python-pecan_0.8.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-pecan_0.9.0.bb
@@ -10,8 +10,8 @@ SRCNAME = "pecan"
 SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "e2b329c5088c2adb1510ac9d1af84bca"
-SRC_URI[sha256sum] = "ca6c31e1fb98e4ae780a44a40a88eacb7a19172d3f64d4e31f32049a784a1281"
+SRC_URI[md5sum] = "f739a18866a83f6b9ac8622ee89ea784"
+SRC_URI[sha256sum] = "d26be0e451c5999504599a9a741534caa0fba97d9bb8991c951f63b79a30b933"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.5.0


