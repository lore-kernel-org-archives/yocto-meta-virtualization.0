Return-Path: <ruslan.piasetskyi@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 332D0E00AAA; Sat, 12 Oct 2019 08:04:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ruslan.piasetskyi[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.66 listed in list.dnswl.org]
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A82BE008C8
	for <meta-virtualization@yoctoproject.org>;
	Sat, 12 Oct 2019 08:04:19 -0700 (PDT)
Received: by mail-ed1-f66.google.com with SMTP id p10so11177630edq.1
	for <meta-virtualization@yoctoproject.org>;
	Sat, 12 Oct 2019 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8CKd5HGxwyqC2f05HeJSZVfVzsJ5s/jSgMxA9piwoZc=;
	b=APK7L3nGbW1Z98j9UtAHYuP/0BflCbaDEbz5hKMbHPHt3W5upocDg0NuXTIClGfKs6
	uLOFp1sqegmwk1PQqvI/4PVMnbTog6j8eTiLihdjD81UHN+AoaHa8UC/GFz43r8YUPfo
	MQ4iCim+cYxTAJ8x2K3JDgQI20fL15WdbvgykxJfJGlaKW2zPG12J5JPWZIbHGVzDHYy
	mrymO9Mia9CTNSWTaWYugJqrB26PJgPbM/QOrhy5awcvbs3ln8byJFl+sOW+h/Umuww5
	5Sn0xJMsWP1tseU4fJMOSQprzWuq9aQ/5tLVuFV9BcAhrOPZ235Tu2WNBTP9lFhpGuji
	lmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8CKd5HGxwyqC2f05HeJSZVfVzsJ5s/jSgMxA9piwoZc=;
	b=JigvFXd6i8h2wHu6cQ+rPvEO6uk/ZVM7aC1ehyE7qYTGLz7eh1BFFFBbNTAeY8YsIS
	0cPDvk7CvEhL7HDIknbvpBYqJRLD0HDYGXQBRXSsnZCoHl4oVzvMwTL6uBkqTnfBygam
	M/YC+FrqO2J2F3XMCZuEZqsTwMyULv9nMkrhaKT7YH2gwcFnjLrsPI1poWt1tTgDNzPo
	BlbGILuyZAH6diJBEyFoZs88BXjcNTUTpb+Qv6IuEpY6a7Ot6AmiT5v/JZ4uPC9SFcSf
	4a7h3gKg6WOFl5DeAQ7TstrW/Yqc+UeSLa82g1cMWueRbY9paGyACAE5+gKNxYqlpul6
	bO0Q==
X-Gm-Message-State: APjAAAXF5BiXrFP15FgNm8gJVE8Dy/a5190YYqGiiKPZafPkW/JaViYA
	u1McTWmANTunIxb80xlpB3z4b6EoSAg=
X-Google-Smtp-Source: APXvYqxIzv297fqNYxSFknd7c8M/O4i7aPlf2MiB2mWGMAmdyM2UIzOIlkP/u1NBb3TBd1FLBtzUWg==
X-Received: by 2002:a05:6402:2d2:: with SMTP id
	b18mr19080501edx.264.1570892658346; 
	Sat, 12 Oct 2019 08:04:18 -0700 (PDT)
Received: from rpiasetskyi-thinkpad51.fritz.box
	([2001:16b8:3891:1a00:902a:238:3944:46ab])
	by smtp.gmail.com with ESMTPSA id t9sm1561353eji.26.2019.10.12.08.04.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 08:04:17 -0700 (PDT)
From: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sat, 12 Oct 2019 17:04:15 +0200
Message-Id: <20191012150415.16293-1-ruslan.piasetskyi@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Fix criu build for aarch64
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
X-List-Received-Date: Sat, 12 Oct 2019 15:04:20 -0000

Makefile:
#
# Supported Architectures
ifneq ($(filter-out x86 arm aarch64 ppc64 s390,$(ARCH)),)
        $(error "The architecture $(ARCH) isn't supported")
endif

Signed-off-by: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
---
 recipes-containers/criu/criu_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index c1ddb49..6bbbed6 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -38,7 +38,7 @@ S = "${WORKDIR}/git"
 #
 EXTRA_OEMAKE_arm += "ARCH=arm UNAME-M=${CRIU_BUILD_ARCH} WERROR=0"
 EXTRA_OEMAKE_x86-64 += "ARCH=x86 WERROR=0"
-EXTRA_OEMAKE_aarch64 += "ARCH=arm64 WERROR=0"
+EXTRA_OEMAKE_aarch64 += "ARCH=aarch64 WERROR=0"
 
 EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir} INCLUDEDIR=${includedir} PIEGEN=no"
 EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unitdir}"
-- 
2.17.1


