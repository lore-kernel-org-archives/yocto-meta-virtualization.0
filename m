Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7F2FE00C27; Tue, 29 Mar 2016 05:47:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D5B3E00B30
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 05:47:05 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id u128so716279qkh.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 05:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hUgBTuCSDC11Vntw03Z3uoD3krCeqK+nP6b+s8FjVtE=;
	b=Vvn1Uor8/wD4vppF+c26coDKlrTGRAE3YZmDJunkkLDPW4OdH1u8p+h3A4flQHPw9S
	ctWimUH0uVfqirhNdNQ6npCCz2IPVLBukC/bCXjc4Re7QGlhalk+PwAEZ2LmytO539Kb
	3+jlgyz3wIWe2IyMPzseY1N3d5qCzQc22C5zyJj+4Ytduw5kAHUtjdTu/wJcLZH49Dpt
	NIsnkTEDJ/9U/HR7mt4JNEDXpmJLc0iM4IM7XuHYSXRC0O7923Qy+u5siy4rG8lAO++I
	UAupQo3BKH7TqqypWisGlkb3GoNdHlzRAQc6hKHLcMetCeuijn3RXQd4lbcPbrzihCNC
	3UEg==
X-Gm-Message-State: AD7BkJJqR7Ct40avkfeIJLC5WM5adivagC+sWIa+zcS0bM3P5MUDUwuDDkFtG1SDWh7nmA==
X-Received: by 10.55.212.132 with SMTP id s4mr2390657qks.78.1459255625205;
	Tue, 29 Mar 2016 05:47:05 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	i46sm13864021qgd.19.2016.03.29.05.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Mar 2016 05:47:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Mar 2016 08:46:39 -0400
Message-Id: <1459255600-14043-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459255600-14043-1-git-send-email-derek@asterius.io>
References: <1459255600-14043-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCHv2 3/4] xen: add the flask policy to the set of files installed to the deploy directory
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
X-List-Received-Date: Tue, 29 Mar 2016 12:47:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-extended/xen/xen.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 77740cf..ae09b8b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -878,6 +878,11 @@ do_deploy() {
     if [ -f ${D}/boot/xen.gz ]; then
         install -m 0644 ${D}/boot/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
     fi
+    # Install the flask policy in the deploy directory if it exists
+    if [ -f ${D}/boot/${FLASK_POLICY_FILE} ]; then
+        install -m 0644 ${D}/boot/${FLASK_POLICY_FILE} ${DEPLOYDIR}
+        ln -sf ${FLASK_POLICY_FILE} ${DEPLOYDIR}/xenpolicy-${MACHINE}
+    fi
 }
 
 addtask deploy after do_populate_sysroot
-- 
1.9.1


