Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.23062.1593320549120259090
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 Jun 2020 22:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,290,1589212800"; 
   d="scan'208";a="95408945"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jun 2020 13:02:10 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 827CD4CE49C7
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Jun 2020 12:51:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Jun 2020 13:02:11 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 4/4] python3-taskflow: Change python to python3
Date: Sun, 28 Jun 2020 13:02:02 +0800
Message-ID: <1593320522-14645-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593320522-14645-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593320522-14645-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 827CD4CE49C7.A3F35
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

python-futures is only for Python 2, so remove it.
python-enum34 or python3-enum34 are not exist, so remove python-enum34
from bb file.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...askflow_git.bb => python3-taskflow_git.bb} | 36 +++++++++----------
 1 file changed, 17 insertions(+), 19 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-taskflow_git.bb => python3-taskflow_git.bb} (53%)

diff --git a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb b/meta-openstack/recipes-devtools/python/python3-taskflow_git.bb
similarity index 53%
rename from meta-openstack/recipes-devtools/python/python-taskflow_git.bb
rename to meta-openstack/recipes-devtools/python/python3-taskflow_git.bb
index a2fe43b..a9c4c30 100644
--- a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-taskflow_git.bb
@@ -15,31 +15,29 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 
 DEPENDS += " \
-        python-pip \
-        python-pbr \
+        python3-pip \
+        python3-pbr \
         "
 
 # Satisfy setup.py 'setup_requires'
 DEPENDS += " \
-        python-pbr-native \
+        python3-pbr-native \
         "
 
 RDEPENDS_${PN} += " \
-        python-pbr \
-        python-six \
-        python-enum34 \
-        python-futurist \
-        python-fasteners \
-        python-networkx \
-        python-contextlib2 \
-        python-stevedore \
-        python-futures \
-        python-jsonschema \
-        python-automaton \
-        python-oslo.utils \
-        python-oslo.serialization \
-        python-tenacity \
-        python-cachetools \
-        python-debtcollector \
+        python3-pbr \
+        python3-six \
+        python3-futurist \
+        python3-fasteners \
+        python3-networkx \
+        python3-contextlib2 \
+        python3-stevedore \
+        python3-jsonschema \
+        python3-automaton \
+        python3-oslo.utils \
+        python3-oslo.serialization \
+        python3-tenacity \
+        python3-cachetools \
+        python3-debtcollector \
         "
 	
-- 
2.17.1



