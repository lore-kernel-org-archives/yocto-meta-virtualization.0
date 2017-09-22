Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78F55E00CF5; Thu, 21 Sep 2017 19:04:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51617E00CEF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Sep 2017 19:04:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8M24Awr019519
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Sep 2017 19:04:10 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 21 Sep 2017 19:04:09 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 22 Sep 2017 10:03:05 +0800
Message-ID: <1506045785-4157-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-cloud-services][PATCH] spice: fix CVE-2017-7506
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
X-List-Received-Date: Fri, 22 Sep 2017 02:04:12 -0000
Content-Type: text/plain

CVE-2017-7506: spice versions though 0.13 are vulnerable to
out-of-bounds memory access when processing specially crafted messages
from authenticated attacker to the spice server resulting into crash
and/or server memory leak.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-7506

Patches from:
https://cgit.freedesktop.org/spice/spice/commit/?h=0.12&id=f1e7ec03e26ab6b8ca9b7ec060846a5b706a963d
https://cgit.freedesktop.org/spice/spice/commit/?h=0.12&id=ec6229c79abe05d731953df5f7e9a05ec9f6df79
https://cgit.freedesktop.org/spice/spice/commit/?h=0.12&id=a957a90baf2c62d31f3547e56bba7d0e812d2331

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 recipes-support/spice/files/CVE-2017-7506-1.patch | 81 +++++++++++++++++++++++
 recipes-support/spice/files/CVE-2017-7506-2.patch | 37 +++++++++++
 recipes-support/spice/files/CVE-2017-7506-3.patch | 54 +++++++++++++++
 recipes-support/spice/spice_git.bb                |  3 +
 4 files changed, 175 insertions(+)
 create mode 100644 recipes-support/spice/files/CVE-2017-7506-1.patch
 create mode 100644 recipes-support/spice/files/CVE-2017-7506-2.patch
 create mode 100644 recipes-support/spice/files/CVE-2017-7506-3.patch

