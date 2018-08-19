Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 183C1E00890; Sat, 18 Aug 2018 18:37:32 -0700 (PDT)
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
	*      [209.85.223.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED70EE006B4
	for <meta-virtualization@yoctoproject.org>;
	Sat, 18 Aug 2018 18:37:30 -0700 (PDT)
Received: by mail-io0-f195.google.com with SMTP id m4-v6so9918508iop.3
	for <meta-virtualization@yoctoproject.org>;
	Sat, 18 Aug 2018 18:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TXH2CMO4ZgOtjLAW2TlnJY1Vt5AM4EfXU+I1s/13XV8=;
	b=KlEpC6hQmlVVyUSXq66kM3Gt8Pgci8tcK4gkpNMtMFCJBTC53Ji4i/HeNyq9Ge58nY
	0v8SUt4Chv6nVtR/1m6UHqzcA4/XJn8jhN+S3vnJ7GBvXouCuiIJMSm0MU+EcpMqfR4P
	U65hhMTG16D/dGqthObFZz2MEWZPjBSkNfSUwwL5voGsf6Hv3RiKNGN3qcJEd+QizNr1
	18ELQZ5xtma/K9flihb+keID305rMaHTx8Gq3guhbVXTR/UI/ne3av4c7n3Jt53BCdfU
	fkAnAzif/aUJM5wxRCbS7RZ8cJknlaAKQSMtE6p1BaPs1cb7ECnqnjakTlIabOc/R5D+
	xlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TXH2CMO4ZgOtjLAW2TlnJY1Vt5AM4EfXU+I1s/13XV8=;
	b=jyKWQ3YwNjhOYC283MgCtlFIHvwpEX2zv3rdBQQkF24HZX4R9qF4Q+hYVjPJ7SoSih
	V188hTeFG0K5NpUvvll67w/vPYJb19XygIOByz+MB66FLCZL69GNxNPuAagnlKsZOxI6
	zm5M9kfVbIP3p1PlDQ/WYNZ6IfT19Oev3nW/O1i2QY1AeCQu/NupGvYSEaNJKhLJZoaq
	aTNpAoArP52/8pi6y5yCwnKQSu1RVlGiz+CqqHaDoTtM+ULWf3FeaA/EOEt2+7N0ZuY1
	oYypxgs9eU05hGq90Ft6mCGSjcfVPF0UIL63oIPlefwukyNa4jjIPjWNZGnoAYTE7sEU
	Y0oA==
X-Gm-Message-State: AOUpUlE14QOludL5xPEfqPBK1wENw46cE4QxVOET2PrfDDSjmOsV6fpz
	3QQ2K9JfjsKnN4eYFeWv3p2yw/Er
X-Google-Smtp-Source: AA+uWPw35Sa3uuor+otlgelBY/sp4DjJiBnf8QAu+by4t47RU8Jc2euLSvG0/nJweueSyywFkwO7+A==
X-Received: by 2002:a6b:1bd5:: with SMTP id
	b204-v6mr35506293iob.240.1534642649995; 
	Sat, 18 Aug 2018 18:37:29 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	i2-v6sm2198418ioh.80.2018.08.18.18.37.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Aug 2018 18:37:28 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sat, 18 Aug 2018 18:37:12 -0700
Message-Id: <1534642635-18305-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH 0/3] Xen on ARM: fix 64-bit and add 32-bit
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
X-List-Received-Date: Sun, 19 Aug 2018 01:37:32 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

This series fixes the Xen build for 64-bit ARM targets with gcc 8.2
with a minor patch to correct static string lengths, already reviewed
upstream:
https://lists.xenproject.org/archives/html/xen-devel/2018-08/msg01367.html

and introduces 32-bit ARM compatibility, verified by testing with a cubietruck.
This currently requires another tiny patch to suppress a new (false positive)
compiler warning.

Christopher Clark (3):
  xen: Fix build on arm64 w/ gcc 8.2
  xen: fix truncation warning in tools build for ARM 32-bit
  xen: enable 32-bit ARM builds

 .../xen-4.11-arm-acpi-fix-string-lengths.patch     | 101 +++++++++++++++++++++
 .../xen/files/xen-tools-xenpmd-snprintf.patch      |  78 ++++++++++++++++
 recipes-extended/xen/xen.inc                       |   7 +-
 recipes-extended/xen/xen_4.11.0.bb                 |   2 +
 4 files changed, 187 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch

-- 
2.7.4


