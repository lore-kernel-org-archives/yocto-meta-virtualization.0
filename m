Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70D83E009A5; Tue, 28 Apr 2015 20:09:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B3F5E00932
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T395e3009371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:05 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:05 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:20 +0800
Message-ID: <a5ed45e7a086758193084cb8c50865d4c4e645d5.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/55] python-eventlet: upgrade to 0.17.3
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-eventlet_0.17.1.bb => python-eventlet_0.17.3.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-eventlet_0.17.1.bb => python-eventlet_0.17.3.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.17.1.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.17.3.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-eventlet_0.17.1.bb
rename to meta-openstack/recipes-devtools/python/python-eventlet_0.17.3.bb
index b566649..d85bef0 100644
--- a/meta-openstack/recipes-devtools/python/python-eventlet_0.17.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.17.3.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-PR = "r0"
 SRCNAME = "eventlet"
 
 SRC_URI = "http://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b66053e6dbfd5a6996750fa09b0af6ba"
-SRC_URI[sha256sum] = "de9c23eb94e55150b25150822a28f91656028987353fef3f687cc285d018dd5a"
+SRC_URI[md5sum] = "12c855e37dd688d3137ecc88d5b8f05b"
+SRC_URI[sha256sum] = "d39e4124a7b10055c78d5c51c2ee23789a8ebf4f8b811fee4533542ecd3ac99a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


