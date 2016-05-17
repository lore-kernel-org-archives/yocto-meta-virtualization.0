Return-Path: <anders.roxell@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DEE56E00D58; Tue, 17 May 2016 06:44:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E446E00D0C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 May 2016 06:44:20 -0700 (PDT)
Received: by mail-lf0-f53.google.com with SMTP id u64so7034386lff.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 May 2016 06:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ISPgLFFmK7kWDYskhq/oEIfLP3DHTgh65iYy2OwbrrE=;
	b=drsIpmKktgcS5cAUUmih0uDjrPXZW5OmIgkynd+M46abVmbpzMdM9aaM4mNOdw7t1L
	mglxvi3hHib18bLg/ozjt12yIr1Qz+Ngsirh/1aPkGZw1gaBmohUIlErxyzNrw9UAXLI
	wTP7E+jtuQtqyB1ZpdxBr7oG+Lu3sBREp6bJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ISPgLFFmK7kWDYskhq/oEIfLP3DHTgh65iYy2OwbrrE=;
	b=XPB14g2NNey3BJ0TGHmogd5q46Ug9WIPdt6YzAPjULAn9fQ/rO/kr2r08Cj9nErAKT
	BCDQ0WaDx7q8CdLKV0fkhlGvdxV6gmakohb+Bltx6VYQJiH9JHg0t+gqCDs2lnkluXXw
	5742vVEDT7MUHzfviwlnKcNrcs579lYp4q2RgZus1NSBys/shU+Wn/K+5UxqeY6veu+M
	26wAc4GA6003nELyWIuRdeLbQ2vHjhG+HhlFm1nbp2ywIurp6SSH2n7H0Udc+dIRHV6K
	TvLltnNZ1G5y5u/Teu3etyMwDfxGPxuR7FQDXP3cmEWMFuk8nyAkJz2D2zrd21NQYu/T
	nhtw==
X-Gm-Message-State: AOPr4FW2mxoCs6LhaFeeULeDdEuM6BtOgXsZTUh39D39M8O/rdHw5DCIA5Ys2AZ9w6jlAXdy
X-Received: by 10.25.152.133 with SMTP id a127mr591040lfe.36.1463492657472;
	Tue, 17 May 2016 06:44:17 -0700 (PDT)
Received: from localhost (c-c82171d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.113.33.200])
	by smtp.gmail.com with ESMTPSA id j2sm538461lfb.13.2016.05.17.06.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 06:44:16 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 May 2016 15:35:50 +0200
Message-Id: <1463492150-4296-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lxc: workaround to ignore deprecated
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
X-List-Received-Date: Tue, 17 May 2016 13:44:23 -0000

Recent patch did deprecate a standard POSIX function [1].

This is the build error:
| ../../../lxc-2.0.0/src/lxc/cgfs.c: In function 'cgroup_rmdir':
| ../../../lxc-2.0.0/src/lxc/cgfs.c:172:2: error: 'readdir_r' is deprecated [-Werror=deprecated-declarations]
|   while (!readdir_r(dir, &dirent, &direntp)) {
|   ^
| In file included from ../../../lxc-2.0.0/src/lxc/cgfs.c:30:0:
| /.../build/tmp-glibc/sysroots/qemux86-64/usr/include/dirent.h:183:12: note: declared here
|  extern int readdir_r (DIR *__restrict __dirp,
|             ^

[1] https://www.sourceware.org/ml/libc-alpha/2016-02/msg00093.html

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 recipes-containers/lxc/lxc_2.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.0.bb
index 9f01edd..5004b9e 100644
--- a/recipes-containers/lxc/lxc_2.0.0.bb
+++ b/recipes-containers/lxc/lxc_2.0.0.bb
@@ -47,6 +47,8 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 EXTRA_OECONF += "--enable-log-src-basename"
 
+CFLAGS_append = " -Wno-error=deprecated-declarations"
+
 PACKAGECONFIG ??= "templates \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
 "
-- 
1.9.1


