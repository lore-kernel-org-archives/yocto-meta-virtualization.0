Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F6E1E0163A; Wed, 18 Jul 2018 15:04:06 -0700 (PDT)
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
	*      [209.85.160.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD677E015E8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:02 -0700 (PDT)
Received: by mail-pl0-f68.google.com with SMTP id f6-v6so2639117plo.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RUWxqUVgkHZ5yLNFuCC5CNEbqwSIL7MZQSuVarwqq08=;
	b=rafAiha7DStKZ1YS2xmKAYTErq8lexZKNWYEfuZB0Zdy0uUH21C08Tjjrg9MJMSS/8
	iZ8ol2P/Frdi7aYSfSOMeaI4C+PpRthYEwv2xjOlAv6Zd6czKEPEYkNNrgecjFK6VJQE
	GgDbGL4nXazGnSlUO9dW6dKg2rjliMgFlvrHdRzxucNbU+JEO/aoFd+apVsWbNYIr0bl
	Y64sntpZzJIEMLE60RxbY9SIv/0VTbK7dED4EE/OST/U/C6g4K2bi5IfotTY0jVS5kG/
	oiNlFr+ixGxy3iJoDyhMsM3eFwXRDeeBhOamWb0fglWGtetC7BT6V0J4gkmTGqBXsieB
	Xl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RUWxqUVgkHZ5yLNFuCC5CNEbqwSIL7MZQSuVarwqq08=;
	b=h6EB+BnuKRy6UlGStEC5D3lI9VBGoBDuvYss0EHgAei7P8vZA6CzcxQtMFFzjaf9bB
	HpBpHKRTX5kuIdHHCMu3I1ZqZt+i2Ek3M1f47ayv8nQJKCRGFhv6lQdaH6Rd47CsimNI
	UFGE0Er8mSCdY6nEBm4m6+sp9ZAVsh0aBkYqnt7t4vBll81yUlIH5Va4kZ/dyYs0GN6E
	yuQWMpxpJkWmzLB1lpJEotvH76znHhBBEaz3IqtcqlmbHZUIqLR8yg0D3BZa0Pf8XpUf
	GzvY7V7MH3PJ9bKDutprFXZVG9X/jMCJ9jzM+h3tq1CXKaTyrcg60EREc2kJ2SndVQ2z
	PQmw==
X-Gm-Message-State: AOUpUlEBEGXKoNKr/KEdm3+FPUJxF2aIj7dXhtxr24VgMSXLkbOmVOPF
	sigTaxk6FI3o366Rag8wrBuCBTtZ
X-Google-Smtp-Source: AAOMgpc3t8KTvHaJyxKhXtL7rl4aVGMFv8I8PQxlr8L0U83WezKDx+rd1mt1Q9crC2/l3P7uR0j2RQ==
X-Received: by 2002:a17:902:18a:: with SMTP id
	b10-v6mr7692592plb.62.1531951442138; 
	Wed, 18 Jul 2018 15:04:02 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	h7-v6sm19341965pfd.155.2018.07.18.15.04.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jul 2018 15:04:00 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 18 Jul 2018 15:03:44 -0700
Message-Id: <1531951428-28983-4-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
References: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 3/7] tpm-emulator: apply patch to fix memcmp defect found by gcc
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
X-List-Received-Date: Wed, 18 Jul 2018 22:04:06 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

| tpm_emulator-0.7.4/tpm/tpm_deprecated.c:437:7:
| error: 'memcmp' reading 20 bytes from a region of size 8
| [-Werror=stringop-overflow=]

|    if (memcmp(&b1, &newAuthLink, sizeof(TPM_HMAC))) {
|        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Apply patch from Xen: vtpm_TPM_ChangeAuthAsymFinish.patch

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
Please use my gmail address for any correspondence to me.

 .../xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch  | 28 ++++++++++++++++++++++
 recipes-extended/xen/tpm-emulator_0.7.4.bb         |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 recipes-extended/xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch

diff --git a/recipes-extended/xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch b/recipes-extended/xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch
new file mode 100644
index 0000000..aefca28
--- /dev/null
+++ b/recipes-extended/xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch
@@ -0,0 +1,28 @@
+Patch derived from below Xen changeset.
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+
+commit 22bf5be3237cb482a2ffd772ffd20ce37285eebf
+Author: Olaf Hering <olaf@aepfle.de>
+Date:   Mon Jun 18 14:55:36 2018 +0200
+
+stubdom/vtpm: fix memcmp in TPM_ChangeAuthAsymFinish
+
+gcc8 spotted this error:
+error: 'memcmp' reading 20 bytes from a region of size 8 [-Werror=stringop-overflow=]
+
+Signed-off-by: Olaf Hering <olaf@aepfle.de>
+Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+
+diff --git a/tpm/tpm_deprecated.c b/tpm/tpm_deprecated.c
+index c362b56..4c49f54 100644
+--- a/tpm/tpm_deprecated.c
++++ b/tpm/tpm_deprecated.c
+@@ -434,7 +434,7 @@ TPM_RESULT TPM_ChangeAuthAsymFinish(TPM_KEY_HANDLE parentHandle,
+   tpm_hmac_final(&hmac_ctx, b1.digest);
+   /* 6. The TPM SHALL compare b1 with newAuthLink. The TPM SHALL
+         indicate a failure if the values do not match. */
+-  if (memcmp(&b1, &newAuthLink, sizeof(TPM_HMAC))) {
++  if (memcmp(&b1, newAuthLink, sizeof(TPM_HMAC))) {
+     debug("TPM_ChangeAuthAsymFinish(): newAuthLink value does not match.");
+     return TPM_FAIL;
+   }
diff --git a/recipes-extended/xen/tpm-emulator_0.7.4.bb b/recipes-extended/xen/tpm-emulator_0.7.4.bb
index f626929..96a4090 100644
--- a/recipes-extended/xen/tpm-emulator_0.7.4.bb
+++ b/recipes-extended/xen/tpm-emulator_0.7.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "\
     file://vtpm-deepquote-anyloc.patch \
     file://vtpm-cmake-Wextra.patch \
     file://vtpm-implicit-fallthrough.patch \
+    file://vtpm_TPM_ChangeAuthAsymFinish.patch \
 "
 SRC_URI[tpm-emulator.md5sum] = "e26becb8a6a2b6695f6b3e8097593db8"
 SRC_URI[tpm-emulator.sha256sum] = "4e48ea0d83dd9441cc1af04ab18cd6c961b9fa54d5cbf2c2feee038988dea459"
-- 
2.7.4


