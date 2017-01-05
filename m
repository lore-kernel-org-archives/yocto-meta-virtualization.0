Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7118EE009AD; Thu,  5 Jan 2017 09:05:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.194 listed in dnsbl.sorbs.net]
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2767EE00990
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Jan 2017 09:05:27 -0800 (PST)
Received: by mail-io0-f194.google.com with SMTP id j15so842787ioj.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Jan 2017 09:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mSmX6lN8LsNHYEqhZdVyLfYLx39Ax3RTSewOD7wbYPc=;
	b=NwZkRJ/B2/k6pKzmOK3GSbgEzxQUbOrYomf9ChvaWgwEoHRbVX+U5CCe4ETFIxq40Q
	5Ms9ATl2Ebh/aI9UTGReS5nMC1/DxhpPRiaNF06Ge8ueI+j9eDQQQYYgkuF37XHp2mcB
	qd92h6VMEozmWDVmSO8tcGRf1GxT/W3HpxQQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mSmX6lN8LsNHYEqhZdVyLfYLx39Ax3RTSewOD7wbYPc=;
	b=JVNkspbDyiJv6Ptv6o+tzXJ9oIS9D63SY1kS1lcIS2/8soMEDKGw2ZeceZRnSiXQYr
	jHd4u8dX9gZpoYWzFmtDHeGPjo26AQKTd4dUUa3KTXMDR4U632cqAaAJRZHsff50DTnT
	CYAp2kZDaTbGH8VWiNEFhef+nZA53hPrNEMyMYLilIT/KPVMleixOkey/tUu1QeAzWv2
	8WTNaEzxLSelOnAnCegzrXdeRq1OosdFGAdgdLPXeBH/mUappfCuF9cpYT/ThMMAUvrB
	pTgQv7DX8KkhTk68M9ecINr4hcHSfYIhkqt3AR2mHx4FGOX5fRhaL1C7v7FRtZLNavb7
	rizQ==
X-Gm-Message-State: AIkVDXI5+ICjTOz0vSp7TeJYR8scOjaB5StEK800UrAC3Z/eOEilmuNqAe7kDjC7tkoD/Q==
X-Received: by 10.107.186.136 with SMTP id k130mr1939710iof.195.1483635927198; 
	Thu, 05 Jan 2017 09:05:27 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	j201sm36362592ita.2.2017.01.05.09.05.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 09:05:26 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Jan 2017 11:05:21 -0600
Message-Id: <20170105170523.1318-2-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170105170523.1318-1-cardoe@cardoe.com>
References: <20170105170523.1318-1-cardoe@cardoe.com>
Subject: [PATCH 1/3] xen: update license checksum
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
X-List-Received-Date: Thu, 05 Jan 2017 17:05:30 -0000

The checksum of the license changed with the 4.8.0 release.
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index af907b6..0084274 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://xen.org"
 LICENSE = "GPLv2"
 SECTION = "console/tools"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6260c12cd5de27e80d89ae18e48d20a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbb4b1bdc2c3b6743da3c39d03249095"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux'
 
-- 
2.10.2


