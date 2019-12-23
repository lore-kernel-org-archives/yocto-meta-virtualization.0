Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.480.1577084990847645495
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2019 23:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBN79n5t004679
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Dec 2019 23:09:50 -0800 (PST)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0; Sun, 22 Dec 2019
 23:09:37 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] sysklogd bbappend: 1.% -> 2.%
Date: Sun, 22 Dec 2019 23:09:37 -0800
Message-ID: <20191223070937.36937-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../sysklogd/{sysklogd_1.%.bbappend => sysklogd_2.%.bbappend}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-extended/sysklogd/{sysklogd_1.%.bbappend => sysklogd_2.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-extended/sysklogd/sysklogd_1.%.bbappend b/meta-openstack/recipes-extended/sysklogd/sysklogd_2.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-extended/sysklogd/sysklogd_1.%.bbappend
rename to meta-openstack/recipes-extended/sysklogd/sysklogd_2.%.bbappend
-- 
2.21.0

