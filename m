Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E49B5E00C41; Thu, 24 Mar 2016 08:31:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 781BBE00B70
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:31:48 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id u128so2181566qkh.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 08:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w1EF6Kbe6fFVWxkNPJxzP8c2BfBEaIylRZJlJBfNzYo=;
	b=nAFfkRFTqduY/v5IH4cOFHTBbdMGuSotyru5NbW/MxWHwtUoAAa0hKl9iVMZiJDKB/
	ZyESl6rAzZvzavoRHAq2hEKfxdvkt5C63LKJ3SRLBVZKUQhKEexCpePDtVI3/W83Jd6j
	9bIlQPq0NGWnqqHO4tIsO0O9kdhIIznMTnx7rHzGMudLQFCvEcOC4bNTa5ww+nAfhF8e
	AsFc7erqB2TyqQsd93IR1Z0BPQZgqechdCVCHXFPwon+1Hvk2A8Y/YIp6/RdIQNE0xVJ
	IkFGbilAEFIJQiC1fOwCbjulliZPcfhpKmIlrzlATpwDQv+VMSsCd5uSphKPt6cv3Lxp
	doUg==
X-Gm-Message-State: AD7BkJIeTPoDcdalO0Xupjq7Ij8bysjaBYt3sa2vtExkT47lCewujHQdRp1nyX+VlzM5Wg==
X-Received: by 10.55.214.1 with SMTP id t1mr3333393qki.4.1458833507801;
	Thu, 24 Mar 2016 08:31:47 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	a11sm3473110qge.43.2016.03.24.08.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 08:31:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Thu, 24 Mar 2016 11:31:30 -0400
Message-Id: <1458833491-7717-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458833491-7717-1-git-send-email-derek@asterius.io>
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH 3/4] xen: add the flask policy to the set of files installed to the deploy directory
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
X-List-Received-Date: Thu, 24 Mar 2016 15:31:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-extended/xen/xen.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 77740cf..bddab6b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -878,6 +878,12 @@ do_deploy() {
     if [ -f ${D}/boot/xen.gz ]; then
         install -m 0644 ${D}/boot/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
     fi
+    # Install the flask policy in the deploy directory if it exists
+    if [ -f ${D}/boot/${FLASK_POLICY_FILE} ]; then
+        install -m 0644 ${D}/boot/${FLASK_POLICY_FILE} ${DEPLOYDIR}
+        ln -sf ${FLASK_POLICY_FILE} xenpolicy-${MACHINE}
+        mv xenpolicy-${MACHINE} ${DEPLOYDIR}
+    fi
 }
 
 addtask deploy after do_populate_sysroot
-- 
1.9.1


