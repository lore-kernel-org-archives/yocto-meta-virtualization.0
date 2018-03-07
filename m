Return-Path: <jkrishnanjanappa@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7FB54E00F6C; Wed,  7 Mar 2018 09:02:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_WEB autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.5 RCVD_IN_SORBS_WEB RBL: SORBS: sender is an abusable
	web server *      [111.93.218.67 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9645E00EFC
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Mar 2018 09:02:57 -0800 (PST)
Received: by mail-pf0-f193.google.com with SMTP id q13so1174257pff.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 Mar 2018 09:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FElzhUq0D+tIwGTCv5NgCEHVIurRxnkQSdBS6Z2pe34=;
	b=ZZRjwYN/w5qs8rMaqFUPgh6P8zJ1s8aCQEKXeqmZuB8LW7xYE8bZfEMTb82+Cbqgmc
	zCrnvi39v6MEC8WFXewGbpFDEunt2/r5LFyM0m6iOkqE/H50L4ArxwcpoMONukEtqQbx
	te4sesiNZqcoguuO7RaCx2LlMs4cqDDt1/Vn0rWeHfXv2946FlVMaM5iXgkQ1mJk6jO6
	0Y+pIqdaxRenepD+Pt89uncRykXtAas2Q4PDcRJm2NEYyrr53ujBLXNi0PXyfGz0agxY
	gfmEgjwpJYSiyccXGQkhkZix/nQ5EGrThYrUt3vdY0y3jHsLUamz8lk44QVyJqn2Kc8p
	28BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FElzhUq0D+tIwGTCv5NgCEHVIurRxnkQSdBS6Z2pe34=;
	b=IxGMoBzRnelco/5DaJAalslc/ESpcXgn/oGl+VOsufTUd87/BZOGQiGRxCtBHRBWec
	aFEGzBX4q87WDJncLcZtFc34SkwuCLqvF3nMe/KzIdko4BA8o5i8z53uZCacv9PCl0/n
	4FcQ1qpPLjjgs9Rvuxmt6UQcxWu31Jtxsrvcz35fYTooSLz1Omyh8eXXABt19o0B7+Mm
	KkH0hE9lEqDTCPboBZbHtYpOdJ5Ma/qMqzY2hmSYeprgLhShGeTqkNKXckiS+gqMRW1d
	KD237lwUf0GfU6RECqDr1VLKxq/T4msAMPxWeJ0a/nqLVUceHqzYsgP0Lb8Zk6IyD/7K
	A/Hw==
X-Gm-Message-State: APf1xPANhAZFvuUhbc+ArbIWpxBpmZjoMbcDs+0eVsQJJ7dypglBTYju
	0mmJ/15Yuhbx+IjEpodosu1zKI8R
X-Google-Smtp-Source: AG47ELsgHcmIRpLujPk5gBXNQWyRSebZtlQlbNBPtYiNkDsfdGtcZ7KSIZDFCNJTfF3ASjzDlOnziA==
X-Received: by 10.101.73.197 with SMTP id t5mr18950617pgs.426.1520442176813;
	Wed, 07 Mar 2018 09:02:56 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	x4sm31675139pfb.46.2018.03.07.09.02.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 09:02:56 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  7 Mar 2018 22:32:43 +0530
Message-Id: <20180307170243.8155-2-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20180307170243.8155-1-jkrishnanjanappa@mvista.com>
References: <20180307170243.8155-1-jkrishnanjanappa@mvista.com>
Subject: [master][rocko][PATCH 2/2] gunicorn: replace PN with BPN, to solve fetch failure while building for multilib
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
X-List-Received-Date: Wed, 07 Mar 2018 17:02:58 -0000

The multilib gunicorn (for example lib32-gunicorn) fetch fails with
below error:
-- snip --
--2018-03-07 16:52:09-- https://pypi.python.org/packages/source/g/gunicorn/lib32-gunicorn-19.1.1.tar.gz
Resolving pypi.python.org... 151.101.0.223, 151.101.64.223, 151.101.128.223, ...
Connecting to pypi.python.org|151.101.0.223|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-03-07 16:52:09 ERROR 404: Not Found.
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 recipes-devtools/python/gunicorn_19.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/gunicorn_19.1.1.bb b/recipes-devtools/python/gunicorn_19.1.1.bb
index bbe03ea..5c8ea48 100644
--- a/recipes-devtools/python/gunicorn_19.1.1.bb
+++ b/recipes-devtools/python/gunicorn_19.1.1.bb
@@ -8,7 +8,7 @@ DESCRIPTION = "\
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19a2e253a273e390cd1b91d19b6ee236"
 
-SRC_URI = "https://pypi.python.org/packages/source/g/gunicorn/${PN}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/g/gunicorn/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "eaa72bff5341c05169b76ce3dcbb8140"
 SRC_URI[sha256sum] = "82715511fb6246fad4ba66d812eb93416ae8371b464fa88bf3867c9c177daa14"
 
-- 
2.11.1


