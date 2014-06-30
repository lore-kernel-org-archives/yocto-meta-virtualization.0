Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E41F5E006D1; Mon, 30 Jun 2014 14:48:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64224E00507
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:19 -0700 (PDT)
Received: by mail-pd0-f170.google.com with SMTP id z10so8952328pdj.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 14:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CFKk2PFX3v1nZBdHp8rUcCI154U6/jeotMyWpah6iu0=;
	b=UbkSBF3mzyXHzQJ8QoYnNjqVYTF+6TuMb3tm8lzRjnvXzOJ5XLR2Y5R5h9ENIPsEaq
	zxHXdW9LV7d2pz0ysdyevlJuad8db2biDMGvAodc03d1uMU8r7fgfXKj3Gar6uL8ZFke
	N8OFFlRLiUfhBIrPim2GoJfkGhz+ehV77+57DzbbfNzHkKQOc5cZmhccgpzVQv+iNDcX
	JIe9vIvACx5GtM/zwUaH1n8kWNmbWKlFPyt4LwJEmay2q3wEqAGAx8nG60XTi9rAXNbz
	pTyPcVYC530KqOa4js6rkaQvsmVQRzkzK1kbZ8GOUKhx+jeuR7xhkRGxx2YvnIoY4pT4
	RaIQ==
X-Gm-Message-State: ALoCoQlT18vBV2unwiLzgBRW5SkMjGvo4U/hEBlllvNi/Ur8VtPIl16hrltE5v/z0xiGjHbkKGpv
X-Received: by 10.66.164.234 with SMTP id yt10mr55544737pab.65.1404164899434; 
	Mon, 30 Jun 2014 14:48:19 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ir10sm29325691pbc.59.2014.06.30.14.48.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jun 2014 14:48:18 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 30 Jun 2014 14:48:08 -0700
Message-Id: <1404164895-19815-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 0/7] Remove use of PRINC
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

PR .= instead of PRINC


Armin Kuster (7):
  [meta-openstack] apache2: Remove PRINC reference
  [meta-openstack] iptables: remove PRINC reference
  [meta-openstack] lighttpd: remove PRINC reference
  [meta-openstack] postgressql: remove PRINC reference
  [meta-openstack] linux-yocto_3.10: remove PRINC reference
  [meta-openstack] linux-yocto_3.14: remove PRINC reference
  [meta-openstack] linux-yocto_3.4: remove PRINC reference

 meta-openstack/recipes-extended/apache2/apache2_2.4.9.bbappend      | 2 +-
 meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend   | 2 +-
 meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend   | 2 +-
 meta-openstack/recipes-kernel/linux/linux-yocto_3.10.bbappend       | 3 ++-
 meta-openstack/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 2 +-
 meta-openstack/recipes-kernel/linux/linux-yocto_3.4.bbappend        | 2 +-
 meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend | 2 +-
 7 files changed, 8 insertions(+), 7 deletions(-)

-- 
1.9.1


