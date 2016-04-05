Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F013E00AF4; Mon,  4 Apr 2016 22:00:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3BA2E0096D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Apr 2016 22:00:06 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u35505xX003919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 4 Apr 2016 22:00:05 -0700
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Apr 2016 22:00:04 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 5 Apr 2016 12:59:53 +0800
Message-ID: <cover.1459831866.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] openvswitch: Fix ptest for v2.5
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
X-List-Received-Date: Tue, 05 Apr 2016 05:00:09 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

- Copy certain files from srcdir since it has been different from
  build directory.
- Copy more necessary files for new added test cases.
- Modify config files for running on target.
- Add necessary RDEPENDS

testsuite.log on genericx86-64:
...
## ------------- ##                                                              
## Test results. ##                                                              
## ------------- ##                                                              
                                                                                 
1731 tests behaved as expected.                                                  
2 tests were skipped.

He Zhe (1):
  openvswitch: Fix ptest for v2.5

 ...-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch | 79 ++++++++++++++++------
 recipes-networking/openvswitch/openvswitch_git.bb  |  3 +
 2 files changed, 63 insertions(+), 19 deletions(-)

-- 
1.9.1


