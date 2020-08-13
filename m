Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by mx.groups.io with SMTP id smtpd.web10.6469.1597357098984279450
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 15:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=ZTM8647q;
 spf=pass (domain: wdc.com, ip: 68.232.143.124, mailfrom: prvs=487a0182d=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1597357118; x=1628893118;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7X1rtlBBAMDXuRvzr/Uhpc0Oalk0IHvHWxyeZB/CsdA=;
  b=ZTM8647qHtwmDqnQ+xYnr71vYngcAnUUlD6JIGd0udkbvPX0/UA+bXxz
   FSxn182ipu9tZvelBBI2qh8MEHIWHxZNWfRZFDZZJLM+dIzxdiLxwiif7
   CTxV8pz5C9ndVHArpbzcFzpnxta6k1f1HH4pQE+rRnOX5dNFi2jh8hYPu
   CAZZaDdd7VJcOkYJsFetibr2bYi6ZEfXsddy6+L+/qzGYJRpw1B+1Xcva
   JMIhoQnj0hhyRAOky/0ESdrGytGK9JWkUUMMYiYpZAq39zSYCwJJZPEKt
   ywCDDEHoNB6WsvTAPrOy+0osV0s9rhDqQxCGvqhsM3zTJByZFrzCEluiV
   Q==;
IronPort-SDR: 3TzhciamO4lpsdkbPlETR6I9oAcEzICNcxT0eoq50YD5B8K+2UDdKUzCrx5ZP9VHtg9hGXb+fc
 2PaDF6b70Gx0fyFsxcJ4fZaVkK0nMnK5GjCciEcHUw6vjJ7JYi+uOiXpa78JDPmbRWjPBWEy9f
 VIXvj3/KLx95Finn7wIWexFr3pOdKvUgEvUikAiduwFyRaxSEHu7WjeOpFVjfKZG6nxf6uUAfB
 pDCcVwO0j7+NTnC4pb3GI1J6H4oFIRGwKysuQ6HtUecic/CTj+c8kca/eKFeFzKuZgly3i6xV3
 8YM=
X-IronPort-AV: E=Sophos;i="5.76,309,1592841600"; 
   d="scan'208";a="248064365"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Aug 2020 06:18:36 +0800
IronPort-SDR: uVAy7ILbIzWsES3jqbLQYkDnrDDMzZSje+v5tm4Wi551yo87SY9VhgYkLFAefiqn6KfqI4SJPc
 RiT/Ym+GeBpg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 15:06:07 -0700
IronPort-SDR: LqZzTt+9qNXNdSvUDvrGMjegmmIF2XDCwHESzPlODswiMw2e+qN7zwhJlPujKWEgih7X4e/fHT
 /Sopql84LdxQ==
WDCIronportException: Internal
Received: from jbfyk72.ad.shared (HELO risc6-mainframe.hgst.com) ([10.86.59.14])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Aug 2020 15:18:17 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	bruce.ashfield@gmail.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/4] xvisor: Bump to a git release
Date: Thu, 13 Aug 2020 15:08:11 -0700
Message-Id: <20200813220814.3110999-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump the Xvisor SHA to a git release with RISC-V 0.5.0 Hypversior
extension support.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 recipes-extended/xvisor/{xvisor_0.3.0.bb => xvisor_git.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename recipes-extended/xvisor/{xvisor_0.3.0.bb => xvisor_git.bb} (88%)

diff --git a/recipes-extended/xvisor/xvisor_0.3.0.bb b/recipes-extended/xvisor/xvisor_git.bb
similarity index 88%
rename from recipes-extended/xvisor/xvisor_0.3.0.bb
rename to recipes-extended/xvisor/xvisor_git.bb
index 66ad618..45a7baf 100644
--- a/recipes-extended/xvisor/xvisor_0.3.0.bb
+++ b/recipes-extended/xvisor/xvisor_git.bb
@@ -8,8 +8,9 @@ require xvisor-configs.inc
 
 inherit autotools-brokensep
 
-SRCREV = "58592ef18c71526a0045935d1e8eed5e8553b7d6"
-SRC_URI = "git://github.com/xvisor/xvisor.git \
+# This version support the RISC-V v0.5.0 Hypervisor extensions
+SRCREV = "b3dac5b1f61f23f21dc59b3880897cff78f3b618"
+SRC_URI = "git://github.com/avpatel/xvisor-next.git \
            file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
           "
 
-- 
2.27.0

