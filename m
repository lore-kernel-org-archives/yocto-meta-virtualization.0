Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB42BE01830
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 20:02:23 -0800 (PST)
Received: by mail-ie0-f182.google.com with SMTP id as1so2476232iec.27
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 20:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=025TEiEuhDzmWVMo5nCXN4cCAewZnzPaOW4vAhJQH68=;
	b=YJdn9QhFL/epqFEvt1mV5LygFQEQFufXAi7hrSTFQuGdvfXBIUzBchanct5TeRb4NV
	NPAgDy7r39VVXlEhjUqmPLTMf6Z2wxUHE5Mi6b4HjDAd+HMxB5dar70M9xuPVUP+xYgy
	AozkO5W1yoOt9PLRrmHVIeS7tD34V9fSgDQ0dIfGWt5FoUNiEZLx1SMZiKoTd3G5lowL
	JAm+UpFU9d9PGk8gNoRRpo5vfwZu+oqUM/cSQAiz4z7mR/EsAPgNKXhcj5rf8Wm0rmb0
	v3TlUlc2QECGQP5Atg50E7/TDGjefhXTW5eXXlkYNbhwxMXcpyMNOtWljziFtgLgEtpM
	t2Jw==
X-Received: by 10.50.141.133 with SMTP id ro5mr600133igb.35.1383883343359;
	Thu, 07 Nov 2013 20:02:23 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id hv5sm1230089igb.9.2013.11.07.20.02.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 20:02:22 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  7 Nov 2013 23:01:04 -0500
Message-Id: <1383883267-31992-8-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 07/10] xen: rename xen patches directory from xen-4.3.0 to files.
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
X-List-Received-Date: Fri, 08 Nov 2013 04:02:25 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 ...lask-avoid-installing-policy-file-as-boot.patch | 26 ++++++++++++++++++++++
 ...lask-avoid-installing-policy-file-as-boot.patch | 26 ----------------------
 2 files changed, 26 insertions(+), 26 deletions(-)
 create mode 100644 recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
 delete mode 100644 recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch

diff --git a/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch b/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
new file mode 100644
index 0000000..d980807
--- /dev/null
+++ b/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
@@ -0,0 +1,26 @@
+From 8bff3edead4318bfebc487f929f833d11922c238 Mon Sep 17 00:00:00 2001
+From: "Vadim A. Misbakh-Soloviov" <mva@mva.name>
+Date: Tue, 30 Jul 2013 16:34:38 +0400
+Subject: [PATCH] flask: avoid installing policy file as '/boot'
+
+Signed-off-by: Vadim A. Misbakh-Soloviov <mva@mva.name>
+Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>
+---
+ tools/flask/policy/Makefile |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/flask/policy/Makefile b/tools/flask/policy/Makefile
+index e666f3e..df1e8f3 100644
+--- a/tools/flask/policy/Makefile
++++ b/tools/flask/policy/Makefile
+@@ -103,6 +103,7 @@ POLICY_SECTIONS += $(USERS) $(CONSTRAINTS) $(ISID_DEFS)
+ all: $(POLICY_FILENAME)
+ 
+ install: $(POLICY_FILENAME)
++	$(INSTALL_DIR) $(POLICY_LOADPATH)
+ 	$(INSTALL_DATA) $^ $(POLICY_LOADPATH)
+ 
+ $(POLICY_FILENAME): policy.conf
+-- 
+1.7.10.4
+
diff --git a/recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch b/recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch
deleted file mode 100644
index d980807..0000000
--- a/recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8bff3edead4318bfebc487f929f833d11922c238 Mon Sep 17 00:00:00 2001
-From: "Vadim A. Misbakh-Soloviov" <mva@mva.name>
-Date: Tue, 30 Jul 2013 16:34:38 +0400
-Subject: [PATCH] flask: avoid installing policy file as '/boot'
-
-Signed-off-by: Vadim A. Misbakh-Soloviov <mva@mva.name>
-Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>
----
- tools/flask/policy/Makefile |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/flask/policy/Makefile b/tools/flask/policy/Makefile
-index e666f3e..df1e8f3 100644
---- a/tools/flask/policy/Makefile
-+++ b/tools/flask/policy/Makefile
-@@ -103,6 +103,7 @@ POLICY_SECTIONS += $(USERS) $(CONSTRAINTS) $(ISID_DEFS)
- all: $(POLICY_FILENAME)
- 
- install: $(POLICY_FILENAME)
-+	$(INSTALL_DIR) $(POLICY_LOADPATH)
- 	$(INSTALL_DATA) $^ $(POLICY_LOADPATH)
- 
- $(POLICY_FILENAME): policy.conf
--- 
-1.7.10.4
-
-- 
1.8.4.rc3


