Return-Path: <Tudor.Florea@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDA2AE00964; Fri, 13 Feb 2015 02:35:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C4BC6E008F6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Feb 2015 02:35:23 -0800 (PST)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Feb 2015 11:35:16 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 7B21C2800CF;
	Fri, 13 Feb 2015 11:35:16 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 13 Feb 2015 11:35:13 +0100
Message-ID: <1423823713-57878-4-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423823713-57878-1-git-send-email-tudor.florea@enea.com>
References: <1423823713-57878-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 3/3] iproute2: remove patch already applied
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
X-List-Received-Date: Fri, 13 Feb 2015 10:35:26 -0000
Content-Type: text/plain

Remove the patch 0003-Don-t-enforce-that-dev-already-exists.patch
as the code is already applied.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 ...003-Don-t-enforce-that-dev-already-exists.patch | 27 ----------------------
 .../iproute2/iproute2_3.16.0.bbappend              |  2 --
 2 files changed, 29 deletions(-)
 delete mode 100644 meta-openstack/recipes-support/iproute2/iproute2/0003-Don-t-enforce-that-dev-already-exists.patch

diff --git a/meta-openstack/recipes-support/iproute2/iproute2/0003-Don-t-enforce-that-dev-already-exists.patch b/meta-openstack/recipes-support/iproute2/iproute2/0003-Don-t-enforce-that-dev-already-exists.patch
deleted file mode 100644
index b296abe..0000000
--- a/meta-openstack/recipes-support/iproute2/iproute2/0003-Don-t-enforce-that-dev-already-exists.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 4a5577fab7490573ceaafa6e4417cf03bca178f1 Mon Sep 17 00:00:00 2001
-Message-Id: <4a5577fab7490573ceaafa6e4417cf03bca178f1.1407786415.git.agx@sigxcpu.org>
-From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
-Date: Mon, 11 Aug 2014 21:41:51 +0200
-Subject: [PATCH] Don't enforce that dev already exists
-
-Commit 9a02651a87d0fd56e2e7eedd63921a050a42b3ec tried to make sure
-the device can be looked up but that e.g. isn't true for
-
-  ip link add vnet10 type veth peer name vnet11
-
-where vnet10 isn't yet existent.
----
- ip/iplink.c | 2 --
- 1 file changed, 2 deletions(-)
-
---- a/ip/iplink.c
-+++ b/ip/iplink.c
-@@ -571,8 +571,6 @@ int iplink_parse(int argc, char **argv,
- 				duparg2("dev", *argv);
- 			*dev = *argv;
- 			dev_index = ll_name_to_index(*dev);
--			if (dev_index == 0)
--				invarg("Unknown device", *argv);
- 		}
- 		argc--; argv++;
- 	}
diff --git a/meta-openstack/recipes-support/iproute2/iproute2_3.16.0.bbappend b/meta-openstack/recipes-support/iproute2/iproute2_3.16.0.bbappend
index 8949646..2fde00d 100644
--- a/meta-openstack/recipes-support/iproute2/iproute2_3.16.0.bbappend
+++ b/meta-openstack/recipes-support/iproute2/iproute2_3.16.0.bbappend
@@ -2,5 +2,3 @@ FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
 
 RRECOMMENDS_${PN} += "kernel-module-veth \
 	"
-
-SRC_URI += " file://0003-Don-t-enforce-that-dev-already-exists.patch"
-- 
1.9.1


