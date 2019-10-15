Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B834E00D35; Tue, 15 Oct 2019 00:00:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1BAAE00782
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Oct 2019 00:00:32 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3DABC5C0376;
	Tue, 15 Oct 2019 09:00:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1571122830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=reuXLn44WS4iINYzec42u+KQ42nICwf6SM5flnYmeiY=;
	b=nvWrvjTw8A2kdj3en2Lqie2Gnkr12YcCyqb82p8XY8a7ZTNN+P3F5cNdlEUnZfzIjNf2QN
	qQ6aP5suL/s4Wp2rKXAI09nGz1sIKrVt4hOXz9XesfxMkgWQ00xAJ7SkT2VNxyxfitzSB5
	15l4IFlmXpUgAXn4BcnLtlDIoz7H4p8=
MIME-Version: 1.0
Date: Tue, 15 Oct 2019 09:00:30 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <20191015015641.GA48054@gmail.com>
References: <20191014205006.63611-1-stefan@agner.ch>
	<20191015015641.GA48054@gmail.com>
Message-ID: <82b6a110a0b1a8cc0c105b3b0745dd46@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] podman-compose: move into subdirectory
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
X-List-Received-Date: Tue, 15 Oct 2019 07:00:34 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-10-15 03:56, Bruce Ashfield wrote:
> In message: [meta-virtualization] [PATCH] podman-compose: move into subdirectory
> on 14/10/2019 Stefan Agner wrote:
> 
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> The layer does not expect recipes in the first subdir. Move the
>> podman-compose recipe into a podman-compose subdirectory.
> 
> oops. I should have noticed this one myself.

I tested the recipe, but did a last minute move, what can go wrong :-)

Thanks!

--
Stefan

> 
> merged.
> 
> Bruce
> 
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>>  recipes-containers/{ => podman-compose}/podman-compose_0.1.5.bb | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename recipes-containers/{ => podman-compose}/podman-compose_0.1.5.bb (100%)
>>
>> diff --git a/recipes-containers/podman-compose_0.1.5.bb b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
>> similarity index 100%
>> rename from recipes-containers/podman-compose_0.1.5.bb
>> rename to recipes-containers/podman-compose/podman-compose_0.1.5.bb
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

