Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9935.1618387997163024859
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6F86106F;
	Wed, 14 Apr 2021 01:13:15 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BA613F73B;
	Wed, 14 Apr 2021 01:13:15 -0700 (PDT)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 1/2] busybox: Add nsenter for podman runtime
Date: Wed, 14 Apr 2021 09:13:02 +0100
Message-Id: <20210414081303.30312-1-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1

From: Nathan Dunne <Nathan.Dunne@arm.com>

Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
---
 recipes-core/busybox/busybox/nsenter.cfg        | 1 +
 recipes-core/busybox/busybox_virtualization.inc | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 recipes-core/busybox/busybox/nsenter.cfg

diff --git a/recipes-core/busybox/busybox/nsenter.cfg b/recipes-core/busybox/busybox/nsenter.cfg
new file mode 100644
index 0000000..0a58df5
--- /dev/null
+++ b/recipes-core/busybox/busybox/nsenter.cfg
@@ -0,0 +1 @@
+CONFIG_NSENTER=y
diff --git a/recipes-core/busybox/busybox_virtualization.inc b/recipes-core/busybox/busybox_virtualization.inc
index d9c4e67..15f1930 100644
--- a/recipes-core/busybox/busybox_virtualization.inc
+++ b/recipes-core/busybox/busybox_virtualization.inc
@@ -7,4 +7,5 @@ SRC_URI += " \
 	    file://mount-cifs.cfg \
 	    file://ps-extras.cfg \
 	    file://getopt.cfg \
+	    file://nsenter.cfg \
            "
--
2.17.1

