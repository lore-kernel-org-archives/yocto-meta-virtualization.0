Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E45BE009A5; Thu,  5 Jan 2017 09:05:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.214.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.214.50 listed in dnsbl.sorbs.net]
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CC53E00963
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Jan 2017 09:05:26 -0800 (PST)
Received: by mail-it0-f50.google.com with SMTP id 192so6544506itl.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Jan 2017 09:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=zrekljGSUrGplHNrL7kA5T6LSMs9KXhY2dSIdzxHGs0=;
	b=Ft+gftMyj799d1PTCB57yLt0zbf7l75Ou6T4awvQcao6oUZV4JWok3VsTYxm8uYQoQ
	DGFsU6XlwRKqM1oO3QNA1AKOsHD/CDH1hdXiDQ1UKPPb5ucW/PTRyUP2zMJtNXPFQ/Pi
	uM9YzbdPtHxXvyO3kWDqMbEO45BdgT0KweXzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zrekljGSUrGplHNrL7kA5T6LSMs9KXhY2dSIdzxHGs0=;
	b=X1s4SoAYbjH++QvKzzJqUXMxThnviYpvX4UcBJklULsn8Qs0/bGSUbr1vg8HqLnEyg
	tmnnplKpd6aLAuhOxi/Dvk+5yuvmdPLeHG8C0/OvvAIgdoAM2AclqA3/rocZq5YyN2e2
	ZeYrE5UDl38A4rwUBJXs+QGdLfovwLRuynGkCz7mQB2Xxd8IM7QhF/iaaQqaDabWXk7V
	MlKgWX+dmIzSyw3JdLFcL295mAT/bFJZrNDwSs1ckx2AjlqYExOyMj/9jls38ULoMsMN
	WxiilxSgWTvcaaBiVojh7IUOawk+6pOCCfs/nrLyJ9I6HFovrOhi/5K0EXQsbrrlVi6A
	2GQA==
X-Gm-Message-State: AIkVDXJY3KpGhTNE6LnD+fmbdOfGCauwkV86jApLa45OGtx7hNlMiblE+S6FzUkY8SHDsg==
X-Received: by 10.36.123.23 with SMTP id q23mr57054510itc.12.1483635926366;
	Thu, 05 Jan 2017 09:05:26 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	j201sm36362592ita.2.2017.01.05.09.05.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 09:05:25 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Jan 2017 11:05:20 -0600
Message-Id: <20170105170523.1318-1-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 0/3] more Xen updates
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
X-List-Received-Date: Thu, 05 Jan 2017 17:05:30 -0000

Here are some updates for master and morty. The README is something that I hope
is ok to try and provide users some more info when they work with Xen.

Doug Goldstein (3):
  xen: update license checksum
  xen: remove unused patch
  xen: add a README to provide info for users

 recipes-extended/xen/README                        | 23 +++++++++
 ...l-compilation-warning-fix-for-arm-aarch64.patch | 58 ----------------------
 recipes-extended/xen/xen.inc                       |  2 +-
 3 files changed, 24 insertions(+), 59 deletions(-)
 create mode 100644 recipes-extended/xen/README
 delete mode 100644 recipes-extended/xen/files/libxl-compilation-warning-fix-for-arm-aarch64.patch

-- 
2.10.2


