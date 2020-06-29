Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.14894.1593423064569859527
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 02:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05T9UWpf029073
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2020 02:30:53 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 29 Jun 2020
 02:30:39 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] qemu bbappend: 4.% -> 5.%
Date: Mon, 29 Jun 2020 02:30:38 -0700
Message-ID: <20200629093038.49327-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The oe-core has upgraded qemu to 5.XX

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../qemu/{qemu_4.%.bbappend => qemu_5.%.bbappend}                 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-devtools/qemu/{qemu_4.%.bbappend => qemu_5.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-devtools/qemu/qemu_4.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-devtools/qemu/qemu_4.%.bbappend
rename to meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend
-- 
2.21.0

