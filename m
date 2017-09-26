Return-Path: <paul.eggleton@linux.intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E1F6E00D18; Mon, 25 Sep 2017 17:44:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D69AE00D10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:43:57 -0700 (PDT)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2017 17:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,438,1500966000"; d="scan'208";a="903798518"
Received: from lmazlan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.104])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2017 17:43:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Lai Eddy <eddy.lai.tw@gmail.com>
Date: Tue, 26 Sep 2017 13:43:49 +1300
Message-ID: <6757413.jUaF2P3bEP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CACrgodeqimG6u8tg0iTMyBUu2zU-Ua615fh5y+e1iBap5qg_fw@mail.gmail.com>
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
	<CADkTA4MLfyXNEZg5ifOeK5TEep0hBDMd79iFa0k=N1WKP-Txiw@mail.gmail.com>
	<CACrgodeqimG6u8tg0iTMyBUu2zU-Ua615fh5y+e1iBap5qg_fw@mail.gmail.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services] meta-cloud-services Dependencies
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
X-List-Received-Date: Tue, 26 Sep 2017 00:44:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 26 September 2017 1:16:36 PM NZDT Lai Eddy wrote:
> but I still don't understand,now I have following in my bblayrs.conf
> 
> BBLAYERS ?= " \
>   /home/user/poky/meta \
..
>   /home/user/poky/open-embedded-core/meta \

If you already have poky/meta you don't need meta/ from OE-Core as well, so 
I'd strongly suggest removing the latter.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

