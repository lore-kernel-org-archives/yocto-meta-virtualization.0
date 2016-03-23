Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97C6EE00BBF; Wed, 23 Mar 2016 13:49:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25C7FE00B97
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Mar 2016 13:49:16 -0700 (PDT)
Received: by mail-qg0-f54.google.com with SMTP id y89so22546220qge.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Mar 2016 13:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NSH4lUswVPAOH80x4B1IOCWkimIQUmg50VD/oSYZZYM=;
	b=QH/CpFAV9y/AGpX5jrBKn8FjMhSiSBES+LrTY0X88xX8euh3Mr28rG0x3T6rVtH8RO
	lLW56Y44Pt/5cvZC44fu+B0JTiDx/GWvoX7E18d4dJi52uTyX3ZC3eRqqLdtl/7ywbCC
	4HGh6VD3PhLUjSDFJJlHvPiCmvUxhyKGmKjiEfgKMBFBftnJdXtThY85P7tNUdkFK4/G
	0LYoI0YnYD4pw+71dkMK4NWfpMzQoXqdbgaiu0Zac4YH+ks6eRzHmwHypAM1RXC30DWr
	E+qGtHF/Ph0Es6Zfu+6HRH3jaEm4EyRrtdohzpWuciWQAmyMQ+VIQ5jehmHhkru3nAbh
	6+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NSH4lUswVPAOH80x4B1IOCWkimIQUmg50VD/oSYZZYM=;
	b=XuchcRmyal/bC5hEwcSzLi9bcqPwOd3YbR7R1caV5yKF8BIwRqk9JH9SzMCUCDN29e
	SJH7iia+AxeDvwuN7mV8StQ8yuBjHF7ifDcQZ9u5JYEznlaZw5IGybloZtLu/gLiAkYk
	S/5NnyFSzWlDEWOM/kDvPDdf5ZdQM2uh33EDZX924WeelRR70VDEM/Aa60L4hg0nfE5E
	ea00iz0FkzcF3xMahWb6eyzwVSxUsQVkTPsTnIJuabzcg4uFpiY/IT5s12FMkRIweFuF
	t9cm33QK3wm2jsa+84hXyLawaRbyJ6bRvKQWLq49hJWwJsWxVOa9ebeTVribGHUmaToX
	bzKA==
X-Gm-Message-State: AD7BkJIz6oh905JDgpiYJzuqIfF4AMiC3UphDV5ake7XE19BUe7LgX9HB9NwxiNlBQpmeA==
X-Received: by 10.140.81.231 with SMTP id f94mr6176450qgd.25.1458766155665;
	Wed, 23 Mar 2016 13:49:15 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	49sm1826560qgx.32.2016.03.23.13.49.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:49:15 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 23 Mar 2016 16:49:11 -0400
Message-Id: <1458766151-4341-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] xen: uprev to 4.6.1
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
X-List-Received-Date: Wed, 23 Mar 2016 20:49:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chris Patterson <pattersonc@ainfosec.com>

Drop xsm fix backport, no longer required.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 ...e-p-policyvers-be-a-local-variable-ver-to.patch | 122 ---------------------
 recipes-extended/xen/xen_4.6.0.bb                  |  11 --
 recipes-extended/xen/xen_4.6.1.bb                  |  10 ++
 3 files changed, 10 insertions(+), 133 deletions(-)
 delete mode 100644 recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch
 delete mode 100644 recipes-extended/xen/xen_4.6.0.bb
 create mode 100644 recipes-extended/xen/xen_4.6.1.bb

