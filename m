Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49725E00D14; Thu, 14 Mar 2019 03:17:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,LOTS_OF_MONEY,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 LOTS_OF_MONEY Huge... sums of money
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8D0AE00CAB
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Mar 2019 03:16:57 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2EAG54n001417
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Mar 2019 03:16:31 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 14 Mar 2019 03:16:10 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 14 Mar 2019 06:15:53 -0400
Message-ID: <1552558553-60770-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH] glusterfs: uprev from v3.11.1 to v5.4
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
X-List-Received-Date: Thu, 14 Mar 2019 10:17:04 -0000
Content-Type: text/plain

The latest stable release  covers some CVEs and new features.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...-negative-key-value-length-while-unserial.patch |  39 --
 ...age-Prevent-mounting-shared-storage-from-.patch |  70 ----
 ...-disable-open-read-write-on-special-files.patch |  93 -----
 ...auth-add-option-for-strict-authentication.patch | 280 ---------------
 ...ccess-trusted-peer-group-via-remote-host-.patch |  43 ---
 ...erver-protocol-don-t-allow-.-path-in-name.patch |  73 ----
 ...ats-dump-io-stats-info-in-var-run-gluster.patch | 153 --------
 ...osix-remove-not-supported-get-set-content.patch | 297 ---------------
 .../files/0007-protocol-don-t-use-alloca.patch     | 400 ---------------------
 ...c-allow-PYTHON-values-to-be-passed-via-en.patch |  81 ++---
 .../dependence-on-correct-header-file-path.patch   |  18 +-
 .../files/glusterd-change-port-range.patch         |  19 +-
 ...fs-api-remove-unnecessary-library-options.patch |  17 +-
 .../glusterfs-change-default-nfs-port-number.patch |  18 +-
 .../libglusterfs-Don-t-link-against-libfl.patch    |  29 +-
 ...python-work-around-host-and-target-python.patch |  56 +--
 .../files/xlator-host-contamination-3.4.patch      |  61 ----
 .../files/xlator-host-contamination-5.4.patch      |  65 ++++
 recipes-extended/glusterfs/glusterfs.inc           |  24 +-
 recipes-extended/glusterfs/glusterfs_3.11.1.bb     |   6 -
 recipes-extended/glusterfs/glusterfs_5.4.bb        |   6 +
 21 files changed, 195 insertions(+), 1653 deletions(-)
 delete mode 100644 recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch
 delete mode 100644 recipes-extended/glusterfs/files/0001-shared-storage-Prevent-mounting-shared-storage-from-.patch
 delete mode 100644 recipes-extended/glusterfs/files/0002-posix-disable-open-read-write-on-special-files.patch
 delete mode 100644 recipes-extended/glusterfs/files/0002-server-auth-add-option-for-strict-authentication.patch
 delete mode 100644 recipes-extended/glusterfs/files/0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch
 delete mode 100644 recipes-extended/glusterfs/files/0003-server-protocol-don-t-allow-.-path-in-name.patch
 delete mode 100644 recipes-extended/glusterfs/files/0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch
 delete mode 100644 recipes-extended/glusterfs/files/0006-posix-remove-not-supported-get-set-content.patch
 delete mode 100644 recipes-extended/glusterfs/files/0007-protocol-don-t-use-alloca.patch
 delete mode 100644 recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
 create mode 100644 recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch
 delete mode 100644 recipes-extended/glusterfs/glusterfs_3.11.1.bb
 create mode 100644 recipes-extended/glusterfs/glusterfs_5.4.bb

