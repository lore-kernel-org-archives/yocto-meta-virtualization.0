Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web08.1113.1627325915723694175
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 11:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=f1+zkVYI;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1312; q=dns/txt; s=iport;
  t=1627325915; x=1628535515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tDb4Q6QeWMdJTFsUKPma9vLj9spDX1wOX5Qb2g0ga5Y=;
  b=f1+zkVYIVnc9vJHGtPqSdaHzATk5f5kTLKD9SDn2jKuOGSfmR5fYQ6oj
   dbyDSya9T9h/iX3YEleH4/iQYfUES+pf0C7wIrUTAB8J/ygccuD/oSE7n
   2PDaQ6LsuMfqxG32Sef9gSOyrda5BxPGhbEWYoepR4wc25TmOWWZt1Zv/
   U=;
X-IronPort-AV: E=Sophos;i="5.84,270,1620691200"; 
   d="scan'208";a="720435087"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 26 Jul 2021 18:58:34 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 16QIwYTu012479
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 Jul 2021 18:58:34 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id A4304CC128F; Mon, 26 Jul 2021 11:58:33 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Ruslan Babayev <fib@cisco.com>
Subject: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
Date: Mon, 26 Jul 2021 11:58:23 -0700
Message-Id: <20210726185823.26402-2-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
In-Reply-To: <20210726185823.26402-1-fib@cisco.com>
References: <20210726185823.26402-1-fib@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
Content-Transfer-Encoding: 8bit

It has been carried over from python2 and is no longer required.  More
importantly it breaks the python3-native build due to
${STAGING_DIR_TARGET} being "" for native recipes.

Signed-off-by: Ruslan Babayev <fib@cisco.com>
---
 recipes-devtools/python/python3_3.%.bbappend       | 1 -
 recipes-devtools/python/python3_virtualization.inc | 8 --------
 2 files changed, 9 deletions(-)
 delete mode 100644 recipes-devtools/python/python3_3.%.bbappend
 delete mode 100644 recipes-devtools/python/python3_virtualization.inc

diff --git a/recipes-devtools/python/python3_3.%.bbappend b/recipes-devtools/python/python3_3.%.bbappend
deleted file mode 100644
index 617cacc..0000000
--- a/recipes-devtools/python/python3_3.%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-devtools/python/python3_virtualization.inc b/recipes-devtools/python/python3_virtualization.inc
deleted file mode 100644
index 55301c7..0000000
--- a/recipes-devtools/python/python3_virtualization.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-DEPENDS += " ncurses"
-
-do_compile_prepend() {
-	export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
-}
-
-- 
2.26.2.Cisco

