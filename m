Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 38980E00D9D; Tue, 20 Dec 2016 01:25:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54D86E00E04
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 01:25:43 -0800 (PST)
Received: by mail-lf0-f51.google.com with SMTP id y21so71868031lfa.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 01:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=50QBDk8CXiBkEdKp0vBi08R/M+QFbC6FaJR6+9k6oQc=;
	b=FvLHE/O1VHFprztk58J7onqH4HWaR3dy2mknRC7jEMqCTd3Ho5duFYffKMiH+ZHFVk
	lvkqtH43MqWs/mZk0zm9pxOthxRFuRjn2crzzT1MbCNvmuJbFZfFYZ7zD5B4XACf54NC
	RlBnpg/wbuCxDvGtO/sZHawQXHep3FY97IKOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=50QBDk8CXiBkEdKp0vBi08R/M+QFbC6FaJR6+9k6oQc=;
	b=UOuB6XgSV/AwL/upz7BlO06mKhPvQKWEhQbRR3HvoPSh7LjJfpXJ9e0AX62VSKjGgS
	9puB1jo0otC+O6k9HdhHC54n4s70OsMvfW8Ri0ved+Z9ZHlswwNkiJHv7I6CevUlKh8N
	UGAOqZhQVabO5OYEPEZYY493q0jGv9gEBEXknZkbG0IKgdxKy6qrSb8z221FaE6A+/eW
	jv5OowU2cim+z03Oa7Lmto1HkWNORcmonODiMB58DnzYfn4l+SdIriMxOqQLzEIZT5m5
	J7j69De25cy8Wtn4frdHy5ql2//xCmxIpBnF0KTGoySTxz1wQjw8kKSpLZwbK/KajVlv
	x3dw==
X-Gm-Message-State: AKaTC00pDJaa45BQtrYGDP8pAxx/TrC3R7HPDYkqREqZ5gaedx2Arz2n40GudfBpfKE/xF5Z
X-Received: by 10.25.80.4 with SMTP id e4mr7615030lfb.89.1482225942814;
	Tue, 20 Dec 2016 01:25:42 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	l135sm4558020lfe.10.2016.12.20.01.25.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Dec 2016 01:25:41 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Tue, 20 Dec 2016 11:25:33 +0200
Message-Id: <20161220092535.9066-2-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161220092535.9066-1-fathi.boudra@linaro.org>
References: <20161220092535.9066-1-fathi.boudra@linaro.org>
Cc: bruce.ashfield@windriver.com, koen.kooi@linaro.org
Subject: [PATCH v2 2/4] docker: update description
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
X-List-Received-Date: Tue, 20 Dec 2016 09:25:59 -0000

* reword docker officially supported hosts section
* bump minimal required kernel from 3.8 to 3.10

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-containers/docker/docker_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index f50f25a..37df3c4 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -9,11 +9,11 @@ DESCRIPTION = "Linux container runtime \
  large-scale web deployments, database clusters, continuous deployment \
  systems, private PaaS, service-oriented architectures, etc. \
  . \
- This package contains the daemon and client. Using docker.io on non-amd64 \
- hosts is not supported at this time. Please be careful when using it \
- on anything besides amd64. \
+ This package contains the daemon and client. Using docker.io is \
+ officially supported on x86_64 and arm (32-bit) hosts. \
+ Other architectures are considered experimental. \
  . \
- Also, note that kernel version 3.8 or above is required for proper \
+ Also, note that kernel version 3.10 or above is required for proper \
  operation of the daemon process, and that any lower versions may have \
  subtle and/or glaring issues. \
  "
-- 
2.11.0


