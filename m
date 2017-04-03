Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1470E00AD0; Mon,  3 Apr 2017 04:41:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [46.232.183.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 387 seconds by postgrey-1.32 at yocto-www;
	Mon, 03 Apr 2017 04:41:15 PDT
Received: from nov-007-i457.relay.mailchannels.net
	(nov-007-i457.relay.mailchannels.net [46.232.183.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 300B3E00A9A
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Apr 2017 04:41:15 -0700 (PDT)
X-Sender-Id: hostpapa|x-authuser|pbarker@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 73F8E8A3E5F;
	Mon,  3 Apr 2017 11:34:44 +0000 (UTC)
Received: from hp181.hostpapa.com (unknown [100.96.131.98])
	by relay.mailchannels.net (Postfix) with ESMTPA id EE7FC8A3E2A;
	Mon,  3 Apr 2017 11:34:43 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pbarker@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [172.20.63.14])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.37); Mon, 03 Apr 2017 11:34:44 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pbarker@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-Eyes-Towering: 13c0955755c113a6_1491219284313_3880639416
X-MC-Loop-Signature: 1491219284313:2865687842
X-MC-Ingress-Time: 1491219284313
Received: from cpc116908-shep14-2-0-cust920.8-3.cable.virginm.net
	([82.34.23.153]:47183 helo=host0.betafive.co.uk)
	by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.87)
	(envelope-from <pbarker@toganlabs.com>)
	id 1cv0Fv-002AJb-Cr; Mon, 03 Apr 2017 13:34:43 +0200
Date: Mon, 3 Apr 2017 12:34:39 +0100
From: Paul Barker <pbarker@toganlabs.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20170403123439.7150b577@host0.betafive.co.uk>
In-Reply-To: <CADkTA4PkyDoWF5YivohNMSqkQyqaDusb799HQ8Rsti=QmQP+pg@mail.gmail.com>
References: <20170403102713.1536-1-pbarker@toganlabs.com>
	<20170403102713.1536-4-pbarker@toganlabs.com>
	<CADkTA4PkyDoWF5YivohNMSqkQyqaDusb799HQ8Rsti=QmQP+pg@mail.gmail.com>
Organization: =?UTF-8?B?VG9nw6Fu?= Labs
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=5.0
X-AuthUser: pbarker@toganlabs.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/4] runc-opencontainers: Drop unnecessary branch spec from SRC_URI
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
X-List-Received-Date: Mon, 03 Apr 2017 11:41:19 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Apr 2017 07:11:37 -0400
Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> unnecessary, but I prefer it. since we are not always on master for
> this recipe.
> 
> I'll test the rest of the series, but I'll pass on this patch.
> 
> Bruce
> 

No problem, it's an aesthetic thing.

I'm not sure why git has mixed up two different author email addresses
in these patches. I've probably missed something whilst moving things
over to the new email address.

Cheers,
Paul

