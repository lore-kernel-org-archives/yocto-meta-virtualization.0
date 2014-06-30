Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA6A4E00721; Mon, 30 Jun 2014 14:48:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 023EBE006DB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:25 -0700 (PDT)
Received: by mail-pa0-f51.google.com with SMTP id hz1so9305651pad.24
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3QIuqeFzdNbHMtE+/4qYGfz5AuypTLHIsUPd3DDLg/g=;
	b=Ff/kMpFSfCoIVDDJtc1k8r33qWCXniaBuWEjqmV9vab0A1vlDsTB5wBYUGud94vYni
	n4sxbk7JBXu2yMSdUIkFejOUWnN5xPvWMbgRZAFEYZp3wrYHZnvYkUuCr2Pprb3XqYWY
	M39vOKc3p2ircdfvgxxbuv4B0hQMTA/ZT8EguZux48BxXhnBOmyuwTkkAhrX0wjHQtss
	66BITHkMUCP7s+9kufZGU76QzhTmftmIN+Pp+RC9wlESQUcSnzTtJOoAG7sL4+OWgvMh
	G7duCZGLo+l/tHdP4nHJANbFt5TWQTMSqDDTZexQQMe0jniMPton7V+Q2xQRI9vfsCgD
	Mhng==
X-Gm-Message-State: ALoCoQkHyAX53bGTycdBqqCz6eny+yA0WzS8CytLWG95m2HMOP6BYW++bo0tvKpBed8potzMCDUs
X-Received: by 10.66.185.4 with SMTP id ey4mr55668508pac.126.1404164904810;
	Mon, 30 Jun 2014 14:48:24 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ir10sm29325691pbc.59.2014.06.30.14.48.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jun 2014 14:48:24 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 30 Jun 2014 14:48:12 -0700
Message-Id: <1404164895-19815-5-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404164895-19815-1-git-send-email-akuster@mvista.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 4/7] [meta-openstack] postgressql: remove PRINC reference
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
X-List-Received-Date: Mon, 30 Jun 2014 21:48:30 -0000

replace PRINC with PR .= ".1"

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend b/meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend
index d2dbd91..027ff9d 100644
--- a/meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend
+++ b/meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 1}"
+PR .= ".1"
 
 SRC_URI += "file://postgresql \
             file://postgresql-init"
-- 
1.9.1


