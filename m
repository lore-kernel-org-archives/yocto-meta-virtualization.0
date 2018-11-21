Return-Path: <minipada@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4C17E00CAA; Wed, 21 Nov 2018 04:55:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (minipada[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74A1CE00C93
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 04:55:20 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id w7-v6so5394951wmc.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 04:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=toO7y/AeybsL/V1RqnG+LGlCcxDCOygMMGUXIlDns2A=;
	b=f+HKMcR3X6ZN5Ju/2JAR5RV+761BdVOUx22yzVQmTNYKTQb5QQrxRYafhNYafqdNrQ
	qxUhyP7LsSbsbp85FlojqqlNLJTAiR/KurvvsWmfkXJw2q0ZvfUg9hjeBNdEcaHWegaa
	ejlu2rmoEaKXv3nQ3zt3fkf8+oAtDBjSNkpsddOzOzj+ltYoVYRe21oRBpQWit41BFN+
	M/I8voz6k6ByuR/iRq7CmhPOFeyKiBRXKpyP9X/8x3VKVifczI+9OxL4Anm2/KNoHe8Z
	eG9H3rhdtBV1SV3faeIPtPwFIcSr8qykzkU+UWvPEnpzE+cux67p+y5PmjhEuo1sySHU
	sRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=toO7y/AeybsL/V1RqnG+LGlCcxDCOygMMGUXIlDns2A=;
	b=uMnm2xTNoUeYEDAjtEoiXDNMgxCH7ebWImXIoNYClES7qjrqhOw2E2ZVW6UQJ+JuFQ
	6cF6HOfuUX7GAq8TLSW6XH0tul9dcbiTf9LsbsEHTi1vKVcQu5UBvG7bgRSpKhn5/Tcu
	rw///gcq0XQioiOgVoVnoQpfk/fL8JY29+J+HiZoOOkk9M/2TTN4psWNgJ0pCQ3oURVi
	JtqwGkYQLi7MOE9lM0ZkDXTkIeXmxAQAL2u4WeKSJmmygX1qB9+INV7hfkoTBXyvJemY
	j+MpqE2UeS6EJQBgwFsyHSRNJibT5OUNpG6hyazNsPcWsJsGV/ZCBvzqfyHLaLCEBrMW
	n87A==
X-Gm-Message-State: AGRZ1gK3Gf/IzR7Q9gTjO4T2IrDwoFMy+/ZYXxehItUjkaJBAOVyFxa/
	WYxXfXDhwNTCGsdmNckyHZwt3mMjmg==
X-Google-Smtp-Source: AFSGD/UuMqXKicXz8eolS2VtwxMMEoLgCMLX132Zz/6GqGCAHND8IE8nRKzEUXv9uNIBU583JuDdMQ==
X-Received: by 2002:a7b:c443:: with SMTP id l3mr5990125wmi.74.1542804919155;
	Wed, 21 Nov 2018 04:55:19 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2e22:8250:f173:d7b9:49f1:5ede])
	by smtp.gmail.com with ESMTPSA id
	125-v6sm894799wmm.25.2018.11.21.04.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Nov 2018 04:55:18 -0800 (PST)
From: David Bensoussan <minipada@gmail.com>
X-Google-Original-From: David Bensoussan <dbensoussan@synapticon.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 21 Nov 2018 13:55:13 +0100
Message-Id: <1542804913-7458-2-git-send-email-dbensoussan@synapticon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542804913-7458-1-git-send-email-dbensoussan@synapticon.com>
References: <1542804913-7458-1-git-send-email-dbensoussan@synapticon.com>
Cc: David Bensoussan <dbensoussan@synapticon.com>
Subject: [PATCH 2/2] python-docker-pycreds: Add recipe for python2
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
X-List-Received-Date: Wed, 21 Nov 2018 12:55:20 -0000

This has been copied from the python3 recipe
---
 recipes-devtools/python/python-docker-pycreds_0.2.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-devtools/python/python-docker-pycreds_0.2.1.bb

diff --git a/recipes-devtools/python/python-docker-pycreds_0.2.1.bb b/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
new file mode 100644
index 0000000..69791fa
--- /dev/null
+++ b/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python bindings for the docker credentials store API"
+HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "0d80d5aebab771faf7e422b759c3055b"
+SRC_URI[sha256sum] = "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
-- 
2.7.4


