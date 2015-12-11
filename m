Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DD7BE00B6D; Fri, 11 Dec 2015 13:58:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,URIBL_BLACK autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.7 URIBL_BLACK Contains an URL listed in the URIBL
	blacklist *      [URIs: cardoe.com]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.171 listed in list.dnswl.org]
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4131E009AD
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 13:58:54 -0800 (PST)
Received: by qkht125 with SMTP id t125so59416812qkh.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GmjyT2nH2weskA6ZL5zwUCwWkxyc0Ra4xSXrCkyXSfs=;
	b=vPY8ZR9qHzoZmukkg62BPzxQReUVhVCCNIqJOKpTWJbo9y6LEtuA2pWDOQvfnDvcci
	Nat8zxDI0s7MtWBXO6NfI8JzPQ5N3Ry/FranElrbogIfUxNICYU3p5LSwSN0cT2kMHeG
	i899jq+25mRzyTiy1q1CkgjRE/eivdX2Lf0MjhxwTAK3B04sjAL85J6FEXR7mCyX24AQ
	Y09n67jBp6LsConszmvZ3LLyqTlFaLCimanievWKJU3uA57beISbdkNbWy3J1EplyN+F
	CYiSYQxcVWcbU74yOYmEnh0Ew8hs3UgHZWxiRc/VQnFIkmlOjfZjZRHrbxp9J4NzhqPH
	9CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GmjyT2nH2weskA6ZL5zwUCwWkxyc0Ra4xSXrCkyXSfs=;
	b=XRTeI3lpsCxvD77QhxAHxLYjCw32eDTKdH3P+2nY4Tj4Jl13A5Wn5wffb/ITEECJ8b
	jfCsB+S/ZJqF0PPCjInnGRTNbmpIgZQEcJUSVRTzQbWR2WiL2vps5ddvUgo9pSFFUP2P
	tt77YCQzR9pjkA87OrBi17s90K0P4eMUKLbxkFR9YAW33h9EV2QqU0RdoI/Y6O3CVBay
	SOEFzD8dNow1js42rOX3W9Lu7VHscLUcZDDJfpFGvgSiBsvYuk/Wd4kggFyuxxQ9u0BX
	i9ZQ6406uBVq6iEdr3NCRRKitTxnmZpzWfLzWJ0l/9/D788zHQj4xgnvmlowRA+4pFQ4
	z40g==
X-Gm-Message-State: ALoCoQmehbSS4kSDiXA1J+q3/788tCWHBRBmnbDcbdAEVML1Gs8boohSqnZgJVb4/UCMhx5qeEEq0HUEM1m+v5qbibXu8z3Ikw==
X-Received: by 10.129.113.214 with SMTP id m205mr10551523ywc.11.1449871133959; 
	Fri, 11 Dec 2015 13:58:53 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	e64sm14070336ywb.25.2015.12.11.13.58.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Dec 2015 13:58:53 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 Dec 2015 15:58:30 -0600
Message-Id: <1449871112-12401-2-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1449871112-12401-1-git-send-email-cardoe@cardoe.com>
References: <1449871112-12401-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 2/4] xen: move udev dependency to package that needs it
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
X-List-Received-Date: Fri, 11 Dec 2015 21:58:57 -0000

xen-base doesn't need udev but the xen-udev package which contains all
the udev scripts does.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 6fe0cbf..8598afc 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -54,7 +54,7 @@ DEPENDS = " \
 RDEPENDS_${PN} = ""
 
 RDEPENDS_${PN}-base = "\
-    libgcc udev bash perl xz \
+    libgcc bash perl xz \
     ${PN}-blktap \
     ${PN}-console \
     ${PN}-libblktapctl \
@@ -114,6 +114,8 @@ RDEPENDS_${PN}-scripts-network = "\
     ${PN}-volatiles \
     "
 
+RDEPENDS_${PN}-udev = "udev"
+
 RDEPENDS_${PN}-xencommons = "\
     bash \
     ${PN}-console \
-- 
2.4.10


