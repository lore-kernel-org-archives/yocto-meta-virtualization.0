Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by mx.groups.io with SMTP id smtpd.web12.6412.1597357099592684933
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 15:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=BF4KsG52;
 spf=pass (domain: wdc.com, ip: 68.232.143.124, mailfrom: prvs=487a0182d=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1597357119; x=1628893119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x4azMyiraKdSOJDnBPaZ99BhqPj2GTenqT82HIm68Dk=;
  b=BF4KsG521MNs7f6BXZAkcZxBjZiMcl19cawp9jkgBPc37yMuErl0Gtro
   640v92BtJ1Z7bzl6Ywb0a6FIqbMYxEspJdKxOYqA5WI/sKIPFooi+EumL
   FW/EllMCJm+80MXbL7AehkRLq7IqKOQWg6ZY0ok5Lnikx/sD3eRX3osth
   6Uxw8iUxgEnWLkasYkJWjFy+ZoRZHg8titv03HZF8srA/EXU59CKInt56
   BNXHJB+JBZGb8u6FdRVLu9OZ0rU3EGcYH5Zee+YhAra08rp+OxPpWseIk
   19lY2uas6nGTtvTu/D8L7d8wRsvK27l1oP9p1xq5PjS0lflZruAauFbUV
   g==;
IronPort-SDR: X1lcGqEdvLs5JzWqJTbtbBazBmM0OOL/NRrbIFelOV9G4Zdh0h9gHkpzEIVjipbiInZI0DhwAf
 cM0Lomw3tHC3yXuxSAQYm7WxrNkV7GQ9ekKoIjBnTSzhOq26WNaKF46k6U3un7w4V5piqv24Lh
 bRCid0YEbzVfDuRO1tOCiAaB48mpCgOZlA6Fl0wGFKGkOI1BiJQUHpb3NVBeGRIDS2KbgC/G/+
 jKe1MEx+Ilc+7oyP+Q8BV9P+0tdBrvaDN38It+JsmSc+JwuffRe1oCC+IqgX70bRXfJydtcbCf
 +2Y=
X-IronPort-AV: E=Sophos;i="5.76,309,1592841600"; 
   d="scan'208";a="248064368"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Aug 2020 06:18:38 +0800
IronPort-SDR: U43veldlLThVLmoXhhT5dkg4CfozWIhQgI7j8ptwlzTuRfzBC3mcbsHcGmNmC3geWu+9lr7ViR
 f/JL/l3PNhOA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 15:06:08 -0700
IronPort-SDR: 9o7Gs9QTmyJ5m1idj9ibcwv0Kn64h4kc6zs4kjXaIhT5A3bQ6dBACjBo6vuaNLZg/WMLFfDqBa
 qx9a9uLK4Xfw==
WDCIronportException: Internal
Received: from jbfyk72.ad.shared (HELO risc6-mainframe.hgst.com) ([10.86.59.14])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Aug 2020 15:18:18 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	bruce.ashfield@gmail.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 4/4] docs: Add initial Xvisor doc
Date: Thu, 13 Aug 2020 15:08:14 -0700
Message-Id: <20200813220814.3110999-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813220814.3110999-1-alistair.francis@wdc.com>
References: <20200813220814.3110999-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/00-INDEX   |  3 +++
 docs/xvisor.txt | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 docs/xvisor.txt

diff --git a/docs/00-INDEX b/docs/00-INDEX
index a2ffd99..5aa1b3c 100644
--- a/docs/00-INDEX
+++ b/docs/00-INDEX
@@ -10,3 +10,6 @@ alphabetical order as well.
 
 openvswitch.txt
 	- example on how to setup openvswitch with qemu/kvm.
+
+xvisor.txt
+	- example on how to setup Xvisor for RISC-V QEMU.
diff --git a/docs/xvisor.txt b/docs/xvisor.txt
new file mode 100644
index 0000000..6f31f22
--- /dev/null
+++ b/docs/xvisor.txt
@@ -0,0 +1,16 @@
+Simple setup for starting Xvisor on RISC-V QEMU
+===============================================
+
+This is a simple starting point for running Xvisor on RISC-V QEMU.
+
+Currently meta-virtualisation supports running Xvisor on QEMU using the v0.5.0 RISC-V Hypervisor extensions.
+
+Support is still experimental.
+
+Build the images
+================
+$ MACHINE=qemuriscv64 bitbake xvisor-image-minimal
+
+Run the images
+==============
+$ MACHINE=qemuriscv64 runqemu xvisor-image-minimal slirp nographic
-- 
2.27.0