diff --git a/recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch b/recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch
deleted file mode 100644
index cb3400b..0000000
--- a/recipes-extended/glusterfs/files/0001-dict-handle-negative-key-value-length-while-unserial.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 428ee988df7d6cbe6e18becffcee5cdfb0fa9d17 Mon Sep 17 00:00:00 2001
-From: Amar Tumballi <amarts@redhat.com>
-Date: Tue, 24 Jul 2018 13:25:12 +0530
-Subject: [PATCH 1/7] dict: handle negative key/value length while unserialize
-
-Fixes: bz#1625089
-Change-Id: Ie56df0da46c242846a1ba51ccb9e011af118b119
-Signed-off-by: Amar Tumballi <amarts@redhat.com>
-
-Upstream-Status: Backport
-
-Fix CVE-2018-10911
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libglusterfs/src/dict.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/libglusterfs/src/dict.c b/libglusterfs/src/dict.c
-index 839b426..ac0a677 100644
---- a/libglusterfs/src/dict.c
-+++ b/libglusterfs/src/dict.c
-@@ -2751,6 +2751,13 @@ dict_unserialize (char *orig_buf, int32_t size, dict_t **fill)
-                 vallen = ntoh32 (hostord);
-                 buf += DICT_DATA_HDR_VAL_LEN;
- 
-+                if ((keylen < 0) || (vallen < 0)) {
-+                        gf_msg_callingfn ("dict", GF_LOG_ERROR, 0,
-+                                          LG_MSG_UNDERSIZED_BUF,
-+                                          "undersized length passed "
-+                                          "key:%d val:%d", keylen, vallen);
-+                        goto out;
-+                }
-                 if ((buf + keylen) > (orig_buf + size)) {
-                         gf_msg_callingfn ("dict", GF_LOG_ERROR, 0,
-                                           LG_MSG_UNDERSIZED_BUF,
--- 
-2.7.4
-
diff --git a/recipes-extended/glusterfs/files/0001-shared-storage-Prevent-mounting-shared-storage-from-.patch b/recipes-extended/glusterfs/files/0001-shared-storage-Prevent-mounting-shared-storage-from-.patch
deleted file mode 100644
index 0e24c56..0000000
--- a/recipes-extended/glusterfs/files/0001-shared-storage-Prevent-mounting-shared-storage-from-.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From d1936056d77abcfda14386235a88ed553341a429 Mon Sep 17 00:00:00 2001
-From: Mohammed Rafi KC <rkavunga@redhat.com>
-Date: Mon, 26 Mar 2018 20:27:34 +0530
-Subject: [PATCH 1/3] shared storage: Prevent mounting shared storage from
- non-trusted client
-
-gluster shared storage is a volume used for internal storage for
-various features including ganesha, geo-rep, snapshot.
-
-So this volume should not be exposed to the client, as it is
-a special volume for internal use.
-
-This fix wont't generate non trusted volfile for shared storage volume.
-
-Change-Id: I8ffe30ae99ec05196d75466210b84db311611a4c
-fixes: bz#1568844
-BUG: 1568844
-Signed-off-by: Mohammed Rafi KC <rkavunga@redhat.com>
-
-Upstream-Status: Backport
-Fix CVE-2018-1088
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- xlators/mgmt/glusterd/src/glusterd-volgen.c | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/xlators/mgmt/glusterd/src/glusterd-volgen.c b/xlators/mgmt/glusterd/src/glusterd-volgen.c
-index 0a0668e..308c41f 100644
---- a/xlators/mgmt/glusterd/src/glusterd-volgen.c
-+++ b/xlators/mgmt/glusterd/src/glusterd-volgen.c
-@@ -5721,6 +5721,7 @@ generate_client_volfiles (glusterd_volinfo_t *volinfo,
-         int                i                  = 0;
-         int                ret                = -1;
-         char               filepath[PATH_MAX] = {0,};
-+        char               *volname           = NULL;
-         char               *types[]           = {NULL, NULL, NULL};
-         dict_t             *dict              = NULL;
-         xlator_t           *this              = NULL;
-@@ -5728,6 +5729,26 @@ generate_client_volfiles (glusterd_volinfo_t *volinfo,
- 
-         this = THIS;
- 
-+        volname = volinfo->is_snap_volume ?
-+                  volinfo->parent_volname : volinfo->volname;
-+
-+
-+        if (volname && !strcmp (volname, GLUSTER_SHARED_STORAGE) &&
-+             client_type != GF_CLIENT_TRUSTED) {
-+                /*
-+                 * shared storage volume cannot be mounted from non trusted
-+                 * nodes. So we are not creating volfiles for non-trusted
-+                 * clients for shared volumes as well as snapshot of shared
-+                 * volumes.
-+                 */
-+
-+                ret = 0;
-+                gf_msg_debug ("glusterd", 0, "Skipping the non-trusted volfile"
-+                               "creation for shared storage volume. Volume %s",
-+                               volname);
-+                goto out;
-+        }
-+
-         enumerate_transport_reqs (volinfo->transport_type, types);
-         dict = dict_new ();
-         if (!dict)
--- 
-2.7.4
-
diff --git a/recipes-extended/glusterfs/files/0002-posix-disable-open-read-write-on-special-files.patch b/recipes-extended/glusterfs/files/0002-posix-disable-open-read-write-on-special-files.patch
deleted file mode 100644
index 06cd06c..0000000
--- a/recipes-extended/glusterfs/files/0002-posix-disable-open-read-write-on-special-files.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 08dc006aac79ee1d1f6a5b7044fc973df7f00ed6 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 25 Sep 2018 14:02:01 +0800
-Subject: [PATCH 2/7] posix: disable open/read/write on special files
-
-In the file system, the responsibility w.r.to the block and char device
-files is related to only support for 'creating' them (using mknod(2)).
-
-Once the device files are created, the read/write syscalls for the specific
-devices are handled by the device driver registered for the specific major
-number, and depending on the minor number, it knows where to read from.
-Hence, we are at risk of reading contents from devices which are handled
-by the host kernel on server nodes.
-
-By disabling open/read/write on the device file, we would be safe with
-the bypass one can achieve from client side (using gfapi)
-
-Fixes: bz#1625096
-
-Change-Id: I48c776b0af1cbd2a5240862826d3d8918601e47f
-Signed-off-by: Amar Tumballi <amarts@redhat.com>
-
-Upstream-Status: Backport
-
-Fix CVE-2018-10923
-Modified to suite the old version of glusterfs.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- xlators/storage/posix/src/posix.c | 33 +++++++++++++++++++++++++++++++++
- 1 file changed, 33 insertions(+)
-
-diff --git a/xlators/storage/posix/src/posix.c b/xlators/storage/posix/src/posix.c
-index b1a529b..506ae91 100644
---- a/xlators/storage/posix/src/posix.c
-+++ b/xlators/storage/posix/src/posix.c
-@@ -3091,6 +3091,17 @@ posix_open (call_frame_t *frame, xlator_t *this,
-         priv = this->private;
-         VALIDATE_OR_GOTO (priv, out);
- 
-+        if (loc->inode &&
-+            ((loc->inode->ia_type == IA_IFBLK) ||
-+             (loc->inode->ia_type == IA_IFCHR))) {
-+                gf_msg (this->name, GF_LOG_ERROR, EINVAL,
-+                        P_MSG_INVALID_ARGUMENT,
-+                        "open received on a block/char file (%s)",
-+                        uuid_utoa (loc->inode->gfid));
-+                op_errno = EINVAL;
-+                goto out;
-+        }
-+
-         MAKE_INODE_HANDLE (real_path, this, loc, &stbuf);
-         if (!real_path) {
-                 op_ret = -1;
-@@ -3180,6 +3191,17 @@ posix_readv (call_frame_t *frame, xlator_t *this,
-         priv = this->private;
-         VALIDATE_OR_GOTO (priv, out);
- 
-+        if (fd->inode &&
-+            ((fd->inode->ia_type == IA_IFBLK) ||
-+             (fd->inode->ia_type == IA_IFCHR))) {
-+                gf_msg (this->name, GF_LOG_ERROR, EINVAL,
-+                        P_MSG_INVALID_ARGUMENT,
-+                        "readv received on a block/char file (%s)",
-+                        uuid_utoa (fd->inode->gfid));
-+                op_errno = EINVAL;
-+                goto out;
-+        }
-+
-         ret = posix_fd_ctx_get (fd, this, &pfd, &op_errno);
-         if (ret < 0) {
-                 gf_msg (this->name, GF_LOG_WARNING, op_errno, P_MSG_PFD_NULL,
-@@ -3415,6 +3437,17 @@ posix_writev (call_frame_t *frame, xlator_t *this, fd_t *fd,
- 
-         VALIDATE_OR_GOTO (priv, out);
- 
-+        if (fd->inode &&
-+            ((fd->inode->ia_type == IA_IFBLK) ||
-+             (fd->inode->ia_type == IA_IFCHR))) {
-+                gf_msg (this->name, GF_LOG_ERROR, EINVAL,
-+                        P_MSG_INVALID_ARGUMENT,
-+                        "writev received on a block/char file (%s)",
-+                        uuid_utoa (fd->inode->gfid));
-+                op_errno = EINVAL;
-+                goto out;
-+        }
-+
-         ret = posix_fd_ctx_get (fd, this, &pfd, &op_errno);
-         if (ret < 0) {
-                 gf_msg (this->name, GF_LOG_WARNING, ret, P_MSG_PFD_NULL,
--- 
-2.7.4
-
diff --git a/recipes-extended/glusterfs/files/0002-server-auth-add-option-for-strict-authentication.patch b/recipes-extended/glusterfs/files/0002-server-auth-add-option-for-strict-authentication.patch
deleted file mode 100644
index 8947f27..0000000
--- a/recipes-extended/glusterfs/files/0002-server-auth-add-option-for-strict-authentication.patch
+++ /dev/null
@@ -1,280 +0,0 @@
-From a74ab3ab169add1e86aae0a99855211b948be021 Mon Sep 17 00:00:00 2001
-From: Mohammed Rafi KC <rkavunga@redhat.com>
-Date: Mon, 2 Apr 2018 12:20:47 +0530
-Subject: [PATCH 2/3] server/auth: add option for strict authentication
-
-When this option is enabled, we will check for a matching
-username and password, if not found then the connection will
-be rejected. This also does a checksum validation of volfile
-
-The option is invalid when SSL/TLS is in use, at which point
-the SSL/TLS certificate user name is used to validate and
-hence authorize the right user. This expects TLS allow rules
-to be setup correctly rather than the default *.
-
-This option is not settable, as a result this cannot be enabled
-for volumes using the CLI. This is used with the shared storage
-volume, to restrict access to the same in non-SSL/TLS environments
-to the gluster peers only.
-
-Tested:
-  ./tests/bugs/protocol/bug-1321578.t
-  ./tests/features/ssl-authz.t
-  - Ran tests on volumes with and without strict auth
-    checking (as brick vol file needed to be edited to test,
-    or rather to enable the option)
-  - Ran tests on volumes to ensure existing mounts are
-    disconnected when we enable strict checking
-
-Change-Id: I2ac4f0cfa5b59cc789cc5a265358389b04556b59
-fixes: bz#1568844
-Signed-off-by: Mohammed Rafi KC <rkavunga@redhat.com>
-Signed-off-by: ShyamsundarR <srangana@redhat.com>
-
-Upstream-Status: Backport
-Fix CVE-2018-1088
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- xlators/mgmt/glusterd/src/glusterd-volgen.c    | 16 +++++++-
- xlators/protocol/auth/login/src/login.c        | 51 ++++++++++++++++++++++----
- xlators/protocol/server/src/authenticate.h     |  4 +-
- xlators/protocol/server/src/server-handshake.c |  2 +-
- xlators/protocol/server/src/server.c           | 18 +++++++++
- xlators/protocol/server/src/server.h           |  2 +
- 6 files changed, 81 insertions(+), 12 deletions(-)
-
-diff --git a/xlators/mgmt/glusterd/src/glusterd-volgen.c b/xlators/mgmt/glusterd/src/glusterd-volgen.c
-index 308c41f..8dd4907 100644
---- a/xlators/mgmt/glusterd/src/glusterd-volgen.c
-+++ b/xlators/mgmt/glusterd/src/glusterd-volgen.c
-@@ -2250,6 +2250,7 @@ brick_graph_add_server (volgen_graph_t *graph, glusterd_volinfo_t *volinfo,
-         char            *password = NULL;
-         char            key[1024] = {0};
-         char            *ssl_user = NULL;
-+        char            *volname = NULL;
-         char            *address_family_data = NULL;
- 
-         if (!graph || !volinfo || !set_dict || !brickinfo)
-@@ -2325,6 +2326,19 @@ brick_graph_add_server (volgen_graph_t *graph, glusterd_volinfo_t *volinfo,
-         if (ret)
-                 return -1;
- 
-+        volname = volinfo->is_snap_volume ?
-+                  volinfo->parent_volname : volinfo->volname;
-+
-+
-+        if (volname && !strcmp (volname, GLUSTER_SHARED_STORAGE)) {
-+                memset (key, 0, sizeof (key));
-+                snprintf (key, sizeof (key), "strict-auth-accept");
-+
-+                ret = xlator_set_option (xl, key, "true");
-+                if (ret)
-+                        return -1;
-+        }
-+
-         if (dict_get_str (volinfo->dict, "auth.ssl-allow", &ssl_user) == 0) {
-                 memset (key, 0, sizeof (key));
-                 snprintf (key, sizeof (key), "auth.login.%s.ssl-allow",
-@@ -5734,7 +5748,7 @@ generate_client_volfiles (glusterd_volinfo_t *volinfo,
- 
- 
-         if (volname && !strcmp (volname, GLUSTER_SHARED_STORAGE) &&
--             client_type != GF_CLIENT_TRUSTED) {
-+            client_type != GF_CLIENT_TRUSTED) {
-                 /*
-                  * shared storage volume cannot be mounted from non trusted
-                  * nodes. So we are not creating volfiles for non-trusted
-diff --git a/xlators/protocol/auth/login/src/login.c b/xlators/protocol/auth/login/src/login.c
-index e799dd2..da10d0b 100644
---- a/xlators/protocol/auth/login/src/login.c
-+++ b/xlators/protocol/auth/login/src/login.c
-@@ -11,6 +11,16 @@
- #include <fnmatch.h>
- #include "authenticate.h"
- 
-+/* Note on strict_auth
-+ * - Strict auth kicks in when authentication is using the username, password
-+ *   in the volfile to login
-+ * - If enabled, auth is rejected if the username and password is not matched
-+ *   or is not present
-+ * - When using SSL names, this is automatically strict, and allows only those
-+ *   names that are present in the allow list, IOW strict auth checking has no
-+ *   implication when using SSL names
-+*/
-+
- auth_result_t gf_auth (dict_t *input_params, dict_t *config_params)
- {
-         auth_result_t  result  = AUTH_DONT_CARE;
-@@ -27,6 +37,7 @@ auth_result_t gf_auth (dict_t *input_params, dict_t *config_params)
-         char            *tmp            = NULL;
-         char            *username_cpy   = NULL;
-         gf_boolean_t    using_ssl       = _gf_false;
-+        gf_boolean_t    strict_auth     = _gf_false;
- 
-         username_data = dict_get (input_params, "ssl-name");
-         if (username_data) {
-@@ -35,16 +46,39 @@ auth_result_t gf_auth (dict_t *input_params, dict_t *config_params)
-                 using_ssl = _gf_true;
-         }
-         else {
-+                ret = dict_get_str_boolean (config_params, "strict-auth-accept",
-+                                            _gf_false);
-+                if (ret == -1)
-+                        strict_auth = _gf_false;
-+                else
-+                        strict_auth = ret;
-+
-                 username_data = dict_get (input_params, "username");
-                 if (!username_data) {
--                        gf_log ("auth/login", GF_LOG_DEBUG,
--                                "username not found, returning DONT-CARE");
-+                        if (strict_auth) {
-+                                gf_log ("auth/login", GF_LOG_DEBUG,
-+                                        "username not found, strict auth"
-+                                        " configured returning REJECT");
-+                                result = AUTH_REJECT;
-+                        } else {
-+                                gf_log ("auth/login", GF_LOG_DEBUG,
-+                                        "username not found, returning"
-+                                        " DONT-CARE");
-+                        }
-                         goto out;
-                 }
-                 password_data = dict_get (input_params, "password");
-                 if (!password_data) {
--                        gf_log ("auth/login", GF_LOG_WARNING,
--                                "password not found, returning DONT-CARE");
-+                        if (strict_auth) {
-+                                gf_log ("auth/login", GF_LOG_DEBUG,
-+                                        "password not found, strict auth"
-+                                        " configured returning REJECT");
-+                                result = AUTH_REJECT;
-+                        } else {
-+                                gf_log ("auth/login", GF_LOG_WARNING,
-+                                        "password not found, returning"
-+                                        " DONT-CARE");
-+                        }
-                         goto out;
-                 }
-                 password = data_to_str (password_data);
-@@ -62,9 +96,10 @@ auth_result_t gf_auth (dict_t *input_params, dict_t *config_params)
-         ret = gf_asprintf (&searchstr, "auth.login.%s.%s", brick_name,
-                            using_ssl ? "ssl-allow" : "allow");
-         if (-1 == ret) {
--                gf_log ("auth/login", GF_LOG_WARNING,
-+                gf_log ("auth/login", GF_LOG_ERROR,
-                         "asprintf failed while setting search string, "
--                        "returning DONT-CARE");
-+                        "returning REJECT");
-+                result = AUTH_REJECT;
-                 goto out;
-         }
- 
-@@ -92,8 +127,10 @@ auth_result_t gf_auth (dict_t *input_params, dict_t *config_params)
-                  * ssl-allow=* case as well) authorization is effectively
-                  * disabled, though authentication and encryption are still
-                  * active.
-+                 *
-+                 * Read NOTE on strict_auth above.
-                  */
--                if (using_ssl) {
-+                if (using_ssl || strict_auth) {
-                         result = AUTH_REJECT;
-                 }
-                 username_cpy = gf_strdup (allow_user->data);
-diff --git a/xlators/protocol/server/src/authenticate.h b/xlators/protocol/server/src/authenticate.h
-index 3f80231..5f92183 100644
---- a/xlators/protocol/server/src/authenticate.h
-+++ b/xlators/protocol/server/src/authenticate.h
-@@ -37,10 +37,8 @@ typedef struct {
-         volume_opt_list_t *vol_opt;
- } auth_handle_t;
- 
--auth_result_t gf_authenticate (dict_t *input_params,
--                               dict_t *config_params,
--                               dict_t *auth_modules);
- int32_t gf_auth_init (xlator_t *xl, dict_t *auth_modules);
- void gf_auth_fini (dict_t *auth_modules);
-+auth_result_t gf_authenticate (dict_t *, dict_t *, dict_t *);
- 
- #endif /* _AUTHENTICATE_H */
-diff --git a/xlators/protocol/server/src/server-handshake.c b/xlators/protocol/server/src/server-handshake.c
-index f00804a..392a101 100644
---- a/xlators/protocol/server/src/server-handshake.c
-+++ b/xlators/protocol/server/src/server-handshake.c
-@@ -631,7 +631,7 @@ server_setvolume (rpcsvc_request_t *req)
-                         ret = dict_get_str (params, "volfile-key",
-                                             &volfile_key);
-                         if (ret)
--                                gf_msg_debug (this->name, 0, "failed to set "
-+                                gf_msg_debug (this->name, 0, "failed to get "
-                                               "'volfile-key'");
- 
-                         ret = _validate_volfile_checksum (this, volfile_key,
-diff --git a/xlators/protocol/server/src/server.c b/xlators/protocol/server/src/server.c
-index 202fe71..61c6194 100644
---- a/xlators/protocol/server/src/server.c
-+++ b/xlators/protocol/server/src/server.c
-@@ -883,6 +883,10 @@ do_rpc:
-                 goto out;
-         }
- 
-+        GF_OPTION_RECONF ("strict-auth-accept", conf->strict_auth_enabled,
-+                          options, bool, out);
-+
-+
-         GF_OPTION_RECONF ("dynamic-auth", conf->dync_auth, options,
-                         bool, out);
- 
-@@ -1113,6 +1117,14 @@ init (xlator_t *this)
-                         "Failed to initialize group cache.");
-                 goto out;
-         }
-+
-+        ret = dict_get_str_boolean (this->options, "strict-auth-accept",
-+                                    _gf_false);
-+        if (ret == -1)
-+                conf->strict_auth_enabled = _gf_false;
-+        else
-+                conf->strict_auth_enabled = ret;
-+
-         ret = dict_get_str_boolean (this->options, "dynamic-auth",
-                         _gf_true);
-         if (ret == -1)
-@@ -1667,5 +1679,11 @@ struct volume_options options[] = {
-                            "transport connection immediately in response to "
-                            "*.allow | *.reject volume set options."
-         },
-+        { .key   = {"strict-auth-accept"},
-+          .type  = GF_OPTION_TYPE_BOOL,
-+          .default_value = "off",
-+          .description   = "strict-auth-accept reject connection with out"
-+                           "a valid username and password."
-+        },
-         { .key   = {NULL} },
- };
-diff --git a/xlators/protocol/server/src/server.h b/xlators/protocol/server/src/server.h
-index 0b37eb1..7eea291 100644
---- a/xlators/protocol/server/src/server.h
-+++ b/xlators/protocol/server/src/server.h
-@@ -24,6 +24,7 @@
- #include "client_t.h"
- #include "gidcache.h"
- #include "defaults.h"
-+#include "authenticate.h"
- 
- #define DEFAULT_BLOCK_SIZE         4194304   /* 4MB */
- #define DEFAULT_VOLUME_FILE_PATH   CONFDIR "/glusterfs.vol"
-@@ -105,6 +106,7 @@ struct server_conf {
-                                            * false, when child is down */
- 
-         gf_lock_t               itable_lock;
-+        gf_boolean_t            strict_auth_enabled;
- };
- typedef struct server_conf server_conf_t;
- 
--- 
-2.7.4
-
diff --git a/recipes-extended/glusterfs/files/0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch b/recipes-extended/glusterfs/files/0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch
deleted file mode 100644
index dcbb435..0000000
--- a/recipes-extended/glusterfs/files/0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e79741414777c25e5c2a08e6c31619a0fbaad058 Mon Sep 17 00:00:00 2001
-From: Mohit Agrawal <moagrawa@redhat.com>
-Date: Wed, 20 Jun 2018 16:13:00 +0530
-Subject: [PATCH 3/3] glusterfs: access trusted peer group via remote-host
- command
-
-Problem: In SSL environment the user is able to access volume
-         via remote-host command without adding node in a trusted pool
-
-Solution: Change the list of rpc program in glusterd.c at the
-          time of initialization while SSL is enabled
-
-BUG: 1593232
-Change-Id: I987e433b639e68ad17b77b6452df1e22dbe0f199
-fixes: bz#1593232
-Signed-off-by: Mohit Agrawal <moagrawa@redhat.com>
-
-Upstream-Status: Backport
-Fix CVE-2018-10841
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- xlators/mgmt/glusterd/src/glusterd.c | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/xlators/mgmt/glusterd/src/glusterd.c b/xlators/mgmt/glusterd/src/glusterd.c
-index ef20689..5e0ed8d 100644
---- a/xlators/mgmt/glusterd/src/glusterd.c
-+++ b/xlators/mgmt/glusterd/src/glusterd.c
-@@ -1646,11 +1646,6 @@ init (xlator_t *this)
-                         goto out;
-                 }
-                 /*
--                 * With strong authentication, we can afford to allow
--                 * privileged operations over TCP.
--                 */
--                gd_inet_programs[1] = &gd_svc_cli_prog;
--                /*
-                  * This is the only place where we want secure_srvr to reflect
-                  * the management-plane setting.
-                  */
--- 
-2.7.4
-
diff --git a/recipes-extended/glusterfs/files/0003-server-protocol-don-t-allow-.-path-in-name.patch b/recipes-extended/glusterfs/files/0003-server-protocol-don-t-allow-.-path-in-name.patch
deleted file mode 100644
index e6ef9e3..0000000
--- a/recipes-extended/glusterfs/files/0003-server-protocol-don-t-allow-.-path-in-name.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From b89658672d137ef56bd0694457b9125bf7d45ba4 Mon Sep 17 00:00:00 2001
-From: Amar Tumballi <amarts@redhat.com>
-Date: Thu, 9 Aug 2018 13:00:01 +0530
-Subject: [PATCH 3/7] server-protocol: don't allow '../' path in 'name'
-
-This will prevent any arbitrary file creation through glusterfs
-by modifying the client bits.
-
-Also check for the similar flaw inside posix too, so we prevent any
-changes in layers in-between.
-
-Fixes: bz#1625095
-
-Signed-off-by: Amar Tumballi <amarts@redhat.com>
-Change-Id: Id9fe0ef6e86459e8ed85ab947d977f058c5ae06e
-
-Upstream-Status: Backport
-
-Fix CVE-2018-10926
-Fix CVE-2018-10927
-Fix CVE-2018-10928
-Fix CVE-2018-10929
-Fix CVE-2018-10930
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- xlators/protocol/server/src/server-resolve.c | 12 ++++++++++++
- xlators/storage/posix/src/posix-handle.h     |  6 ++++++
- 2 files changed, 18 insertions(+)
-
-diff --git a/xlators/protocol/server/src/server-resolve.c b/xlators/protocol/server/src/server-resolve.c
-index d0126aa..aa35685 100644
---- a/xlators/protocol/server/src/server-resolve.c
-+++ b/xlators/protocol/server/src/server-resolve.c
-@@ -294,6 +294,18 @@ resolve_entry_simple (call_frame_t *frame)
-         /* expected @parent was found from the inode cache */
-         gf_uuid_copy (state->loc_now->pargfid, resolve->pargfid);
-         state->loc_now->parent = inode_ref (parent);
-+
-+        if (strstr (resolve->bname, "../")) {
-+                /* Resolving outside the parent's tree is not allowed */
-+                gf_msg (this->name, GF_LOG_ERROR, EPERM,
-+                        PS_MSG_GFID_RESOLVE_FAILED,
-+                        "%s: path sent by client not allowed",
-+                        resolve->bname);
-+                resolve->op_ret   = -1;
-+                resolve->op_errno = EPERM;
-+                ret = 1;
-+                goto out;
-+        }
-         state->loc_now->name = resolve->bname;
- 
-         inode = inode_grep (state->itable, parent, resolve->bname);
-diff --git a/xlators/storage/posix/src/posix-handle.h b/xlators/storage/posix/src/posix-handle.h
-index 9af6a7a..6e7a8d2 100644
---- a/xlators/storage/posix/src/posix-handle.h
-+++ b/xlators/storage/posix/src/posix-handle.h
-@@ -217,6 +217,12 @@
-                 break;                                                  \
-         }                                                               \
-                                                                         \
-+        if (strstr (loc->name, "../")) {                                \
-+                gf_msg (this->name, GF_LOG_ERROR, 0, P_MSG_ENTRY_HANDLE_CREATE, \
-+                        "'../' in name not allowed: (%s)", loc->name); \
-+                op_ret = -1;                                            \
-+                break;                                                  \
-+        }                                                               \
-         if (LOC_HAS_ABSPATH (loc)) {                                    \
-                 MAKE_REAL_PATH (entp, this, loc->path);                 \
-                 __parp = strdupa (entp);                                \
--- 
-2.7.4
-
diff --git a/recipes-extended/glusterfs/files/0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch b/recipes-extended/glusterfs/files/0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch
deleted file mode 100644
index 6fb261d..0000000
--- a/recipes-extended/glusterfs/files/0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 0f9c26d5e3a0d0480ff31a800ca8f31966da10ff Mon Sep 17 00:00:00 2001
-From: Amar Tumballi <amarts@redhat.com>
-Date: Tue, 24 Jul 2018 15:42:28 +0530
-Subject: [PATCH 4/7] io-stats: dump io-stats info in /var/run/gluster
-
-It wouldn't make sense to allow iostats file to be written in
-*any* directory. While the formating makes sure we try to append
-io-stats-name for the file, so overwriting existing file is slim,
-but in any case it makes sense to restrict dumping to one directory.
-
-Below are the sample commands, and files created for the corresponding
-values:
-
- $ setfattr -n trusted.io-stats-dump -v file-for-dump $M0
-
-In this case, the file would be in /var/run/gluster/file-for-dump
-
- $ setfattr -n trusted.io-stats-dump -v /dir1/dir2/file-for-dump $M0
-
-In this case, then the dump file is in /var/run/gluster/dir1-dir2-file-for-dump
-
-Note that the value passed for this virtual xattr would be treated as a
-file, and even if the value has '/' in it, it would be changed to '-'
-for sanity.
-
-Fixes: bz#1625106
-
-Change-Id: Id9ae6a40a190b8937c51662e6e1c2a0f6c86a0e0
-Signed-off-by: Amar Tumballi <amarts@redhat.com>
-
-Upstream-Status: Backport
-
-Fix CVE-2018-10904
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- tests/bugs/core/io-stats-1322825.t    | 12 ++++++------
- xlators/debug/io-stats/src/io-stats.c | 34 +++++++++++++++++++++++++---------
- 2 files changed, 31 insertions(+), 15 deletions(-)
-
-diff --git a/tests/bugs/core/io-stats-1322825.t b/tests/bugs/core/io-stats-1322825.t
-index d232ecb..53f2d04 100755
---- a/tests/bugs/core/io-stats-1322825.t
-+++ b/tests/bugs/core/io-stats-1322825.t
-@@ -23,7 +23,7 @@ TEST $CLI volume profile $V0 start
- TEST mkdir $M0/dir1
- 
- # Generate the stat dump across the io-stat instances
--TEST setfattr -n trusted.io-stats-dump -v /tmp/io-stats-1322825 $M0
-+TEST setfattr -n trusted.io-stats-dump -v io-stats-1322825 $M0
- 
- # Check if $M0 is clean w.r.t xattr information
- # TODO: if there are better ways to check we really get no attr error, please
-@@ -42,12 +42,12 @@ ret=$(echo $?)
- EXPECT 0 echo $ret
- 
- # Check if we have 5 io-stat files in /tmp
--EXPECT 5 ls -1 /tmp/io-stats-1322825*
-+EXPECT 5 ls -1 /var/run/gluster/io-stats-1322825*
- # Cleanup the 5 generated files
--rm -f /tmp/io-stats-1322825*
-+rm -f /var/run/gluster/io-stats-1322825*
- 
- # Rinse and repeat above for a directory
--TEST setfattr -n trusted.io-stats-dump -v /tmp/io-stats-1322825 $M0/dir1
-+TEST setfattr -n trusted.io-stats-dump -v io-stats-1322825 $M0/dir1
- getfattr -n trusted.io-stats-dump $B0/${V0}1/dir1 2>&1 | grep -qi "no such attribute"
- ret=$(echo $?)
- EXPECT 0 echo $ret
-@@ -61,7 +61,7 @@ getfattr -n trusted.io-stats-dump $B0/${V0}4/dir1 2>&1 | grep -qi "no such attri
- ret=$(echo $?)
- EXPECT 0 echo $ret
- 
--EXPECT 5 ls -1 /tmp/io-stats-1322825*
--rm -f /tmp/io-stats-1322825*
-+EXPECT 5 ls -1 /var/run/gluster/io-stats-1322825*
-+rm -f /var/run/gluster/io-stats-1322825*
- 
- cleanup;
-diff --git a/xlators/debug/io-stats/src/io-stats.c b/xlators/debug/io-stats/src/io-stats.c
-index d9d1e1d..72fa39c 100644
---- a/xlators/debug/io-stats/src/io-stats.c
-+++ b/xlators/debug/io-stats/src/io-stats.c
-@@ -45,6 +45,8 @@
- #define DEFAULT_GRP_BUF_SZ 16384
- #define IOS_BLOCK_COUNT_SIZE 32
- 
-+#define IOS_STATS_DUMP_DIR DEFAULT_VAR_RUN_DIRECTORY
-+
- typedef enum {
-         IOS_STATS_TYPE_NONE,
-         IOS_STATS_TYPE_OPEN,
-@@ -2999,7 +3001,6 @@ io_stats_fsync (call_frame_t *frame, xlator_t *this,
-         return 0;
- }
- 
--
- int
- conditional_dump (dict_t *dict, char *key, data_t *value, void *data)
- {
-@@ -3012,9 +3013,10 @@ conditional_dump (dict_t *dict, char *key, data_t *value, void *data)
-         char                 *filename = NULL;
-         FILE                 *logfp = NULL;
-         struct ios_dump_args args = {0};
--        int                   pid, namelen;
-+        int                   pid, namelen, dirlen;
-         char                  dump_key[100];
-         char                 *slash_ptr = NULL;
-+        char                 *path_in_value = NULL;
- 
-         stub  = data;
-         this  = stub->this;
-@@ -3023,16 +3025,30 @@ conditional_dump (dict_t *dict, char *key, data_t *value, void *data)
-         name as well. This helps when there is more than a single io-stats
-         instance in the graph, or the client and server processes are running
-         on the same node */
--        /* hmmm... no check for this */
--        /* name format: <passed in path/filename>.<xlator name slashes to -> */
--        namelen = value->len + strlen (this->name) + 2; /* '.' and '\0' */
-+        /* For the sanity of where the file should be located, we should make
-+           sure file is written only inside RUNDIR (ie, /var/run/gluster) */
-+        /* TODO: provide an option to dump it to different directory of
-+           choice, based on options */
-+        /* name format: /var/run/gluster/<passed in path/filename>.<xlator name slashes to -> */
-+
-+        path_in_value = data_to_str (value);
-+
-+        if (strstr (path_in_value, "../")) {
-+                gf_log (this->name, GF_LOG_ERROR,
-+                        "%s: no \"../\" allowed in path", path_in_value);
-+                return -1;
-+        }
-+        dirlen = strlen (IOS_STATS_DUMP_DIR);
-+        namelen = (dirlen + value->len + strlen (this->name) + 3);
-+        /* +3 for '/', '.' and '\0' added in snprintf below*/
-+
-         filename = alloca0 (namelen);
--        memcpy (filename, data_to_str (value), value->len);
--        memcpy (filename + value->len, ".", 1);
--        memcpy (filename + value->len + 1, this->name, strlen(this->name));
-+
-+        snprintf (filename, namelen, "%s/%s.%s", IOS_STATS_DUMP_DIR,
-+                  path_in_value, this->name);
- 
-         /* convert any slashes to '-' so that fopen works correctly */
--        slash_ptr = strchr (filename + value->len + 1, '/');
-+        slash_ptr = strchr (filename + dirlen + 1, '/');
-         while (slash_ptr) {
-                 *slash_ptr = '-';
-                 slash_ptr = strchr (slash_ptr, '/');
--- 
-2.7.4
-
diff --git a/recipes-extended/glusterfs/files/0006-posix-remove-not-supported-get-set-content.patch b/recipes-extended/glusterfs/files/0006-posix-remove-not-supported-get-set-content.patch
deleted file mode 100644
index d35ec48..0000000
--- a/recipes-extended/glusterfs/files/0006-posix-remove-not-supported-get-set-content.patch
+++ /dev/null
@@ -1,297 +0,0 @@
-From 76ee41dcb37d3c864d9cb70f957034c246de43ab Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 25 Sep 2018 16:31:14 +0800
-Subject: [PATCH 6/7] posix: remove not supported get/set content
-
-getting and setting a file's content using extended
-attribute worked great as a GET/PUT alternative when
-an object storage is supported on top of Gluster. But
-it needs application changes, and also, it skips some
-caching layers. It is not used over years, and not
-supported any more. Remove the dead code.
-
-Fixes: bz#1625102
-
-Change-Id: Ide3b3f1f644f6ca58558bbe45561f346f96b95b7
-Signed-off-by: Amar Tumballi <amarts@redhat.com>
-
-Upstream-Status: Backport
-
-Fix CVE-2018-10913
-Fix CVE-2018-10914
-
-Modified to suite this old version.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libglusterfs/src/glusterfs.h              |   6 --
- xlators/storage/posix/src/posix-helpers.c | 166 +-----------------------------
- xlators/storage/posix/src/posix.c         |  14 ---
- xlators/storage/posix/src/posix.h         |   4 -
- 4 files changed, 1 insertion(+), 189 deletions(-)
-
-diff --git a/libglusterfs/src/glusterfs.h b/libglusterfs/src/glusterfs.h
-index 9047373..77cafcb 100644
---- a/libglusterfs/src/glusterfs.h
-+++ b/libglusterfs/src/glusterfs.h
-@@ -152,9 +152,6 @@
- #define GLUSTERFS_INTERNAL_FOP_KEY  "glusterfs-internal-fop"
- #define DHT_CHANGELOG_RENAME_OP_KEY   "changelog.rename-op"
- 
--#define ZR_FILE_CONTENT_STR     "glusterfs.file."
--#define ZR_FILE_CONTENT_STRLEN 15
--
- #define GLUSTERFS_WRITE_IS_APPEND "glusterfs.write-is-append"
- #define GLUSTERFS_WRITE_UPDATE_ATOMIC "glusterfs.write-update-atomic"
- #define GLUSTERFS_OPEN_FD_COUNT "glusterfs.open-fd-count"
-@@ -220,9 +217,6 @@
- 
- #define STARTING_EVENT_THREADS                 1
- 
--#define ZR_FILE_CONTENT_REQUEST(key) (!strncmp(key, ZR_FILE_CONTENT_STR, \
--                                               ZR_FILE_CONTENT_STRLEN))
--
- #define DEFAULT_VAR_RUN_DIRECTORY        DATADIR "/run/gluster"
- #define DEFAULT_GLUSTERFSD_MISC_DIRETORY DATADIR "/lib/misc/glusterfsd"
- #ifdef GF_LINUX_HOST_OS
-diff --git a/xlators/storage/posix/src/posix-helpers.c b/xlators/storage/posix/src/posix-helpers.c
-index 69f61bf..f849845 100644
---- a/xlators/storage/posix/src/posix-helpers.c
-+++ b/xlators/storage/posix/src/posix-helpers.c
-@@ -890,166 +890,6 @@ out:
-         return ret;
- }
- 
--
--int
--posix_set_file_contents (xlator_t *this, const char *path, char *keyp,
--                         data_t *value, int flags)
--{
--        char *      key                        = NULL;
--        char        real_path[PATH_MAX];
--        int32_t     file_fd                    = -1;
--        int         op_ret                     = 0;
--        int         ret                        = -1;
--
--
--        /* XXX: does not handle assigning GFID to created files */
--        return -1;
--
--        key = &(keyp[15]);
--        sprintf (real_path, "%s/%s", path, key);
--
--        if (flags & XATTR_REPLACE) {
--                /* if file exists, replace it
--                 * else, error out */
--                file_fd = open (real_path, O_TRUNC|O_WRONLY);
--
--                if (file_fd == -1) {
--                        goto create;
--                }
--
--                if (value->len) {
--                        ret = sys_write (file_fd, value->data, value->len);
--                        if (ret == -1) {
--                                op_ret = -errno;
--                                gf_msg (this->name, GF_LOG_ERROR, errno,
--                                        P_MSG_SET_FILE_CONTENTS, "write failed"
--                                        "while doing setxattr for key %s on"
--                                        "path%s", key, real_path);
--                                goto out;
--                        }
--
--                        ret = sys_close (file_fd);
--                        if (ret == -1) {
--                                op_ret = -errno;
--                                gf_msg (this->name, GF_LOG_ERROR, errno,
--                                        P_MSG_SET_FILE_CONTENTS,
--                                        "close failed on %s",
--                                        real_path);
--                                goto out;
--                        }
--                }
--
--        create: /* we know file doesn't exist, create it */
--
--                file_fd = open (real_path, O_CREAT|O_WRONLY, 0644);
--
--                if (file_fd == -1) {
--                        op_ret = -errno;
--                        gf_msg (this->name, GF_LOG_ERROR, errno,
--                                P_MSG_SET_FILE_CONTENTS, "failed to open file"
--                                "%s with O_CREAT", key);
--                        goto out;
--                }
--
--                ret = sys_write (file_fd, value->data, value->len);
--                if (ret == -1) {
--                        op_ret = -errno;
--                        gf_msg (this->name, GF_LOG_ERROR, errno,
--                                P_MSG_SET_FILE_CONTENTS, "write failed on %s"
--                                "while setxattr with key %s", real_path, key);
--                        goto out;
--                }
--
--                ret = sys_close (file_fd);
--                if (ret == -1) {
--                        op_ret = -errno;
--                        gf_msg (this->name, GF_LOG_ERROR, errno,
--                                P_MSG_SET_FILE_CONTENTS, "close failed on"
--                                " %s while setxattr with key %s",
--                                real_path, key);
--                        goto out;
--                }
--        }
--
--out:
--        return op_ret;
--}
--
--
--int
--posix_get_file_contents (xlator_t *this, uuid_t pargfid,
--                         const char *name, char **contents)
--{
--        char        *real_path                 = NULL;
--        int32_t     file_fd                    = -1;
--        struct iatt stbuf                      = {0,};
--        int         op_ret                     = 0;
--        int         ret                        = -1;
--
--
--        MAKE_HANDLE_PATH (real_path, this, pargfid, name);
--        if (!real_path) {
--                op_ret = -ESTALE;
--                gf_msg (this->name, GF_LOG_ERROR, ESTALE,
--                        P_MSG_XDATA_GETXATTR,
--                        "Failed to create handle path for %s/%s",
--                        uuid_utoa (pargfid), name);
--                goto out;
--        }
--
--        op_ret = posix_istat (this, pargfid, name, &stbuf);
--        if (op_ret == -1) {
--                op_ret = -errno;
--                gf_msg (this->name, GF_LOG_ERROR, errno, P_MSG_XDATA_GETXATTR,
--                        "lstat failed on %s", real_path);
--                goto out;
--        }
--
--        file_fd = open (real_path, O_RDONLY);
--
--        if (file_fd == -1) {
--                op_ret = -errno;
--                gf_msg (this->name, GF_LOG_ERROR, errno, P_MSG_XDATA_GETXATTR,
--                        "open failed on %s", real_path);
--                goto out;
--        }
--
--        *contents = GF_CALLOC (stbuf.ia_size + 1, sizeof(char),
--                               gf_posix_mt_char);
--        if (! *contents) {
--                op_ret = -errno;
--                goto out;
--        }
--
--        ret = sys_read (file_fd, *contents, stbuf.ia_size);
--        if (ret <= 0) {
--                op_ret = -1;
--                gf_msg (this->name, GF_LOG_ERROR, errno, P_MSG_XDATA_GETXATTR,
--                        "read on %s failed", real_path);
--                goto out;
--        }
--
--        *contents[stbuf.ia_size] = '\0';
--
--        op_ret = sys_close (file_fd);
--        file_fd = -1;
--        if (op_ret == -1) {
--                op_ret = -errno;
--                gf_msg (this->name, GF_LOG_ERROR, errno, P_MSG_XDATA_GETXATTR,
--                        "close on %s failed", real_path);
--                goto out;
--        }
--
--out:
--        if (op_ret < 0) {
--                GF_FREE (*contents);
--                if (file_fd != -1)
--                        sys_close (file_fd);
--        }
--
--        return op_ret;
--}
--
- #ifdef HAVE_SYS_ACL_H
- int
- posix_pacl_set (const char *path, const char *key, const char *acl_s)
-@@ -1154,9 +994,6 @@ posix_handle_pair (xlator_t *this, const char *real_path,
-         if (XATTR_IS_PATHINFO (key)) {
-                 ret = -EACCES;
-                 goto out;
--        } else if (ZR_FILE_CONTENT_REQUEST(key)) {
--                ret = posix_set_file_contents (this, real_path, key, value,
--                                               flags);
-         } else if (GF_POSIX_ACL_REQUEST (key)) {
-                 if (stbuf && IS_DHT_LINKFILE_MODE (stbuf))
-                         goto out;
-@@ -1609,8 +1446,7 @@ _handle_entry_create_keyvalue_pair (dict_t *d, char *k, data_t *v,
-             !strcmp ("gfid-req", k) ||
-             !strcmp (POSIX_ACL_DEFAULT_XATTR, k) ||
-             !strcmp (POSIX_ACL_ACCESS_XATTR, k) ||
--            posix_xattr_ignorable (k) ||
--            ZR_FILE_CONTENT_REQUEST(k)) {
-+            posix_xattr_ignorable (k)) {
-                 return 0;
-         }
- 
-diff --git a/xlators/storage/posix/src/posix.c b/xlators/storage/posix/src/posix.c
-index 506ae91..a69e8f6 100644
---- a/xlators/storage/posix/src/posix.c
-+++ b/xlators/storage/posix/src/posix.c
-@@ -4427,7 +4427,6 @@ posix_getxattr (call_frame_t *frame, xlator_t *this,
-         char                 *value                 = NULL;
-         char                 *real_path             = NULL;
-         dict_t               *dict                  = NULL;
--        char                 *file_contents         = NULL;
-         int                   ret                   = -1;
-         char                 *path                  = NULL;
-         char                 *rpath                 = NULL;
-@@ -4458,19 +4457,6 @@ posix_getxattr (call_frame_t *frame, xlator_t *this,
-                 goto out;
-         }
- 
--        if (loc->inode && IA_ISDIR(loc->inode->ia_type) && name &&
--            ZR_FILE_CONTENT_REQUEST(name)) {
--                ret = posix_get_file_contents (this, loc->gfid, &name[15],
--                                               &file_contents);
--                if (ret < 0) {
--                        op_errno = -ret;
--                        gf_msg (this->name, GF_LOG_ERROR, op_errno,
--                                P_MSG_FILE_FAILED, "getting file contents"
--                                "failed");
--                        goto out;
--                }
--        }
--
-         dict = dict_new ();
-         if (!dict) {
-                 op_errno = ENOMEM;
-diff --git a/xlators/storage/posix/src/posix.h b/xlators/storage/posix/src/posix.h
-index febd432..3d2566b 100644
---- a/xlators/storage/posix/src/posix.h
-+++ b/xlators/storage/posix/src/posix.h
-@@ -250,10 +250,6 @@ int posix_handle_pair (xlator_t *this, const char *real_path, char *key,
- int posix_fhandle_pair (xlator_t *this, int fd, char *key, data_t *value,
-                         int flags, struct iatt *stbuf);
- void posix_spawn_janitor_thread (xlator_t *this);
--int posix_get_file_contents (xlator_t *this, uuid_t pargfid,
--                             const char *name, char **contents);
--int posix_set_file_contents (xlator_t *this, const char *path, char *key,
--                             data_t *value, int flags);
- int posix_acl_xattr_set (xlator_t *this, const char *path, dict_t *xattr_req);
- int posix_gfid_heal (xlator_t *this, const char *path, loc_t *loc, dict_t *xattr_req);
- int posix_entry_create_xattr_set (xlator_t *this, const char *path,
--- 
-2.7.4
-
diff --git a/recipes-extended/glusterfs/files/0007-protocol-don-t-use-alloca.patch b/recipes-extended/glusterfs/files/0007-protocol-don-t-use-alloca.patch
deleted file mode 100644
index bd45437..0000000
--- a/recipes-extended/glusterfs/files/0007-protocol-don-t-use-alloca.patch
+++ /dev/null
@@ -1,400 +0,0 @@
-From 7d8d9bd27f245739a6f297e4ecfc87b90c783987 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 26 Sep 2018 09:47:28 +0800
-Subject: [PATCH 7/7] protocol: don't use alloca
-
-current implementation of alloca can cause issues when strings larger
-than the allocated buffer is passed to the xdr. Hence it makes sense
-to allow XDR decode functions to deal with memory allocations, which
-we can free later.
-
-Fixes: bz#1625097
-
-Change-Id: I3a05553f5702de9575c244649ca0e5ac9abaac94
-Signed-off-by: Amar Tumballi <amarts@redhat.com>
-
-Upstream-Status: Backport
-
-Fix CVE-2018-10907
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- xlators/protocol/server/src/server-rpc-fops.c | 73 +++++++++++----------------
- 1 file changed, 30 insertions(+), 43 deletions(-)
-
-diff --git a/xlators/protocol/server/src/server-rpc-fops.c b/xlators/protocol/server/src/server-rpc-fops.c
-index 0ba4ffa..d3a44fc 100644
---- a/xlators/protocol/server/src/server-rpc-fops.c
-+++ b/xlators/protocol/server/src/server-rpc-fops.c
-@@ -3983,8 +3983,6 @@ server3_3_create (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.bname = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_create_req);
-         if (ret < 0) {
-@@ -4034,6 +4032,7 @@ server3_3_create (rpcsvc_request_t *req)
- out:
-         /* memory allocated by libc, don't use GF_FREE */
-         free (args.xdata.xdata_val);
-+        free (args.bname);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -4693,8 +4692,6 @@ server3_3_unlink (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.bname = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_unlink_req);
-         if (ret < 0) {
-@@ -4734,6 +4731,7 @@ server3_3_unlink (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_unlink_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.bname);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -4755,8 +4753,6 @@ server3_3_setxattr (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.dict.dict_val = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_setxattr_req);
-         if (ret < 0) {
-@@ -4809,6 +4805,7 @@ server3_3_setxattr (rpcsvc_request_t *req)
- 
- out:
-         free (args.xdata.xdata_val);
-+        free (args.dict.dict_val);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -4834,7 +4831,6 @@ server3_3_fsetxattr (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.dict.dict_val = alloca (req->msg[0].iov_len);
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_fsetxattr_req);
-         if (ret < 0) {
-@@ -4885,6 +4881,7 @@ server3_3_fsetxattr (rpcsvc_request_t *req)
- 
- out:
-         free (args.xdata.xdata_val);
-+        free (args.dict.dict_val);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -4910,7 +4907,6 @@ server3_3_fxattrop (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.dict.dict_val = alloca (req->msg[0].iov_len);
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_fxattrop_req);
-         if (ret < 0) {
-@@ -4961,6 +4957,7 @@ server3_3_fxattrop (rpcsvc_request_t *req)
- 
- out:
-         free (args.xdata.xdata_val);
-+        free (args.dict.dict_val);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -4986,8 +4983,6 @@ server3_3_xattrop (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.dict.dict_val = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_xattrop_req);
-         if (ret < 0) {
-@@ -5037,6 +5032,7 @@ server3_3_xattrop (rpcsvc_request_t *req)
- 
- out:
-         free (args.xdata.xdata_val);
-+        free (args.dict.dict_val);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -5060,8 +5056,6 @@ server3_3_getxattr (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.name = alloca (256);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_getxattr_req);
-         if (ret < 0) {
-@@ -5104,6 +5098,7 @@ server3_3_getxattr (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_getxattr_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.name);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -5124,7 +5119,6 @@ server3_3_fgetxattr (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.name = alloca (256);
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_fgetxattr_req);
-         if (ret < 0) {
-@@ -5165,6 +5159,7 @@ server3_3_fgetxattr (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_fgetxattr_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.name);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -5186,8 +5181,6 @@ server3_3_removexattr (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.name = alloca (256);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_removexattr_req);
-         if (ret < 0) {
-@@ -5225,6 +5218,7 @@ server3_3_removexattr (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_removexattr_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.name);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -5244,8 +5238,6 @@ server3_3_fremovexattr (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.name = alloca (4096);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_fremovexattr_req);
-         if (ret < 0) {
-@@ -5284,6 +5276,7 @@ server3_3_fremovexattr (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_fremovexattr_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.name);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -5561,8 +5554,6 @@ server3_3_mknod (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.bname = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_mknod_req);
-         if (ret < 0) {
-@@ -5609,6 +5600,7 @@ out:
- 
-         /* memory allocated by libc, don't use GF_FREE */
-         free (args.xdata.xdata_val);
-+        free (args.bname);
- 
-         return ret;
- 
-@@ -5627,8 +5619,6 @@ server3_3_mkdir (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.bname = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_mkdir_req);
-         if (ret < 0) {
-@@ -5674,6 +5664,7 @@ out:
-                 SERVER_REQ_SET_ERROR (req, ret);
- 
-         free (args.xdata.xdata_val);
-+        free (args.bname);
- 
-         return ret;
- }
-@@ -5691,8 +5682,6 @@ server3_3_rmdir (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.bname = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_rmdir_req);
-         if (ret < 0) {
-@@ -5732,6 +5721,7 @@ server3_3_rmdir (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_rmdir_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.bname);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -5754,8 +5744,6 @@ server3_3_inodelk (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.volume = alloca (256);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_inodelk_req);
-         if (ret < 0) {
-@@ -5822,6 +5810,7 @@ server3_3_inodelk (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_inodelk_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.volume);
- 
-         free (args.flock.lk_owner.lk_owner_val);
- 
-@@ -5843,7 +5832,6 @@ server3_3_finodelk (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.volume = alloca (256);
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_finodelk_req);
-         if (ret < 0) {
-@@ -5911,6 +5899,7 @@ server3_3_finodelk (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_finodelk_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.volume);
- 
-         free (args.flock.lk_owner.lk_owner_val);
- 
-@@ -5933,9 +5922,6 @@ server3_3_entrylk (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.volume = alloca (256);
--        args.name   = alloca (256);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_entrylk_req);
-         if (ret < 0) {
-@@ -5979,6 +5965,8 @@ server3_3_entrylk (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_entrylk_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.volume);
-+        free (args.name);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -5998,9 +5986,6 @@ server3_3_fentrylk (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.name   = alloca (256);
--        args.volume = alloca (256);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_fentrylk_req);
-         if (ret < 0) {
-@@ -6044,6 +6029,8 @@ server3_3_fentrylk (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_fentrylk_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.volume);
-+        free (args.name);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -6121,9 +6108,6 @@ server3_3_symlink (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.bname    = alloca (req->msg[0].iov_len);
--        args.linkname = alloca (4096);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_symlink_req);
-         if (ret < 0) {
-@@ -6168,6 +6152,8 @@ out:
- 
-         /* memory allocated by libc, don't use GF_FREE */
-         free (args.xdata.xdata_val);
-+        free (args.linkname);
-+        free (args.bname);
- 
-         return ret;
- }
-@@ -6186,8 +6172,6 @@ server3_3_link (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.newbname = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args, (xdrproc_t)xdr_gfs3_link_req);
-         if (ret < 0) {
-                 //failed to decode msg;
-@@ -6227,6 +6211,7 @@ server3_3_link (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_link_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.newbname);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -6247,9 +6232,6 @@ server3_3_rename (rpcsvc_request_t *req)
-         if (!req)
-                 return ret;
- 
--        args.oldbname = alloca (req->msg[0].iov_len);
--        args.newbname = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_rename_req);
-         if (ret < 0) {
-@@ -6291,6 +6273,8 @@ server3_3_rename (rpcsvc_request_t *req)
-         resolve_and_resume (frame, server_rename_resume);
- out:
-         free (args.xdata.xdata_val);
-+        free (args.newbname);
-+        free (args.oldbname);
- 
-         if (op_errno)
-                 SERVER_REQ_SET_ERROR (req, ret);
-@@ -6537,9 +6521,6 @@ server3_3_lookup (rpcsvc_request_t *req)
- 
-         GF_VALIDATE_OR_GOTO ("server", req, err);
- 
--        args.bname           = alloca (req->msg[0].iov_len);
--        args.xdata.xdata_val = alloca (req->msg[0].iov_len);
--
-         ret = xdr_to_generic (req->msg[0], &args,
-                               (xdrproc_t)xdr_gfs3_lookup_req);
-         if (ret < 0) {
-@@ -6585,8 +6566,14 @@ server3_3_lookup (rpcsvc_request_t *req)
-         ret = 0;
-         resolve_and_resume (frame, server_lookup_resume);
- 
-+        free (args.bname);
-+        free (args.xdata.xdata_val);
-+
-         return ret;
- out:
-+        free (args.bname);
-+        free (args.xdata.xdata_val);
-+
-         server_lookup_cbk (frame, NULL, frame->this, -1, EINVAL, NULL, NULL,
-                            NULL, NULL);
- 	ret = 0;
--- 
-2.7.4
-
diff --git a/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
index e146f7d..4bbcbe9 100644
--- a/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
+++ b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
@@ -1,6 +1,6 @@
-From ff524f14ba93eb422963c8009a108516639d9b3a Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 19 Jul 2017 09:40:57 +0800
+From f2a1c67e2b3b60ba54f506cf806437924b5242ca Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 12 Mar 2019 20:21:48 -0700
 Subject: [PATCH] configure.ac: allow PYTHON values to be passed via env
 
 Allow the recipe can specify specific values for PYTHON.
@@ -8,58 +8,39 @@ Allow the recipe can specify specific values for PYTHON.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
+[Hongzhi: minor adjust the patch on v5.4]
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
- configure.ac | 26 ++++++++++----------------
- 1 file changed, 10 insertions(+), 16 deletions(-)
+ configure.ac | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8e0652a..f49b9b3 100644
+index d55a7b2..36b0980 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -546,9 +546,6 @@ fi
- dnl Check if version matches that we require
- PYTHONDEV_CPPFLAGS=
- PYTHONDEV_LDFLAGS=
--BUILD_PYTHON_SITE_PACKAGES=
--BUILD_PYTHON_INC=
--BUILD_PYTHON_LIB=
- have_python2=no
- have_Python_h=no
- 
-@@ -557,25 +554,22 @@ if echo $PYTHON_VERSION | grep -q ^2; then
- 
-    dnl Use pkg-config to get runtime search patch missing from ${PYTHON}-config
-    dnl Just do "true" on failure so that configure does not bail out
--   PKG_CHECK_MODULES([PYTHON], "python-$PYTHON_VERSION",,true)
-+   PKG_CHECK_MODULES([PYTHONDEV], "python-$PYTHON_VERSION", [AC_SUBST(PYTHONDEV_CPPFLAGS) AC_SUBST(PYTHONDEV_LDFLAGS)], AC_MSG_ERROR([Can not find python]))
- 
--   PYTHONDEV_CPPFLAGS="`${PYTHON}-config --cflags`"
--   dnl Edit out the flags that are not required or are conflicting
--   PYTHONDEV_CPPFLAGS=`echo ${PYTHONDEV_CPPFLAGS} | sed -e 's/-Wp,-D_FORTIFY_SOURCE=[[0-9]]//g'`
--
--   dnl Find python libs at user configured libdir and also "lib" under prefix
--   PYTHONDEV_LDFLAGS="${PYTHON_LIBS} -L`${PYTHON}-config --prefix`/lib -L`${PYTHON}-config --prefix`/$libdir `${PYTHON}-config --ldflags`"
--
--   BUILD_PYTHON_SITE_PACKAGES=${pythondir}
--   BUILD_PYTHON_INC=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_inc())" 2>/dev/null`
--   BUILD_PYTHON_LIB=python$PYTHON_VERSION
-+   if test -z "${BUILD_PYTHON_SITE_PACKAGES}"; then
-+      BUILD_PYTHON_SITE_PACKAGES=${pythondir}
-+   fi
-+   if test -z "${BUILD_PYTHON_INC}"; then
-+      BUILD_PYTHON_INC=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_inc())" 2>/dev/null`
-+   fi
-+   if test -z "${BUILD_PYTHON_LIB}"; then
-+      BUILD_PYTHON_LIB=python$PYTHON_VERSION
-+   fi
- 
-    dnl Now check for python header using the include path obtained above
-    AC_CHECK_HEADERS([${BUILD_PYTHON_INC}/Python.h],[have_Python_h=yes],[])
+@@ -650,12 +650,20 @@ if test "x${PYTHON_VERSION}" = "x2.6"; then
+   PYTHON_CFLAGS=$(python-config --includes)
+   PYTHON_LIBS=$(python-config --libs)
+ else
+-  PKG_CHECK_MODULES([PYTHON], "python-${PYTHON_VERSION}",,true)
++  PKG_CHECK_MODULES([PYTHONDEV], "python-$PYTHON_VERSION", [AC_SUBST(PYTHONDEV_CPPFLAGS) AC_SUBST(PYTHONDEV_LDFLAGS)], AC_MSG_ERROR([Can not find python]))
  fi
  
--AC_SUBST(PYTHONDEV_CPPFLAGS)
--AC_SUBST(PYTHONDEV_LDFLAGS)
+ PYTHON_CFLAGS=$(echo ${PYTHON_CFLAGS} | sed -e 's|-I|-isystem |')
+ 
+-BUILD_PYTHON_SITE_PACKAGES=${pythondir}
++if test -z "${BUILD_PYTHON_SITE_PACKAGES}"; then
++	BUILD_PYTHON_SITE_PACKAGES=${pythondir}
++fi
++if test -z "${BUILD_PYTHON_INC}"; then
++	BUILD_PYTHON_INC=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_inc())" 2>/dev/null`
++fi
++if test -z "${BUILD_PYTHON_LIB}"; then
++	BUILD_PYTHON_LIB=python$PYTHON_VERSION
++fi
  AC_SUBST(BUILD_PYTHON_SITE_PACKAGES)
- AC_SUBST(BUILD_PYTHON_INC)
- AC_SUBST(BUILD_PYTHON_LIB)
+ 
+ # Eval two times to expand fully. First eval replaces $exec_prefix into $prefix
+-- 
+2.17.1
+
diff --git a/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
index 4096cd5..a4b01c1 100644
--- a/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
+++ b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
@@ -1,6 +1,6 @@
-From e585cea1d27be3769c33cf1c0a38bf0de41e2bf9 Mon Sep 17 00:00:00 2001
-From: Xulin Sun <xulin.sun@windriver.com>
-Date: Tue, 22 Mar 2016 16:05:32 +0800
+From 204149d9b46ccec3a354ad4cfcc230c1fab93982 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 12 Mar 2019 22:04:12 -0700
 Subject: [PATCH] dependence on correct header file path
 
 To avoid the below building error, use the correct header file path.
@@ -10,21 +10,25 @@ No such file or directory
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
-
+[Hongzhi:adjust the patch for v5.4]
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  xlators/features/glupy/src/glupy.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/xlators/features/glupy/src/glupy.c b/xlators/features/glupy/src/glupy.c
-index bca4764..7c2b271 100644
+index d1a111e..58cdaf9 100644
 --- a/xlators/features/glupy/src/glupy.c
 +++ b/xlators/features/glupy/src/glupy.c
-@@ -10,7 +10,7 @@
- 
+@@ -11,7 +11,7 @@
  #include <ctype.h>
+ #include <dlfcn.h>
  #include <sys/uio.h>
 -#include <Python.h>
 +#include <python2.7/Python.h>
  
  #include "glusterfs.h"
  #include "xlator.h"
+-- 
+2.17.1
+
diff --git a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
index 884a5f0..52b6ffa 100644
--- a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
+++ b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
@@ -1,6 +1,6 @@
-From 0102ca092047f51b936d39af966f19b23548c606 Mon Sep 17 00:00:00 2001
-From: Vu Tran <vu.tran@windriver.com>
-Date: Wed, 26 Jul 2017 08:42:09 +0800
+From a0ed85e0b268dba76d9c820571e1b9217b51e985 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 12 Mar 2019 20:03:21 -0700
 Subject: [PATCH] glusterd: change port range
 
 glusterfsd chooses tcp ports within the dynamic
@@ -22,19 +22,24 @@ Signed-off-by: Vu Tran <vu.tran@windriver.com>
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
 [Yi: minor adjust to apply the patch on 3.11.1]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
+[Hogzhi: minor adjust to apply the patch on v5.4]
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  extras/glusterd.vol | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/extras/glusterd.vol b/extras/glusterd.vol
-index d882007..c8dfe91 100644
+index 88d412c..b89aa56 100644
 --- a/extras/glusterd.vol
 +++ b/extras/glusterd.vol
-@@ -8,5 +8,5 @@ volume management
-     option ping-timeout 0
+@@ -9,6 +9,6 @@ volume management
      option event-threads 1
+ #   option lock-timer 180
  #   option transport.address-family inet6
 -#   option base-port 49152
 +#   option base-port 59152
+ #   option max-port  65535
  end-volume
+-- 
+2.17.1
+
diff --git a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
index 5b54974..2f140ea 100644
--- a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
@@ -1,7 +1,7 @@
-From 61075d7e4459e4cb9168d1c423ac56db240bb463 Mon Sep 17 00:00:00 2001
-From: Jim Somerville <Jim.Somerville@windriver.com>
-Date: Wed, 12 Feb 2014 15:41:50 +0000
-Subject: [PATCH] glusterfs-api remove unnecessary library options
+From 2ef09531d1d14cd64d5ba4ffbd9a99af10ae1ec4 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 12 Mar 2019 19:37:51 -0700
+Subject: [PATCH] glusterfs-api: remove unnecessary library options
 
 These cause QA errors when users of the api such
 as qemu generate their packages.  The reported
@@ -11,13 +11,13 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
-
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  glusterfs-api.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/glusterfs-api.pc.in b/glusterfs-api.pc.in
-index 5d23454..8a602f6 100644
+index 6af4e10..01b9d0f 100644
 --- a/glusterfs-api.pc.in
 +++ b/glusterfs-api.pc.in
 @@ -8,5 +8,5 @@ Description: GlusterFS API
@@ -26,4 +26,7 @@ index 5d23454..8a602f6 100644
  Requires: @PKGCONFIG_UUID@
 -Libs: -L${libdir} @GFAPI_LIBS@ -lgfapi -lglusterfs -lgfrpc -lgfxdr
 +Libs: -lgfapi -lglusterfs -lgfrpc -lgfxdr
- Cflags: -I${includedir}/glusterfs -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64 -DUSE_POSIX_ACLS=@USE_POSIX_ACLS@
+ Cflags: -I${includedir} -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64 -DUSE_POSIX_ACLS=@USE_POSIX_ACLS@
+-- 
+2.17.1
+
diff --git a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
index 874f7de..e3453a2 100644
--- a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
@@ -1,6 +1,6 @@
-From 9fdaa80b4c933e8f0e97dfde2ba25ed4cea834d5 Mon Sep 17 00:00:00 2001
-From: Vu Tran <vu.tran@windriver.com>
-Date: Wed, 26 Jul 2017 08:42:09 +0800
+From b0c106e74beee36c20f73b956841007209a7f23c Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 12 Mar 2019 19:52:03 -0700
 Subject: [PATCH] glusterfs: change default nfs port number
 
 Currently both native nfs and glusterfs-nfs use NFS well
@@ -30,21 +30,25 @@ Signed-off-by: Vu Tran <vu.tran@windriver.com>
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
 [Yi: minor adjust to apply the patch on 3.11.1]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
+[Hongzhi: minor adjust to apply the patch on v5.4]
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  libglusterfs/src/common-utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libglusterfs/src/common-utils.h b/libglusterfs/src/common-utils.h
-index 6bd2417..25a92b0 100644
+index 6a6fd8c..218e379 100644
 --- a/libglusterfs/src/common-utils.h
 +++ b/libglusterfs/src/common-utils.h
-@@ -94,7 +94,7 @@ void trap (void);
+@@ -108,7 +108,7 @@ trap(void);
  /* Defining this here as it is needed by glusterd for setting
   * nfs port in volume status.
   */
--#define GF_NFS3_PORT    2049
+-#define GF_NFS3_PORT 2049
 +#define GF_NFS3_PORT    38467
  
  #define GF_CLIENT_PORT_CEILING 1024
  #define GF_IANA_PRIV_PORTS_START 49152 /* RFC 6335 */
+-- 
+2.17.1
+
diff --git a/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
index 27b08a8..660446b 100644
--- a/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
+++ b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
@@ -1,6 +1,6 @@
-From d4109317c70c86a67464b7deebbe0c3de88773e1 Mon Sep 17 00:00:00 2001
-From: Xulin Sun <xulin.sun@windriver.com>
-Date: Fri, 25 Mar 2016 12:33:04 +0800
+From 732bcca9f5fbb6defca8c327744d015d6747864b Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 12 Mar 2019 19:56:59 -0700
 Subject: [PATCH] libglusterfs: Don't link against libfl
 
 Remove reference to yywrap by adding "%option noyywrap" statements to
@@ -11,25 +11,11 @@ undefined references to yylex.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
-
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
- libglusterfs/src/Makefile.am | 2 +-
- libglusterfs/src/graph.l     | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
+ libglusterfs/src/graph.l | 1 +
+ 1 file changed, 1 insertion(+)
 
-diff --git a/libglusterfs/src/Makefile.am b/libglusterfs/src/Makefile.am
-index 52b7316..ab5567a 100644
---- a/libglusterfs/src/Makefile.am
-+++ b/libglusterfs/src/Makefile.am
-@@ -11,7 +11,7 @@ libglusterfs_la_CPPFLAGS = $(GF_CPPFLAGS) -D__USE_FILE_OFFSET64 \
- 	-I$(CONTRIBDIR)/libexecinfo ${ARGP_STANDALONE_CPPFLAGS} \
- 	-DSBIN_DIR=\"$(sbindir)\" -I$(CONTRIBDIR)/timer-wheel
- 
--libglusterfs_la_LIBADD = @LEXLIB@ $(ZLIB_LIBS) $(MATH_LIB) $(UUID_LIBS)
-+libglusterfs_la_LIBADD = $(ZLIB_LIBS) $(MATH_LIB) $(UUID_LIBS)
- libglusterfs_la_LDFLAGS = -version-info $(LIBGLUSTERFS_LT_VERSION)
- 
- lib_LTLIBRARIES = libglusterfs.la
 diff --git a/libglusterfs/src/graph.l b/libglusterfs/src/graph.l
 index 8af28a4..742d934 100644
 --- a/libglusterfs/src/graph.l
@@ -42,3 +28,6 @@ index 8af28a4..742d934 100644
  %{
  
  #define YYSTYPE char *
+-- 
+2.17.1
+
diff --git a/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
index d70a103..700b0ba 100644
--- a/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
+++ b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
@@ -1,6 +1,6 @@
-From fbe4fdfddb096e4e6650908929c366dcc9556ade Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 27 Feb 2014 21:50:40 -0500
+From 80c38519224635e9fe2a21542b7dbb14e4c16dcc Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 12 Mar 2019 19:46:27 -0700
 Subject: [PATCH] python: work around host and target python
 
 In order to allow for the build system to make use of python but not
@@ -18,7 +18,8 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
 [Yi: minor adjust the code to apply the patch on 3.11.1]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
+[Hongzhi: minor adjust the code to apply on v5.4]
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  configure.ac                    | 2 ++
  geo-replication/src/Makefile.am | 3 ++-
@@ -26,10 +27,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 7 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8ce28f6..8e0652a 100644
+index bc4cf93..d55a7b2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -270,6 +270,8 @@ AC_CANONICAL_HOST
+@@ -279,6 +279,8 @@ AC_CANONICAL_HOST
  AC_PROG_CC
  AC_DISABLE_STATIC
  AC_PROG_LIBTOOL
@@ -53,27 +54,30 @@ index 9937a0b..07456fb 100644
  AM_CFLAGS = -Wall $(GF_CFLAGS)
  
 diff --git a/geo-replication/src/gsyncd.c b/geo-replication/src/gsyncd.c
-index 2c48ca5..b1d1126 100644
+index 77af662..8cd0551 100644
 --- a/geo-replication/src/gsyncd.c
 +++ b/geo-replication/src/gsyncd.c
-@@ -153,9 +153,9 @@ invoke_gsyncd (int argc, char **argv)
-                 goto error;
+@@ -118,9 +118,9 @@ invoke_gsyncd(int argc, char **argv)
+         goto error;
  
-         j = 0;
--        python = getenv("PYTHON");
-+        python = getenv("TARGET_PYTHON");
-         if(!python)
--                python = PYTHON;
-+                python = TARGET_PYTHON;
-         nargv[j++] = python;
-         nargv[j++] = GSYNCD_PREFIX"/python/syncdaemon/"GSYNCD_PY;
-         for (i = 1; i < argc; i++)
-@@ -205,7 +205,7 @@ find_gsyncd (pid_t pid, pid_t ppid, char *name, void *data)
-         ret = 0;
-         switch (zeros) {
+     j = 0;
+-    python = getenv("PYTHON");
++	python = getenv("TARGET_PYTHON");
+     if (!python)
+-        python = PYTHON;
++		python = TARGET_PYTHON;
+     nargv[j++] = python;
+     nargv[j++] = GSYNCD_PREFIX "/python/syncdaemon/" GSYNCD_PY;
+     for (i = 1; i < argc; i++)
+@@ -170,7 +170,7 @@ find_gsyncd(pid_t pid, pid_t ppid, char *name, void *data)
+     ret = 0;
+     switch (zeros) {
          case 2:
--                if ((strcmp (basename (buf), basename (PYTHON)) ||
-+                if ((strcmp (basename (buf), basename (TARGET_PYTHON)) ||
-                      strcmp (basename (buf + strlen (buf) + 1), GSYNCD_PY)) == 0) {
-                         ret = 1;
-                         break;
+-            if ((strcmp(basename(buf), basename(PYTHON)) ||
++			if ((strcmp (basename (buf), basename (TARGET_PYTHON)) ||
+                  strcmp(basename(buf + strlen(buf) + 1), GSYNCD_PY)) == 0) {
+                 ret = 1;
+                 break;
+-- 
+2.17.1
+
diff --git a/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch b/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
deleted file mode 100644
index 805c00a..0000000
--- a/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 79c943bba37cb10a462038ec56cd2b8045344951 Mon Sep 17 00:00:00 2001
-From: Donn Seeley <donn.seeley@windriver.com>
-Date: Fri, 28 Feb 2014 09:11:02 -0500
-Subject: [PATCH] Add the glusterfs package
-
-Three of the translator makefiles in glusterfs add unnecessary
--L$(xlatordir) link options.  This option causes the linker to check
-the host's $(xlatordir) directory, resulting in contamination that gets
-flagged by Yocto's QA rules.
-
-Upstream-Status: Pending
-
-Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
-[Xulin: minor adjust to apply the patch]
-Signed-off-by: Xuin Sun <xulin.sun@windriver.com>
-
----
- xlators/mgmt/glusterd/src/Makefile.am    | 2 +-
- xlators/nfs/server/src/Makefile.am       | 2 --
- xlators/system/posix-acl/src/Makefile.am | 2 --
- 3 files changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/xlators/mgmt/glusterd/src/Makefile.am b/xlators/mgmt/glusterd/src/Makefile.am
-index b0f5a9b..0caad43 100644
---- a/xlators/mgmt/glusterd/src/Makefile.am
-+++ b/xlators/mgmt/glusterd/src/Makefile.am
-@@ -55,7 +55,7 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src \
- 
- AM_CFLAGS = -Wall $(GF_CFLAGS) $(URCU_CFLAGS) $(URCU_CDS_CFLAGS)
- 
--AM_LDFLAGS = -L$(xlatordir) $(URCU_LIBS) $(URCU_CDS_LIBS)
-+AM_LDFLAGS = -L$(URCU_LIBS) $(URCU_CDS_LIBS)
- 
- CLEANFILES =
- 
-diff --git a/xlators/nfs/server/src/Makefile.am b/xlators/nfs/server/src/Makefile.am
-index bc6f8e9..56086a1 100644
---- a/xlators/nfs/server/src/Makefile.am
-+++ b/xlators/nfs/server/src/Makefile.am
-@@ -25,8 +25,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) \
- 
- AM_CFLAGS = -Wall $(GF_CFLAGS)
- 
--AM_LDFLAGS = -L$(xlatordir)
--
- CLEANFILES =
- 
- EXTRA_DIST = nfsserver.sym
-diff --git a/xlators/system/posix-acl/src/Makefile.am b/xlators/system/posix-acl/src/Makefile.am
-index f57070c..70080a6 100644
---- a/xlators/system/posix-acl/src/Makefile.am
-+++ b/xlators/system/posix-acl/src/Makefile.am
-@@ -12,8 +12,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src \
- 
- AM_CFLAGS = -Wall $(GF_CFLAGS)
- 
--AM_LDFLAGS = -L$(xlatordir)
--
- CLEANFILES =
- 
- access-control-compat:
diff --git a/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch b/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch
new file mode 100644
index 0000000..ed11ce5
--- /dev/null
+++ b/recipes-extended/glusterfs/files/xlator-host-contamination-5.4.patch
@@ -0,0 +1,65 @@
+From a18891a9807b209c7c0811e0e6ca08c4570809d0 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 12 Mar 2019 22:00:46 -0700
+Subject: [PATCH] Add the glusterfs package
+
+Three of the translator makefiles in glusterfs add unnecessary
+-L$(xlatordir) link options.  This option causes the linker to check
+the host's $(xlatordir) directory, resulting in contamination that gets
+flagged by Yocto's QA rules.
+
+Upstream-Status: Pending
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+[Xulin: minor adjust to apply the patch]
+Signed-off-by: Xuin Sun <xulin.sun@windriver.com>
+[Hongzhi: minor adjust to apply the patch]
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ xlators/mgmt/glusterd/src/Makefile.am    | 2 +-
+ xlators/nfs/server/src/Makefile.am       | 2 --
+ xlators/system/posix-acl/src/Makefile.am | 2 --
+ 3 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/xlators/mgmt/glusterd/src/Makefile.am b/xlators/mgmt/glusterd/src/Makefile.am
+index aa75344..834c4b5 100644
+--- a/xlators/mgmt/glusterd/src/Makefile.am
++++ b/xlators/mgmt/glusterd/src/Makefile.am
+@@ -60,7 +60,7 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src \
+ 
+ AM_CFLAGS = -Wall $(GF_CFLAGS) $(URCU_CFLAGS) $(URCU_CDS_CFLAGS) $(XML_CFLAGS)
+ 
+-AM_LDFLAGS = -L$(xlatordir) $(URCU_LIBS) $(URCU_CDS_LIBS)
++AM_LDFLAGS = -L$(URCU_LIBS) $(URCU_CDS_LIBS)
+ 
+ CLEANFILES =
+ 
+diff --git a/xlators/nfs/server/src/Makefile.am b/xlators/nfs/server/src/Makefile.am
+index 01071a7..297d3cb 100644
+--- a/xlators/nfs/server/src/Makefile.am
++++ b/xlators/nfs/server/src/Makefile.am
+@@ -31,8 +31,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) \
+ 
+ AM_CFLAGS = -Wall $(GF_CFLAGS)
+ 
+-AM_LDFLAGS = -L$(xlatordir)
+-
+ CLEANFILES =
+ 
+ EXTRA_DIST = nfsserver.sym
+diff --git a/xlators/system/posix-acl/src/Makefile.am b/xlators/system/posix-acl/src/Makefile.am
+index f57070c..70080a6 100644
+--- a/xlators/system/posix-acl/src/Makefile.am
++++ b/xlators/system/posix-acl/src/Makefile.am
+@@ -12,8 +12,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src \
+ 
+ AM_CFLAGS = -Wall $(GF_CFLAGS)
+ 
+-AM_LDFLAGS = -L$(xlatordir)
+-
+ CLEANFILES =
+ 
+ access-control-compat:
+-- 
+2.17.1
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index f7d3cc3..17aaf75 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -11,7 +11,7 @@ SECTION = "console/network"
 SRC_URI += "file://glusterd.init \
             file://glusterd.service \
             file://glusterfs-configure-automake-with-subdir-objects-for.patch \
-            file://xlator-host-contamination-3.4.patch \
+            file://xlator-host-contamination-5.4.patch \
             file://glusterfs-disable-default-startup-scripts.patch \
             file://glusterfs-api-remove-unnecessary-library-options.patch \
             file://python-work-around-host-and-target-python.patch \
@@ -20,15 +20,6 @@ SRC_URI += "file://glusterd.init \
             file://libglusterfs-Don-t-link-against-libfl.patch \
             file://glusterd-change-port-range.patch \
             file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \
-            file://0001-shared-storage-Prevent-mounting-shared-storage-from-.patch \
-            file://0002-server-auth-add-option-for-strict-authentication.patch \
-            file://0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch \
-            file://0001-dict-handle-negative-key-value-length-while-unserial.patch \
-            file://0002-posix-disable-open-read-write-on-special-files.patch \
-            file://0003-server-protocol-don-t-allow-.-path-in-name.patch \
-            file://0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch \
-            file://0006-posix-remove-not-supported-get-set-content.patch \
-            file://0007-protocol-don-t-use-alloca.patch \
            "
 
 LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
@@ -38,8 +29,8 @@ LIC_FILES_CHKSUM = "file://COPYING-GPLV2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 inherit autotools pkgconfig distutils-base update-rc.d systemd
 
-DEPENDS += "bison-native flex-native python-native fuse libaio libtirpc libxml2 ncurses \
-            openssl python readline zlib liburcu util-linux glib-2.0 acl"
+DEPENDS += "bison-native flex-native python3-native fuse libaio libtirpc libxml2 ncurses \
+            openssl python3 readline zlib liburcu util-linux glib-2.0 acl"
 
 # rpc now comes from libtirpc instead of glibc
 #
@@ -49,6 +40,7 @@ LDFLAGS += " -ltirpc"
 EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
                 ac_cv_file__etc_SuSE_release=no \
                 ac_cv_file__etc_redhat_release=no \
+				ac_cv_file__etc_centos_release=no \
                 --with-mountutildir=${sbindir} \
                 --disable-fusermount \
                 TARGET_PYTHON=${bindir}/python \
@@ -64,7 +56,7 @@ PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
 PACKAGECONFIG[georeplication] = "--enable-georeplication,--disable-georeplication,,rsync"
 PACKAGECONFIG[libibverbs] = "--enable-ibverbs,--disable-ibverbs,virtual/libibverbs librdmacm,"
 PACKAGECONFIG[ocf] = "--with-ocf,--without-ocf,,"
-PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
@@ -123,9 +115,10 @@ INSANE_SKIP_${PN}-server += "dev-so"
 PACKAGES += "${PN}-rdma ${PN}-geo-replication ${PN}-fuse ${PN}-server \
              ${PN}-api ${PN}-ocf"
 
-RDEPENDS_${PN} += "python python-json python-ctypes bash"
+RDEPENDS_${PN} += "python3-core python-json python-ctypes bash"
 RDEPENDS_${PN}-ocf += "bash"
 RDEPENDS_${PN}-server += "bash"
+RDEPENDS_${PN}-geo-replication += "python3"
 
 FILES_${PN}-dbg += "${libdir}/glusterfs/${PV}/*/.debug \
                     ${libdir}/glusterfs/${PV}/*/*/.debug \
@@ -142,6 +135,7 @@ FILES_${PN} = "${libdir}/glusterfs/${PV}/auth \
                ${libdir}/glusterfs/${PV}/xlator/protocol/client* \
                ${libdir}/glusterfs/${PV}/xlator/system \
                ${libdir}/glusterfs/${PV}/xlator/testing \
+			   ${libdir}/glusterfs/${PV}/xlator/playground \
                ${libdir}/glusterfs/${PV}/xlator/meta.so \
                ${libdir}/glusterfs/ganesha \
                ${libdir}/glusterfs/glusterfs/glusterfind \
@@ -154,6 +148,7 @@ FILES_${PN} = "${libdir}/glusterfs/${PV}/auth \
                ${libdir}/libgfdb.so.* \
                ${libdir}/libgfxdr.so.* \
                ${libdir}/python*/site-packages \
+			   ${libexecdir}/glusterfs/gfevents \
                ${libexecdir}/glusterfs/events \
                ${libexecdir}/glusterfs/glusterfind \
                ${libexecdir}/glusterfs/gfind_missing_files \
@@ -174,6 +169,7 @@ FILES_${PN} = "${libdir}/glusterfs/${PV}/auth \
                ${sbindir}/glustereventsd \
                ${sbindir}/gf_attach \
                ${sbindir}/*.py \
+			   ${sbindir}/gluster-setgfid2path \
                ${bindir}/ \
                ${sysconfdir}/glusterfs \
                ${sysconfdir}/ganesha \
diff --git a/recipes-extended/glusterfs/glusterfs_3.11.1.bb b/recipes-extended/glusterfs/glusterfs_3.11.1.bb
deleted file mode 100644
index 6ca157c..0000000
--- a/recipes-extended/glusterfs/glusterfs_3.11.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "https://bits.gluster.org/pub/gluster/glusterfs/src/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "46d56837b8b5c785f2f1e5317d5f6da8"
-SRC_URI[sha256sum] = "c7e0502631c9bc9da05795b666b74ef40a30a0344f5a2e205e65bd2faefe1442"
-
-require glusterfs.inc
diff --git a/recipes-extended/glusterfs/glusterfs_5.4.bb b/recipes-extended/glusterfs/glusterfs_5.4.bb
new file mode 100644
index 0000000..90ffd14
--- /dev/null
+++ b/recipes-extended/glusterfs/glusterfs_5.4.bb
@@ -0,0 +1,6 @@
+SRC_URI = "https://bits.gluster.org/pub/gluster/glusterfs/src/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b52ec9101de3c01c7db17c00b3234d94"
+SRC_URI[sha256sum] = "d4f8cf7551c4ac97480fa4f2da6077171b12d5501ee1ddc4cd8535e2336bde7e"
+
+require glusterfs.inc
-- 
2.8.1


