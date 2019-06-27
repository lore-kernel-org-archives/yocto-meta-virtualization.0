Return-Path: <bostancioglucevat@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7F97E00CD7; Thu, 27 Jun 2019 15:27:32 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.128.68 listed in list.dnswl.org]
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 712A8E0096F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2019 15:27:31 -0700 (PDT)
Received: by mail-wm1-f68.google.com with SMTP id z23so7115616wma.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2019 15:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ye08/HqQVglzzrrt9HKi9zZz/wnOp4kcXPlCwUG7pMc=;
	b=r2klpWz757huDCs19e+CkKwO+pRWFQ9VtoWbdqWYkSetWsRmeZc7ODADLpBR2XWVMa
	1dTZGpQHjS8J6wK/oUUoVDLguJ9kt6au0JraRuOkU/JI3RRgM25PKqoTU++jayQlv6su
	hWV2RueINnX1Dy9+Uo2ud88GbrR3tOLXn6K6sJPnuqW8p2MW9UfqhcRAI3M/6s7brTMa
	NpoPLYU5hb/0aa7FM4bY9YT7AJFDOBR+6Q4tdmzt4oJmiAN6HwyEUkOn1DLH7unkAI8/
	zIPn5DhjXAnHCadRrxdRaPWKJs0bHBAUfXwYYave1Bmgp1aDGVxx4kFRHtwKxkzuP+3f
	Sz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ye08/HqQVglzzrrt9HKi9zZz/wnOp4kcXPlCwUG7pMc=;
	b=sj2OX8bmNopV9wVe2UY25+4dNTdRx12XRgLpp8pt4eQI75MaK6wrwjn+Y8cKxHo8aa
	HBJJNOiN+5uQIRZfmhFL7AgZZ6+czevZN0ghWBMOrTaklsELdiFob0CLVbzzhXm+s4nJ
	EgPwVonDvvMATb0wPK3YX75dRa7+oBZxUfpxi3V70hqFXwFwGCUYi70TC0ZfkVd5K2Um
	PhTHDrL0OCmVmQ5EL3OJLWZLumHQXYSc47GGyedhRKSoJ1bq5Mn8cS80NHQyeLzNrbzb
	0YFHwe6g3Vr9SR7HRvBDbIxSM6fVpHawfy6ZpR9+ZZ1YC+x1z5jFETwowpc0jVU1F7Ck
	5lwg==
X-Gm-Message-State: APjAAAUXNqoUOO6QvvLHvj8RFsJyYm2ej+zOvRaCa6Ac2xFlLjwT/ueU
	ah1DXOK5RrtLeXyeZ+k0aQEc2jJo
X-Google-Smtp-Source: APXvYqx9S4ecRL55wc2+EVKoSXMG0flKDXS0NMpcQ482zZgHRdKprC2j3TcETfjy8wwhjyhIqDgkAQ==
X-Received: by 2002:a1c:3:: with SMTP id 3mr4719572wma.6.1561674450421;
	Thu, 27 Jun 2019 15:27:30 -0700 (PDT)
Received: from localhost.localdomain ([88.237.78.67])
	by smtp.gmail.com with ESMTPSA id
	f204sm488111wme.18.2019.06.27.15.27.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Jun 2019 15:27:30 -0700 (PDT)
From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 28 Jun 2019 01:27:24 +0300
Message-Id: <1561674444-21344-1-git-send-email-bostancioglucevat@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] singularity: openssl cert configs path fixed.
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
X-List-Received-Date: Thu, 27 Jun 2019 22:27:32 -0000

openssl recipe moves ssl-1.1 directory as ssl , singularity recipe cannot find ssl-1.1 path.
---
 recipes-containers/singularity/singularity_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
index 6fee8f3..e50052c 100644
--- a/recipes-containers/singularity/singularity_git.bb
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -30,6 +30,6 @@ pkg_postinst_${PN}() {
 
     # python3 expects CA certificates to be installed in a different place to where
     # they are actually installed. These lines link the two locations.
-    rm -r $D${libdir}/ssl-1.1/certs
-    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl-1.1 
+    rm -r $D${libdir}/ssl/certs
+    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl
 }
-- 
2.7.4


