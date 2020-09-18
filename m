Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.8963.1600420923737778970
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2994D38C084A
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 02:22:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,274,1596470400"; 
   d="scan'208";a="99403890"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Sep 2020 17:22:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4EB3648990F3
	for <meta-virtualization@yoctoproject.org>; Fri, 18 Sep 2020 17:22:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Sep 2020 17:22:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-hp3parclient: Change to python3
Date: Sat, 19 Sep 2020 05:22:03 +0800
Message-ID: <1600464123-31735-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4EB3648990F3.AED4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
fix_hp3parclient_memory_leak.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../fix_hp3parclient_memory_leak.patch                    | 8 ++++----
 ...p3parclient_3.2.0.bb => python3-hp3parclient_3.2.0.bb} | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-hp3parclient => python3-hp3parclient}/fix_hp3parclient_memory_leak.patch (91%)
 rename meta-openstack/recipes-devtools/python/{python-hp3parclient_3.2.0.bb => python3-hp3parclient_3.2.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-hp3parclient/fix_hp3parclient_memory_leak.patch b/meta-openstack/recipes-devtools/python/python3-hp3parclient/fix_hp3parclient_memory_leak.patch
similarity index 91%
rename from meta-openstack/recipes-devtools/python/python-hp3parclient/fix_hp3parclient_memory_leak.patch
rename to meta-openstack/recipes-devtools/python/python3-hp3parclient/fix_hp3parclient_memory_leak.patch
index ac196fd..25aebc0 100644
--- a/meta-openstack/recipes-devtools/python/python-hp3parclient/fix_hp3parclient_memory_leak.patch
+++ b/meta-openstack/recipes-devtools/python/python3-hp3parclient/fix_hp3parclient_memory_leak.patch
@@ -4,7 +4,7 @@
 
 --- a/hp3parclient/http.py
 +++ b/hp3parclient/http.py
-@@ -61,6 +61,7 @@
+@@ -66,6 +66,7 @@
          self.set_debug_flag(http_log_debug)
  
          self.times = []  # [("item", starttime, endtime), ...]
@@ -25,7 +25,7 @@
      def _http_log_req(self, args, kwargs):
          if not self.http_log_debug:
              return
-@@ -205,6 +212,9 @@
+@@ -208,6 +215,9 @@
          resp, body = self.request(url, method, **kwargs)
          self.times.append(("%s %s" % (method, url),
                             start_time, time.time()))
@@ -33,5 +33,5 @@
 +        while len(self.times) > self.times_max_len:
 +            del self.times[0]
          return resp, body
- 
- 
+
+     def _do_reauth(self, url, method, ex, **kwargs):
diff --git a/meta-openstack/recipes-devtools/python/python-hp3parclient_3.2.0.bb b/meta-openstack/recipes-devtools/python/python3-hp3parclient_3.2.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-hp3parclient_3.2.0.bb
rename to meta-openstack/recipes-devtools/python/python3-hp3parclient_3.2.0.bb
-- 
2.25.1



