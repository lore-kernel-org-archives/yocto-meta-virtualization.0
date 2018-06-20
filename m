Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6CFAEE01BBB; Wed, 20 Jun 2018 11:47:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4351E01287
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Jun 2018 11:47:02 -0700 (PDT)
Received: by mail-qt0-f170.google.com with SMTP id x34-v6so575619qtk.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Jun 2018 11:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=i8pgONwsgxLVrvWQv/0ym0eG6pIztSofLUC12msIAxk=;
	b=mAdAz42GwM7IAUmws8DiE0P8Ez/M4x0e3C4ecGuViEXOH5h2/WBQUzTTIG2oeuPSeo
	JBx5BEXercMxYClIiXkBFVCVEFKqGceSsW7UxY56V3lwBRtfi0+RhkaJgr/jpVfB42zc
	VbgjN75oLDha2lIZcLdZoi3wETGcKIhKQGw4wlwr3QnQkOE7izxip9ZO0QVAN50iSRJo
	F3OUtgwFTlMzHpEw4kzhhV8MTdXBV2t30Ky5qbNerBTffQr8mEKsjJgaaGh0AXShEZdo
	Nh33quEkZUxtzmR8sbaQJRZfiHX9h2NUh3YEbzRozcxAraayEjBSKBz84BXNDCxl8gUd
	4odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=i8pgONwsgxLVrvWQv/0ym0eG6pIztSofLUC12msIAxk=;
	b=Ajz3Oxg9QvRl7zTh5RpbjMD7Jsut/tBMSDJLDt1pEdI0UK1MQUFmvTCAg+7ePJjUGx
	lbgRgd2hNCOvyUbk1nen3v8J6nSVNKQCGWSKkZSExsac1IFH/BcUH9yYNcaAvEz1RO9o
	fsMhs6PaP4b3AtUUgLSqZLXVuTx26sSmWX9manTp3i9RtAFSJSm86Eub1ql6iEpkUmox
	XGjngmamU0KcQD+QC2Yji0Tsype5CgYUc1R0gAHnC/zurivfPd7MJDOJFFo9FmBLISYh
	rW6ZNs3878f9Rwf84oagqeKgj2hhKGFwEp+6MnGolFUpZaBXO+Zvgr6qmP2MOFXEBvuL
	fUlw==
X-Gm-Message-State: APt69E0pEEUwByP3gTMJNMgsc+u1ATbESFK+VSHQ6IGx1vAI33CmEVx8
	40M+vPhf3/moPUOX1tLbHVeW+/Fkhg==
X-Google-Smtp-Source: ADUXVKIvOF20k82f7OmewGlCoIwgQtNciAutO+a9Q1UkXH2uiOUZtzYFevNub9BehFmx4IVStBgSDQ==
X-Received: by 2002:aed:354f:: with SMTP id
	b15-v6mr1691299qte.327.1529520421835; 
	Wed, 20 Jun 2018 11:47:01 -0700 (PDT)
Received: from localhost.localdomain ([189.4.98.150])
	by smtp.gmail.com with ESMTPSA id
	a12-v6sm1823192qtk.57.2018.06.20.11.46.59
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jun 2018 11:47:00 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 20 Jun 2018 15:46:54 -0300
Message-Id: <1529520415-13251-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] python3-docker-pycreds: update to 0.3.0
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
X-List-Received-Date: Wed, 20 Jun 2018 18:47:03 -0000

Update python3-docker-pycreds from 0.2.1 to 0.3.0.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 ...ocker-pycreds_0.2.1.bb => python3-docker-pycreds_0.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-docker-pycreds_0.2.1.bb => python3-docker-pycreds_0.3.0.bb} (63%)

diff --git a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb b/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
similarity index 63%
rename from recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
rename to recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
index 4038410..4d39f52 100644
--- a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
+++ b/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "0d80d5aebab771faf7e422b759c3055b"
-SRC_URI[sha256sum] = "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
+SRC_URI[md5sum] = "2370ea3b62198b788a26231ab58844af"
+SRC_URI[sha256sum] = "8b0e956c8d206f832b06aa93a710ba2c3bcbacb5a314449c040b0b814355bbff"
-- 
2.17.1


