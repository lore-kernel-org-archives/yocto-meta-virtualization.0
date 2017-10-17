Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D9D4E00C82; Mon, 16 Oct 2017 19:10:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.179 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.179 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 649C4E00B67
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 19:10:48 -0700 (PDT)
Received: by mail-qt0-f179.google.com with SMTP id z50so485158qtj.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 19:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=eLZICBykQAfoekeSxrFakXNUUKyufMDugTsctEH6UBk=;
	b=runjRBT3qPprcLBSvPwhlsPuX6tWnSPt3/ACugTynzHSQzmjeYAcKyQ1etEcJAJtJB
	/X8fC2fiGpwiOvHK7eg9fmbNclUS+OwdS0iHhAtKf9nT7UTaEBw5lvuBMy15a+G30UY5
	eseGnukfCQEctNkpgrPswQcyRgKwC35KHO38D7fgUyTm4kVdpQFFV9ghiAsQNlJNfHPU
	bl96dOO8VQeiegrd+hcWV2ftXYKkgOIOZTa/IT97n4dMuFfHU1avJNRQstMpA73dYeva
	cO5x1Hv4IoevWsqPgOmRSlMXH/abSn8UcBq03L+Wys/ykP4XzoVOmQDfn4pyGXwGWQg6
	RXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eLZICBykQAfoekeSxrFakXNUUKyufMDugTsctEH6UBk=;
	b=qZ1kEemwHCW4J4t9OAd3thTwL7TsHvA+j/k3tSJIi8AKQVxmW4A445JtrZ6UYRu4zw
	imJ6xJDh/7oV1sz98Gtys/+3LbDB0i4cN7x/IVVt1uxpeCr01KQrQLE0h04UzfUFCnkr
	mHXrswrntB4dTcAskSYgsnb/6EfnV2p4RlRCUR6d5E6qhit9xG5pPLyGGSJ5YgokxBe7
	t3Jss8AhTJOXiOxU5XoCVrYRwVfQDvS2cD2GdEb3wyTlOB0HCKWa8RyLmESx0tE+NQSZ
	CHP+w+7ZS0+9TvAaMv7h4A1O3xfZhcrbKsMGFxWrUeEBKU5OifS9NxoPlu/fnV8HEFlN
	cMGw==
X-Gm-Message-State: AMCzsaUW/hy8kwTbE7MGoUJrFIIKJvkxKWnoOc2iWE4bSze1t0tEOlSf
	Ku5FtufSXqv/mqET1DnyKMWbh/iCJA==
X-Google-Smtp-Source: ABhQp+ShERlhxRU2IC21s3PpYajjjIuI1q4KB0dgNd3cs9NYqmbNy03Ag113NGI+MUzOXtGphaiMFQ==
X-Received: by 10.237.62.252 with SMTP id o57mr17087940qtf.144.1508206248205; 
	Mon, 16 Oct 2017 19:10:48 -0700 (PDT)
Received: from localhost.localdomain ([179.223.173.46])
	by smtp.gmail.com with ESMTPSA id 35sm5667839qtx.43.2017.10.16.19.10.45
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Oct 2017 19:10:46 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Oct 2017 00:10:40 -0200
Message-Id: <1508206240-12051-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-docker: add missing RDEPENDS
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
X-List-Received-Date: Tue, 17 Oct 2017 02:10:50 -0000

Add python3-docker-pycreds, python3-requests and
python3-websocket-client to RDEPENDS for a functional python docker
module (otherwise even import docker fails).

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 recipes-devtools/python/python3-docker_2.5.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb b/recipes-devtools/python/python3-docker_2.5.1.bb
index ff8f89e..341d95c 100644
--- a/recipes-devtools/python/python3-docker_2.5.1.bb
+++ b/recipes-devtools/python/python3-docker_2.5.1.bb
@@ -9,3 +9,9 @@ SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
 SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
 
 DEPENDS += "${PYTHON_PN}-pip-native"
+
+RDEPENDS_${PN} += " \
+	python3-docker-pycreds \
+	python3-requests \
+	python3-websocket-client \
+"
-- 
2.7.4


