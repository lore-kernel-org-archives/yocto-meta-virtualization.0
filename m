Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DC59E009F0; Thu,  5 Jan 2017 09:32:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.177 listed in dnsbl.sorbs.net]
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2417EE009D7
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Jan 2017 09:32:16 -0800 (PST)
Received: by mail-io0-f177.google.com with SMTP id f103so16104517ioi.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Jan 2017 09:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Pl1kQ/S733zJxXL2LAWtj7SBWpQXQRGHQ6YMOCR4B3c=;
	b=HilZSQcmwspRvWhVFllDBfoR6UbCmcG4WStRDKs1LWEs4CyGwQJofT+LMRw1Xf5IQn
	VKebeyOlr1VQVJK7Kfv5VKDrkZZl0Z06pierC0ti5xhS1zd3u93qahfXCg/YMwNabCcd
	sw8kKZ2NDDBTN3ReeWU/qvCpZxWKEJ79iOpdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Pl1kQ/S733zJxXL2LAWtj7SBWpQXQRGHQ6YMOCR4B3c=;
	b=R0IKm2vR6nljqF3dlkms7iPSTyCH147IiXqgheCEyTuQWkE0ngWGNZSon0JCmvnXgZ
	GJukBk9jv3y2pUTvf1ll9Jh0HNnbOPqCnVuVQZ4shloaCd2tX/KJ4MMnIJ4U2Ksr2uKU
	Hb/p1Qc7aV1rcmXmdnfEs00wLV9OrzxzQqAVMRAEJz2IqTBpT3rJyBOCwwqGNGV7ze7m
	kGqlIJ4rv3G3y10m4+jOliCKhcYpM2V2bb7AvZpk28yKKRuLe/6KbAa/pCWHoHuUnIQy
	LdnjjY/YvuBCi19Rub8pW+VVlDdrSSfQCCuGe94rDPJUZ41qJ6ZIOOcCKP2LWVinX1ME
	r+DA==
X-Gm-Message-State: AIkVDXITNpjqMkbt2ype5topGk1pgJzc1ebqUg6SZ/cQNMc2vTNdtzwkCxpB60tEfmdC7w==
X-Received: by 10.107.175.221 with SMTP id p90mr60354964ioo.80.1483637536126; 
	Thu, 05 Jan 2017 09:32:16 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	w143sm36413983itc.0.2017.01.05.09.32.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 09:32:15 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Jan 2017 11:32:13 -0600
Message-Id: <20170105173213.1815-1-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170105170523.1318-1-cardoe@cardoe.com>
References: <20170105170523.1318-1-cardoe@cardoe.com>
Subject: [PATCH] xen: add a README to provide info for users
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
X-List-Received-Date: Thu, 05 Jan 2017 17:32:19 -0000

Provided some basic documentation on how to use the xen recipe properly.
---
 recipes-extended/xen/README | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-extended/xen/README

diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
new file mode 100644
index 0000000..3686530
--- /dev/null
+++ b/recipes-extended/xen/README
@@ -0,0 +1,24 @@
+Xen
+---
+
+For any issues with the xen recipes please make sure you CC cardoe@gentoo.org
+
+configuring the hypervisor
+--------------------------
+
+Since 4.7.0 Xen supports using Kconfig to configure the hypervisor. Similarly
+to how the recipe for busybox works, you can provide a .config as a defconfig
+to override the default configuration of the hypervisor. The easiest way
+for you to take advantage of this is to create a .config for Xen and then
+copy it to your Yocto layer as 'defconfig' inside of
+'recipes-extended/xen/files/' and then create a bbappend adding
+'file://defconfig' to your SRC_URI.
+
+security patches
+----------------
+
+The base recipe does not include security fixes that the Xen community releases
+as XSAs (http://xenbits.xen.org/xsa/). The easiest way to include those is to
+drop patches in 'recipes-extened/xen/files' and create a bbappend adding those
+patches to SRC_URI and they will be applied. Alternatively, you can override
+the SRC_URI to a git repo you provide that contains the patches.
-- 
2.10.2


