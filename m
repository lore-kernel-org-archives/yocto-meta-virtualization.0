Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 082D4E00DEF; Thu, 25 Jan 2018 08:28:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8220E00C45
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jan 2018 08:28:44 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0PGSiL8022324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jan 2018 08:28:44 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 25 Jan 2018 08:28:43 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Thu, 25 Jan 2018 11:28:37 -0500
Message-ID: <1516897717-23079-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] openvswitch: uprev to 2.7.3 (latest 2.7.x stable)
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
X-List-Received-Date: Thu, 25 Jan 2018 16:28:46 -0000
Content-Type: text/plain

Eventually we will have to move to OVS 2.8.x or 2.9.x to support the
version of DPDK in meta-dpdk but before we make a version jump(s)
let's uprev to the latest 2.7.x stable release.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

As with other OVS uprevs I have completed in the past I tested out our
normal usecases with OverC and basic manual configurations.
Additionally I ran the ptests and got the usual pass/fail rate (if
anything these numbers are some of the best I have seen).
  ERROR: 2332 tests were run,
  21 failed unexpectedly.
  3 tests were skipped.

Mark

 ...nvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch} | 0
 recipes-networking/openvswitch/openvswitch_git.bb                     | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch => openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch} (100%)

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch
similarity index 100%
rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc.patch
rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1.patch
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index b4aab35..7898067 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -12,11 +12,11 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.7.1+${SRCREV}"
+PV = "2.7.3+${SRCREV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "b29cb89e9e9fe3119b2e5dd5d4fb79141635b7cc"
+SRCREV = "b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1"
 SRC_URI = "file://openvswitch-switch \
            file://openvswitch-switch-setup \
            file://openvswitch-testcontroller \
-- 
2.7.4


