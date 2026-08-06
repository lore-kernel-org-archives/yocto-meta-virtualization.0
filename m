Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8D6C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:55:14 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13622.1785995702962893722
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 22:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ITlVhZ7E;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6039; q=dns/txt;
  s=iport01; t=1785995702; x=1787205302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t7uLwyrzPua7Sr7aKkEbamS5c+a89jmPxOpUjOwTnbo=;
  b=ITlVhZ7EDJRxHXbLYS49YEtaRN95dZ+tLjH8dUnmXuCBDMsEyR8MO4JQ
   o2n4j+12O/KhWJwW9xFl5dvSxadH+LgHQGeDEFuZArebOmd2s0v9HH9Jy
   5MuMRmJcVHVUHgrD5XiOLqkV9FPo3Jn70ewOMx1zbT+ZiAbLLy1YNKtuz
   Qpm6qS78VtnRQG+QeHFzRJL25LPzWMPd6lXgY7m2EzHQqouukk42cqMf8
   yKls8IPNHgeH6xfNEeak9SaWCHoJ44kFsv65BztYeFwdvFSS28bAIwafn
   fpG91z3PCFf4jEKe8cp0g5AcH2s69Izd0WNLtoXLFHqG96gK531F+OzSx
   w==;
X-CSE-ConnectionGUID: /v9L0oAOQt6czWb8utXhjw==
X-CSE-MsgGUID: IjhtSlSGRGyDFDwmzS5xcA==
X-IPAS-Result: =?us-ascii?q?A0BIAgC5IHRq/5IQJK1aHgEBCxIMggULgld0XkNJAwGWR?=
 =?us-ascii?q?gOeG4F+DwEBAQ9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDMgEYARsSEBwDAQIvKyMIGYMCAYJ0AxG8d?=
 =?us-ascii?q?IIsgQGDKAGBVNsuAQsUAQWBM4U/iCFdGAFEhDgnGxuBcoEVg2mBBYEjLgsCA?=
 =?us-ascii?q?ogjBIIigQyBWh6QeEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsHB?=
 =?us-ascii?q?YEdgSiEaCMZNnqBCV6BLSpkARIXgQmCbwKCeoEpCxgNSBEsNxQZBD5uB41/I?=
 =?us-ascii?q?IJBAVc2AQcjASACb2cNJ5M/MZIGgTWfWgoog3WMIZU6GjOFW6URC5h9izeCU?=
 =?us-ascii?q?4YPgU2CMYtzUIRpgWg8OYEgcBWDIglKGQ+OCy2Da4VkxlUnMgIJAy8BAQcCB?=
 =?us-ascii?q?w4DC4FokX4BAQ?=
IronPort-Data: A9a23:RSFf6az2sdrMG48GVKJ6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUGz
 zEaCjuOb/fcMzD1fttxaNu2/EpTvZeEn4JqQQE5rlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaj9MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJAYobKlA/c9QOH0Q/
 u4nImAQciCDhf3jldpXSsE07igiBMDvOIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUieC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oi1aIKLIIXTGK25mG65p
 GLaxGDCLSs1JfCx5SWA4EnxluTmyHaTtIU6UefQGuRRqFie2mVWFhwMSUaypfirg1K/XNR3L
 00P5jFovK856EuzVN7/Uhak5nmesXYht8F4Guk+7kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:wVFkSaCmBUuMYZTlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3A98d1/2vKPfcvB3vi3x3KfYIg6ItibCz5lHD5BHa?=
 =?us-ascii?q?kV217d7fFVEOg+KF7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AIn2ZPw7BgnjwA4hgcxPfuBQdxoxJ4aSyM0Q2vq8?=
 =?us-ascii?q?pquWqGTN1KQzAnD+eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,207,1779148800"; 
   d="scan'208";a="800062115"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Aug 2026 05:55:02 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id E8AB318000467;
	Thu,  6 Aug 2026 05:55:01 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 84A26CD02BD; Wed,  5 Aug 2026 22:55:01 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-virtualization][scarthgap][PATCH 2/2] python3-webob: fix CVE-2026-44889
Date: Wed,  5 Aug 2026 22:54:55 -0700
Message-Id: <20260806055455.3114166-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260806055455.3114166-1-dkelaiya@cisco.com>
References: <20260806055455.3114166-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Aug 2026 05:55:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10028

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/Pylons/webob/commit/21c1c582bff83dc6f95fdb055e31a36db6d26e89
[2] https://github.com/Pylons/webob/security/advisories/GHSA-fh3h-vg37-cc95

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3-webob/CVE-2026-44889.patch | 124 ++++++++++++++++++
 .../python/python3-webob_1.8.7.bb             |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 recipes-devtools/python/python3-webob/CVE-2026-44889.patch

