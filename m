Return-Path: <dhananjaysathe@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03400E00EF1; Fri, 19 Aug 2016 02:18:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (dhananjaysathe[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.196 listed in list.dnswl.org]
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2ECC6E00E94
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Aug 2016 02:18:34 -0700 (PDT)
Received: by mail-pf0-f196.google.com with SMTP id g202so1199204pfb.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Aug 2016 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6u+4hQJBHPc9B+1f09RjwXPcm/amt286d1BUx8oqcGk=;
	b=pYxY1Uv0TA7wnSHjVeKsJyYQ4kBfFvTTTR7mS+Bz00HO7kiOPzKeqEx8jroLbkTCBa
	FRvhTQI8dRrOaC0fKegylX8sTMC/mg3pIKq6Xj22IKd61MMOA9tIPHnJkweYnoBPjhtp
	8EQBH+QOe97smBf/T1xEdgkGITnepJ/fhJAjdz4bwp+V/QIg/EWzjeFEYv/bryCHEkg7
	6Xcicu8LDjLSz2VOKMJ+3LD4ATH2u4zS3nFbCv94yAkNDio0GV10JcQKYX5f/wkV5JS8
	dKP4FWgFcYoKy0b9zh6QAwSlQ0KrkruP7AcRWd8UWjaf4GjZXyfnHtx868utlWRekoMe
	zhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6u+4hQJBHPc9B+1f09RjwXPcm/amt286d1BUx8oqcGk=;
	b=NmrJxtOSv/+DACMnou+7kV6hefeOLoO5EiMk4hq4s+h5a/KSiyNWgRaa7vSxDMPUP5
	vDJPDr4q8gh+8brvLiN4XaV1GTGziDd5oNE2wuRVxAmBHQr8CN//8G2UMDSwrlysP2Ne
	E3xY/VRGfkXToDcRovoqrptpwkxC03o5jatuxIqaTuWj36wxQFKuxCJKOsx4fCB2tl6Y
	JfRb5ibmgWcW1p7A3UASkoL2I4Z8FEG1Fg1A56TLN/v5S6D1ufUO+F/Qy9pdrVMJexJv
	Su93dBuCB3BXpg5WUFguw9NUol3oFpbe8pHyNQgLT/LzIdk97G+r/rikiMaLVPPUMtP9
	Jh8g==
X-Gm-Message-State: AEkoousOs01Luj3w6SIxjN6svGfmFohqcpN5jUHx/omHvTQrrTeS35o0jaPBo/JkXZBu7g==
X-Received: by 10.98.95.129 with SMTP id t123mr12471100pfb.148.1471598314322; 
	Fri, 19 Aug 2016 02:18:34 -0700 (PDT)
Received: from localhost.localdomain ([106.51.39.217])
	by smtp.gmail.com with ESMTPSA id ao6sm9792783pac.8.2016.08.19.02.18.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 02:18:32 -0700 (PDT)
From: Dhananjay Sathe <dhananjaysathe@gmail.com>
To: meta-virtualization@yoctoproject.org
Message-Id: <1471598307-26529-1-git-send-email-dhananjaysathe@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: Dhananjay Sathe <dhananjay.sathe@rapyuta-robotics.com>
Subject: [meta-cloud-services][meta-openstack][PATCH] Add necessary dependencies to get salt running on a clean install
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
Date: Fri, 19 Aug 2016 09:18:38 -0000
X-Original-Date: Fri, 19 Aug 2016 14:48:27 +0530
X-List-Received-Date: Fri, 19 Aug 2016 09:18:38 -0000

From: Dhananjay Sathe <dhananjay.sathe@rapyuta-robotics.com>

The python package on yocto is broken into a number of smaller packages (http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-devtools/python/python-2.7-manifest.inc)
To get salt running on a clean device i found it necessary to install the following packages
 * python-resource
 * python-unixadmin
 * python-profile
 * python-terminal
---
 meta-openstack/recipes-support/salt/salt_2016.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
index 7024f42..7e2f246 100644
--- a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
+++ b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
@@ -102,7 +102,7 @@ INITSCRIPT_PARAMS_${PN}-minion = "defaults"
 SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
 DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
 salt-master, salt-minion, and salt-syndic require to function."
-RDEPENDS_${PN}-common = "python (>= 2.7.5-5) python (< 2.8) python-dateutil python-jinja2 python-pyyaml python-requests (>= 1.0.0) python-tornado (>= 4.2.1)"
+RDEPENDS_${PN}-common = "python (>= 2.7.5-5) python (< 2.8) python-dateutil python-jinja2 python-pyyaml python-resource python-unixadmin python-profile python-terminal python-requests (>= 1.0.0) python-tornado (>= 4.2.1)"
 RRECOMMENDS_${PN}-common = "lsb python-futures"
 RSUGGESTS_${PN}-common = "python-mako python-git"
 RCONFLICTS_${PN}-common = "python-mako (< 0.7.0)"
--
2.7.4


