Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68AA6E00E12; Tue,  9 Jan 2018 12:15:35 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BDF1E00E23
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jan 2018 12:15:29 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w09KFSDi010269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Jan 2018 12:15:28 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 9 Jan 2018 12:15:28 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 9 Jan 2018 15:15:05 -0500
Message-ID: <1515528906-6892-11-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
References: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 11/12] python-ryu: uprev to latest, v4.19
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
X-List-Received-Date: Tue, 09 Jan 2018 20:15:35 -0000
Content-Type: text/plain

This is required by the stable/pike version of python-neutron. This
requires the introduction of python-tinyrpc and python-ovs.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-ryu_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-ryu_git.bb b/meta-openstack/recipes-devtools/python/python-ryu_git.bb
index adf7957..b5ee113 100644
--- a/meta-openstack/recipes-devtools/python/python-ryu_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-ryu_git.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PV = "3.27+git${SRCPV}"
-SRCREV = "0aefad7048079656cdaad138be58f017e6b4f1ce"
+PV = "4.19+git${SRCPV}"
+SRCREV = "51a1130f6cdcb029a51b6a75d43ac5e4cdde7072"
 
 SRCNAME = "ryu"
 SRC_URI = "git://github.com/osrg/${SRCNAME}.git"
@@ -26,7 +26,9 @@ RDEPENDS_${PN} += " \
         python-msgpack \
         python-netaddr \
         python-oslo.config \
+        python-ovs \
         python-routes \
         python-six \
+        python-tinyrpc \
         python-webob \
         "
-- 
2.7.4


