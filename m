Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53E32E00C2D; Thu, 14 Apr 2016 17:55:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3669E00AD7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Apr 2016 17:55:50 -0700 (PDT)
Received: by mail-qg0-f54.google.com with SMTP id f105so73566788qge.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Apr 2016 17:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P3gV6FoEyw/fxLeGTz5tc4ys93wmm1M4uSgXdJIyC/A=;
	b=Fr/VUfeDpRKpy8aVU4DFm/AfNei7ltK1Q0w9QpZPiXyXrpKfMK935F9YqGYaKubvzz
	hJ9ykMVzauDk6CyQGq1ArtDc63bt8JE0wr7YSfVOBrgd0GDQG40+T8vUAHlT3vyZQyU0
	Lz3SgehOxu7ccgz+ZRROJ2URqEiguyb4CjFMKHaJnKW2QeMzwMMAXsQSL+8wHmcuLVh+
	1jfRfoUWk18YcReux5G9/DIYuoMpkSJkSAUsxfDZAhzhFMdo1xfGQkKGABvjQIbx4diI
	gyG/H5e4y3gItLZUVrK7wrnk4wVzqnTSo1Dmr4vxky5KGKLrWwH1B7TkhjjquF2dBl91
	OZtg==
X-Gm-Message-State: AOPr4FUsX5jbgC4/FOw0CMJezOFe8AMbKwUvmzAURFbmzlLeNRr5S62j0XPWKH3BO0NMBQ==
X-Received: by 10.140.44.8 with SMTP id f8mr21512810qga.42.1460681749968;
	Thu, 14 Apr 2016 17:55:49 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	g11sm11568407qhg.22.2016.04.14.17.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 17:55:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Thu, 14 Apr 2016 20:55:39 -0400
Message-Id: <1460681739-16510-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] seabios: update to version 1.9.1
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
X-List-Received-Date: Fri, 15 Apr 2016 00:55:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-extended/seabios/{seabios_1.9.0.bb => seabios_1.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/seabios/{seabios_1.9.0.bb => seabios_1.9.1.bb} (86%)

diff --git a/recipes-extended/seabios/seabios_1.9.0.bb b/recipes-extended/seabios/seabios_1.9.1.bb
similarity index 86%
rename from recipes-extended/seabios/seabios_1.9.0.bb
rename to recipes-extended/seabios/seabios_1.9.1.bb
index 4808a18..88f2963 100644
--- a/recipes-extended/seabios/seabios_1.9.0.bb
+++ b/recipes-extended/seabios/seabios_1.9.1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
                     "
 
-SRC_URI[md5sum] = "c3fea87e731e396bd4e7e2c478ba39d9"
-SRC_URI[sha256sum] = "88595545c6d580a7a6da1c40befc46dd74c0e4aaf808547867dd7ce8cc3b4d0e"
+SRC_URI[md5sum] = "e21b6f3e54d492be837ef20d66617f81"
+SRC_URI[sha256sum] = "8a2a562fe5cfd37fe8327cdc4a60accdfe441e235b29e6999fdeb442ba98d608"
 
 FILES_${PN} = "/usr/share/firmware"
 
-- 
1.9.1


