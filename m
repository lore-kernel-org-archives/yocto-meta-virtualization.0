Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7AABEE009C5; Fri, 29 Jan 2016 10:13:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [63.239.67.10 listed in list.dnswl.org]
Received: from emvm-gh1-uea09.nsa.gov (emvm-gh1-uea09.nsa.gov [63.239.67.10])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1597FE0073D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 29 Jan 2016 10:13:37 -0800 (PST)
X-TM-IMSS-Message-ID: <d22401480003482f@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.194]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	d22401480003482f ; Fri, 29 Jan 2016 13:16:05 -0500
Received: from moss-terrapin.infosec.tycho.ncsc.mil (moss-terrapin
	[192.168.25.69])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u0TIDYSG016941
	for <meta-virtualization@yoctoproject.org>;
	Fri, 29 Jan 2016 13:13:35 -0500
From: Machon Gregory <mbgrego@tycho.nsa.gov>
To: meta-virtualization@yoctoproject.org
Date: Fri, 29 Jan 2016 13:24:02 -0500
Message-Id: <1454091842-15116-1-git-send-email-mbgrego@tycho.nsa.gov>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: [PATCH] Allow xsm to be built with GCC 5.1.1 and greater
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
X-List-Received-Date: Fri, 29 Jan 2016 18:13:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch was cherrypicked from upstream Xen. See patch header for more information.
---
 ...e-p-policyvers-be-a-local-variable-ver-to.patch | 122 +++++++++++++++++++++
 recipes-extended/xen/xen_4.6.0.bb                  |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch

diff --git a/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch b/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch
new file mode 100644
index 0000000..efe6e74
--- /dev/null
+++ b/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch
@@ -0,0 +1,122 @@
+From 6a2f81459e1455d65a9a6f78dd2a0d0278619680 Mon Sep 17 00:00:00 2001
+From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+Date: Wed, 16 Sep 2015 15:57:27 -0400
+Subject: [PATCH] xen/xsm: Make p->policyvers be a local variable (ver) to shut
+ up GCC 5.1.1 warnings.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+policydb.c: In function ‘user_read’:
+policydb.c:1443:26: error: ‘buf[2]’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
+         usrdatum->bounds = le32_to_cpu(buf[2]);
+                          ^
+cc1: all warnings being treated as errors
+
+Which (as Andrew mentioned) is because GCC cannot assume
+that 'p->policyvers' has the same value between checks.
+
+We make it local, optimize the name to 'ver' and the warnings go away.
+We also update another call site with this modification to
+make it more inline with the rest of the functions.
+
+Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>
+---
+ xen/xsm/flask/ss/policydb.c | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
+index a1060b1..eebfe9c 100644
+--- a/xen/xsm/flask/ss/policydb.c
++++ b/xen/xsm/flask/ss/policydb.c
+@@ -1258,6 +1258,7 @@ static int role_read(struct policydb *p, struct hashtab *h, void *fp)
+     int rc;
+     __le32 buf[3];
+     u32 len;
++    u32 ver = p->policyvers;
+ 
+     role = xzalloc(struct role_datum);
+     if ( !role )
+@@ -1266,7 +1267,7 @@ static int role_read(struct policydb *p, struct hashtab *h, void *fp)
+         goto out;
+     }
+ 
+-    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
++    if ( ver >= POLICYDB_VERSION_BOUNDARY )
+         rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
+     else
+         rc = next_entry(buf, fp, sizeof(buf[0]) * 2);
+@@ -1276,7 +1277,7 @@ static int role_read(struct policydb *p, struct hashtab *h, void *fp)
+ 
+     len = le32_to_cpu(buf[0]);
+     role->value = le32_to_cpu(buf[1]);
+-    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
++    if ( ver >= POLICYDB_VERSION_BOUNDARY )
+         role->bounds = le32_to_cpu(buf[2]);
+ 
+     key = xmalloc_array(char, len + 1);
+@@ -1328,6 +1329,7 @@ static int type_read(struct policydb *p, struct hashtab *h, void *fp)
+     int rc;
+     __le32 buf[4];
+     u32 len;
++    u32 ver = p->policyvers;
+ 
+     typdatum = xzalloc(struct type_datum);
+     if ( !typdatum )
+@@ -1336,7 +1338,7 @@ static int type_read(struct policydb *p, struct hashtab *h, void *fp)
+         return rc;
+     }
+ 
+-    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
++    if ( ver >= POLICYDB_VERSION_BOUNDARY )
+         rc = next_entry(buf, fp, sizeof(buf[0]) * 4);
+     else
+         rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
+@@ -1346,7 +1348,7 @@ static int type_read(struct policydb *p, struct hashtab *h, void *fp)
+ 
+     len = le32_to_cpu(buf[0]);
+     typdatum->value = le32_to_cpu(buf[1]);
+-    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
++    if ( ver >= POLICYDB_VERSION_BOUNDARY )
+     {
+         u32 prop = le32_to_cpu(buf[2]);
+ 
+@@ -1421,6 +1423,7 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
+     int rc;
+     __le32 buf[3];
+     u32 len;
++    u32 ver = p->policyvers;
+ 
+     usrdatum = xzalloc(struct user_datum);
+     if ( !usrdatum )
+@@ -1429,7 +1432,7 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
+         goto out;
+     }
+ 
+-    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
++    if ( ver >= POLICYDB_VERSION_BOUNDARY )
+         rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
+     else
+         rc = next_entry(buf, fp, sizeof(buf[0]) * 2);
+@@ -1439,7 +1442,7 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
+ 
+     len = le32_to_cpu(buf[0]);
+     usrdatum->value = le32_to_cpu(buf[1]);
+-    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
++    if ( ver >= POLICYDB_VERSION_BOUNDARY )
+         usrdatum->bounds = le32_to_cpu(buf[2]);
+ 
+     key = xmalloc_array(char, len + 1);
+@@ -1457,7 +1460,7 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
+     if ( rc )
+         goto bad;
+ 
+-    if ( p->policyvers >= POLICYDB_VERSION_MLS )
++    if ( ver >= POLICYDB_VERSION_MLS )
+     {
+         rc = mls_read_range_helper(&usrdatum->range, fp);
+         if ( rc )
+-- 
+2.1.0
+
diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/xen_4.6.0.bb
index 92975a0..4939275 100644
--- a/recipes-extended/xen/xen_4.6.0.bb
+++ b/recipes-extended/xen/xen_4.6.0.bb
@@ -3,6 +3,7 @@ require xen.inc
 SRC_URI = " \
     http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
     file://xen-x86-Fix-up-rules-when-forcing-mno-sse.patch \
+    file://xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch \
     "
 
 SRC_URI[md5sum] = "48e232f90927c08326a7b52bb06f49bc"
-- 
2.1.0


