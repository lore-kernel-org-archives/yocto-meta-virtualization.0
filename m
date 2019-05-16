Return-Path: <akuster808@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E701E00BAA; Thu, 16 May 2019 14:42:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (akuster808[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.215.181 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 663DCE008F2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2019 14:42:38 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id z3so2189924pgp.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2019 14:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=rg/4GUv9cOpnEdB32cxDc6qdn0LudIzIWdHWRMRVcE0=;
	b=Lf6+U+kfQWUK3OlJ6+/+6B43SHsQuH9Z5ASrlYohIF6mLzqY9p4fQ7UGWSX7g95IeW
	ZtMxPYfOIjlXgqZO5Se7l7aKXDeV7/CvQlujS9i9E3JtCR6j42k8AcOMAyGmw6VmVmpn
	PmGstbPAKRJZqk4aaJkUh3NBB/jWfPpmyxtbOuHcSclPUWjj7OObbJWRh6Wec8rjftoF
	5ib1HeEUpHwf/Td0D5dNIEkluf0QwS0S7LtCaFDoLO7J+J35aG5mcZzSlwVi0aOJSDl/
	Zj866UFJVaNj01OEraxBh9gH5zGpuTusFj/UMiNGdup6JrwfAubNUieQarXrVoFtVYTy
	ZpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=rg/4GUv9cOpnEdB32cxDc6qdn0LudIzIWdHWRMRVcE0=;
	b=FVzg81sO2MgnFxgQgQvqqpjQxhDUHy0emq35CZ+bNSL2eUH6lCK/N5Q/VwVF8WyGL5
	1OP0M/wXQb3PixqYjGEVW7Lyzial5cnoJeuT68cdXvVggJ7PF15EsRSBT/ztm+fGkjNQ
	vcadYuDuOP7dJd0B8kiwyzxqVElUMheeA7uMMljMmfr60RtkdUmYGhLI4v2Y0YWrVSIg
	+nqluoeV02Jui4jTluR8E3XWOqyv7E3swl/JTYZBdXF2UGk0iuI10xzpPuu9cY57/48K
	UZPZ1hWgJ7g7dAkaATEDLQO4hMKrgs1aHRuJsvrD6vB3HyKK/FYP6qRfKrJX3NiwWzql
	C1Qw==
X-Gm-Message-State: APjAAAVUGMmZl8K8IuGQn5ESnEfebw5mPpamlHO9qXwQ5xDRDz0U3570
	pZBUN5y9ZWUMtWvuJwfbt/z3FQKC
X-Google-Smtp-Source: APXvYqxgbGL+TBOn/U5WjUZ+DWELHaojEgZVLzqp3dyEmp/4hdYEfjrsvVr0prKqlTTyIJpXbsp/1Q==
X-Received: by 2002:a63:c64c:: with SMTP id x12mr52582579pgg.379.1558042957325;
	Thu, 16 May 2019 14:42:37 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:95b6:a51b:ec63:2621?
	([2601:202:4180:c33:95b6:a51b:ec63:2621])
	by smtp.gmail.com with ESMTPSA id
	c76sm15054403pfc.43.2019.05.16.14.42.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 14:42:36 -0700 (PDT)
To: Mark Hatle <mark.hatle@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <29749ef2-06ce-3665-d47f-cee4048653b1@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <40d6069c-5195-58a7-1b27-28cb3500dac5@gmail.com>
Date: Thu, 16 May 2019 14:42:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <29749ef2-06ce-3665-d47f-cee4048653b1@windriver.com>
Subject: Re: conf/layer.conf is broken
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
X-List-Received-Date: Thu, 16 May 2019 21:42:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Mark,


On 5/15/19 11:27 AM, Mark Hatle wrote:
> A recent commit:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/conf/layer.conf?id=032ef5310419563a01baad0b1b94e4587d12f777
>
> refactor for YP Compat for PV changes
> Only include our versions of recipes if virtualiztions is in
> DISTRO_FEATURE
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
>
>
> Is not working the way that it looks like it should, specifically there are two
> issues:
>
> require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> 'meta-virt-default-versions.inc', '', d)}
>
> First issue is that the 'meta-virt-default-version.inc' file isn't in the same
> path as the layer.conf, so it really should be
> "conf/distro/include/meta-virt-default-version.inc"...  but you may be wondering
> why nobody has complained about this.
>
> The 'DISTRO_FEATURES' will -never- contain 'virtualization' unless the user
> calls this from within the toaster or uses bitbake -r <config> to build their
> system.  The problem is that 'requires' are evaluated IMMEDIATELY, and
> DISTRO_FEATURES is not set in the layer.conf path.  It's set later via
> distributions and such by the eventual load of the bitbake.conf file(s).
>
> So there is a trick to be able to do this.  You need to find a way to 'late'
> load these files, AFTER bitbake.conf is loaded.  We had to do exactly this from
> within the meta-overc/meta-cube layer:
>
> https://github.com/WindRiver-OpenSourceLabs/meta-overc/blob/wr-10.19-20190121/meta-cube/conf/layer.conf
>
> You will see at the end that a variable is set to the config file to load, and
> that the USER_CLASSES is appended with something that (CAN) check the
> distro_features -- because it's resolved 'later'.  Then the class simply does a
> require bringing in the configuration itself:
>
> https://github.com/WindRiver-OpenSourceLabs/meta-overc/blob/wr-10.19-20190121/meta-cube/classes/cube-cfg.bbclass
>
>
> meta-virtualization SHOULD be able to follow the same approach to be able to
> make these adjustments without breaking any of the Yocto Project compatible
> guidelines.  (Unfortunately I don't have time to work on that myself right now,
> but hopefully someone else can step in and fix this.)

Thanks for the explanations. I will see if I can work on a patch.

safe travels,
armin
> --Mark


