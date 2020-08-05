Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2093.1596649476670201257
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 10:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 075HiETD013450
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 5 Aug 2020 10:44:25 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 5 Aug 2020
 10:44:04 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-virt][PATCH 1/1] lxc: check for busybox in run-ptest
Date: Wed, 5 Aug 2020 10:44:03 -0700
Message-ID: <20200805174403.14687-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lots of tests require busybox, so we look for it when
run-ptest starts.  We also sort logs depending on
success or failure.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-containers/lxc/files/run-ptest | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
index 3f3a75f..948b893 100644
--- a/recipes-containers/lxc/files/run-ptest
+++ b/recipes-containers/lxc/files/run-ptest
@@ -18,16 +18,24 @@ failed=0
 skipped=0
 
 # Create logs dir and clear old logs if any
-mkdir logs 2> /dev/null
-rm -f logs/*
+rm -rf logs
+mkdir -p logs/pass
 
 echo "### Starting LXC ptest ###"
 
+if ! which busybox &> /dev/null
+then
+    echo "busybox must be installed and on PATH"
+    echo "### LXC ptest complete ###"
+    echo "FAIL: lxc ptest configuration"
+fi
+
 for test in ./tests/*
 do
     if [[ ! $blacklist = *$(basename $test)*  ]]
     then
-	$test >logs/$(basename $test).log 2>&1
+        lfile="logs/$(basename $test).log"
+	$test > $lfile 2>&1
     else
 	echo "SKIPPED: $(basename $test)"
 	skipped=$((skipped+1))
@@ -38,6 +46,7 @@ do
     then
 	echo "PASS: $(basename $test)"
 	passed=$((passed+1))
+        mv $lfile logs/pass
     else
 	echo "FAIL: $(basename $test)"
 	failed=$((failed+1))
-- 
2.7.4

