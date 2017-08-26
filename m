Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F776E00CB0; Fri, 25 Aug 2017 18:45:05 -0700 (PDT)
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
	*      [209.85.192.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1CECE00B1B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Aug 2017 18:45:04 -0700 (PDT)
Received: by mail-pf0-f194.google.com with SMTP id g13so96364pfm.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Aug 2017 18:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UYtokEJnstcZxD1sO6OWH9BDDnXEeqR8NGMHcCj+2Co=;
	b=ARSWC4NlZ3b7udLkWH97Ax8qw+Ut+LFrwdq3HDVDyil/VIVTfS/v2TYKxwOqI/QtYw
	SQ9pFaY7w24yrsGsttoe6IbQYBLtdyDheUXkC96ui0V199c9N7CmF/Uvp4pOxbbubrL7
	IqC7UWnqV7rRWJJRLmYDIT5EuaDnwwBiS5QUWo8qhuEPF/IVfsfD5xxSpAjDAMxKjSRF
	6y06T4L+4w1PSp7dO0LdVNLjfzhLorWWXeurBM3bSVxkrR+RKVhz/WYdRn8AkQ3315xI
	nwMreQVUSQ8seRyu3KBdCOopJN12pBdhAR28ngoERe8D1A/4PwKekZF/EYFYy4RHFLGl
	HwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UYtokEJnstcZxD1sO6OWH9BDDnXEeqR8NGMHcCj+2Co=;
	b=N7fQ63NyTmSZ0zY+YQwHLlwfymQMId8xnI8fRwcFiECcg6JKb6LMWpFDcbOYknXl3y
	/dK1Z8ItHHdkaYF7WGuSAktRwye8Z706mwUXLDLYcsVbLg+qh48Le4x32vSKbFipcPKL
	m6druZMJGvavFbVsm99X6c/+HPRRHyYufzERYcjKICOvoNOEotHEPvBT001NfenqiUkV
	CFe+yHihQHGCNWerklIHpPPUWU5Gl4NYc2SevTITwtd2DxxrR12XFD6wB6VGn/vExuau
	6YQqcJgxzQfP8x86KQgc4W1uqgKu/xQCmlE9DkRmcyRseoFVbVLEQ8IMvQvVkW2Uk1py
	fNeA==
X-Gm-Message-State: AHYfb5hJ1x/cHnUglJhpeZfpOTWYCb7nbku8jFKKat85FtvIlnutO3o6
	0XPThjP/YyZEIYtti5E=
X-Received: by 10.99.37.199 with SMTP id l190mr374837pgl.367.1503711903981;
	Fri, 25 Aug 2017 18:45:03 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	184sm13192370pfg.2.2017.08.25.18.45.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Aug 2017 18:45:03 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Fri, 25 Aug 2017 18:44:52 -0700
Message-Id: <1503711892-25162-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH] xen: Only generate long-double-32.h if absent
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
X-List-Received-Date: Sat, 26 Aug 2017 01:45:05 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Only copy long-double-64.h to create long-double-32.h if it is not
already present.

Compile tested with both ARM 32-bit build and x86 64-bit build.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

In fixing the 64-bit clean build, long-double-32.h was populated from
the available long-double-64.h . Unfortunately this broke the 32-bit
build where long-double-32.h is already present and long-double-64.h
is not.

 recipes-extended/xen/xen.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index b429c81..ab69987 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -912,7 +912,9 @@ do_configure() {
 
     # do configure
     oe_runconf
-    cp ${STAGING_INCDIR}/bits/long-double-64.h ${STAGING_INCDIR}/bits/long-double-32.h
+    if [ ! -e ${STAGING_INCDIR}/bits/long-double-32.h ]; then
+        cp ${STAGING_INCDIR}/bits/long-double-64.h ${STAGING_INCDIR}/bits/long-double-32.h
+    fi
 }
 
 do_compile() {
-- 
2.7.4


