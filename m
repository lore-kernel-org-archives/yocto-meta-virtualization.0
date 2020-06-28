Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.23056.1593320537013761207
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 Jun 2020 22:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,290,1589212800"; 
   d="scan'208";a="95408942"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jun 2020 13:02:10 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 30A8A4CE49B8
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Jun 2020 12:51:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Jun 2020 13:02:10 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 3/4] python3-automaton: Change python to python3
Date: Sun, 28 Jun 2020 13:02:01 +0800
Message-ID: <1593320522-14645-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593320522-14645-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593320522-14645-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 30A8A4CE49B8.A457F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...automaton_0.8.0.bb => python3-automaton_0.8.0.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-automaton_0.8.0.bb => python3-automaton_0.8.0.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python-automaton_0.8.0.bb b/meta-openstack/recipes-devtools/python/python3-automaton_0.8.0.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python-automaton_0.8.0.bb
rename to meta-openstack/recipes-devtools/python/python3-automaton_0.8.0.bb
index 41ec297..86be7ca 100644
--- a/meta-openstack/recipes-devtools/python/python-automaton_0.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python3-automaton_0.8.0.bb
@@ -10,18 +10,18 @@ SRC_URI[sha256sum] = "ca8bfbea03b9f39a536b4b261d90fbe8b1b0e1766bff5d8222e35691f8
 inherit setuptools3 pypi
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 RDEPENDS_${PN} += " \
-        python-pbr \
-        python-six \
-        python-debtcollector \
-        python-prettytable \
+        python3-pbr \
+        python3-six \
+        python3-debtcollector \
+        python3-prettytable \
         "
 
-- 
2.17.1



