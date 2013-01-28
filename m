Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87640E0121B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 Jan 2013 02:38:55 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0SAciXa003404
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jan 2013 02:38:45 -0800 (PST)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 28 Jan 2013 02:38:43 -0800
From: <lei.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe.MacDonald@windriver.com>,
	<meta-virtualization@yoctoproject.org>
Date: Mon, 28 Jan 2013 18:38:41 +0800
Message-ID: <1359369521-1779-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netcat-openbsd: Add glib-2.0 dependency
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
X-List-Received-Date: Mon, 28 Jan 2013 10:38:55 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

Build failed without glib-2.0,add glib-2.0 to DEPENDS

Signed-off-by: Lei Yang <lei.yang@windriver.com>
Tested-by: Lei Yang <lei.yang@windriver.com>
---
 .../recipes-support/netcat/netcat-openbsd_1.89.bb  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
index f83caee..00a4fb7 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
@@ -13,7 +13,7 @@ SRC_URI[netcat-patch.md5sum] = "00c65aa22243b76998174c733cbb64cc"
 SRC_URI[netcat-patch.sha256sum] = "d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
 
 S = "${WORKDIR}/${PN}-${PV}.orig"
-
+DEPENDS = "glib-2.0"
 do_configure[noexec] = "1"
 
 do_compile() {
-- 
1.7.1


