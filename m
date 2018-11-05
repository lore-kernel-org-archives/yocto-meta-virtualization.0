Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F239E00A54; Mon,  5 Nov 2018 07:51:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.179 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4C69E00A4F
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Nov 2018 07:51:32 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id s15-v6so8492047lji.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Nov 2018 07:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=MkckUlXVZbBpip64w9L/x4AcQkvfUtpKtYdr1P0ebkc=;
	b=RrxKm2LR948C+orlP+EFJ7Tq2mQGrXiB4IMZtM5JuX+I0AgfgBVqEbyXZGZoi4G6bi
	o5fQNNRCqnXakFvXHMogRIThIp/8Qz3wV4P5l1HryfhjWxWu2I3u2iVnVJ+K5JCAzNzP
	jfGyhwODpyMJxWGgrJfvNFgRgBO9J7rPAusO9/k9B479AVlKbxg2n/z535nxoaS/n/tq
	QYjm7HN84/EGLACdvLKhagiUa/HWs9s4uoG4aAJXdc7yJvUAx7m6IA/rud3bNyqeZfQx
	+uOEgqJ63iY1Dxj2Fj2X+JQeDhS8QV8+trcMRLpCATL6HizUWp6fnNBtrTh6M0noUF0i
	PKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MkckUlXVZbBpip64w9L/x4AcQkvfUtpKtYdr1P0ebkc=;
	b=Hdw1gP/6V7tW9Ak7P1GIo/Eikn5apk+SR8/Nx/ntrM0V/HMsf+xrjiKiGe6NAR/LQW
	ZkMSdbgZN1GKuxo9x4zdMcdLRT8ODDDjR/XiX682qWcQakEt9seDPdmTU0KBLs600PTo
	Cw06leZciCP7PbHtKa6nutY3MDyqTe4UGjBoFvuWFuAQLY1fFN8imOgqbp6lt08psKj4
	Aaas1JrQ9Z2DsPR+oCar6YFGY+sA8gn1Sm0bDQBly9LUTgXqMHjV56jD3UTM06bXTcC0
	tvofmbSfQeAWUGYw4jXJenMdiv557vWLerxqPyBXnM2NyzzlGDpIw7SrEUqJi7nTCb3Z
	0WkA==
X-Gm-Message-State: AGRZ1gIP2psCDtK6A4JJ/kgCIozPSagaNQMjjrHsEpDKUgFDKt1P8L3I
	MUwru29/B/YoloK61eNlkkQ6fH4gwBy//4IGAN93uB7Co/Q=
X-Google-Smtp-Source: AJdET5fZQEndrocfVVlgntPqWVfgMHAJUQx8RCqvyWizdK9YLqH0iJe8FdGjYGfm8ATe1ojC+MeffxD4lRdMSwwWzx8=
X-Received: by 2002:a2e:8596:: with SMTP id
	b22-v6mr1325512lji.122.1541433091296; 
	Mon, 05 Nov 2018 07:51:31 -0800 (PST)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 5 Nov 2018 10:51:19 -0500
Message-ID: <CADkTA4OT6bmm3okP6RVpmb-SO7CEsMUH73Z8PSbA+Zw3nFH9+g@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: FYI: uprevs/refreshes in master
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
X-List-Received-Date: Mon, 05 Nov 2018 15:51:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I wanted to send a heads up that when I was doing stabilization on the
meta-virt contents against oe-core last week, I ran into some issues
with the go 1.11.x and some packages no longer building.

A long story short, it was safer/better to refresh things rather than
trying to make some gnarly changes.

The result is that docker/runc get a refresh, as well as some of the
frameworks that use them.

I've run these through some fairly extensive testing and haven't found
any issues. But send email to the list if something isn't working for
you (or better, send patches!).

There are some other more invasive changes that I'm holding onto until
after the thud release.

  100fb48 runc: refresh to tip of tree
  86db368 docker/docker-ce: uprev to 18.09
  e53055f cri-o: update to 1.12 release
  3724664 cni: update to latest plugins, and skip windows bridge build
  2a46d2d cri-o: disable ptest build
  60142aa kubernetes: uprev to v1.12 release and fix cross compilation errors

Cheers,

Bruce

-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

