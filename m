Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50C91E00D36; Sun,  5 May 2019 19:18:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3389E00963
	for <meta-virtualization@yoctoproject.org>;
	Sun,  5 May 2019 19:18:01 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x462I1F8007239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 May 2019 19:18:01 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 5 May 2019 19:18:00 -0700
From: <kai.kang@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Sun, 5 May 2019 22:17:18 -0400
Message-ID: <20190506021718.128811-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190506021718.128811-1-kai.kang@windriver.com>
References: <20190506021718.128811-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH v2 3/3] layer.conf: depends on meta-filesystems
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
X-List-Received-Date: Mon, 06 May 2019 02:18:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Package glusterfs requires fuse which is from layer meta-filesystems.
So update layer.conf to depend on the layer.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 8df9829..203f9db 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,4 +8,4 @@ BBFILE_COLLECTIONS += "cloud-services-layer"
 BBFILE_PATTERN_cloud-services-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_cloud-services-layer = "5"
 LAYERSERIES_COMPAT_cloud-services-layer = "thud warrior"
-LAYERDEPENDS_cloud-services-layer = "core"
+LAYERDEPENDS_cloud-services-layer = "core filesystems-layer"
-- 
2.20.0


