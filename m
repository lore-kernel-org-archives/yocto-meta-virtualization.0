Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C260E00C0B; Fri, 12 Feb 2016 07:34:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B3EDE00C05
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Feb 2016 07:34:43 -0800 (PST)
Received: by mail-qg0-f41.google.com with SMTP id y89so64641698qge.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Feb 2016 07:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8mmqyehFJcy/Bq4Ni/BTFPiJv8DMia5x/X7r78qKpQQ=;
	b=UTZHTX6qfsd9I4skiHbvDjQL/91DqJtQAGWz7JXD/IIG174r3FLWRypR+Q9jHF48GJ
	0F1EqarcA9TExFV5J2pyRwnj85uutp4zzSraaU57297R95nREwi5IBJtgUhMGNc2BY0x
	wul/4uKG10r9qbx9UuxWCdopd8twL66Vrm2324pifePpQVd/lDkw6BXIUMiTsOcr6rBN
	NwOykgiy+3uLc0kfKLvmZflm959z9RceXC70LGjQwO16etVTtmz48sSx8pvdfXH6+BCj
	Vcw15bQkcxW6JwX1l/XOkjRkaQyLx68PfDM/nAmsMFqt4QM0gUS2gNztA7seJu1s4OSm
	paXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8mmqyehFJcy/Bq4Ni/BTFPiJv8DMia5x/X7r78qKpQQ=;
	b=SfO+C87BYtuRFGyvdC9/jmqx3uV5tEQVbbs1klAog93guFWnjCPMywGl+701uI2bj+
	Gg5+H9qd9L2khxpNKaEpYwGm478SKs5S7uFwmZMDbBvKyDB7ZJvYI/LYnm5sXqJaAzFv
	/QAQ7qiP4Fk+9nTpyBqGzPoNKj43eU0enWgwAmhrxjALTCSuKUZcJHaw5G4DzyIJ9VB6
	ZdEvztvSL5TH8rv6F0uGwq3+T5W9U9u7KrvTamyQDOXcHqJKmdL3Nr/4fYU/6+ZHCQaJ
	2JVCePW9KS2rsH8TB0olhL85gXasFtBvADIlzRWfrU4RX5jIjxO0smkwvJj/ynOK1ACz
	U1aA==
X-Gm-Message-State: AG10YOQDSYlrdYou6ZXe1AMp/3hBR5ui+k8DZEtYJXHIeFUVNHXyrRSeyN9/0BGweD2cXQ==
X-Received: by 10.140.249.6 with SMTP id u6mr2806683qhc.83.1455291282430;
	Fri, 12 Feb 2016 07:34:42 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	z132sm5756266qka.14.2016.02.12.07.34.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Feb 2016 07:34:41 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 12 Feb 2016 10:34:29 -0500
Message-Id: <1455291269-32533-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xen.inc: fix ordering of stubs task
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
X-List-Received-Date: Fri, 12 Feb 2016 15:34:45 -0000

Placing the stubs function between patch and configure steps
breaks because it has dependencies which are not guranteed
until the configure step.

Build error:
"fatal error: gnu/stubs-32.h: No such file or directory"

This patch simply moves the step between configure and compile
to resolve the dependency issue.

Reported-by: Machon Gregory <mbgrego@tycho.nsa.gov>
Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 5555ed3..d35bc3f 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -782,7 +782,7 @@ do_stubs() {
     fi
 }
 
-addtask stubs after do_patch before do_configure
+addtask stubs after do_configure before do_compile
 
 do_configure() {
 
-- 
1.7.10.4


