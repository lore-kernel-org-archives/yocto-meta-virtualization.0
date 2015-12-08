Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5747E00B94; Tue,  8 Dec 2015 09:34:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 26765E00BF7
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:36 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:36 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:37 +0100
Message-ID: <1449596034-8308-26-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 25/42] python-jsonschema: upgrade 2.4.0 -> 2.5.1
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:55 -0000
Content-Type: text/plain

From: Li xin <lixin.fnst@cn.fujitsu.com>

The newer python-jsonschema depends on python-vcversioner.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../{python-jsonschema_2.4.0.bb => python-jsonschema_2.5.1.bb}      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-jsonschema_2.4.0.bb => python-jsonschema_2.5.1.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-jsonschema_2.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
index e27a242..a3a7ec0 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonschema_2.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
@@ -9,9 +9,11 @@ SRCNAME = "jsonschema"
 
 SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.zip"
 
-SRC_URI[md5sum] = "f645c88123189976058fcf550c02e50f"
-SRC_URI[sha256sum] = "acf1e360b4682d64ba6acc35dbc65d81d9bde68a291a97f14f16f4282733f5a4"
+SRC_URI[md5sum] = "e491298485bdefeecb0f1ca3d65e5292"
+SRC_URI[sha256sum] = "9088494da4c74497a7a27842ae4ca9c3355b5f7754121edc440463eaf020f079"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
+
+DEPENDS += "python-vcversioner"
-- 
2.5.0


