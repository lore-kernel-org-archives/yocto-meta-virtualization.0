Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4EB6FE00E54; Fri,  2 Mar 2018 13:46:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A824E00816
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Mar 2018 13:46:13 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w22LkCs0021426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 2 Mar 2018 13:46:13 -0800
Received: from localhost.localdomain (172.25.59.221) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 2 Mar 2018 13:45:43 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 2 Mar 2018 15:46:11 -0600
Message-ID: <1520027171-22955-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] spice: Fix compile errors from gcc 7 with spice 0.12.4
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
X-List-Received-Date: Fri, 02 Mar 2018 21:46:15 -0000
Content-Type: text/plain

../../git/server/red_parse_qxl.c:367:18: error: 'BITMAP_FMT_IS_RGB' defined but not used [-Werror=unused-const-variable=]
 static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
                  ^~~~~~~~~~~~~~~~~
../../git/server/inputs_channel.c: In function 'inputs_channel_handle_parsed':
../../git/server/inputs_channel.c:317:38: error: this statement may fall through [-Werror=implicit-fallthrough=]
     case SPICE_MSGC_INPUTS_KEY_DOWN: {
                                      ^
../../git/server/inputs_channel.c:324:5: note: here
     case SPICE_MSGC_INPUTS_KEY_UP: {
     ^~~~
../../git/server/reds.c: In function 'vdi_port_read_one_msg_from_device':
../../git/server/reds.c:797:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
             state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
             ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../git/server/reds.c:798:9: note: here
         case VDI_PORT_READ_STATE_GET_BUFF: {
         ^~~~
../../git/server/reds.c:807:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
             state->read_state = VDI_PORT_READ_STATE_READ_DATA;
             ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../git/server/reds.c:809:9: note: here
         case VDI_PORT_READ_STATE_READ_DATA:
         ^~~~

This patch just adds the fallthrough comments which are already
checked in upstream along with the removal of the static variable
which is not used.

The newer versions of spice already have this fixed, so there is no
need to further upstream this patch.  It gets dropped in the future.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 ...ompile-problems-against-spice-0.12.4-with.patch | 88 ++++++++++++++++++++++
 recipes-support/spice/spice_git.bb                 |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 recipes-support/spice/files/v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch

diff --git a/recipes-support/spice/files/v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch b/recipes-support/spice/files/v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch
new file mode 100644
index 0000000..cd5eb85
--- /dev/null
+++ b/recipes-support/spice/files/v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch
@@ -0,0 +1,88 @@
+From 26ae6be2c1ac03e6ea017f58d0b126c9eebae5f9 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Fri, 2 Mar 2018 10:47:09 -0600
+Subject: [PATCH] spice: Fix compile problems against spice 0.12.4 with gcc 7
+
+These errors are generated by gcc 7.
+
+../../git/server/red_parse_qxl.c:367:18: error: 'BITMAP_FMT_IS_RGB' defined but not used [-Werror=unused-const-variable=]
+ static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
+                  ^~~~~~~~~~~~~~~~~
+../../git/server/inputs_channel.c: In function 'inputs_channel_handle_parsed':
+../../git/server/inputs_channel.c:317:38: error: this statement may fall through [-Werror=implicit-fallthrough=]
+     case SPICE_MSGC_INPUTS_KEY_DOWN: {
+                                      ^
+../../git/server/inputs_channel.c:324:5: note: here
+     case SPICE_MSGC_INPUTS_KEY_UP: {
+     ^~~~
+../../git/server/reds.c: In function 'vdi_port_read_one_msg_from_device':
+../../git/server/reds.c:797:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
+             state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
+             ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+../../git/server/reds.c:798:9: note: here
+         case VDI_PORT_READ_STATE_GET_BUFF: {
+         ^~~~
+../../git/server/reds.c:807:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
+             state->read_state = VDI_PORT_READ_STATE_READ_DATA;
+             ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+../../git/server/reds.c:809:9: note: here
+         case VDI_PORT_READ_STATE_READ_DATA:
+         ^~~~
+
+This patch just adds the fallthrough comments which are already
+checked in upstream along with the removal of the static variable
+which is not used.
+---
+ server/inputs_channel.c | 1 +
+ server/red_parse_qxl.c  | 4 ----
+ server/reds.c           | 2 ++
+ spice-common            | 2 +-
+ 4 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/server/inputs_channel.c b/server/inputs_channel.c
+index 931dac1..d6805c4 100644
+--- a/server/inputs_channel.c
++++ b/server/inputs_channel.c
+@@ -321,6 +321,7 @@ static int inputs_channel_handle_parsed(RedChannelClient *rcc, uint32_t size, ui
+             activate_modifiers_watch();
+         }
+     }
++    /* fallthrough */
+     case SPICE_MSGC_INPUTS_KEY_UP: {
+         SpiceMsgcKeyDown *key_down = (SpiceMsgcKeyDown *)buf;
+         for (i = 0; i < 4; i++) {
+diff --git a/server/red_parse_qxl.c b/server/red_parse_qxl.c
+index 6c0b065..c361e6b 100644
+--- a/server/red_parse_qxl.c
++++ b/server/red_parse_qxl.c
+@@ -362,10 +362,6 @@ static int bitmap_consistent(SpiceBitmap *bitmap)
+     return TRUE;
+ }
+ 
+-// This is based on SPICE_BITMAP_FMT_*, copied from server/red_worker.c
+-// to avoid a possible unoptimization from making it non static.
+-static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
+-
+ static SpiceImage *red_get_image(RedMemSlotInfo *slots, int group_id,
+                                  QXLPHYSICAL addr, uint32_t flags, int is_mask)
+ {
+diff --git a/server/reds.c b/server/reds.c
+index 6f262b0..4246170 100644
+--- a/server/reds.c
++++ b/server/reds.c
+@@ -795,6 +795,7 @@ static SpiceCharDeviceMsgToClient *vdi_port_read_one_msg_from_device(SpiceCharDe
+             }
+             state->message_recive_len = state->vdi_chunk_header.size;
+             state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
++            /* fallthrough */
+         case VDI_PORT_READ_STATE_GET_BUFF: {
+             if (!(state->current_read_buf = vdi_port_read_buf_get())) {
+                 return NULL;
+@@ -806,6 +807,7 @@ static SpiceCharDeviceMsgToClient *vdi_port_read_one_msg_from_device(SpiceCharDe
+             state->message_recive_len -= state->recive_len;
+             state->read_state = VDI_PORT_READ_STATE_READ_DATA;
+         }
++        /* fallthrough */
+         case VDI_PORT_READ_STATE_READ_DATA:
+             n = sif->read(vdagent, state->recive_pos, state->recive_len);
+             if (!n) {
diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
index 828087a..ac30de9 100644
--- a/recipes-support/spice/spice_git.bb
+++ b/recipes-support/spice/spice_git.bb
@@ -35,6 +35,7 @@ SRC_URI += " \
         file://spice-fix-CVE-2013-4282.patch \
         file://configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch \
         file://build-allow-separated-src-and-build-dirs.patch \
+        file://v0.12.4_0001-spice-Fix-compile-problems-against-spice-0.12.4-with.patch \
         "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


