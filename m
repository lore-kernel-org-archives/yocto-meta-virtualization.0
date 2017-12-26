Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90081E00DF8; Mon, 25 Dec 2017 17:23:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8211DE00D91
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Dec 2017 17:23:18 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBQ1NHHx001160
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Dec 2017 17:23:17 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 25 Dec 2017 17:23:17 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 26 Dec 2017 09:20:50 +0800
Message-ID: <20171226012050.23647-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171226012050.23647-1-Qi.Chen@windriver.com>
References: <20171226012050.23647-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] librdmacm: use virtual/libibverbs
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
X-List-Received-Date: Tue, 26 Dec 2017 01:23:24 -0000
Content-Type: text/plain

Use 'virtual/libibverbs' instead of hardcoding libibverbs.
This is to avoid potential conflicts between libibverbs in this layer
and dpdk-dev-libibverbs in meta-dpdk layer.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/librdmacm/librdmacm_1.0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/librdmacm/librdmacm_1.0.17.bb b/recipes-extended/librdmacm/librdmacm_1.0.17.bb
index ba022b0..40cacdc 100644
--- a/recipes-extended/librdmacm/librdmacm_1.0.17.bb
+++ b/recipes-extended/librdmacm/librdmacm_1.0.17.bb
@@ -12,7 +12,7 @@ SECTION = "libs/devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=39cc3044d68741f9005da73e9b92db95"
 
-DEPENDS = "libibverbs"
+DEPENDS = "virtual/libibverbs"
 
 # Repo is at http://git.openfabrics.org/git?p=~shefty/librdmacm.git
 SRC_URI = "http://www.openfabrics.org/downloads/rdmacm/${BPN}-${PV}.tar.gz \
-- 
2.11.0


