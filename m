Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79E50E00B7D; Tue,  8 Dec 2015 09:34:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 679F4E00ACF
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:15 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:14 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:23 +0100
Message-ID: <1449596034-8308-12-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 11/42] python-eventlet: upgrade 0.17.1 -> 0.17.4
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

From: Jackie Huang <jackie.huang@windriver.com>

(From: ba3e02f and 8a676f4, squashed)

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/{python-eventlet_0.17.1.bb => python-eventlet_0.17.4.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-eventlet_0.17.1.bb => python-eventlet_0.17.4.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.17.1.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-eventlet_0.17.1.bb
rename to meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb
index b566649..32494e1 100644
--- a/meta-openstack/recipes-devtools/python/python-eventlet_0.17.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.17.4.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-PR = "r0"
 SRCNAME = "eventlet"
 
 SRC_URI = "http://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b66053e6dbfd5a6996750fa09b0af6ba"
-SRC_URI[sha256sum] = "de9c23eb94e55150b25150822a28f91656028987353fef3f687cc285d018dd5a"
+SRC_URI[md5sum] = "fea0993b14cc7322f944bdd535c4f24a"
+SRC_URI[sha256sum] = "8721e9714eaff8d20f2407e0d3a80069db6b57c9226c26ee9db25c541d06556d"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.5.0


