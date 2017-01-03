Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFA08E00905; Mon,  2 Jan 2017 20:48:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52F79E0089B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Jan 2017 20:48:14 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id b66so37246139ywh.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Jan 2017 20:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mF8C23vPooSJWXhCUglQUKaMx0gmrKHkpRV2rGbzTl4=;
	b=C9z+WxLFj4JYDwGDuvcrgIwNl71KEk347bocq6oDXkxwMCOvVU/1snbTZtOoC6D03P
	F/BAEVMZHMEyi6d9cVmj2KGPbZDXE8KtAk++I04xL62+FfmkB7t/xNd6f11yEd1rcDNJ
	ByZ2v9HZ1iLettMXo5deTuaBa/yDic4kl9/eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mF8C23vPooSJWXhCUglQUKaMx0gmrKHkpRV2rGbzTl4=;
	b=h4uJq1D1ebQPAaa/hLWNin8NDTLxkepgMKeN+YFd3zciTN2sQx30QQcqV9PnqlsjEi
	E+dbWz7G7Y90ksn1nx31cC0m/nV4qSZnwy6z8Cp7dojHW3kOPkLMkh5gBBbWJx3N8LJK
	2yISHFjLbkhcdYUjC/PeTuspvRJzurDyYaMHi2RlpIpiHFrOa+JGN5r+LeRT/Yd1/aIb
	5DKgceuXE3sLZ9f/Der30wlJWdLCrKkPrZiY1sZ6qddLW1ZW4SWwU/Geq3Z41NZiWQOl
	QT9SlOqNeUSjO0Rm6YKEvQy79oiRBqOahCby2ENesBbfIyb/s6Ifq3xAzulNxZG17UjP
	pVag==
X-Gm-Message-State: AIkVDXJpWArtIQvNKcWgv12z/yrMdjdonkiu6AcNqLjsW1/kXT5yXsvfimxTaVSmv9ZJcA==
X-Received: by 10.129.131.199 with SMTP id t190mr54438441ywf.261.1483418894326;
	Mon, 02 Jan 2017 20:48:14 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	v1sm16209892ywc.17.2017.01.02.20.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jan 2017 20:48:13 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  2 Jan 2017 22:47:53 -0600
Message-Id: <20170103044754.15012-4-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170103044754.15012-1-cardoe@cardoe.com>
References: <20170103044754.15012-1-cardoe@cardoe.com>
Subject: [meta-virtualization (krogoth)][PATCH 4/5] xen: make it easy to override hypervisor config
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
X-List-Received-Date: Tue, 03 Jan 2017 04:48:15 -0000

The hypervisor is now configured with Kconfig like busybox and the
kernel. This makes Xen behave like the busybox recipe by taking a
defconfig if the user has one provided with a bbappend.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 0d156dc..38922dc 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -841,6 +841,9 @@ do_stubs() {
 
 addtask stubs after do_configure before do_compile
 
+# Allow all hypervisor settings in a defconfig
+EXTRA_OEMAKE += "XEN_CONFIG_EXPERT=y"
+
 do_configure() {
 
     #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done manually
@@ -848,6 +851,11 @@ do_configure() {
         echo "XSM_ENABLE := y" > ${S}/.config
     fi
 
+    if [ -f "${WORKDIR}/defconfig" ]; then
+        cp "${WORKDIR}/defconfig" "${B}/xen/.config" || \
+        bbfatal "Unable to copy defconfig to .config"
+    fi
+
     # do configure
     oe_runconf
 }
-- 
2.10.2


