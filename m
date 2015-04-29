Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 831CEE009E2; Tue, 28 Apr 2015 20:09:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C651AE00949
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:13 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39DE2029991
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:13 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:13 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:27 +0800
Message-ID: <bb03feef59394d850007c909cbade323294a4f44.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 17/55] python-lockfile: upgrade to 0.10.2
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-lockfile_0.9.1.bb => python-lockfile_0.10.2.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-lockfile_0.9.1.bb => python-lockfile_0.10.2.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-lockfile_0.9.1.bb b/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-lockfile_0.9.1.bb
rename to meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
index 0449f08..35131a7 100644
--- a/meta-openstack/recipes-devtools/python/python-lockfile_0.9.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2340dffbbfea534b58f1349984eeef72"
 
-PR = "r0"
 SRCNAME = "lockfile"
 
 SRC_URI = "https://pypi.python.org/packages/source/l/lockfile/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ce61468d4c1263e3005737bbed2641f0"
-SRC_URI[sha256sum] = "23da589c91f59cb7c644d5ce5df539d448341bd479917d6dde973f82e2719147"
+SRC_URI[md5sum] = "1aa6175a6d57f082cd12e7ac6102ab15"
+SRC_URI[sha256sum] = "9e42252f17d1dd89ee31745e0c4fbe58862c25147eb0ef5295c9cd9bcb4ea2c1"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


