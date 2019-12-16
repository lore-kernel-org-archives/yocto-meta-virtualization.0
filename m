Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.13153.1576533738947461146
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Dec 2019 14:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.115, mailfrom: timothy.t.orling@linux.intel.com)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 13:18:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; 
   d="scan'208";a="217294777"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2019 13:18:36 -0800
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [meta-virtualization][m-c-s][PATCH] nss-pam-ldapd: inherit features_check
Date: Mon, 16 Dec 2019 13:18:30 -0800
Message-Id: <20191216211830.35967-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Silence the warning about distro_features_check by inheriting
the proper bblcass (features_check).

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
index dfa562f..98fb442 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
 	file://nslcd.service \
 	"
 
-inherit autotools distro_features_check
+inherit autotools features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
 SRC_URI[md5sum] = "8c99fdc54f4bf9aca8c5f53fdb1403ff"
-- 
2.24.0

