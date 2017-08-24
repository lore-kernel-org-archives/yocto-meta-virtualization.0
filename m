Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6EB91E008D2; Wed, 23 Aug 2017 18:13:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5389DE00349
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 18:13:01 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O1D0LW023386
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 18:13:00 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 23 Aug 2017 18:12:56 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2017 09:13:42 +0800
Message-ID: <1503537222-1882-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] docker-distribution: update to 2.6.2
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
X-List-Received-Date: Thu, 24 Aug 2017 01:13:03 -0000
Content-Type: text/plain

CVE-2017-11468 is fixed in this release.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-11468

Release note:
https://github.com/docker/distribution/releases/tag/v2.6.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{docker-distribution_git.bb => docker-distribution_2.6.2.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename recipes-containers/docker-distribution/{docker-distribution_git.bb => docker-distribution_2.6.2.bb} (90%)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_2.6.2.bb
similarity index 90%
rename from recipes-containers/docker-distribution/docker-distribution_git.bb
rename to recipes-containers/docker-distribution/docker-distribution_2.6.2.bb
index 08b6d70..b0a380b 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_2.6.2.bb
@@ -3,14 +3,13 @@ SUMMARY = "The Docker toolset to pack, ship, store, and deliver content"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRCREV_distribution="0810eba2adf048b77621472991211924d9ec31c5"
-SRC_URI = "git://github.com/docker/distribution.git;branch=master;name=distribution;destsuffix=git/src/github.com/docker/distribution \
+SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
+SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution \
            file://docker-registry.service \
           "
 
 PACKAGES =+ "docker-registry"
 
-PV = "v2.6.0-rc+git${SRCPV}"
 S = "${WORKDIR}/git/src/github.com/docker/distribution"
 
 inherit goarch
-- 
2.7.4


