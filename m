Return-Path: <bobadeshrikant@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D037E00D57; Thu, 17 Aug 2017 06:32:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bobadeshrikant[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.214.67 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED781E00A9B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 06:32:03 -0700 (PDT)
Received: by mail-it0-f67.google.com with SMTP id o72so4198939ita.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Q9svlS6p8xC73Xs8Bz+Xc4uA1OmymFxECE8tIezd3Nc=;
	b=kqnmmBfGHk/4u2nSXC0syhHoHKqbfacI+rqX9EsOVBgG3EjNSAWsm5HBtRFhl2YTgQ
	FWnv/wjJV5F2WpSJfLudJeVhbd18pUpqlvLSnvitUdLjyiM3lF+DWXqJd0DC0ol92Wgo
	1yaDeMGrGiNzKl31k69jximJk2xXnVrmUwIWuCoqsrK+KgqZro4EKNEpjwpWlj02pl7r
	59NxyDXDYiYRy4xxlJNHuci2XixYscUcybp7Dtfcrbe+syqL6M5zPfRddWJxWwh+3YqW
	pyHZoBe1vSoJRAe8ruwVb4kAt2/+UCmVlj3eBSPYh4/qNdnO4y1/uyQlKybPEln9GY9N
	RQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q9svlS6p8xC73Xs8Bz+Xc4uA1OmymFxECE8tIezd3Nc=;
	b=K4+jSs2/bdbtexAFgoUHqB27Ox2psRB61Qp5kUCwTM8I+WEMPucugoec6ypQDixO8D
	ygH5142sX6rIsg9AamyT++uEgtlMYIy4OA04gnY+ceVkbpUhT1Z5UQnGXSv8kbSKEiuH
	RjV5MMS+QLYDMhoOmPMUGXELkGoMl7IrRY1OP+KYftYGhI4jItbEhl6AUgeECICz+utL
	AHgbT7iWsErTTN/WHw+0aZnZSLY1wFXmiOmIS76lJpIvKJDRCsGqWtlO01Pn9buxibI4
	X78Zo+8Bq2HeO5hjTwCsd2M+87qaNSsb4CGPV1TmqoK7the5uJmhfXtI3YZuFi77V5rJ
	nMnQ==
X-Gm-Message-State: AHYfb5gbz9/gW38EzhUGb9QUPbSUMxbde/oOQd/B7FBjl2RQorA0tzT4
	KSBktOQNr+GYCVXMtdk=
X-Received: by 10.36.82.5 with SMTP id d5mr1812332itb.129.1502976722978;
	Thu, 17 Aug 2017 06:32:02 -0700 (PDT)
Received: from shrikant-Precision-Tower-3420.mgc.mentorg.com
	(nat-sch.mentorg.com. [139.181.36.34])
	by smtp.gmail.com with ESMTPSA id l5sm1458564ioe.65.2017.08.17.06.32.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Aug 2017 06:32:02 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 17 Aug 2017 19:04:21 +0530
Message-Id: <1502976861-19480-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Shrikant Bobade <shrikant_bobade@mentor.com>
Subject: [meta-cloud-services][PATCH] rabbitmq-server: add systemd support
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
X-List-Received-Date: Thu, 17 Aug 2017 13:32:05 -0000

From: Shrikant Bobade <shrikant_bobade@mentor.com>

add systemd support to bring-up out of box rabbitmq-server support.
rabbitmq-server-setup: essential setup required by rabbitmq-server
rabbitmq-server.service: systemd support service file

Signed-off-by: Shrikant Bobade <shrikant_bobade@mentor.com>
---
 .../rabbitmq/files/rabbitmq-server-setup           | 26 ++++++++++++++++++++++
 .../rabbitmq/files/rabbitmq-server.service         | 13 +++++++++++
 .../rabbitmq/rabbitmq-server_3.2.4.bb              | 14 +++++++++++-
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100755 meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server-setup
 create mode 100644 meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server.service

diff --git a/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server-setup b/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server-setup
new file mode 100755
index 0000000..343c775
--- /dev/null
+++ b/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server-setup
@@ -0,0 +1,26 @@
+#!/bin/sh
+#
+# rabbitmq-server-setup RabbitMQ broker setup
+#
+# description: To Enable AMQP server provided by RabbitMQ,
+#		this setup required before starting rabbitmq-server.
+#
+##
+
+
+# Ensure that HOME is set, since the erlang cookie file must be written
+# somewhere
+export HOME=/home/root
+
+USER=root
+ROTATE_SUFFIX=
+INIT_LOG_DIR=/var/log/rabbitmq
+
+# setup log dir and files for rabbitmq server
+if [ ! -d ${INIT_LOG_DIR} ]; then
+        mkdir ${INIT_LOG_DIR}
+        chmod 0755 ${INIT_LOG_DIR}
+        chown $USER:$USER ${INIT_LOG_DIR}
+        touch ${INIT_LOG_DIR}/startup_err
+        touch ${INIT_LOG_DIR}/startup_log
+fi
diff --git a/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server.service b/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server.service
new file mode 100644
index 0000000..414ea50
--- /dev/null
+++ b/meta-openstack/recipes-extended/rabbitmq/files/rabbitmq-server.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=RabbitMQ Messaging broker/server service
+After=network.target
+
+[Service]
+Type=simple
+User=root
+ExecStartPre=/usr/bin/rabbitmq-server-setup
+ExecStart=/usr/bin/rabbitmq-server
+ExecStop=/usr/bin/rabbitmqctl stop
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
index 101d098..8e4be5f 100644
--- a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
+++ b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
@@ -10,6 +10,8 @@ SRC_URI = "http://www.rabbitmq.com/releases/rabbitmq-server/v${PV}/${PN}-${PV}.t
            file://rabbitmq-server \
            file://remove-docs.patch \
            file://cleanup_install.patch \
+           file://rabbitmq-server.service \
+           file://rabbitmq-server-setup \
            "
 
 SRC_URI[md5sum] = "09d1af64c005bc680d6790b90655d021"
@@ -44,9 +46,17 @@ do_install() {
     mv ${D}/ebin ${RABBIT_LIB_DIR}/ebin
     mv ${D}/include ${RABBIT_LIB_DIR}/include
     mv ${D}/plugins ${RABBIT_LIB_DIR}/plugins
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/rabbitmq-server.service ${D}${systemd_unitdir}/system
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/rabbitmq-server-setup ${D}${bindir}
+    fi
 }
 
-inherit useradd update-rc.d
+inherit useradd update-rc.d systemd
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system rabbitmq"
@@ -56,6 +66,8 @@ USERADD_PARAM_${PN}  = "--system --create-home --home /var/lib/rabbitmq \
 INITSCRIPT_NAME = "rabbitmq-server"
 INITSCRIPT_PARAMS = "defaults"
 
+SYSTEMD_SERVICE_${PN} = "rabbitmq-server.service"
+
 FILES_${PN} += " ${libdir}/rabbitmq/lib/${PN}-${PV}/* \
                  ${localstatedir}/* \ 
                "
-- 
2.7.4


