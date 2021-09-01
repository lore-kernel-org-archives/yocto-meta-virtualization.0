Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.1933.1630459342220593565
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 18:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ow0530dq;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d11so1304406qtw.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Aug 2021 18:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=auNw+rClDwYE3jFzEU9dOicKJX8WJ97txjlVJ+J/xrw=;
        b=ow0530dqbPiilrD3jB8vbqZyLBTDOYExxVFJLRIO057fUEQx0ptA4dpNOktcr6x1jr
         GnyduPxzufcmgn43Mp478KiGPBFaoJx2cw0sPEAFDHl7RjfpAyKbi12p4lKn48Me781c
         WKc0jt6VCJGgnZ7IrdZJaK0iRjLorrQwUngOgOJccq5M5cafCzmu0J4inw9W+qwEbsbd
         yBQxFwG8gurZWd1SQjIUUW39kv6wZHZhZBztD1i5QVVWOG/p5A8nB5Q0snL5NdfV3ytw
         B6D1iT5OeoTkCg+0mImzYVc44dU5pt37jOocXfKcK0k8YhGyWxLQ3yN1+8GcU2g8fi4j
         hvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=auNw+rClDwYE3jFzEU9dOicKJX8WJ97txjlVJ+J/xrw=;
        b=J4ERgDS7jFX+jkUvikNjBhx6PbA9UA8c6bG/H5gyImmhDN2RmxUC/A1VekFC1/ee41
         fmpDYkRNZeLjuxmpfHbRP9W9cSO2P8EHpLgEm7uJS30s9mBzVthRs1+EhBMUCTBBFaRr
         ZUyqIpg0oQdpgKpU9Bc/Wf7hWsAYVK4s5Np2OhuWfRoN5I1VwM215dxa4T0W322Kc+lD
         URv0nosxbXGlrzYr1btNMpYt4p8GLV3Vxy3w0Z48dfY/TB5eGo5EVRcr/f9Jqv1uiO0W
         PdTJi3LE45sA5HDFhKUYf3od67odEkDy6NPBpXA6QtIC2Chwmuo6R/KQq8fHvq6X+PT/
         H0Yw==
X-Gm-Message-State: AOAM532qFQO6oHeNYWQDbNsSqH2RysBWrxaOZ4bg3AR7mATyudwHiLBC
	+qrjeF5U8EkffHGv1d2+Ty/mPDXJMIU=
X-Google-Smtp-Source: ABdhPJwys98EooUzgDqRortPaNXGZ3QnBC1cdUpL3rWW538YPO8suGoWFD1SS9z6F9It94xcA1Rmgw==
X-Received: by 2002:ac8:7f83:: with SMTP id z3mr5730462qtj.346.1630459341118;
        Tue, 31 Aug 2021 18:22:21 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-170-39-79.mycingular.net. [166.170.39.79])
        by smtp.gmail.com with ESMTPSA id 75sm15308034qko.100.2021.08.31.18.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 18:22:20 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io,
	jdmason@kudzu.us
Subject: [meta-virtualization][PATCH 5/4] xtf_minimal oeqa: improve the invocation of xtf-runner
Date: Tue, 31 Aug 2021 18:22:07 -0700
Message-Id: <20210901012207.253450-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xtf-runner already contains logic to adjust CWD when run so remove the
unnecessary change of directory before running it.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Also remove the hardcoding of the path to the XTF directory - resolve it
the same way that the recipe does.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---

This patch applies on top of the related series of 4 XTF patches posted
earlier today.

 lib/oeqa/runtime/cases/xtf_minimal.py | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/lib/oeqa/runtime/cases/xtf_minimal.py b/lib/oeqa/runtime/cases/xtf_minimal.py
index 6094cd9..8e2c441 100644
--- a/lib/oeqa/runtime/cases/xtf_minimal.py
+++ b/lib/oeqa/runtime/cases/xtf_minimal.py
@@ -52,14 +52,11 @@ def xtf_runner_exit_status(state):
              6: "CRASH",
     }[state]
 
-xtf_rundir = '/usr/libexec/xtf'
-
 class XTFMinimalTest(OERuntimeTestCase):
 
-    def query_xtf_cases(self, query_item):
-        (status, output) = self.target.run(
-                            'cd %s; ./xtf-runner --list %s' % \
-                            (xtf_rundir, query_item))
+    def query_xtf_cases(self, xtf_runner, query_item):
+        (status, output) = self.target.run('%s --list %s' % \
+                                           (xtf_runner, query_item))
         self.assertTrue(status == 0, msg='XTF runner failed')
 
         populate_case_lines = output.split('\n')
@@ -68,7 +65,7 @@ class XTFMinimalTest(OERuntimeTestCase):
 
         return list(map(lambda x: x.lstrip().rstrip(), populate_case_lines))
 
-    def get_xtf_case_list(self):
+    def get_xtf_case_list(self, xtf_runner):
         xtf_cases = []
 
         populate = self.tc.td.get('XTF_TEST_CASES_POPULATE')
@@ -79,7 +76,7 @@ class XTFMinimalTest(OERuntimeTestCase):
             populate = DEFAULT_POPULATE
 
         for query_item in populate.split('|'):
-            xtf_cases.extend( self.query_xtf_cases(query_item) )
+            xtf_cases.extend( self.query_xtf_cases(xtf_runner, query_item) )
 
         if skip is not None:
             for skip_item in skip.split(' '):
@@ -96,9 +93,9 @@ class XTFMinimalTest(OERuntimeTestCase):
         self.logger.info('XTF cases: %s' % str(xtf_cases))
         return xtf_cases
 
-    def run_xtf_case(self, xtf_case_name):
-        (status, output) = self.target.run('cd %s; ./xtf-runner %s' % \
-                                           (xtf_rundir, xtf_case_name))
+    def run_xtf_case(self, xtf_runner, xtf_case_name):
+        (status, output) = self.target.run('%s %s' %
+                                           (xtf_runner, xtf_case_name))
         self.assertTrue(status == 0, msg='XTF test %s failed: %s' % \
                         (xtf_case_name, xtf_runner_exit_status(status)))
 
@@ -108,9 +105,12 @@ class XTFMinimalTest(OERuntimeTestCase):
     @OEHasPackage(['xen-tools'])
     def test_xtf_minimal(self):
 
-        xtf_cases = self.get_xtf_case_list()
+        xtf_runner = os.path.join(self.tc.td.get('libexecdir'), 'xtf',
+                                  'xtf-runner')
+
+        xtf_cases = self.get_xtf_case_list(xtf_runner)
 
         for xtf_case_name in xtf_cases:
             self.logger.debug('Running XTF case: %s' % xtf_case_name)
 
-            self.run_xtf_case(xtf_case_name)
+            self.run_xtf_case(xtf_runner, xtf_case_name)
-- 
2.25.1

