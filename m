Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D62FAE00CC4; Mon, 20 Nov 2017 08:16:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8E66E00BEA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Nov 2017 08:16:52 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAKGGqse007972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Nov 2017 08:16:52 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 20 Nov 2017 08:16:51 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 20 Nov 2017 11:16:39 -0500
Message-ID: <1511194599-30533-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] python-debtcollector: uprev to v1.17.1
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
X-List-Received-Date: Mon, 20 Nov 2017 16:16:54 -0000
Content-Type: text/plain

Although the current version is OK as far as dependent
requirements.txt there appears to be some issues with the older
version. The uprev is due, so let's get to it.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...{python-debtcollector_1.10.0.bb => python-debtcollector_1.17.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-debtcollector_1.10.0.bb => python-debtcollector_1.17.1.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-debtcollector_1.17.1.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-debtcollector_1.10.0.bb
rename to meta-openstack/recipes-devtools/python/python-debtcollector_1.17.1.bb
index d53960c..8d74ace 100644
--- a/meta-openstack/recipes-devtools/python/python-debtcollector_1.10.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-debtcollector_1.17.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[md5sum] = "c85d9e0e7d4d00577695214cb425c5b4"
-SRC_URI[sha256sum] = "1a3bd886d6aea3775e5366d7335c856449144c0218209af6c660f6be111714a3"
+SRC_URI[md5sum] = "d43a2733f02549628fe9f716363a5b01"
+SRC_URI[sha256sum] = "1f751d74789baa82684f55bececf754ebff1ad40e3fb1bee44fcf5c25a31e92d"
 
 inherit setuptools pypi
 
-- 
2.7.4


