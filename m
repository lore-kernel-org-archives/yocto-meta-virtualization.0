Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6EABE00D35; Sun,  5 May 2019 19:18:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74FBDE00963
	for <meta-virtualization@yoctoproject.org>;
	Sun,  5 May 2019 19:18:01 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x462I05X027649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 May 2019 19:18:00 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 5 May 2019 19:17:59 -0700
From: <kai.kang@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Sun, 5 May 2019 22:17:17 -0400
Message-ID: <20190506021718.128811-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190506021718.128811-1-kai.kang@windriver.com>
References: <20190506021718.128811-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH v2 2/3] librdmacm: set imcompatible with arm 32 and mips arches
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

librdmacm depends on package libibverbs which has been set imcompatible
with arm 32 and mips arches by commit 215b975.

When build librdmacm it shows errors:

| NOTE: Resolving any missing task queue dependencies
| ERROR: Nothing PROVIDES 'virtual/libibverbs' (but
|   .../meta-cloud-services/recipes-extended/librdmacm/librdmacm_1.1.0.bb
|   DEPENDS on or otherwise requires it)
| libibverbs PROVIDES virtual/libibverbs but was skipped: incompatible
|   with host arm-wrs-linux-gnueabi (not in COMPATIBLE_HOST)
| ERROR: Required build target 'librdmacm' has no buildable providers.
|   Missing or unbuildable dependency chain was: ['librdmacm', 'virtual/libibverbs']

So set librdmacm imcompatible with arm 32 and mips arches too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/librdmacm/librdmacm_1.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/librdmacm/librdmacm_1.1.0.bb b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
index 30a0c94..edf92f0 100644
--- a/recipes-extended/librdmacm/librdmacm_1.1.0.bb
+++ b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
@@ -39,3 +39,6 @@ do_install_append() {
         rm -f ${D}${libdir}/librdmacm.la
         rm -f ${D}${libdir}/rsocket/librspreload.la
 }
+
+COMPATIBLE_HOST_mipsarch = "none"
+COMPATIBLE_HOST_arm = "none"
-- 
2.20.0


