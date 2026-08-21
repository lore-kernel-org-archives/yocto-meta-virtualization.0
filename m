Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059A8C5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:08:50 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1041.1787288928183722105
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 22:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MR9ehqIx;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=987; q=dns/txt;
  s=iport01; t=1787288928; x=1788498528;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gd2nhj0p9geOAaNNj/MsHkFpxmjfeYvt7uObe1CGCLQ=;
  b=MR9ehqIxz9FU7w1b9rzvmO4v4v3M12/Q0fVe7wcY91HsZ7F+c2lDUN5Y
   b7DhVD1GTd06MRKCfaq8hQ8OERxOzhvhXepH3mTO789c1+NyDf/o9/kJq
   yG7S2KjiE5zqtop85OBYk3AmNJrljjgZgsMsKL0i+bPrYRopGoJa8xaTL
   V83ehft8dcnEHk/oGjhqNT2d0avVDoUfBMXg9XaFf2fC5VTu36drLMSrV
   VgzWE64iPsclPzUV+RwK9VrtR3KbKwvu0ZCxz5SbEt/I2irWRk3tvljxU
   GgCaDrN50V1smWvGnWo5DBuP3dwpRj8xU9AUkMCJ+3QweEAEFp5aASNRP
   Q==;
X-CSE-ConnectionGUID: sxOYezrYTNalXTd053iaCw==
X-CSE-MsgGUID: d8FQOHPwRhyh2fXzZtxvKw==
X-IPAS-Result: =?us-ascii?q?A0D2AgA/3Idq/48QJK1RCYJZgld0XkNJk1kBoQ6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1uAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDwFqCLIEBgygBgVTbMAELFAEFgTOFP4gid?=
 =?us-ascii?q?oR8JxsbgXKEfoQXeYV4BIIiehKBeIEPkE9IgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgl+CBQIBS?=
 =?us-ascii?q?UMOBzoLGA1IESw3FBkEPm4HjloggkY9UYEfpy+hDwoog3aMIZU6GjOqbC6YW?=
 =?us-ascii?q?qRahGmBbworgVlwFTuCZwlKGQ/eXCcyAj0HAgcPApNxAQE?=
IronPort-Data: A9a23:u4jboKt++HmD3wrGgAaValMhHufnVAZfMUV32f8akzHdYApBsoF/q
 tZmKW2Hb/2OZGamL95+bIuxpxxTuJ6Byt5qTwZvpSk9EXwWgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/LZ8Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw4fZQMGxc7
 80kDjkJXiyP37/twbuQVbw57igjBJGD0II3s3Vky3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgx/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KobSGZgPwBrAz
 o7A12ipLCg9FOSA8zqU8iiitv39gTPle51HQdVU8dYv2jV/3Fc7DRAKXB6loOOll0e6WsBWN
 00T/AIqrLMu7wq6SdLhWAWip3yJtQJaXMBfe9DW8ymEzq7SpgLcDW8eQ3sZNpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:+0t8P60YE8tgiUDBsXSSAAqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:24plrWDGZHiJdTj6EzJ3038ZCNoUTlvUyEfsLxflUmdgY6LAHA==
X-Talos-MUID: 9a23:LRu7gwSiDypnvhDMRXTg1B9bE+dQ/J6uGUBXn6UUidWUKw9vbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,234,1779148800"; 
   d="scan'208";a="820452640"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 05:08:47 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 35CF41800026C;
	Fri, 21 Aug 2026 05:08:47 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id C9356CC12A6; Thu, 20 Aug 2026 22:08:46 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com
Subject: [meta-virtualization][PATCH] python3-webob: add CVE_PRODUCT mapping
Date: Thu, 20 Aug 2026 22:08:46 -0700
Message-Id: <20260821050846.51825-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Aug 2026 05:08:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10059

From: Devansh Patel <devanshp@cisco.com>

The current inherited "python:webob" mapping does not match the WebOb identities used by NVD and CVE List V5, so source-aligned CVEs are missed.

Use "pylons:webob" for the CNA affected-data identity and "pylonsproject:webob" for the NVD dictionary CPE and configuration identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 recipes-devtools/python/python3-webob_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/python/python3-webob_1.8.10.bb b/recipes-devtools/python/python3-webob_1.8.10.bb
index 6d895103..3a4e2c95 100644
--- a/recipes-devtools/python/python3-webob_1.8.10.bb
+++ b/recipes-devtools/python/python3-webob_1.8.10.bb
@@ -8,6 +8,8 @@ PYPI_PACKAGE = "webob"
 
 SRC_URI[sha256sum] = "1c963a11f307bc3f624fbab9dde737701eae255f32981b7a5486a88db1767c2b"
 
+CVE_PRODUCT = "pylons:webob pylonsproject:webob"
+
 inherit setuptools3 pypi
 
 RDEPENDS:${PN} += " \
-- 
2.35.6

