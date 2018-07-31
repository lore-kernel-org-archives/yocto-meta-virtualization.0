Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 378D1E00D33; Tue, 31 Jul 2018 12:36:16 -0700 (PDT)
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
	*      [209.85.160.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B99BE00CEE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:10 -0700 (PDT)
Received: by mail-pl0-f46.google.com with SMTP id m1-v6so7601515plt.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jJbNsOA718Q6Isx3wpRJsX+Sbg8JWNH0Pl0e89qnTWg=;
	b=SKqcO+beBjH0iztj+7H0KNaJ96U9/CsZxqAomfm9NQxlBno0xCZ7I81OvuJonLrjio
	v8VCqCrdU/EtpP1iqrgmdUMvO2VGj9JtW7at5TX/KtwNKK7VWd73tcUWFIQI76+2t/Rb
	zVbiMem8E2JfOHyXxEJLoUM6VCW33PNAaUXO7Z9t+UrJQOGkgyhXscQK0Utg+9DvfCMr
	M87rDF9bTPQOQugDxTw3HZ+ZztF36md5yV4Ele4n12pTVU6N7tS/wfhsRnoKDJbXc2v8
	YexkS+o+RZs3d1Q+R5a1SB+mqSYG4fnhFQIY2Uk2Yrs8m8K+E8KJlYGAWv1zXsT4U59m
	u07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jJbNsOA718Q6Isx3wpRJsX+Sbg8JWNH0Pl0e89qnTWg=;
	b=e2eXqGnKzacjQklkm6+R9+zFE5gtwNdaByGOkJk8jRpdpojhOVP2x/OdQbHSgGMryS
	tpEBn/8Y+Mgb0K88u7+Af6zeWqUwcK5vT6pLm+XvczuCco0WLrFQO1QePyT5La1Vrgn6
	0fupkxyKu6rdQDshUWgEUq7H12XZkygcCtp7HIFJFL4VUsNi1VGHu1CGnWxj/IaZV3bx
	LyeaGdu8CmR2kOMvJ0MXUPnjVmvcpQSbuxIfgQ/SSOpsjMSsv1OemaQ+KXE8IsZS6mBx
	IiO89bASqrMB4M/9Tno6boxvm+VM102V39dpIokFfDid/iss6ce6eNcVo6zsY0IqgDg8
	VwGg==
X-Gm-Message-State: AOUpUlH1afIQNHx+rM0TShyoF0FTfXlK7P/5uBzJkaHipxMp+zJKB+Nv
	3UvgMLEq9yrw2QEoH7bZowQEY08s
X-Google-Smtp-Source: AAOMgpeuwsLK3PKhdQyKIv3SS9mZxEeVQhCkyvb1XLKD3w61Nzm8Bpbb/mfOT9VXg0F01eOq96oU1g==
X-Received: by 2002:a17:902:6193:: with SMTP id
	u19-v6mr21505864plj.133.1533065769519; 
	Tue, 31 Jul 2018 12:36:09 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm24758626pfi.89.2018.07.31.12.36.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 12:36:08 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 31 Jul 2018 12:35:44 -0700
Message-Id: <1533065750-25786-4-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
References: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 3/9] tpm-emulator: apply patch to fix memcmp defect found by gcc
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
X-List-Received-Date: Tue, 31 Jul 2018 19:36:16 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

| tpm_emulator-0.7.4/tpm/tpm_deprecated.c:437:7:
| error: 'memcmp' reading 20 bytes from a region of size 8
| [-Werror=stringop-overflow=]

|    if (memcmp(&b1, &newAuthLink, sizeof(TPM_HMAC))) {
|        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Apply patch from Xen: vtpm_TPM_ChangeAuthAsymFinish.patch

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
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


