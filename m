Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.6316.1625456385276299667
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Jul 2021 20:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1653dinj016004
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 4 Jul 2021 20:39:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1653dio9014276
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 4 Jul 2021 20:39:44 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 4 Jul 2021 20:39:43 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Sun, 4 Jul 2021 20:39:43 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH]ebtables: wildcard bbappend
Date: Mon, 5 Jul 2021 11:39:42 +0800
Message-ID: <20210705033942.29559-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{ebtables_2.0.10-4.bbappend => ebtables_2.%.%.bbappend}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-support/ebtables/{ebtables_2.0.10-4.bbappend => ebtables_2.%.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-support/ebtables/ebtables_2.0.10-4.bbappend b/meta-openstack/recipes-support/ebtables/ebtables_2.%.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-support/ebtables/ebtables_2.0.10-4.bbappend
rename to meta-openstack/recipes-support/ebtables/ebtables_2.%.%.bbappend
-- 
2.27.0

