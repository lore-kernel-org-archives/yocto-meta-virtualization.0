Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3E1FE00956; Tue, 22 Dec 2015 05:35:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.169 listed in list.dnswl.org]
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5D42E00457
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 05:35:14 -0800 (PST)
Received: by mail-ig0-f169.google.com with SMTP id to18so57525590igc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 05:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nLkkewl9noii0vX/g1d3duX8pltMtQn1gDEPNvKMCQQ=;
	b=Tn6sw8kyIF+I3Gb2eh0wwQ604/8BdMf3bqGZ1I8uAwIBfwDQ+3VPyyiD21SNw9aGeG
	HvEuEULEJNulQ0nnnr4AdvZARNQI8tP4WBOc2DEfBq26sAodpX04jOwRuwQpRkK8rpfs
	QLZthUoK5FdiIg0dyFi98zMs+SpCGV+tdtuKkaFvbazFCgLRybO4asSUHiM6evcLPEjZ
	VizGFH5qDwQGgonw5jleKRoAnDTqiRKusav2LYr8UnMKd3buvApfM3qx4/jc6rS003FN
	bUT0mnwO77SW06WtmeFma5AMfy9J7RcD71dQMhdt/MUHsZNDSQ+UkUSxpraWCBVsgypZ
	xRyQ==
MIME-Version: 1.0
X-Received: by 10.50.13.100 with SMTP id g4mr22719895igc.64.1450791312222;
	Tue, 22 Dec 2015 05:35:12 -0800 (PST)
Received: by 10.79.112.213 with HTTP; Tue, 22 Dec 2015 05:35:12 -0800 (PST)
In-Reply-To: <5678E434.10100@cardoe.com>
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
	<1450747435-5738-3-git-send-email-cjp256@gmail.com>
	<5678E434.10100@cardoe.com>
Date: Tue, 22 Dec 2015 08:35:12 -0500
Message-ID: <CABZSBQeA6WU4bsJqhVAkJ1+tQQL1zYCmXhvc5L+HXKTzkfjJ2A@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/4] xen: uprev to 4.6.0
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
X-List-Received-Date: Tue, 22 Dec 2015 13:35:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 22, 2015 at 12:48 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
>
>
> The dependency updates here aren't actually correct. You've dropped the
> udev rules but failed to capture the devd bits.
>

Yes, you are right.  I compared the list of systemd services and
failed to do the same for the init scripts (which added
xendriverdomain).

I'll add xendriverdomain to v2, then afterwards provide add an
equivalent systemd service (as there is no upstream unit).

