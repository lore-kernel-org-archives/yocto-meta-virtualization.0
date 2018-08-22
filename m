Return-Path: <sarayu@m5nv.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADBBDE00460; Wed, 22 Aug 2018 08:29:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.218.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F70AE003C1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Aug 2018 08:29:45 -0700 (PDT)
Received: by mail-oi0-f41.google.com with SMTP id c190-v6so3827072oig.6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Aug 2018 08:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=m5nv-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=Tv6RD0ZL1xYjq19KHTdDUXNhmlOxN8ZvolEtROWkh9U=;
	b=Ki/dEReIQa7mbdLJ4487PUgFQJryda1BIxSm5A5LgrzB9SiWD2+aUtKi4Xxv/tq/IX
	lnmXZ7mGrg1Hg8z3lJ2eE7QnMgm0z9/QzlseKo5c8VCq/s4xyatPVThWyQO4gCmpO1jb
	yx5FMTIVGeCAR+Ph0XYWwjxhXS7SFKWUYXPFICzdEX0WmAWs67vGMcVsTdvNSC1NIDmH
	tFTL1oFvbC18D39elJyTXhhAGxGmLFZmgUDBnRyaWyx+AuLdd6L4nr+xMUB19RhZEZHs
	/yTDZaodmtCz5XrBOhIoxx1F9w1sOPcamDnwaE684UCVdqdE2tOdKM587wQ1qM/ZcIdz
	befQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Tv6RD0ZL1xYjq19KHTdDUXNhmlOxN8ZvolEtROWkh9U=;
	b=HV/YNdSF0LiO4oFDM9hxDKgHvXLs0ruQVrqPQxmxpqK9ijyTxp6wSSfmcFoXLBQOO4
	bTjjU8n9iD6w4LbqyxeIwc0DQ4/w5a/HuY1WxbHILtlgk8RwqIHuiKuVNXIwYjHI4I/8
	cKbT01wH/R+QJ7LEwmQ1Ay3Slxjjk7FRrQxHwTO+5NKIIrsYzYCJUhzbp00gxhILkObw
	pWNliOCOhrP6+EFJ63M+oZNGlTz6WWNVNk/D1FurNEamjFBB1ssFqgsMuc8lCjN6FUx+
	UOHk04O/D7X+H6AUjPpIs2ko+yxspnM1D4Iq6x+oRX8pjYmyeMgvAWtUuvMXpqlJRN79
	SaMA==
X-Gm-Message-State: APzg51B1BtH23ploL7uAV8qfeSOzU09VJJEuJg6tKM/UOI0cifDtPbH9
	MCpuLk/7O8JW6rImpc3oRI93WwqH6Kr3uvHrz5/Pl6Rl
X-Google-Smtp-Source: ANB0VdYf8oVZO0yddKdz8jTaRn0a7MTUm8UcNTBGg4mi/YuVIyzSjpgaJyaCHfA+HZizaqBT9T/uKgALIiEBly5qjWA=
X-Received: by 2002:aca:44c5:: with SMTP id
	r188-v6mr4699248oia.280.1534951784670; 
	Wed, 22 Aug 2018 08:29:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3da6:0:0:0:0:0 with HTTP; Wed, 22 Aug 2018 08:29:44
	-0700 (PDT)
From: Sarayu Sivanandam <sarayu@m5nv.com>
Date: Wed, 22 Aug 2018 20:59:44 +0530
Message-ID: <CAG3Cyz8_qsDW=53JVBNBVUrOMbhYk4Ou8P1P2qD8pBbizPNLLQ@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: LXD on yocto
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
X-List-Received-Date: Wed, 22 Aug 2018 15:29:45 -0000
Content-Type: multipart/alternative; boundary="000000000000df7d41057407cfbe"

--000000000000df7d41057407cfbe
Content-Type: text/plain; charset="UTF-8"

Hi all ,

Is anyone currently working on a recipe for LXD .

I am looking to create a LXD recipe and i am new to yocto so any inputs on
the same will be very helpful.

Thanks and Regards
Sarayu

--000000000000df7d41057407cfbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all , <br></div><div><br></div><div>Is anyone curr=
ently working on a recipe for LXD . <br></div><div><br></div><div>I am look=
ing to create a LXD recipe and i am new to yocto so any inputs on the same =
will be very helpful.</div><div><br></div><div>Thanks and Regards</div><div=
>Sarayu<br></div></div>

--000000000000df7d41057407cfbe--
