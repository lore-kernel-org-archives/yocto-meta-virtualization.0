Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 058DCE00830; Tue, 14 Apr 2015 23:01:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C30DE0076B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 23:01:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3F615GO022104
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 23:01:05 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 14 Apr 2015 23:01:11 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 Apr 2015 14:01:05 +0800
Message-ID: <42eaa892a866089ef914a03ea5623a699eb4270b.1429074850.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429074850.git.jackie.huang@windriver.com>
References: <cover.1429074850.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/14] python-neutronclient: upgrade to 2.4.0
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
X-List-Received-Date: Wed, 15 Apr 2015 06:01:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-neutronclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
index 2423f6f..e35be5d 100644
--- a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
@@ -25,8 +25,8 @@ SRC_URI = "git://github.com/openstack/python-neutronclient.git;branch=master \
            file://neutron-api-check.sh \
           "
 
-PV="2.3.11+git${SRCPV}"
-SRCREV="2fa6faaa9b67c0783c502d2b56bfbacc23ecfe64"
+PV = "2.4.0+git${SRCPV}"
+SRCREV = "aa1215a5ad063b299d32ef319eb63d5210249a9b"
 S = "${WORKDIR}/git"
 
 inherit setuptools monitor
-- 
1.9.1


