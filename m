Return-Path: <paul@betafive.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADEE4E00D11; Mon,  6 May 2019 06:38:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [64.147.123.19 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
	[64.147.123.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1FD3E00C93
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 May 2019 06:38:13 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 7284D436;
	Mon,  6 May 2019 09:38:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Mon, 06 May 2019 09:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=subject:to:references:from:cc:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=/
	sNy5hufngFWl2PLwa+n19AmQYxFtpyHYXSJxqTeK54=; b=Ytgjk7KD3AjfnFbEf
	J46pAOmJaOTf3uZ7uso2Ot3Xf7FMD8GmWqKTFITA0UAJNCQbDPW3NSIHAoKx4NDO
	tO4IS9KzhAxeoG7KB7VzHihBq0mHrD2N7ccQyC8aX5wXGmZBchRkLPyDLVgUh6hx
	7jkt3gZwdYHxk09vYC2hJFEBbwp2v8qkpMwWSi7XxM8QPAjOcDRL6eUcJE9wLboC
	XHhyGDw2IRFoBTRI4DC3Z6WheNQWdbuex/dadRQEj6ALW3uNVbH2hFL55BNxoj2c
	bIUtI/egiGg8aLlAQBlEIlyWw8BddzyznZGNKvygZtQGzbwWfTZKkR8Pw3+uxoUu
	SqO7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=/sNy5hufngFWl2PLwa+n19AmQYxFtpyHYXSJxqTeK
	54=; b=NA8VmOql8EYcOwL2trrCo/jPLDAWQFo+GuPZI4L4hZo8PEoLmobv7JARs
	H6ZTcWozDdOoPRwKKmSFh5NBH2Dk8Pk/GJXP3hGfaI5dfDWpiwct5f/GtDACFMts
	QHVMH3cwlrCwUZgApief3Aa8TpsJrKwDDBsH7bQrksVo7d+cR4GQeHZpZqxhaA7l
	d+U+K76RtKE/UgOjVuLihSTgHSn+UMdIKOr8i/zjgOceIszC1NgIvR30lmqA+tn6
	pm4DG6s43FEkEaYrgsfWVHwEaq4S/9Ux8r6j1n261B1Jsjs35xl/xvDShwZcaMz/
	G5shwXDVK94F6Ec8QMTceoHR+K0lA==
X-ME-Sender: <xms:wjjQXOAhP__wqFf4Kvw7Wsl6lwPJCrlfKlA4gs3e5xAqPGVd5dY_HQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdeilecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefuvfhfhfhokffffgggjggtgfesthejredttdefjeenucfhrhhomheprfgruhhl
	uceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucffohhmrg
	hinhephihotghtohhprhhojhgvtghtrdhorhhgnecukfhppeekuddrudekjedrfedvrddu
	feeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtoh
	druhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:wjjQXNl60s2KLhu_-LTbJQiDWaHNxwmmB-6GycGIaRi3kprdP2tHrg>
	<xmx:wjjQXOmJLxbCY9HW49y7tij_GkRt82Hqeygs57OrvWwwKr4S4zylXw>
	<xmx:wjjQXKevH86QujIzakmOR5KwbGiTL-Rjv7lQdKwjd-XwlMEEDHfPCg>
	<xmx:wzjQXCPfSqlV2irUKVLnIpIpuKfRYPG92Av_vlKrLYkROgroX20fmQ>
Received: from [192.168.2.138] (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6FA621037C;
	Mon,  6 May 2019 09:38:09 -0400 (EDT)
To: Hongxu Jia <hongxu.jia@windriver.com>, meta-virtualization@yoctoproject.org
References: <20190506020001.48490-1-hongxu.jia@windriver.com>
From: Paul Barker <paul@betafive.co.uk>
Organization: Beta Five Ltd
Message-ID: <08f06729-33dc-4b3a-b129-fece6dc6afbb@betafive.co.uk>
Date: Mon, 6 May 2019 14:38:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190506020001.48490-1-hongxu.jia@windriver.com>
Cc: Jonas Bonn <jonas@norrbonn.se>, Alex Kiernan <alex.kiernan@gmail.com>
Subject: Re: [PATCH] cgroup-lite: remove incorrect SYSTEMD_AUTO_ENABLE setting
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
X-List-Received-Date: Mon, 06 May 2019 13:38:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 06/05/2019 03:00, Hongxu Jia wrote:
> Since commit [154abbc329 systemd: create preset files instead of
> installing in image] applied in oe-core, it checks SYSTEMD_AUTO_ENABLE
> ...
> |ERROR: cgroup-lite-1.15-r0 do_package: SYSTEMD_AUTO_ENABLE_cgroup-lite
> 'mask' is not 'enable' or 'disable'
> ...
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   recipes-containers/cgroup-lite/cgroup-lite_1.15.bb | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
> index 7b48c3a..cb16a65 100644
> --- a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
> +++ b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
> @@ -18,7 +18,6 @@ INITSCRIPT_PARAMS = "start 8 2 3 4 5 . stop 20 0 1 6 ."
>   # where systemd is in use.
>   SYSTEMD_PACKAGES = "${PN}"
>   SYSTEMD_SERVICE_${PN} = "cgroups-init.service"
> -SYSTEMD_AUTO_ENABLE_${PN} = "mask"

Looking at the commit message from when this was added 
(http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=5b13da8e575ac746b46426f2471bf004b2201e41), 
the intention is that the service is indeed masked.

Rather than breaking this behaviour I'd like to see if we can support 
this in oe-core.

Cc-ing Jonas and Alex on this one - is it simple to support 
`SYSTEMD_AUTO_ENABLE = "mask"` after the recent systemd changes in oe-core?

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

