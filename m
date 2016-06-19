Return-Path: <paul@paulbarker.me.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA87BE00798; Sun, 19 Jun 2016 02:30:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [46.105.34.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1802 seconds by postgrey-1.32 at yocto-www;
	Sun, 19 Jun 2016 02:30:21 PDT
Received: from 11.mo4.mail-out.ovh.net (11.mo4.mail-out.ovh.net
	[46.105.34.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B987E006D3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 19 Jun 2016 02:30:21 -0700 (PDT)
Received: from player735.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 06D671000416
	for <meta-virtualization@yoctoproject.org>;
	Sun, 19 Jun 2016 10:53:08 +0200 (CEST)
Received: from nuc.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net [86.27.96.131])
	(Authenticated sender: paul@betafive.co.uk)
	by player735.ha.ovh.net (Postfix) with ESMTPSA id 9363B160074
	for <meta-virtualization@yoctoproject.org>;
	Sun, 19 Jun 2016 10:53:08 +0200 (CEST)
Date: Sun, 19 Jun 2016 09:55:07 +0100
From: Paul Barker <paul@paulbarker.me.uk>
To: meta-virtualization@yoctoproject.org
Message-ID: <20160619095507.4c1f84cd@nuc.betafive.co.uk>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.25; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6734007346647501076
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrleefgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: Dependency on oe-meta-go
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
X-List-Received-Date: Sun, 19 Jun 2016 09:30:25 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

The meta-virtualization README file says that one of the dependencies
is:

	URI: git://github.com/errordeveloper/oe-meta-go.git
	branch: master
	revision: HEAD

However, that repository seems a bit out-of-date and I can build the
software I'm using from meta-virtualization without using that layer.

Is this still a valid dependency or does the README need an update?

Thanks,
Paul Barker

