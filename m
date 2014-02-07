Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84AF5E005B4
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Feb 2014 13:06:43 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s17L6fTi015419
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 7 Feb 2014 13:06:41 -0800 (PST)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Fri, 7 Feb 2014 13:06:41 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 7 Feb 2014 16:07:33 -0500
Message-ID: <1391807253-1423-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [[meta-openstack][PATCH] python-dogpile: core: update SRC_URI* sums
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
X-List-Received-Date: Fri, 07 Feb 2014 21:06:45 -0000
Content-Type: text/plain

Attempting to build openstack-image-controller I was getting

  'Fetcher failure ... /dogpile.core-0.4.1.tar.gz'. Checksum mismatch!

Update the sums to match the expected values.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb b/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
index 3079c39..0b33455 100644
--- a/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-dogpile.core_0.4.1.bb
@@ -9,8 +9,8 @@ SRCNAME = "dogpile.core"
 
 SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5f76cce023d505a5375b07e094c3260f"
-SRC_URI[sha256sum] = "af2555702811d56846778d39451cf822b04b3f13347080c121a4977fefdfcbff"
+SRC_URI[md5sum] = "01cb19f52bba3e95c9b560f39341f045"
+SRC_URI[sha256sum] = "be652fb11a8eaf66f7e5c94d418d2eaa60a2fe81dae500f3743a863cc9dbed76"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.3.2


