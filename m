Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6071AE00CBC; Tue, 13 Dec 2016 07:23:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13007E00C75
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Dec 2016 07:23:04 -0800 (PST)
Received: by mail-yb0-f196.google.com with SMTP id h184so1969303ybb.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Dec 2016 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Vc5oOmyi4arsUc95PqluN6qx3/RjJXLxch0GDS+cPIY=;
	b=uVhcGq7JCZ9Ubce6c8UHRu+VmejTrYLHNUnEAHQQpt3Wpg1RLXH2xQeQ/dtepP/kR5
	5Z4lIs7zh4ZmemM9ysEwLsNc3uUUCsjr2oPKRbiWu/R5yqOZUj7jKZRNaVB3VmcLdYP3
	5biPQIrfeecWLT3IRD2QO80+h4iigVeCNYA9VtO4rwqIw/3V5N1ip0W3eelThUd4+Tso
	BzyTwBewQsUl2sBVzYYtGiGx/JnETppGSP4TaXDLZvKSIJLFaId/t21kbA4276nuFxm2
	XgH6BaMnMtVrC33yaKT/BW2/swLqalrxJjtK3mOBQf5IjVgYvzz06yyyqlSNgEuQkkps
	2szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Vc5oOmyi4arsUc95PqluN6qx3/RjJXLxch0GDS+cPIY=;
	b=RHVqZADslMzluhitwFqyA9Lr2ITAQTsXVmSeV17csGp6bZfBMCltRK1x4hjD4Q4iQO
	16VtvmePtJlacYUZq2dmcitA5gA/zQM9+4LGkNwlBaJi1Pv3h7E9E3uNuoWw8GyBrZ7C
	FPu3Zyg1G0y0JjixacDoxAoKJWM6CyKHGjNL7Tm+e19oiZAnvIDOiiUQG+Id5zC4ABYS
	S9WGsKS34c23F2uJE7U47+bKTz9MXDicP58CHtz1vY/u34LxXijJQSHFrvfjvV47FbJQ
	COaDGC+h2/hqSXRc1NO1jzRkj4nl+0Fk0gTHgX8osHqXFGad99L+ncSCHcSFLLHkp1Cf
	P1Nw==
X-Gm-Message-State: AKaTC02x/weDGHvt57j9ZOaMPVkwfXCtAEi2fdBVrPW0Rm296p3E9ZyAf3HJHm9G6vemTCiv09Vg4Y0R0ly3Ew==
X-Received: by 10.37.177.138 with SMTP id h10mr4953162ybj.115.1481642583932;
	Tue, 13 Dec 2016 07:23:03 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Tue, 13 Dec 2016 07:23:03 -0800 (PST)
In-Reply-To: <40BA76AD6F30624D8838040F50FAE7093A9AE1B4@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
References: <40BA76AD6F30624D8838040F50FAE7093A9ACE96@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
	<40BA76AD6F30624D8838040F50FAE7093A9ACECB@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
	<CAPuovEKkLPPas5SKExJzkkapNeZpv9P4QM+htW92aLO2A1aSAw@mail.gmail.com>
	<40BA76AD6F30624D8838040F50FAE7093A9AE1B4@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Tue, 13 Dec 2016 10:23:03 -0500
X-Google-Sender-Auth: k2eHNAh30NKWbGBPpbU56Ufpz9A
Message-ID: <CAPuovEKGTCJi7O_JEA4cxPZ7CWrUAx5gtVgKRLN3OK2vAKiA7w@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Dec 2016 15:23:08 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 9, 2016 at 2:18 AM, Manikandan E <manikandan.e@hcl.com> wrote:
> Hi ,
>
>
>
>
>                HostOS           : Ubuntu 14.04(X86_64)
>                Target             : Xilinx zynqmp(aarch64)
>                yocto version  :  Krogoth
>


Thanks,

I will try to carve out some time to look into this and provide you
with some suggestions.

Mark

>
>
>
> Regards
> Manikandan
> ________________________________________
> From: asselsm@gmail.com [asselsm@gmail.com] on behalf of M. Asselstine [asselsm@mcmaster.ca]
> Sent: Friday, December 09, 2016 9:32 AM
> To: Manikandan E
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] FW: docker build issues meta-virtualization (Krogoth)
>
> On Wed, Dec 7, 2016 at 6:34 AM, Manikandan E <manikandan.e@hcl.com> wrote:
>> Hi All,
>>
>>   We are trying to compile docker with core-image minimal image on Krogoth
>> version and facing the below issues when compiling go-native package.
>>
>> Log:
>> -------------------
>> | DEBUG: Executing shell function do_compile
>> | # Building C bootstrap tool.
>> | cmd/dist
>> | go tool dist: unknown $GOOS ${BUILD_GOOS}
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_compile (log file is located at
>> /media/csp/HMI/zcu_morty/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_compile.16340)
>>
>
> Can you provide details about your build host OS?
>
> Mark
>
>
>>
>>
>> Kindly provide your suggestion.
>>
>>
>> Regards
>> Manikandan
>>
>>
>>
>> ::DISCLAIMER::
>> ----------------------------------------------------------------------------------------------------------------------------------------------------
>>
>> The contents of this e-mail and any attachment(s) are confidential and
>> intended for the named recipient(s) only.
>> E-mail transmission is not guaranteed to be secure or error-free as
>> information could be intercepted, corrupted,
>> lost, destroyed, arrive late or incomplete, or may contain viruses in
>> transmission. The e mail and its contents
>> (with or without referred errors) shall therefore not attach any liability
>> on the originator or HCL or its affiliates.
>> Views or opinions, if any, presented in this email are solely those of the
>> author and may not necessarily reflect the
>> views or opinions of HCL or its affiliates. Any form of reproduction,
>> dissemination, copying, disclosure, modification,
>> distribution and / or publication of this message without the prior written
>> consent of authorized representative of
>> HCL is strictly prohibited. If you have received this email in error please
>> delete it and notify the sender immediately.
>> Before opening any email and/or attachments, please check them for viruses
>> and other defects.
>>
>> ----------------------------------------------------------------------------------------------------------------------------------------------------
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>

