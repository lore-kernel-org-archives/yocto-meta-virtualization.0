Return-Path: <paul.eggleton@linux.intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AB8FE00F91; Wed, 17 Aug 2016 15:08:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.55.52.88 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B5A0E00E34;
	Wed, 17 Aug 2016 15:08:33 -0700 (PDT)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2016 15:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,535,1464678000"; d="scan'208";a="1037422482"
Received: from peggleto-mobl.zpn.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.219.128.43])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2016 15:08:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: kai.kang@windriver.com
Date: Wed, 17 Aug 2016 17:08:32 -0500
Message-ID: <1737638.89iAf3Zfcv@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.6-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <9902c64e-d16d-e40a-1246-8689311d82a0@windriver.com>
References: <20160816032135.26626-1-kai.kang@windriver.com>
	<9902c64e-d16d-e40a-1246-8689311d82a0@windriver.com>
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, yocto@yoctoproject.org,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [yocto] [PATCH] libvirt: fix CVE-2016-5008
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
X-List-Received-Date: Wed, 17 Aug 2016 22:08:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 16 Aug 2016 11:18:53 Bruce Ashfield wrote:
> Still going to the wrong list use: meta-virtualization@yoctoproject.org.

FYI I can recommend the following to make this easy in future (it's how I deal
with the issue):

  http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Streamlining_git-send-email_with_configuration

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

