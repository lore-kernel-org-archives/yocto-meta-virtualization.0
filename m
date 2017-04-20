Return-Path: <cyborgx1@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 076A8E00B1B; Thu, 20 Apr 2017 03:58:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cyborgx1[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.43 listed in dnsbl.sorbs.net]
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 563D2E00AF6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 03:58:12 -0700 (PDT)
Received: by mail-wm0-f43.google.com with SMTP id o81so100479220wmb.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:from:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=uYws+/VIkatCYsH5D5XIBtqv8GRweSESLsr2fXOm6mw=;
	b=u6snIaJSj9WaUIe3Ns1h0h88WaXiFVORPVwvewdP1BnpRxs/qqnRhPbzPKvwpruxd0
	GeEkTINuqvU6TS245s4TJxptPmTXiprfR+LcqY9JWGT9dAwVAa43X0W4PFZXHESX46b/
	icEx5Iz4TuhFnXdjiK4sym9/bxrH9J0k2H0c547AjUp100+z/YWjiGhqT0k+7sg6Gyem
	vJpzEEswzdsYHJo3WPvV+snTnO9pbwV005iKMJpDMpSPuy4Lv3imhXTTo3eknjG/HCGQ
	/8zQVbLMsHdeNmbpy9mQi5rbj/HdiZBnJXeXB6QOZ/kHrUXyZI/M5e03o5jFkQ+ksH91
	L+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:from:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=uYws+/VIkatCYsH5D5XIBtqv8GRweSESLsr2fXOm6mw=;
	b=Jn1OX7JfdAmDz5S0kTwiWn4WXlF70OKbwapxE7ws831Iw/HNhKA5GBIF57MxSPi8LQ
	EvnBHbE5uazKPzbhBpR2tdwk6VwJCmJNSRwxCfu7vlfisKuaUyTBNZh6QnX6hmhSNtCp
	IOWBnaOCVALbBU2ZJfwPTEwRod6d1c1Zx52lvkR5RRz84I4IrmaT3fQT1mf1a9e4uWoj
	v4kQztz2KileBl6igLGavKwqDZjktPSffAykFSJUomWKwpch6VedMYZ5i14r6lpdMify
	u88gzK9ysdd+qVqIkTjZXHMSIEXSdNj6BEremMhC+9tQrRZ0VbrS+xLJeF54UtgQ18PV
	Xl/w==
X-Gm-Message-State: AN3rC/6CqpSooNJIaTgS6yWkzAtSB1TaRlVI0le71Sj8YfmuFtX5A0v1
	x0EGYNnaAn0J3eYa1cc=
X-Received: by 10.28.20.84 with SMTP id 81mr1560443wmu.51.1492685891532;
	Thu, 20 Apr 2017 03:58:11 -0700 (PDT)
Received: from [172.20.1.64] (pd95c1895.dip0.t-ipconnect.de. [217.92.24.149])
	by smtp.googlemail.com with ESMTPSA id
	38sm7198823wru.1.2017.04.20.03.58.10
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 03:58:10 -0700 (PDT)
To: meta-virtualization@yoctoproject.org
From: Christian Holl <cyborgx1@gmail.com>
X-Forwarded-Message-Id: 
Message-ID: <8f017b80-eeff-457f-0769-43301ff38d5f@gmail.com>
Date: Thu, 20 Apr 2017 12:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
Subject: Can we have a standard approach for Go?
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
X-List-Received-Date: Thu, 20 Apr 2017 10:58:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I saw that there is a implementation of Go inside
meta-virtualization.


I am currently trying to build influxdb, telegraf and grafana for my
rasberrypi.

And telegraf depends on docker. Which is also written in Go.

But I am using oe-meta-go for other recipes and they don't work together.

So there is  meta-golang, oe-meta-go and meta-virtualization with go
implementations.


So could you maybe could someone responsible join our discussion, what to use:

https://github.com/madisongh/meta-golang/issues/12


Kind Regards,

Christian


