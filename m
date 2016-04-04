Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09607E00B6F; Sun,  3 Apr 2016 19:27:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85578E00A9C
	for <meta-virtualization@yoctoproject.org>;
	Sun,  3 Apr 2016 19:27:34 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u342RY71026588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 3 Apr 2016 19:27:34 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 3 Apr 2016 19:27:33 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <paul.gortmaker@windriver.com>
Date: Sun, 3 Apr 2016 22:27:33 -0400
Message-ID: <1459736853-23863-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459736687-21379-1-git-send-email-mark.asselstine@windriver.com>
References: <1459736687-21379-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH] lxc: uprev to latest stable 1.1.4 -> 1.1.5
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
X-List-Received-Date: Mon, 04 Apr 2016 02:27:37 -0000
Content-Type: text/plain

This is the latest stable release and includes many important bug
fixes as well as CVE fixes such as CVE-2015-1335.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Sorry, with '-M' so you can see the changes better.

Mark

 recipes-containers/lxc/{lxc_1.1.4.bb => lxc_1.1.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/lxc/{lxc_1.1.4.bb => lxc_1.1.5.bb} (97%)

diff --git a/recipes-containers/lxc/lxc_1.1.4.bb b/recipes-containers/lxc/lxc_1.1.5.bb
similarity index 97%
rename from recipes-containers/lxc/lxc_1.1.4.bb
rename to recipes-containers/lxc/lxc_1.1.5.bb
index fe7eb34..0f6d0b8 100644
--- a/recipes-containers/lxc/lxc_1.1.4.bb
+++ b/recipes-containers/lxc/lxc_1.1.5.bb
@@ -42,8 +42,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-busybox-Remove-warning-for-dynamically-linked-Bu.patch \
 	"
 
-SRC_URI[md5sum] = "d33c4bd9c57755c0e2b0e2acbc3f171d"
-SRC_URI[sha256sum] = "8f072ea2001bc94389003d82a91902855edf16b609e06f0486a74e4b8973e5dc"
+SRC_URI[md5sum] = "dd9684dde0a58ed13f4f49c855b79a1a"
+SRC_URI[sha256sum] = "9588ad1b04e114ee7370f690c65131e28098b28d2521d97c73557d11897ed0be"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
2.1.4


