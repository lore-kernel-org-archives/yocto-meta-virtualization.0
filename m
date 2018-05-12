Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C399E01377; Sat, 12 May 2018 13:16:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4214E01105
	for <meta-virtualization@yoctoproject.org>;
	Sat, 12 May 2018 13:16:04 -0700 (PDT)
Received: by mail-wm0-f54.google.com with SMTP id l1-v6so8658519wmb.2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 12 May 2018 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=802PiTe2gN0+kFUYMji3LCcsArHKa82rFWRPSwmVd4Y=;
	b=lD07TIlkqqxeZjLWN+3Mo2kqTNKdEiJDLIB0plWlCxEFPesipPpfSZH6BLV9UWH13P
	1xH0qQ4NVbUPkLq52YqU/8SAFoJd8G55ckYLyM+ov7rWa9EbVTFmtSGozw4I3T43Bgyq
	Xb6wGvC5/viwsAWIOQ9oWDAVnWAkU/nEDTeGV/30Ep15jUvm1BfsaxeHNyMI8fjtZM7p
	Yout6LEbAyEUmejLhdn0DeKN4SsUieuwstqs1EOkYCw0zxBGpQDGttl9LrpaaJiPj6hS
	M/6CZ+Oth1pQFrKYWQxl2k+1IQSIcUaIEYsYrTkUQzM9h5tiKZxoFBeNlBUVmMCTLnaS
	2VGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=802PiTe2gN0+kFUYMji3LCcsArHKa82rFWRPSwmVd4Y=;
	b=nLWD3Ly1Np/B9wF0i0PZewrhRxoqIRTWuyf9C2aw7dUIc8AWH+9Q/zDZWn/rV9a5V8
	sUq0cAYVwW81JfXXf5sMOtwjcOa8dbVIBswZ7Oh5nGGeIribVh7j27G3RVlTua8GzC9B
	dfrdktWQif5jHwkCZR5XcxdUZ7Lj5G8l721twUdOmsqULT0+dLx+HOnDU5YPomMpxmvy
	ekWGbyiyKIxszgq+Pl8eoiFjynjj8CAexov4aKANTECNij2w3F1zGvltrt0n9DHkBxec
	20BbqOxqg3frXkAfPuNJod3IOIdF3Vnk1Fgpe67Nd0s3epULak6B7gVQmk/QvDOiFFyU
	B9KQ==
X-Gm-Message-State: ALKqPwceV8U/1zoUgVrx5Zype8QjKXecXq6mgY7WVBdc83ljocppfTCS
	rLwsfaiNK+8qz0r+QGoPzyD5DR7QQMImDW22Y4t+ZQ==
X-Google-Smtp-Source: AB8JxZo9UmdrCQ2VNZQcp1ynmWisneiJq8Yo+Uo1EOEoCt8NAI0DJfx6zIa0DbWoIsp9eleji4KbNs9uaYB0klW5wXg=
X-Received: by 2002:a1c:da50:: with SMTP id
	r77-v6mr1643470wmg.105.1526156163338; 
	Sat, 12 May 2018 13:16:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.229.205 with HTTP; Sat, 12 May 2018 13:16:02 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
Date: Sat, 12 May 2018 21:16:02 +0100
Message-ID: <CAPyrkgxQ=D3ZwWjxdbnFCbV8kicNHObCmOpCkCKtd9jsnv2yjw@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: sumo branch
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
X-List-Received-Date: Sat, 12 May 2018 20:16:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Looks like sumo is now out :)

Could we get a sumo branch in meta-virtualization please?

Cheers and many thanks to everyone who has contributed,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

