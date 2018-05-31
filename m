Return-Path: <jkrishnanjanappa@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D3B0E00A0C; Thu, 31 May 2018 15:13:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_WEB autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.193 listed in list.dnswl.org]
	*  1.5 RCVD_IN_SORBS_WEB RBL: SORBS: sender is an abusable web server
	*      [111.93.218.67 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C50AE00A0C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 May 2018 15:13:41 -0700 (PDT)
Received: by mail-pf0-f193.google.com with SMTP id x9-v6so11456496pfm.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 May 2018 15:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RUzjTyKMRrhZVy7VpgeB9nKA2Mo4veQNEnj6cGY3Y+0=;
	b=YlOwFnmlAvyNjDxNfOZh5rqKo+0lWlz2AuCj8HHJ/SLdRy8cOgL+jDQlrXWYwU4NqA
	JuqpqXHzyqRNg2/JUAj5zH0zYY65QADCaghNrnflygh1iOBGwByfLZJbHO+HSkN6CZj4
	IuL+ayhoFfFwTZfDqiwgyMVGToXLjX+8kuUHIQf94tk9zTFHTEILPA89NC/1Pg32PmYC
	CfMoUEYtvHFVdFp8osQM6vgN7iUr3Ro8rXGWIP1i8VzU6//ROaqEEYWKVUZQHUzNtIsE
	iOG1dQ8WKggEnJcU0A+Dr84GJZ2lvrqEL4NP/CVaR/Cmr7bqjh/vvWv555gVstu9g4OF
	7lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RUzjTyKMRrhZVy7VpgeB9nKA2Mo4veQNEnj6cGY3Y+0=;
	b=SzbKer9aO0otXi7tZQhdhRgbdRDs4ekF6IXppk2Eo6LCJ0+7r/18Mnz9HU2FardeoH
	hmnZclJM/QUt94ABPq+HpDqLhmtkFIIVAX+7m6T6r5yxNzNkP6BdoroxxBXmK5JrhC+S
	L+6Eg90qu4eMk8NkfmzjW1dlbH4zFFz7g99mhpPlr/PiKpSQjGcscAC9EWHUjaPT+8q4
	zBa8u/hH1qkp170zBOLC+aRhm7/15ZsQsvCcZ0C8AaYr8wFRPDgD02VMAjgMB9HYrNpr
	0MFcX0hFiCZ/HuWwtGERVkss/Q2+tbbA4uU9QvuAPNt3R+nGw8IfLqnIHhvGbEt/60Ln
	H7/g==
X-Gm-Message-State: ALKqPwfBzLaLqt34Xv4s5jQrAAO6v3N37nXx/ka6UNCEUswCnxMlv+Ob
	1uT/XuyW8KCkYCN30IhbG5L+3jP7
X-Google-Smtp-Source: ADUXVKLULF/vFAusLsU1NIMEB/7v2m/ukc5URW2LiaRXoTdQbO/yga+Dau9VNzmmmSe4EACwgkoXpg==
X-Received: by 2002:a63:42c7:: with SMTP id
	p190-v6mr2624824pga.142.1527762675667; 
	Thu, 31 May 2018 03:31:15 -0700 (PDT)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	x10-v6sm138379538pfd.162.2018.05.31.03.31.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 May 2018 03:31:15 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 31 May 2018 16:01:06 +0530
Message-Id: <1527762666-30689-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [m-c-s][PATCH] tgt: specify -f option in order to load backing store device when tgtd is restarted
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
X-List-Received-Date: Thu, 31 May 2018 22:13:56 -0000

Specifying force option (-f) to tgt-admin, makes sure iscsi
backing devices mentioned under /etc/tgt/*.conf are listed, loaded and
activated when /etc/init.d/tgtd is restarted.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta-openstack/recipes-support/tgt/files/tgtd.init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/tgt/files/tgtd.init b/meta-openstack/recipes-support/tgt/files/tgtd.init
index 52d98c3..350fd0c 100644
--- a/meta-openstack/recipes-support/tgt/files/tgtd.init
+++ b/meta-openstack/recipes-support/tgt/files/tgtd.init
@@ -39,7 +39,7 @@ start ()
     # if it's not ready.
     tgtadm --op update --mode sys --name State -v offline
     # Configure the targets.
-    tgt-admin -e -c $TGTD_CONFIG
+    tgt-admin -f -e -c $TGTD_CONFIG
     # Put tgtd into "ready" state.
     tgtadm --op update --mode sys --name State -v ready
 
-- 
2.7.4


