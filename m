Return-Path: <theodor@resin.io>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36A22E007BA; Mon, 24 Apr 2017 03:38:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.214.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.214.50 listed in dnsbl.sorbs.net]
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC192E00349
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 03:38:27 -0700 (PDT)
Received: by mail-it0-f50.google.com with SMTP id x188so49129104itb.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=resin.io; s=googledkim;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=gakfHmuFULbtSr8tcdWGT7x6d7G1Hqyk/7NhGHitdUs=;
	b=i7BfhqfrlIzgaKUSAfNkQn2sCZh38Nt7BH8Nk2n07O25nzcqBwtducJujX89ATzT2c
	+u4u/LkiKdmMTn0uU7ZMooZt4WPVJT+CdhjgL87DlamEZRvmjwQJs5UVA2RoLQNaEg1/
	AtmU43rCPwsvPtS6XhHN3AzkocEq/6+Cr1yS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=gakfHmuFULbtSr8tcdWGT7x6d7G1Hqyk/7NhGHitdUs=;
	b=A0dXXJy/TiFAYcr1TzbF9eD5NTf+ztUP7MgmPqw2L6cdFAxgXxmeUQqe5nk5pyY443
	7U6ELUJ7WGmP36uSXkSOMPVfCWpI1oPnukJaFZ4Jw+IlNCMtzR1ABspP5a9rszUXH7wc
	gxd8FB6+rqxT1VJqAb8kAceYWZ9fJq0z5qHOZu2XdV7gt8gnvpQwIn2bC3s2aISGIDrn
	lBLxNLVDZvGE/ZfHyvU5ipYKRKcp8fADnmgjFwKp4ccNBOPK4wuLz/SLtEi83FL/llIv
	FtgFg4wuKx8tkRRhfnola+jFHETZZXM/BmOxX8MltyyA2PArkJx+DCAxv140DhbA2xFt
	p3IA==
X-Gm-Message-State: AN3rC/7YNZ5qG7xfBz7cqHNGO17Zb2y5e4bQThbT15tuVLU4ypbAgf3W
	1za+t3E0Mxn3MJvywLV2/pWgTxwiD/iZ
X-Received: by 10.98.215.26 with SMTP id b26mr23921780pfh.162.1493030200343;
	Mon, 24 Apr 2017 03:36:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.131.65 with HTTP; Mon, 24 Apr 2017 03:36:39 -0700 (PDT)
In-Reply-To: <CABORvUhYiNw4noLMiK=s10qucet3ZAJebFD8fDrELiSJpCQK3A@mail.gmail.com>
References: <CABORvUhYiNw4noLMiK=s10qucet3ZAJebFD8fDrELiSJpCQK3A@mail.gmail.com>
From: Theodor Gherzan <theodor@resin.io>
Date: Mon, 24 Apr 2017 11:36:39 +0100
Message-ID: <CABORvUgP0PmxFUpj75FwuqkRsNxJPcQBS-3grpXJvbuVDdhRQA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: oe-meta-go provider
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
X-List-Received-Date: Mon, 24 Apr 2017 10:38:33 -0000
Content-Type: multipart/alternative; boundary=f403045eb1c6bb22dc054de72e6c

--f403045eb1c6bb22dc054de72e6c
Content-Type: text/plain; charset=UTF-8

The oe-meta-go provider that this layer suggest (https://github.com/
errordeveloper/oe-meta-go) seems to no longer be maintained. Is it safe to
use a new version of it (https://github.com/mem/oe-meta-go)? This was
forked from the one your layer suggest but is actually maintained.

Best regards,
Theodor Gherzan

--f403045eb1c6bb22dc054de72e6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div>The oe-me=
ta-go provider that this layer suggest (<a href=3D"https://github.com/error=
developer/oe-meta-go" target=3D"_blank">https://github.com/<wbr>errordevelo=
per/oe-meta-go</a>)=C2=A0<wbr>seems to no longer be maintained. Is it safe =
to use a new version of it (<a href=3D"https://github.com/mem/oe-meta-go" t=
arget=3D"_blank">https://github.com/mem/oe-<wbr>meta-go</a>)? This=C2=A0was=
 forked from the one your layer suggest but is actually maintained.</div><d=
iv><br></div><div>Best regards,</div><div>Theodor Gherzan</div><div><br></d=
iv></div></div></div>

--f403045eb1c6bb22dc054de72e6c--
