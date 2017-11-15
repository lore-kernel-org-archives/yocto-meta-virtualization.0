Return-Path: <Abdur_Rehman@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBE20E00C45; Wed, 15 Nov 2017 08:44:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DC7DE00A6A
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 08:44:50 -0800 (PST)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1eF0ny-0004C9-Dk from Abdur_Rehman@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Wed, 15 Nov 2017 08:44:50 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Wed, 15 Nov 2017 16:44:48 +0000
From: Abdur Rehman <abdur_rehman@mentor.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 Nov 2017 21:44:41 +0500
Message-ID: <1510764281-37527-1-git-send-email-abdur_rehman@mentor.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] python3-dockerpty: fix license-checksum qa issue
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
X-List-Received-Date: Wed, 15 Nov 2017 16:44:51 -0000
Content-Type: text/plain

Fix license path and checksum for python3-dockerpty.

Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
---
 recipes-devtools/python/python3-dockerpty_0.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python3-dockerpty_0.4.1.bb b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
index a40f2a3..31a864a 100644
--- a/recipes-devtools/python/python3-dockerpty_0.4.1.bb
+++ b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python library to use the pseudo-tty of a docker container"
 HOMEPAGE = "https://github.com/d11wtq/dockerpty"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=afaf767baa20ac524dc12f1071ca493a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-- 
2.8.1


