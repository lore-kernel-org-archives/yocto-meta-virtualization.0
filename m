Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B63AE00507; Mon, 30 Jun 2014 14:48:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65562E0053A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:21 -0700 (PDT)
Received: by mail-pd0-f170.google.com with SMTP id z10so8980733pdj.29
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/0dksCIGeZ06nXdrbH1/Gs1a0fZxbAQUVgCtRq+EX9k=;
	b=DZYuRJtN9nv2LyTkbGqSiM6JTWDxKFjO1MEgS/DxevuejMCIziEzpHzUFxQ0LGaRjI
	Xf43inszV0pfCr9nbZ2uR7xPVMR41kp5ur8GKMtD2h6CIcOKsfVZ689KdWAqTwndFF3J
	3KNgYNlF8XDR73Rgk0YHO1qJRXLG/5DgAJnAynv1DFMQIs6f8Q9YSV///xDc8jESZGUN
	6Zkmy2IpiH0GrqMBzF1R5r9csZU9wvdSoeWj2xDA+qzS0i3F9D7806GHVtBH/132GdgZ
	n33MDgIXbi1TxYR6Zxdb7lnEjL/HGgQRHrF+7yvJJKtkjDXVxl6jhn+SJsntpCnpTIda
	WwYg==
X-Gm-Message-State: ALoCoQmGUiOcQ7iucdCnOXbUDXuVs/NTYX1Db9rTJPnu46DQ9FQolpnfKs9Z2YyLR15oYMLwFZWq
X-Received: by 10.66.254.198 with SMTP id ak6mr56114924pad.156.1404164900994; 
	Mon, 30 Jun 2014 14:48:20 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ir10sm29325691pbc.59.2014.06.30.14.48.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jun 2014 14:48:20 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 30 Jun 2014 14:48:09 -0700
Message-Id: <1404164895-19815-2-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404164895-19815-1-git-send-email-akuster@mvista.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 1/7] [meta-openstack] apache2: Remove PRINC reference
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
 meta-openstack/recipes-extended/apache2/apache2_2.4.9.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/apache2/apache2_2.4.9.bbappend b/meta-openstack/recipes-extended/apache2/apache2_2.4.9.bbappend
index 7aca867..1755e13 100644
--- a/meta-openstack/recipes-extended/apache2/apache2_2.4.9.bbappend
+++ b/meta-openstack/recipes-extended/apache2/apache2_2.4.9.bbappend
@@ -1,4 +1,4 @@
-INC := "${@int(PRINC) + 1}"
+PR .= ".1"
 
 do_install_append() {
     sed -i -e 's/#ServerName.*$/ServerName 127.0.0.1:80/' ${D}${sysconfdir}/apache2/httpd.conf
-- 
1.9.1


