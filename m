Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5773AE00E94; Thu, 14 Apr 2016 17:55:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4998E00AD7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Apr 2016 17:55:03 -0700 (PDT)
Received: by mail-qk0-f180.google.com with SMTP id n63so23277577qkf.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Apr 2016 17:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YLyAA/z76Nsci8TvH5a9htegSXY35KuIVv5C2R6e5d0=;
	b=lWFFaCd+9pX2immcB6QEffvv/M8XHWFKDEwxkpov6ABnOM3k1dAhFV9nJZRJlbq6Up
	BXmxeN8+XHlj9HXHn8M5bGOIdINnHyZ1II/UMXOITz+cUYd5g9iI9sssXqEEEmhh6LAH
	E/MteSnpoDxa4QEGL/CjcvGUqd89cqqFr8IvrS9iN2gp48RoNZMptabY8oEov6Z6YJ1w
	t1DHekIe+ckZMe118fPiIGA7iqeqfYJtOUrBrAwmotjcHsX7Uyze+QJGeKatcfCuGWI1
	411u8n0qI1V2jIbqlK3NoRWEdc4CmI9yBqOtrCpEYiZzFQSmULqLsV+rdDVJaMLouRUk
	t1pQ==
X-Gm-Message-State: AOPr4FXqMDwqJyy2OSxrNaReV/rC7TMR7i3fP1ys/C3YXFuXtXeDSbXKo5nq66z8nnLnTA==
X-Received: by 10.55.74.75 with SMTP id x72mr22698772qka.100.1460681702572;
	Thu, 14 Apr 2016 17:55:02 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id n1sm3009762qkn.3.2016.04.14.17.55.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 17:55:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Thu, 14 Apr 2016 20:54:54 -0400
Message-Id: <1460681694-16457-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] dev86: update to version 0.16.20
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
X-List-Received-Date: Fri, 15 Apr 2016 00:55:05 -0000

Also supress the warnings about executables being already stripped

Signed-off-by: Derek Straka <derek@asterius.io>
---
 recipes-extended/dev86/{dev86_0.16.19.bb => dev86_0.16.20.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename recipes-extended/dev86/{dev86_0.16.19.bb => dev86_0.16.20.bb} (82%)

diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-extended/dev86/dev86_0.16.20.bb
similarity index 82%
rename from recipes-extended/dev86/dev86_0.16.19.bb
rename to recipes-extended/dev86/dev86_0.16.20.bb
index 0402c99..38dbf8d 100644
--- a/recipes-extended/dev86/dev86_0.16.19.bb
+++ b/recipes-extended/dev86/dev86_0.16.20.bb
@@ -7,8 +7,8 @@ PR="r0"
 
 SRC_URI="http://v3.sk/~lkundrak/dev86/archive/Dev86src-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "442e98e1afa23fe00d40c5a996385942"
-SRC_URI[sha256sum] = "33398b87ca85e2b69e4062cf59f2f7354af46da5edcba036c6f97bae17b8d00e"
+SRC_URI[md5sum] = "567cf460d132f9d8775dd95f9208e49a"
+SRC_URI[sha256sum] = "61817a378c8c8ba65f36c6792d457a305dc4eedae8cdc8b6233bf2bb28e5fe8d"
 
 S = "${WORKDIR}/dev86-${PV}"
 
@@ -35,3 +35,4 @@ do_install() {
 }
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 FILES_${PN} += "${libdir}/bcc"
+INSANE_SKIP_${PN} = "already-stripped"
-- 
1.9.1