diff --git a/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch b/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch
deleted file mode 100644
index efe6e74..0000000
--- a/recipes-extended/xen/files/xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 6a2f81459e1455d65a9a6f78dd2a0d0278619680 Mon Sep 17 00:00:00 2001
-From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
-Date: Wed, 16 Sep 2015 15:57:27 -0400
-Subject: [PATCH] xen/xsm: Make p->policyvers be a local variable (ver) to shut
- up GCC 5.1.1 warnings.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-policydb.c: In function ‘user_read’:
-policydb.c:1443:26: error: ‘buf[2]’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
-         usrdatum->bounds = le32_to_cpu(buf[2]);
-                          ^
-cc1: all warnings being treated as errors
-
-Which (as Andrew mentioned) is because GCC cannot assume
-that 'p->policyvers' has the same value between checks.
-
-We make it local, optimize the name to 'ver' and the warnings go away.
-We also update another call site with this modification to
-make it more inline with the rest of the functions.
-
-Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
-Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>
----
- xen/xsm/flask/ss/policydb.c | 17 ++++++++++-------
- 1 file changed, 10 insertions(+), 7 deletions(-)
-
-diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
-index a1060b1..eebfe9c 100644
---- a/xen/xsm/flask/ss/policydb.c
-+++ b/xen/xsm/flask/ss/policydb.c
-@@ -1258,6 +1258,7 @@ static int role_read(struct policydb *p, struct hashtab *h, void *fp)
-     int rc;
-     __le32 buf[3];
-     u32 len;
-+    u32 ver = p->policyvers;
- 
-     role = xzalloc(struct role_datum);
-     if ( !role )
-@@ -1266,7 +1267,7 @@ static int role_read(struct policydb *p, struct hashtab *h, void *fp)
-         goto out;
-     }
- 
--    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
-+    if ( ver >= POLICYDB_VERSION_BOUNDARY )
-         rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
-     else
-         rc = next_entry(buf, fp, sizeof(buf[0]) * 2);
-@@ -1276,7 +1277,7 @@ static int role_read(struct policydb *p, struct hashtab *h, void *fp)
- 
-     len = le32_to_cpu(buf[0]);
-     role->value = le32_to_cpu(buf[1]);
--    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
-+    if ( ver >= POLICYDB_VERSION_BOUNDARY )
-         role->bounds = le32_to_cpu(buf[2]);
- 
-     key = xmalloc_array(char, len + 1);
-@@ -1328,6 +1329,7 @@ static int type_read(struct policydb *p, struct hashtab *h, void *fp)
-     int rc;
-     __le32 buf[4];
-     u32 len;
-+    u32 ver = p->policyvers;
- 
-     typdatum = xzalloc(struct type_datum);
-     if ( !typdatum )
-@@ -1336,7 +1338,7 @@ static int type_read(struct policydb *p, struct hashtab *h, void *fp)
-         return rc;
-     }
- 
--    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
-+    if ( ver >= POLICYDB_VERSION_BOUNDARY )
-         rc = next_entry(buf, fp, sizeof(buf[0]) * 4);
-     else
-         rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
-@@ -1346,7 +1348,7 @@ static int type_read(struct policydb *p, struct hashtab *h, void *fp)
- 
-     len = le32_to_cpu(buf[0]);
-     typdatum->value = le32_to_cpu(buf[1]);
--    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
-+    if ( ver >= POLICYDB_VERSION_BOUNDARY )
-     {
-         u32 prop = le32_to_cpu(buf[2]);
- 
-@@ -1421,6 +1423,7 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
-     int rc;
-     __le32 buf[3];
-     u32 len;
-+    u32 ver = p->policyvers;
- 
-     usrdatum = xzalloc(struct user_datum);
-     if ( !usrdatum )
-@@ -1429,7 +1432,7 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
-         goto out;
-     }
- 
--    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
-+    if ( ver >= POLICYDB_VERSION_BOUNDARY )
-         rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
-     else
-         rc = next_entry(buf, fp, sizeof(buf[0]) * 2);
-@@ -1439,7 +1442,7 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
- 
-     len = le32_to_cpu(buf[0]);
-     usrdatum->value = le32_to_cpu(buf[1]);
--    if ( p->policyvers >= POLICYDB_VERSION_BOUNDARY )
-+    if ( ver >= POLICYDB_VERSION_BOUNDARY )
-         usrdatum->bounds = le32_to_cpu(buf[2]);
- 
-     key = xmalloc_array(char, len + 1);
-@@ -1457,7 +1460,7 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
-     if ( rc )
-         goto bad;
- 
--    if ( p->policyvers >= POLICYDB_VERSION_MLS )
-+    if ( ver >= POLICYDB_VERSION_MLS )
-     {
-         rc = mls_read_range_helper(&usrdatum->range, fp);
-         if ( rc )
--- 
-2.1.0
-
diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/xen_4.6.0.bb
deleted file mode 100644
index 7650e46..0000000
--- a/recipes-extended/xen/xen_4.6.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xen.inc
-
-SRC_URI = " \
-    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
-    file://xen-xsm-Make-p-policyvers-be-a-local-variable-ver-to.patch \
-    "
-
-SRC_URI[md5sum] = "48e232f90927c08326a7b52bb06f49bc"
-SRC_URI[sha256sum] = "6fa1c2431df55aa5950d248e6093b8c8c0f11c357a0adbd348a2186478e80909"
-
-S = "${WORKDIR}/xen-${PV}"
diff --git a/recipes-extended/xen/xen_4.6.1.bb b/recipes-extended/xen/xen_4.6.1.bb
new file mode 100644
index 0000000..0adf8ad
--- /dev/null
+++ b/recipes-extended/xen/xen_4.6.1.bb
@@ -0,0 +1,10 @@
+require xen.inc
+
+SRC_URI = " \
+    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
+    "
+
+SRC_URI[md5sum] = "df2d854c3c90ffeefaf71e7f868fb326"
+SRC_URI[sha256sum] = "44cc2fccba1e147ef4c8da0584ce0f24189c8743de0e3e9a9226da88ddb5f589"
+
+S = "${WORKDIR}/xen-${PV}"
-- 
2.1.4