diff --git a/recipes-devtools/python/python3-webob/CVE-2026-44889.patch b/recipes-devtools/python/python3-webob/CVE-2026-44889.patch
new file mode 100644
index 00000000..6100301d
--- /dev/null
+++ b/recipes-devtools/python/python3-webob/CVE-2026-44889.patch
@@ -0,0 +1,124 @@
+From 24a7763bdb5f391bb520d5b79ca0e5b13af7bbbe Mon Sep 17 00:00:00 2001
+From: Delta Regeer <xistence@0x58.com>
+Date: Wed, 6 May 2026 00:38:51 -0600
+Subject: [PATCH] Fix open redirect issue due to changes made in cPython >=3.10
+
+CVE: CVE-2026-44889
+Upstream-Status: Backport [https://github.com/Pylons/webob/commit/21c1c582bff83dc6f95fdb055e31a36db6d26e89]
+
+(cherry picked from commit 21c1c582bff83dc6f95fdb055e31a36db6d26e89)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES.txt            | 15 ++++++++++++++
+ src/webob/response.py  | 11 +++++++---
+ tests/test_response.py | 46 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 69 insertions(+), 3 deletions(-)
+
+diff --git a/CHANGES.txt b/CHANGES.txt
+index ca33450..056031f 100644
+--- a/CHANGES.txt
++++ b/CHANGES.txt
+@@ -1,3 +1,18 @@
++Unreleased
++----------
++
++Security Fix
++~~~~~~~~~~~~
++
++- The fix for CVE-2024-42353 was incomplete: a Location value containing
++  ASCII tab, carriage return, or line feed characters between consecutive
++  slashes could still be interpreted as a protocol-relative URL by
++  ``urllib.parse.urljoin`` on Python 3.10+, allowing an open redirect.
++
++  See https://github.com/Pylons/webob/security/advisories/GHSA-fh3h-vg37-cc95
++
++  Thanks to Caleb Brown of Google for the report.
++
+ 1.8.7 (2021-02-17)
+ ------------------
+ 
+diff --git a/src/webob/response.py b/src/webob/response.py
+index efc38ec..91b801c 100644
+--- a/src/webob/response.py
++++ b/src/webob/response.py
+@@ -1281,12 +1281,17 @@ class Response(object):
+ 
+     @staticmethod
+     def _make_location_absolute(environ, value):
++        # urllib.parse.urlsplit() (called internally by urljoin) strips
++        # ASCII tab, CR, and LF from the URL on Python 3.10+. Strip them
++        # ourselves first so they cannot be used to bypass the SCHEME_RE
++        # or protocol-relative ("//") checks below. See CVE-2024-42353,
++        # https://github.com/Pylons/webob/security/advisories/GHSA-mg3v-6m49-jhp3,
++        # and the follow-up advisory GHSA-fh3h-vg37-cc95.
++        value = value.replace("\t", "").replace("\r", "").replace("\n", "")
++
+         if SCHEME_RE.search(value):
+             return value
+ 
+-        # This is to fix an open redirect issue due to the way that
+-        # urlparse.urljoin works. See CVE-2024-42353 and
+-        # https://github.com/Pylons/webob/security/advisories/GHSA-mg3v-6m49-jhp3
+         if value.startswith("//"):
+             value = "/%2f{}".format(value[2:])
+         new_location = urlparse.urljoin(_request_uri(environ), value)
+diff --git a/tests/test_response.py b/tests/test_response.py
+index 8a6ac06..2cdd981 100644
+--- a/tests/test_response.py
++++ b/tests/test_response.py
+@@ -1042,6 +1042,52 @@ def test_location_no_open_redirect():
+     assert req.get_response(res).location == "http://localhost/%2fwww.example.com/test"
+ 
+ 
++@pytest.mark.parametrize("payload", [
++    "/\t/www.example.com/test",
++    "\t//www.example.com/test",
++    "//\twww.example.com/test",
++    "/\t\t/www.example.com/test",
++])
++def test_location_no_open_redirect_tab_bypass(payload):
++    # Follow-up to CVE-2024-42353. urllib.parse.urlsplit() (used internally
++    # by urljoin) strips ASCII tab on Python 3.10+, which allowed a
++    # Location value to bypass the "//" check and be parsed as
++    # protocol-relative. See GHSA-fh3h-vg37-cc95. (CR and LF are already
++    # rejected by the location header setter, so only tab is reachable
++    # via the public API.)
++    res = Response()
++    res.status = "301"
++    res.location = payload
++    req = Request.blank("/")
++    assert req.get_response(res).location == (
++        "http://localhost/%2fwww.example.com/test"
++    )
++
++
++@pytest.mark.parametrize("payload", [
++    "/\t/www.example.com/test",
++    "/\n/www.example.com/test",
++    "/\r/www.example.com/test",
++    "\t//www.example.com/test",
++    "\n//www.example.com/test",
++    "\r//www.example.com/test",
++    "//\twww.example.com/test",
++    "//\nwww.example.com/test",
++    "//\rwww.example.com/test",
++    "//\tw\nww.example.com/test",
++])
++def test__make_location_absolute_strips_url_whitespace(payload):
++    # Defense in depth for GHSA-fh3h-vg37-cc95: even when called with a
++    # Location value that bypasses the descriptor's CR/LF check (e.g. via
++    # direct manipulation of _headerlist), tab/CR/LF must not be usable to
++    # turn a relative path into a protocol-relative redirect.
++    result = Response._make_location_absolute(
++        {"wsgi.url_scheme": "http", "HTTP_HOST": "example.com:80"},
++        payload,
++    )
++    assert result == "http://example.com/%2fwww.example.com/test"
++
++
+ @pytest.mark.xfail(sys.version_info < (3,0),
+                    reason="Python 2.x unicode != str, WSGI requires str. Test "
+                    "added due to https://github.com/Pylons/webob/issues/247. "
+-- 
+2.35.6
+
diff --git a/recipes-devtools/python/python3-webob_1.8.7.bb b/recipes-devtools/python/python3-webob_1.8.7.bb
index 5d7f74c8..b5e40c06 100644
--- a/recipes-devtools/python/python3-webob_1.8.7.bb
+++ b/recipes-devtools/python/python3-webob_1.8.7.bb
@@ -15,4 +15,5 @@ RDEPENDS:${PN} += " \
 	"
 
 SRC_URI += "file://CVE-2024-42353.patch \
+            file://CVE-2026-44889.patch \
            "
-- 
2.35.6


