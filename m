Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBBAAE006C4
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Feb 2014 14:03:14 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Feb 2014 13:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,803,1384329600"; d="scan'208";a="479855744"
Received: from pmckerno-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.73])
	by orsmga002.jf.intel.com with ESMTP; 07 Feb 2014 14:03:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 07 Feb 2014 22:03:11 +0000
Message-ID: <3180433.Kj0SDgXkey@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.12.9-301.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <1391807253-1423-1-git-send-email-mark.asselstine@windriver.com>
References: <1391807253-1423-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com, meta-virtualization@yoctoproject.org
Subject: Re: [[meta-openstack][PATCH] python-dogpile: core: update SRC_URI* sums
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
X-List-Received-Date: Fri, 07 Feb 2014 22:03:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mark,

On Friday 07 February 2014 16:07:33 Mark Asselstine wrote:
> Attempting to build openstack-image-controller I was getting
> 
>   'Fetcher failure ... /dogpile.core-0.4.1.tar.gz'. Checksum mismatch!
> 
> Update the sums to match the expected values.

So one of three things happened here:

1) The checksum was never right in the first place

2) The file upstream has changed "legitimately" (annoying, but sometimes 
happens)

3) The file upstream has been tampered with

Are you sure it's not #3?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

