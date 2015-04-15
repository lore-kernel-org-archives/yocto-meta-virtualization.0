Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40667E009BD; Tue, 14 Apr 2015 22:58:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 423E8E009BE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 22:58:36 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3F5wZlT027081
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 22:58:36 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 14 Apr 2015 22:58:41 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 Apr 2015 13:58:28 +0800
Message-ID: <1ed4d07be71e4fccf6892227c2b1ff498101f4aa.1429074850.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429074850.git.jackie.huang@windriver.com>
References: <cover.1429074850.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/14] python-cephclient: upgrade to 0.1.0.5
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
X-List-Received-Date: Wed, 15 Apr 2015 05:58:38 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{python-cephclient_0.1.0.4.bb => python-cephclient_0.1.0.5.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-cephclient_0.1.0.4.bb => python-cephclient_0.1.0.5.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.4.bb b/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.5.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.4.bb
rename to meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.5.bb
index 19f7570..ad55514 100644
--- a/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-cephclient_0.1.0.5.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 PR = "r0"
 
 SRCNAME = "python-cephclient"
-SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-v${PV}.tar.gz"
 
-SRC_URI[md5sum] = "026aefd497c0426317d951f9a6e6f251"
-SRC_URI[sha256sum] = "23ceae1f30238f7f57912422cf9baa43b7c80ed88fc14ec749986eef5f2d6007"
+SRC_URI[md5sum] = "e3746607f1af1573a241b4995c10c938"
+SRC_URI[sha256sum] = "9776b786da2aebdc0439ea2f809cc8923f52bc0cf610f77a9c1348466961134b"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


