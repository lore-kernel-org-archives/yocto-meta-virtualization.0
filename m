Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F404E00D5D; Wed,  4 Oct 2017 03:41:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C1A3E00D50
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Oct 2017 03:41:19 -0700 (PDT)
Received: by mail-wm0-f49.google.com with SMTP id i124so22198444wmf.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Oct 2017 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p3H+3Vv5OrfCP/sk0icy7OKYk4J/22ho5DoPx59RCLo=;
	b=yrgqbpKCiMASK6eNkv3r2YamOk7gVJehSiX8LSdby61IC4oc275HX076BBkx/y3Rc3
	Zjk+WCRZdUt4DKs/w9Q2GvEhXgm4jfo9iKuDd9rFoBgwqxSypW5S22gl0kDzJRxQLFXk
	Zl9LddfL7MHlOzpeW315u5m1Q7RaJJamK2AkHGOtOBMWbtX4ObB1w8ikVY/owRlUzPJT
	2LxaxnOhgEWWWXwCvk6MN8Vb5YptDK3aHvENh2V01lYKPGwKkjM9hoApw7QWhPhNTqqo
	6fS0ZO+dRcl1Ib7vISy7/Eyuf8VT05ZogyKU3eNpBhtJ2H0bC/gC64mcfzy+uY1mRKCs
	27VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p3H+3Vv5OrfCP/sk0icy7OKYk4J/22ho5DoPx59RCLo=;
	b=khPgGO+pgeQpuygrMW6YgnWVu00z5+tKbqBRM9OTtm9q8ZqoLvm5tDIXBvMVITEXKv
	TCChObnIq07xKkHkVbS/I1FF1sIVhZQDfDY5qG1hiolKX135+8HQxCoNxhZzQ+JH0Oxu
	GorlRDSIy8AbqBdocIWmou2Ae5fCh1n6Xm9RF4+0pTY65T+SOLBV+48b0NZVzMvMCiTu
	6ZofOjshQSPdiS3Br4Px1wWvC3Br5SeExkISsIPGoHJhIYghDDNRZJSlmGIQ7jKZuiE6
	j1V84jm/tx6KS8B2giHgku7tXyJhDmW5+5vGM9WWIbuYIUSUy6Jb8T+BrKbo8wwIptJF
	3fFg==
X-Gm-Message-State: AMCzsaUJxYhw9hxKjAla9XuaoLgvfJSJ4HY3AFQQMyeNuFYSI14vjAXK
	uoUk2lSlluoBHtjJp7cvU1Tmdwg8pw10jw==
X-Google-Smtp-Source: AOwi7QCH5ZYvp8Ai7HF0/VmunmcI8X/yqMinWQDIDqhFcu8DbJvrfAAsoE6v6gcMHvuBENGFO8TtkA==
X-Received: by 10.28.142.3 with SMTP id q3mr14544489wmd.46.1507113678959;
	Wed, 04 Oct 2017 03:41:18 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id v2sm7115456wmf.8.2017.10.04.03.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 03:41:18 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  4 Oct 2017 10:40:25 +0000
Message-Id: <1507113626-3022-2-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507113626-3022-1-git-send-email-pbarker@toganlabs.com>
References: <1507113626-3022-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 1/2] runc-opencontainers: Update to v1.0.0-rc4
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
X-List-Received-Date: Wed, 04 Oct 2017 10:41:21 -0000

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 4a6e8cd..940ae95 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,9 +1,8 @@
 include runc.inc
 
-SRCREV = "75f8da7c889acc4509a0cf6f0d3a8f9584778375"
-SRC_URI = "git://github.com/opencontainers/runc;branch=master \
-          "
-RUNC_VERSION = "1.0.0-rc3"
+SRCREV = "2e7cfe036e2c6dc51ccca6eb7fa3ee6b63976dcd"
+SRC_URI = "git://github.com/opencontainers/runc;branch=master"
+RUNC_VERSION = "1.0.0-rc4"
 PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
 
-- 
2.7.4


