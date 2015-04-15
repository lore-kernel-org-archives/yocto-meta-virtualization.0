Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4FB4FE009BE; Tue, 14 Apr 2015 23:01:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE243E009C6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 23:01:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3F61AZe027413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 23:01:10 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 14 Apr 2015 23:01:16 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 Apr 2015 14:01:09 +0800
Message-ID: <f09ad132d25ea60d57b00c24a4f789e6f5bc9c02.1429074850.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429074850.git.jackie.huang@windriver.com>
References: <cover.1429074850.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/14] python-troveclient: upgrade to 1.0.9
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
X-List-Received-Date: Wed, 15 Apr 2015 06:01:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-troveclient_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
index 4691145..a55ce27 100644
--- a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
 	git://github.com/openstack/python-troveclient.git;branch=master \
 	"
 
-PV="1.0.8+git${SRCPV}"
-SRCREV="51aa1a8dbd1b45e6abdaf571d1d73a6d7405fd3a"
+PV = "1.0.9+git${SRCPV}"
+SRCREV = "a36ebe539ce0affef5388b7edd7a6a230a0fde6c"
 S = "${WORKDIR}/git"
 
 inherit setuptools hosts default_configs
-- 
1.9.1


