Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A98C2E00AB5; Wed, 12 Aug 2015 07:43:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.179 listed in list.dnswl.org]
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF0F7E00AB3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Aug 2015 07:42:55 -0700 (PDT)
Received: by qkdv3 with SMTP id v3so5754284qkd.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Aug 2015 07:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8xFuzjysXOlYGzBhjLa5RTZmPqc9msQZD2FYVxTZYVE=;
	b=NYkaEUEPArEzbY5eAAPcIWz/nGzI2nWWJBh87CV3ZWz38bJ1W83WEaOEFDZTHfLlAI
	mhB/vlYdHflC4Pin8A5dgPpDAJginFhvzOZQFywUtpxE5brMaL3V8F/u4u9etALU0JCO
	4NiG04vtQLrCCk9sg2YGEJR5Bvf/fVdEjS6+dgY0TXlkI4l5J4Rb4iRJEvNfp9V++e1L
	jKh63nao/FN5vo05nrh9oGUFHGGivCZNA5tk++CtgfYaXLJK1aR9/qwzluUL2hibxYhk
	l/77LD8mqTU6/Z0hmyaMjh2Iec+ARmGFJuHJBKpXBQNTAHApGFrtYE+VqAk+pjnJX/Do
	pd4A==
X-Gm-Message-State: ALoCoQkBhfUMqMH0I2d+1B6/0Q4ef40FR1u9Jo/USbezFb2EGJ0QTd41OWH1piunwz2mUam8HoBv
X-Received: by 10.55.20.70 with SMTP id e67mr19968591qkh.36.1439390574521;
	Wed, 12 Aug 2015 07:42:54 -0700 (PDT)
Received: from doug-t430.lan ([67.63.141.2]) by smtp.gmail.com with ESMTPSA id
	b196sm3270271qka.14.2015.08.12.07.42.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Aug 2015 07:42:53 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 12 Aug 2015 09:39:47 -0500
Message-Id: <1439390388-16012-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] Revert "dev86: Adjusted the SRC_URI of the source code."
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
X-List-Received-Date: Wed, 12 Aug 2015 14:43:16 -0000

While the change to the SRC_URI switched to one that did not 404, the
hashes are not correct. The previous md5sum and sha256 are the same that
Gentoo and Arch Linux have.

This reverts commit 2892c53779f4cf2e58e3c60302b7e9ef792f938e.
---
 recipes-extended/dev86/dev86_0.16.19.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-extended/dev86/dev86_0.16.19.bb
index 5e26a75..807504e 100644
--- a/recipes-extended/dev86/dev86_0.16.19.bb
+++ b/recipes-extended/dev86/dev86_0.16.19.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 SECTION = "console/tools"
 PR="r0"
 
-SRC_URI="https://github.com/lkundrak/dev86/archive/v${PV}.zip"
+SRC_URI="http://www.debath.co.uk/dev86/Dev86src-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1308759f36f9907e7dae92c46f35c51e"
-SRC_URI[sha256sum] = "efd33d456ff87d6d0308608f6a34052b22ea8629913d0597d98c73815ed0f9f0"
+SRC_URI[md5sum] = "442e98e1afa23fe00d40c5a996385942"
+SRC_URI[sha256sum] = "33398b87ca85e2b69e4062cf59f2f7354af46da5edcba036c6f97bae17b8d00e"
 
 S = "${WORKDIR}/dev86-${PV}"
 
-- 
2.1.4


