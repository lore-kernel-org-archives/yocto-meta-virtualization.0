Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48940E00D33; Sun,  5 May 2019 19:17:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9CB7E00963
	for <meta-virtualization@yoctoproject.org>;
	Sun,  5 May 2019 19:17:33 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x462HWOk007236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 May 2019 19:17:32 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 5 May 2019 19:17:32 -0700
From: <kai.kang@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Sun, 5 May 2019 22:17:15 -0400
Message-ID: <20190506021718.128811-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH v2 0/3] Fix dependency issues for librdmacm and glusterfs
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
X-List-Received-Date: Mon, 06 May 2019 02:17:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Re-send v2:
* Maybe wrong recipient in previous v2 thread, Bruce didn't recieve the 3rd patch. So re-send.

Kai Kang (3):
  glusterfs: remove PACKAGECONFIG libibverbs for arm 32 and mips
  librdmacm: set imcompatible with arm 32 and mips arches
  layer.conf: depends on meta-filesystems

 conf/layer.conf                               | 2 +-
 recipes-extended/glusterfs/glusterfs.inc      | 3 +++
 recipes-extended/librdmacm/librdmacm_1.1.0.bb | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.20.0


