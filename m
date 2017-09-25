Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1DCFAE00D0B; Mon, 25 Sep 2017 03:46:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 399 seconds by postgrey-1.32 at yocto-www;
	Mon, 25 Sep 2017 03:46:57 PDT
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 803FEE00CD5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 03:46:57 -0700 (PDT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8PAeBud014545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 25 Sep 2017 11:40:13 +0100
Message-ID: <1506336011.31732.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, meta-virtualization@yoctoproject.org
Date: Mon, 25 Sep 2017 11:40:11 +0100
In-Reply-To: <20170925084113.30094-1-Qi.Chen@windriver.com>
References: <20170925084113.30094-1-Qi.Chen@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Mon, 25 Sep 2017 10:46:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-09-25 at 16:41 +0800, Chen Qi wrote:
> Add a new class, sanity-bbappend.bbclass, to check for whether
> necessary
> settings are available for bbappend files in this layer to be
> effective,
> and warn users if not.
> 
> In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable
> users
> to explicitly skip the checking to avoid unwanted warnings.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  classes/sanity-bbappend.bbclass | 10 ++++++++++

That is a horrible name for a bbclass, could easily clash with another
layer.

>  conf/layer.conf                 |  4 ++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 classes/sanity-bbappend.bbclass

Looking at this patch series, I suspect this is partly related to YP
Compatibility v2.

I do think that its highlighting an issue here in that we have several
very similar bbappends where the functionality would likely be better
in a common file and secondly, better in the core recipes.

This layer would then just need to configure it rather than adding the
config fragements and so on as well.

So yes, I think there is a valid issue here and in many senses, YP
Compat v2 is probably highlighting a real problem but I suspect this
patch series is not the way to fix it...

Is there a good reason we wouldn't want "virt" markup in the main
recipes and it being a configuration option?

Cheers,

Richard



