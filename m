Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5946E00D57; Tue,  7 Nov 2017 12:38:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6502AE00C82
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:38:49 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA7KcnCj018637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:38:49 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:38:48 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 7 Nov 2017 15:38:31 -0500
Message-ID: <1510087118-28132-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
References: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 03/10] python-requestsexceptions: uprev to v1.3.0
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
X-List-Received-Date: Tue, 07 Nov 2017 20:38:58 -0000
Content-Type: text/plain

Uprev required by python-os-client-config v1.28.0.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...questsexceptions_1.1.3.bb => python-requestsexceptions_1.3.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-requestsexceptions_1.1.3.bb => python-requestsexceptions_1.3.0.bb} (80%)

diff --git a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.1.3.bb b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-requestsexceptions_1.1.3.bb
rename to meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb
index 4975e52..33a5fc6 100644
--- a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.1.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
 
-PR = "r0"
-
 SRCNAME = "requestsexceptions"
 SRC_URI = "http://pypi.io/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "edf208c247261157bf7a97d7c792d914"
-SRC_URI[sha256sum] = "d678b872f51f76d875e00e6667f4ddbf013b3a99490ae5fe07cf3e4f846e283e"
+SRC_URI[md5sum] = "85c9a2c5c5ecbd2deb0a491613fbdd12"
+SRC_URI[sha256sum] = "8f141ba636d6748cd29208c1955bde38bf00fcdda1a685bc09d8ed133700353e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


