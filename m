Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AA8CE01684
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Oct 2013 06:13:13 -0700 (PDT)
Received: by mail-lb0-f182.google.com with SMTP id c11so5852267lbj.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 Oct 2013 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=v/H354W5/+Acu5VUrr/XXkwzmaFKjo+tH84WoRqeMhY=;
	b=yq1ZNHcEKhtzWcZ6UAP8imdyDy+arbunMumSlUCJkkLJsVFqsSL3zhyp518mveOdjh
	EDfJcBvHgDGdmQ5ulR1g0pd030p3LwS8Sxaiv1reV54MZ93flFJ8i0JPszjaFTQliAO3
	2WN20TLvRwB4eZdDaO3346EhqRE38IJ25tq6J/biB/ASp4L9oAKXPib3st/s3N532SGz
	7YXXh7+sWvZrTrdsilDXz14XMoLdVLqoZMoAX6stYv1ezV0Ox6EIBCfS0dOEH2l9AYPg
	jzpjd7VaMtLHLFI6eU25WUaySQ7JzYLfw5Z9nVtGA35vTF5aeAwz1xCVbJ0VbQoXoPK6
	yB6A==
X-Received: by 10.152.87.143 with SMTP id ay15mr25069268lab.2.1380633192098;
	Tue, 01 Oct 2013 06:13:12 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id e4sm4018889lba.15.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Oct 2013 06:13:11 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 4889A4006DD; Tue,  1 Oct 2013 15:13:07 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  1 Oct 2013 15:13:00 +0200
Message-Id: <1380633180-10459-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] busybox: Add getopt since lxc templates require it
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
X-List-Received-Date: Tue, 01 Oct 2013 13:13:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-core/busybox/busybox/getopt.cfg      | 2 ++
 recipes-core/busybox/busybox_1.21.1.bbappend | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 recipes-core/busybox/busybox/getopt.cfg

diff --git a/recipes-core/busybox/busybox/getopt.cfg b/recipes-core/busybox/busybox/getopt.cfg
new file mode 100644
index 0000000..8dcd350
--- /dev/null
+++ b/recipes-core/busybox/busybox/getopt.cfg
@@ -0,0 +1,2 @@
+CONFIG_GETOPT=y
+CONFIG_FEATURE_GETOPT_LONG=y
diff --git a/recipes-core/busybox/busybox_1.21.1.bbappend b/recipes-core/busybox/busybox_1.21.1.bbappend
index 7d71c7d..8369a03 100644
--- a/recipes-core/busybox/busybox_1.21.1.bbappend
+++ b/recipes-core/busybox/busybox_1.21.1.bbappend
@@ -6,4 +6,5 @@ SRC_URI += " \
 	    file://mdev.cfg \
 	    file://mount-cifs.cfg \
 	    file://ps-extras.cfg \
+	    file://getopt.cfg \
            "
-- 
1.8.3.2


