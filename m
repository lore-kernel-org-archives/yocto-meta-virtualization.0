Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A35F1E013EF
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 04:59:11 -0800 (PST)
Received: by mail-qc0-f179.google.com with SMTP id b14so10900797qcs.10
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Jan 2013 04:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=P/RPCnTrfQIZA1RjiDxvgIYgdHGYP5ifw0B3vSYuJto=;
	b=ZflREsKA+FgHDrY0z82L6atomjn74FbqXz/iAVUSUnCrd0TAwVs1fIRxdPwr47TVj8
	mu7F9td5ftxfch+/ukZm8gzJy9vGH31lITDLAkeQj5tBCGTUKGJabo25hTcmKSrj0iDt
	qwVHFWFIA5Xq32+uS7jc65q1be08Cyt2+3tjXxwEtHI39eta7jtq3CFk56IyOOqZX++x
	yoQFm7nULHDShwe+m8cQ7I5Cim/AW5Qn1ceL+ZmC46JQ/8v5kktoCWcBUsER84oTi2Eh
	maheuE0rjg7Satj1s/UuPbDtlgwUQck/ecG0gB+QjXw3z/HLDDqiISH/F8pLJvDgpac0
	4WlQ==
X-Received: by 10.224.188.81 with SMTP id cz17mr39940186qab.74.1357477151044; 
	Sun, 06 Jan 2013 04:59:11 -0800 (PST)
Received: from [79.102.210.67] ([79.102.210.67])
	by mx.google.com with ESMTPS id z5sm14741150qer.8.2013.01.06.04.59.09
	(version=SSLv3 cipher=OTHER); Sun, 06 Jan 2013 04:59:10 -0800 (PST)
Message-ID: <50E9751B.6020808@gmail.com>
Date: Sun, 06 Jan 2013 13:59:07 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
	<50E830EF.6030102@gmail.com>
	<CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
	<50E83CC7.60608@enea.com>
	<CADkTA4Mx6EQGPb2c7qgjQ0eqQ0P4eFyxnTj38nB2gN=z5KY29Q@mail.gmail.com>
In-Reply-To: <CADkTA4Mx6EQGPb2c7qgjQ0eqQ0P4eFyxnTj38nB2gN=z5KY29Q@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Update the netcat with debian patches to fix some error
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
X-List-Received-Date: Sun, 06 Jan 2013 12:59:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/05/2013 07:44 PM, Bruce Ashfield wrote:
> On Sat, Jan 5, 2013 at 9:46 AM, David Nyström <david.nystrom@enea.com>wrote:
>
>>
>>
>> On 01/05/2013 03:26 PM, lei yang wrote:
>>
>>> On Sat, Jan 5, 2013 at 5:55 AM, David Nyström <david.c.nystrom@gmail.com>
>>> wrote:
>>>
>>>> On 01/05/2013 02:43 PM, lei.yang@windriver.com wrote:
>>>>
>>>>>
>>>>> From: Lei Yang <lei.yang@windriver.com>
>>>>>
> I think we should hold on this merge completely. netcat is already covered
> by meta-networking, so
> we should be consolidating patches and support there.
>
> If there are any specific meta-virt requirements for netcat, we should
> either use bbappends (and
> depend on meta-networking, or use the combo-layer tools to pull the support
> directly) or better yet
> get them merged into meta-networking.
>
> Cheers,
>
> Bruce
>

I'm totaly OK with this, as long as its accepted somewhere.
As Lei states though, we need to document the layer setup in README.

However, for future reference, I see no reason why new recipes can't end 
up in meta-virtualization first for a usable working setup, and when 
accepted upstream, they will be removed.
I suggest we use 
recipes-external/meta-<potential-upstream-here>/new-recipe-name/ until 
accepted elsewhere.

Br,
David
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


