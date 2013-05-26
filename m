Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2218E013A2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 25 May 2013 23:05:53 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4Q64VKc003927
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 25 May 2013 23:04:31 -0700 (PDT)
Received: from pek-lpgtest3.wrs.com (128.224.153.83) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sat, 25 May 2013 23:04:30 -0700
From: <lei.yang@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <david.c.nystrom@gmail.com>,
	<bruce.ashfield@gmail.co>
Date: Sun, 26 May 2013 14:04:29 +0800
Message-ID: <1369548269-22464-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] dev86: add "COMPATIBLE_HOST" in the recipe
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
X-List-Received-Date: Sun, 26 May 2013 06:05:53 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

dev86 is only used for x86/x86-64

Signed-off-by: Lei Yang <lei.yang@windriver.com>
---
 recipes-extended/dev86/dev86_0.16.19.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-extended/dev86/dev86_0.16.19.bb
index ea03812..807504e 100644
--- a/recipes-extended/dev86/dev86_0.16.19.bb
+++ b/recipes-extended/dev86/dev86_0.16.19.bb
@@ -33,5 +33,5 @@ do_install() {
 	ln -s ../lib/bcc/bcc-cc1 ${D}${prefix}/bin/bcc-cc1
 
 }
-
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 FILES_${PN} += "${libdir}/bcc"
-- 
1.7.1


