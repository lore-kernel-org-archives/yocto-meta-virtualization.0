Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5CA3E0095C; Tue, 25 Sep 2018 19:49:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81FE3E006AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:49:40 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8Q2mxpI006543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:49:10 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 19:48:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Sep 2018 10:36:30 +0800
Message-ID: <1537929391-32035-6-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
References: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 6/7] glusterfs: fix Fix CVE-2018-10913 and CVE-2018-10914
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
X-List-Received-Date: Wed, 26 Sep 2018 02:49:41 -0000
Content-Type: text/plain

Backport a patch to fix the following two CVEs.

CVE: CVE-2018-10913
CVE: CVE-2018-10914

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...osix-remove-not-supported-get-set-content.patch | 297 +++++++++++++++++++++
 recipes-extended/glusterfs/glusterfs.inc           |   1 +
 2 files changed, 298 insertions(+)
 create mode 100644 recipes-extended/glusterfs/files/0006-posix-remove-not-supported-get-set-content.patch

diff --git a/recipes-extended/glusterfs/files/0006-posix-remove-not-supported-get-set-content.patch b/recipes-extended/glusterfs/files/0006-posix-remove-not-supported-get-set-content.patch
new file mode 100644
index 0000000..d35ec48
--- /dev/null
+++ b/recipes-extended/glusterfs/files/0006-posix-remove-not-supported-get-set-content.patch
@@ -0,0 +1,297 @@
+From 76ee41dcb37d3c864d9cb70f957034c246de43ab Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 25 Sep 2018 16:31:14 +0800
+Subject: [PATCH 6/7] posix: remove not supported get/set content
+
+getting and setting a file's content using extended
+attribute worked great as a GET/PUT alternative when
+an object storage is supported on top of Gluster. But
+it needs application changes, and also, it skips some
+caching layers. It is not used over years, and not
+supported any more. Remove the dead code.
+
+Fixes: bz#1625102
+
+Change-Id: Ide3b3f1f644f6ca58558bbe45561f346f96b95b7
+Signed-off-by: Amar Tumballi <amarts@redhat.com>
+
+Upstream-Status: Backport
+
+Fix CVE-2018-10913
+Fix CVE-2018-10914
+
+Modified to suite this old version.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ libglusterfs/src/glusterfs.h              |   6 --
+ xlators/storage/posix/src/posix-helpers.c | 166 +-----------------------------
+ xlators/storage/posix/src/posix.c         |  14 ---
+ xlators/storage/posix/src/posix.h         |   4 -
+ 4 files changed, 1 insertion(+), 189 deletions(-)
+
+diff --git a/libglusterfs/src/glusterfs.h b/libglusterfs/src/glusterfs.h
+index 9047373..77cafcb 100644
+--- a/libglusterfs/src/glusterfs.h
++++ b/libglusterfs/src/glusterfs.h
+@@ -152,9 +152,6 @@
+ #define GLUSTERFS_INTERNAL_FOP_KEY  "glusterfs-internal-fop"
+ #define DHT_CHANGELOG_RENAME_OP_KEY   "changelog.rename-op"
+ 
+-#define ZR_FILE_CONTENT_STR     "glusterfs.file."
+-#define ZR_FILE_CONTENT_STRLEN 15
+-
+ #define GLUSTERFS_WRITE_IS_APPEND "glusterfs.write-is-append"
+ #define GLUSTERFS_WRITE_UPDATE_ATOMIC "glusterfs.write-update-atomic"
+ #define GLUSTERFS_OPEN_FD_COUNT "glusterfs.open-fd-count"
+@@ -220,9 +217,6 @@
+ 
+ #define STARTING_EVENT_THREADS                 1
+ 
+-#define ZR_FILE_CONTENT_REQUEST(key) (!strncmp(key, ZR_FILE_CONTENT_STR, \
+-                                               ZR_FILE_CONTENT_STRLEN))
+-
+ #define DEFAULT_VAR_RUN_DIRECTORY        DATADIR "/run/gluster"
+ #define DEFAULT_GLUSTERFSD_MISC_DIRETORY DATADIR "/lib/misc/glusterfsd"
+ #ifdef GF_LINUX_HOST_OS
+diff --git a/xlators/storage/posix/src/posix-helpers.c b/xlators/storage/posix/src/posix-helpers.c
+index 69f61bf..f849845 100644
+--- a/xlators/storage/posix/src/posix-helpers.c
++++ b/xlators/storage/posix/src/posix-helpers.c
+@@ -890,166 +890,6 @@ out:
+         return ret;
+ }
+ 
+-
+-int
+-posix_set_file_contents (xlator_t *this, const char *path, char *keyp,
+-                         data_t *value, int flags)
+-{
+-        char *      key                        = NULL;
+-        char        real_path[PATH_MAX];
+-        int32_t     file_fd                    = -1;
+-        int         op_ret                     = 0;
+-        int         ret                        = -1;
+-
+-
+-        /* XXX: does not handle assigning GFID to created files */
+-        return -1;
+-
+-        key = &(keyp[15]);
+-        sprintf (real_path, "%s/%s", path, key);
+-
+-        if (flags & XATTR_REPLACE) {
+-                /* if file exists, replace it
+-                 * else, error out */
+-                file_fd = open (real_path, O_TRUNC|O_WRONLY);
+-
+-                if (file_fd == -1) {
+-                        goto create;
+-                }
+-
+-                if (value->len) {
+-                        ret = sys_write (file_fd, value->data, value->len);
+-                        if (ret == -1) {
+-                                op_ret = -errno;
+-                                gf_msg (this->name, GF_LOG_ERROR, errno,
+-                                        P_MSG_SET_FILE_CONTENTS, "write failed"
+-                                        "while doing setxattr for key %s on"
+-                                        "path%s", key, real_path);
+-                                goto out;
+-                        }
+-
+-                        ret = sys_close (file_fd);
+-                        if (ret == -1) {
+-                                op_ret = -errno;
+-                                gf_msg (this->name, GF_LOG_ERROR, errno,
+-                                        P_MSG_SET_FILE_CONTENTS,
+-                                        "close failed on %s",
+-                                        real_path);
+-                                goto out;
+-                        }
+-                }
+-
+-        create: /* we know file doesn't exist, create it */
+-
+-                file_fd = open (real_path, O_CREAT|O_WRONLY, 0644);
+-
+-                if (file_fd == -1) {
+-                        op_ret = -errno;
+-                        gf_msg (this->name, GF_LOG_ERROR, errno,
+-                                P_MSG_SET_FILE_CONTENTS, "failed to open file"
+-                                "%s with O_CREAT", key);
+-                        goto out;
+-                }
+-
+-                ret = sys_write (file_fd, value->data, value->len);
+-                if (ret == -1) {
+-                        op_ret = -errno;
+-                        gf_msg (this->name, GF_LOG_ERROR, errno,
+-                                P_MSG_SET_FILE_CONTENTS, "write failed on %s"
+-                                "while setxattr with key %s", real_path, key);
+-                        goto out;
+-                }
+-
+-                ret = sys_close (file_fd);
+-                if (ret == -1) {
+-                        op_ret = -errno;
+-                        gf_msg (this->name, GF_LOG_ERROR, errno,
+-                                P_MSG_SET_FILE_CONTENTS, "close failed on"
+-                                " %s while setxattr with key %s",
+-                                real_path, key);
+-                        goto out;
+-                }
+-        }
+-
+-out:
+-        return op_ret;
+-}
+-
+-
+-int
+-posix_get_file_contents (xlator_t *this, uuid_t pargfid,
+-                         const char *name, char **contents)
+-{
+-        char        *real_path                 = NULL;
+-        int32_t     file_fd                    = -1;
+-        struct iatt stbuf                      = {0,};
+-        int         op_ret                     = 0;
+-        int         ret                        = -1;
+-
+-
+-        MAKE_HANDLE_PATH (real_path, this, pargfid, name);
+-        if (!real_path) {
+-                op_ret = -ESTALE;
+-                gf_msg (this->name, GF_LOG_ERROR, ESTALE,
+-                        P_MSG_XDATA_GETXATTR,
+-                        "Failed to create handle path for %s/%s",
+-                        uuid_utoa (pargfid), name);
+-                goto out;
+-        }
+-
+-        op_ret = posix_istat (this, pargfid, name, &stbuf);
+-        if (op_ret == -1) {
+-                op_ret = -errno;
+-                gf_msg (this->name, GF_LOG_ERROR, errno, P_MSG_XDATA_GETXATTR,
+-                        "lstat failed on %s", real_path);
+-                goto out;
+-        }
+-
+-        file_fd = open (real_path, O_RDONLY);
+-
+-        if (file_fd == -1) {
+-                op_ret = -errno;
+-                gf_msg (this->name, GF_LOG_ERROR, errno, P_MSG_XDATA_GETXATTR,
+-                        "open failed on %s", real_path);
+-                goto out;
+-        }
+-
+-        *contents = GF_CALLOC (stbuf.ia_size + 1, sizeof(char),
+-                               gf_posix_mt_char);
+-        if (! *contents) {
+-                op_ret = -errno;
+-                goto out;
+-        }
+-
+-        ret = sys_read (file_fd, *contents, stbuf.ia_size);
+-        if (ret <= 0) {
+-                op_ret = -1;
+-                gf_msg (this->name, GF_LOG_ERROR, errno, P_MSG_XDATA_GETXATTR,
+-                        "read on %s failed", real_path);
+-                goto out;
+-        }
+-
+-        *contents[stbuf.ia_size] = '\0';
+-
+-        op_ret = sys_close (file_fd);
+-        file_fd = -1;
+-        if (op_ret == -1) {
+-                op_ret = -errno;
+-                gf_msg (this->name, GF_LOG_ERROR, errno, P_MSG_XDATA_GETXATTR,
+-                        "close on %s failed", real_path);
+-                goto out;
+-        }
+-
+-out:
+-        if (op_ret < 0) {
+-                GF_FREE (*contents);
+-                if (file_fd != -1)
+-                        sys_close (file_fd);
+-        }
+-
+-        return op_ret;
+-}
+-
+ #ifdef HAVE_SYS_ACL_H
+ int
+ posix_pacl_set (const char *path, const char *key, const char *acl_s)
+@@ -1154,9 +994,6 @@ posix_handle_pair (xlator_t *this, const char *real_path,
+         if (XATTR_IS_PATHINFO (key)) {
+                 ret = -EACCES;
+                 goto out;
+-        } else if (ZR_FILE_CONTENT_REQUEST(key)) {
+-                ret = posix_set_file_contents (this, real_path, key, value,
+-                                               flags);
+         } else if (GF_POSIX_ACL_REQUEST (key)) {
+                 if (stbuf && IS_DHT_LINKFILE_MODE (stbuf))
+                         goto out;
+@@ -1609,8 +1446,7 @@ _handle_entry_create_keyvalue_pair (dict_t *d, char *k, data_t *v,
+             !strcmp ("gfid-req", k) ||
+             !strcmp (POSIX_ACL_DEFAULT_XATTR, k) ||
+             !strcmp (POSIX_ACL_ACCESS_XATTR, k) ||
+-            posix_xattr_ignorable (k) ||
+-            ZR_FILE_CONTENT_REQUEST(k)) {
++            posix_xattr_ignorable (k)) {
+                 return 0;
+         }
+ 
+diff --git a/xlators/storage/posix/src/posix.c b/xlators/storage/posix/src/posix.c
+index 506ae91..a69e8f6 100644
+--- a/xlators/storage/posix/src/posix.c
++++ b/xlators/storage/posix/src/posix.c
+@@ -4427,7 +4427,6 @@ posix_getxattr (call_frame_t *frame, xlator_t *this,
+         char                 *value                 = NULL;
+         char                 *real_path             = NULL;
+         dict_t               *dict                  = NULL;
+-        char                 *file_contents         = NULL;
+         int                   ret                   = -1;
+         char                 *path                  = NULL;
+         char                 *rpath                 = NULL;
+@@ -4458,19 +4457,6 @@ posix_getxattr (call_frame_t *frame, xlator_t *this,
+                 goto out;
+         }
+ 
+-        if (loc->inode && IA_ISDIR(loc->inode->ia_type) && name &&
+-            ZR_FILE_CONTENT_REQUEST(name)) {
+-                ret = posix_get_file_contents (this, loc->gfid, &name[15],
+-                                               &file_contents);
+-                if (ret < 0) {
+-                        op_errno = -ret;
+-                        gf_msg (this->name, GF_LOG_ERROR, op_errno,
+-                                P_MSG_FILE_FAILED, "getting file contents"
+-                                "failed");
+-                        goto out;
+-                }
+-        }
+-
+         dict = dict_new ();
+         if (!dict) {
+                 op_errno = ENOMEM;
+diff --git a/xlators/storage/posix/src/posix.h b/xlators/storage/posix/src/posix.h
+index febd432..3d2566b 100644
+--- a/xlators/storage/posix/src/posix.h
++++ b/xlators/storage/posix/src/posix.h
+@@ -250,10 +250,6 @@ int posix_handle_pair (xlator_t *this, const char *real_path, char *key,
+ int posix_fhandle_pair (xlator_t *this, int fd, char *key, data_t *value,
+                         int flags, struct iatt *stbuf);
+ void posix_spawn_janitor_thread (xlator_t *this);
+-int posix_get_file_contents (xlator_t *this, uuid_t pargfid,
+-                             const char *name, char **contents);
+-int posix_set_file_contents (xlator_t *this, const char *path, char *key,
+-                             data_t *value, int flags);
+ int posix_acl_xattr_set (xlator_t *this, const char *path, dict_t *xattr_req);
+ int posix_gfid_heal (xlator_t *this, const char *path, loc_t *loc, dict_t *xattr_req);
+ int posix_entry_create_xattr_set (xlator_t *this, const char *path,
+-- 
+2.7.4
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 0ce2acd..525b905 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -28,6 +28,7 @@ SRC_URI += "file://glusterd.init \
             file://0003-server-protocol-don-t-allow-.-path-in-name.patch \
             file://0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch \
             file://0005-cluster-afr-Fix-dict-leak-in-pre-op.patch \
+            file://0006-posix-remove-not-supported-get-set-content.patch \
            "
 
 LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
-- 
2.7.4


