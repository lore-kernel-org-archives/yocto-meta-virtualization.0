Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D45DE00994; Mon, 20 Apr 2015 01:09:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B2E1E00990
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Apr 2015 01:09:24 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89O1x029737
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Apr 2015 01:09:24 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 20 Apr 2015 01:09:23 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 20 Apr 2015 16:09:18 +0800
Message-ID: <1e1f181ff32ea0408258c3531012f5c32adc024e.1429517010.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429517010.git.jackie.huang@windriver.com>
References: <cover.1429517010.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] python-keystonemiddleware: upgrade to 1.5.0
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-keystonemiddleware_git.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb b/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
index f4ce244..9c23f61 100644
--- a/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystonemiddleware_git.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
 	git://git.openstack.org/openstack/keystonemiddleware;branch=master \
 	"
 
-PV="1.4.0+git${SRCPV}"
-SRCREV="782fb0129d2eb7f181f890068767ce2b6906b2bd"
+PV = "1.5.0+git${SRCPV}"
+SRCREV = "06bdfc886fed7e30684a612a3c6ff8616eb2be34"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
1.9.1


