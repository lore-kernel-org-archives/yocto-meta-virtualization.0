Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF7E0E0095C; Wed, 10 Oct 2018 02:31:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57B02E006AF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Oct 2018 02:31:31 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A9VTin007887
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 02:31:30 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 02:31:28 -0700
From: <mingli.yu@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 10 Oct 2018 17:31:26 +0800
Message-ID: <1539163886-138214-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-openstack][PATCH] layer.conf: set PREFERRED_VERSION for python-networkx
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
X-List-Received-Date: Wed, 10 Oct 2018 09:31:31 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Only set PREFERRED_VERSION for python-networkx
when the openstack distro is enabled

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-openstack/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 126f37f..2dceb47 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -32,7 +32,7 @@ PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
 PREFERRED_VERSION_python-eventlet = "0.20.0"
 PREFERRED_VERSION_python-warlock = "1.2.0"
 PREFERRED_VERSION_python-jsonschema = "2.6.0"
-PREFERRED_VERSION_python-networkx = "1.11"
+PREFERRED_VERSION_python-networkx = "${@bb.utils.contains('DISTRO_FEATURES', 'openstack', '1.11', '', d)}"
 PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.7.4


