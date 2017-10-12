Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0C1EE00D00; Thu, 12 Oct 2017 09:50:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.48 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.48 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 836BDE00B53
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:28 -0700 (PDT)
Received: by mail-wm0-f48.google.com with SMTP id 196so24702750wma.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2tXhVIda64GADep4PQMeQbU8DK48WRUY/DdlQcTKVZA=;
	b=HgaVglOhVGjo/NzByd91bifg8fSOjeGx9EXgv11zV5dZ8QnbsDhxvQB39ji/OfvxJk
	RPuc0qvdawXI0f5mG2SjXHVUlaRRo0vTICdvDciY6FmB8h+pDn4GWJBuO6CM9babmM9e
	uo5HGDCq3UEetUcOvmUqQO/L21YT1p7OmMFjeQ3R4VTD3Pq6jtVPIh7Ls4+3gx9nT+sk
	7yx7JIbBOw30i/PqNGa3oA6RxQgWwYL4VuBzT2UoW/bLgzfO30PIgY+Pd+uJCkyEdrIp
	gfJx5TG08/nLdsdJgU96IT1tJyc9slG0M5Wsc5knj7W1CtHS0VZjNiAkux+4NzkU08YV
	YtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2tXhVIda64GADep4PQMeQbU8DK48WRUY/DdlQcTKVZA=;
	b=kHHydjlqybLTs4BNsPVSSfUtp5jyLTzhw395D7EaU24IpP4xfKtiEkDy4aGmzdZayV
	sGlS7zS82sS2FYb9XJ1THa3fokf2QPtSgb1mHsVtB9l52PQkUjrNTvO813AIOk6FNVug
	TcyJ9SpVpVF4RoNCktIQchQElcvGrvuMHwKzNNTk4e3VtU1cqh2xol558XkY+36rXchc
	cn6ECpJZpYDSUaWu3+T1wg97Qvn/lDMGXK2jQIwy5VgetmooIGM7R5h/bLvopz4yfYSw
	wg/k4eCu2/+bmKt1zMyD4Uj3leRdkk4vyekcdiK5rqYSv/FMGVNlrzLEcJoJewW/pawZ
	pIJw==
X-Gm-Message-State: AMCzsaWec2T95GCS0SXq8/IKJ43JR0nnBMPfCOTdoDQAf0xcIrYeV0Z0
	STehHmffp/iQzLtXT4QTuTsOmH/X
X-Google-Smtp-Source: AOwi7QCvajaQdYMlrMYPkYHIIluMgeFu1SGrkgR43NryukMHO2/63yQPfj+PyFYhHimooLzy3i3+CA==
X-Received: by 10.223.145.166 with SMTP id 35mr2431392wri.51.1507827028102;
	Thu, 12 Oct 2017 09:50:28 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	h201sm756969wmd.27.2017.10.12.09.50.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Oct 2017 09:50:27 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 12 Oct 2017 16:49:53 +0000
Message-Id: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] sanity-meta-virt and runc improvements
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
X-List-Received-Date: Thu, 12 Oct 2017 16:50:32 -0000

The sanity-meta-virt bbclass is fixed to use a layer-specific name for the skip
variable and to only print the warning once if triggered. This has been tested
both with and without the skip variable set to "1" in my distro conf and works
as expected in both cases.

The runc recipes are simplified. runc-docker is fixed for aarch64 platforms by
disabling compilation of the recvtty demo/reference application.

Paul Barker (4):
  sanity-meta-virt: Make skip variable name layer specific
  sanity-meta-virt: Watch for SanityCheck event
  runc-docker: Disable building recvtty
  runc: Simplify recipes

 classes/sanity-meta-virt.bbclass                   |  4 ++--
 conf/layer.conf                                    |  2 +-
 .../0001-Disable-building-recvtty.patch            | 26 ++++++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb         | 11 +++------
 recipes-containers/runc/runc-opencontainers_git.bb | 19 ++++------------
 recipes-containers/runc/runc.inc                   |  9 +++++---
 6 files changed, 42 insertions(+), 29 deletions(-)
 create mode 100644 recipes-containers/runc/runc-docker/0001-Disable-building-recvtty.patch

-- 
2.7.4


