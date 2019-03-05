Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD0F1E00D24; Mon,  4 Mar 2019 23:18:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D74AE00D13
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Mar 2019 23:18:16 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x257IFgI009462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2019 23:18:15 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 4 Mar 2019 23:18:14 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Mon, 4 Mar 2019 23:18:14 -0800
Message-ID: <20190305071814.17006-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] docker-distribution: uprev to v2.7.1
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
X-List-Received-Date: Tue, 05 Mar 2019 07:18:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 2892556..25e4db9 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -3,14 +3,14 @@ SUMMARY = "The Docker toolset to pack, ship, store, and deliver content"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
-SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution \
+SRCREV_distribution="2461543d988979529609e8cb6fca9ca190dc48da"
+SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.7;name=distribution;destsuffix=git/src/github.com/docker/distribution \
            file://docker-registry.service \
           "
 
 PACKAGES =+ "docker-registry"
 
-PV = "v2.6.2"
+PV = "v2.7.1"
 S = "${WORKDIR}/git/src/github.com/docker/distribution"
 
 GO_IMPORT = "import"
-- 
2.21.0


