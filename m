Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40BDAE006CD; Mon, 30 Jun 2014 14:48:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.174 listed in list.dnswl.org]
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 247DAE0030B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:23 -0700 (PDT)
Received: by mail-pd0-f174.google.com with SMTP id y10so8944939pdj.33
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SIjTrqhRLmFVOmYXrkGPNPNapbIlLk48dQo2PqYoZkk=;
	b=GDXhwIHDfI7KukLVJodo1nlSv7pEdIAQ7yJcXhNkHW6Qn7KUenCdBR1OPmvTNI8dmB
	UZGkaLy+xQa0w21W7EskGoimYVALiyuxFrvHyj7gKbga5/A1lVTz25bcGe/TWfEuNGJl
	WKFLmh/KK7xocnVYxYkIDZxy0AxxLb3G1hp9AmwIi6PaHwpz2QMaTAhfO+toSTNCJvN0
	U2ZLH5EpR+B2wmRPDyXOWfiRW+jrPjaccWUbbrwOYx9RZGZ4Sj5dRb8PYMtgcBKYxnKL
	aQFeK/LkI9wCcGG5jb9INmnv+QPR5/j+FM8fv5/8zNILiDvRfLOwcxgrDysWqjjt/rwq
	l5KQ==
X-Gm-Message-State: ALoCoQkRmmEip4c4QPYSg0NuusKiZy9A1hJRv23kr6ebYz5EyCQi1kIGT7flNF44n/nj7mykujuc
X-Received: by 10.66.162.137 with SMTP id ya9mr56195448pab.31.1404164903324;
	Mon, 30 Jun 2014 14:48:23 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ir10sm29325691pbc.59.2014.06.30.14.48.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jun 2014 14:48:22 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 30 Jun 2014 14:48:11 -0700
Message-Id: <1404164895-19815-4-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404164895-19815-1-git-send-email-akuster@mvista.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 3/7] [meta-openstack] lighttpd: remove PRINC reference
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
X-List-Received-Date: Mon, 30 Jun 2014 21:48:27 -0000

replace PRINC with PR .= ".1"

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend b/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend
index 50fab9f..90f1758 100644
--- a/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend
+++ b/meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend
@@ -1,4 +1,4 @@
-INC := "${@int(PRINC) + 1}"
+PR .= ".1"
 
 do_install_append() {
 	sed -i '2i port=`grep "^server.port" /etc/lighttpd.conf`; if [ -z $port ]; then echo "server port not configured, not running lighttpd..."; exit 0; fi' ${D}/etc/init.d/lighttpd
-- 
1.9.1


