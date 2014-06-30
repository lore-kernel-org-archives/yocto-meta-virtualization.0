Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0D20E006EF; Mon, 30 Jun 2014 14:48:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.54 listed in list.dnswl.org]
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8A7BE006D1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:27 -0700 (PDT)
Received: by mail-pa0-f54.google.com with SMTP id et14so9294380pad.41
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0xGRyrfZ0iaFqLAL8emkaQQdMTwRysH9Qnb6RjBKm9w=;
	b=ADupVB50bzleLHnDl0yNq84GqTbpvXUVRCKrwlege3gb+7L/PUuYLF1frRuwlQuDQu
	Ufr0tYerdQFcRUQ5bjS40xeLDg/Pys3g7EV80AxNVpJVBvK0AUllEPRwRdZLtTiG7X0G
	+3v570ksnmKoLyoNg80GZX02stNvBDbydB6YEELalmUNuOzwETg1hLi6hPjZ5OF2/4Ar
	ZPhjwII2oqWxooGNi+hnH7DDZV7OP1XhhBPoPHuarZHXPA1mHCzni0UODwimTNh/HWlN
	zMrzltmM/GaqocHeXQp2/m37Nzu4UwqR6kZf7lNhgLz2Amuj77lQ2BNWsk9nHSVLUevB
	cEqg==
X-Gm-Message-State: ALoCoQlrPOjA8k++kqFolQ7jxe6UTMTxz3gnFHC4IeH/3g5OvCWecILvJa1T9bcHaI4ahiyzzoTr
X-Received: by 10.66.66.140 with SMTP id f12mr55615684pat.78.1404164907247;
	Mon, 30 Jun 2014 14:48:27 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ir10sm29325691pbc.59.2014.06.30.14.48.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jun 2014 14:48:26 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 30 Jun 2014 14:48:14 -0700
Message-Id: <1404164895-19815-7-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404164895-19815-1-git-send-email-akuster@mvista.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 6/7] [meta-openstack] linux-yocto_3.14: remove PRINC reference
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
X-List-Received-Date: Mon, 30 Jun 2014 21:48:31 -0000

replace PRINC with PR .= ".1"

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-openstack/recipes-kernel/linux/linux-yocto_3.14.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto_3.14.bbappend b/meta-openstack/recipes-kernel/linux/linux-yocto_3.14.bbappend
index d243d6a..5652441 100644
--- a/meta-openstack/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/meta-openstack/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 1}"
+PR .= ".1"
 
 SRC_URI += "file://enable-veth.cfg \
             file://enable-iscsi-tcp.cfg \
-- 
1.9.1


