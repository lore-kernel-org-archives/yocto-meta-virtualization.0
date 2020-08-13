Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by mx.groups.io with SMTP id smtpd.web10.6470.1597357099849047438
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 15:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=h0lwr6CL;
 spf=pass (domain: wdc.com, ip: 68.232.143.124, mailfrom: prvs=487a0182d=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1597357119; x=1628893119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c3iw36dHcJSBSm8MfW3uZf7GF4gi3lQSK1Y0WVIKU28=;
  b=h0lwr6CLyyY7UkSlh+PsuY+avJI5XeO+E1qHmiulcgbTQP/EMc8pSwLG
   SeMZg2kdhsl5BsnWPgfH6+zk5kjBQLbTImJEpxsrw1AQ+K87zbtpP/Ss4
   /SR4aSNSrFE3goYFYH7qeGnMcFQXuhEReRRRYrKMAlROfDYBx63wGwXoT
   I2Inh5A19tSRtW+jm5zz2kGDP9ZSB1SQWlM13X+PDK5hX0u+yaWlVtD+K
   T3/if0AdxTm6c4rihGrJugz+cj4KBCOLkj3o2Eb2DpW55hDzErv5JMf6i
   zHD1jeW5hMUtvYuv+YLkI8LTpkXSbDY4bUj4E0s8WQM20pjTsKrIIkLzC
   g==;
IronPort-SDR: T9xSNToKi4m8E/t78LcwtHwbEwbZIsu9OJhyQlngQcGAjHK0El6KEgbVIAqYOrpkE0HA/REiMg
 A1MUoOP9RMYz57U1QHNPssalia8AoGDvk1I5G7mStTjkesct1S930PcqAc77Lvxu/E9iEMtLRT
 dscf8VB2PyPZ6E02a6pjZZeOSTM5kB1j/fomQB90KEC/HLWPYadzUaHjqJcWqbJMYfA90stbME
 TSWs+tIGbVpwqPk+6wLQGodL51jnIty4+ZQVf7DFloHr+S5BZly/+ayF1ee/9hWfqsLakG2taE
 CKo=
X-IronPort-AV: E=Sophos;i="5.76,309,1592841600"; 
   d="scan'208";a="248064366"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Aug 2020 06:18:36 +0800
IronPort-SDR: X5PRUUrul/MpSQILBSIayvrMupnNGymrMTZQLqM0pXJePcuiX0obwzSNix2DcQUoBzUjcxRdzF
 66Mf0kZ9TRyA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 15:06:07 -0700
IronPort-SDR: xRGvBXog2ys3tPB7eR8ZJl/v7NjDdvgkjNWchA0LNVyULZOaeCkYrQ9fvb2FYDz3ElP8qBkojf
 65IckZFP/zOA==
WDCIronportException: Internal
Received: from jbfyk72.ad.shared (HELO risc6-mainframe.hgst.com) ([10.86.59.14])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Aug 2020 15:18:17 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	bruce.ashfield@gmail.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/4] xvisor-image-minimal: Initial commit of a Xvisor image
Date: Thu, 13 Aug 2020 15:08:12 -0700
Message-Id: <20200813220814.3110999-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813220814.3110999-1-alistair.francis@wdc.com>
References: <20200813220814.3110999-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../images/xvisor-image-minimal.bb            | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-extended/images/xvisor-image-minimal.bb

diff --git a/recipes-extended/images/xvisor-image-minimal.bb b/recipes-extended/images/xvisor-image-minimal.bb
new file mode 100644
index 0000000..4c4a2fc
--- /dev/null
+++ b/recipes-extended/images/xvisor-image-minimal.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A minimal Xvisor image"
+
+INITRD_IMAGE = "core-image-minimal-initramfs"
+
+IMAGE_INSTALL += " \
+    packagegroup-core-boot \
+    packagegroup-core-ssh-openssh \
+    "
+
+# The hypervisor may not be within the dom0 filesystem image but at least
+# ensure that it is deployable:
+do_build[depends] += "xvisor:do_deploy"
+
+LICENSE = "MIT"
+
+inherit core-image
+
+# Enable runqemu. eg: runqemu xvisor-image-minimal nographic slirp
+QB_DEFAULT_KERNEL = "vmm.bin"
+QB_OPT_APPEND_append_riscv64 = " -cpu rv64,x-h=true "
-- 
2.27.0

