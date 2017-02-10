Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C990BE00519; Fri, 10 Feb 2017 07:44:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80117E007C2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:44:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1AFicVH010884
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:44:39 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Feb 2017 07:44:38 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 10 Feb 2017 10:44:28 -0500
Message-ID: <1486741468-4476-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486741468-4476-1-git-send-email-mark.asselstine@windriver.com>
References: <1486741468-4476-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 2/2] runc: uprev to version required by docker 1.13.0
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
X-List-Received-Date: Fri, 10 Feb 2017 15:44:46 -0000
Content-Type: text/plain

At the moment we only use runc in conjunction with docker. In order to
allow docker to function correctly we need to use the version
specified in docker's vendor.conf file. Uprev runc to this version.

NOTE that the docker folks have actually forked runc and I have used
this fork as the SRC_URI. I could have chosen instead to use the old
SRC_URI along with the fork point commit as the SRCREV, and then
applied the 2 commits the docker team have added beyond the fork. I
opted instead to use the fork such that 'docker info' would not
complain about a version mismatch. This also makes it easier to google
for issues since the commit ID matches.

NOTE when we eventually have more users of runc we will have to
determine a strategy to either have them all use the same version or
allow for multiple versions of runc on the system. This is also true
for containerd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/runc/runc_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/runc/runc_git.bb b/recipes-containers/runc/runc_git.bb
index 23c0094..c5cf40b 100644
--- a/recipes-containers/runc/runc_git.bb
+++ b/recipes-containers/runc/runc_git.bb
@@ -4,9 +4,9 @@ DESCRIPTION = "runc is a CLI tool for spawning and running containers according
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV = "1cdaa709f151b61cee2bdaa09d8e5d2b58a8ba72"
+SRCREV = "2f7393a47307a16f8cee44a37b262e8b81021e3e"
 SRC_URI = "\
-	git://github.com/opencontainers/runc;branch=master \
+	git://github.com/docker/runc.git;nobranch=1 \
 	"
 
 # Apache-2.0 for containerd
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
 S = "${WORKDIR}/git"
 
-RUNC_VERSION = "1.0.0-rc1"
+RUNC_VERSION = "1.0.0-rc2"
 PV = "${RUNC_VERSION}+git${SRCREV}"
 
 DEPENDS = "go-cross-${TARGET_ARCH} \
-- 
2.7.4


