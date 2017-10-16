Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B6E8E008A4; Mon, 16 Oct 2017 14:18:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.41 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.41 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F7A3E00708
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 14:18:06 -0700 (PDT)
Received: by mail-vk0-f41.google.com with SMTP id 126so8571769vkj.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 14:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=39i7OOaCVEOWZh2+UeCHL9FyTqKKXEWee7yGsWnmgN8=;
	b=sgK3WTzfWcghGHV1ujpCvZnctTQnHsTi5bAB9oawIe1Oy8xMbCE6x+reLxogF2MQ05
	PB1/yGUxzJyTRWFoE7Fa2UK8f89p+cVC860XckcHQ3+iMDDLUBg7rSDMuxZlppJ19rGv
	VgE+bNuATm/wkNK0ZbaEGP7HwVDnjG2IoavHuiP7lQIT4P9HXrSR8bth8SWkIOhcRZvL
	yFLPTOVvqC7mzi7MRIzGEYCHEtYBTF2K8/kDALKULHL8VHczd885kFGffT3jA1iNsCwo
	QkQI+2oQyOrtf3ekG3UmuCt450RYzrkCVY2/XGDqPtJEQuB5HRoQbFeZfm9gs7rsIzCy
	EvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=39i7OOaCVEOWZh2+UeCHL9FyTqKKXEWee7yGsWnmgN8=;
	b=S2F5fQFTljFOWg/RmcxVLYKAsilQRVWAe4nF7BovB42qBmXil7EGvgP4WoC5Y+Rvc1
	601UEBRu3/p9AUiY31Ei6A6YgjvtWFJ8Gxh8/iQaOtt3PyrbtpCBALzcrqNRjOjiol1O
	4hCZL94rrU7UU1+mqz2ZvVWguZPCyQ5VrGkfOcGGwNu5IFzH3ZdAXlN0iJWoF3WP0Cuo
	1KV/jnF59q0vn0CS3NWy8ImqqR1w9zH6KdYhRLH4dhuVF8k4mnGMDtRB3Raf2naaI/Uo
	Oh8kWMRhOkNTasxbm/17s5ZJM5JHVYA4R5U5ZQZ9bjH3RUT4c1OWlBCcTzAkflDXY+33
	N6IQ==
X-Gm-Message-State: AMCzsaUa18FqTQa6CRnFGkEbsY/nXB7Ik891c0+RV1Zc/9vs0ICP2IfX
	sc8Yrvv4xbV1YBSNHVBWXgCDQvJtnQ==
X-Google-Smtp-Source: ABhQp+R0YIZjNGElVY5Ogpq2ZHnA0xmw/R1FeXElh3+H9v4iqdSgFf2D7D5jWaQLH5sGe0xLn3XScw==
X-Received: by 10.31.211.131 with SMTP id k125mr1612714vkg.113.1508188685233; 
	Mon, 16 Oct 2017 14:18:05 -0700 (PDT)
Received: from localhost.localdomain ([179.223.173.46])
	by smtp.gmail.com with ESMTPSA id
	x135sm1652887vke.32.2017.10.16.14.18.03
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Oct 2017 14:18:04 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 16 Oct 2017 19:17:59 -0200
Message-Id: <1508188679-11528-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] runc-docker_git: use SRCREV instead of SRCREV_runc-docker
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
X-List-Received-Date: Mon, 16 Oct 2017 21:18:07 -0000

runc.inc sets PV based on "${RUNC_VERSION}+git${SRCREV}", which is
set correctly by runc-opencontainers but not by runc-docker (PV was set
to 1.0.0-rc3+gitINVALID-r0 instead of using the SRCREV hash).

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 recipes-containers/runc/runc-docker_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 9db48ee..6ef4d2c 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,7 +2,7 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "9d6821d1b53908e249487741eccd567249ca1d99"
+SRCREV = "9d6821d1b53908e249487741eccd567249ca1d99"
 SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
            file://0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch \
            file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
-- 
2.7.4


