Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26336E00AE0; Wed,  3 May 2017 00:21:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.54 listed in list.dnswl.org]
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2E2BE00AE0
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 May 2017 00:21:20 -0700 (PDT)
Received: by mail-oi0-f54.google.com with SMTP id b204so12422927oii.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 03 May 2017 00:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=fdefRkasPPAH5Fbn3oPyD7CXBl2aX+4wrepuepKDcqY=;
	b=GPbwMNdy7vQc+/+EzZ25KatbvmVN2TjMEIPuUb3WsyruRrB1OtnOkhX0I/wNGrd+H8
	f8m74vWGFZJhbjxCeiCP4t2Q3KweQvGAoMymg7gSfHaZFrnvnrIQrQQ8SxwSQ/D3eTa2
	/b5KmkAgWz0jIAcjUIFp23L567gqjQJemozyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=fdefRkasPPAH5Fbn3oPyD7CXBl2aX+4wrepuepKDcqY=;
	b=cZZLKcWguQPM/gJKu0DiNkLjQEQr62gUrvjcA16dUyo+83IR0La7bKxfJLOaEqrbNL
	Xqf/KK1lWkbnvDmHcyhzkDXHUFUnheAiY+Q62DqpzC46AYy98t3TWKflghgv+51SNf0w
	XrMjxCrYPqe+JljJRHKB/3BQYZdGD0b8H4LL8B5zWlY8f2vrxoHfaqZzCLZQ2iBzt8S6
	2K9mohJftgbRE0GTXOEjXiZjn8hB/nQWx0Il0Nz8srIWdOJPUL1YiLD75wPLZR7Pmn1c
	Bp4+5WFulxsDPp/YLXNsK0dgBJu0FHO/EBO5TlStcgC4G+h/omWrQmuN4eAkec59pHMH
	3XSA==
X-Gm-Message-State: AN3rC/41vSGjXN2vTmtYv0nJUMV5j+GIibvBXULE/DSjxDs+tdDdjP3h
	XGKoKPz/WQf3Dugi7HpuwIl5IJfrwcbq
X-Received: by 10.157.18.144 with SMTP id g16mr14974210otg.10.1493796080089;
	Wed, 03 May 2017 00:21:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.12.181 with HTTP; Wed, 3 May 2017 00:21:19 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Wed, 3 May 2017 09:21:19 +0200
Message-ID: <CAFL6qn7SykziH4rvKmcw2Gd0z5SEafiimTYkkhOAGe13vm+-TA@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, yocto@yoctoproject.org, 
	meta-virtualization@yoctoproject.org
Subject: Redis on Yocto
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
X-List-Received-Date: Wed, 03 May 2017 07:21:25 -0000
Content-Type: multipart/alternative; boundary=94eb2c03bc6cb8edff054e99803b

--94eb2c03bc6cb8edff054e99803b
Content-Type: text/plain; charset=UTF-8

Hi,

I want to implement Redis in an image that I have created with Yocto master
branch. What I have understood is that there are some recipes into meta-oe
layer that support to have Redis in the created image. Anyway, what steps
do I need to do in order to install/start-up/execute Redis in the created
image on MPSoC QEMU?

Any answer will be welcome,

Best regards,
Pello

--94eb2c03bc6cb8edff054e99803b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I want to implement Redis in an ima=
ge that I have created with Yocto master branch. What I have understood is =
that there are some recipes into meta-oe layer that support to have Redis i=
n the created image. Anyway, what steps do I need to do in order to install=
/start-up/execute Redis in the created image on MPSoC QEMU?</div><div><br><=
/div><div>Any answer will be welcome,</div><div><br></div><div>Best regards=
,</div><div>Pello</div></div>

--94eb2c03bc6cb8edff054e99803b--
