Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8E3EE01480
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:48 -0800 (PST)
Received: by mail-ee0-f52.google.com with SMTP id b15so3353384eek.39
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=wqLsYMUY5dU3piozOqZdnIz3QTnA4jArQK4ydipwya0=;
	b=eOdWtZb3XSxTGshAI6IwOngzDCfRHwf15KI8Q7V1wu7FZdc/SXsIRtFU7pHbKS6j6m
	Em0AHP74G5A7vcOXpU/8CZR0sbKAhmFzpvndLk4UTaAFNr0wtfrsbU9mczxLvjTUOHlQ
	weSPzM3zlN8PLcuyQBoi1IwPn7S7hF0RWhHYRAIm2Xmb511mesjPyJV47wM0EuaFUZpW
	MZH7atfoQ/K7xTPAgwFH3x7GI5TzP88juQf6hCvPle5/MffEqcv6yuSOCYz0I9/u2kta
	JJHCoyklw+lwV/D4dml6MD824niCApj/WveRhGkEVAsIk4kSzj+hBPyzlOFRnguswgCI
	zOrw==
X-Received: by 10.14.207.195 with SMTP id n43mr71941602eeo.38.1358858867889;
	Tue, 22 Jan 2013 04:47:47 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id k4sm26915931eep.15.2013.01.22.04.47.46
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:47:46 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id E5AAE4010E1; Tue, 22 Jan 2013 13:47:31 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Jan 2013 13:47:21 +0100
Message-Id: <1358858841-13339-7-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
References: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] Fixed build breakage in iasl-native
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
X-List-Received-Date: Tue, 22 Jan 2013 12:47:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-extended/iasl/iasl_20120215.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/iasl/iasl_20120215.bb b/recipes-extended/iasl/iasl_20120215.bb
index 9474e56..b48e380 100644
--- a/recipes-extended/iasl/iasl_20120215.bb
+++ b/recipes-extended/iasl/iasl_20120215.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.acpica.org/"
 LICENSE = "Intel"
 LIC_FILES_CHKSUM = "file://asldefine.h;endline=115;md5=d4d7cf809b8b5e03131327b3f718e8f0"
 SECTION = "console/tools"
-PR="r0"
+PR="r1"
 
 DEPENDS="flex bison"
 
@@ -18,7 +18,7 @@ NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
 
 do_compile() {
-	CFLAGS= $MAKE
+	CFLAGS="-Wno-error=redundant-decls" $MAKE
 }
 
 do_install() {
-- 
1.7.9.5


