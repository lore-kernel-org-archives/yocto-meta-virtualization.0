Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.2381.1585625424496530171
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Mar 2020 20:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: qiang.zhang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02V3UNvc001155
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Mar 2020 20:30:23 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Mar 2020 20:30:04 -0700
From: qiang.zhang@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH] libvirt: change bbappend file version
Date: Tue, 31 Mar 2020 11:30:02 +0800
Message-ID: <20200331033003.12787-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Zhang Qiang <qiang.zhang@windriver.com>

Fix meta-cloud-services libvrit bbapend file form v5 to v6

Signed-off-by: Zhang Qiang <qiang.zhang@windriver.com>
---
 .../libvirt/{libvirt_5.%.bbappend => libvirt_6.%.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-extended/libvirt/{libvirt_5.%.bbappend => libvirt_6.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-extended/libvirt/libvirt_5.%.bbappend
rename to meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend
-- 
2.24.1

