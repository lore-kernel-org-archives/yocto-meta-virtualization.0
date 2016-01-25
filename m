Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA165E00BEA; Mon, 25 Jan 2016 14:34:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7126FE00BE3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 14:34:17 -0800 (PST)
Received: by mail-io0-f194.google.com with SMTP id k127so14779631iok.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 14:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JC39b+gLH33T2FHJW8W69EsFjsRZE6eivxAowukqZrs=;
	b=Df+IteA6stg36LUIsRqCslGg4trI69KkOD3k7q1dVO/NQDf5AwJ6RAGGQ6KWA8zsXS
	BGhPFvA/zO/OJ+4slCUq5d4KNOoNgkKbljxXTHLNS3UPtCsFaQXiYoHvt2dSxShyUj+f
	9E8L9aM+U7LXXMeZMh53YAIFEo4wdNUYwQU32aiLsveWKhhKEZNHrQUgV3/X/RzySM/8
	6uHlVgqnZ9CWsqpotWneIrTYMEa2+pGNu7qnE4nR43QF5M9y2gjW1LcJI8dQ33Z6GbKT
	J5K70/YUu+HeIdSiRdLXjE2egTEG+9BX+kka0orqU37pXS+Wvg0AGAL1LBK6FVkH0tdx
	1mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=JC39b+gLH33T2FHJW8W69EsFjsRZE6eivxAowukqZrs=;
	b=kidCFg8YlVHh0MqkicF4phbRl/atrTgGqUu3uGQ7K8UKwLwoNgHo0XxD+RvmiOuzOD
	AZU87VjYwdIUuoSF4SOCh8Xqa0n17LY0ITE7YEcS2Jvr933g99yRJxLvGihoLQZ2tcn1
	xP1CWC/qlUYSFreUAbTwrAL+tTsDohCW9y3XqXS+CTO67sQ5fxPjFmK51M07Wuh7FcyB
	yTXcn9i4O6q771NMau3XvcxD+pQNJrGuaOxpJCZGNX0eFYqL+knIkxUVDgwfm6XAkPtD
	Q0AGvJjISYcAFCcN3BHYGrcXUvoHnLP78TI1d+GiLnVLlQ0T/jh3QCZG4tmB4If2/wa2
	AkuA==
X-Gm-Message-State: AG10YOQFynniKk0DarpBt3YWSiZVG3m+cxK5xvo4IWM+Aef0cckhf+rYyhJu2CKaj6cL97G6yt0kLciUOxgqXw==
MIME-Version: 1.0
X-Received: by 10.107.28.82 with SMTP id c79mr18070485ioc.86.1453761256692;
	Mon, 25 Jan 2016 14:34:16 -0800 (PST)
Received: by 10.79.125.142 with HTTP; Mon, 25 Jan 2016 14:34:16 -0800 (PST)
In-Reply-To: <1453735752-966-5-git-send-email-cardoe@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
	<1453735752-966-5-git-send-email-cardoe@cardoe.com>
Date: Mon, 25 Jan 2016 17:34:16 -0500
Message-ID: <CABZSBQeELVwrT52M9y8ieTaPSF1wf+AC+Hfz+iU=NLchXHeOxg@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 5/5] xen: move bits common to all Xen versions to xen.inc
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
X-List-Received-Date: Mon, 25 Jan 2016 22:34:21 -0000
Content-Type: text/plain; charset=UTF-8

+1, LGTM, though I'd probably also move the common EXTRA_OEMAKE and
the sse patch into the .inc.  Unless there is reason not to?  I can
follow up after this series with that patch as well, if desired.

Cheers!

