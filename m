Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00895E00BFF; Tue, 26 Jan 2016 11:10:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f195.google.com (mail-yk0-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C5B6E00C09
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:52 -0800 (PST)
Received: by mail-yk0-f195.google.com with SMTP id y10so15711631ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dI8vj6qT0PnQvbmo9YpUuRvbw+Relf/WwwCg4lHn/h0=;
	b=Ikb7IEhy+lSuVvK+TOQKpIExalHXg9awNZttJ2mdGOoj4YH+bs+9V6a3j2bS56uHMx
	fHxfRbjOSDLn/5w9IxUnGCEOjSd5x/MzG/g5AWYg5zlIpuf6ugI2vQrZLB0H2emLQRgU
	aY0XGqDus4PjCBhpa4J5hoKYSUZEhI/QLlXbAHw/Xn8kasfrdab8wGG4AD9kS5ORt8Uf
	FPxZYY8ybW3BklVcJ1yEbD0LZtZ2qL5QuLD5lY1PjCYxzspVoHrVJhD+hY39fjlxNH/U
	ffVDgQkJlOZfRk92DnGTu4KwjLgRzqYBE+efYoVfqjp2DtKYuJRCoo9QJUxjl4iJQGZO
	B9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dI8vj6qT0PnQvbmo9YpUuRvbw+Relf/WwwCg4lHn/h0=;
	b=IV/foejAE7isZdBNhyI5Lt1n8mDSvwMkSJjTTTFjElFPxIyBG2BKyTtHz4JUvb7+qR
	MjWIHXpolKA4GxnH77zC9EFXflraVmYBg7t5fS103dI+Za/qkqQQ9rVthP7KiIzI/k6d
	cbZwEqqjzfBZtOw2Do1wT0hEkngejb4JX13A0Lf8gct1u3VbvC+UKcd36+9siqnhy8tr
	OehTofoo7ZT3/DSFTNBZH3gCQngaDo7s4br0/pQIY56YfbLcIHRp9QFOFvLuAVgjL5S0
	W+RV6h5GDVRDVf1Zm1MYEUDh6rPnH0hG5BzlasBun0Yd9D3U89s0ZRP26PUaguXmtThj
	Zz9A==
X-Gm-Message-State: AG10YORXHgpJFkysYqdaOvBc3bn9RjEfK03iPdPZDWs+dtzQGD63mpDuxG4Rj4Hv5Ko6dQ==
X-Received: by 10.129.88.215 with SMTP id m206mr13526122ywb.78.1453835391874; 
	Tue, 26 Jan 2016 11:09:51 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	h187sm1899502ywc.0.2016.01.26.11.09.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:09:50 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Jan 2016 13:09:22 -0600
Message-Id: <1453835364-6473-7-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH v2 6/8] xen: merge do_install_append to do_install
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
X-List-Received-Date: Tue, 26 Jan 2016 19:10:05 -0000

The do_install_append is necessary for the git build as well so just
merge that into the main include.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc      |  8 ++++++++
 recipes-extended/xen/xen_4.6.0.bb | 10 ----------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index a46421b..beb255c 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -828,6 +828,14 @@ do_install() {
             echo "d $i 0755 root root - -"  >> ${D}${sysconfdir}/tmpfiles.d/xen.conf
         done
     fi
+
+    # fixup default path to qemu-system-i386
+    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
+
+    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service ]; then
+        sed -i 's#ExecStart=.*qemu-system-i386\(.*\)$#ExecStart=/usr/bin/qemu-system-i386\1#' \
+            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service
+    fi
 }
 
 pkg_postinst_${PN}-volatiles() {
diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/xen_4.6.0.bb
index 93c6d2e..0391dbd 100644
--- a/recipes-extended/xen/xen_4.6.0.bb
+++ b/recipes-extended/xen/xen_4.6.0.bb
@@ -9,13 +9,3 @@ SRC_URI[md5sum] = "48e232f90927c08326a7b52bb06f49bc"
 SRC_URI[sha256sum] = "6fa1c2431df55aa5950d248e6093b8c8c0f11c357a0adbd348a2186478e80909"
 
 S = "${WORKDIR}/xen-${PV}"
-
-do_install_append() {
-    # fixup default path to qemu-system-i386
-    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
-
-    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service ]; then
-        sed -i 's#ExecStart=.*qemu-system-i386\(.*\)$#ExecStart=/usr/bin/qemu-system-i386\1#' \
-            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service
-    fi
-}
-- 
2.4.10


