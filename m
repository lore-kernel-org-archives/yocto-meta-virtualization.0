Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B76AE0053A; Mon, 30 Jun 2014 13:55:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.41 listed in list.dnswl.org]
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 532ECE0030B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 13:55:08 -0700 (PDT)
Received: by mail-pa0-f41.google.com with SMTP id fb1so9333138pad.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Jun 2014 13:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=lGMdsaLJoqElucelm9ysz8o3CqwHe+BrJnwdIXq9htM=;
	b=KPKG3QPMn5tI8yhWdZ53PVG3K2kltzCqNdJCpbR31XIe83sCzdqb5/SfP3usySGEFQ
	lwF/kHunPjELYEN/V+iEGh+Usj87KP9LtwO/bh87VmaZhYnopfYOrc2oRu8oG0CsGOSN
	7N2pfz/jIpP809b2Gf8TBq3LMjWuOG1h/CRQKyg1EPFKdiG3MYUrC2WUQPlZFresR7ji
	cyqsP5GBKy/H2dhAaF/vePtdGa5ENCd159pPNf+s7afHeyz3oERvDbu8b3Dsdo1cbM6q
	IG/5yeoAND0sVZPyOZRmabvjLeQxL8HorPU+IbzMB51v0R8dIinY3vWLFyg2RaknHBwr
	+y5Q==
X-Gm-Message-State: ALoCoQnmKp7jx5lpz6CF7PdZdQf9dMWlnrhfJLvwNHDfee4jUPGE/9XqkdT6PBF1ltGXBAqBqU5k
X-Received: by 10.68.197.195 with SMTP id iw3mr55577331pbc.139.1404161707934; 
	Mon, 30 Jun 2014 13:55:07 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	vk5sm29234428pbc.44.2014.06.30.13.55.06 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Jun 2014 13:55:07 -0700 (PDT)
Message-ID: <53B1CEA8.2020107@mvista.com>
Date: Mon, 30 Jun 2014 13:55:04 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: meta-virtualization@yoctoproject.org, bruce.ashfield@windriver.com
Subject: meta-cloud-services
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
X-List-Received-Date: Mon, 30 Jun 2014 20:55:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Hello Bruce,

1) what is the purpose of 'recipes-dangling'?

2) I notice several "WARNING: Use of PRINC 1 was detected in the recipe" 
in the meta-cloud-services, is anyone working on correcting those? if 
not, I can submit patches.

3) I also noticed several "WARNING: No recipes available for.." in this 
layer as well. If no one is working on patches for these, I will send 
fixes as well. I believe these fixes might be the 'wild card' if applicable.

kind regards,
Armin

