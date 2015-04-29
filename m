Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8544E009FD; Tue, 28 Apr 2015 20:10:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83E8AE009F6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:44 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39iEn009424
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:44 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:43 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:53 +0800
Message-ID: <599eb9f4ce6918581458494f0d3e1a8e0d080758.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 43/55] python-testrepository: upgrade to 0.0.20
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...thon-testrepository_0.0.18.bb => python-testrepository_0.0.20.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-testrepository_0.0.18.bb => python-testrepository_0.0.20.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python-testrepository_0.0.18.bb b/meta-openstack/recipes-devtools/python/python-testrepository_0.0.20.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python-testrepository_0.0.18.bb
rename to meta-openstack/recipes-devtools/python/python-testrepository_0.0.20.bb
index f4e708e..edb6fe8 100644
--- a/meta-openstack/recipes-devtools/python/python-testrepository_0.0.18.bb
+++ b/meta-openstack/recipes-devtools/python/python-testrepository_0.0.20.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f19071a777e237c55ec3ab83284b31b8"
 
-PR = "r0"
 SRCNAME = "testrepository"
 
 SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f1f234caa753179ccfad8f7f764ddde4"
-SRC_URI[sha256sum] = "ba15301c6ec6bf1b8e0dad10ac7313b11e17ceb8d28ec4a3625c9aaa766727fd"
+SRC_URI[md5sum] = "f648b0aceeca4fcd5f8a62eeedea289b"
+SRC_URI[sha256sum] = "752449bc98c20253ec4611c40564aea93d435a5bf3ff672208e01cc10e5858eb"
 
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
1.9.1


