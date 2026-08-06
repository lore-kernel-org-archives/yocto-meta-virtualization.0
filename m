Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F098C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:55:04 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13163.1785995703447437070
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 22:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jgOY5SAu;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3329; q=dns/txt;
  s=iport01; t=1785995703; x=1787205303;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I2mP5VqU4/Z38iEaJALDqKhpDZ8oZqC6UHiY+PbLAus=;
  b=jgOY5SAuYYUR8xEGTbILyJundYKdgopBakYv+J3k+imAV+PSiBKZUWHV
   0OkzGsWHBLJUMGpMRqTpJm0EnVXFCaFtFVtKAo453KhcpsqUTMkwOBo7s
   nRW9CcyuyXVfY7mQAGJwTOr/cCPbSm4JWOyNT0tRnyPTjmW3wSUYFutKT
   umJExNtNmGldVoqEmngzoMtN0RrFDC5OHNBrZHe/q0JigZWolCbLB7g/S
   9xPqESdmkna8x4K6qw3lX7cJaSlaSd+maIphw3aA+or45dLvjLCXx2PFt
   yw2VwZHOFmWJEHwJv1p2EjnZrpJas0IuDTitTfVuLsZNPWByk0D8rUYLk
   g==;
X-CSE-ConnectionGUID: hh2V3omuTYKXr/OjbkM0LA==
X-CSE-MsgGUID: jJajMQ/ZTNWrgJD/EsBUHg==
X-IPAS-Result: =?us-ascii?q?A0BEAgA8IHRq/5QQJK1aHgEBCxIMggULgld0XkNJA5ZHn?=
 =?us-ascii?q?h6Bfg8BAQEPRA0EAQGFBY1oAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBAgE1ARgBLSwDAQJaIyGDAgGCdAMRvHKCLIEBgygBP?=
 =?us-ascii?q?wJDUNsuAQsUAQWBM4U/iCFdGAGEfCcbG4FygRWDaYEFgVELAQGIJQSCIoEMg?=
 =?us-ascii?q?VoekHhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBwWBHYEohGgjG?=
 =?us-ascii?q?TZ6gQlegS0qZAESF4EJgm8CgnqBKQsYDUgRLDcUGQQ+bgeNfyCCQYEOASkBA?=
 =?us-ascii?q?SACb3QnpXahDwoog3WMIZU6GjOFW6URC5h9jgqGD4FNgjGLc1CEaYFoPIFHC?=
 =?us-ascii?q?wdwFYMiCUoZD444g2uBf4NlxlUnMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:9IJ5bqiCNPr/UOVkg0d8wN5AX161MBEKZh0ujC45NGQN5FlHY01je
 htvXj2DP62JMWb2f49/Oo+/ph4AuZCHxtdhTVQ9+Cw0EiNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/re8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUY+rxJWmZL6
 MApCwAXKTeBjeGTmJaSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTaj/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKKK4zWHJQMzxzwS
 mTu/UbwADQjc+6j7wWf/VCAwcLUtx7bV9dHfFG/3rsw6LGJ/UQWBQEfEEW6u+Wkg0q/SdtDK
 ksS0i4vtrQpsl2sRcX6Rwe/onOPolgbQdU4LgEhwAiJzqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:SP6TKKMhkoTDbcBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3AABIRf2lzTvTybmanKkCVjBwPbTLXOX3dlkmLJEq?=
 =?us-ascii?q?lNVdKeKfSbl2a+4Y8t+M7zg=3D=3D?=
X-Talos-MUID: 9a23:fsp4lwW2Y7VGSwfq/D3OjTNHDYBa34KREk8vvdIroOO5FSMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,207,1779148800"; 
   d="scan'208";a="798419192"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Aug 2026 05:55:02 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id D66EF18006F02;
	Thu,  6 Aug 2026 05:55:01 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 63195CD02BC; Wed,  5 Aug 2026 22:55:01 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-virtualization][scarthgap][PATCH 1/2] python3-webob: fix CVE-2024-42353
