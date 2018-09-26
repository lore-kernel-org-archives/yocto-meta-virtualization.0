Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B575DE00B9D; Tue, 25 Sep 2018 19:48:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,LOTS_OF_MONEY,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  0.0 LOTS_OF_MONEY Huge... sums of money
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B81A1E006F1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:48:47 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8Q2ml9r006988
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:48:47 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 19:48:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Sep 2018 10:36:28 +0800
Message-ID: <1537929391-32035-4-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
References: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 4/7] glusterfs: fix CVE-2018-10904
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
X-List-Received-Date: Wed, 26 Sep 2018 02:48:48 -0000
Content-Type: text/plain

Backport patch to fix the following CVE.

CVE: CVE-2018-10904

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ats-dump-io-stats-info-in-var-run-gluster.patch | 153 +++++++++++++++++++++
 recipes-extended/glusterfs/glusterfs.inc           |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 recipes-extended/glusterfs/files/0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch

diff --git a/recipes-extended/glusterfs/files/0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch b/recipes-extended/glusterfs/files/0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch
new file mode 100644
index 0000000..6fb261d
--- /dev/null
+++ b/recipes-extended/glusterfs/files/0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch
@@ -0,0 +1,153 @@
+From 0f9c26d5e3a0d0480ff31a800ca8f31966da10ff Mon Sep 17 00:00:00 2001
+From: Amar Tumballi <amarts@redhat.com>
+Date: Tue, 24 Jul 2018 15:42:28 +0530
+Subject: [PATCH 4/7] io-stats: dump io-stats info in /var/run/gluster
+
+It wouldn't make sense to allow iostats file to be written in
+*any* directory. While the formating makes sure we try to append
+io-stats-name for the file, so overwriting existing file is slim,
+but in any case it makes sense to restrict dumping to one directory.
+
+Below are the sample commands, and files created for the corresponding
+values:
+
+ $ setfattr -n trusted.io-stats-dump -v file-for-dump $M0
+
+In this case, the file would be in /var/run/gluster/file-for-dump
+
+ $ setfattr -n trusted.io-stats-dump -v /dir1/dir2/file-for-dump $M0
+
+In this case, then the dump file is in /var/run/gluster/dir1-dir2-file-for-dump
+
+Note that the value passed for this virtual xattr would be treated as a
+file, and even if the value has '/' in it, it would be changed to '-'
+for sanity.
+
+Fixes: bz#1625106
+
+Change-Id: Id9ae6a40a190b8937c51662e6e1c2a0f6c86a0e0
+Signed-off-by: Amar Tumballi <amarts@redhat.com>
+
+Upstream-Status: Backport
+
+Fix CVE-2018-10904
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tests/bugs/core/io-stats-1322825.t    | 12 ++++++------
+ xlators/debug/io-stats/src/io-stats.c | 34 +++++++++++++++++++++++++---------
+ 2 files changed, 31 insertions(+), 15 deletions(-)
+
+diff --git a/tests/bugs/core/io-stats-1322825.t b/tests/bugs/core/io-stats-1322825.t
+index d232ecb..53f2d04 100755
+--- a/tests/bugs/core/io-stats-1322825.t
++++ b/tests/bugs/core/io-stats-1322825.t
+@@ -23,7 +23,7 @@ TEST $CLI volume profile $V0 start
+ TEST mkdir $M0/dir1
+ 
+ # Generate the stat dump across the io-stat instances
+-TEST setfattr -n trusted.io-stats-dump -v /tmp/io-stats-1322825 $M0
++TEST setfattr -n trusted.io-stats-dump -v io-stats-1322825 $M0
+ 
+ # Check if $M0 is clean w.r.t xattr information
+ # TODO: if there are better ways to check we really get no attr error, please
+@@ -42,12 +42,12 @@ ret=$(echo $?)
+ EXPECT 0 echo $ret
+ 
+ # Check if we have 5 io-stat files in /tmp
+-EXPECT 5 ls -1 /tmp/io-stats-1322825*
++EXPECT 5 ls -1 /var/run/gluster/io-stats-1322825*
+ # Cleanup the 5 generated files
+-rm -f /tmp/io-stats-1322825*
++rm -f /var/run/gluster/io-stats-1322825*
+ 
+ # Rinse and repeat above for a directory
+-TEST setfattr -n trusted.io-stats-dump -v /tmp/io-stats-1322825 $M0/dir1
++TEST setfattr -n trusted.io-stats-dump -v io-stats-1322825 $M0/dir1
+ getfattr -n trusted.io-stats-dump $B0/${V0}1/dir1 2>&1 | grep -qi "no such attribute"
+ ret=$(echo $?)
+ EXPECT 0 echo $ret
+@@ -61,7 +61,7 @@ getfattr -n trusted.io-stats-dump $B0/${V0}4/dir1 2>&1 | grep -qi "no such attri
+ ret=$(echo $?)
+ EXPECT 0 echo $ret
+ 
+-EXPECT 5 ls -1 /tmp/io-stats-1322825*
+-rm -f /tmp/io-stats-1322825*
++EXPECT 5 ls -1 /var/run/gluster/io-stats-1322825*
++rm -f /var/run/gluster/io-stats-1322825*
+ 
+ cleanup;
+diff --git a/xlators/debug/io-stats/src/io-stats.c b/xlators/debug/io-stats/src/io-stats.c
+index d9d1e1d..72fa39c 100644
+--- a/xlators/debug/io-stats/src/io-stats.c
++++ b/xlators/debug/io-stats/src/io-stats.c
+@@ -45,6 +45,8 @@
+ #define DEFAULT_GRP_BUF_SZ 16384
+ #define IOS_BLOCK_COUNT_SIZE 32
+ 
++#define IOS_STATS_DUMP_DIR DEFAULT_VAR_RUN_DIRECTORY
++
+ typedef enum {
+         IOS_STATS_TYPE_NONE,
+         IOS_STATS_TYPE_OPEN,
+@@ -2999,7 +3001,6 @@ io_stats_fsync (call_frame_t *frame, xlator_t *this,
+         return 0;
+ }
+ 
+-
+ int
+ conditional_dump (dict_t *dict, char *key, data_t *value, void *data)
+ {
+@@ -3012,9 +3013,10 @@ conditional_dump (dict_t *dict, char *key, data_t *value, void *data)
+         char                 *filename = NULL;
+         FILE                 *logfp = NULL;
+         struct ios_dump_args args = {0};
+-        int                   pid, namelen;
++        int                   pid, namelen, dirlen;
+         char                  dump_key[100];
+         char                 *slash_ptr = NULL;
++        char                 *path_in_value = NULL;
+ 
+         stub  = data;
+         this  = stub->this;
+@@ -3023,16 +3025,30 @@ conditional_dump (dict_t *dict, char *key, data_t *value, void *data)
+         name as well. This helps when there is more than a single io-stats
+         instance in the graph, or the client and server processes are running
+         on the same node */
+-        /* hmmm... no check for this */
+-        /* name format: <passed in path/filename>.<xlator name slashes to -> */
+-        namelen = value->len + strlen (this->name) + 2; /* '.' and '\0' */
++        /* For the sanity of where the file should be located, we should make
++           sure file is written only inside RUNDIR (ie, /var/run/gluster) */
++        /* TODO: provide an option to dump it to different directory of
++           choice, based on options */
++        /* name format: /var/run/gluster/<passed in path/filename>.<xlator name slashes to -> */
++
++        path_in_value = data_to_str (value);
++
++        if (strstr (path_in_value, "../")) {
++                gf_log (this->name, GF_LOG_ERROR,
++                        "%s: no \"../\" allowed in path", path_in_value);
++                return -1;
++        }
++        dirlen = strlen (IOS_STATS_DUMP_DIR);
++        namelen = (dirlen + value->len + strlen (this->name) + 3);
++        /* +3 for '/', '.' and '\0' added in snprintf below*/
++
+         filename = alloca0 (namelen);
+-        memcpy (filename, data_to_str (value), value->len);
+-        memcpy (filename + value->len, ".", 1);
+-        memcpy (filename + value->len + 1, this->name, strlen(this->name));
++
++        snprintf (filename, namelen, "%s/%s.%s", IOS_STATS_DUMP_DIR,
++                  path_in_value, this->name);
+ 
+         /* convert any slashes to '-' so that fopen works correctly */
+-        slash_ptr = strchr (filename + value->len + 1, '/');
++        slash_ptr = strchr (filename + dirlen + 1, '/');
+         while (slash_ptr) {
+                 *slash_ptr = '-';
+                 slash_ptr = strchr (slash_ptr, '/');
+-- 
+2.7.4
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 9a92c30..ce18fed 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -26,6 +26,7 @@ SRC_URI += "file://glusterd.init \
             file://0001-dict-handle-negative-key-value-length-while-unserial.patch \
             file://0002-posix-disable-open-read-write-on-special-files.patch \
             file://0003-server-protocol-don-t-allow-.-path-in-name.patch \
+            file://0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch \
            "
 
 LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
-- 
2.7.4


