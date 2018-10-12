Return-Path: <okaya@kernel.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A82FE00B92; Fri, 12 Oct 2018 12:31:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.145.29.99 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F230E00B6C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 12:31:27 -0700 (PDT)
Received: from [10.80.45.152] (unknown [71.69.156.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CB2E52087D;
	Fri, 12 Oct 2018 19:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1539372687;
	bh=tiFGcFvIb+ViJHM9Kh2QKFyx56mJOxZAhrCblvoQ6XM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=RloyqMvBk6WpeACPAiseQkrv1OIPA1eS9bNmd8Gb5pK9DaOuYy96I1fVODKn1vpYB
	45HbcPdq1tPVP7wRNIkooQ63WS5okn1cOIzNgbedLvrvf7BkQOlOwzjF2hnFw0Ezox
	QW9bNbhtJyG/RXdp8xV5n4rUT4iCcJ8K/Csepf5w=
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20181012165625.23124-1-okaya@kernel.org>
	<CADkTA4Ozm6yAW1KgS3-StuzSBj0_R5w9MS4zeOxDUGV2O6kj4Q@mail.gmail.com>
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <57a6e60b-6984-1227-0685-33485014f5db@kernel.org>
Date: Fri, 12 Oct 2018 15:31:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4Ozm6yAW1KgS3-StuzSBj0_R5w9MS4zeOxDUGV2O6kj4Q@mail.gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [sumo] [PATCH v1] lxc: make error report compatible with ptest
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
X-List-Received-Date: Fri, 12 Oct 2018 19:31:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/12/2018 3:21 PM, Bruce Ashfield wrote:
> This is something that should go into master, not the -stable branches.
> 
> We could do a backport if really required, but it does need to merge
> to master first.
> 
> I assume it does also apply to master, but I'd like to hear your confirmation.
> 

Yes, it applies to both. I tested it.

> Bruce


