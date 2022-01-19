Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11D9C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 05:13:46 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.2647.1642569225591207833
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 21:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WB8pPre8;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642569224; i=@fujitsu.com;
	bh=ZIqqfAfMxscTPoxCqvrnRz6PpQIPPbEAFj2LjASGGzU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WB8pPre8IlYh6ZFKmMvMF9J7jsJ6Ktm5PrGPXX2B3AWDdRldMo6JTSpLldGnWwd9r
	 Lq7sVIvEFtZomI677LOEm7hQAAIj3J08fAzR79D4Oa9/87YzOEWzIz1bdTF46+6b6q
	 Mq4jp7mxJb3D1PZudqO3OMsLDelfa9Hi6ofJhVHwwKAhC4pBvJhQVlJHF8YY8w1gtL
	 tfQVeGT84x+TiIUPJ7DRaEwcMGH/3BSoTigzb5dCDYWq24aJIF0Rmp+HyMzxYfaqJR
	 M3UXQ1zKDVINf6+skkX+thb/4Wc80FUqL/WzsEBvHmIU4qz/RyeL3BpPddFRPHvyj8
	 pwgAtGB+s++9A==
Received: from [100.115.37.147] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id DC/8C-28974-70E97E16;
 Wed, 19 Jan 2022 05:13:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqMs+73m
  iwb+pUhaLvjxjdWD0mHnqEXMAYxRrZl5SfkUCa8bpFc8YCyaJVWyY84m1gfGJcBcjJ4eQwFNG
  ib/Ho7oYuYDsi0wSd+9eYYdwTjBKrLu5ng2kik1ATWL6rRusILaIgIHEuXPzmUFsZgEViRe/e
  9hBbGGBZInL/3uZQGwWAVWJGRuOsnQxcnDwCjhJfP5WChKWEFCQmPLwPVgrp4CzxPmTh9khjn
  CS2PbiKiOIzSsgKHFy5hMWiPESEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUj
  aZyFpX8DItIrROqkoMz2jJDcxM0fX0MBA19DQVNfYWNfQ3FIvsUo3US+1VLc8tbhE10gvsbxY
  L7W4WK+4Mjc5J0UvL7VkEyMwiFOKFTfvYJy48qfeIUZJDiYlUV7R+OeJQnxJ+SmVGYnFGfFFp
  TmpxYcYZTg4lCR4m2YA5QSLUtNTK9Iyc4ARBZOW4OBREuF9DJLmLS5IzC3OTIdInWJUlBLnvT
  AbKCEAksgozYNrg0XxJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvNvnAE3hycwrgZv+Cmg
  xE9Di/mfPQBaXJCKkpBqYQphDLE3kfovcOBx5JNeg9VKX1I5ram3lje3VNZrnZj+ovPpJXfsF
  w7Of2jclMx/cbPH2eT3hxjoLo+kHd1xv8rgr+XyLkVlE7psTVrtNfI7f3ict6Hnx6IWaZU89X
  FgzN0T9zXztYuE464pJ+fzfnackayfWXROSfT/N3Vf4+8njbxYHLg0T2rR54tuSqdryAYpKXw
  Nv7oz9sG6J58VM+c91qXOitSV7dgr1KYvWbOk8lO/dy6rVIBkx/aOCU+szE4u382wmbP5b7JV
  m+q518/xl1xnWJrZq6C5oO3Fodg/vAZ/P5y/97jjEfMLQ/N6RpttBn81bHv5nj5FKP6ow/+zp
  bwIROwMPzK09NKeXS4mlOCPRUIu5qDgRAEJC2LFdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1642569223!58570!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11012 invoked from network); 19 Jan 2022 05:13:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 05:13:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1789E100199
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:13:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 05D3610018F
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:13:43 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 05:13:27 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH 8/8] python3-novnc:
 update 0.5.1 -> 1.3.0
Date: Wed, 19 Jan 2022 13:13:14 +0800
Message-ID: <1642569194-18853-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642569194-18853-1-git-send-email-wangmy@fujitsu.com>
References: <1642569194-18853-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 05:13:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7020

refresh python-distutils.patch

License-Update:
-year updated to 2019
-file of the noVNC core library changed
-the HTML, CSS, font and images files that included with the noVNC
 source distibution changed
-URL of history changed
-files and projects that have been incorporated into
 the noVNC core library changed
-license texts changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python-distutils.patch                                | 4 ++--
 .../python/{python-novnc_git.bb => python3-novnc_git.bb}  | 8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-novnc => python3-novnc}/python-distutils.patch (91%)
 rename meta-openstack/recipes-devtools/python/{python-novnc_git.bb => python3-novnc_git.bb} (68%)

diff --git a/meta-openstack/recipes-devtools/python/python-novnc/python-distutils.patch b/meta-openstack/recipes-devtools/python/python3-novnc/python-distutils.patch
similarity index 91%
rename from meta-openstack/recipes-devtools/python/python-novnc/python-distutils.patch
rename to meta-openstack/recipes-devtools/python/python3-novnc/python-distutils.patch
index ef3393f3..85befc9f 100644
--- a/meta-openstack/recipes-devtools/python/python-novnc/python-distutils.patch
+++ b/meta-openstack/recipes-devtools/python/python3-novnc/python-distutils.patch
@@ -1,13 +1,13 @@
 Index: git/setup.py
 ===================================================================
 --- /dev/null
-+++ git/setup.py
++++ b/setup.py
 @@ -0,0 +1,14 @@
 +#!/usr/bin/env python
 +
 +from distutils.core import setup
 +
-+setup(name='python-novnc',
++setup(name='python3-novnc',
 +      version='2012.1~e3',
 +      description='NoVNC python libraries',
 +      author='Ghe Rivero',
diff --git a/meta-openstack/recipes-devtools/python/python-novnc_git.bb b/meta-openstack/recipes-devtools/python/python3-novnc_git.bb
similarity index 68%
rename from meta-openstack/recipes-devtools/python/python-novnc_git.bb
rename to meta-openstack/recipes-devtools/python/python3-novnc_git.bb
index da5f048e..b41b5876 100644
--- a/meta-openstack/recipes-devtools/python/python-novnc_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-novnc_git.bb
@@ -2,13 +2,11 @@ DESCRIPTION = "This package contains the core python parts of NoVNC"
 HOMEPAGE = "https://github.com/kanaka/noVNC"
 SECTION = "devel/python"
 
-PR = "r0"
-
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6458695fb66dcd893becb5f9f912715e"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=99aebbcc36b17df855fad64d4b792bff"
 
-SRCREV = "3b8ec46fd26d644e6edbea4f46e630929297e448"
-PV = "0.5.1+git${SRCPV}"
+SRCREV = "463c39e4af98ec4106b87bbea17e1605aa4c6180"
+PV = "1.3.0"
 
 SRC_URI = "git://github.com/kanaka/noVNC.git;branch=master;protocol=https \
            file://python-distutils.patch"
-- 
2.25.1


