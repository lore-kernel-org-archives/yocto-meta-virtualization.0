Return-Path: <erik.boto@pelagicore.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20510E009BD; Tue, 16 Jun 2015 01:47:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD3F2E009BD
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jun 2015 01:47:24 -0700 (PDT)
Received: by qkbp125 with SMTP id p125so1060885qkb.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jun 2015 01:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=Ul2vzyQ7qWVRtFe75waE743fGV1D9dCdGiy3NfWtrOI=;
	b=WqbWqECay2vnZl8mlb5aG61g83tFv+aqDnB9NxZ3aw7OxkO/Pbi775pED0/fmqnx9r
	1B6krSTe76NgCgMeXNbYjtLf812dbNswia151QV6wNjQovrz7kslYWAQyyPDmnPttPfn
	BUL7lJeZka8rBf3nygcIbxsM4nISizQ6YLbMQDoR7aTGbVbAPdWqdH0bn6YeBbyB8A9w
	MDnMGxKG7MFQNUvUlpyJ84YMnSDiLij8o6Pr/qcoI4yh00YjgZ1YkoRH+zyxIRRBQyrt
	CqhwNYsRyXeZfF88G7dVYk9CztT2X0ya1lVfMAgLkymGXBEURkYL5xAfw2FvgZao8Q7A
	y1/A==
X-Gm-Message-State: ALoCoQny+RS0KNNUCpzvBhixrWdeg3CBoM0u/UgnK8w+7+fujBxqGV9FdrEL5Av6HY+YnElg0A1q
MIME-Version: 1.0
X-Received: by 10.55.17.75 with SMTP id b72mr67240965qkh.103.1434444443860;
	Tue, 16 Jun 2015 01:47:23 -0700 (PDT)
Received: by 10.96.226.176 with HTTP; Tue, 16 Jun 2015 01:47:23 -0700 (PDT)
Date: Tue, 16 Jun 2015 10:47:23 +0200
Message-ID: <CA+AhUGx08V9KdA7NHpLnzR1EzL3LBPRTyUOKj2S7-w5MQhRVMg@mail.gmail.com>
From: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
To: meta-virtualization@yoctoproject.org
Subject: Creating a fido branch
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
X-List-Received-Date: Tue, 16 Jun 2015 08:47:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I noticed that there isn't any fido branch, and since the following
commit the master branch does not work with Poky's fido branch.

"cloud-image-*: catch up with OE-core class rename

OE-core rev 0a3e8eb9f592c3f1edd2c7521855f7406541651a renamed
'image-vmdk' to 'image-vm'. IMAGE_FSTYPES didn't change, so keep those
as 'vmdk'.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>"

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=e50e36cfa3898b1defcbffe9f3fd0a20403c8de3

I'm not sure if there's a policy of branching of to keep compatibility
for certain oe-core/poky versions, but I saw that there are branches
for e.g. dizzy and daisy so I hope that it's ok to do so.

Cheers,
Erik

