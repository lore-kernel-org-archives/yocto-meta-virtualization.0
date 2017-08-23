Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5EEEE00CA9; Wed, 23 Aug 2017 12:20:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5BF1E00CA5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 12:20:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7NJKp6f021182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 12:20:52 -0700 (PDT)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 12:20:51 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 23 Aug 2017 15:20:48 -0400
Message-ID: <1503516048-18645-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] uwsgi: fixups for gcc 7.x
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
X-List-Received-Date: Wed, 23 Aug 2017 19:20:54 -0000
Content-Type: text/plain

Apply several upstream patches to fixup fallthrough switch
statements. This fixes build failures such as:

| core/hash.c:44:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
|            h ^= key[2] << 16;
|            ~~^~~~~~~~~~~~~~~
| core/hash.c:45:7: note: here
|        case 2:
|        ^~~~

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...icit-breaks-to-avoid-implicit-passthrough.patch | 50 ++++++++++++++++++++++
 ...icit-breaks-to-avoid-implicit-passthrough.patch | 50 ++++++++++++++++++++++
 meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta-openstack/recipes-extended/uwsgi/files/Add-explicit-breaks-to-avoid-implicit-passthrough.patch
 create mode 100644 meta-openstack/recipes-extended/uwsgi/files/more-Add-explicit-breaks-to-avoid-implicit-passthrough.patch

diff --git a/meta-openstack/recipes-extended/uwsgi/files/Add-explicit-breaks-to-avoid-implicit-passthrough.patch b/meta-openstack/recipes-extended/uwsgi/files/Add-explicit-breaks-to-avoid-implicit-passthrough.patch
new file mode 100644
index 0000000..4b9c015
--- /dev/null
+++ b/meta-openstack/recipes-extended/uwsgi/files/Add-explicit-breaks-to-avoid-implicit-passthrough.patch
@@ -0,0 +1,50 @@
+From 0a14d0f0425f00421a69f0ca8e09a92cfdfc6a36 Mon Sep 17 00:00:00 2001
+From: Paul Tagliamonte <paultag@gmail.com>
+Date: Mon, 7 Aug 2017 11:18:56 -0400
+Subject: [PATCH] Add explicit breaks to avoid implicit passthrough.
+
+commit 0a14d0f0425f00421a69f0ca8e09a92cfdfc6a36 from upstream
+git://github.com/unbit/uwsgi.git
+
+-Werror=implicit-fallthrough was added in gcc 7.1, which will
+throw a compile error if a switch has an implicit passthrough.
+
+Seeing as how this switch doesn't appear to depend on passthrough to
+function correctly, I've added explicit breaks to the switch.
+
+From https://gcc.gnu.org/gcc-7/changes.html:
+
+-Wimplicit-fallthrough warns when a switch case falls through. This
+warning has five different levels. The compiler is able to parse a wide
+range of fallthrough comments, depending on the level. It also handles
+control-flow statements, such as ifs. It's possible to suppress the
+warning by either adding a fallthrough comment, or by using a null
+statement: __attribute__ ((fallthrough)); (C, C++), or [[fallthrough]];
+(C++17), or [[gnu::fallthrough]]; (C++11/C++14). This warning is enabled
+by -Wextra.
+---
+ core/hash.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/core/hash.c b/core/hash.c
+index a1288fa..9ae6bd2 100644
+--- a/core/hash.c
++++ b/core/hash.c
+@@ -42,11 +42,14 @@ static uint32_t murmur2_hash(char *key, uint64_t keylen) {
+ 	switch (keylen) {
+ 		case 3:
+         		h ^= key[2] << 16;
++        		break;
+     		case 2:
+         		h ^= key[1] << 8;
++        		break;
+     		case 1:
+         		h ^= key[0];
+         		h *= 0x5bd1e995;
++        		break;
+     	}
+ 
+ 	h ^= h >> 13;
+-- 
+2.7.4
+
diff --git a/meta-openstack/recipes-extended/uwsgi/files/more-Add-explicit-breaks-to-avoid-implicit-passthrough.patch b/meta-openstack/recipes-extended/uwsgi/files/more-Add-explicit-breaks-to-avoid-implicit-passthrough.patch
new file mode 100644
index 0000000..5a885ed
--- /dev/null
+++ b/meta-openstack/recipes-extended/uwsgi/files/more-Add-explicit-breaks-to-avoid-implicit-passthrough.patch
@@ -0,0 +1,50 @@
+From 54666237455273e147eadb1904d261ed7624a8b6 Mon Sep 17 00:00:00 2001
+From: Paul Tagliamonte <tag@pault.ag>
+Date: Mon, 14 Aug 2017 15:42:15 -0400
+Subject: [PATCH] Add explicit breaks to avoid implicit passthrough.
+
+commit 54666237455273e147eadb1904d261ed7624a8b6 from upstream
+git://github.com/unbit/uwsgi.git
+
+-Werror=implicit-fallthrough was added in gcc 7.1, which will
+throw a compile error if a switch has an implicit passthrough.
+
+Seeing as how this switch doesn't appear to depend on passthrough to
+function correctly, I've added explicit breaks to the switch.
+
+From https://gcc.gnu.org/gcc-7/changes.html:
+
+-Wimplicit-fallthrough warns when a switch case falls through. This
+warning has five different levels. The compiler is able to parse a wide
+range of fallthrough comments, depending on the level. It also handles
+control-flow statements, such as ifs. It's possible to suppress the
+warning by either adding a fallthrough comment, or by using a null
+statement: __attribute__ ((fallthrough)); (C, C++), or [[fallthrough]];
+(C++17), or [[gnu::fallthrough]]; (C++11/C++14). This warning is enabled
+by -Wextra.
+---
+ core/routing.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/core/routing.c b/core/routing.c
+index 5887ec3..0cd6ea6 100644
+--- a/core/routing.c
++++ b/core/routing.c
+@@ -1792,10 +1792,10 @@ static int uwsgi_route_condition_ipv6in(struct wsgi_request *wsgi_req, struct uw
+ 
+ 	int i = (pfxlen / 32);
+ 	switch (i) {
+-	case 0: mask[0] = 0;
+-	case 1: mask[1] = 0;
+-	case 2: mask[2] = 0;
+-	case 3: mask[3] = 0;
++	case 0: mask[0] = 0; break;
++	case 1: mask[1] = 0; break;
++	case 2: mask[2] = 0; break;
++	case 3: mask[3] = 0; break;
+ 	}
+ 
+ 	if (pfxlen % 32)
+-- 
+2.7.4
+
diff --git a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
index dae288a..f0c535f 100644
--- a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
+++ b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=33ab1ce13e2312dddfad07f97f66321f"
 
 SRCNAME = "uwsgi"
 SRC_URI = "git://github.com/unbit/uwsgi.git;branch=uwsgi-2.0 \
+    file://Add-explicit-breaks-to-avoid-implicit-passthrough.patch \
+    file://more-Add-explicit-breaks-to-avoid-implicit-passthrough.patch \
 "
 
 SRCREV="af44211739136e22471a2897383f34586284bf86"
-- 
2.7.4


