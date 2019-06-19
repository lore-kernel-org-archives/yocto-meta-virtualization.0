Return-Path: <bostancioglucevat@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7C17E00DBD; Wed, 19 Jun 2019 11:00:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bostancioglucevat[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.221.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FB9CE00DA7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Jun 2019 11:00:23 -0700 (PDT)
Received: by mail-wr1-f67.google.com with SMTP id f9so165416wre.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Jun 2019 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=x0CGXxzQU9PBuw2m3TvIgONUSX4Qtdbeq41/NnX9a7M=;
	b=uEpZfHLkx93xlla/RinvL5wtOl2bq5DffxaZz6be3ejYB0MDafx0zI2tpudc1m97d+
	ErL1agCxKA7/SGQSVfROxLbZc5frAwiiswX698AwsTIv5lKNlvQ4WW69qPUR3a9wGZ2D
	rm02UofOFwo7qH9hdF/gqs17YHE5ZGIz1p0Aiwerl3rh9QMCe7TgyntpRmVEwDqY87u1
	7JSByQHiFdB20m2b2k8kokrs9GrzBXcggKaVDYSFcbHtFY/tETY0uoTWqT/5jRFmoYgM
	ONWqSJNugN3l6nbdsxfVvPlFJ97NUzEzkOrcdHqbMhvBDO1V/tKel0Hduu5xg0DEknEj
	96/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x0CGXxzQU9PBuw2m3TvIgONUSX4Qtdbeq41/NnX9a7M=;
	b=OIHHnrAVN37pVGyNDR5xACKqoKQUujac0Uahm7B2NLMz/ank/+C6nN7bfkLjL+O93G
	H29wupQxgiHymbUAbd5XluY/nnSwkDwJRD26jg+gIq9krcZK5qaaWnbYN3JWBaH7+Tkd
	wYsUAHRSk6M65Wf92YCD26N5QTv9WMg9IAukq3jPUzr+Dmkt3IF38K9BbgqdOkhTGmDf
	pEAdIkOaKLReIKO5NJ/NoBQCyRbnFUPUmqIbSzyTHasHlTizTVPRV2/ZYz++mwTelkZf
	sJio9co+NJpOGip6fWiB6FNOg5pcF95KHA1sxpCeO7qNFTuUlP6bGufzzgQeauR4TeIR
	07ng==
X-Gm-Message-State: APjAAAXIq69g2ogL+ND1ERysGsKRDkq+k4qddWpo0GaDYJrgiBMoj5U+
	NJkEoH9GZVzqR6gGdVTQgw46HtXd
X-Google-Smtp-Source: APXvYqy6mIQv9wfUqi6wT/GXcAC3jvt+ZtI+jISGKDUtNUWIjwLh2wtxPC7YH4Byt3F3eR973FfBVg==
X-Received: by 2002:adf:9cd0:: with SMTP id h16mr4895104wre.211.1560967222454; 
	Wed, 19 Jun 2019 11:00:22 -0700 (PDT)
Received: from localhost.localdomain ([95.15.222.74])
	by smtp.gmail.com with ESMTPSA id h8sm2569271wmf.12.2019.06.19.11.00.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Jun 2019 11:00:21 -0700 (PDT)
From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 19 Jun 2019 21:00:16 +0300
Message-Id: <1560967216-4994-1-git-send-email-bostancioglucevat@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kvmtool: Werror Disabled Patch
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
X-List-Received-Date: Wed, 19 Jun 2019 18:00:24 -0000

Couple of compile time warnings(sizeof-pointer-memaccess, format-truncation) turned into errors before with Werror command, this patch disables this feature.
---
 .../files/0003-kvmtool-Werror-disabled.patch       | 24 ++++++++++++++++++++++
 recipes-extended/kvmtool/kvmtool.bb                |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch

diff --git a/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
new file mode 100644
index 0000000..4d2f255
--- /dev/null
+++ b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
@@ -0,0 +1,24 @@
+From 377a09c16003eaa40f7f337127b10728ee0ade35 Mon Sep 17 00:00:00 2001
+From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
+Date: Wed, 19 Jun 2019 20:36:56 +0300
+Subject: [PATCH] WERROR override disabled.
+
+WERROR override causes gcc sizeof-pointer-memaccess,  format-truncation errors.
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 030ff4e..fc5e177 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,6 +2,7 @@
+ # Define WERROR=0 to disable -Werror.
+ #
+ 
++WERROR = 0
+ ifeq ($(strip $(V)),)
+ 	E = @echo
+ 	Q = @
+-- 
+2.7.4
diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
index d487ee2..004e09e 100644
--- a/recipes-extended/kvmtool/kvmtool.bb
+++ b/recipes-extended/kvmtool/kvmtool.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
            file://0001-Avoid-pointers-for-address-of-packed-members.patch \
            file://0001-kvmtool-9p-fixed-compilation-error.patch \
            file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
+           file://0003-kvmtool-Werror-disabled.patch \
            "
 
 SRCREV = "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
-- 
2.7.4


