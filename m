Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DFB5E00E1F; Mon,  8 Jan 2018 23:13:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1D35E00E1F
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Jan 2018 23:13:02 -0800 (PST)
Received: by mail-io0-f196.google.com with SMTP id f6so17448409ioh.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 08 Jan 2018 23:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YjP/i+0t5VBmz6rhQVDqON+ZmnfVkO6xfIzNzdJStrY=;
	b=fNS6W/AYjfXyCB3pZ92B9y4T5mtumvFUmerNeXwlGcyXSVLHf2+Wi5ovFfc3eJ6tkM
	8VrucPeEEQrcbHSL1f3UefnAHj7AlFE0RTSUNLNhCti8SdH+MTvZmG8AxvteVxuWTpSy
	1F6bLuy3y/AbJMMJYH86epnQU4ZgSSxSQd5pQGYFuzqZ0mqsOtZFelvfEyPIp3aMrjMj
	L5MvkiykSq4AHBHm1JDGVTQj4XmMOGOEThWBr6mRO1vpUPDf6xNYQxl0Q4reQ9M6RwWr
	9+bLzAcOQF+0KbCjyh2CLYdOv/ZmyfZOjlMzIAJeK/eDvmQO6quU/7KCpKgQSInY0X5K
	0hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YjP/i+0t5VBmz6rhQVDqON+ZmnfVkO6xfIzNzdJStrY=;
	b=Yls+FNpfhq31MiNJ52TfF3t+ItsPoTh+QnmkZQUWMjpi7dP5l7y8v/ZD4hDgp+oMyD
	RMyZMSsaRcElKZXweMIFnd7QbAsbgLnECVIKdPzigIZ1rY/OyVnAD19nVPt2g+Cee64N
	J3+U60QOFGBMjVIS1jeenJumbFlcA4ynp0Q4i5iHKsgnI9CS1xIDXTjOG1EEDmxYA9AZ
	QEUDrLe7CandrpTZ5Tuk7ud6SYlZXHUT7m4U10fa/ePzFmPd6riOVg4CIgwSnbG0FP5H
	hYNC/MLBnP+dN5h0F0t+bKOUG3iZ4iX1JyYbuKgy8k0K7U0JR5UUnPyPkqPQ9xP00+u4
	/AiQ==
X-Gm-Message-State: AKwxytf1pq9iHUKr9nCgYhkxlp//GX2ZzEIylfirUqCQiU3U4FztKx1M
	DZI2RJSZg29Atk5049RNnNx7vo8m
X-Google-Smtp-Source: ACJfBosC7LGvzS1eta0Awphhc+MvjZ4Nghp96Ri8cy7VPuFedC1h/GJ/RDlyZDw8Mb1E4DOEYrDTwg==
X-Received: by 10.107.35.75 with SMTP id j72mr13439982ioj.26.1515481982066;
	Mon, 08 Jan 2018 23:13:02 -0800 (PST)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	y64sm7725921ioy.25.2018.01.08.23.13.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jan 2018 23:13:01 -0800 (PST)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon,  8 Jan 2018 23:12:47 -0800
Message-Id: <1515481968-4085-5-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
References: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 4/5] xen: add recipe for Xen 4.10.0
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
X-List-Received-Date: Tue, 09 Jan 2018 07:13:05 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Introduce the recipe for Xen 4.10.0.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen_4.10.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-extended/xen/xen_4.10.0.bb

diff --git a/recipes-extended/xen/xen_4.10.0.bb b/recipes-extended/xen/xen_4.10.0.bb
new file mode 100644
index 0000000..1e14c86
--- /dev/null
+++ b/recipes-extended/xen/xen_4.10.0.bb
@@ -0,0 +1,10 @@
+require xen.inc
+
+SRC_URI = " \
+    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
+    "
+
+SRC_URI[md5sum] = "ab9d320d02cb40f6b40506aed1a38d58"
+SRC_URI[sha256sum] = "0262a7023f8b12bcacfb0b25e69b2a63291f944f7683d54d8f33d4b2ca556844"
+
+S = "${WORKDIR}/xen-${PV}"
-- 
2.7.4


