Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68013E00DED; Mon, 25 Dec 2017 17:23:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C4F2E00D9B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Dec 2017 17:23:16 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBQ1NGwp016601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Dec 2017 17:23:16 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 25 Dec 2017 17:23:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 26 Dec 2017 09:20:49 +0800
Message-ID: <20171226012050.23647-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171226012050.23647-1-Qi.Chen@windriver.com>
References: <20171226012050.23647-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] glusterfs: use virtual/libibverbs
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
X-List-Received-Date: Tue, 26 Dec 2017 01:23:22 -0000
Content-Type: text/plain

Use 'virtual/libibverbs' instead of hardcoding libibverbs.
This is to avoid potential conflict between libibverbs in this layer
and dpdk-dev-libibverbs in meta-dpdk layer.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/glusterfs/glusterfs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index e45dc9e..0556e2a 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -48,7 +48,7 @@ PACKAGECONFIG ??= "georeplication libibverbs"
 PACKAGECONFIG[bd-xlator] = "--enable-bd-xlator,--disable-bd-xlator,lvm2,"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
 PACKAGECONFIG[georeplication] = "--enable-georeplication,--disable-georeplication,,rsync"
-PACKAGECONFIG[libibverbs] = "--enable-ibverbs,--disable-ibverbs,libibverbs librdmacm,"
+PACKAGECONFIG[libibverbs] = "--enable-ibverbs,--disable-ibverbs,virtual/libibverbs librdmacm,"
 PACKAGECONFIG[ocf] = "--with-ocf,--without-ocf,,"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
 
-- 
2.11.0


