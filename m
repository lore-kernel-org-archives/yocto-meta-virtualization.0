Return-Path: <denis@eukrea.com>
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D5BDE00784
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Dec 2013 09:49:14 -0800 (PST)
Received: from denis-N73SV.local.eukrea.com (unknown [88.170.243.169])
	by smtp6-g21.free.fr (Postfix) with ESMTP id E4AD5823F9;
	Wed,  4 Dec 2013 18:49:06 +0100 (CET)
From: Denis Carikli <denis@eukrea.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  4 Dec 2013 18:49:00 +0100
Message-Id: <1386179341-19457-1-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] python-babel: add python-pytz to (R)EPENDS
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
X-List-Received-Date: Wed, 04 Dec 2013 17:49:17 -0000

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 .../recipes-devtools/python/python-babel_1.3.bb    |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-babel_1.3.bb b/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
index 390a3c5..cf2b7a8 100644
--- a/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://babel.edgewall.org/"
 SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
+DEPENDS += "python-pytz"
+RDEPENDS_${PN} += "python-pytz"
 
 PR = "r0"
 SRCNAME = "Babel"
-- 
1.7.9.5


