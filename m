Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85B14E00B21; Thu, 26 Nov 2015 07:47:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 42AE6E00B20
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:50 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:48 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:25 +0100
Message-ID: <1448552846-24382-13-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 12/13] python-fixtures: upgrade 1.0.0 -> 1.3.1
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

From: Li xin <lixin.fnst@cn.fujitsu.com>

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-fixtures_1.0.0.bb => python-fixtures_1.3.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-fixtures_1.0.0.bb => python-fixtures_1.3.1.bb} (82%)

diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
similarity index 82%
rename from meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
rename to meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
index f0cb453..c2b79e4 100644
--- a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
@@ -9,8 +9,8 @@ SRCNAME = "fixtures"
 
 SRC_URI = "https://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4f3225a80397796be85729b659241610"
-SRC_URI[sha256sum] = "4494c4862ad99ffb8354f7456f1c9a4ba68b607d9dabb912999d4ad60c7d9f54"
+SRC_URI[md5sum] = "72959be66e26b09641a1e3902f631e62"
+SRC_URI[sha256sum] = "b63cf3bb37f83ff815456e2d0e118535ae9a4bf43e76d9a1cf3286041bf717ce"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


