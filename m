Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D963E00BB5; Tue,  8 Dec 2015 09:34:35 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 0F0CDE00BA0
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:22 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:21 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:28 +0100
Message-ID: <1449596034-8308-17-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 16/42] python-jsonpointer: upgrade 1.7 -> 1.9
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:35 -0000
Content-Type: text/plain

From: Li xin <lixin.fnst@cn.fujitsu.com>

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-jsonpointer_1.7.bb => python-jsonpointer_1.9.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-jsonpointer_1.7.bb => python-jsonpointer_1.9.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb
rename to meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
index 14d38fd..61b2f3f 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonpointer_1.7.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonpointer_1.9.bb
@@ -9,8 +9,8 @@ SRCNAME = "jsonpointer"
 
 SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "97666849a7c390950a5ecfbeb74e64f4"
-SRC_URI[sha256sum] = "46b2016b5e4f2b5cd2edf07c60ca8fe7dd91204ca848f98964be61b3c4760f5e"
+SRC_URI[md5sum] = "c4d3f28e72ba77062538d1c0864c40a9"
+SRC_URI[sha256sum] = "39403b47a71aa782de6d80db3b78f8a5f68ad8dfc9e674ca3bb5b32c15ec7308"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.5.0


