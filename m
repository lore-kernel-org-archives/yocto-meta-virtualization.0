Return-Path: <minipada@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D65FE00C89; Wed, 21 Nov 2018 04:55:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (minipada[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.48 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDF0AE00C74
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 04:55:17 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id y139so5369748wmc.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 04:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lwxEyJluq3qIoa/W3FNUZ7yhpIVPUB/NCGqhyHjnpf8=;
	b=lkmPWxELHmKpy7d6za1rJ0iVGbYsmF/KthjGLnB18w2zqqBUuvBXzAJs07iEyt2erJ
	O4zDlO+uGh3wDUacbGQ/YeAOVLPqEivHYpLDDcm1ZNPAYhQSvNb6yc/EXNCuveTyDj9O
	kdPfGUh60goaHlhbbBW44DLye/kbf9bLUKruTJtsnZssIxGngIRBoQV5KwP0Jl//k0WK
	QSGSPyO/BeD90Ts8tDMVEHb0guTvJUnUTwq5lIHOR6oyjnyFNEzOL3DP3TW99uxHVp6J
	l3cMYYp0KzGtTAqZRvR4pTllt7MyqJ+Hm1XlJiscso41lzYlc2CHw2+fefE7Mu0q26Uq
	B5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lwxEyJluq3qIoa/W3FNUZ7yhpIVPUB/NCGqhyHjnpf8=;
	b=e5txRclShc8Aiy9i/rgcGm3csrogfMwNjubwPcJ8+vVD1sbPDBS3iVVM4WljkqH7Q3
	aUwYJCVCDEVgKrpy/pa6aLhMCyKcjeLZvaT9BgO2hZJ+wG1KIqb/LozW+UtemgSJ1Sov
	Yk+XiI71d/TRlDQLNz8T9qhr2wEqnm8mRLlIKm00w422S1b5F+XnvNMzOI+Y1Bj8xszI
	B4LSZ6MOgxM1sXcoPRF4NCGHUMzc7rXSX4NsE4GcJxEeJF9U5ZTC79ms4y+xc0p4XNPo
	8cB9BcNWaghIplXdmj3xTfg1X74VeEmK+L9zrlcIDZcA1WhstERaqm1OsjN+wKU6051i
	nU7w==
X-Gm-Message-State: AGRZ1gJCSieQUfn5Q3ZsZG+b/eJIcS0PFwKUSrjhOXxyASndvnbg5Og0
	xWJklFOKam6Dyq5p7vLh9DXXHC9yPQ==
X-Google-Smtp-Source: AJdET5dK17R/XBSDaFuoKsT1md2m9N8IGG+5FnqeZr1AabRaBr0rHUvtgapjnzSiUMwhuGoQlAssng==
X-Received: by 2002:a1c:ef08:: with SMTP id n8mr6095413wmh.114.1542804916526; 
	Wed, 21 Nov 2018 04:55:16 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2e22:8250:f173:d7b9:49f1:5ede])
	by smtp.gmail.com with ESMTPSA id
	125-v6sm894799wmm.25.2018.11.21.04.55.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Nov 2018 04:55:15 -0800 (PST)
From: David Bensoussan <minipada@gmail.com>
X-Google-Original-From: David Bensoussan <dbensoussan@synapticon.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 21 Nov 2018 13:55:12 +0100
Message-Id: <1542804913-7458-1-git-send-email-dbensoussan@synapticon.com>
X-Mailer: git-send-email 2.7.4
Cc: David Bensoussan <dbensoussan@synapticon.com>
Subject: [PATCH 1/2] python-docker: Add recipe for python2
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
X-List-Received-Date: Wed, 21 Nov 2018 12:55:19 -0000

This has been copied from the python3 recipe
---
 recipes-devtools/python/python-docker_2.5.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-devtools/python/python-docker_2.5.1.bb

diff --git a/recipes-devtools/python/python-docker_2.5.1.bb b/recipes-devtools/python/python-docker_2.5.1.bb
new file mode 100644
index 0000000..c0f3c89
--- /dev/null
+++ b/recipes-devtools/python/python-docker_2.5.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A Python library for the Docker Engine API."
+HOMEPAGE = "https://github.com/docker/docker-py"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
+SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
+
+DEPENDS += "${PYTHON_PN}-pip-native"
+
+RDEPENDS_${PN} += " \
+	python-backports-ssl \
+	python-docker-pycreds \
+	python-requests \
+	python-websocket-client \
+"
-- 
2.7.4


