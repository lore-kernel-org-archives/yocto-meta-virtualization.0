Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 492CFE015EE; Wed, 13 Jun 2018 18:43:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3D3DE00CED
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Jun 2018 18:43:30 -0700 (PDT)
Received: by mail-qt0-f195.google.com with SMTP id l33-v6so4360609qta.11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Jun 2018 18:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DU/fCU6cdhU7A0dKbd4mtgCvHugfhHJ/2qg7cncB4qQ=;
	b=sL33FX7Gjd4HdGQ/a/QESNGLdBitWVDPUXBqBQsCj6F94nzh7tEfkw7Rv79GWP+HHb
	bvMHjNzicJf/hzrqBhYEf0rF+3/thhNVAj7XKIrXFn1CZfel736mg9T+sLNXlBN4GgP7
	BQbYbdaagM+977hIJV3Av/ftT/OpCcXpYTwJFNHXy7CyP7gom9eKVLXdpcSnaUmMol+l
	bbjy2snncbO7o2GP6VWEygdUjujfv3JazOWQb0rflDSjz59mgeSRDOcMKj+iv5qufTCu
	fefQlkfz8t0GR2lPh4shLXhL5qPJ6PCBEFmbqSMM3zhBgKC44jExUknH0XnrlG3vNiWE
	HTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DU/fCU6cdhU7A0dKbd4mtgCvHugfhHJ/2qg7cncB4qQ=;
	b=tDACwqI1GXAOjya4UEwO33g+hPsjnHYvkE9bkpbO+RwOIiwd1Gu9LSn/dGvocVmoRh
	vz+KrBeFWbSsOkNexvPL1xQkHiCoOqiZF+d+f6/Y3PGFyZmWH/OZhdk0hJBf6pAj6Aqx
	EKvsRJA+XJFbpTxldhTL3whduFWLcOmxDnQ0Eb8HeUa1BXJY+XML3VW5L/LXGJj6oRSb
	Yv7B3w9aAMTpV4oV88i+RMsKSsja/eJ9qY6ojt8yYaifZ2f8VAbm5FjNCjrmD6HCaLNJ
	S2rtaEbKq0ti9Mbr+1i+M/Ccpc0WfQ/4N3sZ2Ot2ymGFPu+R5KUdb03/dcgcNIO1auw7
	7qfg==
X-Gm-Message-State: APt69E0fPWyM/7WX3n6Ihk7cHl/9EsY9Q4GBkqU0/eht/IFazW3mdblD
	vXgOM3Uc35R6miPKXeMkOda5L7aXbg==
X-Google-Smtp-Source: ADUXVKIxewFsJZnEPMWbwc8AasEQ/KuiFMkf8xMT2+LcyVC+iJIdx918rNS0I4Bi5uypAMZt0bLGBg==
X-Received: by 2002:ac8:701d:: with SMTP id x29-v6mr521098qtm.98.1528940609574;
	Wed, 13 Jun 2018 18:43:29 -0700 (PDT)
Received: from localhost.localdomain ([189.4.98.150])
	by smtp.gmail.com with ESMTPSA id
	34-v6sm3715766qtt.76.2018.06.13.18.43.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jun 2018 18:43:28 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 13 Jun 2018 20:54:43 -0300
Message-Id: <1528934083-8907-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] tini: fix license
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
X-List-Received-Date: Thu, 14 Jun 2018 01:43:31 -0000

tini is licensed under the MIT license instead of Apache-2.0.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 recipes-containers/tini/tini_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/tini/tini_0.18.0.bb b/recipes-containers/tini/tini_0.18.0.bb
index 7c124a8..373d886 100644
--- a/recipes-containers/tini/tini_0.18.0.bb
+++ b/recipes-containers/tini/tini_0.18.0.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
   file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch \
   "
 
-LICENSE = "Apache-2.0"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffc9091894702bc5dcf4cc0085561ef5"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


