Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E03BEE00D0F; Mon, 25 Sep 2017 05:45:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26F22E00D0D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 05:45:17 -0700 (PDT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8PCjBSI022651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 25 Sep 2017 13:45:12 +0100
Message-ID: <1506343511.31732.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rich Persaud <persaur@gmail.com>
Date: Mon, 25 Sep 2017 13:45:11 +0100
In-Reply-To: <8C5544EC-5FF6-434A-8589-62C3DF47867F@gmail.com>
References: <20170925084113.30094-1-Qi.Chen@windriver.com>
	<1506336011.31732.13.camel@linuxfoundation.org>
	<8C5544EC-5FF6-434A-8589-62C3DF47867F@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2 1/3] sanity-bbappend.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Mon, 25 Sep 2017 12:45:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-09-25 at 08:00 -0400, Rich Persaud wrote:
> On Sep 25, 2017, at 06:40, Richard Purdie <richard.purdie@linuxfounda
> tion.org> wrote:
> ...
> > 
> > So yes, I think there is a valid issue here and in many senses, YP
> > Compat v2 is probably highlighting a real problem but I suspect
> > this
> > patch series is not the way to fix it...
> Are there docs on YP Compat v2?  A web search turned up this RFC:
> 
> https://lists.yoctoproject.org/pipermail/yocto/2017-February/034489.h
> tml

There is the yocto-layer-check script which basically embodies the
planned changes. I do need to write up a lot of the information but am
struggling to find the time to do that the justice it needs...

Cheers,

Richard

