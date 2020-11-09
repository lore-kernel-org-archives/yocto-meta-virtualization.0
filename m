Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12520.1604933270286284522
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 06:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C86B031B;
	Mon,  9 Nov 2020 06:47:48 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5937F3F719;
	Mon,  9 Nov 2020 06:47:48 -0800 (PST)
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.clark6@baesystems.com
Subject: [PATCH 0/2] Fix Xen compilation
Date: Mon,  9 Nov 2020 14:47:33 +0000
Message-Id: <cover.1604933003.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

This serie contain 2 patches to fix Xen compilation:
- on arm32 by adding a patch already merged in Xen master to fix gcc10
  compilation issues.
- on x86 to fix an issue happening when compiling xen-tools with older
  xen versions.

Those would be good candidates to include in gatesgarth.

Bertrand Marquis (2):
  xen: Fix python libraries installation on multilib
  xen: Fix xenpmd compilation error on arm32

 ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 +++++++++++++++++++
 recipes-extended/xen/xen-tools.inc            |  2 +
 recipes-extended/xen/xen-tools_4.14.bb        |  1 +
 recipes-extended/xen/xen-tools_git.bb         |  1 +
 4 files changed, 64 insertions(+)
 create mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch

-- 
2.17.1

