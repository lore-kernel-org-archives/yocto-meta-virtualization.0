Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51930E01A9D; Wed, 20 Jun 2018 11:47:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C52A7E01A9D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Jun 2018 11:47:04 -0700 (PDT)
Received: by mail-qk0-f181.google.com with SMTP id w23-v6so344564qkb.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Jun 2018 11:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rWxsXLMJv96mBBzRQojy0zlWUWjU5T9oMoB8wjbkq1U=;
	b=VSXyfNKnao1Tot0xKrC51iO2f/MFeFfP71v1A089uilJoUSlL9q/UJ17hf37KCJJrQ
	qfYJ9khtQ5iXox1EwJYdyLoNt7a97b/hf6+VtTNRCJ3ktA2yWRNTWslYuFLQWfW8mgbF
	TlGqIOf4hV9Fuk8fa5vxeYHoJAtb9a9+5IkiSg7ENhlbBU+B4/TDqc3M7K30HNhKD4xS
	SIC9o9G4Uy9flo5prfcanZqEZFvgM5SioihrUC541abq81G3Q51hTpCgMsuUeg53a/pT
	i/S5Hys1wlrHeRIVNAie2jrTDHr+2ZQH73QCse1RIFFltJCXPBd2rth83tzP1rEb3tvY
	k2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rWxsXLMJv96mBBzRQojy0zlWUWjU5T9oMoB8wjbkq1U=;
	b=DU7jmo4aCwGEH/mupT2Vkv3385g8E7PBcgyiDliPk9+OGZ9w6Lic+yocRexsaw8Wsd
	glZnYwA7BeGAX3n5xCJ32PFH41g1TThYPBzGDRcz9BQ2/RT+9sBQQjRnbqarzNfEUD2A
	m7WsCqG/NMHdf9WhE8QZrigqBFI7kl/hdvT2yMQXb2OgHeubX/EX1PKTSUCc3zevXGts
	TE5znGI0Rl10i2IElgaDIjF8B+yTDykn+PVbYhaSDp850+FLG+bWxAKJo4Vy/OA+Bq3H
	CzhWN+b42hbgExkP0F1zqRSLuW9Kf5GydXz9LgMh5yRTMkTL4jzJNkwk/MUZCthufjSi
	ecvQ==
X-Gm-Message-State: APt69E2S5DYZM8kbecqguw+VPnF2fy1gxpFeyhtvCuqF6oi5j0UEyxuQ
	/UCaeaS1Vgv+mCyxYbN/xmTIDZ+Y3w==
X-Google-Smtp-Source: ADUXVKKJ1Rw0XMUL2VEyQFT/CngzK4g7F3Ve+f1XhOfhvRrFAjJmFFficTCD+jv6v8KyXQWsfknvTA==
X-Received: by 2002:a37:3755:: with SMTP id
	e82-v6mr19372504qka.131.1529520423860; 
	Wed, 20 Jun 2018 11:47:03 -0700 (PDT)
Received: from localhost.localdomain ([189.4.98.150])
	by smtp.gmail.com with ESMTPSA id
	a12-v6sm1823192qtk.57.2018.06.20.11.47.02
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jun 2018 11:47:02 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 20 Jun 2018 15:46:55 -0300
Message-Id: <1529520415-13251-2-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529520415-13251-1-git-send-email-ricardo@opensourcefoundries.com>
References: <1529520415-13251-1-git-send-email-ricardo@opensourcefoundries.com>
Subject: [PATCH 2/2] python3-docker: update to 3.4.0
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
X-List-Received-Date: Wed, 20 Jun 2018 18:47:05 -0000

Update python3-docker from 2.5.1 to 3.4.0.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 .../{python3-docker_2.5.1.bb => python3-docker_3.4.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-docker_2.5.1.bb => python3-docker_3.4.0.bb} (72%)

diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb b/recipes-devtools/python/python3-docker_3.4.0.bb
similarity index 72%
rename from recipes-devtools/python/python3-docker_2.5.1.bb
rename to recipes-devtools/python/python3-docker_3.4.0.bb
index 341d95c..6e81302 100644
--- a/recipes-devtools/python/python3-docker_2.5.1.bb
+++ b/recipes-devtools/python/python3-docker_3.4.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
-SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
+SRC_URI[md5sum] = "02491d168c048cdb99cc20d0b352ea0f"
+SRC_URI[sha256sum] = "e9cc39e24905e67ba9e2df14c94488f5cf030fb72ae1c60de505ce5ea90503f7"
 
 DEPENDS += "${PYTHON_PN}-pip-native"
 
-- 
2.17.1


