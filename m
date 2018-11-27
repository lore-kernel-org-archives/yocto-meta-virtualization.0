Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0F86E00C70; Tue, 27 Nov 2018 13:48:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66A3CE00C46
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Nov 2018 13:48:37 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wARLmB8g009501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Nov 2018 13:48:26 -0800
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 27 Nov 2018 13:48:10 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 27 Nov 2018 16:48:09 -0500
Message-ID: <1543355289-16095-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openvswitch: uprev from 2.10.0 to 2.10.1
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
X-List-Received-Date: Tue, 27 Nov 2018 21:48:37 -0000
Content-Type: text/plain

Pickup the latest security and bug fixes for openvswitch.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...nvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch} | 0
 recipes-networking/openvswitch/openvswitch_git.bb                     | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch => openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch} (100%)

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch
similarity index 100%
rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch
rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index a930933..b8bbb3a 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -14,11 +14,11 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.10.0+${SRCREV}"
+PV = "2.10.1+${SRCREV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "5563e309b80bbea9bff538e71ecfd7e5e538bab9"
+SRCREV = "78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e"
 SRC_URI = "file://openvswitch-switch \
            file://openvswitch-switch-setup \
            file://openvswitch-testcontroller \
-- 
2.7.4


