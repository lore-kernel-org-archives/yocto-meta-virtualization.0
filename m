Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.372.1580336417430272817
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 14:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XkVUHORB;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: jpuhlman@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id q39so441574pjc.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jan 2020 14:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rKsXPSb1MCHUSxHlWtGGWF3EHwQhpie9duWwHbLfV30=;
        b=XkVUHORBZl9uI6Oa+/nqTC/akgD2zaabn8dopLbNGk7bM0jMKytrlQwS0eP/cso0tI
         6LirTFAVaSorPDqmPdEZlqrPCeL+pxheY+zhlUyZ4ttcdTjXeEfY4BzNYO+8VDzPYxIv
         1K4UEAgyv4dSqVOlYrYMQ7QH4bBaNY6+fnjeUZmQUQVFUJsivjktmrtyN4QJz2bkuSxs
         Dt44KBNpukPmmpnDY66I+Cm/lvUdpi3ldMKWrbF/1Hg3C17JCt7c70bIAs+1Ev7FqIB9
         Rycw6XZR34nowk68RFKsBfiOBjfOlBmCZ9iOAo9aw1fjhfXn89+MI8KLA+F0gqmEuc59
         5z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rKsXPSb1MCHUSxHlWtGGWF3EHwQhpie9duWwHbLfV30=;
        b=IAwPzZUMArh4TmVokhmjMoR1RF7t2d0U4KZP1tnRaW/cGzMixGfnAPg1InXpVjsntL
         PurYZI04HSAdhDD6sKrvs+JyMvCKUrP53Dm0gQ0QAQVTw+VDirsnUVt/57jIIPCbC6DC
         KKFC9YDIf/xw+ZKDQhTps2J7Rgmq8xh5fVRhDMXnGGSXM0YE3IAvzLYObUkmTuxMFM4P
         g9Q6OMayJDffMfGqHTIWTWaic+b3Psx4fH7/qEPjiMffZ7eK5OifPDOCDByTOPnAH4TR
         sYffZQCE+O9BgzORtO0ajIEIH6YsEzUCBlaQeT1+kyCUkDRrtytHvD9VmiPCFKSlAylC
         GqCA==
X-Gm-Message-State: APjAAAVRO+sU0XQNjckm1oDWnRdswrKdRhjnxg61d2fWxRXIj7Q4bQmg
	ucE+paaBPYto44J1nI4EA4MlQmEVXQ0=
X-Google-Smtp-Source: APXvYqz1O0sEswiowGqk5QfCzQEsOAcjePKVQk4RFwnHlSTCooTab7L/XaywVkyASQvZV4qXWWAY+w==
X-Received: by 2002:a17:902:d702:: with SMTP id w2mr1538507ply.243.1580336416521;
        Wed, 29 Jan 2020 14:20:16 -0800 (PST)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain ([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
        by smtp.gmail.com with ESMTPSA id m22sm4079539pgn.8.2020.01.29.14.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 14:20:15 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 97FA82A0402; Wed, 29 Jan 2020 14:20:13 -0800 (PST)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [meta-virtualization][PATCH] libvirt: Use python3-native for python install
Date: Wed, 29 Jan 2020 14:20:09 -0800
Message-Id: <20200129222009.2719-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 02fca54..d15500e 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -42,14 +42,14 @@ python __anonymous () {
 do_compile_append() {
 	if [ "${LIBVIRT_PYTHON_ENABLE}" = "1" ]; then
 		cd ${WORKDIR}/${BPN}-python-${PV} && \
-		  ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build
+		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
 	fi
 }
 
 do_install_append() {
 	if [ "${LIBVIRT_PYTHON_ENABLE}" = "1" ]; then
 		cd ${WORKDIR}/${BPN}-python-${PV} && \
-		  ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install \
+		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
                        --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
 	fi
 }
-- 
2.20.1

