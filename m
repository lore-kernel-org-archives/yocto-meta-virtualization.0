Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3502EE00BE6; Thu, 26 Nov 2015 07:47:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 56B40E00BE6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:36 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:35 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:16 +0100
Message-ID: <1448552846-24382-4-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 03/13] python-amqp: upgrade to 1.4.6
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:38 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-amqp_1.3.2.bb => python-amqp_1.4.6.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-amqp_1.3.2.bb => python-amqp_1.4.6.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-amqp_1.3.2.bb b/meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-amqp_1.3.2.bb
rename to meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb
index d10d4e3..273018c 100644
--- a/meta-openstack/recipes-devtools/python/python-amqp_1.3.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
 
-PR = "r0"
 SRCNAME = "amqp"
 
 SRC_URI = "https://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0f15c0cd31bae0563107a22f17cfdf63"
-SRC_URI[sha256sum] = "9d321609f98f6742eeb2f7d22334749936a26047af5563818e175444ad1e2ba4"
+SRC_URI[md5sum] = "a061581b6864f838bffd62b6a3d0fb9f"
+SRC_URI[sha256sum] = "ebcfc867de5a68f9f5ba14d11dbad88e6aff8435a8d39339d5ceb0e5b06de640"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


