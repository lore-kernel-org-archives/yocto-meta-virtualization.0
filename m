Return-Path: <venkat.mandela@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08E76E011AD; Wed,  7 Sep 2016 19:33:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE551E011A6
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 19:32:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u882WteY002622;
	Wed, 7 Sep 2016 21:32:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u882Wsr0027365;
	Wed, 7 Sep 2016 21:32:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 7 Sep 2016 21:32:53 -0500
Received: from uda0393778.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u882WqBu030483;	Wed, 7 Sep 2016 21:32:53 -0500
From: Venkateswara Rao Mandela <venkat.mandela@ti.com>
To: <meta-virtualization@yoctoproject.org>, <jianchuan.wang@windriver.com>
Date: Thu, 8 Sep 2016 08:02:32 +0530
Message-ID: <20160908023234.15453-1-venkat.mandela@ti.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/2] Upgrade protobuf and protobuf-c
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
X-List-Received-Date: Thu, 08 Sep 2016 02:33:02 -0000
Content-Type: text/plain

Hi Jianchun,

Here are two patches I am using while trying to upgrade to criu-2.5.  These
are reworked from the existing recipes in the tree. Hope this helps when you
are rebasing the patches.

criu-1.6 build will not work with these patches.

regards,
Venkat

Venkateswara Rao Mandela (2):
  protobuf: update 2.5.0 -> 3.0.2
  protobuf-c: update 0.15 -> 1.2.1

 recipes-devtools/protobuf/protobuf-3.0.2.inc       |  4 ++
 recipes-devtools/protobuf/protobuf-c-1.2.1.inc     |  4 ++
 recipes-devtools/protobuf/protobuf-c.inc           | 11 +++
 recipes-devtools/protobuf/protobuf-c_1.2.1.bb      | 10 +++
 recipes-devtools/protobuf/protobuf-native_3.0.2.bb |  5 ++
 recipes-devtools/protobuf/protobuf.inc             | 14 ++++
 recipes-devtools/protobuf/protobuf_3.0.2.bb        | 82 ++++++++++++++++++++++
 7 files changed, 130 insertions(+)
 create mode 100644 recipes-devtools/protobuf/protobuf-3.0.2.inc
 create mode 100644 recipes-devtools/protobuf/protobuf-c-1.2.1.inc
 create mode 100644 recipes-devtools/protobuf/protobuf-c.inc
 create mode 100644 recipes-devtools/protobuf/protobuf-c_1.2.1.bb
 create mode 100644 recipes-devtools/protobuf/protobuf-native_3.0.2.bb
 create mode 100644 recipes-devtools/protobuf/protobuf.inc
 create mode 100644 recipes-devtools/protobuf/protobuf_3.0.2.bb

-- 
2.9.3


