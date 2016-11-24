Return-Path: <andrew.stuart@supercoders.com.au>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AB2BE00D3B; Wed, 23 Nov 2016 21:51:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.supercoders.com.au (mail.supercoders.com.au [54.215.13.78])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 753CBE00D33
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 21:51:16 -0800 (PST)
Received: from [192.168.1.126] (unknown [101.167.6.11])
	by mail.supercoders.com.au (Postfix) with ESMTPS id 71B516081F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Nov 2016 05:51:14 +0000 (UTC)
From: Andrew Stuart <andrew.stuart@supercoders.com.au>
Message-Id: <C057D02A-D29A-4920-B281-D689568D6D9F@supercoders.com.au>
Date: Thu, 24 Nov 2016 16:51:11 +1100
To: meta-virtualization@yoctoproject.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Subject: ERROR: No recipes available for: linux-yocto_4.8.bbappend
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
X-List-Received-Date: Thu, 24 Nov 2016 05:51:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi folks,

I am getting the following error:

ubuntu@ugbuildserver:/mnt/dude/poky-krogoth-15.0.2/build$ bitbake =
xen-guest-image-minimal
Loading cache: 100% =
|#########################################################################=
##########################################################################=
########| ETA:  00:00:00
Loaded 2606 entries from dependency cache.
ERROR: No recipes available for:
  =
/mnt/dude/poky-krogoth-15.0.2/meta-virtualization/recipes-kernel/linux/lin=
ux-yocto_4.8.bbappend

Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.
ubuntu@ugbuildserver:/mnt/dude/poky-krogoth-15.0.2/build$

Can anyone suggest please what might be wrong?

thanks

Andrew


