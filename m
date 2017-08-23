Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 013F1E00CA6; Wed, 23 Aug 2017 11:08:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3FA2E00C97
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 11:08:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7NI8A3T020546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 11:08:10 -0700 (PDT)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 11:08:09 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 23 Aug 2017 14:08:05 -0400
Message-ID: <1503511685-14836-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] spice: fix builds with gcc 7.x
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
X-List-Received-Date: Wed, 23 Aug 2017 18:08:12 -0000
Content-Type: text/plain

There is an upstream fix for this issue but it doesn't apply cleanly
and is rather simple so rather than backport it and turn it into
something unrecognizeable I simply created my own version of it. This
fixes builds which fail with:

| ../../git/server/reds.c: In function 'vdi_port_read_one_msg_from_device':
| ../../git/server/reds.c:797:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
|              state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
|              ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/server/reds.c:798:9: note: here
|          case VDI_PORT_READ_STATE_GET_BUFF: {
|          ^~~~

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../spice/files/Fix-build-issues-with-gcc-7.patch  | 59 ++++++++++++++++++++++
 recipes-support/spice/spice_git.bb                 |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch

diff --git a/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch b/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch
new file mode 100644
index 0000000..7fcafdc
--- /dev/null
+++ b/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch
@@ -0,0 +1,59 @@
+From 9f001b6818ac4baa1df010ccf4200ca56bfb11b2 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Wed, 23 Aug 2017 13:47:29 -0400
+Subject: [PATCH] Fix build issues with gcc 7
+
+gcc 7 checks for when a switch statement doesn't break between
+cases. When a break is not found you will see
+
+| ../../git/server/reds.c: In function 'vdi_port_read_one_msg_from_device':
+| ../../git/server/reds.c:797:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
+|              state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
+|              ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| ../../git/server/reds.c:798:9: note: here
+|          case VDI_PORT_READ_STATE_GET_BUFF: {
+|          ^~~~
+
+The 'fallthrough' comment will let gcc know this is done on purpose.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ server/inputs_channel.c | 1 +
+ server/reds.c           | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/server/inputs_channel.c b/server/inputs_channel.c
+index 931dac1..534ab66 100644
+--- a/server/inputs_channel.c
++++ b/server/inputs_channel.c
+@@ -321,6 +321,7 @@ static int inputs_channel_handle_parsed(RedChannelClient *rcc, uint32_t size, ui
+             activate_modifiers_watch();
+         }
+     }
++        /* fallthrough */
+     case SPICE_MSGC_INPUTS_KEY_UP: {
+         SpiceMsgcKeyDown *key_down = (SpiceMsgcKeyDown *)buf;
+         for (i = 0; i < 4; i++) {
+diff --git a/server/reds.c b/server/reds.c
+index 30d0652..8c80eb6 100644
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
++            /* fallthrough */
+         case VDI_PORT_READ_STATE_READ_DATA:
+             n = sif->read(vdagent, state->recive_pos, state->recive_len);
+             if (!n) {
+-- 
+2.7.4
+
diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
index cfb75d7..04e7a25 100644
--- a/recipes-support/spice/spice_git.bb
+++ b/recipes-support/spice/spice_git.bb
@@ -37,6 +37,7 @@ SRC_URI += " \
         file://build-allow-separated-src-and-build-dirs.patch \
         file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch \
         file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch \
+        file://Fix-build-issues-with-gcc-7.patch \
         "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


