Return-Path: <yan.yankovskyi@globallogic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1CF31E00C77; Wed, 30 Aug 2017 02:03:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.54 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1FF2E00C14
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Aug 2017 02:03:04 -0700 (PDT)
Received: by mail-lf0-f54.google.com with SMTP id d17so22162435lfe.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Aug 2017 02:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=p247Q6YQJFcmEya2TbGd5fzwYZTXDxAStyHwqF6ttuM=;
	b=L+butNwmS0zO8T+122bk9RwcLZSsMbL+Rv+bkSq/LWyc8xBBxGtljOKWwECdQk1uNX
	My260XdmM8GX4/xKAA+vkAJmmnGITjXmACKITVycURDVC/1j6ATV2C28hhKDbsQXwrLQ
	RPxYK41EBoCWf7HcWhOd6UnBGxA8L3ZJ/8m7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p247Q6YQJFcmEya2TbGd5fzwYZTXDxAStyHwqF6ttuM=;
	b=fvqqKow5qh1rHDsTfdr+44GK3Y9q6n7MaPZYKuxy1QzqPpY8cUMZwN59No+3fQ3eaR
	yRfNQkJvUZYKbsEWLwOrvKJvQKMh7zuTTo0Rlw1ZzLl6UPRUe/+Z1o1rhFUNMjxaiTRD
	AY+7G9/6iybbhrkuhpokhLYNpjqXXmcNbK1ddrQo45FUCh6M9ws4US6ty7ZB2ozfesEi
	Y0kfcbVvaXwCgaMJtCoUT+Y0nh3eV2VyziOKC4fmQ5D4WT/NnTnRW5Ze35kRu5khUgfC
	ICwfq05lYh9WRVvoESvX8N1RwUuBj9sh7hgzDcD1gyMjxRkqwWwhihFMFXeQNW3f3j2h
	/mKQ==
X-Gm-Message-State: AHYfb5giLrt6OgKuzNojHy5WLlxh3tttAgPqc0cdkBCfAz3rcGzME+Xi
	r4RnI0kQ+/72fTe0on8=
X-Google-Smtp-Source: ADKCNb7bKG3QB/VzeltcxlcVRJQQjXvuKsL0ktOZB8sSv6z9wYZVDqkI7vRzBC9CTOkbO7I8gwsDpA==
X-Received: by 10.46.86.137 with SMTP id k9mr400470lje.115.1504083783140;
	Wed, 30 Aug 2017 02:03:03 -0700 (PDT)
Received: from administrator-HP-Z230-Tower-Workstation.synapse.com
	([2001:67c:2e5c:2089:d487:e463:4840:e792])
	by smtp.gmail.com with ESMTPSA id y20sm854665lfk.90.2017.08.30.02.03.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Aug 2017 02:03:02 -0700 (PDT)
From: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 30 Aug 2017 12:03:15 +0300
Message-Id: <1504083795-20546-1-git-send-email-yan.yankovskyi@globallogic.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] xen: delete references to xenstored.socket and xenstored_ro.socket in xen.inc
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
X-List-Received-Date: Wed, 30 Aug 2017 09:03:07 -0000

These files were removed since the following patch
http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=976ce01e103fc03bb3336cdbc6c951a709e285fe
and are absent in xen 4.8.0 and further, which leads to
the following error during the Xen build process:
do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not exist

Signed-off-by: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
---
 recipes-extended/xen/xen.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index b5c5f03..717424b 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -687,8 +687,6 @@ FILES_${PN}-xencommons += "\
     ${systemd_unitdir}/system/xenconsoled.service \
     ${systemd_unitdir}/system/xen-init-dom0.service \
     ${systemd_unitdir}/system/xenstored.service \
-    ${systemd_unitdir}/system/xenstored.socket \
-    ${systemd_unitdir}/system/xenstored_ro.socket \
     ${systemd_unitdir}/system/var-lib-xenstored.mount \
     "
 
@@ -728,8 +726,6 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
     xenconsoled.service \
     xen-init-dom0.service \
     xenstored.service \
-    xenstored.socket \
-    xenstored_ro.socket \
     "
 SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
 
-- 
1.9.1


