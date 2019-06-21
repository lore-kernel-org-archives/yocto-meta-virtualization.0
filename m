Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CEACE00A5C; Thu, 20 Jun 2019 19:32:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,HEXHASH_WORD,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 HEXHASH_WORD Multiple instances of word + hexadecimal hash
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39D57E0090E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Jun 2019 19:32:30 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5L2W9R1030973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Jun 2019 19:32:19 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 20 Jun 2019 19:31:58 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 20 Jun 2019 22:31:17 -0400
Message-ID: <1561084277-143761-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH] glusterfs: recovery original author address of each patch
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jun 2019 02:32:31 -0000
Content-Type: text/plain

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch    | 2 +-
 .../glusterfs/files/dependence-on-correct-header-file-path.patch        | 2 +-
 recipes-extended/glusterfs/files/glusterd-change-port-range.patch       | 2 +-
 .../files/glusterfs-api-remove-unnecessary-library-options.patch        | 2 +-
 .../glusterfs/files/glusterfs-change-default-nfs-port-number.patch      | 2 +-
 .../files/glusterfs-configure-automake-with-subdir-objects-for.patch    | 2 +-
 .../glusterfs/files/glusterfs-disable-default-startup-scripts.patch     | 2 +-
 .../glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch         | 2 +-
 .../glusterfs/files/python-work-around-host-and-target-python.patch     | 2 +-
 recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
index 4bbcbe9..bcc4319 100644
--- a/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
+++ b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
@@ -1,5 +1,5 @@
 From f2a1c67e2b3b60ba54f506cf806437924b5242ca Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Yi Zhao <yi.zhao@windriver.com>
 Date: Tue, 12 Mar 2019 20:21:48 -0700
 Subject: [PATCH] configure.ac: allow PYTHON values to be passed via env
 
diff --git a/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
index a4b01c1..a1a6a65 100644
--- a/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
+++ b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
@@ -1,5 +1,5 @@
 From 204149d9b46ccec3a354ad4cfcc230c1fab93982 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Xulin Sun <xulin.sun@windriver.com>
 Date: Tue, 12 Mar 2019 22:04:12 -0700
 Subject: [PATCH] dependence on correct header file path
 
diff --git a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
index 3458d8a..daa9680 100644
--- a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
+++ b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
@@ -1,5 +1,5 @@
 From 59d1b6fb5e6315df9fc55a74576b1bfde30303f0 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Vu Tran <vu.tran@windriver.com>
 Date: Wed, 24 Apr 2019 23:07:58 -0400
 Subject: [PATCH] glusterd: change port range
 
diff --git a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
index 32f4dc1..32da618 100644
--- a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
@@ -1,5 +1,5 @@
 From 2b55524fab066cb14880a819f570b7f839bae1ce Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Wed, 24 Apr 2019 22:44:12 -0400
 Subject: [PATCH] glusterfs-api: remove unnecessary library options
 
diff --git a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
index deb9e45..9d5d7c1 100644
--- a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
@@ -1,5 +1,5 @@
 From b8b48d3c4ab92ce167db8137426fad45e938b11b Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Vu Tran <vu.tran@windriver.com>
 Date: Wed, 24 Apr 2019 22:50:01 -0400
 Subject: [PATCH] glusterfs: change default nfs port number
 
diff --git a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
index 6278ce6..50b012b 100644
--- a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
@@ -1,5 +1,5 @@
 From fcd612f75c2e99a0748bebbf530b730d0019d2bf Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Xulin Sun <xulin.sun@windriver.com>
 Date: Wed, 24 Apr 2019 22:33:49 -0400
 Subject: [PATCH] glusterfs: configure: automake with subdir-objects & foreign
  parameters
diff --git a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
index 7f582dc..c8e0e7d 100644
--- a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
@@ -1,5 +1,5 @@
 From bbc23b4723a5f60f2b6f4daf734194f9a3a315d8 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Donn Seeley <donn.seeley@windriver.com>
 Date: Wed, 24 Apr 2019 22:41:04 -0400
 Subject: [PATCH] Add the glusterfs package
 
diff --git a/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
index 660446b..f5880ea 100644
--- a/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
+++ b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
@@ -1,5 +1,5 @@
 From 732bcca9f5fbb6defca8c327744d015d6747864b Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Xulin Sun <xulin.sun@windriver.com>
 Date: Tue, 12 Mar 2019 19:56:59 -0700
 Subject: [PATCH] libglusterfs: Don't link against libfl
 
diff --git a/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
index 700b0ba..e8f99ac 100644
--- a/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
+++ b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
@@ -1,5 +1,5 @@
 From 80c38519224635e9fe2a21542b7dbb14e4c16dcc Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 12 Mar 2019 19:46:27 -0700
 Subject: [PATCH] python: work around host and target python
 
diff --git a/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch b/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch
index ed11ce5..346eb71 100644
--- a/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch
+++ b/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch
@@ -1,5 +1,5 @@
 From a18891a9807b209c7c0811e0e6ca08c4570809d0 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+From: Donn Seeley <donn.seeley@windriver.com>
 Date: Tue, 12 Mar 2019 22:00:46 -0700
 Subject: [PATCH] Add the glusterfs package
 
-- 
2.8.1


