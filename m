Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6001DE00C39; Thu, 24 Mar 2016 08:31:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92D3EE00C39
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:31:48 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id s5so2175717qkd.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wFM6v8/ANYkmYLUFSAbfIgrIp2+OXErdkJlE3VmTL+E=;
	b=BtfpM02y0b0nIJ3eRVQv2xVT4a9ESf+x3p44+4TIDjYV9ABVieL1sgaYKSk1hvyJqz
	HaXYZ0hc0toL/t1F0iIJoNrJaVe4l16zT7IRunkMZp6wNBG952SNm0g2h8DFpk7NReNp
	NEE44VifkqQPYpMietXaD0tooGEnpdHA/HvWJbyKB5TbKZWmKz+z6QpNXjmSZ+SwvS6y
	TOHN/uEpDb6jtqVnWAuAw3frboAqo8o6sJG92bUv6iNgRDYoXFMn0W/cXwkjxPZPOJfI
	PKouwOx/DOaMFYdSszFvCbuhMnVn8fVpKb4OqtujmeHlizJblpM+fhY6bFrt5c4hgs0j
	uoOw==
X-Gm-Message-State: AD7BkJKFfTYGgXslKY9XQWvkcHuHgoqCE7ppXp/0oqMmJHJk7bQFV9a4ZBMEKCc0Wh2k3A==
X-Received: by 10.55.74.197 with SMTP id x188mr11460125qka.104.1458833508405; 
	Thu, 24 Mar 2016 08:31:48 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	a11sm3473110qge.43.2016.03.24.08.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 08:31:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Thu, 24 Mar 2016 11:31:31 -0400
Message-Id: <1458833491-7717-4-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458833491-7717-1-git-send-email-derek@asterius.io>
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH 4/4] xen: add the extra packages released with xen 4.7
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
X-List-Received-Date: Thu, 24 Mar 2016 15:31:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-extended/xen/xen.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index bddab6b..96255ec 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -165,8 +165,16 @@ PACKAGES = "\
     ${PN}-libblktapctl \
     ${PN}-libblktapctl-dev \
     ${PN}-libblktap-dev \
+    ${PN}-libxencall \
+    ${PN}-libxencall-dev \
+    ${PN}-libxenevtchn \
+    ${PN}-libxenevtchn-dev \
+    ${PN}-libxenforeignmemory \
+    ${PN}-libxenforeignmemory-dev \
     ${PN}-libfsimage \
     ${PN}-libfsimage-dev \
+    ${PN}-libxengnttab \
+    ${PN}-libxengnttab-dev \
     ${PN}-libvhd \
     ${PN}-libvhd-dev \
     ${PN}-libxenctrl \
@@ -179,6 +187,8 @@ PACKAGES = "\
     ${PN}-libxenstat-dev \
     ${PN}-libxenstore \
     ${PN}-libxenstore-dev \
+    ${PN}-libxentoollog \
+    ${PN}-libxentoollog-dev \
     ${PN}-libxenvchan \
     ${PN}-libxenvchan-dev \
     ${PN}-libxlutil \
@@ -204,6 +214,7 @@ PACKAGES = "\
     ${PN}-xenstat \
     ${PN}-xenstore \
     ${PN}-xenstored \
+    ${PN}-init-xenstore-dom \
     ${PN}-xentrace \
     ${PN}-xen-watchdog \
     ${PN}-xl \
@@ -291,12 +302,29 @@ FILES_${PN}-libxenstat-dev = "${libdir}/libxenstat.so"
 FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
 FILES_${PN}-libxenstore-dev = "${libdir}/libxenstore.so"
 
+FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
+
 FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
 FILES_${PN}-libblktap-dev = "${libdir}/libblktap.so"
 
+FILES_${PN}-libxencall = "${libdir}/libxencall.so.*"
+FILES_${PN}-libxencall-dev = "${libdir}/libxencall.so"
+
+FILES_${PN}-libxenevtchn = "${libdir}/libxenevtchn.so.*"
+FILES_${PN}-libxenevtchn-dev = "${libdir}/libxenevtchn.so"
+
+FILES_${PN}-libxenforeignmemory = "${libdir}/libxenforeignmemory.so.*"
+FILES_${PN}-libxenforeignmemory-dev = "${libdir}/libxenforeignmemory.so"
+
 FILES_${PN}-libfsimage = "${libdir}/libfsimage.so.*"
 FILES_${PN}-libfsimage-dev = "${libdir}/libfsimage.so"
 
+FILES_${PN}-libxengnttab = "${libdir}/libxengnttab.so.*"
+FILES_${PN}-libxengnttab-dev = "${libdir}/libxengnttab.so"
+
+FILES_${PN}-libxentoollog = "${libdir}/libxentoollog.so.*"
+FILES_${PN}-libxentoollog-dev = "${libdir}/libxentoollog.so"
+
 FILES_${PN}-fsimage = "${libdir}/fs/*/*fsimage.so"
 
 FILES_${PN}-hypervisor = "\
-- 
1.9.1


