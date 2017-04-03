Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 890BBE00ADD; Mon,  3 Apr 2017 03:27:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [217.70.183.197 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F04CE00ADB
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Apr 2017 03:27:47 -0700 (PDT)
Received: from mfilter42-d.gandi.net (mfilter42-d.gandi.net [217.70.178.172])
	by relay5-d.mail.gandi.net (Postfix) with ESMTP id 1C8EE41C07F;
	Mon,  3 Apr 2017 12:27:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter42-d.gandi.net
Received: from relay5-d.mail.gandi.net ([IPv6:::ffff:217.70.183.197])
	by mfilter42-d.gandi.net (mfilter42-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id vn8swssPiCKR; Mon,  3 Apr 2017 12:27:45 +0200 (CEST)
X-Originating-IP: 82.34.23.153
Received: from host0.betafive.co.uk
	(cpc116908-shep14-2-0-cust920.8-3.cable.virginm.net [82.34.23.153])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7432941C08F;
	Mon,  3 Apr 2017 12:27:45 +0200 (CEST)
Received: by host0.betafive.co.uk (Postfix, from userid 2525)
	id AD386416B17B; Mon,  3 Apr 2017 11:27:14 +0100 (BST)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  3 Apr 2017 11:27:09 +0100
Message-Id: <20170403102713.1536-1-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/4] Updates for runc & associated tools
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
X-List-Received-Date: Mon, 03 Apr 2017 10:27:49 -0000

I've finally got back to playing around with runc and associated tools :)

These patches have been tested on a raspberrypi3 and allow successful creation
of a guest container using runc, netns and cgroup-lite.

Paul Barker (4):
  netns: Update to latest HEAD
  runc-opencontainers: Update to v1.0.0-rc3
  runc-opencontainers: Drop unnecessary branch spec from SRC_URI
  cgroup-lite: Inherit allarch

 recipes-containers/cgroup-lite/cgroup-lite_1.11.bb |  1 +
 recipes-containers/runc/runc-opencontainers_git.bb | 14 ++++++++++----
 recipes-networking/netns/netns_git.bb              |  8 ++++----
 3 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.11.0


