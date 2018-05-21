Return-Path: <smithdm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62250E00C4B; Mon, 21 May 2018 07:07:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (smithdm[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.51 listed in list.dnswl.org]
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8CF5E00A4C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 07:07:06 -0700 (PDT)
Received: by mail-wm0-f51.google.com with SMTP id l1-v6so26897070wmb.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=os0blvFtZ9mtxCfhChwszqGNujuRXx3XqBBZa9QA02g=;
	b=fZ5XdECVm5QjzEklRQ9jWhTCk2xgahhwDDDLWVfxIPvDOyNgELEXdc4yYYrzrVvqPj
	fzjcKWG1pdJB526+Y37HRkMDvhQ7YVqmdqcbFdSaMz9h+S3bkg5QmE2D1e46hSQ2hs7r
	0hKNopOU91IENfQqTtcY6daIWDRtZHEnmYfwIdRJnb2tOC/boHsNo/IA+ZevfJXkrrjo
	DUabRt+ysxiPpFhd+QeqEU+38lWYF/DeiywwVbmhNO9kBqtQdQJKb58J5Y3ifl1AZWot
	VEcjWdtpw6k5ymsczgPg8gNBuMqL9g5ePUHim860QcQnG1jnhwyrc/STWzs9ce59acs8
	NMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=os0blvFtZ9mtxCfhChwszqGNujuRXx3XqBBZa9QA02g=;
	b=LbWvku3WuXxPKtxXsse5NYguJNe3X69eFeaf1kiiDb65jfv2AUpGU8Q7B7BMwcqrTS
	ns2dK+H3o+Cls0/LkcL+mln+arzSQUCs8/SqPB4FLNi+K56kdBbgDHAPjrp3xL8v6ift
	I3tbkqLYlVdfpRxR3ttNq0qb0/taFH7huvS8rNuumv220NQ3E5u5GqJJ4v1+pZgVEOIN
	cShjSxgPIYqTeE3pEHrRI6aFSnFMI8K8ZfrtYQoHMkuPsKbbROTrZc210DQUMeiJXQJS
	4wQz6qLw19RcOots2b9hX0snGWD3wVCbHSuA620Hcjo4xc2Cj3vyiEeEd/SvHdNBAzAn
	dr+A==
X-Gm-Message-State: ALKqPwf2tDHLXMjIIhDUd8a4PqrWyNn0yv/ex5rjxH8/uEAwquQO6VAG
	RvJT+GUt9E0L9UD1H1wOqyDGeTlv
X-Google-Smtp-Source: AB8JxZpt4hPx3s9wXUGuk2qGBLcLMpgFyU/kaLjVyKiB6QGsRILvVwTExQiTpyADEzstkDQmATYZBA==
X-Received: by 2002:a50:a550:: with SMTP id
	z16-v6mr23907668edb.103.1526911625186; 
	Mon, 21 May 2018 07:07:05 -0700 (PDT)
Received: from localhost.localdomain
	(86-41-167-216-dynamic.agg2.bnc.chf-qkr.eircom.net. [86.41.167.216])
	by smtp.gmail.com with ESMTPSA id
	d18-v6sm7393430edb.97.2018.05.21.07.07.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 07:07:04 -0700 (PDT)
From: Dave Smith <smithdm@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 21 May 2018 15:07:01 +0100
Message-Id: <20180521140701.51481-1-smithdm@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] LXC LICENSE is LGPLv2.1 not GPLv2.
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
X-List-Received-Date: Mon, 21 May 2018 14:07:07 -0000

From: David Smith <smithdm@gmail.com>

LXC is licensed under LGPLv2.1 not GPLv2. The COPYING file
referenced in the LXC recipe on all branches have the same content,
checksum  and all define LICENSE="GPLv2" rather than "LGPLv2.1".
---
 recipes-containers/lxc/lxc_2.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index c87b875..4918d91 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
 SECTION = "console/utils"
-LICENSE = "GPLv2"
+LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "libxml2 libcap"
 RDEPENDS_${PN} = " \
-- 
2.17.0


