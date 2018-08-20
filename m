Return-Path: <toejammin420@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9436FE00A6B; Mon, 20 Aug 2018 14:50:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (toejammin420[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.42 listed in list.dnswl.org]
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 729D9E006AF
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 14:50:41 -0700 (PDT)
Received: by mail-it0-f42.google.com with SMTP id s7-v6so1482872itb.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Aug 2018 14:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=g/MfP00D/yLt0dnsW8O3/Ii4pxpUyQ2mCNY6z5O3wms=;
	b=BKhHO44AhILxK3rziltje36uZCiWVATApBC3ZtU50xchKyt69legZplm9CfM990UOp
	FfV9Vak3nYY9ESARgxXGc40LTYeIfqT4/LyZwnGQfbswaKFeS+qSeQY1EGpdsOSaGMid
	fx2xhg2tiNFUhIb7LCXq7k77R+e+LouC6vORWatyoqyV1kPNyXiQMMnFVsRGRBXJQ3au
	MRnP1/FKSnlWbMt5XgCxZxvm41QUVTT7eK3dDbB6bs7hOcN9Z4USt4hPHcutiK7DiNw8
	sskKVhpIspv2IFim4y6JrZgqA0KcOmr+lwNoAxs5vHwecgEY9VEY6irUl5rk0D8F4WCw
	oXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=g/MfP00D/yLt0dnsW8O3/Ii4pxpUyQ2mCNY6z5O3wms=;
	b=Rb9T4kWARM+0Riz8WenBmSlBmZA1WPvigptRaw2NvTDhK8cDC65mSIowf3/4oPj3v4
	lbqUNyB1LTTQmLxpeWRbGRlgLjyyAQCLTW1HcB7ldrgtwNvDKa/H4EL98mNM2IEXVl/7
	5smy98mmlUnFptQIdIsC99EUE6hFWC1nLRvczI2iY0oQtXF2FbC4L6WDHjFskFin1kaw
	ll7EaPqTJx5COGqVyXAkCQvmFqYlx1Rfx0UQ6ymcYPyyy3WLLYNCyNY6cXkWQeyV7Rla
	rKcgvFAhRhDipmycvmAfam8VJ+DvrWfxsEaH4wJg+0FKTDzdvKDprvqG24PuAlG3narp
	xXZw==
X-Gm-Message-State: AOUpUlE4OqXaaBJNXigJdhdQ4AiK9hkd+1zwvFCvakxxUOwaRhfkQmDE
	gO2ayYcVmfS/JNWOp2IJrTeJhy03str3PSPduFjw2Q==
X-Google-Smtp-Source: AA+uWPyUp3N3INKyQJTabzl/TVuNJdZ3hwjwua4dvYSEotlRbrwId/K4MTzuSpi7vRVLYC7dZtn3dmlE4NF9qPnzmMc=
X-Received: by 2002:a02:a70a:: with SMTP id
	k10-v6mr3716921jam.47.1534801840350; 
	Mon, 20 Aug 2018 14:50:40 -0700 (PDT)
MIME-Version: 1.0
From: thomas gentles <toejammin420@gmail.com>
Date: Mon, 20 Aug 2018 16:50:30 -0500
Message-ID: <CAJsFM9y_bjzU4fJfr3=K3XpRCaKrC_+3WHJ0d5YNr84+1fA8NA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: meta
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
X-List-Received-Date: Mon, 20 Aug 2018 21:50:42 -0000
Content-Type: multipart/alternative; boundary="0000000000007eab510573e4e65a"

--0000000000007eab510573e4e65a
Content-Type: text/plain; charset="UTF-8"



--0000000000007eab510573e4e65a
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--0000000000007eab510573e4e65a--
