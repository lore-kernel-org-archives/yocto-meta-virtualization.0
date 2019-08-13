Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A086E00D8F; Tue, 13 Aug 2019 00:51:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24F16E009E6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 00:51:54 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D7psO5009777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 00:51:54 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 13 Aug 2019 00:51:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 13 Aug 2019 15:51:35 +0800
Message-ID: <20190813075136.6248-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190813075136.6248-1-Qi.Chen@windriver.com>
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] cni: upgrade git version to latest master
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
X-List-Received-Date: Tue, 13 Aug 2019 07:51:56 -0000
Content-Type: text/plain

Upgrade the git version to latest master to make the recipe
truly serve its purpose.

This upgrades both cni and plugins repos.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/cni/cni_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 06b37a4..60c39f1 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -1,10 +1,10 @@
 # This cni version is supposed to track latest upstream.
 require cni.inc
 
-SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"
-SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"
+SRCREV_cni = "8c6c47d1c7fcf51c8d0c939d2af06dd108f876da"
+SRCREV_plugins = "2d6d4b260a98973a206fde18bdde4f2511c72c60"
 SRC_URI = "\
 	git://github.com/containernetworking/cni.git;nobranch=1;name=cni \
         git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins \
 	"
-PV = "0.7.0+git${SRCREV_cni}"
+PV = "0.7.1+git${SRCREV_cni}"
-- 
2.17.1


