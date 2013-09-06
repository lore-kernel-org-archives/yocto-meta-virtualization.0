Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F05BFE003FB
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Sep 2013 07:14:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r86EExvY028921
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 6 Sep 2013 07:14:59 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 6 Sep 2013 07:14:57 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 6 Sep 2013 10:14:54 -0400
Message-ID: <1378476894-17540-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378476894-17540-1-git-send-email-bruce.ashfield@windriver.com>
References: <1378476894-17540-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] libvirt: uprev to 1.1.2
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
X-List-Received-Date: Fri, 06 Sep 2013 14:14:59 -0000
Content-Type: text/plain

1.1.2 is available and fixes a number of issues with 1.1.1 (segfaults
and more).

Since 1.1.1 has been available for a while, with no significant issues
reported, I'm also removing the fallback 1.0.3 and 1.1.1 recipes with
this update.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb          |  181 --------------------
 .../libvirt/{libvirt_1.1.1.bb => libvirt_1.1.2.bb} |    4 +-
 2 files changed, 2 insertions(+), 183 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt_1.0.3.bb
 rename recipes-extended/libvirt/{libvirt_1.1.1.bb => libvirt_1.1.2.bb} (97%)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
deleted file mode 100644
index 0d1d081..0000000
diff --git a/recipes-extended/libvirt/libvirt_1.1.1.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
similarity index 97%
rename from recipes-extended/libvirt/libvirt_1.1.1.bb
rename to recipes-extended/libvirt/libvirt_1.1.2.bb
index aef536d..cfb406d 100644
--- a/recipes-extended/libvirt/libvirt_1.1.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
@@ -27,8 +27,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
 	   file://libvirtd.sh \
 	   file://libvirtd.conf"
 
-SRC_URI[md5sum] = "632f30a2f22fbb404b8e10702d7f55ca"
-SRC_URI[sha256sum] = "dc6f1e1e15b9b190eaa706e76edabcfc94b239c012f5afc22b22357a4b3b22c2"
+SRC_URI[md5sum] = "1835bbfa492099bce12e2934870e5611"
+SRC_URI[sha256sum] = "16648af54d3e162f5cc5445d970ec29a0bd55b1dbcb568a05533c4c2f25965e3"
 
 inherit autotools gettext update-rc.d
 
-- 
1.7.10.4


