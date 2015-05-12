Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23825E00820; Mon, 11 May 2015 19:09:25 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 963CBE00477
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 May 2015 19:09:24 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C29NaA017959
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 May 2015 19:09:23 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 11 May 2015 19:09:23 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 12 May 2015 10:09:20 +0800
Message-ID: <1431396562-12021-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3] python-cmd2: fix the incorrect checksum
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
X-List-Received-Date: Tue, 12 May 2015 02:09:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
index 9558cc6..0794a4e 100644
--- a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
+++ b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
 
-PR = "r0"
 SRCNAME = "cmd2"
 
 SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "842df29ff2f72d64d7f0d917039c0e51"
-SRC_URI[sha256sum] = "8e98c7a1cfd106183559240b269e7cd9fe97e8342b5c05295f591aab6fd2f4f0"
+SRC_URI[md5sum] = "c32c9a897e010c977b50c1ddc13f09fe"
+SRC_URI[sha256sum] = "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


