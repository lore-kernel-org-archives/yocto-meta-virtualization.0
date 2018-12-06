Return-Path: <eric.chanudet@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 790EFE00C12; Thu,  6 Dec 2018 15:35:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (eric.chanudet[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 464F8E00AC5
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2018 15:34:57 -0800 (PST)
Received: by mail-qt1-f193.google.com with SMTP id y20so2550456qtm.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2018 15:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HnOfaVb3ZV3x2ekwnm6MA2OtyXoqNnDHCpGw1oV4CPk=;
	b=pe9WpO2GEBPHA8UFhvopJpJALLViUgWEk6k9TCXAtZkNPk460p5E35kHjd9vVdKo6a
	EVriljm2qrcHFLPidyPJRP1WH0b+Qj6BuYHUBuvuRuHFDd4+vqYN+AfIDf09Tn97p7IC
	PEJ+YtvbWrrFVd2r0PPXYcQ1ysK3n75Zk6P06qbUUgOZGt8xwciAMaSjsc6/Kx+xb9VF
	jRCZP+b1nkBHJew2Q6MpcVDrbs6RHBE723ao6dQCvXKZw/wKZ4BYYoO0LXmpA7KzaVpE
	LSyE/vIavSo1gei4WQd+YG5uDDXKpWTx7FxYTqcSv4NbVV8J23cuRlSTTuj1PWBKIqzB
	k1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HnOfaVb3ZV3x2ekwnm6MA2OtyXoqNnDHCpGw1oV4CPk=;
	b=N+DV0oyPZL3vkXCMIUUoTsMt1arQPGVMBMJpcSmx+dxEbLCDX1G4X7Lxo0XcZVc8NU
	/VxqeMRDEXF7hpwzeUDrwu10+O9/AlF7ZgcSQQh4WfxmtezDXcaQV9hm1bjgYp32XYuo
	weJh3NF/N4kZ9JmgNo2CKDmpLK8euIIaORV25tCxXfZf3tQ9bN1Q9zuL+2KC2DRhFWNH
	M43NGehBi8yXBPFUkeDSBf2pN/58ZHBQCtCYDJWIatBJy2WoncR3UgkRVFAGGYydZBEa
	QDWqc5eUbJYA2nWO2qGLRRS0o7d24CVuiBX8FmCmCoae2kL1F/T/ba2hopbK96DVjAu1
	CoGg==
X-Gm-Message-State: AA+aEWY7TkD4jR0/pL8loAWZQa8PKkA7lwHdqPeM5+ka3iG/oE0UyWU3
	bY8mHitlCqQ0c43rjGOioi03JJb9
X-Google-Smtp-Source: AFSGD/XWfSM+iqsKnPGB7LzBYb2ylElGk1i2ol7dAbZedphp/8EWQj18KaLwCyElEZKdF1+vrB+FkQ==
X-Received: by 2002:a0c:c212:: with SMTP id l18mr10557201qvh.75.1544139296126; 
	Thu, 06 Dec 2018 15:34:56 -0800 (PST)
Received: from localhost (pool-108-34-251-214.prvdri.fios.verizon.net.
	[108.34.251.214]) by smtp.gmail.com with ESMTPSA id
	d45sm1341105qtd.56.2018.12.06.15.34.55
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Dec 2018 15:34:55 -0800 (PST)
From: Eric Chanudet <eric.chanudet@gmail.com>
X-Google-Original-From: Eric Chanudet <chanudete@ainfosec.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2018 18:33:02 -0500
Message-Id: <20181206233302.25442-1-chanudete@ainfosec.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] xen: Amend do_install for FHS 3.0.
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
X-List-Received-Date: Thu, 06 Dec 2018 23:35:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FHS 3.0: /var/run -> /run
http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s15.html

systemd-tmpfiles throws some warnings with /var/run in xen.conf:
systemd-tmpfiles[981]: [/etc/tmpfiles.d/xen.conf:1] Line references path below legacy directory /var/run/, updating /var/run/xenstored → /run/xenstored; please update the tmpfiles.d/ drop-in file accordingly.
systemd-tmpfiles[981]: [/etc/tmpfiles.d/xen.conf:2] Line references path below legacy directory /var/run/, updating /var/run/xend → /run/xend; please update the tmpfiles.d/ drop-in file accordingly.
systemd-tmpfiles[981]: [/etc/tmpfiles.d/xen.conf:3] Line references path below legacy directory /var/run/, updating /var/run/xend/boot → /run/xend/boot; please update the tmpfiles.d/ drop-in file accordingly.
systemd-tmpfiles[981]: [/etc/tmpfiles.d/xen.conf:4] Line references path below legacy directory /var/run/, updating /var/run/xen → /run/xen; please update the tmpfiles.d/ drop-in file accordingly.

Signed-off-by: Eric Chanudet <chanudete@ainfosec.com>
---
 recipes-extended/xen/xen.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 7eb2ac4..e29e7f7 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -992,17 +992,18 @@ do_install() {
     oe_runmake DESTDIR="${D}" install
 
     # remove installed volatiles
-    rm -rf ${D}${localstatedir}/run \
+    rm -rf ${D}${base_prefix}/run \
+        ${D}${localstatedir}/run \
         ${D}${localstatedir}/lock \
         ${D}${localstatedir}/log \
         ${D}${localstatedir}/volatile \
         ${D}${localstatedir}/lib/xen
 
     VOLATILE_DIRS=" \
-        ${localstatedir}/run/xenstored \
-        ${localstatedir}/run/xend \
-        ${localstatedir}/run/xend/boot \
-        ${localstatedir}/run/xen \
+        ${base_prefix}/run/xenstored \
+        ${base_prefix}/run/xend \
+        ${base_prefix}/run/xend/boot \
+        ${base_prefix}/run/xen \
         ${localstatedir}/log/xen \
         ${localstatedir}/lock/xen \
         ${localstatedir}/lock/subsys \
-- 
2.19.1


