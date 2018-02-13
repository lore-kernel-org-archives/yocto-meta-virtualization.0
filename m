Return-Path: <psaavedra@igalia.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E98D5E00DE0; Tue, 13 Feb 2018 03:47:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E68F5E00DAE
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Feb 2018 03:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=9MvHON6O+kFPEA+uIrEY/l3svJ/D5xrBwe8rE6L1MBQ=; 
	b=N7sHfliw/NSh7RXKStczymDgFl1ZaDiEyuwuqvDAcxSizk6qy4dSWdaKMsyC70dO5/Gq7W1t7IOxTN+84EPl2aGFehokHvOvR2cET4geleyhDcbcl2XGsZ4gao3+4eVaRr0Bmh9IZM7mYEVULHCLwMxPBcEbdMpKjhojaRJYkp65Cbbv6vvEySieaEltScJAs2E4htdew1gUdqbw4o28GEGbsM58ocPGCwhIB6VveR563ptMoG6rRfao7JwF2DFpIJwHVjU5ukSebg6qZyVW4bavDVssG+QjnI31wZlXziuUwRymJPosDcOmuJTUgKMtL+MhV+6xmoo9a7WRLZg/PQ==;
Received: from 6.27.165.83.dynamic.reverse-mundo-r.com ([83.165.27.6]
	helo=[192.168.9.78]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1elZ3y-0000RH-R7; Tue, 13 Feb 2018 12:47:54 +0100
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20180205171306.2201-1-psaavedra@igalia.com>
	<CADkTA4PmEMe9fR8KaAt3s6QhVJ8MSs8DszKxkPtJRJ0+kamU-w@mail.gmail.com>
	<61a38f2a-8aec-95f4-0f3b-6195b3de3cf8@igalia.com>
	<CADkTA4Mw5zd_V7OQ5H7GdFd_XiUZHNPqs8=AdDV315YZSXLYxQ@mail.gmail.com>
From: Pablo Saavedra <psaavedra@igalia.com>
Message-ID: <307b5fbe-b22a-dc01-c117-ad846a93fd22@igalia.com>
Date: Tue, 13 Feb 2018 12:47:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Mw5zd_V7OQ5H7GdFd_XiUZHNPqs8=AdDV315YZSXLYxQ@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Added Yocto recipe for Puppet 4.10.9
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
X-List-Received-Date: Tue, 13 Feb 2018 11:47:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/02/18 16:20, Bruce Ashfield wrote:
> We were looking at updating it in the not to distant future, hence why
> this patch was timely to save that effort.

Good to know.
>
> I think jumping ahead to Puppet 5 would be ideal, if you think it is doable
> from your end (I won't insist, if it puts a lot of extra work on someone else).

...
> At that point, I'll delete the recipe from meta-cloud-services, and until
> I hear your thoughts, won't look at any other upgrades to the recipe.

Let me a couple of days, I think I can work on this patch and prepare a
final recipe based on Puppet 5.


Regarsds

-- 
Pablo 


