Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52D36E00D2E; Fri, 15 Mar 2019 01:55:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9D23E00D24
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Mar 2019 01:55:34 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2F8tWFZ012936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 01:55:33 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 15 Mar 2019 01:55:32 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 15 Mar 2019 01:55:30 -0700
Message-ID: <20190315085532.79535-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 0/2] uprev nagios-core and nagios-nsca
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
X-List-Received-Date: Fri, 15 Mar 2019 08:55:35 -0000
Content-Type: text/plain

nagios-core: from v4.4.2 to v4.4.3
nagios-nsca: from v2.9.1 to v2.9.2

Hongzhi.Song (2):
  nagios-nsca: uprev to v2.9.2
  nagios-core: uprev to v4.4.3

 ...ios-core_4.4.2.bb => nagios-core_4.4.3.bb} |  4 +-
 ...1-Fix-missing-argument-in-open-calls.patch | 52 -------------------
 ...ios-nsca_2.9.1.bb => nagios-nsca_2.9.2.bb} |  9 ++--
 3 files changed, 6 insertions(+), 59 deletions(-)
 rename recipes-extended/nagios/{nagios-core_4.4.2.bb => nagios-core_4.4.3.bb} (97%)
 delete mode 100644 recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch
 rename recipes-extended/nagios/{nagios-nsca_2.9.1.bb => nagios-nsca_2.9.2.bb} (88%)

-- 
2.17.1


