Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D40F5E00D34; Tue, 17 Oct 2017 07:44:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.196 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0D66E00BE8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:03 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id n61so4000426qte.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=1Hm1JnePIp4Ln4WB6bOcLigMrbxuUIhQTTEulfHCc9I=;
	b=P01iQLu727FB5SfRUUO8y7BFfeMmkZnshqY7u6KiJ2TcLqBvf/V1b8/r4vVi/LkRux
	8tpEfreW4Sotqa/X54kYpNhOb/BCbSbKI+CXn8Ncj4vMhNyXdVy0DF2tuVS7lOTDL6AJ
	sRHXx1YDgt7BUSUvUzK8MlgjeFv23u7KfoMoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1Hm1JnePIp4Ln4WB6bOcLigMrbxuUIhQTTEulfHCc9I=;
	b=Djd5mNjfJRwE1UYorAGTKOiyP6957hUSGRRgUWz92yrd8JcdAcDJcVzPC9BzXLZrCP
	IZy3AblP7xuG+w01Nh5HS3fkiVXNg2Guk1npwwllGucrrcg0bip6yF1aOBn4Qsj3oUey
	mu0eau5Kpq3GZENyATSCyzMKE+CmCJ1eidEMVONxDCJg4HJM9pAD3Q1DpfE5XGb+xhxr
	K4r0XoZJGfPLCmsJSSfZ1EvAS3gWZUypqxtOWuPxgY3Zh2JWt56kM+XzvcCSrnb/HGhZ
	Wlv0nTkodRDK05GlaHVLrjqHi0JY5bXNYkWgQF6BWLLE+hWhOAaKH97YqTn+C3Ukf9hW
	NiXw==
X-Gm-Message-State: AMCzsaUANg0nhWJWunQ04TTAGVKosYBczZzxf3E6ZJSvgUVhpnqGApms
	Lle3AWcVWCHQD8bKC55lNWZo1tMppBo=
X-Google-Smtp-Source: AOwi7QDQbjDUdEbG570YLtOywp9ENkuvSzqgYmyem0DzTTAE14CKkc4myLh+ftEKc6W+1Bf4qci7ZA==
X-Received: by 10.237.38.36 with SMTP id z33mr19358680qtc.258.1508251441853;
	Tue, 17 Oct 2017 07:44:01 -0700 (PDT)
Received: from swanson.localdomain
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	a190sm6116473qkg.15.2017.10.17.07.44.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 07:44:01 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Oct 2017 09:43:35 -0500
Message-Id: <20171017144340.15635-1-cardoe@cardoe.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH 0/5] pyro backports for Xen
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
X-List-Received-Date: Tue, 17 Oct 2017 14:44:04 -0000

This backports are for the pyro branch to fix Xen issues identified.

Christopher Clark (5):
  xen: Package libxendevicemodel, introduced in Xen 4.9
  xen: Package .pc packageconfig files into dev packages
  xen: remove STAGING_DIR_HOST from the runtime search path for bios.bin
  xen: Add menuconfig task and enable menuconfig from devshell
  xen: Replace 'inherit gettext' with explicit gettext-native dependency

 recipes-extended/xen/xen.inc | 118 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 102 insertions(+), 16 deletions(-)

-- 
2.13.5


