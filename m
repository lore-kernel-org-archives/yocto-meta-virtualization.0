Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4F54EE00C44; Fri, 27 Apr 2018 09:45:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 431ACE0073D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Apr 2018 09:44:59 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id s2-v6so3094019qti.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Apr 2018 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id;
	bh=RjVPh0yfLKXZ/jxbCR4eOtV00K6phmvxKGBzTT2UyIo=;
	b=XwhcIbx6IltEQ4FU/vxhJn4wMNJMGk+uUgSQJu8kb9lC2Tl+1H3HC/OfO4ZDb9Misn
	M0zMjA2vknkV0tHLfoFt7pZCnh72Xo/o8NV2kWNqUSd/hIZpvaE08JtqEd4g5TCADgi7
	mClz6EDVcisVkZ8Yehq3Cec0MzA98y1sZZEM/jYz0MsZdNCwiQOridGWqow2kkeMOX4F
	h3SFPBRR2sFbMdthf7O69fCCA67FovIifSjRcDz4DsQmVUr/PbV+N7UaRZO9/NtHXkOz
	FxXUDS8tEwHgu/jh6/n5Tqg0+V4QR3noHRXbOAIjOqXvs5LEdXql0kf5+aqJl/YY3Fr2
	lSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id;
	bh=RjVPh0yfLKXZ/jxbCR4eOtV00K6phmvxKGBzTT2UyIo=;
	b=ogqoCX2gQbM6JG9sNEd7wUmYV/yQ+qKR2qxr1Yb8WsN4QKyJNeFu/J8soXxImPyqWI
	jW+sc+qUlk4hcJFzZNZAHsEV1dj6Y3qUBG9/2OwlW4/EGQ6LlNqobECi3BIsAh8R2FeY
	D55x7gsQ+KydWfZK8qHQ9IUhItNc6RHUFnkZ9BRHk/1QaImiMFeCfyBHf0/U9lIouyWu
	/nvlwSM0LjdWoTdlrk84JntxRAdzPnxmvxBHtVaHgNcU9Ud7AkhxxE0jZVchpWR3I/c7
	I1Dw8hV2P8nOnPnLJ9pFQr8Ldkrf4eEXLA835a9CXhcjzfDLLuBJ9IzIt6HT9SnQZJQj
	gTZA==
X-Gm-Message-State: ALQs6tC1+TR92bMWhXxuyspb56In1bQkETve+kjyeXVSUkTb3aVKsjmY
	5yreH8vh1Z8r99kW0oujpw0svFftBqCjitTM8qLsMgq42FKwNf8R/7ZAsyRaByf7OdmGPEhHFWh
	nJCUd9BcSn1yEDyhaKvfrJCqGChDSCmk=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZpcVlS7uBO8rZAZHXmzYwu/HwEUkhMShlt3/Ep9ZdTzsgpCjZMMaZTU0rdUo/txOgIhQbaxNw==
X-Received: by 2002:ac8:4607:: with SMTP id p7-v6mr2860795qtn.5.1524847499339; 
	Fri, 27 Apr 2018 09:44:59 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a4e3:fceb:d802:a79e])
	by smtp.gmail.com with ESMTPSA id
	w198sm1234438qkb.64.2018.04.27.09.44.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Apr 2018 09:44:58 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 27 Apr 2018 12:44:43 -0400
Message-Id: <20180427164443.8590-1-kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH 1/1] xen: TPM Emulator: Corrected license from GPL to GPLv2
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
X-List-Received-Date: Fri, 27 Apr 2018 16:45:15 -0000
Content-Type: text/plain; charset="US-ASCII"

TPM Emulator is licensed under GPLv2.  Bitbake does not consider GPL a
valid license, so it throws a warning.  Fix that.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
This patch is to be applied after applying the Xen vTPM patch series. It
corrects the license applicable to the TPM Emulator which I had
incorrectly listed in the recipe as GPL to the correct license type of
GPLv2.

 recipes-extended/xen/tpm-emulator_0.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/tpm-emulator_0.7.4.bb b/recipes-extended/xen/tpm-emulator_0.7.4.bb
index 7207676..f626929 100644
--- a/recipes-extended/xen/tpm-emulator_0.7.4.bb
+++ b/recipes-extended/xen/tpm-emulator_0.7.4.bb
@@ -3,7 +3,7 @@
 
 DESCRIPTION = "TPM Emulator"
 HOMEPAGE = "http://xenbits.xen.org/xen-extfiles"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;md5=eeabd77cf8fd8a8bc42983884cb09863"
 
 SRC_URI = "\
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