diff --git a/recipes-support/spice/files/CVE-2017-7506-1.patch b/recipes-support/spice/files/CVE-2017-7506-1.patch
new file mode 100644
index 0000000..1975aca
--- /dev/null
+++ b/recipes-support/spice/files/CVE-2017-7506-1.patch
@@ -0,0 +1,81 @@
+From 2e521a9db27e1ed31bf5fbed437208bf7f1c77a1 Mon Sep 17 00:00:00 2001
+From: Frediano Ziglio <fziglio@redhat.com>
+Date: Mon, 15 May 2017 15:57:28 +0100
+Subject: [PATCH 1/3] reds: Disconnect when receiving overly big
+ ClientMonitorsConfig
+
+Total message size received from the client was unlimited. There is
+a 2kiB size check on individual agent messages, but the MonitorsConfig
+message can be split in multiple chunks, and the size of the
+non-chunked MonitorsConfig message was never checked. This could easily
+lead to memory exhaustion on the host.
+
+Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
+
+Upstream-Status: Backport
+[https://cgit.freedesktop.org/spice/spice/commit/?h=0.12&id=f1e7ec03e26ab6b8ca9b7ec060846a5b706a963d]
+
+CVE: CVE-2017-7506
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ server/reds.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/server/reds.c b/server/reds.c
+index 30d0652..701d5d8 100644
+--- a/server/reds.c
++++ b/server/reds.c
+@@ -1086,19 +1086,34 @@ static void reds_client_monitors_config_cleanup(void)
+ static void reds_on_main_agent_monitors_config(
+         MainChannelClient *mcc, void *message, size_t size)
+ {
++    const unsigned int MAX_MONITORS = 256;
++    const unsigned int MAX_MONITOR_CONFIG_SIZE =
++       sizeof(VDAgentMonitorsConfig) + MAX_MONITORS * sizeof(VDAgentMonConfig);
++
+     VDAgentMessage *msg_header;
+     VDAgentMonitorsConfig *monitors_config;
+     RedsClientMonitorsConfig *cmc = &reds->client_monitors_config;
+ 
++    // limit size of message sent by the client as this can cause a DoS through
++    // memory exhaustion, or potentially some integer overflows
++    if (sizeof(VDAgentMessage) + MAX_MONITOR_CONFIG_SIZE - cmc->buffer_size < size) {
++        goto overflow;
++    }
+     cmc->buffer_size += size;
+     cmc->buffer = realloc(cmc->buffer, cmc->buffer_size);
+     spice_assert(cmc->buffer);
+     cmc->mcc = mcc;
+     memcpy(cmc->buffer + cmc->buffer_pos, message, size);
+     cmc->buffer_pos += size;
++    if (sizeof(VDAgentMessage) > cmc->buffer_size) {
++        spice_debug("not enough data yet. %d", cmc->buffer_size);
++        return;
++    }
+     msg_header = (VDAgentMessage *)cmc->buffer;
+-    if (sizeof(VDAgentMessage) > cmc->buffer_size ||
+-            msg_header->size > cmc->buffer_size - sizeof(VDAgentMessage)) {
++    if (msg_header->size > MAX_MONITOR_CONFIG_SIZE) {
++        goto overflow;
++    }
++    if (msg_header->size > cmc->buffer_size - sizeof(VDAgentMessage)) {
+         spice_debug("not enough data yet. %d\n", cmc->buffer_size);
+         return;
+     }
+@@ -1106,6 +1121,12 @@ static void reds_on_main_agent_monitors_config(
+     spice_debug("%s: %d\n", __func__, monitors_config->num_of_monitors);
+     red_dispatcher_client_monitors_config(monitors_config);
+     reds_client_monitors_config_cleanup();
++    return;
++
++overflow:
++    spice_warning("received invalid MonitorsConfig request from client, disconnecting");
++    red_channel_client_disconnect(main_channel_client_get_base(mcc));
++    reds_client_monitors_config_cleanup();
+ }
+ 
+ void reds_on_main_agent_data(MainChannelClient *mcc, void *message, size_t size)
+-- 
+2.7.4
+
diff --git a/recipes-support/spice/files/CVE-2017-7506-2.patch b/recipes-support/spice/files/CVE-2017-7506-2.patch
new file mode 100644
index 0000000..a517b08
--- /dev/null
+++ b/recipes-support/spice/files/CVE-2017-7506-2.patch
@@ -0,0 +1,37 @@
+From 6934f036240753a14514a71ede8bb44af2043f24 Mon Sep 17 00:00:00 2001
+From: Frediano Ziglio <fziglio@redhat.com>
+Date: Mon, 15 May 2017 15:57:28 +0100
+Subject: [PATCH 2/3] reds: Avoid integer overflows handling monitor
+ configuration
+
+Avoid VDAgentMessage::size integer overflows.
+
+Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
+
+Upstream-Status: Backport
+[https://cgit.freedesktop.org/spice/spice/commit/?h=0.12&id=ec6229c79abe05d731953df5f7e9a05ec9f6df79]
+
+CVE: CVE-2017-7506
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ server/reds.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/server/reds.c b/server/reds.c
+index 701d5d8..62b1164 100644
+--- a/server/reds.c
++++ b/server/reds.c
+@@ -1117,6 +1117,9 @@ static void reds_on_main_agent_monitors_config(
+         spice_debug("not enough data yet. %d\n", cmc->buffer_size);
+         return;
+     }
++    if (msg_header->size < sizeof(VDAgentMonitorsConfig)) {
++        goto overflow;
++    }
+     monitors_config = (VDAgentMonitorsConfig *)(cmc->buffer + sizeof(*msg_header));
+     spice_debug("%s: %d\n", __func__, monitors_config->num_of_monitors);
+     red_dispatcher_client_monitors_config(monitors_config);
+-- 
+2.7.4
+
diff --git a/recipes-support/spice/files/CVE-2017-7506-3.patch b/recipes-support/spice/files/CVE-2017-7506-3.patch
new file mode 100644
index 0000000..d55502f
--- /dev/null
+++ b/recipes-support/spice/files/CVE-2017-7506-3.patch
@@ -0,0 +1,54 @@
+From daedc2e2bb70f7cb0eafd65fd37fd73af12df770 Mon Sep 17 00:00:00 2001
+From: Frediano Ziglio <fziglio@redhat.com>
+Date: Mon, 15 May 2017 15:57:28 +0100
+Subject: [PATCH 3/3] reds: Avoid buffer overflows handling monitor
+ configuration
+
+It was also possible for a malicious client to set
+VDAgentMonitorsConfig::num_of_monitors to a number larger
+than the actual size of VDAgentMOnitorsConfig::monitors.
+This would lead to buffer overflows, which could allow the guest to
+read part of the host memory. This might cause write overflows in the
+host as well, but controlling the content of such buffers seems
+complicated.
+
+Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
+
+Upstream-Status: Backport
+[https://cgit.freedesktop.org/spice/spice/commit/?h=0.12&id=a957a90baf2c62d31f3547e56bba7d0e812d2331]
+
+CVE: CVE-2017-7506
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ server/reds.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/server/reds.c b/server/reds.c
+index 62b1164..ee36dec 100644
+--- a/server/reds.c
++++ b/server/reds.c
+@@ -1093,6 +1093,7 @@ static void reds_on_main_agent_monitors_config(
+     VDAgentMessage *msg_header;
+     VDAgentMonitorsConfig *monitors_config;
+     RedsClientMonitorsConfig *cmc = &reds->client_monitors_config;
++    uint32_t max_monitors;
+ 
+     // limit size of message sent by the client as this can cause a DoS through
+     // memory exhaustion, or potentially some integer overflows
+@@ -1121,6 +1122,12 @@ static void reds_on_main_agent_monitors_config(
+         goto overflow;
+     }
+     monitors_config = (VDAgentMonitorsConfig *)(cmc->buffer + sizeof(*msg_header));
++    // limit the monitor number to avoid buffer overflows
++    max_monitors = (msg_header->size - sizeof(VDAgentMonitorsConfig)) /
++                   sizeof(VDAgentMonConfig);
++    if (monitors_config->num_of_monitors > max_monitors) {
++        goto overflow;
++    }
+     spice_debug("%s: %d\n", __func__, monitors_config->num_of_monitors);
+     red_dispatcher_client_monitors_config(monitors_config);
+     reds_client_monitors_config_cleanup();
+-- 
+2.7.4
+
diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
index 04e7a25..c0fdd9c 100644
--- a/recipes-support/spice/spice_git.bb
+++ b/recipes-support/spice/spice_git.bb
@@ -38,6 +38,9 @@ SRC_URI += " \
         file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch \
         file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch \
         file://Fix-build-issues-with-gcc-7.patch \
+        file://CVE-2017-7506-1.patch \
+        file://CVE-2017-7506-2.patch \
+        file://CVE-2017-7506-3.patch \
         "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


