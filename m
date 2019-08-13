Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9BC4E00D59; Tue, 13 Aug 2019 00:52:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77EA5E009E6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 00:52:26 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D7q68J025379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 00:52:16 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 13 Aug 2019 00:51:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 13 Aug 2019 15:51:36 +0800
Message-ID: <20190813075136.6248-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190813075136.6248-1-Qi.Chen@windriver.com>
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] cni: mark as incompatible with mips for 0.7.1 version
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
X-List-Received-Date: Tue, 13 Aug 2019 07:52:26 -0000
Content-Type: text/plain

This version does not build successfully for mips. So mark
it as incompatible to make things clear.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/cni/cni_0.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-networking/cni/cni_0.7.1.bb b/recipes-networking/cni/cni_0.7.1.bb
index 7977040..3af19e2 100644
--- a/recipes-networking/cni/cni_0.7.1.bb
+++ b/recipes-networking/cni/cni_0.7.1.bb
@@ -10,3 +10,4 @@ SRC_URI = "\
         git://github.com/containernetworking/plugins.git;branch=v0.7;destsuffix=plugins;name=plugins \
 	"
 PV = "0.7.1"
+COMPATIBLE_HOST_mips = "null"
-- 
2.17.1


