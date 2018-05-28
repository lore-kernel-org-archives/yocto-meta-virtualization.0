Return-Path: <maciej.pijanowski@3mdeb.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7566E00A75; Mon, 28 May 2018 00:12:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 400 seconds by postgrey-1.32 at yocto-www;
	Mon, 28 May 2018 00:12:39 PDT
Received: from cloudserver096301.home.pl (cloudserver096301.home.pl
	[79.96.179.35])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D322E00972
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 00:12:39 -0700 (PDT)
Received: from 109241231046.gdansk.vectranet.pl (109.241.231.46) (HELO
	[192.168.3.103])
	by 3mdeb.com (79.96.179.35) with SMTP (IdeaSmtpServer 0.83)
	id 252be1768c641e10; Mon, 28 May 2018 09:05:57 +0200
To: meta-virtualization@yoctoproject.org
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Message-ID: <a14785ac-11ce-f8c5-7019-7d71da60377e@3mdeb.com>
Date: Mon, 28 May 2018 09:05:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
Subject: lxc build error: undefined reference to `__pthread_unwind'
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
X-List-Received-Date: Mon, 28 May 2018 07:12:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

I'm in the middle of upgrading my build from pyro to sumo and I am 
facing following build error:

https://hastebin.3mdeb.com/erecefusux.tex

I am building for Intel i7 machine. I tried upgrading the recipe to 
2.1.1 and the same error appears.

I'm unfamiliar with the lxc project so any hint pointing in the correct 
direction is highly appreciated.
My guess would be that the linking order matters there (this is static 
build) and symbols from
libpthread are not visible.

-- 
Maciej Pijanowski
Embedded Systems Engineer
http://3mdeb.com | @3mdeb_com


