Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.9414.1583119949761754144
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Mar 2020 19:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0223WSxv025438
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 1 Mar 2020 19:32:29 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 1 Mar 2020 19:32:28 -0800
From: "Changqing Li" <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] openvswitch-git: refresh patch to fix patch-fuzz warning
Date: Mon, 2 Mar 2020 11:32:26 +0800
Message-ID: <1583119946-260471-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...vswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
index a8fc86c..fc74deb 100644
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
@@ -13,6 +13,8 @@ Fix ptest for v2.5
 
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 
+refresh patch to fix patch-fuzz warning
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  Makefile.am |  1 +
  test.mk     | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@@ -23,8 +25,8 @@ diff --git a/Makefile.am b/Makefile.am
 index 7889728..6435399 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -494,3 +494,4 @@ include windows/automake.mk
- include ovn/automake.mk
+@@ -497,3 +497,4 @@ include windows/automake.mk
+ include windows/automake.mk
  include selinux/automake.mk
  include build-aux/automake.mk
 +include test.mk
-- 
2.7.4