Date: Wed,  5 Aug 2026 22:54:54 -0700
Message-Id: <20260806055455.3114166-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Aug 2026 05:55:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10029

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/Pylons/webob/commit/f689bcf4f0a1f64f1735b1d5069aef5be6974b5b
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-42353

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3-webob/CVE-2024-42353.patch | 56 +++++++++++++++++++
 .../python/python3-webob_1.8.7.bb             |  2 +
 2 files changed, 58 insertions(+)
 create mode 100644 recipes-devtools/python/python3-webob/CVE-2024-42353.patch

diff --git a/recipes-devtools/python/python3-webob/CVE-2024-42353.patch b/recipes-devtools/python/python3-webob/CVE-2024-42353.patch
new file mode 100644
index 00000000..56e7543f
--- /dev/null
+++ b/recipes-devtools/python/python3-webob/CVE-2024-42353.patch
@@ -0,0 +1,56 @@
+From a14a5b798de5b1145513660be64c09c7117f2b0d Mon Sep 17 00:00:00 2001
+From: Delta Regeer <xistence@0x58.com>
+Date: Wed, 7 Aug 2024 11:15:35 -0600
+Subject: [PATCH] Add fix for open redirect
+
+CVE: CVE-2024-42353
+Upstream-Status: Backport [https://github.com/Pylons/webob/commit/f689bcf4f0a1f64f1735b1d5069aef5be6974b5b]
+
+(cherry picked from commit f689bcf4f0a1f64f1735b1d5069aef5be6974b5b)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/webob/response.py  |  5 +++++
+ tests/test_response.py | 11 +++++++++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/src/webob/response.py b/src/webob/response.py
+index 2aad591..efc38ec 100644
+--- a/src/webob/response.py
++++ b/src/webob/response.py
+@@ -1284,6 +1284,11 @@ class Response(object):
+         if SCHEME_RE.search(value):
+             return value
+ 
++        # This is to fix an open redirect issue due to the way that
++        # urlparse.urljoin works. See CVE-2024-42353 and
++        # https://github.com/Pylons/webob/security/advisories/GHSA-mg3v-6m49-jhp3
++        if value.startswith("//"):
++            value = "/%2f{}".format(value[2:])
+         new_location = urlparse.urljoin(_request_uri(environ), value)
+         return new_location
+ 
+diff --git a/tests/test_response.py b/tests/test_response.py
+index 9d9f9d3..8a6ac06 100644
+--- a/tests/test_response.py
++++ b/tests/test_response.py
+@@ -1031,6 +1031,17 @@ def test_location():
+     assert req.get_response(res).location == 'http://localhost/test2.html'
+ 
+ 
++def test_location_no_open_redirect():
++    # This is a test for a fix for CVE-2024-42353 and
++    # https://github.com/Pylons/webob/security/advisories/GHSA-mg3v-6m49-jhp3
++    res = Response()
++    res.status = "301"
++    res.location = "//www.example.com/test"
++    assert res.location == "//www.example.com/test"
++    req = Request.blank("/")
++    assert req.get_response(res).location == "http://localhost/%2fwww.example.com/test"
++
++
+ @pytest.mark.xfail(sys.version_info < (3,0),
+                    reason="Python 2.x unicode != str, WSGI requires str. Test "
+                    "added due to https://github.com/Pylons/webob/issues/247. "
+-- 
+2.44.4
+
diff --git a/recipes-devtools/python/python3-webob_1.8.7.bb b/recipes-devtools/python/python3-webob_1.8.7.bb
index d23ddfd2..5d7f74c8 100644
--- a/recipes-devtools/python/python3-webob_1.8.7.bb
+++ b/recipes-devtools/python/python3-webob_1.8.7.bb
@@ -14,3 +14,5 @@ RDEPENDS:${PN} += " \
 	python3-sphinx \
 	"
 
+SRC_URI += "file://CVE-2024-42353.patch \
+           "
-- 
2.35.6


