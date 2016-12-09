Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 244E0E00C25; Thu,  8 Dec 2016 20:02:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6D4AE00BF3
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Dec 2016 20:02:26 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id a10so599244ywa.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Dec 2016 20:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Jss0G8CFdOxX7ASGM4EWmJmjIQ8xPe4K7LatC3g1F3o=;
	b=HW+i4EB9rv2yz45nWQuOxCni2UdHluShrWkKEDMo7+RbEQHkw/E2U3tTS1vlf4xrKZ
	FyCrzpxDY74iimg7FVOk953gydrn5cepVQhKn/9Znc9MGvqZApydwfzHvDPCvxNsQSYz
	ysnnxlLqgYvKUxqnZZ+uvm/JzDpzLb3nfhkXtYTg0qJJM2U4epAO/KG5fZLeXo60TRTP
	r8M8hJutgW+DXGH23reD+Z9kXexUbinriHz/O5RnKw/pKhCrYhLENJMl/BKQos1Yv3jS
	1aNcD2WAosXkTncm2dknmdGVVLVFcT5OT2tGAfKbzv47g8Zka378LhmfN7d4fEp8OLQd
	Iaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Jss0G8CFdOxX7ASGM4EWmJmjIQ8xPe4K7LatC3g1F3o=;
	b=JkdyZY+6rbQyNozi/QESIQZckc1Z6nPrAL2mhl1Rvoy/SGeyUadfTFE55bmv6aLTuu
	buLfcppyG8WvfPU0NvTvTg3Eo2DZnUIYNFHURpB3VwVdgTezzoddwfNufdEODp/uQk8p
	19edoyb3TmpOF5/8t8P1a4sld2D9MphE9+/ujDhjI7VwhkfPnCj1N7UHFbQz2o/jSg7K
	jZRV0FAcms60rvX5N0D1X1Us94BMeCvqtUTwcHlMATmjUovVqppPxAcdgeX80CuEZNZa
	4aN/i+wwk0CcQhxnQu7zGHRaiPXN/f6YdUschyaZ94e4z6xIrDCrBDK2pOfhHLSWRT2z
	Pn1Q==
X-Gm-Message-State: AKaTC01b1XHDqT0f6Nnc9UdICFE+wWGuZRTDrYo/v4vAzcfMQjzdd0iuDp6jj7GSmGZccJH1etQN7VS98Ktwiw==
X-Received: by 10.129.43.215 with SMTP id r206mr70606093ywr.274.1481256145524; 
	Thu, 08 Dec 2016 20:02:25 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Thu, 8 Dec 2016 20:02:25 -0800 (PST)
In-Reply-To: <40BA76AD6F30624D8838040F50FAE7093A9ACECB@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
References: <40BA76AD6F30624D8838040F50FAE7093A9ACE96@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
	<40BA76AD6F30624D8838040F50FAE7093A9ACECB@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Thu, 8 Dec 2016 23:02:25 -0500
X-Google-Sender-Auth: 9q8EzWfVSxZ98LwXR8p0JtAPLzc
Message-ID: <CAPuovEKkLPPas5SKExJzkkapNeZpv9P4QM+htW92aLO2A1aSAw@mail.gmail.com>
To: Manikandan E <manikandan.e@hcl.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: FW: docker build issues meta-virtualization (Krogoth)
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
X-List-Received-Date: Fri, 09 Dec 2016 04:02:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 7, 2016 at 6:34 AM, Manikandan E <manikandan.e@hcl.com> wrote:
> Hi All,
>
>   We are trying to compile docker with core-image minimal image on Krogoth
> version and facing the below issues when compiling go-native package.
>
> Log:
> -------------------
> | DEBUG: Executing shell function do_compile
> | # Building C bootstrap tool.
> | cmd/dist
> | go tool dist: unknown $GOOS ${BUILD_GOOS}
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /media/csp/HMI/zcu_morty/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_compile.16340)
>

Can you provide details about your build host OS?

Mark


>
>
> Kindly provide your suggestion.
>
>
> Regards
> Manikandan
>
>
>
> ::DISCLAIMER::
> ----------------------------------------------------------------------------------------------------------------------------------------------------
>
> The contents of this e-mail and any attachment(s) are confidential and
> intended for the named recipient(s) only.
> E-mail transmission is not guaranteed to be secure or error-free as
> information could be intercepted, corrupted,
> lost, destroyed, arrive late or incomplete, or may contain viruses in
> transmission. The e mail and its contents
> (with or without referred errors) shall therefore not attach any liability
> on the originator or HCL or its affiliates.
> Views or opinions, if any, presented in this email are solely those of the
> author and may not necessarily reflect the
> views or opinions of HCL or its affiliates. Any form of reproduction,
> dissemination, copying, disclosure, modification,
> distribution and / or publication of this message without the prior written
> consent of authorized representative of
> HCL is strictly prohibited. If you have received this email in error please
> delete it and notify the sender immediately.
> Before opening any email and/or attachments, please check them for viruses
> and other defects.
>
> ----------------------------------------------------------------------------------------------------------------------------------------------------
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

